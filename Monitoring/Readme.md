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


