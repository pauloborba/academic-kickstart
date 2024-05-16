$KCODE = "UTF8" if RUBY_VERSION < '1.9.0' #encoding type do arquivo: utf-8 without boom
require 'jcode' if RUBY_VERSION < '1.9.0'
require 'rexml/document'


# TODO
# - clean code so that the focus is XML to JSON translation, not generating CV
# - more general solution to journal names
# - refactor
# - tornar mais robusto

# Copyright by Paulo Borba, 2008-2011
#
# Known issues: Access to subelements with // only works
#				for immediate subelement.
#
#       Since the generated file is encoded as UTF8, the proper LaTeX packages
#       should be used for compilation.
#
#				Info about courses and administrative tasks are
#				not extracted yet.
#
#       alms:  itemizes vazios (com begin end mas sem itens) tambem nao funcionam...
#                     {replicar solução implementada para Monografias e ICs em andamento}
#
#       Better explore croscutting mechanisms for handling the last item
#
#       Author name extraction could be improved, to extract names with more than one
#       abbreviation; remove hacks introduced for specific authors
#
# See usage instructions in comments below


def includeFile(fileName)
  File.open(fileName,"r:ISO-8859-1") do |file|
	while line = file.gets
		puts line
	end
  end
end

def processaListaNomes(autores)
	if autores.size == 0 then
		"\"\""
	elsif autores.size == 1 then
		"\"" + autores[0] + "\""
	else
		("\"" + autores[0] + "\"") << ", " << processaListaNomes(autores - [autores[0]])
  end
end

def splitIfPossible(string)
      if (string.split != [])
        string.split[0]
      else
        string
      end
end

# Fixes names obtained from Lattes XML, properly capitalizing and cleaning details forced by Lattes default journal names 
def processaNomePeriodico(periodico)
  periodico = periodico.gsub(/ \(Print\)/,'')
  periodico = periodico.gsub(/ \(UNISINOS\)/,'')
  periodico = periodico.gsub(/ \(PRINT\)/,'')
  periodico = periodico.gsub(/ \(Impresso\)/,'')
  periodico = periodico.gsub(/ \(Online\)/,'')
  periodico = periodico.gsub(/ \(Dordrecht\. Online\)/,'')
  periodico = periodico.gsub(/ \(DORDRECHT\. ONLINE\)/,'')
  periodico = periodico.gsub(/IEEE TRANSACTIONS ON SOFTWARE ENGINEERING/,'IEEE Transactions on Software Engineering')
  periodico = periodico.gsub(/EMPIRICAL SOFTWARE ENGINEERING/,'Empirical Software Engineering')
  periodico = periodico.gsub(/INFORMATION AND SOFTWARE TECHNOLOGY/,'Information and Software Technology')
  periodico = periodico.gsub(/SOFTWARE-PRACTICE & EXPERIENCE/,'Software: Practice & Experience')
  periodico = periodico.gsub(/JOURNAL OF SYSTEMS AND SOFTWARE/,'Journal of Systems and Software')
  periodico = periodico.gsub(/TRANSACTIONS ON ASPECT-ORIENTED SOFTWARE DEVELOPMENT/, 'Transactions on Aspect-Oriented Software Development')
  periodico = periodico.gsub(/JOURNAL OF UNIVERSAL COMPUTER SCIENCE/, 'Journal of Universal Computer Science')
  periodico
end

# Fixes names obtained from Lattes XML, avoiding abbreviations and issues with capitalization of names with accents (could maybe be fixed by setting encoding, or building layer on top of the default capitalize) 
#
def processaNomeAutor(autor)
	matchSurnameName = /([^ \t\r\n\f,;]+\s*), ([^ \t\r\n\f,;]+\s*)/.match(autor)  
	if matchSurnameName then
	  surname = splitIfPossible(matchSurnameName[1])
    firstname = splitIfPossible(matchSurnameName[2])
    fixName(firstname,surname)
  else 
    matchNameSurname = /(\S+)\s*(\S*)\s*(\S*)\s+(\S+)\z/.match(autor)
    if matchNameSurname then
      surname = splitIfPossible(matchNameSurname[4])
      firstname = splitIfPossible(matchNameSurname[1])
      fixName(firstname,surname)
    elsif 
      autor
    end
  end
end 

