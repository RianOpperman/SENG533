# SENG533 Project

## Getting started

To run locally you need to install:

- [`minikube`](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)
- [`kubectl`](https://kubernetes.io/releases/download/)
- [`istioctl`](https://istio.io/latest/docs/setup/getting-started/)

Afterwards, to get started run:

```bash
minikube start

# Istio setup
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled

# Teastore setup
kubectl apply -f teastore.yaml

# Add dashboards
kubectl apply -f dashboards
```

To view the available dashboards please use `istioctl dashboard`.
