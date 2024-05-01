# VideoGemma

This repository contains code for VideoGemma multimodal language model.

## Getting started

We recommend using [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) to create the environment.

### I don't want a container

1. Install [PyTorch](https://pytorch.org).

2. Install Python dependencies.

    ```bash
    pip3 install -r requirements.txt
    ```

    ```bash
    pip3 install git+https://github.com/facebookresearch/pytorchvideo.git@28fe037d212663c6a24f373b94cc5d478c8c1a1d
    ```

3. For checkpoint loading and model configuration see `run_finetune.ipynb`.