def fixName(firstname,surname) 
    surname = surname.gsub(/CORNÉLIO/,'Cornélio')
    surname = surname.gsub(/DÓSEA/,'Dósea')
    surname = surname.gsub(/FIGUERÊDO/,'Figuerêdo')
    if (surname == "ACCIOLY")
      firstname = firstname.gsub(/P\./,'Paola')
    elsif (surname == "ALENCAR" || surname == "Alencar")
        firstname = firstname.gsub(/F\./,'Fernanda')
    elsif (surname == "ALVES" || surname == "Alves") 
      firstname = firstname.gsub(/V\./,'Vander')
    elsif (surname == "ARANHA")
      firstname = firstname.gsub(/D\./,'Débora')
      firstname = firstname.gsub(/E\./,'Eduardo')
    elsif (surname == "ARAÚJO" || surname == "ARAUJO")
      firstname = firstname.gsub(/S\./,'Saulo')
      surname = 'Araújo'
    elsif (surname == "BARROS")
      firstname = firstname.gsub(/F\./,'Flávia')
    elsif (surname == "BATISTA")
      firstname = firstname.gsub(/T\./,'Thaís')
      firstname = firstname.gsub(/Thais/,'Thaís')
    elsif (surname == "BENBASSAT")
      firstname = firstname.gsub(/F\./,'Fernando')
    elsif (surname == "BODDEN")
      firstname = firstname.gsub(/E\./,'Eric')
    elsif (surname == "BONIFÁCIO")
      firstname = firstname.gsub(/R\./,'Rodrigo')
      surname = surname.gsub(/BONIFÁCIO/,'Bonifácio')
    elsif (surname == "BORBA" || surname == "Borba")
      firstname = firstname.gsub(/P\./,'Paulo')
    elsif (surname == "BRAGA" || surname == "Braga") 
      firstname = firstname.gsub(/R\./,'Rosana')
    elsif (surname == "CAMARGO") 
      firstname = firstname.gsub(/V\./,'Valter')
    elsif (surname == "CARDIM")
      firstname = firstname.gsub(/I\./,'Ivan')
    elsif (surname == "CARRAHER")
      firstname = firstname.gsub(/D\./,'David')
    elsif (surname == "CARTAXO")
      firstname = firstname.gsub(/E\./,'Emanuela') 
    elsif (surname == "CASTOR")
      firstname = firstname.gsub(/F\./,'Fernando')
    elsif (surname == "CAVALCANTI")
      firstname = firstname.gsub(/G\./,'Guilherme')
    elsif (surname == "CHAVEZ")
      firstname = firstname.gsub(/C\./,'Christina')
    elsif (surname == "CIRILO")
      firstname = firstname.gsub(/E\./,'Élder')
    elsif (surname == "DIAS")
      firstname = firstname.gsub(/K\./,'Klissiomara')
    elsif (surname == "dAmorim" || surname == "D\'AMORIM")
      firstname = firstname.gsub(/F\./,'Fernanda')
      firstname = firstname.gsub(/M\./,'Marcelo')
      surname = 'd\'Amorim'
    elsif (surname == "DELICATO") 
      firstname = firstname.gsub(/FLÁVIA/,'Flávia')
    elsif (surname == "FERNANDES") 
      firstname = firstname.gsub(/L\./,'Lyrene')
    elsif (surname == "FREIRE")
      firstname = firstname.gsub(/M\./,'Marília')
    elsif (surname == "GHEYI")
      firstname = firstname.gsub(/R\./,'Rohit')
    elsif (surname == "GOGUEN")
      firstname = firstname.gsub(/J\./,'Joseph')
    elsif (surname == "JÚNIOR") 
      if (firstname == "Pedro") then surname = 'Matos' end
    elsif (surname == "KULESZA" || surname == "Kulesza" || surname == "KULEZSA" || surname == "Kulezsa") 
      firstname = 'Uirá'
      surname = "Kulesza"
    elsif (surname == "LEAVENS")
      firstname = firstname.gsub(/G\./,'Gary')
    elsif (surname == "LEMOS")
      firstname = firstname.gsub(/OTÁVIO/,'Otávio')
    elsif (surname == "LIMA")
      firstname = firstname.gsub(/R\./,'Ricardo')
    elsif (surname == "LUCENA")
      firstname = firstname.gsub(/C\./,'Carlos')
    elsif (surname == "LUSTOSA")
      firstname = firstname.gsub(/P\./,'Patrícia')
    elsif (surname == "MASIERO" || surname == "Masiero") 
      firstname = firstname.gsub(/P\./,'Paulo')
    elsif (surname == "MEDEIROS" || surname == "Medeiros") 
      firstname = firstname.gsub(/FlÁvio/,'Flávio')
      firstname = firstname.gsub(/FLÁVIO/,'Flávio')
    elsif (surname == "MEIRA")
      firstname = firstname.gsub(/S\./,'Silvio')
    elsif (surname == "MELO")
      firstname = firstname.gsub(/J\./,'Jean')
    elsif (surname == "MENDONÇA")
      surname = "Mendonça"
    elsif (surname == "MENEZES")
      firstname = firstname.gsub(/A\./,'Andrea')
    elsif (surname == "MEZINI")
      firstname = firstname.gsub(/M\./,'Mira')
    elsif (surname == "NEVES")
      firstname = firstname.gsub(/L\./,'Laís')
      firstname = firstname.gsub(/LAÍS/,'Laís')
    elsif (surname == "OLIVEIRA")
      firstname = firstname.gsub(/K\./,'Kellen')
    elsif (surname == "NOGUEIRA")
      firstname = firstname.gsub(/C\./,'Clóvis')
      firstname = firstname.gsub(/S\./,'Sidney')
    elsif (surname == "PASSOS")
      firstname = firstname.gsub(/L\./,'Leonardo')
    elsif (surname == "PIVETA" || surname == "Piveta") 
      firstname = firstname.gsub(/E\./,'Eduardo')
    elsif (surname == "PONTUAL")
      firstname = firstname.gsub(/C\./,'Carlos')
    elsif (surname == "REBÊLO")
      surname = surname.gsub(/REBÊLO/,'Rebêlo')
    elsif (surname == "RIBEIRO")
      firstname = firstname.gsub(/M\./,'Márcio')
      firstname = firstname.gsub(/MÁRCIO/,'Márcio')
    elsif (surname == "ROCHA")
      firstname = firstname.gsub(/THAÍS/,'Thaís')
    elsif (surname == "RUBIRA")
      firstname = firstname.gsub(/CECÍLIA/,'Cecília')
    elsif (surname == "SANTOS" || surname == "Santos")
      firstname = firstname.gsub(/JoÃo/,'João')
      firstname = firstname.gsub(/JOÃO/,'João')
      firstname = firstname.gsub(/Joao Pedro/,'João')
      firstname = firstname.gsub(/G./,'Galileu de Jesus')
    elsif (surname == "SARAIVA")
      firstname = firstname.gsub(/J\./,'João')
    elsif (surname == "SENA")
      firstname = firstname.gsub(/D\./,'Demóstenes')
      firstname = firstname.gsub(/DEMÓSTENES/,'Demóstenes')
    elsif (surname == "SILVEIRA")
      firstname = firstname.gsub(/FÁBIO/,'Fábio')
    elsif (surname == "SOARES")
      firstname = firstname.gsub(/S\./,'Sérgio')
      firstname = firstname.gsub(/G\./,'Gibeon')
      firstname = firstname.gsub(/SÉRGIO/,'Sérgio')
    elsif (surname == "STAA" || surname == "Staa") 
      firstname = firstname.gsub(/A\./,'Arndt') 
    elsif (surname == "TAVARES")
      firstname = firstname.gsub(/A\./,'Alberto')
    elsif (surname == "TEIXEIRA")
      firstname = firstname.gsub(/L\./,'Leopoldo')
    elsif (surname == "TOLÊDO")
      firstname = firstname.gsub(/T\./,'Társis')
      firstname = firstname.gsub(/TÁRSIS/,'Társis')
      surname = surname.gsub(/TOLÊDO/,'Tolêdo')
    elsif (surname == "TORRES")
      firstname = firstname.gsub(/D\./,'Dante')
    elsif (surname == "TURNES") 
      firstname = firstname.gsub(/L\./,'Lucinéia')
    elsif (surname == "VALENTE" || surname == "Valente") 
      firstname = firstname.gsub(/M\./,'Marco')
    end
    if (surname != 'd\'Amorim') then surname = surname.capitalize end
    firstname.capitalize << " " << surname
end

