FROM vllm/vllm-openai:v0.19.0

# 安装运行依赖（TTS 必须）
RUN uv pip install --system "vllm[audio]"
