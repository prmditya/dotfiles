clear
ls
clear
la
clear
exit
clear
ls
clear
cd 
clear
mkdir developer
ls
cd developer/
clear
ls
clear
mkdir WebDevelopment MobileApps EmbeddedSystems Experiments
ls
clear
la
clear
cd
clear
sudo apt get-update && sudo apt update
sudo apt-get update && sudo apt update
sudo apt-get update && sudo apt update -y
clear
sudo apt upgrade -y
clear
sudo apt install -y build-essential curl wget git unzip
git config --global user.name "Thoriq"
git config --global user.email "thoriqk2@gmail.com"
sudo apt install -y python3 python3-pip
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
# download and install Node.js (you may need to restart the terminal)
nvm install 22
# verifies the right Node.js version is in the environment
node -v # should print `v22.11.0`
# verifies the right npm version is in the environment
npm -v # should print `10.9.0`
python --version
python3 --version
clear
pip3 --version
clear
node --version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
exit
z
clear
cd
clear
nvm -v
clear
node -v
node --version
clear
nvm install 22
node -v
npm -v
clea
clear
sudo apt install -y apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
cler
clear
docker
clear
docker 
clear
docker ps
clear
docker ps -al
cleear
clear
docker ps -a
clear
docker status
clear
sudo apt install -y nvim
snap install nvim
sudo snap install nvim
clear
sudo apt install -y neovim
clear
nvim
ls
clear
la
clear
ls -al
git init --bare $HOME/.dotfiles
ls
clear
la
clear
ls -al
echo "alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.bashrc
source ~/.bashrc
dot
clear
echo ".dotfiles" >> ~/.gitignore
ls
clear
dot add .gitignore
dot commit -m "Add .gitignore to prevent recursion"
dot add .bashrc .gitconfig
dot commit -m "Initial commit of dotfiles"
ls
clear
ls -al
cd .dotfiles
clear
ls
clear
ls -al
cd config
nvim config 
clear
ls
clear
cd ..
clear
ls
dot remote add origin https://github.com/prmditya/dotfiles.git
dot push -u origin main
dot remote add origin https://github.com/prmditya/dotfiles.git
dot push -u origin main
git remote remove origin
git remote add origin https://github.com/prmditya/dotfiles.git
dot add .bashrc .gitconfig
ls -a
nvim .gitignore
dot commit -m "Initial commit of dotfiles"
dot add .
dot status
dot commit -m "initial commit of dotfiles"
clear
dot branch
dot push -u origin master
clear
dot
clear
dot
clear
vim .bashrc
clear
dot status
clear
sudo apt install -y zsh
chsh -s $(which zsh)
sh
clear
ls
which 
clear
which zsh
which $SHELL
chsh -s /usr/bin/zsh
exit
