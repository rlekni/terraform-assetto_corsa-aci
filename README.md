# terraform-assetto_corsa-aci
Terraform to spin up Assetto Corsa server-manager on Azure Container Instances


## Current limitations

The server can't be registered to lobby, because of ACI limiting port binding to TCP or UDP per port. As well as each entry for port has to be unique.