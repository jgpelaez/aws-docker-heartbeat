HeartBeat in docker instances, will check if docker info responds, and if the docker service is running. 
If the heartbeat to docker fail will send a message to SNS, and a lambda function will reboot the instance.

# Requirements on the ec2 instance

- AWS cli installed
- Access to SNS

# Terraform code exectuion

Set AWS environment variables:
```
export AWS_ACCESS_KEY_ID=<accesskey>
export AWS_SECRET_ACCESS_KEY=<secret>
export AWS_DEFAULT_REGION=<region>

export TF_VAR_aws_access_key=$AWS_ACCESS_KEY_ID
export TF_VAR_aws_secret_key=$AWS_SECRET_ACCESS_KEY
```


```
cd terraform
terraform plan
bash ./terraformapply.sh # in the shell script we generate a zip with the lambda package
```