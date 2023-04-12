# chatGPTWhisperAPI4JNano
Utilizes openAI API for Whisper and chatGPT targeting a Jetson Nano

# Assistant on Jetson Nano Developer Kit

This repository contains the code and setup instructions to run a voice-activated assistant on a Jetson Nano Developer Kit.

## Prerequisites

- NVIDIA Jetson Nano Developer Kit
- Microphone connected to the Jetson Nano
- JetPack installed on the Jetson Nano

## Installation

1. Install JetPack on the Jetson Nano Developer Kit:
   - Download the latest version of the NVIDIA JetPack SDK Manager from https://developer.nvidia.com/embedded/jetpack.
   - Install the SDK Manager on your host machine (requires Ubuntu 18.04 or 20.04).
   - Connect your Jetson Nano Developer Kit to the host machine.
   - Launch the SDK Manager and select the appropriate Jetson Nano Developer Kit target hardware.
   - Follow the on-screen instructions to complete the installation of JetPack on the Jetson Nano Developer Kit.

2. Install Python 3.9.16 using pyenv:
   - SSH into the Jetson Nano.
   - Install the necessary dependencies:
     ```
     sudo apt-get update
     sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
     ```
   - Install pyenv:
     ```
     curl https://pyenv.run | bash
     ```
   - Add the following lines to your `~/.bashrc` file:
     ```
     export PATH="~/.pyenv/bin:$PATH"
     eval "$(pyenv init --path)"
     eval "$(pyenv init -)"
     eval "$(pyenv virtualenv-init -)"
     ```
   - Restart your shell or run `source ~/.bashrc`.
   - Install Python 3.9.16:
     ```
     pyenv install 3.9.16
     ```

3. Create a virtual environment called 'myenv' using pyenv:
    - pyenv virtualenv 3.9.16 myenv
    - pyenv activate myenv

4. Install the required Python packages
    - pip install openai pydub SpeechRecognition gTTS
  
5. Save the provided code as a file, for example 'assistant.py'

6. Create a file called 'secretkeys.py' and set the OpenAI API 
    - OPENAI_API_KEY = "your_openai_api_key_here"

7. Install the required system packages
    - sudo apt-get install libasound2-dev portaudio19-dev libportaudio2 libportaudiocpp0 ffmpeg

8. Create a systemd service to run the script at boot
    - Create a new service file
      - sudo nano /etc/systemd/system/assistant.service 
    - Add the following contents to the file, replacing your_username with your actual username:
      -
        ```
        [Unit]
        Description=Assistant

        [Service]
        User=your_username
        WorkingDirectory=/home/your_username
        ExecStart=/home/your_username/.pyenv/versions/myenv/bin/python /home/your_username/assistant.py
        Restart=always

        [Install]
        WantedBy=multi-user.target
        ```
     - Save the file and exit the editor

9. Enable and start the systemd service
   ```
   sudo systemctl enable assistant
   sudo systemctl start assistant
   ```
   
10. Reboot the Jetson Nano to confirm the service starts automatically   
   ```
   sudo reboot
   ```
