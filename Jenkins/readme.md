this jenkins will using docker deployed by ansible 

- deploy jenkins with [ansible](https://github.com/KazamiHazaki/Dumbways-15/blob/main/ansible/install-grafana.yml)
- deploy node-exporter with [ansible node-exporter](https://github.com/KazamiHazaki/Dumbways-15/blob/main/ansible/Ansible_exporter.yml)

### Jenkins first setup

- setup user credentials
- manage plugin
- create pipeline

after deployment using ansible check logs jenkins to get password, we will used it on post installation

![image](https://user-images.githubusercontent.com/56806850/222907035-e9828665-421b-4a76-a8dd-5e6bfa82bb46.png)

now open browser jenkins with IP public:8080 port, and paste password from docker jenkins logs

![image](https://user-images.githubusercontent.com/56806850/222907057-48ceb066-9677-426c-94c6-bfbb46918736.png)

after paste password you will asked for installation type,select suggested plugin. and wait for process installation

![image](https://user-images.githubusercontent.com/56806850/222907104-4b36dc5d-239f-4131-bc55-97dafc8a9b41.png)

and create user login 

![image](https://user-images.githubusercontent.com/56806850/222908745-0195d936-bd75-4097-9e61-3c6a5753aec9.png)

# Create user credentials

after login to dashboard  create new user, go to credentials, and add new 

![image](https://user-images.githubusercontent.com/56806850/222913427-c8a6978c-abd5-4e89-953c-0dd7a1aba5ab.png)

select stores from parent

![image](https://user-images.githubusercontent.com/56806850/222936769-e01263b6-82fa-45de-8f1c-378d6afcf6f6.png)

change kind to `SSH username with privateke` and fill ID or leave it blank, and `username` with user login server

![image](https://user-images.githubusercontent.com/56806850/222936817-5d558a2b-cadf-4a2f-892c-d1c944c9437c.png)

and fill  your private key to jenkins 

![image](https://user-images.githubusercontent.com/56806850/222936888-4040bf76-9885-49dc-947e-a2a06690604c.png)

after copy private key. save user with button create.

and copy public key to known hosts target VPS server using ssh-copy-id


if your default key is id_rsa.pub you can use

```shell
ssh-copy-id user@ipserver
```

and  jenkins user is ready to use

# Manage Plugin

and we need to add SSH-agent plugin, 

go to dashboard -> manage jenkins -> Plugin manager

search on available plugins `ssh agent plugin` and install it 


![image](https://user-images.githubusercontent.com/56806850/222937157-24bfff87-6356-49e8-bf1f-846ac3023aac.png)

after install the plugin we need to change security on jenkins 

go to dashboard -> manage jenkins -> configure global security 

change Host key verification strategy with `No verification` 

![image](https://user-images.githubusercontent.com/56806850/222937259-8fc52d6a-7e83-4045-a1c3-93b00b98cbc0.png)

and we can go to the next step create pipeline

# Craete Pipeline






