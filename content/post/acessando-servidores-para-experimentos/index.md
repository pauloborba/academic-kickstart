---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Acessando Servidores para Experimentos"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2026-06-16T17:03:26-03:00
lastmod: 2026-06-16T17:03:26-03:00
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

Para conectar aos servidores do INES, você deve estar conectado à rede do CIn. Para tanto, você deve usar o VPN do CIn se o acesso for de fora do CIn. Veja na [página da gerência de sistemas](http://helpdesk.cin.ufpe.br/) as instruções de como configurar a VPN. 

Os servidores são normalmente configurados para serem acessados com as inicias do CIn como login, mas são restritos para usuários autorizados. Para solicitar autorização, é necessário enviar email para o helpdesk do CIn, indicando que servidor (ver abaixo as opções) deseja acessar, e copiando o seu orientador (um professor associado ao INES) para ele dar o OK. 

Os servidores só têm o docker instalado, então todo o seu experimento tem que ser configurado para executar num container docker. Isso é importante também por questões de replicabilidade do seu experimento.

### Servidores com isolamento

Temos alguns servidores (uns mais novos e potentes, outros mais antigos) que são úteis para realização de experimentos com isolamento de outros usos da máquina, o que é essencial para medir tempo de execução, por exemplo. 

É preciso combinar com outros usuários se precisarmos de exclusividade de uso da máquina por um período. Em particular, é necessário reservar o experimento na [agenda dos servidores](https://calendar.google.com/calendar/embed?src=c_39787dd5697b747a51c757c0011d3acc9d97782e4dd2716f9986773df592eb06%40group.calendar.google.com&ctz=America%2FRecife). Veja mais informações abaixo.

Os servidores são chamados 

- inesserver1.cin.ufpe.br (Intel Xeon CPU X3440 @2.53GHz com 24GB de RAM), 
- inesserver2.cin.ufpe.br (Intel Xeon E31220 @3.10GHz com 32GB de RAM), 
- inesserver3.cin.ufpe.br (AMD EPYC 9254 @2.9GHz 24-Core 48 Threads, 64GB de RAM) e 
- gpu01.cin.ufpe.br (Intel Xeon CPU E5-2320 @2.10GHz 8-Cores 16 Threads, 32GB RAM, GPU NVIDIA GM204GL).   

### Cluster RAM

Se o seu experimento precisa de muita memória RAM, temos uma máquina com bastante memória; o hostname dela é cluster-node11.cin.ufpe.br (Ubuntu com processador Intel Xeon Gold 6338 e 2Tb de RAM). 


### Clusters GPU

Para uso intenso de GPUs, temos o cluster Apuana (ver como usa na página de [sistemas](http://helpdesk.cin.ufpe.br/)) e o cluster de um projeto que eu coordeno. Discuta comigo qual usar.

### Uso compartilhado dos servidores

Antes de iniciar a execução de qualquer experimento nos servidores, consulte a [agenda de uso do servidor](https://calendar.google.com/calendar/embed?src=c_39787dd5697b747a51c757c0011d3acc9d97782e4dd2716f9986773df592eb06%40group.calendar.google.com&ctz=America%2FRecife) para verificar se há algum agendamento de experimento para o mesmo período em que você pretende rodar o seu experimento.  

Mesmo que não tenha nenhum agendamento no período de interesse, após logar no servidor, verifique se há outros pesquisadores rodando experimentos. Use ferramentas como as seguintes:

- top, htop: para carga da máquina
- ps: para processos em execução
- nvidia-smi: para uso de GPU
- w ou who: para verificar quem está logado e possivelmente rodando experimentos
- docker ps -a: para verificar containers ativos, parados recentemente ou abandonados
- docker ps: para ver containers realmente em execução

Se alguém estiver utilizando a máquina, entre em contato com a pessoa antes para evitar interferências no experimento da pessoa, e pergunte se ela necessita de isolamento (como em experimentos com medição de tempo, curto prazo para a execução do experimento, etc.).
Caso ela precise de isolamento, confirme qual a previsão de término do experimento dela, e então decida se prefere esperar ou tentar outra máquina do grupo.
Ao ter certeza que a máquina está liberada para uso, e caso precise de isolamento, reserve o período do seu experimento na agenda do servidor. O título do evento deve conter o nome do servidor que será usado. 

*Ao criar containers e imagens do Docker para executar o seu experimento, use um nome identificável baseado no seu login do CIn.* Por exemplo: ldc_nomeDoContainer, ldc_nomeDaImagem. Isso reduz o risco de exclusões acidentais e facilita identificar quem está usando o quê. Containers e imagens que não seguirem essa recomendação podem ser eliminados sem aviso. 

#### Dicas gerais para uso dos servidores

Seguem dicas de Toni Maciel:

1. Para Login, usar algum cliente SSH e logar com: seulogincin@nomeservidor.cin.ufpe.br e digitar sua senha do CIn. Via terminal linux, por exemplo, faço o seguinte: ssh seulogincin@inesserver2.cin.ufpe.br

1. Para transferir arquivos pro servidor e visualizar os diretórios, usar alguma ferramenta como Filezilla, WinSCP ou SCP.
1. Tanto o ssh quanto o filezilla usam a porta de conexão "22" para acessá-los caso solicitado. 

Seguem dicas de Galileu Santos de Jesus: 

1. Para acessar a máquina a parte mais difícil é copiar os arquivos gerados. No Ubuntu, eu acesso via sftp:
    - Abra o gerenciador de arquivo e clique em outras conexões ou outras localizações;
    - Digite sftp://seulogincin@cluster-node11.cin.ufpe.br/;
    - Clique em conectar e coloque sua senha do e-mail. Pronto, agora você está dentro do servidor, podendo armazenar arquivos, copiar e colar na mão.
1. Comando úteis via terminal:
    - ssh seulogincin@cluster-node11.cin.ufpe.br, para conectar ao servidor (VPN deve está conectada);
    - Comandos docker importantes: docker stats, docker ps, docker exec -it ID_CONTAINER /bin/bash, docker cp ID_CONTAINER:/home/PATH PATH_COPY
1. Esses são os comandos que mais uso, conectar, copiar arquivos, acessar docker, copiar resultados.

Seguem dicas (checklist) de Matheus Barbosa:

1. Planeje a execução para minimizar interferências entre experimentos.
1. Considere o impacto de outros usuários ao realizar medições de desempenho.
1. Verifique previamente se possui autorização de acesso ao servidor desejado.
1. Utilize a VPN institucional sempre que estiver fora do CIn.
1. Documente o ambiente utilizado (hardware, sistema operacional e configurações).
1. Evite executar experimentos pesados sem verificar o uso atual da máquina.
1. Comunique-se com outros usuários quando precisar de períodos de execução exclusivos.
1. Sempre mantenha cópias de segurança dos resultados experimentais.
1. Utilize contêineres Docker sempre que possível para garantir reprodutibilidade dos experimentos
1. Monitorar contêineres: docker stats
1. Listar contêineres em execução: docker ps
1. Acessar um contêiner: docker exec -it ID_CONTAINER /bin/bash
1. Copiar arquivos de um contêiner: docker cp ID_CONTAINER:/home/PATH DESTINO_LOCAL


