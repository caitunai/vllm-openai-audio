# vllm-openai-audio
Support asr or tts model with vllm-openai image.

## Environment
When you startup this docker container, you can configure the evvironments like this:
```shell
HF_HOME=/models/huggingface
HF_ENDPOINT=https://hf-mirror.com
VLLM_CACHE_ROOT=/models/vllm
FLASHINFER_WORKSPACE_BASE=/models/flashinfer
```

## Download Huggingface Models
```python
from huggingface_hub import snapshot_download
snapshot_download(repo_id="Qwen/Qwen3-ASR-1.7B")
```
