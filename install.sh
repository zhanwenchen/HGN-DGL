conda create -n hgn
conda activate hgn

# Install transformers
conda install -c huggingface transformers

# Install PyTorch
conda install pytorch::pytorch torchvision torchaudio -c pytorch # Mac
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia # Ubuntu CUDA 11.8

# Install SpaCy
conda install -c conda-forge spacy
# conda install -c conda-forge cupy # CUDA
python -m spacy download en_core_web_sm

# Install DGL
conda install -c dglteam/label/cu118 dgl # CUDA
pip install dgl -f https://data.dgl.ai/wheels/repo.html # Mac


# Download HuggingFace model and properly install LFS to avoid error with Git LFS.
cd models
# Mac
brew install git-lfs
# 2. Linux
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs


git lfs install
git clone https://huggingface.co/distilbert-base-uncased # contains LFS
cd distilbert-base-uncased
git lfs install
cd ../..

# Fix HeaderTooLarge
mv models/distilbert-base-uncased/model.safetensors models/distilbert-base-uncased/model.ckpt