def processaEditores(editores)
	match = /(\w+);/.match(editores)
	if match then
		editores << ", editores"
	elsif (editores != "") then
		editores << ", editor"
	else
		""
	end
end

def processaPaginas(pgi,pgf)
	if (pgi != "" and  pgi!= "?") and (pgf != "" and  pgf!= "?") then
		"#{pgi}-#{pgf}"
	else
		""
	end
end

def processaPagina(pgs)
	if (pgs != "" and  pgs != "?" and pgs != "0") then
		"#{pgs} pgs,"
	else
		""
	end
end

def processaCoOrientacao(co)
	""
#  if (co == "CO_ORIENTADOR") then
#		"Co-orientação."
#	else
#		""
#	end
end

def processaTipoOrientacao(tipo)
	if ((tipo == "INICIACAO_CIENTIFICA") or (tipo == "Iniciação Científica"))
		"Iniciação Científica em "
	elsif ((tipo == "TRABALHO_DE_CONCLUSAO_DE_CURSO_GRADUACAO") or
		   (tipo == "Trabalho de conclusão de curso de graduação") or
		   (tipo == "Graduação"))
		"Trabalho de Conclusão de Curso de Graduação, "
	elsif (tipo == "Doutorado")
		"Tese de Doutorado em "
	elsif (tipo == "Mestrado")
		"Tese de Mestrado em "
	else
		""
	end
end

def processaAgencia(agencia)
	if (agencia != "") then
		" Orgão Financiador: #{agencia}."
	else
		""
	end
end

def adaptaLaTeX(texto)
  result = texto.gsub(/#/,'\\#')
  result = result.gsub(/&/,'\\\&')
  result
end

# lista de atributos [at1, ..., atn] atualiza mapeamento com valores para cada um dos atributos at1...atn,
#                             usando os nomes at1...atn como chaves do mapeamento
#                    ["*", at] atualiza mapeamento com lista de valores, cada um valor de uma instância de at,
#                             usando o nome que antecede a lista na estrutura como chave do mapeamento
#                    ["*", at1, ..., atn] atualiza mapeamento com lista de lista de valores, cada lista de
#                            valores contendo valores para cada um dos atributos at1...atn, na mesma ordem,
#                             usando o nome que antecede a lista na estrutura como chave do mapeamento
#
def processaAtributos(estrutura, e, atts, map)
  if estrutura[e].include?("*") then
    subestrutura = estrutura[e] - ["*"]
    if (subestrutura.size == 1)
      map[e] = (if map[e] then map[e] else [] end) +
               [(atts[subestrutura[0]])]
    else
      map[e] = (if map[e] then map[e] else [] end) +
               [subestrutura.collect {|att| (atts[att])}]
    end
  else
    estrutura[e].each {|att|
      map[att] = (atts[att])
    }
  end
  map
end

# estrutura { subelemento => lista de atributos a serem recuperados no subelemento,
#             "" => lista de atributos a serem recuperados no elemento,
#             "//subelemento" => { subsubelemento => lista de atributos a serem recuperados no subsubelemento},
#             "subelemento//subsub" => { subsubsub => lista de atributos a serem recuperados no subsubsub},
#           }
#
def extraiElemento(elemento, estrutura)
  map = {}
	estrutura.keys.each {|e|
		match = /(.*)\/\/(.*)/.match(e)
	  if match then
	    	elemento.elements.each(match[1]) {|epai|
	    		epai.elements.each(match[2]) {|efilho|
	    			map = map.update(extraiElemento(efilho,estrutura[e]))
	    	  }
      }
	  else
	    if (e == "")
	    then
	      atts = elemento.attributes
        map = processaAtributos(estrutura, e, atts, map)
	    else
			  elemento.elements.each(e) {|d|
				  atts = d.attributes
          map = processaAtributos(estrutura, e, atts, map)
        }
      end
    end
		}
	map
end

def ordenaAutores(autores)
  ordenado = autores.sort {|x,y| x[1] <=> y[1]}
  ordenado.collect{|noa| processaNomeAutor(noa[0])}
end

def processaArtigosJornal(artigos, referencia)
	estrutura = {"DADOS-BASICOS-DO-ARTIGO" =>
					["TITULO-DO-ARTIGO", "ANO-DO-ARTIGO"],
				 "DETALHAMENTO-DO-ARTIGO" =>
				 	["TITULO-DO-PERIODICO-OU-REVISTA", "VOLUME", "FASCICULO", "PAGINA-INICIAL", "PAGINA-FINAL"],
				 "AUTORES" => ["*", "NOME-PARA-CITACAO","ORDEM-DE-AUTORIA"]}
  artigos.each{|a|
		map = extraiElemento(a,estrutura)
    fasc = if (map["FASCICULO"] != "") then "(#{map["FASCICULO"]})" else "" end
    #  volume #{map["VOLUME"]}#{fasc},
		print " \{ \"authors\" : \[#{processaListaNomes(ordenaAutores(map["AUTORES"]))}\], \n   \"title\" : \"#{map["TITULO-DO-ARTIGO"]}\", \n   \"journal\" : \"#{processaNomePeriodico(map["TITULO-DO-PERIODICO-OU-REVISTA"])}\", \n   \"pages\" : \"#{processaPaginas(map["PAGINA-INICIAL"],map["PAGINA-FINAL"])}\",\n   \"year\" : \"#{map["ANO-DO-ARTIGO"]}\"\n \}"
    puts "," if (!a.equal? (artigos.last))
	  referencia = referencia + 1
	}
	referencia
end

def processaArtigosDeOpiniao(artigosDeOpiniao,referencia)
    estrutura = {"DADOS-BASICOS-DO-TEXTO" =>
                    ["TITULO-DO-TEXTO", "ANO-DO-TEXTO", "PAIS-DE-PUBLICACAO"],
                 "DETALHAMENTO-DO-TEXTO" =>
                    ["TITULO-DO-JORNAL-OU-REVISTA", "PAGINA-INICIAL", "PAGINA-FINAL", "DATA-DE-PUBLICACAO"],
                  "AUTORES" => ["*", "NOME-PARA-CITACAO","ORDEM-DE-AUTORIA"]}
     artigosDeOpiniao.each{|a|
      map = extraiElemento(a,estrutura)
      fasc = if (map["FASCICULO"] != "") then "(#{map["FASCICULO"]})" else "" end
      puts "\\item #{processaListaNomes(ordenaAutores(map["AUTORES"]))}. \\emph\{#{map["TITULO-DO-TEXTO"]}\}. #{map["TITULO-DO-JORNAL-OU-REVISTA"]}, #{processaPaginas(map["PAGINA-INICIAL"],map["PAGINA-FINAL"])} #{map["PAIS-DE-PUBLICACAO"]}, #{map["ANO-DO-TEXTO"]}. \\DOC\{#{referencia}\}"
        referencia = referencia + 1
    }
    referencia
end

def processaArtigosEventos(artigos, referencia)
	estrutura = {"DADOS-BASICOS-DO-TRABALHO" =>
					["TITULO-DO-TRABALHO", "ANO-DO-TRABALHO", "PAIS-DO-EVENTO"],
				 "DETALHAMENTO-DO-TRABALHO" =>
				 	["NOME-DO-EVENTO", "PAGINA-INICIAL", "PAGINA-FINAL"],
				 "AUTORES" => ["*", "NOME-PARA-CITACAO","ORDEM-DE-AUTORIA"]}
  artigos.each{|a|
		map = extraiElemento(a,estrutura)
		print " \{ \"authors\" : \[#{processaListaNomes(ordenaAutores(map["AUTORES"]))}\], \n   \"title\" : \"#{map["TITULO-DO-TRABALHO"]}\", \n   \"conference\" : \"#{map["NOME-DO-EVENTO"]}\", \n   \"pages\" : \"#{processaPaginas(map["PAGINA-INICIAL"],map["PAGINA-FINAL"])}\",\n   \"country\" : \"#{map["PAIS-DO-EVENTO"]}\", \n   \"year\" : \"#{map["ANO-DO-TRABALHO"]}\"\n \}"
    puts "," if (!a.equal? (artigos.last))
	  referencia = referencia + 1
	}
	referencia
end

def processaCapitulosLivros(capitulos, referencia)
	estrutura = {"DADOS-BASICOS-DO-CAPITULO" =>
					["TITULO-DO-CAPITULO-DO-LIVRO", "ANO"],
				 "DETALHAMENTO-DO-CAPITULO" =>
				 	["TITULO-DO-LIVRO", "PAGINA-INICIAL", "PAGINA-FINAL", "ORGANIZADORES", "NOME-DA-EDITORA"],
				 "AUTORES" => ["*", "NOME-PARA-CITACAO","ORDEM-DE-AUTORIA"]}
	capitulos.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item #{processaListaNomes(ordenaAutores(map["AUTORES"]))}. #{map["TITULO-DO-CAPITULO-DO-LIVRO"]}. Em #{processaEditores(map["ORGANIZADORES"])}, \\emph\{#{map["TITULO-DO-LIVRO"]}\}, #{processaPaginas(map["PAGINA-INICIAL"],map["PAGINA-FINAL"])}#{map["NOME-DA-EDITORA"]}, #{map["ANO"]}. \\DOC\{#{referencia}\}"
			referencia = referencia + 1
	}
	referencia
