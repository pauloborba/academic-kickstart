// 
// atualizar infra

// olhar posts, deixar com o minimo de info do site original
// criar repositorio e projeto independente para os scripts
// ajustar programas
// revisar arquivo principal de configuracao, e documentacao

// tratamento de erro: pdf inexistente, artigo json inexistente ou quebrado, nome de diretorio existente (devido a artigo com mesmo titulo), etc.

// receber como parametros entradas e diretorios de reusabilidade
// criar projeto independente
// tratamento de erros, melhorar a robustez
// tratamento alternativo para mais de dois arquivos com o mesmo nome
// documentar interfaces, principalmente as do json de entradas
// adicionar detalhes ao bib de journals (volume e número)
// só criar novos diretórios correspondente ao dif em relação ao último JSON
// refatorar!

import * as fs from "fs"; // https://nodejs.org/dist/latest-v10.x/docs/api/fs.html#fs_file_system

const articlesFilePath = '../../files/curriculoAtual.json';
const articlesFileContents = fs.readFileSync(articlesFilePath,'utf8');
const articles = JSON.parse(articlesFileContents);

// Para cada entrada de artigo no arquivo JSON, cria um diretório com os arquivos necessários (template do Hugo para visualização de artigo, pdf, bib, poster, etc.) para visualização daquele artigo no site do professor  
for (let article of articles) {
  let directory = createPublicationDirectory(article);
  addFilesToDirectory(directory, article);
}

// As hugo removes question marks from generated directories, we have to remove here too, otherwise link to article PDF will break
function createPublicationDirectory(article) {
  const title = article.title;
  const year = article.year;
  const titleWithoutSpaces = title.replace(/ /gi,'_');
  const titleWithoutQuestionMarks = titleWithoutSpaces.replace(/\?/gi,'_');
  const titleWithoutColon = titleWithoutQuestionMarks.replace(/\:/gi,'_');
  const titleWithoutAccents = removeAccents(titleWithoutColon);
  let directoryName = year.concat(titleWithoutAccents.toLowerCase());
  if (fs.existsSync(directoryName)) {
    directoryName = directoryName + "_double_entry"
  }
  fs.mkdirSync(directoryName);
  return directoryName;
}

function removeAccents(str: string): string {
  return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
}

function addFilesToDirectory(directory, article) {
  // Carrega template do Hugo para artigos
  let indexTemplate = fs.readFileSync('../resources/templates/index.md', 'utf8');
  const title = JSON.stringify(article.title);
  const authors = JSON.stringify(article.authors);

  // Carrega template do .bib de acordo com o tipo de artigo
  let bibTemplate = "";
  let publication = "";
  let publicationTypes = "";
  if (article.conference) {
     publication = JSON.stringify(article.conference);
     publicationTypes = "[\"1\"]";
     bibTemplate = fs.readFileSync('../resources/templates/conference.bib', 'utf8');
  } else if (article.journal) {
     publication = JSON.stringify(article.journal);
     publicationTypes = "[\"2\"]";
     bibTemplate = fs.readFileSync('../resources/templates/journal.bib', 'utf8');
  }

  // Traduz informações do JSON para preencher os templates
  let abstract = "\"\"";
  if (article.abstract) {
    abstract = JSON.stringify(article.abstract);
  }

  let selected = "false";
  if (article.selected) {
    selected = JSON.stringify(article.selected);
  }

  // Traduz informação sobre o nome do arquivo para gerar link no template hugo do artigo, e copia o arquivo pdf do artigo para o diretório do artigo
  let pdf = "\"\"";
  if (article.pdf) {
    pdf = JSON.stringify("publication/" + directory + "/" + article.pdf);
    const source = '../resources/pdffiles/' + article.pdf;
    const destination = directory + '/' + article.pdf;
    fs.copyFileSync(source, destination);
  }

  let image = "";
  if (article.image) {
    image = JSON.stringify("publication/" + directory + "/" + article.image);
    const source = '../resources/images/' + article.image;
    const expression = /(?:\.([^.]+))?$/;
    const fileNameSuffix = expression.exec(article.image)[1];
    const destination = directory + '/featured.' + fileNameSuffix;
    fs.copyFileSync(source, destination);
  }

  let caption = "\"\"";
  if (article.caption) {
    caption = JSON.stringify(article.caption);
  }

  let projects = "[]";
  if (article.projects) {
    projects = JSON.stringify(article.projects);
  }

  let slides = "\"\"";
  if (article.slides) {
    slides = JSON.stringify("publication/" + directory + "/" + article.slides);
    const source = '../resources/pdffiles/' + article.slides;
    const destination = directory + '/' + article.slides;
    fs.copyFileSync(source, destination);
  }

  let poster = "\"\"";
  if (article.poster) {
    poster = JSON.stringify("publication/" + directory + "/" + article.poster);
    const source = '../resources/pdffiles/' + article.poster;
    const destination = directory + '/' + article.poster;
    fs.copyFileSync(source, destination);
  }

  let doi = "\"\"";
  if (article.doi) {
    doi = JSON.stringify(article.doi);
  }

  let replicationPackage = "\"\"";
  let replicationPackageMarker = "\#";
  if (article.replicationpackage) {
    replicationPackage = JSON.stringify(article.replicationpackage);
    replicationPackageMarker = "";
  }

  let video = "\"\"";
  if (article.video) {
    video = JSON.stringify(article.video);
  }

  let year = "XXXX";
  if (article.year) {
    year = article.year;
  }

  let pages = "?-?";
  if (article.pages) {
    pages = article.pages;
  }

  // Preenche templates com informações processadas do JSON
  indexTemplate = indexTemplate.replace(/\$TITLE/gi, title).
                    replace(/\$AUTHORS/gi, authors).
                    replace(/\$PUBLICATION/gi, publication).
                    replace(/\$PUBLICATTYPES/gi, publicationTypes).
                    replace(/\$ABSTRACT/gi, abstract).
                    replace(/\$SELECTED/gi, selected).
                    replace(/\$PDF/gi, pdf).
                    replace(/\$CAPTION/gi, caption).
                    replace(/\$PROJECTS/gi, projects).
                    replace(/\$SLIDES/gi, slides).
                    replace(/\$POSTER/gi, poster).
                    replace(/\$VIDEO/gi, video).
                    replace(/\$PACKAGE/gi, replicationPackage).
                    replace(/\$RPMARKER/gi, replicationPackageMarker).
                    replace(/\$DOI/gi, doi).
                    replace(/\$YEAR/gi, year);

  let authorsInBibFormat = article.authors.reduce(function (a,b) {
                              return a + ' and ' + b;});

  bibTemplate = bibTemplate.replace(/\$TITLE/gi, title).
                    replace(/\$AUTHORS/gi, authorsInBibFormat).
                    replace(/\$PUBLICATION/gi, publication).
                    replace(/\$YEAR/gi, year).
                    replace(/\$PAGES/gi, pages);

  let indexFile = fs.openSync(directory + '/' + 'index.md', 'ax');
  fs.writeSync(indexFile, indexTemplate);
  fs.closeSync(indexFile);

  let bibFile = fs.openSync(directory + '/' + 'cite.bib', 'ax');
  fs.writeSync(bibFile, bibTemplate);
  fs.closeSync(bibFile);
}
