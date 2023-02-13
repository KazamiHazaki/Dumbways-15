# Deploy Nginx on docker



**1. Create docker-compose**

buat file docker compose nginx

```shell
nano docker-compose.yml
```
![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-07/d6093ea5-c201-49de-86c1-2ffd0cbb556d/ascreenshot.jpeg?tl_px=377,11&amp;br_px=1123,431&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=262,139)

**2. Docker Compose**

```yml
version: '3.3'
services:
  gateway:
   container_name: gateway
   image: nginx
   ports:
   - "80:80"
   - "443:443"
   volumes:
   - ~/reverse:/etc/nginx/conf.d/
```


![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-07/7eac23c8-d614-4f61-8ba4-c0438a07bc26/ascreenshot.jpeg?tl_px=234,97&amp;br_px=980,517&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=262,139)

**3. Deploy Nginx**

Setelah membuat docker compose deploy app dengan perintah

```shell
docker-compose up -d
```

![image](https://user-images.githubusercontent.com/56806850/218395872-3d049d7a-17c4-4d21-9159-7616ae81665b.png)



**4. Cek Docker status**

setelah di deploy cek nginx apakah sudah berhasil berjalan pada docker

```shell
docker ps
```

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-07/9bc5e720-70e5-484e-b6c3-18d1ab36e452/ascreenshot.jpeg?tl_px=309,479&amp;br_px=1055,899&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=262,139)