end

def processaLivros(livros, referencia)
  estrutura = {"DADOS-BASICOS-DO-LIVRO" => ["TITULO-DO-LIVRO", "ANO"],
         "DETALHAMENTO-DO-LIVRO" =>
            ["NUMERO-DE-PAGINAS", "CIDADE-DA-EDITORA", "NOME-DA-EDITORA"],
         "AUTORES" => ["*", "NOME-PARA-CITACAO","ORDEM-DE-AUTORIA"]}
  livros.each{|a|
    map = extraiElemento(a,estrutura)
    puts "\\item #{processaListaNomes(ordenaAutores(map["AUTORES"]))}. \\emph\{#{map["TITULO-DO-LIVRO"]}\}, #{processaPagina(map["NUMERO-DE-PAGINAS"])} #{map["NOME-DA-EDITORA"]}, #{map["CIDADE-DA-EDITORA"]}, #{map["ANO"]}. \\DOC\{#{referencia}\}"
      referencia = referencia + 1
  }
  referencia
end

def processaOrientacoesConcluidas(orientacoes, referencia, tipo)
  processaOrientacoesConcluidasReferencias(orientacoes, referencia, tipo, true)
end

def processaOrientacoesConcluidasReferencias(orientacoes, referencia, tipo, referenciaUnica)
  estrutura = {"DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-" << tipo =>
            ["TITULO", "ANO"],
           "DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-" << tipo =>
            ["NOME-DO-ORIENTADO", "NOME-DA-INSTITUICAO", "NOME-DO-CURSO", "NUMERO-DE-PAGINAS", "TIPO-DE-ORIENTACAO"]}
    orientacoes.each{|a|
      map = extraiElemento(a,estrutura)
      puts "\\item #{map["NOME-DO-ORIENTADO"]}. \\emph\{#{map["TITULO"]}\}. Tese de #{tipo.capitalize} em #{map["NOME-DO-CURSO"]}, #{map["NOME-DA-INSTITUICAO"]}, #{processaPagina(map["NUMERO-DE-PAGINAS"])} #{map["ANO"]}. #{processaCoOrientacao(map["TIPO-DE-ORIENTACAO"])} \\DOC\{#{referencia}\}"
      if (referenciaUnica == false)
        referencia = referencia + 1
      end
    }
    if (referenciaUnica == true)
      referencia = referencia + 1
    end
    referencia
end


def processaOrientacoesEmAndamento(orientacoes, referencia, tipo)
	estrutura = {"DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-" << tipo =>
					["TITULO-DO-TRABALHO", "ANO"],
				 "DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-" << tipo =>
				 	["NOME-DO-ORIENTANDO", "NOME-INSTITUICAO", "NOME-CURSO", "TIPO-DE-ORIENTACAO"]}
	orientacoes.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item #{map["NOME-DO-ORIENTANDO"]}. \\emph\{#{map["TITULO-DO-TRABALHO"]}\}. Tese de #{tipo.capitalize} em #{map["NOME-CURSO"]}, #{map["NOME-INSTITUICAO"]}, #{map["ANO"]}. #{processaCoOrientacao(map["TIPO-DE-ORIENTACAO"])} \\DOC\{#{referencia}\}"
	}
	referencia = referencia + 1
	referencia
end

