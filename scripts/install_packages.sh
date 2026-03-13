#!/bin/bash

echo "Bem-vindo ao script de instalação!"

# Atualizacao do sistema
read -p "Primeiramente, precisamos atualizar o sistema, podemos prosseguir [S/N]? " atualizar
if [[ "$atualizar" == "S" || "$atualizar" == "s" ]]; then
    echo "Atualizando o sistema..."
    apt update -y && apt upgrade -y
elif [[ "$atualizar" == "N" || "$atualizar" == "n" ]]; then
    echo "Operação cancelada pelo usuário."
    exit 0
else
    echo "Reposta inválida. Por favor, responda com 'S' ou 'N'."
    exit 1
fi

# Instação do pacote dialog
read -p "Precisamos também instalar o pacote dialog, podemos prosseguir? [S/N]" requisito
if [[ "$requisito" == "S" || "$requisito" == "s" ]]; then
    echo "Instalando o pacote dialog"
    apt-get install -y dialog
elif [[ "$requisito" == "N" || "$requisito" == "n" ]]; then
    echo "Operação cancelada pelo usuário."
    exit 0
else
    echo "Reposta inválida. Por favor, responda com 'S' ou 'N'."
    exit 1
fi

# Define o arquivo temporário para salvar as escolhas
CHOICES=$(mktemp)

# Chama o dialog para o checklist
dialog --separate-output --checklist "Selecione as opcoes (Espaco para marcar, Enter para confirmar):" 15 50 5 \
    "1" "Instalar git" off \
    "2" "Instalar nano" on \
    "3" "Instalar vim" off \
    "4" "Instalar net-tools" off 2> $CHOICES

# Lê as opções selecionadas
while read choice; do
    case $choice in
        1) echo "Git selecionado" && apt install -y git;;
        2) echo "nano selecionado" && apt install -y nano;;
        3) echo "vim selecionado" && apt install -y vim;;
        4) echo "net-tools selecionado" && apt install -y net-tools;;
    esac
done < $CHOICES

# Remove o arquivo temporário
rm $CHOICES
