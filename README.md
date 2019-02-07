# ropebox :dragon:

### O que é?<br>
**Ropebox** é um simples gerenciador de tarefas escrito em Shell Bash.

## Como Surgiu?

Sempre mantive minhas tarefas muito mal organizadas, arquivos de texto pra cá, arquivos de texto pra lá!! Com o tempo as coisas ficam confusas deste jeito, acabava perdendo arquivos e percebi que perdia mais tempo removendo arquivos de texto espalhados em meu sistema do que criando tarefas em si.<br>
Pesquisei por muito tempo por gerenciadores de tarefas simples, alguns me atenderam muito bem, porém todos apresentam algo comum COMPLEXIDADE. Muitos fazem mais do que é para fazer o que acaba deixando o objetivo de lado e a complexidade toma conta.<br>
<br>
Foi ai que o projeto Ropebox surgiu, um simples programa feito em Shell Bash que tentar ser o mais transparente, simples e direto possível! Ele é projetado para ser extremamente rápido e manter somente o básico para o seu funcionamento: Adicionar, Remover, Procurar, Listar e Editar suas tarefas.<br>
Todo o esquema é feito em arquivos de texto plano/text-plain e fica armazenado de uma forma transparente no diretório ropebox/task.<br>
Para editar suas tarefas o ropebox utiliza o seu editor favorito para fazer esta função! Na instalação você pode selecionar o que mais você gosta!<br>

## Requisitos

**Bash** >= 4<br>
**wget**<br>


## Instalação

Faça o Download e descompacte com o comando tar:<br>

$ tar xvf master.tar.gz<br>
<br>
Após fazer a descompactação execute o script install.sh e siga as instruções guiadas na tela.<br>
<br>
$ ./install.sh<br>
<br>
O instalador irá pedir para você qual o editor você deseja utilizar, esta etapa precisa ser definida para você editar as suas tarefas. Caso você defina como nenhum o editor padrão será o nano.<br>
Caso você deseje alterar posteriormente edite a variável $my_editor presente no arquivo ropebox.conf.<br>

## Comandos

O Ropebox funciona de uma maneira bem simples, existem as teclas de atalho e as longas, abaixo todos os comandos disponíveis.<br>
<br>

    + Adiciona uma nova tarefa.
    - Remove uma tarefa.
    -a Remove todas tarefas disponíveis.
    @ Edita uma tarefa.
    !a Listagem de todas tarefas disponiveis.
    !al Listagem de todas tarefas em modo coluna
    !s Procura por uma determinada String/texto nas tarefas
    update Atualiza o ropebox atráves da internet, direto da fonte.
    ? ou help - Exibe toda ajuda do programa.
    q ou exit - Sair do Ropebox.

## Página do Projeto

http://slackjeff.com.br/programas/ropebox
