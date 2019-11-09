"use strict";
exports.__esModule = true;
var fs = require("fs");
var deepEqual = require("deep-equal");
var oldFilePath = process.argv[2];
var newFilePath = process.argv[3];
var mergedFilePath = process.argv[4];
if ((oldFilePath == null) || (newFilePath == null) || (mergedFilePath == null)) {
    console.log("\n===> Please provide proper arguments when calling this program: node jsonMerge oldfilename newfilename outputfilename\n");
    process.exit(-1);
}
var oldArticles = readJSONFile(oldFilePath, "oldfile");
var newArticles = readJSONFile(newFilePath, "newfile");
var addedItems = [];
var mergedItems = [];
var unchangedItems = [];
var deletedItems = oldArticles.slice();
for (var _i = 0, newArticles_1 = newArticles; _i < newArticles_1.length; _i++) {
    var newArticle = newArticles_1[_i];
    var oldArticle = findArticleWithSameKeys(oldArticles, newArticle);
    if (oldArticle != null) {
        deletedItems = removeFrom(oldArticle, deletedItems);
        if (deepEqual(newArticle, oldArticle)) {
            unchangedItems.push(newArticle);
        }
        else {
            mergedItems.push(mergeArticles(newArticle, oldArticle));
        }
    }
    else {
        addedItems.push(newArticle);
    }
}
var resultingArticles = addedItems.concat(mergedItems).concat(unchangedItems);
writeToFile(resultingArticles);
console.log("\n===> " + oldArticles.length + " articles in old file");
console.log("\n===> " + newArticles.length + " articles in new file");
console.log("\n===> " + resultingArticles.length + " articles in the resulting file\n");
console.log("\n===> " + addedItems.length + " added items (in new but not in old):\n " + JSON.stringify(addedItems, null, "  "));
console.log("\n===> " + mergedItems.length + " merged items:\n " + JSON.stringify(mergedItems, null, "  "));
console.log("\n===> " + deletedItems.length + " deleted items (in old but not in new):\n " + JSON.stringify(deletedItems, null, "  "));
console.log("\n===> " + unchangedItems.length + " unchanged items:\n " + JSON.stringify(unchangedItems, null, "  "));
function writeToFile(resultingArticles) {
    var mergedFile;
    try {
        mergedFile = fs.openSync(mergedFilePath, 'ax');
    }
    catch (error) {
        console.log("\n===> File " + mergedFilePath + " already exists! Will not override it.\nPlease invoke the program with a fresh file path.\n");
        console.log("\t" + error.message + "\n");
    }
    try {
        fs.writeSync(mergedFile, JSON.stringify(resultingArticles, null, 3));
        fs.closeSync(mergedFile);
    }
    catch (error) {
        console.log("\n===> Could not write to file " + mergedFilePath + ".\n");
        console.log("\t" + error.message + "\n");
    }
}
function removeFrom(oldarticle, deletedItems) {
    deletedItems = deletedItems.filter(function (e) { return !deepEqual(e, oldarticle); });
    return deletedItems;
}
function articlesHaveSameKeys(newarticle, oldarticle) {
    return (newarticle.conference == oldarticle.conference)
        && (newarticle.journal == oldarticle.journal)
        && (newarticle.title == oldarticle.title);
}
function findArticleWithSameKeys(articles, article) {
    for (var _i = 0, articles_1 = articles; _i < articles_1.length; _i++) {
        var a = articles_1[_i];
        if (articlesHaveSameKeys(a, article)) {
            return a;
        }
    }
    return null;
}
function mergeArticles(newarticle, oldarticle) {
    var result = {};
    result = addAttributesWithOverriding(newarticle, oldarticle, result);
    result = addExclusiveAttributes(oldarticle, newarticle, result);
    return result;
}
function addAttributesWithOverriding(newarticle, oldarticle, result) {
    for (var key in newarticle) {
        if ((!(key in oldarticle)) || (deepEqual(oldarticle[key], newarticle[key]))) {
            result[key] = newarticle[key];
        }
        else {
            result[key] = reportConflict(oldarticle[key], newarticle[key]);
            console.log("\n===> Conflict in \"" + newarticle.title + "\", key \"" + key
                + "\",\n"
                + ("<<< old\n\t " + formatObject(oldarticle[key]) + "\n===\n\t " + formatObject(newarticle[key]) + "\n>>> new\n"));
        }
    }
    return result;
}
function reportConflict(oldInfo, newInfo) {
    if (typeof oldInfo == "string") {
        return oldInfo + ' <<< old === new >>> ' + newInfo;
    }
    else if (oldInfo instanceof Array) {
        return oldInfo.concat(['<<< old === new >>>']).concat(newInfo);
    }
    else {
        return JSON.stringify(oldInfo) + '<<< old === new >>>' + JSON.stringify(newInfo);
    }
}
function formatObject(object) {
    if (typeof object == "string") {
        return "\"" + object + "\"";
    }
    else if (object instanceof Array) {
        var result = "[";
        for (var _i = 0, object_1 = object; _i < object_1.length; _i++) {
            var element = object_1[_i];
            result = result + ("\"" + element + "\",");
        }
        result = result.substring(0, result.length - 1) + "]";
        return result;
    }
    else {
        return object;
    }
}
function addExclusiveAttributes(oldarticle, newarticle, result) {
    for (var key in oldarticle) {
        if (!(key in newarticle)) {
            result[key] = oldarticle[key];
        }
    }
    return result;
}
function readJSONFile(filePath, fileCategory) {
    var articlesFileContents = "";
    var articles = [];
    try {
        articlesFileContents = fs.readFileSync(filePath, 'utf8');
        articles = JSON.parse(articlesFileContents);
    }
    catch (error) {
        console.log("\n===> The provided " + fileCategory + " " + filePath + " doesn't exist or is not in JSON format.");
        console.log("\t" + error.message + "\n");
        process.exit(-1);
    }
    return articles;
}
