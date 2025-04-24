# Installation/ Setup
## Clone this repo and change into directory of repo

```shell
git clone https://github.com/American-Cloud/ACE-TF-Examples.git && cd ACE-TF-Examples
```

## Setup API Environment variables
```
export CLOUDSTACK_API_URL="https://gateway00.americancloud.com:8443/client/api"
export CLOUDSTACK_API_KEY="<key>"
export CLOUDSTACK_SECRET_KEY="<secret>"
```

## Run bash script to setup VPC or NON-VPC examples
```shell
$ ./enable_non_vpc_example.sh
```
or
```shell
$ ./enable_vpc_example.sh
```
## Update the keypair setting in variables/ace.tfvars
```hcl
 keypair              = "<keypair name here>" # Key pair created in UI. Provide name here.
```

```shell
$ tofu init
```
```
Initializing the backend...

Initializing provider plugins...
- Finding american-cloud/cloudstack versions matching "0.5.0"...
- Installing american-cloud/cloudstack v0.5.0...
- Installed american-cloud/cloudstack v0.5.0 (signed, key ID 11FB071FC10EAE49)

Providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://opentofu.org/docs/cli/plugins/signing/

OpenTofu has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that OpenTofu can guarantee to make the same selections by default when
you run "tofu init" in the future.

OpenTofu has been successfully initialized!

You may now begin working with OpenTofu. Try running "tofu plan" to see
any changes that are required for your infrastructure. All OpenTofu commands
should now work.

If you ever set or change modules or backend configuration for OpenTofu,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Run the Tofu Plan
```shell
$ tofu plan -out example-tfplan -var-file variables/ace.tfvars
```
## Apply the Tofu Plan
```shell
$ tofu apply example-tfplan
```
## Connect to VM you deployed

The tofu apply will show an `Outputs` which will have the public IP address created
```
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

pub_ip = "X.X.X.X"
```
Then you can ssh using the vm with the following format:

```shell
$ ssh -p 222X cloud@X.X.X.X
```
The port number `222X` the `X` is the index number of the server created.

In the `variables/ace.tfvars` you will set the `count` of how many servers to create.  If the count is `1`, then the port number would be `2220` as the indexing count starts at `0`

_***In the `VPC` example the port forwarding is only setup on `web_net_1` instances.  You will need to adjust VPC ACL rules to access instances on the `web_net_2`, as well as putting a SSH private key on the instances you are port forwarding to, so that you can SSH from `web_net_1` instances to `web_net_2`**_

## Clean up
```shell
$ tofu plan --destroy -out example-tfplan -var-file variables/ace.tfvars
$ tofu apply example-tfplan
```
