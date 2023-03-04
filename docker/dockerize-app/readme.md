# DOCKERFILE

in this section i am will create dockerize app from dumbmerch-frontend, this application using nodeJS. so start with make new docker images using NodeJS image.

```shell
nano Dockerfile
```
in Dockerfile we need image NodeJS. so we add

```shell
FROM node:16-alpine 
```
and definition your container docker where is you using `CMD`,`ADD`, `RUN`, etc ... 
```shell
WORKDIR /dumbmerch-fe
```
and copy all files to docker container directory 

```shell
COPY . /dumbmerch-fe
```
after copy all files to new directory `dumbmerch-fe` install node

```shell
RUN npm install
```
then you can expose it to Port

```shell
EXPOSE 30000
```

and then run application 

```shell
CMD ["npm","run","start"]
```

the final file will look like this.

```shell
FROM node:16-alpine
WORKDIR /dumbmerch-fe
COPY . /dumbmerch-fe
RUN npm install
EXPOSE 3000
CMD ["npm","run","start"]
```

then save it Dockerfile. Run dockerfile 

```shell
docker build -t my-image:1 .
```

after complete you can check with 

```shell
docker images
```

its will show something like this 

![image](https://user-images.githubusercontent.com/56806850/222889999-0d5b098e-a8a5-48d2-9255-04fce9d0c1ac.png)

then we can test our docker images with 

```shell
docker run -p 3000:3000 YOUR_IMAGE_NAME
```

![image](https://user-images.githubusercontent.com/56806850/222890507-063e08c2-74d6-4892-9022-4efb3d21c55b.png)

and then we are ready to create using docker images 

![image](https://user-images.githubusercontent.com/56806850/222890547-9a5e2f7c-8c9d-4c8f-b666-0d1098c2a982.png)





