# Terraform / Open ToFu Studies.

1. First and foremost, we need to create an IAM user for terraform/tofu in order to access aws resources and enable then to deploy, destroy or update resources.
In AWS it would require go to the console from root account and create it manually.
Since Im using localstack I just need to create then using the aws cli v2 pointing to localstack.

2. AWS Configuration
Going to the "config" file in ~/.aws I've added the localstack url (the one described in docker-compose.yaml) as endpoint_url so every aws command is pointed to localstack instead of real aws instance.

3. In the terraform configuration file (e.g: tofu.tf) configure the aws to point to the credentials file that's local in the machine. So it uses the same endpoint_url that Im describing above and use the same credentials (im pointing to default).

## FAQ:
### About Localstack ports:
To put a bucket in s3 I used the following command:

```cmd
    aws s3 ls --endpoint-url=http://localhost:4566
```
then in the localstack container it have a whole range of ports available.
Should I use each port for one different service??
Answer: No. Locastack doc says the following
"Across our docs, we use localhost:4566 instead of localhost.localstack.cloud, to provide a fallback option to users. The primary reason being that some users are behind a corporate firewall or an internet service provider that does not allow resolving localhost.localstack.cloud properly".
https://docs.localstack.cloud/getting-started/faq/