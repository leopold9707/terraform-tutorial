# 테라폼을 사용하여 오픈스택 및 AWS에 리소스 배포하기

테라폼 학습 과정을 기록 정리하기 위해 해당 Repository를 작성한다.

## Terraform Tutorial

### Terraform Installation(v0.12.29)

v0.12.29가 latest stable version이 아닐 수 있으므로, https://releases.hashicorp.com/terraform/ 에서 사용가능한 release를 확인 후 설치하도록 한다.

GUI가 있는 경우 https://www.terraform.io/downloads.html 에서 설치할 수 있다. 아래는 리눅스 쉘에서 설치 하는 방법이다.

```
$ sudo yum install wget unzip
(Ubuntu의 경우 yum 대신 apt-get)
$ cd /usr/local/bin
$ sudo wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
$ sudo unzip ./terraform_0.12.29_linux_amd64.zip
```

mac OS에서는 brew를 이용해 설치한다.
```
$ brew install terraform
```

설치가 잘 되었는지 확인해본다.
```
$ terraform -v
```

### Provider Authentication

테라폼이 오픈스택과 AWS에 접근할 수 있도록 사용자 인증 정보를 준비한다.

* 오픈스택 = openrc.sh

* AWS = credential file

### Terraform HCL Script

example source code - https://github.com/diodonfrost (오픈스택, AWS 외에도 vsphere, gcp, azure 등 여러 provider에 대한 example 코드를 작성해두셨다.)

* provider란

* resource란

* data란

* variable이란

* output 이란

### Infra Deployment

```
$ terraform init
$ terraform plan
$ terraform apply
yes
$ terraform apply -auto-approve
```

### Destruction

```
$ terraform destroy
yes
$ terraform destroy -auto-approve
```


