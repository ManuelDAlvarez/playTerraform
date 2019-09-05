# playTerraform
Playing with Terraform Akamai Connector

This project is to test some of the available commands in the Terraform provider. At the moment it creates a configuration, update an existing one, and activates it to Akamai Staging. Important files:

*connections.tf*

Defines the providers. Run terraform init to install the Akamai provider

*data.tf*

I am using config.json files to describe the configurations. 

To control an existing configuration, download its JSON and provide its exact name on the akamai_property.name (in the resources.tf file).

There are different ways to download an existing configuration JSON. This is a sample command to download a configuration using PAPI

`http --auth-type edgegrid -a ASS: :/papi/v1/properties/prp_123456/versions/777/rules contractId==ctr_ACME groupId==grp_ACME > rules.json`

To create a new configuration, either hand craft a JSON from scratch or download an existing JSON and modify it as needed. I like starting from a working example; thus, I recommend the latter. Use a new property name on akamai_property.name

*resources.tf*

Infrastructure definition. In this case, it describes 
* a new Edge Hostname. If it is an existing one, you must provide the correct network (IPv4 or IPv6)
* Two configurations. I took the rruleile format from the last lines of their respective rules.json file. 
* One activation. Activations are handled as resources. Please note that deleting an activation will result in a deactivation. Use akamai_property_activation.activate=false instead.

# Execute
To effectively use the variables and activate a configuration, use soemthing like

`$ terraform apply -var="akamnetwork=STAGING" -var="activatedirective=true"`
