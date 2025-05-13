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

Considere fortemente fazer um curso sobre o assunto. Recomendo fortemente [Writing and Speaking with Style](https://docs.google.com/document/d/1_vBXbugoLjO171w3wovs3ugmRQI-O6EcSVFDBF7eUzE/edit#heading=h.sgfiu451dqjh), de Benjamin C. Pierce e Rajeev Alur.

#### Preparativos iniciais

Crie um repositório privado na área do seu grupo de pesquisa. A do SPG é [spggroup](https://github.com/spgroup). Peça para seu orientador criar, caso você não tenha permissão.

Use LaTeX, com hyperref. Leia [essas dicas](https://github.com/dspinellis/latex-advice) para uso adequado do LaTeX. Sem saber o básico, você vai cometer muitos erros. Coisas como as seguintes: para obter um travessão em LaTeX, você tem que escrever três hífens seguidos, sem espaço entre eles; como indicação de rodapé vem sempre depois da pontuação, escreva "texto.\footnote{texto do rodapé}" ao invés de "texto\footnote{texto do rodapé}."; para fechar aspas duplas, escreva dois ‘ seguidos, nao o carácter " de aspas duplas; para abrir aspas duplas, escreva dois ` seguidos.

Analise pelo menos dois ou três artigos anteriores do seu orientador e colaboradores, e tente seguir práticas e padrões de estilo do seu grupo de pesquisa, ou de alguns artigos de destaque (confirme com seu orientador se eles realmente são de destaque!) que você tenha lido e tenha gostado. Imite o que é bom em termos de estilo de escrita!

Analise os critérios de avaliação adotados por quem normalmente vai ler ou publicar seu artigo. Os de [ICSE 2017](http://icse2017.gatech.edu/technical_research/reviewing_guidelines ) (<i>soundness, significance, verifiability, and presentation quality</i>) formam um bom exemplo.

#### O básico do básico

Antes de tudo, pense na audiência. Se coloque na posição do leitor, durante toda a escrita, e pense no que seria mais interessante e fácil para ele entender. O que é fácil para você, depois de ter trabalhado naquela pesquisa por meses, normalmente não vai ser fácil e claro para o leitor do seu artigo. O mesmo vale para os termos e conceitos que você usa naturalmente, mas que precisam ser definidos e explicados assim que eles são usados no seu texto. Os conceitos e termos usados em uma seção, a menos que muito básicos e de conhecimento universal da área, devem ter sido introduzidos e explicados em seções ou parágrafos anteriores, ou no local em que ele está sendo usado pela primeira vez. Use um único termo para referenciar um conceito; não use sinônimos pois isso vai gerar confusão no leitor. 

O seu artigo deve contar um estória como a seguinte: desenvolvedores sofrem com problema tal, sofrem dor tal no dia a dia; ferramentas e técnicas atuais não resolvem o problema por completo por causa disso e daquilo; para resolver esse problema, a gente sugere o seguinte; para avaliar se a solução funciona, a gente faz isso e aquilo; os resultados mostram isso; isso significa que tais pessoas podem se beneficiar da solução em tais situações! Essa estória deve ser interessante e fácil de ler. É importante que a estória também gire em torno de um único ponto principal, uma única descoberta principal; melhor focar em um ponto e fazê-lo bem feito.

Pense e elabore bem essa estória antes de começar a escrever. Você pode começar com um <i>elevator speech</i> e ir refinando e detalhando a estória. Depois definir a estrutura do artigo: Introdução, Exemplo Motivante, Solução, Perguntas e Métodos de Pesquisa, Resultados, Discussão, Trabalhos Relacionados, e Conclusões, normalmente para um artigo que envolve a proposta de uma solução para um problema, uma ferramenta, etc.; Introdução, Perguntas e Métodos de Pesquisa, Resultados, Discussão, Trabalhos Relacionados, e Conclusões, normalmente para um estudo empírico exploratório. Depois, refinar as seções, escrevendo uma linha por seção, seguido de uma linha por cada parágrafo de cada seção, para finalmente escrever por completo cada parágrafo do artigo. Busque uma estória que seja consistente e interessante de ler, obviamente desde que reflita bem o que você fez na sua pesquisa e obteve nos seus resultados. 

Todo o resto do artigo deve focar em explicar e mostrar evidência de que essa estória é plausível, assim mostrando  detalhes necessários para dar confiança ao leitor de que sua estória faz sentido e é justificada com base na pesquisa que você realizou. Se algum detalhe não contribui para reforçar a sua estória (como por exemplo dizer que o formato do arquivo X é Y), melhor não colocar no artigo. Colocar só vai atrapalhar, tirando o foco do que interessa. Certamente, seu texto não precisa detalhar tudo que foi feito, na ordem que foi feito, etc.

Inicialmente (no começo do artigo, seção, e parágrafo), dê ao leitor a <i>ilusão da simplicidade</i>. Explique a ideia e a motivação de uma forma abstrata de forma a facilitar o entendimento superficial. Só depois disso, refine a ideia, dando mais detalhes, de forma a possibilitar  um entendimento mais aprofundado. Por simplicidade, essa explicação considerou dois níveis de abstração, mas use mais níveis se necessário.

Para dar fluidez a leitura, deve haver uma ligação entre uma seção e a anterior (Para responder as perguntas de pesquisa apresentadas na seção anterior, nesta seção...), e entre um parágrafo e o anterior, conectando o que foi discutido no parágrafo anterior (por exemplo, se um parágrafo descreve o problema, e o seguinte analisa o impacto do problema, esse último deve começar de forma a conectar as ideias dos dois, como assim: A consequência prática desse problema é que...).

Se uma seção traz muitas ideias ou é muito longa, quebre-a em subseções (não necessariamente numeradas).

Descreva com precisão <i>o que</i> você fez, <i>porque</i> você fez, e as  <i>limitações</i> do que você fez. Em especial, o <i>porque</i>, ou seja a motivação para o que você vai apresentar ou explicar, normalmente deve vir antes do que você vai explicar. Tenha muito cuidado para não dar a entender que você fez algo que, na verdade, ainda não foi feito. Para os resultados, explique não só os números, mas também como os mesmos devem ser interpretados, o significado e as implicações dos mesmos; vantagens, desvantagens, como compara com resultados de outros trabalhos.

Normalmente para um artigo que envolve a proposta de uma solução para um problema, uma ferramenta, etc.,  tanto o resumo quanto a introdução devem ter a seguinte estrutura: <i>contexto</i> (o ambiente, a situação, onde o problema aparece), <i>problema</i> (a dor sentida por um desenvolvedor), <i>solução</i> (a ferramenta, etc.), <i>avaliação</i> (como avaliamos se a solução resolve o problema), <i>principais resultados obtidos</i>. No resumo, o nível de abstração é maior, então são 2-3 linhas para cada item da estrutura. Na introdução, 1-2 parágrafos para cada item. 

A Seção de trabalhos relacionados não deve ser uma simples sequência de parágrafos de resumos de trabalhos relacionados. Tem que resumir sim, mas com a terminologia usada no seu artigo: se lá ele usa o termo X para um conceito, e você usa o termo Y para o mesmo conceito, quando resumindo o trabalho dele use Y. Além disso, principalmente, tem que contrastar, comparar, o que é feito no trabalho resumido com o que é feito no seu trabalho. Por exemplo, no texto entre aspas a seguir o que está em itálico é comparação, e o que não está é resumo: "Brun et al. [X] propose incorporating speculative analysis for early detection and prevention of conflicts. This way, they present Cristal, an assistive tool that compares remote and local individual collaborators' repositories in order to warn about possible code integration conflicts. To detect test conflicts, they evaluate their technique by analyzing three Java projects and rely on project tests, <i>which are often not enough for detecting interference as we explore here. 
The authors do not mitigate possible flaky tests in both studies, as we do in our study by executing the test suites multiple times.
The failed tests are not executed on the parent and base commits of the merge scenario, as we do here, which may result in false positives, as the failed test may occur due to the changes exclusively performed by one parent.</i>
These studies have also investigated ways in which conflicts can be prevented early, thereby minimizing their impact on productivity."

Se for preciso copiar alguma figura ou trecho, por menor que seja, de outro trabalho, deixe muito claro que você está fazendo isso, citando a referência e, no caso de trechos, colocando-os entre aspas. Esquecer de fazer isso é considerado  <i>plágio</i>. Até no caso de expressar a mesma ideia de outro artigo, com palavras diferentes, merece a citação e indicação explícita. No caso de cópia dos seus próprios artigos, pode-se copiar trechos dispensando o uso das aspas. Mas mesmo assim é preciso ter cuidado para não ser caracterizado como  <i>auto-plágio</i>: se for uma extensão de um artigo prévio, por exemplo, deixe isso claro, e explique precisamente o diferencial do novo artigo.   

Escreva a sua filiação em Português (Centro de Informática, Universidade Federal de Pernambuco) e sem abreviações, mesmo que o artigo seja em Inglês. Isso facilita a indexação de publicações da UFPE, e consequentemente seu melhor desempenho em rankings. Além disso, isso é exigido por alguns editais da UFPE para financiamento de viagens.

Se certifique que você realmente não fez nenhum <i>p-haking</i>, e coloque isto no seu texto: <i>We report how we determined our sample size, all data exclusions, all manipulations, and all measures in the study</i> (ver a [fonte](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2160588)).

Use como guia a [lista de tópicos da ACM Sigsoft](https://acmsigsoft.github.io/EmpiricalStandards/tools/) para ter certeza de que você vai cobrir no texto os principais pontos necessários para o tipo de estudo empírico que você está fazendo. Veja primeiro a opção de menu <i>Standards</i> e depois a opção <i>Tools</i>, para gerar a lista específica para o seu tipo de estudo.

#### Capriche no estilo de escrita

Use muitas tabelas, gráficos, figuras e exemplos de código fonte para explicar as principais ideias e resultados do seu trabalho. Uma figura ilustrando a ideia geral da sua solução, e outra ilustrando como a mesma foi avaliada, são essenciais e precisam ser extremamente caprichadas e dar uma boa ideia do que se trata seu trabalho; discuta-as bem com seu orientador. 

Leia com cuidado, e consulte sempre, <i>The Elements of Style</i> ([link 1](http://www.bartleby.com/141/) ou [link 2](http://www.crockford.com/wrrrld/style.html )). Escreva frases curtas; quebre frases longas em várias frases. Fica mais fácil de escrever e de ler. 

Primeiro mostre o exemplo concreto, e só depois a generalização.

Escreva no presente: in Section X we present (instead of will present); we first filter (instead of filtered) our sample, etc. Mais importante, seja consistente. 

Use maiúsculas para referenciar uma seção ou figura numerada (in Section X, in Figure Y), e minúsculas caso contrário (in this section, in the previously mentioned figure).

Leia dicas de escrita ([de Claire Le Goues](https://clairelegoues.com/2016/08/23/things-i-keep-repeating-about-writing/), de [
Philipp Leitner](https://philippleitner.medium.com/some-frequent-writing-tips-i-give-software-engineering-thesis-students-da2acab30381), e [do grupo de pesquisa Capra](https://capra.cs.cornell.edu/styleguide)) que casam bastante com o meu estilo (exceto a sugestão de usar "e.g." e "i.e."; por favor, evite).

Veja dicas para formatação de [tabelas](guide-tables.pdf) e [gráficos](https://johnwickerson.wordpress.com/2019/11/01/graphs-in-pl-papers/). Sobre essa referência de gráficos, o resumo é o seguinte: "<i>normalised data should usually be plotted on a logarithmic scale, and scatter plots can be easier to understand than bar charts</i>". Use [<i>raincloud plots</i>](https://wellcomeopenresearch.org/articles/4-63) ao invés de <i>box plots</i>, <i>bean plots</i> ou <i>violin plots</i>. Os [diagramas de Sankey](https://en.wikipedia.org/wiki/Sankey_diagram) podem ser uma boa opção para ilustrar como uma dada medida (por exemplo, falsos positivos) são quebradas em categorias. Alternativamente, ilustre como a Figura 4 [neste artigo]({{< relref "/publication/2020detecting_semantic_conflicts_via_automated_behavior_change_detection" >}}).
 
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

As anotações e comentários feitos pelo seu orientador no seu texto devem ser interpretadas não apenas como uma sugestão para melhorar um determinado trecho do texto, mas como uma lição a ser aprendida e usada em vários outros contextos (outras partes do texto, outros textos, etc.). Isso ajudará você a evitar cometer o mesmo erro de escrita ou de apresentação mais de uma vez.

Para facilitar a vida das pessoas (inclusive o seu orientador) que estiverem lhe ajudando com o artigo, ao fazer mudanças em uma versão lida e comentada por essas pessoas, destaque todas as mudanças realizadas utilizando um comando como <i>\newcommand{\rev}[1]{\textcolor{red}{#1}}</i> (ver [Marking Changed Text in Journal Revisions](https://medium.com/@xLeitix/marking-changed-text-in-journal-revisions-8583136a4738)). Assim, ao lerem uma próxima versão, essas pessoas poderão facilmente identificar o que foi modificado.

Após as pessoas terem revisado seu trabalho, e você ter feito os ajustes no texto, publique o seu artigo no [arXiv](https://arxiv.org). Em particular, tenha cuidado para referenciar corretamente os perfis dos seus co-autores no arXiv; veja [este](https://arxiv.org/abs/2310.02395) exemplo. Avise aos seus co-autores.

Verifique com cuidado a política de publicação associada ao veículo onde você quer publicar seu artigo. Na falta de uma política clara do veículo em questão, siga a [política da ACM](https://www.acm.org/publications/policies/new-acm-policy-on-authorship).

#### Agradecendo a quem lhe ajuda

É fundamental dar destaque para os financiadores e colaboradores nos artigos, apresentações, posters, software e produtos em geral.

Nos artigos, colocar algo como "For partially supporting this work, we would like to thank INES (National Software Engineering Institute) and the Brazilian research funding agencies CNPq (grant 309235/ 2021-9), FACEPE (grants IBPG-0546-1.03/15 and APQ/0388-1.03/14), and CAPES." Verificar os números atuais com seu orientador. É importante colocar também os números dos processos dos projetos do qual você obteve algum tipo de financiamento.

Agradecer aos membros do Software Productivity Group e, especificamente, a quem lhe ajudou (revisou seu artigo, implementou algo para você, indicou referências, fez perguntas importantes, deu uma idéia mesmo que você já tenha tido-a) ou deu dicas e sugestões para a melhoria do seu trabalho.
 