Setup grafana,prometheus,node exporter is already deployed by ansible 

![image](https://user-images.githubusercontent.com/56806850/222938728-8e27b6be-709d-4dcb-a867-39e32ca9e8f4.png)

and you can access all application with port 3000,9100,9090

![image](https://user-images.githubusercontent.com/56806850/222938868-2e57a00e-7c37-41fc-a5b1-50d4b5a4e0d5.png)


and first setup you need is add source metrics go to settings -> add source  -> add data source 

![image](https://user-images.githubusercontent.com/56806850/222939369-ca92b240-5893-457a-9812-459587f4bc71.png)


select prometheus 

![image](https://user-images.githubusercontent.com/56806850/222939448-49ffe5d0-eae8-4714-bdfe-f1e3ef3bda99.png)

and add prometheus address

![image](https://user-images.githubusercontent.com/56806850/222939489-402b9439-b40a-4b95-9cf0-402c4404b40b.png)

save and test data source

and we will create dashboard using template node-exporter

go to dashboard -> new -> import ->  fill 1860 and load 

![image](https://user-images.githubusercontent.com/56806850/222939232-fc713dc4-919e-4665-a2e1-e2e6b720a796.png)

load dashboard and give name dashboard select data source 

![image](https://user-images.githubusercontent.com/56806850/222939614-6230e347-9bae-403c-aab0-c0655b8f5930.png)

and import your dashboard

![image](https://user-images.githubusercontent.com/56806850/222939688-5f8f88ef-da44-4888-9762-cd3a55344037.png)

## Alerting

for alerting we will make alert to discord first we craete contact points and choose discord

![image](https://user-images.githubusercontent.com/56806850/222944054-bb527816-b423-4ea7-b6a9-5f77655be55c.png)

![image](https://user-images.githubusercontent.com/56806850/222944063-fad307a1-a4c5-416e-a740-427532bd03ee.png)

and copy paste your discord webhook  to grafana contact points webhook

![image](https://user-images.githubusercontent.com/56806850/222944128-d2b6d258-3a94-4308-aeb4-ac8fe86f4189.png)

and you can test your webhook notification 

![image](https://user-images.githubusercontent.com/56806850/222944177-4d82d9e0-0817-4955-b7f9-6fc67e804e75.png)


## Create alert Query

so after create contact type we can create alert in grafana with PromQuery

first go to alert -> create new alert 

![image](https://user-images.githubusercontent.com/56806850/222944343-276719fb-9228-4a0e-bb94-2672ff6845ae.png)

and fill Prom query

`CPU Alert`
```shell
(sum by(instance) (irate(node_cpu_seconds_total{instance="103.67.186.181:9100", job="appserver-exporter", mode!="idle"}[$__rate_interval])) * 100) / on(instance) sum by(instance) (irate(node_cpu_seconds_total{instance="103.67.186.181:9100", job="appserver-exporter"}[$__rate_interval]))
```
![image](https://user-images.githubusercontent.com/56806850/222944370-a66522b6-a5fa-4f02-9f36-179f762e7c19.png)

on C query we will make it as condition alert so if B > 4 alert will trigger 

![image](https://user-images.githubusercontent.com/56806850/222944676-c443781a-3ca1-4d26-8928-4a79abeba454.png)

 then save with name alert cpu-alert

![image](https://user-images.githubusercontent.com/56806850/222944446-6d6dc092-c018-4a5a-87e7-2b7cedfefbd0.png)


we will make other alert  like RAM alert and Disk alert

`Ram Alert`
```shell
(node_memory_MemTotal_bytes{instance="103.67.186.181:9100",job="appserver-exporter"} - node_memory_MemFree_bytes{instance="103.67.186.181:9100",job="appserver-exporter"} - (node_memory_Cached_bytes{instance="103.67.186.181:9100",job="appserver-exporter"} + node_memory_Buffers_bytes{instance="103.67.186.181:9100",job="appserver-exporter"} + node_memory_SReclaimable_bytes{instance="103.67.186.181:9100",job="appserver-exporter"})) / 1073741824
```


`Disk Alert`
```shell
(node_filesystem_size_bytes{job="appserver-exporter", fstype="ext4"} / 1073741824) - (node_filesystem_free_bytes{job="appserver-exporter", fstype="ext4"} / 1073741824) 
```


