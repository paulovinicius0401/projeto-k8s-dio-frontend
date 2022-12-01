#!/bin/bash

echo "Criando as imagens: "

docker build -t pvsantos/projeto-k8s-backend:1.0 backend/.
docker build -t pvsantos/projeto-k8s-database:1.0 database/.

echo "Realizando o push das imagens no Docker Hub: "

docker push pvsantos/projeto-k8s-backend:1.0
docker push pvsantos/projeto-k8s-database:1.0


echo "Criando os serviços no cluster Kubernetes: "

minikube kubectl -- apply -f ./services.yaml

echo "Deploy do cluster: "

minikube kubectl -- apply -f ./deployment.yaml