def processaOutrasOrientacoesConcluidasReferencias(orientacoes, referencia, tipo, referenciaUnica)
	estrutura = {"DADOS-BASICOS-DE-OUTRAS-ORIENTACOES-CONCLUIDAS" =>
					["TITULO", "ANO"],
				 "DETALHAMENTO-DE-OUTRAS-ORIENTACOES-CONCLUIDAS"  =>
				 	["NOME-DO-ORIENTADO", "NOME-DA-INSTITUICAO", "NOME-DO-CURSO", "NUMERO-DE-PAGINAS", "TIPO-DE-ORIENTACAO-CONCLUIDA", "NOME-DA-AGENCIA"]}
	orientacoes.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item #{map["NOME-DO-ORIENTADO"]}. \\emph\{#{map["TITULO"]}\}.  #{processaTipoOrientacao(tipo)}#{map["NOME-DO-CURSO"]}, #{map["NOME-DA-INSTITUICAO"]}, #{processaPagina(map["NUMERO-DE-PAGINAS"])} #{map["ANO"]}. #{processaCoOrientacao(map["TIPO-DE-ORIENTACAO-CONCLUIDA"])}#{processaAgencia(map["NOME-DA-AGENCIA"])} \\DOC\{#{referencia}\}"
    if (referenciaUnica == false)
      referencia = referencia + 1
    end
	}
  if (referenciaUnica == true)
     referencia = referencia + 1
  end
	referencia
end

def processaOutrasOrientacoesConcluidas(orientacoes, referencia, tipo)
  processaOutrasOrientacoesConcluidasReferencias(orientacoes, referencia, tipo, true)
end

def processaOutrasOrientacoesEmAndamento(orientacoes, referencia, tipo)
	estrutura = {"DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-" << tipo =>
					["TITULO-DO-TRABALHO", "ANO", "NATUREZA"],
				 "DETALHAMENTO-DA-ORIENTACAO-EM-ANDAMENTO-DE-" << tipo =>
				 	["NOME-DO-ORIENTANDO", "NOME-INSTITUICAO", "NOME-CURSO", "NOME-DA-AGENCIA"]}
	orientacoes.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item #{map["NOME-DO-ORIENTANDO"]}. \\emph\{#{map["TITULO-DO-TRABALHO"]}\}.  #{processaTipoOrientacao(map["NATUREZA"])}#{map["NOME-CURSO"]}, #{map["NOME-INSTITUICAO"]}, #{map["ANO"]}. #{processaAgencia(map["NOME-DA-AGENCIA"])} \\DOC\{#{referencia}\}"
		referencia = referencia + 1
	}
	referencia
end

def processaBancas(bancas, referencia, tipo)
	estrutura = {"DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-" << tipo =>
					["TITULO", "ANO", "NATUREZA"],
				 "DETALHAMENTO-DA-PARTICIPACAO-EM-BANCA-DE-" << tipo =>
				 	["NOME-DO-CANDIDATO", "NOME-INSTITUICAO", "NOME-CURSO"],
				 "PARTICIPANTE-BANCA" => ["*", "NOME-PARA-CITACAO-DO-PARTICIPANTE-DA-BANCA"]}
	bancas.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item #{map["NOME-DO-CANDIDATO"]}. \\emph\{#{map["TITULO"]}\}. #{processaTipoOrientacao(map["NATUREZA"])}#{map["NOME-CURSO"]}, #{map["NOME-INSTITUICAO"]}, #{map["ANO"]}.  \\DOC\{#{referencia}\}"
    # Examinadores: #{processaListaNomes(map["PARTICIPANTE-BANCA"].collect{|na| processaNomeAutor(na)})}
		referencia = referencia + 1
	}
	referencia
end

def processaComites(comites, referencia)
	estrutura = {"DADOS-BASICOS-DE-DEMAIS-TRABALHOS" =>
					["TITULO", "ANO", "PAIS"]
				}
	comites.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item #{map["TITULO"]}, #{map["PAIS"]}, #{map["ANO"]}. \\DOC\{#{referencia}\}"
			referencia = referencia + 1
	}
	referencia
end

def processaProjetos(projetos, referencia)
	estrutura = {"" => ["NOME-DO-PROJETO", "ANO-INICIO", "ANO-FIM", "NATUREZA"],
	             "//FINANCIADORES-DO-PROJETO" =>
	                  { "FINANCIADOR-DO-PROJETO" => ["*","NOME-INSTITUICAO"]},
				      }
	projetos.each{|a|
		map = extraiElemento(a,estrutura)
		puts "\\item \\emph\{#{map["NOME-DO-PROJETO"]}\}, Projeto de #{map["NATUREZA"].capitalize}, de #{map["ANO-INICIO"]} até #{map["ANO-FIM"]}, instituições além da UFPE: #{processaListaNomes(map["FINANCIADOR-DO-PROJETO"])}. \\DOC\{#{referencia}\}"
	  referencia = referencia + 1
	}
	referencia
end

def processaEventos(eventos, referencia)
  estrutura = {"DADOS-BASICOS-DA-ORGANIZACAO-DE-EVENTO" => ["TITULO", "ANO", "PAIS"],
               "DETALHAMENTO-DA-ORGANIZACAO-DE-EVENTO" => ["INSTITUICAO-PROMOTORA", "CIDADE"],
               "AUTORES" => ["*", "NOME-PARA-CITACAO","ORDEM-DE-AUTORIA"]
              }
  eventos.each{|a|
    map = extraiElemento(a,estrutura)
    puts "\\item \\emph\{#{map["TITULO"]}\}, organizado por #{processaListaNomes(ordenaAutores(map["AUTORES"]))}. #{map["INSTITUICAO-PROMOTORA"].capitalize}, #{map["CIDADE"]}, #{map["ANO"]}. \\DOC\{#{referencia}\}"
    referencia = referencia + 1
  }
  referencia
end

def processaCongressos(congressos,referencia)
  estrutura = {"DADOS-BASICOS-DA-PARTICIPACAO-EM-CONGRESSO" => ["TITULO", "ANO", "PAIS"],
                "DETALHAMENTO-DA-PARTICIPACAO-EM-CONGRESSO" => ["NOME-DO-EVENTO", "CIDADE-DO-EVENTO"]
               }
  congressos.each{|a|
     map = extraiElemento(a,estrutura)
     puts "\\item \\emph\{#{map["NOME-DO-EVENTO"]}\}, #{map["CIDADE-DO-EVENTO"]}, #{map["PAIS"]}, #{map["ANO"]}. \\DOC\{#{referencia}\}"
     referencia = referencia + 1
   }
   referencia
end

