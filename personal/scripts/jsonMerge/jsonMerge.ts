import * as fs from "fs"; // https://nodejs.org/dist/latest-v10.x/docs/api/fs.html#fs_file_system
import * as deepEqual from "deep-equal";

// usage: node jsonMerge oldfilename newfilename outputfilename
// compilation: tsc
// instalation: npm install

/* 
   updates objects in new with information (attributes) stored in old's objects.

   gets all objects from new (newfilename), 
   discards objects from old (oldfilename) not in new (keys are not in new),
   takes the union of the attributes in the objects in old and new (that have the same key),
   and reports conflicts for attributes that are in both old and new with different values (for objects with the same key).
   stores resulting objects in outputfilename.
 */  

/* 
   can be actually used in more general scenarios, but the main motivation 
   is for the scenario in which new is a JSON file derived from a new XML Lattes file, 
   and old is a JSON file derived from an old XML Lattes file that was   
   manually edited to contain extra article information (PDF, replication package, etc.) 
   not available in Lattes. 
*/

/*
   TODO: 
         - add writing on log file, instead of standard io, as a configuration option
         - add .gitignore
         - adicionar comando para compilar e rodar
         - adicionar testes automatizados
         - add type information
         - improve legibility by renaming
*/ 

const oldFilePath = process.argv[2];
const newFilePath = process.argv[3];
const mergedFilePath = process.argv[4];
if ((oldFilePath == null) || (newFilePath == null) || (mergedFilePath == null)) {
  console.log("\n===> Please provide proper arguments when calling this program: node jsonMerge oldfilename newfilename outputfilename\n");
  process.exit(-1);
}

let oldArticles = readJSONFile(oldFilePath,"oldfile");
let newArticles = readJSONFile(newFilePath,"newfile");

let addedItems = [];
let mergedItems = [];
let unchangedItems = [];
let deletedItems = [...oldArticles]; //spread operator, creates new array from existing array

for (let newArticle of newArticles) {
  let oldArticle = findArticleWithSameKeys(oldArticles,newArticle); 
  if (oldArticle != null) {
    deletedItems = removeFrom(oldArticle,deletedItems);
    if (deepEqual(newArticle,oldArticle)) {
      unchangedItems.push(newArticle);
    } else {
      mergedItems.push(mergeArticles(newArticle,oldArticle)); 
    } 
  } else {
    addedItems.push(newArticle);
  }
}
   
let resultingArticles = addedItems.concat(mergedItems).concat(unchangedItems);
writeToFile(resultingArticles);

console.log(`\n===> ${ oldArticles.length } articles in old file`);
console.log(`\n===> ${ newArticles.length } articles in new file`);
console.log(`\n===> ${ resultingArticles.length } articles in the resulting file\n`);
console.log(`\n===> ${ addedItems.length } added items (in new but not in old):\n ` + JSON.stringify(addedItems,null,"  "));
console.log(`\n===> ${ mergedItems.length } merged items:\n ` + JSON.stringify(mergedItems,null,"  "));
console.log(`\n===> ${ deletedItems.length } deleted items (in old but not in new):\n ` + JSON.stringify(deletedItems,null,"  "));
console.log(`\n===> ${ unchangedItems.length } unchanged items:\n ` + JSON.stringify(unchangedItems,null,"  "));

function writeToFile(resultingArticles) {
  let mergedFile;
  try {
    mergedFile = fs.openSync(mergedFilePath, 'ax');
  } catch (error) {
    console.log(`\n===> File ${ mergedFilePath } already exists! Will not override it.\nPlease invoke the program with a fresh file path.\n`);
    console.log("\t" + error.message + "\n");
  }
  try {
    fs.writeSync(mergedFile, JSON.stringify(resultingArticles,null,3));
    fs.closeSync(mergedFile);
  } catch (error) {
    console.log(`\n===> Could not write to file ${ mergedFilePath }.\n`);
    console.log("\t" + error.message + "\n");
  }
}  

function removeFrom(oldarticle,deletedItems) {
  deletedItems = deletedItems.filter((e) => { return !deepEqual(e,oldarticle); });
  return deletedItems;
}

function articlesHaveSameKeys(newarticle, oldarticle) {
  return     (newarticle.conference == oldarticle.conference)
          && (newarticle.journal == oldarticle.journal)
          && (newarticle.title == oldarticle.title);
}

function findArticleWithSameKeys(articles,article) {
    for (let a of articles) {
      if (articlesHaveSameKeys(a,article)) {
        return a;
      }
    }  
    return null;
}

function mergeArticles(newarticle, oldarticle) {
  let result = <any>{};
  result = addAttributesWithOverriding(newarticle,oldarticle,result); 
  result = addExclusiveAttributes(oldarticle,newarticle,result);
  return result;
}

/* Adds to the result the attributes in newarticle, reporting a conflict in case they exist and differ in oldarticle.
*/
function addAttributesWithOverriding(newarticle,oldarticle,result) {
  for (let key in newarticle) {
    if ((!(key in oldarticle)) || (deepEqual(oldarticle[key],newarticle[key]))) {
      result[key] = newarticle[key];
    } else {
      result[key] = reportConflict(oldarticle[key],newarticle[key]);
      console.log("\n===> Conflict in \"" + newarticle.title + "\", key \"" + key
                  + "\",\n" 
                  + `<<< old\n\t ${formatObject(oldarticle[key])}\n===\n\t ${formatObject(newarticle[key])}\n>>> new\n`);
    }
  }
  return result;
}

function reportConflict(oldInfo, newInfo) {
  if (typeof oldInfo == "string") {
    return oldInfo + ' <<< old === new >>> ' + newInfo;
  } else if (oldInfo instanceof Array) {
    return (oldInfo as string[]).concat(['<<< old === new >>>']).concat(newInfo as string[]);
  } else {
    return JSON.stringify(oldInfo) + '<<< old === new >>>' + JSON.stringify(newInfo);
  }
}

function formatObject(object) {
  if (typeof object == "string") {
    return `\"${object}\"`;
  } else if (object instanceof Array) {
    let result = "[";
    for (let element of object) {
      result = result + `\"${element}\",`;
    }
    result = result.substring(0,result.length-1) + "]";
    return result;
  } else {
    return object;
  }
}

// Adds to the result attributes that are exclusively in oldarticle (w.r.t. newarticle)
function addExclusiveAttributes(oldarticle,newarticle,result) {
  for (let key in oldarticle) {
    if (! (key in newarticle)) {
      result[key] = oldarticle[key];
    }
  }  
  return result;
}

function readJSONFile(filePath, fileCategory) {
  let articlesFileContents = "";
  let articles = [];
  try {
    articlesFileContents = fs.readFileSync(filePath,'utf8');
    articles = JSON.parse(articlesFileContents);
  } catch (error) {
    console.log("\n===> The provided " + fileCategory + " " + filePath + " doesn't exist or is not in JSON format.");
    console.log("\t" + error.message  + "\n");
    process.exit(-1);
  }  
  return articles;
}