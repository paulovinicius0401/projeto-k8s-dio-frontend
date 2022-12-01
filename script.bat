echo "Criando as imagens: "

docker build -t pvsantos/projeto-backend:1.0 backend/.
docker build -t pvsantos/projeto-database:1.0 database/.

echo "Realizando o push das imagens no Docker Hub: "

docker push pvsantos/projeto-k8s-01:1.0/backend
docker push pvsantos/projeto-k8s-01:1.0/database


echo "Criando os serviços no cluster Kubernetes: "

k apply -f ./services.yaml

echo: "Deploy do cluster: "

k apply -f ./deployment.yaml