def processaPremios(premios,referencia)
   estrutura = {"" => ["NOME-DO-PREMIO-OU-TITULO", "NOME-DA-ENTIDADE-PROMOTORA", "ANO-DA-PREMIACAO"]
                }
    premios.each{|a|
      map = extraiElemento(a,estrutura)
      puts "\\item #{map["NOME-DO-PREMIO-OU-TITULO"]}, promovido pela \\emph\{#{map["NOME-DA-ENTIDADE-PROMOTORA"]}\}, #{map["ANO-DA-PREMIACAO"]}. \\DOC\{#{referencia}\}"
      referencia = referencia + 1
    }
    referencia
end

def selecionaElementosPorAno(vitae, anos, elemento, subelemento, attributoAno)
	selecionaElementosPorAnoECondicao(vitae, anos, elemento, subelemento, attributoAno){|db| true}
end

def extraiAno(elemento, subelemento, attributoAno) #em subelemento
  anos = elemento.elements.collect(subelemento){|db| db.attributes[attributoAno]}
  if anos.size == 1
  then anos[0]
  else anos[0] << "CHECK: Should there be only one year in the array!"
  end
end

def selecionaElementosPorAnoECondicao(vitae, anos, elemento, subelemento, attributoAno) #condicao
	selecionaElementosPorCondicao(vitae, elemento, subelemento, attributoAno) {|db| anos.include?(db.attributes[attributoAno]) and yield(db)}
end

def selecionaElementosPorCondicao(vitae, elemento, subelemento, attributoAnoParaOrdenacao) #condicao #em subelemento
	elementos = []
	vitae.elements.each(elemento){|a|
		a.elements.each(subelemento){|db|
			if yield(db)
			then
				elementos = elementos + [a]
			end
		}
	}
	elementos.sort {|x,y| extraiAno(x, subelemento, attributoAnoParaOrdenacao) <=> extraiAno(y, subelemento, attributoAnoParaOrdenacao)}
end

def extraiAnoEmElemento(elemento, attributoAno) #no próprio elemento, não em subelemento
  ano = elemento.attributes[attributoAno]
  ano
end

def selecionaElementosPorCondicaoNoElemento(vitae, elemento, attributoAnoParaOrdenacao) #condicao #no próprio elemento, não em subelemento
  elementos = []
  vitae.elements.each(elemento){|a|
      if yield(a)
      then
        elementos = elementos + [a]
      end
  }
  elementos.sort {|x,y| extraiAnoEmElemento(x,attributoAnoParaOrdenacao) <=> extraiAnoEmElemento(y,attributoAnoParaOrdenacao)}
end

def selecionaArtigosJornal(vitae, anos)
	selecionaElementosPorAno(vitae,anos,"//ARTIGO-PUBLICADO",
		"DADOS-BASICOS-DO-ARTIGO","ANO-DO-ARTIGO")
end

def selecionaArtigosEventos(vitae, anos)
  selecionaElementosPorAnoECondicao(vitae, anos, "//TRABALHO-EM-EVENTOS", "DADOS-BASICOS-DO-TRABALHO", "ANO-DO-TRABALHO") {|db|
  db.attributes["NATUREZA"] != "RESUMO"}
end

def selecionaArtigosEventosNacional(vitae, anos)
	selecionaElementosPorAnoECondicao(vitae, anos, "//TRABALHO-EM-EVENTOS", "DADOS-BASICOS-DO-TRABALHO", "ANO-DO-TRABALHO") {|db|
			        db.attributes["PAIS-DO-EVENTO"] == "Brasil" and
			        db.attributes["NATUREZA"] != "RESUMO"}
end

def selecionaArtigosEventosInterNacional(vitae, anos)
	selecionaElementosPorAnoECondicao(vitae, anos, "//TRABALHO-EM-EVENTOS", "DADOS-BASICOS-DO-TRABALHO", "ANO-DO-TRABALHO") {|db|
			        db.attributes["PAIS-DO-EVENTO"] != "Brasil" and
			        db.attributes["NATUREZA"] != "RESUMO"}
end

def selecionaCapitulosDeLivros(vitae, anos)
	selecionaElementosPorAno(vitae,anos,"//CAPITULO-DE-LIVRO-PUBLICADO",
		"DADOS-BASICOS-DO-CAPITULO","ANO")
end

def selecionaLivros(vitae, anos)
  selecionaElementosPorAno(vitae,anos,"//LIVRO-PUBLICADO-OU-ORGANIZADO",
    "DADOS-BASICOS-DO-LIVRO","ANO")
end

# Não reusei os métodos de seleção geral pois esse exige condições em dois subelementos, não no elemento ou em apenas um subelemento
def selecionaOrientacoesConcluidas(vitae, anos, tipo, nivelDeOrientacao)
    elementos = []
    vitae.elements.each("//ORIENTACOES-CONCLUIDAS-PARA-" << tipo){|a|
        ano = a.elements["DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-" << tipo].attributes["ANO"]
        orientacao = a.elements["DETALHAMENTO-DE-ORIENTACOES-CONCLUIDAS-PARA-" << tipo].attributes["TIPO-DE-ORIENTACAO"]
        if (anos.include?(ano) and orientacao == nivelDeOrientacao)
        then
          elementos = elementos + [a]
        end
    }
    elementos.sort {|x,y| x.elements["DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-" << tipo].attributes["ANO"] <=> y.elements["DADOS-BASICOS-DE-ORIENTACOES-CONCLUIDAS-PARA-" << tipo].attributes["ANO"]}
end

def selecionaOrientacoesEmAndamento(vitae, tipo)
	selecionaElementosPorCondicao(vitae,"//ORIENTACAO-EM-ANDAMENTO-DE-" << tipo,
		"DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-" << tipo,"ANO"){|db| true}
end

def selecionaOutrasOrientacoesConcluidas(vitae, anos, tipo)
	selecionaElementosPorAnoECondicao(vitae,anos,"//OUTRAS-ORIENTACOES-CONCLUIDAS","DADOS-BASICOS-DE-OUTRAS-ORIENTACOES-CONCLUIDAS","ANO"){|db| db.attributes["NATUREZA"] == tipo}
end

def selecionaOutrasOrientacoesEmAndamento(vitae, tipo)
	selecionaElementosPorCondicao(vitae,"//ORIENTACAO-EM-ANDAMENTO-DE-" << tipo, "DADOS-BASICOS-DA-ORIENTACAO-EM-ANDAMENTO-DE-" << tipo,"ANO") {|db|   true}
end

def selecionaBancas(vitae, anos, tipo)
	selecionaElementosPorAno(vitae,anos,"//PARTICIPACAO-EM-BANCA-DE-" << tipo,"DADOS-BASICOS-DA-PARTICIPACAO-EM-BANCA-DE-" << tipo,"ANO")
