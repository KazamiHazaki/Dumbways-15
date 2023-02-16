# Terraform with docker installation

What will installed on this script its
- Ubuntu 20.04
- Hardware Specs T2.Micro
- 20 GB storage
- Pre-installed Docker ( you need to wait process installation)
- Security group allow SSH,HTTP,HTTPS

# How To Use It

**1. Change aws access key**

craete from here [IAM Dashboard](https://console.aws.amazon.com/iam/)

**terraform.tfvars**
```shell
access_key = "aws_acces_key" # change to yours aws access key
secret_key = "aws_secret_key" # change to yours aws secret_key

```

**2. change keypair value to your key name** 

open EC2 Instance [dashboard](https://console.aws.amazon.com/ec2/home) go to menu tab `Network & security` you will find `key` tab menu click and create new key pair

**variable.tf**
```shell
variable "ami_key_pair_name" {
        default = "terraform-key" # change terraform-key to your key
}
```

**3. initialization Terraform Requirement**

```shell
terraform init
```

**4. Run Script to install EC2 Instance** 



```shell
terraform apply
```

when asked  `Enter a value` type `yes` then enter

After installation finished its will show the output of `IP Public & EC2 Instance name` from output script

```terraform
output "instance_id" {
  description = "ID dari EC2 Instance"
  value = aws_instance.ec2_instance.id  
}

output "instance_public_ip" {
   description = " Public IP EC2"
   value = aws_instance.ec2_instance.public_ip
}
```

Its will show you the out put of `IP Public & ID Instance` that created by terraform


![image](https://user-images.githubusercontent.com/56806850/219322584-850139c8-4989-4e3c-bf2c-79d366f92075.png)


**5. To Delete all instance and security group that installed by terraform** 

```shell
terraform destroy
```
