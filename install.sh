conda create -n hgn
conda activate hgn

# Install transformers
conda install -c huggingface transformers

# Install PyTorch
conda install pytorch::pytorch torchvision torchaudio -c pytorch # Mac

# Install SpaCy
conda install -c conda-forge spacy
# conda install -c conda-forge cupy # CUDA
python -m spacy download en_core_web_sm

# Install DGL
# conda install -c dglteam dgl
pip install dgl -f https://data.dgl.ai/wheels/repo.html # Mac


# Download HuggingFace model and properly install LFS to avoid error with Git LFS.
cd models
brew install git-lfs # Mac
git lfs install
git clone https://huggingface.co/distilbert-base-uncased # contains LFS
cd distilbert-base-uncased
git lfs install
cd ../..

# Fix HeaderTooLarge
mv models/distilbert-base-uncased/model.safetensors models/distilbert-base-uncased/model.ckpt
