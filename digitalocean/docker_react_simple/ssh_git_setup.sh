#!/usr/bin/env bash
set -o pipefail  # trace ERR through pipes
set -o errexit   # same as set -e : exit the script if any statement returns a non-true return value

CYAN='\033[0;36m'
NC='\033[0m' # No Color

source ~/.env
echo -e "${CYAN}####SETUP SSH FOR GITHUB CLONES####${NC}"
ssh-keygen -t rsa -b 4096 -C "wedgemail@gmail.com"
echo -e "${CYAN}####CHECK ssh-agent IS UP####${NC}"
echo -e "${CYAN}####adding id_rsa to agent. You need to re-enter the ssh key passphrase ####${NC}"
eval $(ssh-agent -s)
ssh-add /home/$APPLICATION/.ssh/id_rsa
echo -e "${CYAN}####COPY THIS KEY TO GITHUB####${NC}"
cat /home/$APPLICATION/.ssh/id_rsa.pub
read -p "Press enter to continue once you have copied it."
ssh -T git@github.com
