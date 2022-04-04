# Setting up and connecting to Linux servers in private and public subnets on AWS cloud

## Introduction

Terraform is used to setup this infrastructure (infrastructure as code) for Amazon Linux Servers in private and public subnets to be able to communicate.

## Setup

Clone the repo:

```sh
git clone https://github.com/marcdomain/awslab.git
```

- Install [terraform](https://www.terraform.io/downloads) >= 1.0.9. For ease of switching between multiple terraform versions, install [tfv](https://github.com/marcdomain/tfv)
- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [Setup AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

## Usage

- This repo uses your default aws profile, and us-east-1 region. Feel free to use your preferences.
- Provision the infrastructure

```sh
terraform init
```

```sh
terraform plan
```

```sh
terraform apply
```

## Test connections using the output value of `awslab-subnet-public-ip` and `awslab-subnet-private-ip` respectively

- From the internet: Only the webserver connections are successful

```sh
ping -c 1 <SERVER IP>
```

```sh
telnet <SERVER IP> <PORT>
```

```sh
ssh -i awslabkey.pem ec2-user@<SERVER IP>
```

- From Webserver environment

```sh
ping -c 1 <DATABASE SERVER PRIVATE IP>
```

```sh
telnet <DATABASE SERVER PRIVATE IP> <PORT>
```

```sh
ssh ec2-user@<DATABASE SERVER PRIVATE IP>
```

**Note**: To enable SSH from the webserver, add the webserver security group id to the source on database SSH ingress.

- From Database server environment

```sh
ping -c 1 <WEBSERVER SERVER PUBLIC IP>
```
