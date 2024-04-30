# install tmux
apt update
apt install -y tmux

# install Python packages
pip3 install -r requirements.txt

# pytorchvideo is not actively supported, so pip version is broken
pip3 install git+https://github.com/facebookresearch/pytorchvideo.git@28fe037d212663c6a24f373b94cc5d478c8c1a1d

# fix flash attention 2
# pip3 install --upgrade flash-attn --no-build-isolation
# pip3 uninstall transformer-engine

# fix async_io warning
apt install -y libaio-dev

# fix cutlass warning
git clone https://github.com/NVIDIA/cutlass.git ~/cutlass

nvidia-smi
