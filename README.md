# tf-azurelinux
provision a group of linux vm's in terraform

use case: demos, provision one or more subnets in azure and deploy a group of identical vm's to them.

Usage:
- enter your azure credentials in an <something>.auto.tfvars file, if not you will be prompted for missing variables
- enter some names for azure objects in the same file (vnet name, rg name)
  (an existing vnet and resource group is expected)
- set the subnet ranges to create and configure the range which can access the vm's


some defaults are hardcoded:
- os disk size (40G)
- data disk size (80G)
- installed linux distribution: centos 7.6
- an ssh key for the installed vm's is retrieved from your home drive

Access:
- no public ip's are assigned, so install a jumpstation or add them.