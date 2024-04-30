cd /data/vlm_sandbox/custom_llava

export PYTHONPATH=$PYTHONPATH:/data/vlm_sandbox/custom_llava
export HF_TOKEN=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
export DS_SKIP_CUDA_CHECK=1
# export CUDA_VISIBLE_DEVICES=0,1,2 # leave 1 gpu for development

deepspeed llava/train/train_mem.py \
    --deepspeed ./scripts/zero2_offload.json \
    --model_name_or_path google/gemma-2b-it \
    --version gemma \
    --data_path /data/valley/train_json/videochatgpt_tune_fixed.json \
    --video_folder /data/videochatgpt/ \
    --vision_tower LanguageBind/LanguageBind_Video_merge \
    --mm_projector_type mlp2x_gelu \
    --pretrain_mm_mlp_adapter /data/vlm_sandbox/custom_llava/checkpoints/llava_gemma_v1_pretrain/mm_projector.bin \
    --mm_vision_select_layer -2 \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --image_aspect_ratio pad \
    --group_by_modality_length True \
    --bf16 True \
    --output_dir ./checkpoints/llava_gemma_v1_finetune \
    --num_train_epochs 3 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 5000 \
    --save_total_limit 10 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 3072  \
    --gradient_checkpointing True \
    --dataloader_num_workers 32 \
    --lazy_preprocess True \
    --report_to tensorboard \
    --cache_dir "./cache_dir" \
    
    # --model_name_or_path lmsys/vicuna-7b-v1.5 \
    # --pretrain_mm_mlp_adapter ./checkpoints/Video-LLaVA-Pretrain-7B/mm_projector.bin \
    # --tune_mm_mlp_adapter True \
    # --freeze_backbone True \