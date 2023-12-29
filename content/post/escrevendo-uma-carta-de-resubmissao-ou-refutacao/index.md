---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Escrevendo uma carta de resubmissão ou refutação do seu trabalho"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2023-12-29T10:55:16-03:00
lastmod: 2023-12-29T10:55:16-03:00
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

### Resubmissão

Antes de tudo, leia [How to Revise a Research Paper](https://dl.acm.org/citation.cfm?id=2904683) e [How to Write an Effective “Response to Reviewers” Letter](http://cs.gmu.edu/~offutt/stvr/26-3-May2016.html). 

É essencial ter empatia e facilitar a vida do revisor. Ele já leu o artigo uma vez, e provavelmente não vai ter tempo de ler o artigo todo de novo. Mesmo que ele tenha tempo, ele vai querer facilmente verificar se as mudanças solicitadas por ele foram realmente feitas. Assim é importante destacar todas as mudanças realizadas utilizando um comando como \newcommand{\rev}[1]{\textcolor{blue}{#1}} (ver [Marking Changed Text in Journal Revisions](https://medium.com/@xLeitix/marking-changed-text-in-journal-revisions-8583136a4738), que também sugere um comando para marcar figuras modificadas).

De uma forma geral, a versão final do artigo, ou a versão a ser submetida para uma segunda rodada de revisão, deve ser o resultado de aplicar as recomendações dos revisores ao artigo original. Se os revisores não pediram para alterar nada sobre uma dada parte do artigo original, você não deveria alterar essa parte (a menos de pequenos ajustes de ortografia e sintaxe), muito menos tirar a mesma (a menos que eles tenham solicitado uma redução no tamanho do artigo), nem acrescentar partes novas que não foram solicitadas pelos revisores. É como se 

> versãoFinal = versãoOriginal + mudançasSolicitadas 

ao invés de 

> versãoFinal = versãoOriginal + mudançasSolicitadas + melhoriasQueOAutorNãoTeveTempoDeFazerAntesDaPrimeiraSubmissão.

Responda explicitamente todas as perguntas e comentários. Na carta e no texto do trabalho! 

Para cada resposta escrita na carta, referencie de forma precisa (por exemplo, "Veja Parágrafo X da Seção Y", "Adicionamos essa explicação logo no início da Seção Z", etc.) que partes do texto foram modificadas para contemplar a resposta à pergunta ou ao comentário feito pelo revisor. 

Inclua na carta as respostas logo após a pergunta ou comentário feito pelo revisor. Ou seja, para escrever a carta, simplesmente cole as revisões e adicione as suas respostas com uma cor diferente entre as perguntas ou comentários feitos pelo revisor.

Os comentários mais simples indicando erros de escrita, etc. não precisam ser respondidos individualmente. Podem ser respondidos em conjunto, assim: "We have fixed all typos and minor issues pointed out by the reviewer".

Leia também as dicas para refutação a seguir!

### Refutação

Antes de tudo, leia [Patterns for writing good rebuttals](https://andreas-zeller.info/2012/10/01/patterns-for-writing-good-rebuttals.html).

Responda explicitamente todas as perguntas. As mais importantes, isto é, mais determinantes para a aceitação do artigo devem aparecer primeiro (na seção da revisão relativa a cada revisor, claro).

Responda as perguntas de forma extremamente direta, usando as palavras do próprio revisor, para evitar problemas na comunicação. Por exemplo, se o revisor escreveu 

> "beyond the analysis times that are reported (which is great), what is the overhead of the approach compared to simply building the project?" 

responda 

> "The overhead of our approach compared to simply building the project ranges from 12% in the fastest scenario to analyze to 97% in the slowest scenario, with an overhead of 51% in a scenario close to the median analysis time.". 

Note que para chegar na resposta acima, e nas a seguir, eu simplesmente copiei o texto da pergunta e fiz os ajustes em cima dele para reduzir a chance de não responder diretamente ou responder com vocabulário que o revisor possa não entender.  

Se fizer sentido para reforçar o argumento, cite exemplos adicionais ou existentes no artigo original, mas com cuidado para não parecer como uma crítica ao revisor. Por exemplo, se o revisor escreveu 

> "Can you clarify whether your proposed approach is restricted to method invocations?" ou "I noticed that in all examples in this paper, developers' operations are limited to method invocations. This raises questions about whether this is a limitation of your approach. Can your technique be applied to merging scenarios that involve operations on other types of statements?"

responda 

> "The proposed approach is not restricted to method invocations. It works for any Java statement or expression. For example, if the yellow and green method calls in Fig 1 could be inlined as assignments, the analysis would detect interference. In the following [dataset example](https://anonymous.4open.science/r/dataset-18C9/voldemort/b30fdfebe30c9b6e37b9fbc3fec0ff74cd19f997/source/voldemort/VoldemortClientShell/merge.java) left modified line 123, while right modified lines 127 and 128. There is a Direct Flow from line 123 to 127.".

Se fizer sentido para reforçar o argumento, cite trechos do artigo original, mas com cuidado para não parecer como uma crítica ao revisor, por exemplo dizendo que pode melhorar a explicação. Por exemplo, se o revisor escreveu 

> "Lines 400-402: Isn't this a big limitation for languages like Java which tend to be very verbose?"

responda

> "Line marking is a limitation (736-742), but this only occurred in 3 out of the 99 units (423-424). An industrial ready implementation of our approach would have to rely on better mechanisms for assigning lines of source code to byte code instructions, and avoid issues such as the one reported in lines 400-402 and questioned in the review.".

Se a pergunta é

> "However, based on the sampling methodology, there is no reason to believe that this set of 99 merge commits is a representative random sample of all merge commits."

responda 

> "Obtaining a representative random sample of all merge commits would be challenging in the context of semantic conflicts, and we acknowledge that in lines 744-749. We could further elaborate on that. We also emphasize that we curate this dataset from datasets available in the literature, and it excels existing ones in terms of size and labeling. Our decision to curate a dataset with merge scenarios used in the literature seems adequate, since it might avoid possible bias that could benefit the approach we explore in our paper."

Identifique erros na revisão claramente, de forma direta. Se o revisor escreveu

> "The novel contribution of this article is to evaluate an off-the-shelf static analysis in the context of this problem"

na refutação escreva

> "Except for PDG, our static analysis are not off-the-shelf.".

Se o revisor escreveu

> "When (re)-reviewing related work, I noticed that there was tremendous similarity between the background section of this article and of [Da Silva 2020]. A quick skim also showed that the examples match between the two articles. I found this somewhat troublesome, and would have hoped that this article either more directly extended that work, or, at least, provided different examples." 

na refutação escreva

> "Our motivating example is inspired by the example of Da Silva 2020; we adapted it to illustrate a control dependence, adding a conditional, including new method calls, etc. All the examples are variations of the same theme, to simplify understanding. Fig 2 is more closely related to the example of Da Silva, and we added a reference to the source in the Figure caption. Da Silva 2020 uses testing as a technique for conflict detection; we adopt an alternative technique, static analysis".