---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Usando IA (LLMs e Agentes) para Pesquisa"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2025-11-20T10:17:51-03:00
lastmod: 2025-11-20T10:17:51-03:00
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
Os LLMs e Agentes (como o do GitHub Copilot) avançaram muito e atingiram um ponto em que podem ser úteis para algumas atividades de pesquisa, amplificando nosso potencial. 

Podem ser úteis mas não sem levar a retrabalho ou problemas de qualidade, é importante estar atento para isso e não se deixar levar pelo marketing dos fornecedores de serviços de IA. Veja este [episódio de podcast]({{< relref "/talk/ia-para-es-e-es-para-ia" >}}) ou esta [palestra]({{< relref "/talk/mitos-e-realidades-desenvolvimento-sw-ia" >}}). 

Uma atividade como a de revisão final de um artigo que está prestes a ser submetido, por exemplo, pode identificar algum detalhe que você e seu orientador deixaram passar. Este [post](https://www.linkedin.com/posts/prof-todd-austin_research-publication-aitools-activity-7397001188879036416-EeS9?utm_source=share&utm_medium=member_android&rcm=ACoAAALmP2QBSciTVA5NWvJzUHVX5vQEDIY0yew), por exemplo, sugere o seguinte <i>prompt</i>: "Please review my near-final draft of a research paper. Please 1) proofread the paper, 2) fact check the contents, 3) perform consistency checking of terminology, Figure #'s, etc., 4) look for any logical fallacies, 5) find anywhere I should add or remove citations, 6) remove any em-dashes from the prose, and 7) list any other improvements you see as beneficial. Please list the results below as IMPORTANT or SUGGESTED changes". Eu gosto de "em-dashes", então eu retiraria essa parte do <i>prompt</i>, mas a ideia do autor é só dar um exemplo do que você poderia pedir a um LLM para fazer.

Minha expectativa é que esse tipo de uso gere algumas sugestões boas e outras ruins, e talvez fazer isso para todo o arquivo de uma vez traga piores resultados do que fazendo por partes. Mas se você passa batido fácil em algum desses problemas, e não consegue ser mais atento, pode valer a pena. Isso, claro, se você, como assumido de todo pesquisador, tiver apurado <b>senso crítico</b> para discernir o que de fato é um ponto fraco (e você e seu orientador passaram batido) do que é pura aleatoriedade da IA (LLMs, agentes, etc.). Por fim, você tem que revisar com cuidado, ponto a ponto, o que for sugerido pela IA. 

Em geral, você só deve usar IA para atividades que você tenha um bom oráculo (como conhecimento sólido sobre o assunto, um compilador, uma forte suite de testes, um provador de teoremas, etc.) para avaliar se o que ela gera faz sentido, se precisa de ajuste, ou se seria melhor descartar. Se não tiver, é fortemente recomendado <b>não</b> usar IA para essa atividade. Não seria um uso responsável.

Para um pesquisador de ES, gerar código com IA também é tranquilo, já que temos os compiladores, testes, analisadores estáticos e dinâmicos, e, principalmente, a sua revisão criteriosa de **todo** o código gerado. Fazendo isso, você também está assumindo **total** responsabilidade sobre o código gerado, como deve ser.

Já no caso de uso da IA para revisar ou resumir um artigo que você não leu, escrito por outra pessoa, você não tem nenhum oráculo para verificar o que ela gera como resumo ou revisão, a menos que <b>você</b> depois leia o artigo com cuidado. Para fazer esse uso de IA sem ler o artigo é preciso muita <b>fé</b> numa tecnologia probabilística, e <b>coragem</b> para arcar com as consequências do percentual (5%? 10%? 20%? 30%) que vai ter de erro e imprecisão no que é gerado pela IA e que você não vai contestar; vai provavelmente absorver e passar a ideia errada adiante. Isso não é considerado um uso responsável. 

Em resumo, se você não entender **profundamente** algo que a IA gerou, descarte ou invista tempo suficiente para estudar e entender profundamente o que foi gerado. Quase sempre a IA é muito convincente e pode facilmente lhe induzir ao erro se você não tiver conhecimento mais sólido sobre o assunto, a formalização, a linguagem, o framework, etc. Mais importante de tudo, o seu orientador é o **seu** orientador, não orientador da IA! Ele não pode investir o tempo dele para corrigir ou direcionar os trabalhos da IA.

No mundo acadêmico, esse e outros usos não responsáveis da IA podem levar a sérias consequências, com prejuízos para a sua formação, carreira e a conclusão do seu curso.

Assim, usem com ética e muito cuidado! Na dúvida, consulte seu orientador. 

Por fim, em toda reunião, apresentação, entrega, etc. informe explicitamente ao seu orientador para que e como você usou LLMs e agentes.

Seguem alguns problemas que eu já tive com o uso de IA e que podem lhe ajudar a entender melhor as recomendações acima: 

- Um aluno repassando direto para a IA meus questionamentos e solicitações de atividades, e repassando direto para mim as respostas da IA. Tive que dizer para o aluno que isso não era ético e que eu não poderia orientar ninguém dessa forma.
- Um aluno entregando uma nova versão de um artigo com várias referências duplicadas (com diferenças mínimas na formatação dos nomes dos autores ou do nome do evento), quando na versão anterior as referências estavam perfeitas. Obviamente o aluno não prestou atenção nas minhas orientações e não revisou com cuidado as mudanças feitas pela IA. Se eu não tivesse notado, isso levaria à rejeição automática do artigo e a abertura de processo para banimento dos autores do evento ou do periódico para onde o artigo fosse submetido.
- A IA sugeriu adicionar uma formalização matemática para especificar melhor o que foi dito em um parágrafo do artigo. O aluno, mesmo sem ter uma maior base em formalizações do tipo, aceitou a sugestão da IA, mas a formalização estava errada! Estava quase certa, mas errada, e o aluno caiu na explicação convincente da IA porque não tinha entendimento profundo. Se eu não detecto o erro a tempo, a gente iria passar vergonha por o artigo ter um erro básico. O artigo estava perfeito, a IA ajudou a introduzir um problema, com uma proposta atrativa mas errada. 
- Um artigo foi aceito, mas um dos revisores perguntou na revisão se a gente tinha uma prova matemática de uma determinada propriedade. Ao invés de responder que não tinha mas que iria trabalhar no futuro, o aluno repassou a pergunta do revisor para a IA, que prontamente gerou uma prova convincente da propriedade, usando um teorema famoso de combinatória. O aluno ficou convencido da elegante prova mesmo sem ter entendimento profundo sobre provas matemáticas. O problema é que a prova estava errada! O aluno levou algumas semanas para entender porque estava errada, depois de eu insistir que ela estava provavelmente errada mas que eu não teria tempo para entender e mostrar o erro, e que isso era tarefa que o aluno teria que realizar até para entender melhor toda a situação. 
- Um aluno pediu para a AI gerar um programa para realizar uma tarefa de análise de código bem estabelecida na literatura. O programa gerado usava uma técnica primitiva, com várias limitações, que realiza a tarefa mas com baixa precisão. O aluno não tinha ideia das limitações porque não conhecia a literatura, nem identificou as limitações, confiando no resultado da IA. Eu expliquei para o aluno porque usar a técnica estabelecida. Ele perguntou a IA se a minha recomendação fazia sentido. A IA disse que não, com base em explicações frágeis que seriam facilmente detectadas por uma pessoa com apurado senso crítico ou que não confiasse cegamente na IA. Sem usar a IA dessa forma, com perguntas para as quais você não sabe a resposta nem investe tempo para verificá-las, esse senso crítico pode ser construído aos poucos, com base em conhecimento e discussões válidas com um bom orientador. Usando a IA dessa forma, esse senso crítico dificilmente vai ser construído.
- Alunos enviando emails, slides ou documentos gerados por IA de forma inadequada, sem o devido direcionamento, e sem revisão significativa. Antes dos LLMs, quando um aluno enviava um email detalhado, trazia bastante código, apresentava um conjunto significativo de slides, ou trazia uma boa quantidade de texto, a chance dele estar fazendo um bom trabalho era alta (pense 99%), mas havia ainda um pequeno risco dele estar embustando. Em geral, o aluno impressionava positivamente dessa forma. Isso mudou completamente! Hoje, quando o aluno entrega algo na linha discutida acima em um curto período de tempo, a chance dele ter usado IA de forma inadequada e não responsável, e estar entregando sujeira ("AI slop"), é altíssima (pense 99.9%), mas ainda há uma pequena chance dele não estar embustando. Essa pequena chance normalmente desaparece ao você analisar um trecho desse material, ou pedir para ele explicar o que entregou. O aluno vai deixar uma péssima impressão, não tenha dúvidas. Para mim, como orientador ou professor, isso é extremamente frustrante, e deixa um sentimento de falta de respeito comigo e com o meu tempo. Eu não tenho tempo para orientar o LLM, muito menos para revisar a quantidade absurda de redundância e erros gerados por ele quando usado de forma inadequada e sem revisão rigorosa. Também não tenho tempo para lidar com a falta de objetividade, propósito e contexto nas criações dele que não sejam substancialmente e rigorosamente revisadas pelo aluno. Por favor, não usem LLMs para gerar apresentações; vocês não têm experiência suficiente ainda com apresentações para fazer um bom trabalho com isso; LLM agora só vai lhe atrapalhar com esse tipo de tarefa, e você não vai absorver e digerir o conhecimento adequadamente, nem construir uma narrativa madura e sólida. Investir tempo na preparação da apresentação ajuda em tudo isso. 
