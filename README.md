# VideoGemma

This repository contains code for VideoGemma multimodal language model.

VideoGemma combines [LanguageBind](https://github.com/PKU-YuanGroup/LanguageBind) video encoder with performant and flexible [Gemma](https://huggingface.co/google/gemma-2b-it) LLM in a LLaVA-style architecture.

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

### Pretrained checkpoints

Pretrained checkpoint for the model can be found here: [S3 URI](s3://facepunk-ml/models/llava_gemma_v1_finetune/).

- The model's projector has been pretrained for 1 epoch on the [Valley](https://github.com/RupertLuo/Valley) dataset.
- LLM and the projector have been jointly fine-tuned using the [Video-ChatGPT](https://github.com/mbzuai-oryx/Video-ChatGPT/blob/main/docs/train_video_chatgpt.md) dataset.

