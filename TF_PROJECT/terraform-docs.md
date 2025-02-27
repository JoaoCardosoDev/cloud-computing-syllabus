## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_http"></a> [http](#provider\_http) (3.4.5)

- <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) (2.35.1)

- <a name="provider_local"></a> [local](#provider\_local) (2.5.2)

## Modules

The following Modules are called:

### <a name="module_ingress"></a> [ingress](#module\_ingress)

Source: ./modules/ingress

Version:

### <a name="module_kubernetes_cluster"></a> [kubernetes\_cluster](#module\_kubernetes\_cluster)

Source: ./modules/cluster

Version:

### <a name="module_odoo_deployment"></a> [odoo\_deployment](#module\_odoo\_deployment)

Source: ./modules/odoo

Version:

### <a name="module_postgresql"></a> [postgresql](#module\_postgresql)

Source: ./modules/database

Version:

## Resources

The following resources are used by this module:

- [kubernetes_manifest.cluster_issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) (resource)
- [kubernetes_namespace.client_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) (resource)
- [local_file.cert_manager_yaml](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) (resource)
- [http_http.cert_manager](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_client"></a> [client](#input\_client)

Description: Client name: Netflix, Meta, etc

Type: `string`

### <a name="input_domain"></a> [domain](#input\_domain)

Description: Domain Name (ex: www.example.com)

Type: `string`

### <a name="input_env"></a> [env](#input\_env)

Description: Environments: dev, qa, prod, etc

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_db_name"></a> [db\_name](#input\_db\_name)

Description: DB name

Type: `string`

Default: `"odoo"`

### <a name="input_db_password"></a> [db\_password](#input\_db\_password)

Description: DB password

Type: `string`

Default: `"odoo"`

### <a name="input_db_user"></a> [db\_user](#input\_db\_user)

Description: DB user

Type: `string`

Default: `"odoo"`

### <a name="input_replicas"></a> [replicas](#input\_replicas)

Description: Replicas(number) for Odoo

Type: `number`

Default: `1`

## Outputs

The following outputs are exported:

### <a name="output_cluster_issuer_name"></a> [cluster\_issuer\_name](#output\_cluster\_issuer\_name)

Description: The name of the ClusterIssuer resource

### <a name="output_ingress_url"></a> [ingress\_url](#output\_ingress\_url)

Description: The URL for accessing the Odoo application

### <a name="output_namespace"></a> [namespace](#output\_namespace)

Description: The namespace created for the client
