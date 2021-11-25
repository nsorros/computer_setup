apt update

# Venv
apt install python3-venv
apt install python3-pip
apt install virtualenv

# Tools
apt install gh
apt install jq
apt install aws_cli
apt install direnv
apt install powerflinw
apt install unzip

echo "# Direnv" >> ~/.bashrc
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
echo "" >> ~/.bashrc

echo "# Powerline" >> ~/.bashrc
echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then" >> ~/.bashrc
echo "    powerline-daemon -q" >> ~/.bashrc
echo "    POWERLINE_BASH_CONTINUATION=1" >> ~/.bashrc
echo "    POWERLINE_BASH_SELECT=1" >> ~/.bashrc
echo "    source /usr/share/powerline/bindings/bash/powerline.sh" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "" >> ~/.bashrc
