#!/bin/bash

# Iniciando processo de configuração dos hosts
echo "Iniciando processo de configuração."

# Atualizando pacotes de sistema
apt update && apt upgrade -y

# Instalando pacotes necessarios
apt install -y apt-transport-https ca-certificates curl gnupg software-properties-common

# Definindo '1' para net brigde
echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf

# Desabilitando SWAP de memoria
swapoff -a

# Desabilitando firewall
ufw disable

# Atualizando configurações de sysctl para rede Kubernetes
cat >> /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

# Criando diretorio para Docker's GPG key
mkdir -p /etc/apt/keyrings

# Adicionando Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Printando informacoes de arquitetura
echo "Architecture: $(uname -m), Codename: $(lsb_release -cs)"

# Adicionando repositorio Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Instalando Docker
apt update && apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Adicioanando Docker group
groupadd docker

# Adicionando usuario ao grupo Docker
usermod -aG docker $USER

# Startando servico Docker
systemctl enable --now docker.service containerd.service

# Instalando Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Instalando rke
wget https://github.com/rancher/rke/releases/download/v1.5.6/rke_linux-arm64
mv rke_linux-arm64 /usr/local/bin/rke
chmod +x /usr/local/bin/rke
