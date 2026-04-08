FROM vllm/vllm-openai:v0.19.0-cu130-ubuntu2404

RUN uv pip install --system --no-cache-dir "vllm[audio]"
