##Running rancher/rancher and rancher/rancher-agent on the Same Node

```shell
docker run -d --restart=unless-stopped \
  -p 8080:80 -p 8443:443 \
  --privileged \
  rancher/rancher:latest
  ```


![image](https://user-images.githubusercontent.com/56806850/227108864-0febcfc2-4b68-48e4-9016-194770ff0183.png)
