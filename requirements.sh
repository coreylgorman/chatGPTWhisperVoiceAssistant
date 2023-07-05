# requirements.sh

#!/bin/bash

echo "Updating the system..."
sudo apt-get update -y

echo "Installing system dependencies..."
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git libasound2-dev portaudio19-dev libportaudio2 libportaudiocpp0 ffmpeg

echo "Installing pyenv..."
curl https://pyenv.run | bash

echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# Reflect the changes made to the .bashrc
source ~/.bashrc

# Wait for a moment for the changes to take effect
sleep 5

export PATH="~/.pyenv/bin:$PATH"
eval "$(~/.pyenv/bin/pyenv init --path)"
eval "$(~/.pyenv/bin/pyenv init -)"
eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"

echo "Installing Python 3.9.16..."
~/.pyenv/bin/pyenv install 3.9.16

echo "Creating virtual environment..."
~/.pyenv/bin/pyenv virtualenv 3.9.16 myenv
~/.pyenv/bin/pyenv activate myenv

echo "Installing Python dependencies..."
pip install openai pydub SpeechRecognition gTTS

echo "Installing Visual Studio Code..."
sudo snap install --classic code

echo "Setup completed successfully!"
