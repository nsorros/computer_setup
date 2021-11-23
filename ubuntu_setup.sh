apt update

# Venv
apt install python3-pip
apt install virtualenv

# Tools
apt install gh
apt install jq
apt install aws_cli
apt install direnv

echo "# Direnv" >> ~/.bashrc
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
