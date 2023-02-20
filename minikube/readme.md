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

**NOTE:DONT CLOSE IT,OR ITS WILL TERMINATED YOUR TUNNNEL TO NGINX**

then you can access with link that created by minikube `http://127.0.0.1:43611` open in your browser or use curl in `another terminal`

```shell
curl http://127.0.0.1:43611
```
![image](https://user-images.githubusercontent.com/56806850/220159001-2dc825fd-64ad-4d15-9f1d-c2102127070e.png)


**Using browser**

![image](https://user-images.githubusercontent.com/56806850/220159264-95ff1d5b-c1cf-491b-93f0-f71de76f1b38.png)


## Using LoadBalancer

this is have same method to expose like NodePort

create service

```shell
kubectl expose deployment --namespace=nginx-test nginx-app --type=LoadBalancer --port=80
```

![image](https://user-images.githubusercontent.com/56806850/220160326-830c96ea-a139-4c4b-8794-fa39727a548b.png)


run `tunnel` on another terminal to open access, and dont close it. if the tunnel not open external IP will show status as `pending`

![image](https://user-images.githubusercontent.com/56806850/220161421-f917e5be-b068-46de-97ba-95ced623c079.png)


```shell
minikube tunnel
```
because we are exposing port 80, minikube will asked for password root, enter your password and you can access it

![image](https://user-images.githubusercontent.com/56806850/220160761-aab1ad38-bcea-4522-b35f-5dd29d267b9f.png)

because we are running on local machine and its doesn't have public IP its will automatic using localhost

![image](https://user-images.githubusercontent.com/56806850/220161264-4cee67c9-7662-4fc2-b5cb-6cca3641767e.png)

then we can access it directly to `localhost`

![image](https://user-images.githubusercontent.com/56806850/220162925-d78ef822-2e2c-427a-bb6d-dfc810c29ff5.png)

