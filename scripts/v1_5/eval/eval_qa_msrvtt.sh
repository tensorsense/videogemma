

if [ ! -f /data/data/vlm_sandbox/.env ]
then
  export $(cat .env | xargs)
fi

GPT_Zero_Shot_QA="/data/data"
output_name="llava_gemma_v1_finetune"
pred_path="${GPT_Zero_Shot_QA}/MSRVTT_Zero_Shot_QA/${output_name}/merge.jsonl"
output_dir="${GPT_Zero_Shot_QA}/MSRVTT_Zero_Shot_QA/${output_name}/gpt"
output_json="${GPT_Zero_Shot_QA}/MSRVTT_Zero_Shot_QA/${output_name}/results.json"
# api_key=""
# api_base=""
num_tasks=8



python3 videollava/eval/video/eval_video_qa.py \
    --pred_path ${pred_path} \
    --output_dir ${output_dir} \
    --output_json ${output_json} \
    --api_key ${api_key} \
    --api_base ${api_base} \
    --num_tasks ${num_tasks}