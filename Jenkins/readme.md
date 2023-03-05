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

to craete pipiline jenkins on github  wee need to create : 

- Jenkinsfile
- Config SSH key on github

## Jenkinsfile

to create jenkinsfile we need to place it in same folder fe-dumbmerch and be-dumbmerch. 

we will create fe-dumbmerch first

```shell

def secret = 'aziz' # use your user credentials jenkins ID
def server = 'user@ippublic'
def directory = 'be-dumbmerch'
def branch = 'master'
def container = 'dm-db'


pipeline{
    agent any

    stages{
        stage ('delete & git pull'){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose stop ${container}
                    docker container prune -f
                    git pull origin ${branch}
                    exit
                    EOF"""
                }
            }
        }
        stage ('dockerize app'){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker build -t kazamisei98/dumbmerch-be-slim:0.1 .
                    exit
                    EOF"""
                }
            }
        }
        stage ('deploy app '){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose up -d
                    exit
                    EOF"""
                }
            }
        }

           stage ('upload image to dockerhub '){
            steps{
                sshagent([secret]) {
                    sh """ssh -tt -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker push kazamisei98/dumbmerch-be-slim:0.1
                    exit
                    EOF"""
                }
            }
        }

    }
}
```

on these pipeline we have 4 stages
- delete & git pull
- dockerize app
- deploy app
- push image docker 

after we created jenkinsfile we can push it to our repository 

- https://github.com/KazamiHazaki/fe-dumbmerch

after push it to repository we will add ssh key to github.

go to [settings](https://github.com/settings/keys) and New SSH Key

and add your public ssh key same as added to jenkins  user

![image](https://user-images.githubusercontent.com/56806850/222937970-e44a8f82-225b-4ea5-abb3-8e197e5bfbf4.png)

and we can create pipeline now

![image](https://user-images.githubusercontent.com/56806850/222938151-9003ec4b-a346-4f1b-9a88-b0c459a15695.png)

on build triggers check github hook for auto build with commit github

![Screenshot 2023-03-05 at 09 22 25](https://user-images.githubusercontent.com/56806850/222938267-e2a331f2-4f97-46f5-acca-51f8ec55d0ea.png)

and for the pipeline change definition with `Pipeline script from SCM`, SCM use git, use git repository SSH, and credentials we created before. and change 
branch specified branch `*/master`and save.

![image](https://user-images.githubusercontent.com/56806850/222938335-307ebe0b-860b-4136-9f82-dae84548ad98.png)

and we can test  build now 

![image](https://user-images.githubusercontent.com/56806850/222938452-26cc3e78-c6b9-45b5-b885-91d686ed0e19.png)

all stage is success no error.


