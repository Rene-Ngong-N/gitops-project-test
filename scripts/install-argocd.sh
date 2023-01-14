#!/bin/bash
kubectl get ns argocd

if [ $? = 0 ]
then
    echo "The namespace already exist"
else
    kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.0-rc2/manifests/install.yaml
    
fi

kubectl apply -f ../app/app.yml