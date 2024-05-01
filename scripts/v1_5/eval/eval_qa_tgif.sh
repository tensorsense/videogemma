GPT_Zero_Shot_QA="/data/data"
output_name="llava_gemma_v1_finetune"
pred_path="${GPT_Zero_Shot_QA}/TGIF_Zero_Shot_QA/${output_name}/merge.jsonl"
output_dir="${GPT_Zero_Shot_QA}/TGIF_Zero_Shot_QA/${output_name}/gpt3.5-0.0"
output_json="${GPT_Zero_Shot_QA}/TGIF_Zero_Shot_QA/${output_name}/results.json"
num_tasks=8

# put api_key and api_base to .env
if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

python3 llava/eval/video/eval_video_qa.py \
    --pred_path ${pred_path} \
    --output_dir ${output_dir} \
    --output_json ${output_json} \
    --api_key ${api_key} \
    --api_base ${api_base} \
    --num_tasks ${num_tasks}
