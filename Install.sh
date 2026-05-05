#!/bin/bash

PURPLE='\033[0;35m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[1;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${PURPLE}=========================================${NC}"
echo -e "${GREEN}         INSTALLING BYPASS SCRIPT        ${NC}"
echo -e "${PURPLE}=========================================${NC}"
echo ""

echo -e "${YELLOW}[1/6] Removing Old Folders...${NC}"
cd ~
rm -rf Quite
rm -rf Super
echo -e "${GREEN}[✓] Old Folders Removed${NC}"

echo ""
echo -e "${YELLOW}[2/6] Updating Packages...${NC}"
pkg update -y && pkg upgrade -y
echo -e "${GREEN}[✓] Packages Updated${NC}"

echo ""
echo -e "${YELLOW}[3/6] Installing Required Packages...${NC}"
pkg install python git python-pip -y
pip install pycryptodome requests
echo -e "${GREEN}[✓] Python, Git, Pip installed${NC}"

echo ""
echo -e "${YELLOW}[4/6] Cloning Repository...${NC}"
cd ~

if git clone https://github.com/Dick682/Super.git; then
    echo -e "${GREEN}[✓] Repository Cloned${NC}"
else
    echo -e "${RED}[✗] Clone Failed! Check internet connection.${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}[5/6] Setting Up Auto-Run...${NC}"
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
fi
sed -i '/cd ~\/Super && python run.py/d' ~/.bashrc
echo "" >> ~/.bashrc
echo "cd ~/Super && python run.py" >> ~/.bashrc
echo -e "${GREEN}[✓] Auto-Run Configured${NC}"

echo ""
echo -e "${YELLOW}[6/6] Removing Installer Folder...${NC}"

cd ~
rm -rf Quite
echo -e "${GREEN}[✓] Installer Folder Removed${NC}"

echo ""
echo -e "${PURPLE}=========================================${NC}"
echo -e "${CYAN}     INSTALLATION COMPLETED SUCCESSFULLY${NC}"
echo -e "${PURPLE}=========================================${NC}"
echo ""
echo -e "${GREEN}Starting the Main Script Now...${NC}"
sleep 1
exec bash
