# Homelab
> Configurando um Homelab do zero. Tudo que eu tenho é internet, um pc e um sonho. - Merguizo Gi, 2026

## Programas e Recursos
- [x] AWS EC2
- [x] Linux (Ubuntu)
- [ ] Docker
- [ ] Grafana
- [ ] Zabbix
- [ ] Jenkins
- [ ] Automatizar com Terraform

## Configuração de uma instância EC2
> Vamos configurar uma máquina Ubuntu _(freetier)_

1. Abrir o EC2 na AWS e executar uma nova instância
2. Configurações:
   - **Imagem de máquina da Amazon (AMI):** Ubuntu Server 24.04 LTS (HVM), SSD Volume Type _(freetier)_
   - **Arquitetura:** 64 bits (x86)
   - **Tipo de instância:** t3.micro _(freetier)_
   - **Par de chaves:** Criar novo par de chaves (`rsa` / `.pem`)
   - **Configurações de rede:** Criar grupo de segurança
   - **Armazenamento:** 1 x 8GiB gp3
