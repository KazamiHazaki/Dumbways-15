this jenkins will using docker deployed by ansible 

- deploy jenkins with [ansible](https://github.com/KazamiHazaki/Dumbways-15/blob/main/ansible/install-grafana.yml)
- deploy node-exporter with [ansible node-exporter](https://github.com/KazamiHazaki/Dumbways-15/blob/main/ansible/Ansible_exporter.yml)

after deployment using ansible check logs jenkins to get password, we will used it on post installation

![image](https://user-images.githubusercontent.com/56806850/222907035-e9828665-421b-4a76-a8dd-5e6bfa82bb46.png)

now open browser jenkins with IP public:8080 port, and paste password from docker jenkins logs

![image](https://user-images.githubusercontent.com/56806850/222907057-48ceb066-9677-426c-94c6-bfbb46918736.png)

after paste password you will asked for installation type,select suggested plugin. and wait for process installation

![image](https://user-images.githubusercontent.com/56806850/222907104-4b36dc5d-239f-4131-bc55-97dafc8a9b41.png)


