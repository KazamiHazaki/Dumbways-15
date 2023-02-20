# Deploy Nginx on Minikube Cluster
 
 What we will do?
- Deploy Nginx Using Minikube on Host machine
- Expose Nginx to external IP (NodePort,LoadBalancer)


# Install minikube 

For : Linux

```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## **1. Start cluster**


```shell
minikube start
```

If minikube fails to start, see the [drivers page](https://minikube.sigs.k8s.io/docs/drivers/)

## **2. Interact with your cluster** 

showing all pods on minikube cluster

```shell
minikube kubectl -- kubectl get po -A
```

if its too long you can use `alias` to make it more simple

```shell
alias kc="minikube kubectl --"
```

you can change `kc` to anything what you want

# Deploy Nginx 

## **1. Deploy nginx**

### Create namespace



you can download my file to your local machine or run it without download file 

- download file

```shell
wget https://raw.githubusercontent.com/KazamiHazaki/Dumbways-15/main/minikube/nginx.yml
```
then run it 

```shell
kubectl apply -f nginx.yaml
```
output :

![image](https://user-images.githubusercontent.com/56806850/220155424-c1490622-6a79-4098-9981-25b79f09aafd.png)


- without download file

```shell
kubectl apply -f https://raw.githubusercontent.com/KazamiHazaki/Dumbways-15/main/minikube/nginx.yml
```
output: 

![image](https://user-images.githubusercontent.com/56806850/220148046-43aa226b-390d-441f-bd5a-dddb6cab9c2d.png)


its will have same result.

![image](https://user-images.githubusercontent.com/56806850/220156184-57784bc3-dd31-4a0c-b886-1c92596f9dbe.png)

the app will deploy at namespace nginx-test.


## **2. Expose Nginx**

there is 2 ways to access application with external IP using :

- NodePort
- LoadBalancer

after deployment already with status runngng its ready to use

```shell
kubectl get pods --namespace=nginx-test 
```

![image](https://user-images.githubusercontent.com/56806850/220157202-dd9e3522-9efe-40eb-9954-18375f81be09.png)

## Using NodePort

after create deployment expose it

```shell
kubectl expose deployment --namespace=nginx-test nginx-app --type=NodePort --port=80
```

![image](https://user-images.githubusercontent.com/56806850/220158109-aaf3d796-2156-473f-bbf3-6a69c91fd8c1.png)


expose the service 

```shell
minikube service nginx-app --namespace=nginx-test --url
```

![image](https://user-images.githubusercontent.com/56806850/220158525-1b2b9517-9250-4c44-a720-0e571a051a49.png)


then you can access with link that created by minikube `http://127.0.0.1:43611` open in your browser or use curl in `another terminal`

```shell
curl http://127.0.0.1:43611
```
![image](https://user-images.githubusercontent.com/56806850/220159001-2dc825fd-64ad-4d15-9f1d-c2102127070e.png)


**Using browser**

![image](https://user-images.githubusercontent.com/56806850/220159264-95ff1d5b-c1cf-491b-93f0-f71de76f1b38.png)


