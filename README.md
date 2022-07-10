# WIP Terraform infrastrucutre for [Website Factory](https://github.com/code4romania/website-factory)

Right now there is only one directory and that is for AWS but in the future there will be one more directory for Azure

## Usage AWS

To use the terraform infrastructure you need to execute in each folder the next commands:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

---

You have to execute in a specific order:

1. Change the details in local.tf for each ONG
2. Plan & Apply changes

---

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws_cli](#requirement\_aws) | >= 2.6.0 |