end

def selecionaComites(vitae, anos)
	selecionaElementosPorAno(vitae,anos,"//DEMAIS-TRABALHOS","DADOS-BASICOS-DE-DEMAIS-TRABALHOS","ANO")
end

def selecionaProjetos(vitae, anos)
	 selecionaElementosPorCondicaoNoElemento(vitae,"//PROJETO-DE-PESQUISA","ANO-INICIO") {|db| anos.include?(db.attributes["ANO-INICIO"]) or anos.include?(db.attributes["ANO-FIM"])}
end

vitae = REXML::Document.new(File.open("vitaeCNPq.xml"))
anos =
["2024","2023","2022","2021","2020","2019","2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995","1994","1993","1992","1991","1990","1989","1988","1987","1986"]
referencia = 22

# Instruções de uso:
#
#	      1. Currículo Lattes deve ser nomeado como vitaeCNPq.xml,
#          e colocado no mesmo diretório deste programa
#       2. O arquivo inicio.tex, também colocado no mesmo diretório
#          deste programa, com dados iniciais da progressão
#       3. Alterar variável anos
#       4. Colocar arquivos auxiliares (ver includes) no mesmo diretório deste programa
#
#       Para modificar a codificação de caracteres de um arquivo
#       iconv -f LATIN1 -t UTF-8 cursosemeventos.tex > cursosemeventos1.tex
#


# puts ""
# includeFile("inicio.tex")
#
# puts ""
# includeFile("disciplinas.tex")
#
# puts "\\subsection{Orientação de tese de doutorado aprovada}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOrientacoesConcluidas(vitae, anos, "DOUTORADO","ORIENTADOR_PRINCIPAL")
# referencia = processaOrientacoesConcluidas(orientacoes, referencia, "DOUTORADO")
# puts "\% TO DO LATER: Colocar número de páginas no Lattes"
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Co-orientação de tese de doutorado aprovada}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOrientacoesConcluidas(vitae, anos, "DOUTORADO","CO_ORIENTADOR")
# referencia = processaOrientacoesConcluidas(orientacoes, referencia, "DOUTORADO")
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Orientação de dissertação de mestrado aprovada}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOrientacoesConcluidas(vitae, anos, "MESTRADO","ORIENTADOR_PRINCIPAL")
# referencia = processaOrientacoesConcluidas(orientacoes, referencia, "MESTRADO")
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Co-orientação de dissertação de mestrado aprovada}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOrientacoesConcluidas(vitae, anos, "MESTRADO", "CO_ORIENTADOR")
# referencia = processaOrientacoesConcluidasReferencias(orientacoes, referencia, "MESTRADO", false)
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Orientação de monografia de especialização aprovada}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOutrasOrientacoesConcluidas(vitae, anos, "MONOGRAFIA_DE_CONCLUSAO_DE_CURSO_APERFEICOAMENTO_E_ESPECIALIZACAO")
# referencia = processaOutrasOrientacoesConcluidasReferencias(orientacoes, referencia,"MONOGRAFIA_DE_CONCLUSAO_DE_CURSO_APERFEICOAMENTO_E_ESPECIALIZACAO", false)
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Orientação de monografia ou trabalho final de curso de graduação}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOutrasOrientacoesConcluidas(vitae, anos, "TRABALHO_DE_CONCLUSAO_DE_CURSO_GRADUACAO")
# referencia = processaOutrasOrientacoesConcluidas(orientacoes, referencia,"TRABALHO_DE_CONCLUSAO_DE_CURSO_GRADUACAO")
# puts "\% TO DO LATER: Tirar o . do Ltda"
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Orientação de aluno bolsista de iniciação científica}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOutrasOrientacoesConcluidas(vitae, anos, "INICIACAO_CIENTIFICA")
# referencia = processaOutrasOrientacoesConcluidasReferencias(orientacoes, referencia,"INICIACAO_CIENTIFICA",false)
# puts "\\end{enumerate}\n"
# puts "\% TO DO LATER: Pegar datas exatas de início e fim das progressões; verificar se tem como colocar em algum dos itens do formulário do Lattes."
# puts ""
#
# puts ""
# includeFile("monitoria.tex")
#
# referencia = 59
# puts ""
# puts "\\subsection{Orientação de aluno bolsista de extensão}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOutrasOrientacoesConcluidas(vitae, anos,"ORIENTACAO-DE-OUTRA-NATUREZA")
# referencia = processaOutrasOrientacoesConcluidasReferencias(orientacoes, referencia,"ORIENTACAO-DE-OUTRA-NATUREZA", false)
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Participação como membro efetivo de banca examinadora de tese de doutorado}"
# puts "\\begin{enumerate}"
# bancas = selecionaBancas(vitae, anos, "DOUTORADO")
# referencia = processaBancas(bancas, referencia,"DOUTORADO")
# puts "\% TO DO LATER: Digitar e colocar informações sobre os outros examinadores"
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Participação como membro efetivo de banca examinadora de dissertação de mestrado}"
# puts "\\begin{enumerate}"
# bancas = selecionaBancas(vitae, anos, "MESTRADO")
# referencia = processaBancas(bancas, referencia,"MESTRADO")
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Outras atividades de ensino na área do concurso}"
# puts ""
#
# puts ""
# includeFile("ensinooutras.tex")
# referencia = 137
#
# puts "\\subsubsection{Participação como membro efetivo de banca de qualificação de doutorado}"
# puts "\\begin{enumerate}"
# bancas = selecionaBancas(vitae, anos, "EXAME-QUALIFICACAO")
# referencia = processaBancas(bancas, referencia,"EXAME-QUALIFICACAO")
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsubsection{Participação como membro efetivo de banca de monografia}"
# puts "\\begin{enumerate}"
# bancas = selecionaBancas(vitae, anos, "GRADUACAO")
# referencia = processaBancas(bancas, referencia,"GRADUACAO")
# puts "\\end{enumerate}\n"
# puts ""
#
# puts "\\subsubsection{Orientação de tese de doutorado em andamento}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOrientacoesEmAndamento(vitae, "DOUTORADO")
# referencia = processaOrientacoesEmAndamento(orientacoes, referencia, "DOUTORADO")
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsubsection{Orientação de dissertação de mestrado em andamento}"
# puts "\\begin{enumerate}"
# orientacoes = selecionaOrientacoesEmAndamento(vitae, "MESTRADO")
# referencia = processaOrientacoesEmAndamento(orientacoes, referencia, "MESTRADO")
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsubsection{Orientação de monografia de conclusão de curso em andamento}"
# orientacoes = selecionaOutrasOrientacoesEmAndamento(vitae, "GRADUACAO")
# puts "\\begin{enumerate}"
# referencia = processaOutrasOrientacoesEmAndamento(orientacoes, referencia, "GRADUACAO")
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsubsection{Orientação de trabalho de iniciação científica em andamento}"
# orientacoes = selecionaOutrasOrientacoesEmAndamento(vitae, "INICIACAO-CIENTIFICA")
# puts "\\begin{enumerate}"
# referencia = processaOutrasOrientacoesEmAndamento(orientacoes, referencia, "INICIACAO-CIENTIFICA")
# puts "\\end{enumerate}\n"
#
#
# puts "\\section{Pesquisa Científica na Área do Concurso}"
# puts ""
#
# puts "\\subsection{Organização de livro}"
# puts "\\begin{enumerate}"
# livros = selecionaLivros(vitae, anos)
# nLivros = livros.length
# referencia = processaLivros(livros, referencia)
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Capítulo de livro}"
# puts "\\begin{enumerate}"
# capitulos = selecionaCapitulosDeLivros(vitae, anos)
# nCapitulos = capitulos.length
# referencia = processaCapitulosLivros(capitulos, referencia)
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Artigo completo publicado em periódico}"
# puts "\\begin{enumerate}"
puts "[\n"
artigosJornal = selecionaArtigosJornal(vitae, anos)
nArtigosJornal = artigosJornal.length
referencia = processaArtigosJornal(artigosJornal, referencia)
puts ",\n"
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Trabalho científico apresentado em congresso e publicado na íntegra em anais}"
# puts "\\subsubsection{Internacional}"
# puts "\\begin{enumerate}"
 artigosEventos = selecionaArtigosEventos(vitae, anos)
 nArtigosEventos = artigosEventos.length
 referencia = processaArtigosEventos(artigosEventos, referencia)
 puts "\n]"
 # puts "\\end{enumerate}\n"
 # puts "\\subsubsection{Nacional}"
 # puts "\\begin{enumerate}"
 # artigosEventos = selecionaArtigosEventosNacional(vitae, anos)
 # nArtigosEventos = nArtigosEventos + artigosEventos.length
 # referencia = processaArtigosEventos(artigosEventos, referencia)
 # puts "\\end{enumerate}\n"
