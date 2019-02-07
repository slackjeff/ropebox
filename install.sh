#!/usr/bin/env bash
#==============HEADER========================================================|
#Instalador RopeBox
#============================================================================|

# É root?
[ "$UID" = "0" ] && { echo "Root não é permitido."; exit 1 ;}

directory_task="${HOME}/ropebox"

# Arquivos que está dentro do diretorio ropebox
# especificar aqui.
first_archives=(
   'ropebox'
   'ropebox.conf'
   'changelog.txt'
)

# Editores de texto via cli.
editors=(
   'vi'
   'vim'
   'nano'
   'joe'
   'pico'
   'mcedit'
   'emacs'
)

# Criando diretorios necessários para execução
# basica do programa.
if [ ! -d "$directory_task" ]; then
   mkdir -p "${directory_task}/task/" || { echo "Erro, nao foi possivel criar diretorio 'ropebox'. Abortando."; exit 1 ;}
fi
printf 'Criação do diretorio ropebox....... %-10s[OK]\n'

# Fornecendo permissão de execução para ropebox.
chmod +x ${first_archives[0]} || { echo "Erro, não foi possivel dar permissão de execução para ${first_archives[0]}" ;}
printf "Permissão bem sucedida para ${first_archives[0]}.... %-10s[OK]\n\n"

# Qual editor o usuário vai utilizar?
while :; do
cat <<EOF
=============> Configuração do Editor
Informe qual o seu editor favorito!
O editor que você selecionar será utilizado para editar as suas tarefas.
Caso você selecione nenhum, por padrão o editor nano será utilizado.
Você pode querer editar posteriormente o arquivo de configuração: ${first_archives[1]}

1) vi
2) vim
3) nano
4) joe
5) pico
6) mcedit
7) emacs
8) nenhum

EOF
   read -p 'Escolha>>> ' editor
   case $editor in
      1) sed -i "s/my_editor=.*/my_editor=\'${editors[0]}\'/" "${first_archives[1]}"; break    ;;
      2) sed -i "s/my_editor=.*/my_editor=\'${editors[1]}\'/" "${first_archives[1]}"; break    ;;
      3) sed -i "s/my_editor=.*/my_editor=\'${editors[2]}\'/" "${first_archives[1]}"; break    ;;
      4) sed -i "s/my_editor=.*/my_editor=\'${editors[3]}\'/" "${first_archives[1]}"; break    ;;
      5) sed -i "s/my_editor=.*/my_editor=\'${editors[4]}\'/" "${first_archives[1]}"; break    ;;
      6) sed -i "s/my_editor=.*/my_editor=\'${editors[5]}\'/" "${first_archives[1]}"; break    ;;
      7) sed -i "s/my_editor=.*/my_editor=\'${editors[6]}\'/" "${first_archives[1]}"; break    ;;
      8) sed -i "s/my_editor=.*/my_editor=\'${editors[2]}\'/" "${first_archives[1]}"; break    ;;
      *) echo "Opção Inválida!"                                                     ; continue ;;
   esac
done

# Copiando todos arquivos para diretorio ropebox
# no home do usuário
for archive in "${first_archives[@]}"; do
   cp "$archive" "${HOME}/ropebox/" || { echo "Erro, arquivo $archive não pode ser movido, Abortando."; exit 1 ;}
done
printf "Arquivos '${first_archives[*]}' copiados....... %-10s[OK]\n\n" 

# Criando alias do ropebox
# para ser chamado de qualquer lugar, a qualquer momento.
if [ -e "${HOME}/.bashrc" ] && [ -w "${HOME}/.bashrc" ]; then
   # ropebox já existe como alias?
   if ! grep -q "ropebox=.*ropebox" "${HOME}/.bashrc"; then
      cat >> "${HOME}/.bashrc" <<EOF

# Chamada do ropebox
alias ropebox="${directory_task}/ropebox"
EOF
   fi
   printf "Chamada em .bashrc....... %-20s[OK]\n\n" 
else
   > "${HOME}/.bashrc" # Não existe? criamos.
   cat >> "${HOME}/.bashrc" <<EOF

# Chamada do ropebox
alias ropebox="${directory_task}/ropebox"
EOF
fi

cat <<EOF
----> Instalação Concluída com Sucesso!
Ropebox está em seu home, para execução você pode navegar até /home/SeuUsuario/ropebox e executar 
./ropebox ou bash ropebox

Ou se preferir faça a chamada ropebox na linha de comando...
EOF

