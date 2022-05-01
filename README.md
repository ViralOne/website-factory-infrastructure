# WIP Terraform infrastrucutre for [Website Factory](https://github.com/code4romania/website-factory)

Right now there is only one directory for AWS but in the future there will be one more fore Azure

## Usage

To run the AWS infrastructure you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

In each folder:
- EC2
- RDS
- S3
- SES

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws_cli](#requirement\_aws) | >= 2.6.0 |
