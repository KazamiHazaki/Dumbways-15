this script will install 4 VPS 

Region Singapore 

- appserver - 2 CPU, 2GB RAM, 20GB Storage"idcloudhost_vm"
- gateway - 1 CPU, 1GB RAM, 20GB Storage
- jenkins/cicd - 2 CPU, 2 GB RAM, 20 GB storage
- monitoring - 2 cpu, 2 GB Ram, 20 GB storage

you need to change value of 
- public_key
- billing_account_id
- auth_token

to change resource name, change value after "idcloudhost_floating_ip" or "idcloudhost_vm" to your own resource name



apply terraform

![image](https://user-images.githubusercontent.com/56806850/219338034-01e6bfeb-add6-4a9d-92a7-047048ebb662.png)

wait installation and type `yes` when asked

![image](https://user-images.githubusercontent.com/56806850/219338197-cb276ca8-80bf-4931-b5c0-5d0822396a13.png)

after complete installation you will get at the end script output like this 

![image](https://user-images.githubusercontent.com/56806850/219338314-820eb9ae-675f-43ba-b1d9-e9761b54bb3e.png)

