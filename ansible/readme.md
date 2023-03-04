this is ansible script to install application from host machine to remote machine with one script.

first what i need to my VPS server is all server need to installed with docker, so i have fresh 4 vps without any application. and i will install all server with docker using ansible.

before use ansible we need to create destination remote server using hosts file.

```shell
nano hosts
```
and fill hosts file with destination server IP and user login with these format 

```shell
[servers]
appserver ansible_host=127.0.0.1 ansible_user=one
cicd ansible_host=127.0.0.2 ansible_user=two
gateway ansible_host=127.0.0.3 ansible_user=three
monitoring ansible_host=127.0.0.4 ansible_user=four

[all:vars]
ansible_python_interpreter=/usr/bin/python3
```
- `ansible_hosts` its your VPS public IP
- `ansible_user` login user to VPS

after create destination host, we can craete ansible script.

ansible script is crated with `yaml` format file.


