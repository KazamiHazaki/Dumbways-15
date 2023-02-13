### [Refrensi Install NGINX](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04)


# Install NGINX Native

Pertama install terlebih dahulu nginx
```shell
sudo apt update
sudo apt install nginx
```
setelah installasi berhasil cek NGINX dengan systemctl

```shell
systemctl status nginx
```
```shell
`Output`
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
   Active: `active (running)` since Fri 2020-04-20 16:08:19 UTC; 3 days ago
     Docs: man:nginx(8)
 Main PID: 2369 (nginx)
    Tasks: 2 (limit: 1153)
   Memory: 3.5M
   CGroup: /system.slice/nginx.service
           ├─2369 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           └─2380 nginx: worker process
```

jika status active maka nginx sudah berhasil di install.


# Reverse Proxy

**1. Change Directory**

Pindah ke direktory NGINX untuk menambahkan configurasi baru

```shell
cd /etc/nginx
```

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/62a49d6b-53f0-4633-8505-cc2f5f78f96d/screenshot.jpeg?tl_px=264,76&amp;br_px=1010,496&amp;sharp=0.8&amp;width=560)

**2. Buat Configuration File Baru**

```shell
sudo nano conf.d/reverse.conf
```
disinilah konfigurasi reverse proxy di buat.

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/d5d7e4df-0792-4b0b-a444-e747aac216c6/screenshot.jpeg?tl_px=264,76&amp;br_px=1010,496&amp;sharp=0.8&amp;width=560)

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/04861d52-c6f4-4542-baf6-c31bd9471765/screenshot.jpeg?tl_px=264,76&amp;br_px=1010,496&amp;sharp=0.8&amp;width=560)

pada konfigurasi reverse proxy gunakan format penulisan sebagai berikut


```shell
server {
       
        server_name your_domain www.your_domain;

         location / {
                proxy_pass http://127.x.x.x:3000;
        }
}
```

`server_name` merupakan domain yang akan di akses

`proxy_pass` setelah mengakses server_name, secara tidak langsung kita di arahkan ke alamat tujuan pada proxy_pass


![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/f578c128-f580-4d95-9bae-e03e4bc9aea2/screenshot.jpeg?tl_px=267,76&amp;br_px=1013,496&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=262,139)


setelah selesai edit, save dengan `ctrl + x` > `y` > `Enter`

**3. Cek Configurasi NGINX**

setelah configurasi selesai di buat, kita cek apakah ada error pada configurasi

```shell
sudo nginx -t
```
apabila  `OK` berarti konfigurasi nginx tidak ada error

kemudian restart ngixn untuk mengaplikasikan konfigurasi baru

```shell
sudo systemctl restart nginx
```

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/a0304f9c-be00-4158-a1d8-6d90c29470ba/screenshot.jpeg?tl_px=267,76&amp;br_px=1013,496&amp;sharp=0.8&amp;width=560)

**4. Cek Domain**

setelah di restart nginx, kita cek domain yg sudah kita reverse proxy apakah bisa di akses. untuk mengakses alamat tersebut gunakan `http` apabila belum terinstal SSL. 

cek install SSL  di [Install SSL Using Certbot](https://certbot.eff.org/)


![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/bcbd99df-cb1d-45a7-8e83-99417bdc0653/screenshot.jpeg?tl_px=0,0&amp;br_px=746,420&amp;sharp=0.8&amp;width=560)

Jika sudah muncul website maka reverse proxy berhasil di lakukan

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/825f9bbb-717c-4dad-90bd-796b247e1ab2/screenshot.jpeg?tl_px=0,0&amp;br_px=746,420&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=232,-18)



![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/f7bb7e69-efd5-4207-a7e8-ad2533f8ba75/screenshot.jpeg?tl_px=215,0&amp;br_px=961,420&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=262,-18)

![](https://ajeuwbhvhr.cloudimg.io/colony-recorder.s3.amazonaws.com/files/2023-02-02/5b21a059-e155-4f7b-9f0c-2c0aa69f8ef0/screenshot.jpeg?tl_px=0,108&amp;br_px=746,528&amp;sharp=0.8&amp;width=560&amp;wat_scale=50&amp;wat=1&amp;wat_opacity=0.7&amp;wat_gravity=northwest&amp;wat_url=https://colony-labs-public.s3.us-east-2.amazonaws.com/images/watermarks/watermark_default.png&amp;wat_pad=80,139)



