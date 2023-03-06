- Enabled server Firewall
- disable ssh password login
- disable root login
- enable ssh login using pubkey
- ssh time out false passsword login


## Enable firewall

checking firewall 

```shell
sudo ufw status
```
before enabled firewall allow ssh connection in firewall

```shell
sudo ufw allow OpenSSH
```
then we can enabled firewall we need to enabled firewall using 

```shell
sudo ufw enable
```

if you need to open any application port use 

```shell
sudo ufw allow 1234
```

change `1234` to your application port

## Manage SSH


### Disable Password login

to disabled go to ssh config

```
sudo nano /etc/ssh/sshd_config
```

![image](https://user-images.githubusercontent.com/56806850/223008856-4a30e1b4-c3f2-40c6-b882-3bfbae7db608.png)


Next, find PasswordAuthentication set to no :
`PasswordAuthentication no`


PasswordAuthentication no
### Disable Root Login
### Enabled Public Key login