#
# puts "\\subsection{Trabalho científico apresentado em congresso com resumo publicado em anais}"
# puts "\\begin{enumerate}"
# resumos = selecionaElementosPorAnoECondicao(vitae, anos, "//TRABALHO-EM-EVENTOS", "DADOS-BASICOS-DO-TRABALHO", "ANO-DO-TRABALHO") {|db|
#                 db.attributes["NATUREZA"] == "RESUMO"
#           }
# referencia = processaArtigosEventos(resumos, referencia)
# puts "\% TO DO LATER: Acrescentar posters também"
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Organização de eventos, congressos}"
# puts "\\begin{enumerate}"
# eventos = selecionaElementosPorAno(vitae,anos,"//ORGANIZACAO-DE-EVENTO","DADOS-BASICOS-DA-ORGANIZACAO-DE-EVENTO","ANO")
# referencia = processaEventos(eventos, referencia)
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Coordenador de projeto de pesquisa financiado através de edital público}"
# puts "\\begin{enumerate}"
# projetos = selecionaProjetos(vitae, anos)
# referencia = processaProjetos(projetos, referencia)
# puts "\\end{enumerate}\n"
#
# puts ""
# puts "\\subsection{Colaborador em projeto de pesquisa financiado através de edital público}"
# puts "\\begin{enumerate}"
# puts "\\item TO DO: Filter list above"
# puts "\\end{enumerate}\n"
#
# puts "\\subsection{Outras atividades de pesquisa na área do concurso}\n"
#
# puts "\\subsubsection{Coordenador de outros tipos de projeto de pesquisa}"
# puts "\\begin{enumerate}"
# puts "\\item TO DO: Filter list above"
# puts "\\end{enumerate}\n"
#
# puts "\\subsubsection{Trabalho publicado em revista ou jornal}"
# puts "\\begin{enumerate}"
# artigosDeOpiniao = selecionaElementosPorAno(vitae,anos,"//TEXTO-EM-JORNAL-OU-REVISTA","DADOS-BASICOS-DO-TEXTO","ANO-DO-TEXTO")
# referencia = processaArtigosDeOpiniao(artigosDeOpiniao,referencia)
# puts "\\end{enumerate}\n"
#
# puts ""
# includeFile("administracao.tex")
# puts ""
# includeFile("extensao.tex")
#
# puts ""
# includeFile("atividadesprofissionais.tex")
#
# referencia = 437
# puts ""
# puts "\\subsection{Participação em conselho ou comitê}"
# puts "\\begin{enumerate}"
# comites = selecionaComites(vitae, anos)
# referencia = processaComites(comites, referencia)
#
# includeFile("atividadesprofissionais1.tex")
#
# referencia = 547
# premios = selecionaElementosPorCondicaoNoElemento(vitae, "//PREMIO-TITULO", "ANO-DA-PREMIACAO") {|db|
#               anos.include?(db.attributes["ANO-DA-PREMIACAO"])
#           }
# referencia = processaPremios(premios,referencia)
#
# includeFile("atividadesprofissionais2.tex")
#
# referencia = 582
#
# puts "\\subsubsection{Participação em eventos}"
# puts "\\begin{enumerate}"
# congressos = selecionaElementosPorAno(vitae, anos,"//PARTICIPACAO-EM-CONGRESSO","DADOS-BASICOS-DA-PARTICIPACAO-EM-CONGRESSO","ANO")
# # TO DO: \item participacao em eventos cientificos!Eventos: RUC-2001, SBLP-2005, Sugarloafplop-, SBES-, SBMF-
# referencia = processaCongressos(congressos,referencia)
# puts "\\end{enumerate}\n"
# puts "\\end{document}"
# exit
#
# puts "Relatorio"
# puts "Artigos Jornal = "
# puts nArtigosJornal
# puts "ResumosEventos = "
# puts nResumosEventos
# puts "Capitulos = "
# puts nCapitulos
# puts "Artigos Eventos = "
# puts nArtigosEventos
