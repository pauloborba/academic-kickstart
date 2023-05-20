---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Escrevendo seu trabalho"
subtitle: ""
summary: ""
authors: []
tags: []
categories: ["academic communication"]
date: 2022-12-27T11:36:09-03:00
lastmod: 2022-12-27T11:36:09-03:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
Antes de tudo, você já deve ter visto [Apresentando seu trabalho]({{< relref "/post/apresentando-seu-trabalho" >}}), e apresentado seu trabalho pelo menos uma vez antes de começar a escrever. A apresentação é essencial para o amadurecimento das suas ideias, e a identificação de pontos que precisam ser bem explicados no artigo ou tese.

A qualidade da escrita do seu trabalho é tão importante quanto a qualidade do mesmo. Capriche na preparação!

#### Preparativos iniciais

Crie um repositório privado na área do seu grupo de pesquisa. A do SPG é [spggroup](https://github.com/spgroup). 

Use LaTeX, com hyperref. Leia [essas dicas](https://github.com/dspinellis/latex-advice) para uso adequado do LaTeX.

Analise pelo menos dois ou três artigos anteriores do seu orientador e colaboradores, e tente seguir práticas e padrões de estilo do seu grupo de pesquisa.

Analise os critérios de avaliação adotados por quem normalmente vai ler ou publicar seu artigo. Os de [ICSE 2017](http://icse2017.gatech.edu/technical_research/reviewing_guidelines ) (<i>soundness, significance, verifiability, and presentation quality</i>) formam um bom exemplo.

#### O básico do básico

Inicialmente (no começo do artigo, seção, e parágrafo), dê ao leitor a <i>ilusão da simplicidade</i>. Explique a ideia e a motivação de uma forma abstrata de forma a facilitar o entendimento superficial. Só depois disso, refine a ideia, dando mais detalhes, de forma a possibilitar  um entendimento mais aprofundado. Por simplicidade, essa explicação considerou dois níveis de abstração, mas use mais níveis se necessário.

Descreva com precisão <i>o que</i> você fez, <i>porque</i> você fez, e as  <i>limitações</i> do que você fez. Tenha muito cuidado para não dar a entender que você fez algo que, na verdade, ainda não foi feito. 

Se for preciso copiar alguma figura ou trecho, por menor que seja, de outro trabalho, deixe muito claro que você está fazendo isso, citando a referência e, no caso de trechos, colocando-os entre aspas. Esquecer de fazer isso é considerado  <i>plágio</i>. Até no caso de expressar a mesma ideia de outro artigo,  com palavras diferentes, merece a citação e indicação explícita. No caso de cópia dos seus próprios artigos, pode-se copiar trechos dispensando o uso das aspas. Mas mesmo assim é preciso ter cuidado para não ser caracterizado como  <i>auto-plágio</i>: se for uma extensão de um artigo prévio, por exemplo, deixe isso claro, e explique precisamente o diferencial do novo artigo.   

Escreva a sua filiação em Português (Centro de Informática, Universidade Federal de Pernambuco) e sem abreviações, mesmo que o artigo seja em Inglês. Isso facilita a indexação de publicações da UFPE, e consequentemente seu melhor desempenho em rankings. Além disso, isso é exigido por alguns editais da UFPE para financiamento de viagens.

Se certifique que você realmente não fez nenhum <i>p-haking</i>, e coloque isto no seu texto: <i>We report how we determined our sample size, all data exclusions, all manipulations, and all measures in the study</i> (ver a [fonte](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2160588)).

Use como guia a [lista de tópicos da ACM Sigsoft](https://acmsigsoft.github.io/EmpiricalStandards/tools/) para ter certeza de que você vai cobrir no texto os principais pontos necessários para o tipo de estudo empírico que você está fazendo. Veja primeiro a opção de menu <i>Standards</i> e depois a opção <i>Tools</i>, para gerar a lista específica para o seu tipo de estudo.

#### Capriche no estilo de escrita

Leia com cuidado, e consulte sempre, <i>The Elements of Style</i> ([link 1](http://www.bartleby.com/141/) ou [link 2](http://www.crockford.com/wrrrld/style.html )).

Leia dicas de escrita ([de Claire Le Goues](https://clairelegoues.com/2016/08/23/things-i-keep-repeating-about-writing/), e [do grupo de pesquisa Capra](https://capra.cs.cornell.edu/styleguide)) que casam bastante com o meu estilo (exceto a sugestão de usar "e.g." e "i.e."; por favor, evite).

Use um <i>spell checker</i>! Considere usar uma ferramenta (como [Grammarly](https://www.grammarly.com) ou [ChatGPT](https://openai.com/blog/chatgpt/)) para revisar o seu texto. Não usando uma ferramenta dessas, use [scripts para melhorar a qualidade de textos em inglês](http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates):
<ul>
<li>script para detecção de Weasel Words
```bash
#!/bin/bash
 
weasels="many|various|very|fairly|several|extremely\
|exceedingly|quite|remarkably|few|surprisingly\
|mostly|largely|huge|tiny|((are|is) a number)\
|excellent|interestingly|significantly\
|substantially|clearly|vast|relatively|completely"
 
wordfile=""
 
# Check for an alternate weasel file
if [ -f $HOME/etc/words/weasels ]; then
    wordfile="$HOME/etc/words/weasels"
fi
 
if [ -f $WORDSDIR/weasels ]; then
    wordfile="$WORDSDIR/weasels"
fi
 
if [ -f words/weasels ]; then
    wordfile="words/weasels"
fi
 
if [ ! "$wordfile" = "" ]; then
    weasels="xyzabc123";
    for w in `cat $wordfile`; do
        weasels="$weasels|$w"
    done
fi
 
 
if [ "$1" = "" ]; then
 echo "usage: `basename $0` <file> ..."
 exit
fi
 
egrep -i -n --color "\\b($weasels)\\b" $*
 
exit $?
```
<li>script para deteção de Voz Passiva
```bash
#!/bin/bash
 
irregulars="awoken|\
been|born|beat|\
become|begun|bent|\
beset|bet|bid|\
bidden|bound|bitten|\
bled|blown|broken|\
bred|brought|broadcast|\
built|burnt|burst|\
bought|cast|caught|\
chosen|clung|come|\
cost|crept|cut|\
dealt|dug|dived|\
done|drawn|dreamt|\
driven|drunk|eaten|fallen|\
fed|felt|fought|found|\
fit|fled|flung|flown|\
forbidden|forgotten|\
foregone|forgiven|\
forsaken|frozen|\
gotten|given|gone|\
ground|grown|hung|\
heard|hidden|hit|\
held|hurt|kept|knelt|\
knit|known|laid|led|\
leapt|learnt|left|\
lent|let|lain|lighted|\
lost|made|meant|met|\
misspelt|mistaken|mown|\
overcome|overdone|overtaken|\
overthrown|paid|pled|proven|\
put|quit|read|rid|ridden|\
rung|risen|run|sawn|said|\
seen|sought|sold|sent|\
set|sewn|shaken|shaven|\
shorn|shed|shone|shod|\
shot|shown|shrunk|shut|\
sung|sunk|sat|slept|\
slain|slid|slung|slit|\
smitten|sown|spoken|sped|\
spent|spilt|spun|spit|\
split|spread|sprung|stood|\
stolen|stuck|stung|stunk|\
stridden|struck|strung|\
striven|sworn|swept|\
swollen|swum|swung|taken|\
taught|torn|told|thought|\
thrived|thrown|thrust|\
trodden|understood|upheld|\
upset|woken|worn|woven|\
wed|wept|wound|won|\
withheld|withstood|wrung|\
written"
 
if [ "$1" = "" ]; then
 echo "usage: `basename $0` <file> ..."
 exit
fi
 
egrep -n -i --color \
 "\\b(am|are|were|being|is|been|was|be)\
\\b[ ]*(\w+ed|($irregulars))\\b" $*
 
exit $?
```
<li>script para detecção de Palavras Duplicadas
```perl
#!/usr/bin/env perl
 
# Finds duplicate adjacent words.
 
use strict ;
 
my $DupCount = 0 ;
 
if (!@ARGV) {
  print "usage: dups <file> ...\n" ;
  exit ;
}
 
while (1) {
  my $FileName = shift @ARGV ;
 
  # Exit code = number of duplicates found. 
  exit $DupCount if (!$FileName) ;
 
  open FILE, $FileName or die $!;
   
  my $LastWord = "" ;
  my $LineNum = 0 ;
   
  while (<FILE>) {
    chomp ;
 
    $LineNum ++ ;
     
    my @words = split (/(\W+)/) ;
     
    foreach my $word (@words) {
      # Skip spaces:
      next if $word =~ /^\s*$/ ;
 
      # Skip punctuation:
      if ($word =~ /^\W+$/) {
        $LastWord = "" ;
        next ;
      }
       
      # Found a dup?
      if (lc($word) eq lc($LastWord)) {
        print "$FileName:$LineNum $word\n" ;
        $DupCount ++ ;
      } # Thanks to Sean Cronin for tip on case.
 
      # Mark this as the last word:
      $LastWord = $word ;
    }
  }
   
  close FILE ;
}
```
</ul>

#### Preparando as referências bibliográficas

Uniformize as referências: se colocar uma informação (como ano, número de páginas, etc.) em uma, coloque em todas; se nome abreviado (de autor, evento, etc.) é colocado em uma, abrevie o nome em todas; etc. Por exemplo, você nao deve colocar "ACM Transactions on Programming Languages and System (TOPLAS)", com a sigla, e depois colocar "IEEE Transactions on Software Engineering" sem a sigla.

Minha preferência é para referências com nome e sobrenome dos autores não abreviados, nome do evento ou período não abreviado e sem sigla, e sem informações extras como editora, cidade da publicação, etc. Mas isso é uma questão de gosto. O importante é que seja seguido um padrão de forma consistente. Normalmente, discute-se esse padrão com os seus co-autores antes de começar a preparar as referências.

Siga as sugestões de [Owens](https://www.ece.ucdavis.edu/~jowens/biberrors.html?s=03) tanto para preparar as referências quanto para citá-las.

#### Revisando o seu trabalho

Após você escrever, imprimir, ler e revisar uma primeira versão do seu artigo, envie uma segunda versão para outras pessoas (principalmente seu orientador!) revisar.

As anotações e comentários feitos pelo seu orientador no seu texto devem ser interpretadas não apenas como uma sugestão para melhorar um determinado trecho do texto, mas como uma lição a ser aprendida e usada em vários outros contextos (outras partes do texto, outros textos, etc.). Isso ajudará você a evitar  cometer o mesmo erro de escrita mais de uma vez.

Para facilitar a vida das pessoas (inclusive o seu orientador)  que estiverem lhe ajudando com o artigo, ao fazer mudanças em uma versão lida e comentada por essas pessoas, destaque todas as mudanças realizadas utilizando um comando como <i>\newcommand{\rev}[1]{\textcolor{red}{#1}}</i> (ver [Marking Changed Text in Journal Revisions](https://medium.com/@xLeitix/marking-changed-text-in-journal-revisions-8583136a4738)). Assim, ao lerem uma próxima versão, essas pessoas poderão facilmente identificar o que foi modificado.

Após a aceitação do seu trabalho, coloque todo o material do artigo no [repositório de artigos](https://github.com/spgroup/papers) do seu grupo de pesquisa.

Verifique com cuidado a política de publicação associada ao veículo onde você quer publicar seu artigo. Na falta de uma política clara do veículo em questão, siga a [política da ACM](https://www.acm.org/publications/policies/new-acm-policy-on-authorship).