#!/bin/bash

# Install PyTorch with CUDA support
pip install torch==2.0.0+cu117 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117

# Download and install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
eval "$($HOME/miniconda/bin/conda shell.bash hook)"

# Print the current conda environment
echo "Current Conda environment: $(conda info --envs | grep '*' | awk '{print $1}')"

# Print the current conda environment
echo "Current Conda environment: $(conda info --envs | grep '*' | awk '{print $1}')"


# Navigate to the checkpoints directory
cd checkpoints

# Update apt repository and install git-lfs
apt update
apt-get install git-lfs -y
git lfs install

# Clone repositories using git-lfs
# git lfs clone https://huggingface.co/luodian/OTTER-MPT7B-Init.git
git lfs clone https://huggingface.co/Charliebear/BrainGPT

# Navigate back to the main directory
cd ../

# Install gdown for downloading files from Google Drive
pip install gdown

# Download the specific file from Google Drive using gdown
gdown "https://drive.google.com/uc?id=1iDLx7NqvTg8sBTVViQu5wq8OhPSovAo4" -O ./data/CQ500p.json

# Create and activate conda environment
conda env create -f environment.yml
conda activate forte

# Install additional Python requirements
pip install -r requirements.txt
