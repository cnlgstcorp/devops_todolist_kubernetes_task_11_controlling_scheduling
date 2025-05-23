#!/bin/bash

# --- MySQL ---
kubectl apply -f .infrastructure/mysql/ns.yml
kubectl apply -f .infrastructure/mysql/configMap.yml
kubectl apply -f .infrastructure/mysql/secret.yml
kubectl apply -f .infrastructure/mysql/service.yml
kubectl apply -f .infrastructure/mysql/statefulSet.yml

# --- ToDo App ---
kubectl apply -f .infrastructure/app/ns.yml
kubectl apply -f .infrastructure/app/pv.yml
kubectl apply -f .infrastructure/app/pvc.yml
kubectl apply -f .infrastructure/app/secret.yml
kubectl apply -f .infrastructure/app/configMap.yml
kubectl apply -f .infrastructure/app/clusterIp.yml
kubectl apply -f .infrastructure/app/nodeport.yml
kubectl apply -f .infrastructure/app/hpa.yml
kubectl apply -f .infrastructure/app/deployment.yml

# --- Ingress Controller ---
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

# --- Optional: Ingress Rule ---
# kubectl apply -f .infrastructure/ingress/ingress.yml

# --- Add taints to MySQL nodes ---
kubectl taint nodes kind-worker2 app=mysql:NoSchedule --overwrite
