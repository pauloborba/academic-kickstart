---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Disponibilizando e divulgando resultados de pesquisa"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2024-01-02T17:29:26-03:00
lastmod: 2024-01-02T17:29:26-03:00
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
Antes de tudo, leia a política da ACM sobre [Result and Artefact Review and Badging](https://www.acm.org/publications/policies/artifact-review-and-badging-current), principalmente se houver dúvidas sobre os termos repetível, reproduzível, e replicável.

#### Disponibilização 

Antes de disponibilizar o material, verifique se seu estudo é repetível e reproduzível, e que todos os passos automatizáveis estão de fato automatizados.

Organize todo o material (scripts, programas, sistemas avaliados, datasets, entrevistas, etc.) e resultados em uma página ou repositório público (ver exemplos de "Replication package" na [minha lista de publicações]({{< ref "/publication/_index.md" >}})), de forma a permitir a reprodução ou replicação dos resultados obtidos. Boa documentação desse material é essencial para que a reprodução ou replicação seja possível sem esforços desnecessários. 

Crie um *container Docker* (ou similar) com todo o material, e a possibilidade de repetir o estudo com apenas um comando. Na preparação do *container*, importante especificar a versão exata do software (interpretadores, bibliotecas, etc.) necessário para executar o experimento, para que versões mais novas não sejam usadas no futuro e gerem resultados diferentes.

Após a submissão e aceitação do seu trabalho, coloque todo o material do artigo no [repositório de artigos](https://github.com/spgroup/papers) do seu grupo de pesquisa. Avise aos seus co-autores.

Estou assumindo que o seu artigo já está armazenado em um repositório público de preprints como o [arXiv](https://arxiv.org). Isso deve ser feito imediatamente após a submissão do artigo! Veja [Escrevendo seu trabalho]({{< relref "/post/escrevendo-seu-trabalho" >}}), em especial a Seção "Revisando o seu trabalho". Disponibilize a última versão publicada atualizando a entrada que você tinha criado no  [arXiv](https://arxiv.org).

Atualize as páginas web relevantes: a do grupo de pesquisa, a do projeto no qual você trabalha, e a sua pessoal. Avise aos seus co-autores.

Disponibilize o material necessário para replicar o estudo publicado em alguma plataforma de ciência aberta, como neste caso do [Health Watcher](https://doi.org/10.5281/zenodo.8081523), disponibilizado via [Zenodo](https://zenodo.org). 

Siga as dicas sobre divulgação de resultados e material de [Good Enough Practices in Scientific Computing](http://arxiv.org/pdf/1609.00037v1.pdf).


#### Divulgação 

Depois de ter seguido as orientações acima, siga as orientações abaixo.

Divulgue com clareza e abrangência cada resultado (artigo, tese, ferramenta, biblioteca, dataset, etc.) de pesquisa gerado, para que mais pessoas possam ter acesso, conhecer o seu trabalho, construir em cima dele, e dar feedback.

Divulgue nas redes sociais (ver [Participando de uma comunidade de pesquisa]({{< relref "/post/participando-comunidade-pesquisa" >}})), e peça para o seu orientador e outros co-autores fazerem o mesmo.

Divulgue em sites de notícias como [Hacker News](https://news.ycombinator.com/news) e [Reddit](https://www.reddit.com/).

Envie mensagens para as listas do grupo de pesquisa (ver [Chegando ao CIn]({{< relref "/post/chegando-no-cin-spg" >}})), os autores dos principais trabalhos relacionados ao seu, e as pessoas que citaram seus trabalhos anteriores relacionados (no Google Scholar, basta clicar nos links "Cited by" relacionados aos seus artigos para descobrir quem citou eles).
