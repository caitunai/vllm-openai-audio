ARG VLLM_TAG=v0.19.0-cu130

FROM vllm/vllm-openai:${VLLM_TAG}-ubuntu2404

RUN uv pip install --system --no-cache-dir vllm-omni "vllm[audio]"
