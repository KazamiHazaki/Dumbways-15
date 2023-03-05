## 1. [Install Nginx & Reverse Proxy](https://github.com/KazamiHazaki/Dumbways-15/blob/main/nginx/install_nginx_reverse.md)
## 2. [Install NGINX on Docker](https://github.com/KazamiHazaki/Dumbways-15/blob/main/nginx/Nginx_on_docker.md)


add file configuration to /etc/nginx/conf.d

```shell
server {
  server_name aziz.studentdumbways.my.id;
  location / {
    proxy_pass http://10.36.116.177:3000;
  }

}

server {
    server_name backend.aziz.studentdumbways.my.id;
    location / {
        proxy_pass http://10.36.116.177:5000;
    }
}

server {
    server_name jenkins.aziz.studentdumbways.my.id;
    location / {
        proxy_pass http://10.36.116.202:8080;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {
    server_name grafana-prom.aziz.studentdumbways.my.id;
    location / {
        proxy_pass http://10.36.116.107:9090;
    }
}

server {
    server_name grafana-exporter.aziz.studentdumbways.my.id;
    location / {
        proxy_pass http://10.36.116.107:9100;
    }
}

server {
    server_name grafana.aziz.studentdumbways.my.id;
    location / {
        proxy_pass http://10.36.116.107:3000;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}


	

```


to add SSL i am will use nginx native and install  certbot  to install certificate in nginx

[certbot](https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal&tab=wildcard)

after install cerbot run it with

```shell
certbot --nginx
```
