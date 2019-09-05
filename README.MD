# Challenge
Here is a challenge to demonstrate some of your Terraform skillset. Using Azure or AWS (either works) via Terraform, we would like to see your take on a simplified version of a basic application execution environment. Take as many calendar days as needed to make something you feel comfortable talking at length about.

# Details

This basic application execution environment is to include the following resources (at minimum):

a private network w/ valid private network IP space
infra for a three tier app inside the network: database (rds or azure equivalent), ec2 host or azure equivalent, and a load balancer all wired together
a monitor/alarm for CPU usage on the server
The goal here is to assess a basic comprehension of Terraform concepts by seeing if you can implement this set of resources in a reasonable amount of time. There is a LOT of room for style points in this assignment: terraform modules, SSL at the load balancer, better metrics/alerting, actually getting an app running using docker on the host machine via user_data, using an S3 or Azure equiv Terraform backend, crypto, et cetera. If you feel so inclined, do not hesitate to get fancy.

# Deliverables:

some terraform code in github.com OR in an emailed zip file OR something similar
screenshots of deployed assets from cloud-service webconsole OR temporary creds to log in and look around on your acct
Given that your terraform code needs to be "applied" to instantiate the resources, I recommend frequently making sure that you can terraform plan and terraform apply during the process of making the material.
```
execute code in terminal 
-----------------------------
cd environments/
terraform init 
terraform apply

```
### Contact 
| Name | Role | Email | 
| --- | ---| ---| 
| Pascal Kollie | SRE | PascalKollie@gmail.com | 
