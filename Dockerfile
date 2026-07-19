# Worker ComfyUI custom victoria-v2 : VHS + RIFE + Impact Pack (FaceDetailer)
# Base = version relevee dans l'env n8n de prod (RUNPOD_COMFYUI_IMAGE)
FROM runpod/worker-comfyui:5.8.5-base

# Custom nodes via comfy-cli (present dans l'image de base)
RUN comfy node install comfyui-videohelpersuite
RUN comfy node install comfyui-frame-interpolation
RUN comfy node install comfyui-impact-pack
RUN comfy node install comfyui-impact-subpack

# Detecteur de visage pour FaceDetailer (embarque dans l'image)
RUN mkdir -p /comfyui/models/ultralytics/bbox && wget -q -O /comfyui/models/ultralytics/bbox/face_yolov8m.pt https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8m.pt

# Poids RIFE (~50 Mo) pre-bakes ; si l'URL echoue, le node telecharge seul au premier run
RUN mkdir -p /comfyui/custom_nodes/ComfyUI-Frame-Interpolation/ckpts/rife && (wget -q -O /comfyui/custom_nodes/ComfyUI-Frame-Interpolation/ckpts/rife/rife47.pth https://huggingface.co/styler00dollar/VFI/resolve/main/rife47.pth || true)
