# worker-victoria-v2

Image custom RunPod worker-comfyui pour le projet Victoria :

- ComfyUI-VideoHelperSuite (LoadVideo / VideoCombine)
- - ComfyUI-Frame-Interpolation (RIFE VFI, 16 -> 32 fps)
  - - ComfyUI-Impact-Pack + Subpack (FaceDetailer, face_yolov8m.pt embarque)
   
    - Base : runpod/worker-comfyui:5.8.5-base. Deploiement : RunPod Serverless -> import du repo GitHub (build cote RunPod), volume EU-RO-1 monte, memes workflows que l'endpoint existant.
    - 
