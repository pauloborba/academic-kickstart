---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Chegando ao CIn"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2024-01-02T10:06:19-03:00
lastmod: 2024-01-02T10:06:19-03:00
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
Este artigo é direcionado para quem vai fazer iniciação científica, mestrado, doutorado ou pós-doutorado no [CIn](http://www.cin.ufpe.br/), especialmente no [SPG](http://www.cin.ufpe.br/spg), e sob a minha orientação! No entanto, algumas das informações podem servir para outras pessoas que estejam chegando ao CIn para trabalhar.

### Antes de tudo

Me passe seu número de telefone e peça o meu.

Marque um horário comigo para passar na minha sala e eu lhe mostrar o laboratório do grupo de pesquisa e te apresentar às outras pessoas do grupo.

Me informe se quer participar do grupo de WhatsApp (opcional, mas recomendado se você não tiver objeções, normalmente tem poucas mensagens também).

Para as recomendações a seguir, melhor só seguir após ter a sua conta do CIn. Antes da matrícula, você deve receber informações da secretaria de pós-graduação sobre sua conta, email, crachá, etc.

Me envie um email solicitando o convite para o grupo do [Slack](https://spg-ufpe.slack.com), onde a comunicação de trabalho, não presencial, realmente acontece. 

Assine as listas de email [spg-l](https://groups.google.com/a/cin.ufpe.br/g/spg-l) e [labes-l](https://groups.google.com/a/cin.ufpe.br/g/labes-l); ambas têm poucas mensagens, normalmente sobre congressos, escolas de verão, artigos, e uso do laboratório do INES). 

Assine também a lista do [GENTeS](https://groups.google.com/a/cin.ufpe.br/g/gente), o nosso grupo de estudo; os anúncios de reuniões e seminários do grupo aparecem aí.  

Todos esse canais, exceto a lista do GENTeS, podem ser usados para tirar dúvidas de moradia, transporte, etc. aqui em Recife.

Para ter acesso ao laboratório do INES com o seu crachá, envie email para o helpdesk do CIn, me copiando para eu dar o OK. Se você ainda não sabe o que é o helpdesk do CIn, veja a seguir!

Crie um site pessoal minimamente organizado no domínio do CIn, e me passe o endereço, por favor. Pode ser bem básico, mas, pelo menos na área de computação, é essencial que autores de artigos tenham essa presença. Como você certamente estará envolvido na autoria de artigos, melhor já ter logo o seu.


### Conhecendo o CIn 

Assumindo que você já se familiarizou com os sites do CIn e do SPG (ver acima!), é bom também saber os [sites dos vários setores do CIn](https://diretoria.cin.ufpe.br/perguntas-frequentes#h.14rqvo9yjppo), já que eles vão trazer informações mais operacionais e internas (incluindo FAQs) para quem estuda ou trabalha no CIn, e que podem ser difíceis de encontrar pelo site principal externo. Você vai precisar com mais frequência das FAQs dos setores de [sistemas](http://helpdesk.cin.ufpe.br/) e [infraestrutura](http://infraestrutura.cin.ufpe.br/).


### Planejando disciplinas da pós-graduação

Se você está chegando para o mestrado ou doutorado, leia o regimento da pós! É importante para saber exatamente quantas disciplinas você terá que cursar, quais podem ser dispensadas, etc. Essa regras sempre mudam e eu nunca consigo lembrar dos detalhes das mesmas.

Leia e me procure para fecharmos o planejamento das disciplinas. Se você vai fazer o curso com dedicação exclusiva, ou com pouca carga de trabalho, o ideal seria cursar logo 3 ou 4 disciplinas no primeiro semestre, para que no segundo semestre a gente já tenha um bom tempo para se dedicar à pesquisa da tese. Uma das disciplinas do segundo semestre seria Trabalho Individual, justamente para começarmos a trabalhar na tese. Seminários também poderia ficar para o segundo semestre se você for cursar 4 disciplinas no primeiro. Se você vai fazer o curso sem dedicação exclusiva, uma boa opção pode ser começar com duas disciplinas, para se adaptar aos poucos ao ritmo do curso.

A princípio, eu sugiro que os meus alunos cursem as seguintes disciplinas:

1. As que eu ofereço na graduação e pós-graduação
1. Paradigmas de Linguagens de Programação ou similar
1. Métodos de Pesquisa Empírica ou similar

Mas, como isso depende muito da formação e interesses do aluno, se tiver alguma outra disciplina que você tenha interesse ou necessidade em cursar, podemos discutir sem problema. É só me contactar via chat.

Em particular, é essencial que você adquira uma boa base em Engenharia de Software (assista aos vídeos de [Introduction to Software and Systems Engineering]({{< relref "/#courses" >}}), exceto os mais tecnológicos sobre SaaS) e em Métodos de Pesquisa (veja, nos cursos de [Bogdan Vasilescu](https://github.com/bvasiles/empirical-methods?s=03) e [Alexander Serebrenik](https://www.youtube.com/channel/UCUeRK8nJKyj_i_Yz81eHa8g/videos), pelo menos as aulas relacionadas aos métodos de pesquisa que você vai usar no seu trabalho). 

Se você não tiver conhecimentos práticos sobre Linux, shells, transformação de dados, depuração e profiling, e segurança faça este curso: [The Missing Semester of Your CS Education](https://missing.csail.mit.edu). Para complementar a parte de Linux, veja os 5 primeiros tópicos do [meu curso de UNIX](https://www.cin.ufpe.br/~phmb/sysadm/programa.html), apesar de ser bem antigo! 


### Acessando os servidores para experimentos

Para conectar aos servidores, você deve estar conectado à rede do CIn. Para tanto, você deve usar o VPN do CIn se o acesso for de fora do CIn. Veja na [página da gerência de  sistemas](http://helpdesk.cin.ufpe.br/) as instruções de como configurar a VPN. 

Os servidores são normalmente configurados para serem acessados com as inicias do CIn como login, mas são restrita para usuários autorizados. Para solicitar autorização, é necessário enviar email para o helpdesk do CIn, indicando que servidor (ver abaixo as opções) deseja acessar, e me copiando para eu dar o OK. 


##### Servidores com isolamento

Temos alguns servidores menos potentes mas que são úteis para realização de experimentos com isolamento de outros usos da máquina, o que é essencial para medir tempo de execução, por exemplo. 

Os servidores são chamados inesserver1.cin.ufpe.br, inesserver2.cin.ufpe.br, e gpu01.cin.ufpe.br. Temos também toritama, que é usado apenas para a wiki do grupo.  

Seguem dicas de Toni Maciel:

1. Para Login, usar algum cliente SSH e logar com: login@nomeservidor.cin.ufpe.br e digitar sua senha do CIn. Via terminal linux, por exemplo, faço o seguinte: ssh meulogincin@inesserver2.cin.ufpe.br

1. Para transferir arquivos pro servidor e visualizar os diretórios, usar alguma ferramenta como Filezilla.
1. Tanto o ssh quanto o filezilla usam a porta de conexão "22" para acessá-los caso solicitado. 

##### Cluster RAM

Se o seu experimento precisa de muita memória RAM, temos uma máquina com bastante memória; o hostname dela é cluster-node11.cin.ufpe.br. 

Ela só tem o docker instalado, então todo o seu experimento tem que ser configurado para executar num container docker. 

Temos que ter também bastante cuidado com medições de tempo, etc., e combinar com outros usuários se precisarmos de exclusividade de uso da máquina por um período.

Seguem dicas de Galileu Santos de Jesus: 

1. Para acessar a máquina a parte mais difícil é copiar os arquivos gerados. No Ubuntu, eu acesso via sftp:
    - Abra o gerenciador de arquivo e clique em outras conexões;
    - Digite sftp://gsj@cluster-node11.cin.ufpe.br/, onde gsj é o login do seu email;
    - Clique em conectar e coloque sua senha do e-mail. Pronto, agora você está dentro do servidor, podendo armazenar arquivos, copiar e colar na mão.
1. Comando úteis via terminal:
    - ssh gsj@cluster-node11.cin.ufpe.br, para conectar ao servidor (VPN deve está conectada), onde gsj é o do seu email;
    - Comandos docker importantes: docker stats, docker ps, docker exec -it ID_CONTAINER /bin/bash, docker cp ID_CONTAINER:/home/PATH PATH_COPY
1. Esses são os comandos que mais uso, conectar, copiar arquivos, acessar docker, copiar resultados.

##### Cluster GPU

Para uso intenso de GPUs, temos o cluster Apuana (ver como usa na página de [sistemas](http://helpdesk.cin.ufpe.br/)) e o cluster de um projeto que eu coordeno. Discuta comigo qual usar.

