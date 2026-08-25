## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| automation\_action\_incidents | Incident actions. | <pre>list(object({<br>    order                  = number<br>    status                 = string<br>    severity               = string<br>    owner_id               = string<br>    labels                 = list(string)<br>    classification         = string<br>    classification_comment = string<br>  }))</pre> | `[]` | no |
| automation\_action\_playbooks | Playbook actions. | <pre>list(object({<br>    logic_app_id = string<br>    order        = number<br>    tenant_id    = string<br>  }))</pre> | `[]` | no |
| automation\_action\_tasks | Task actions. | <pre>list(object({<br>    order       = number<br>    title       = string<br>    description = string<br>  }))</pre> | `[]` | no |
| automation\_condition\_json | Condition JSON for automation rule. | `string` | `null` | no |
| automation\_display\_name | Automation rule display name. | `string` | `"Automation Rule"` | no |
| automation\_enabled | Enable automation rule. | `bool` | `false` | no |
| automation\_expiration | Automation rule expiration date. | `string` | `null` | no |
| automation\_order | Automation rule order. | `number` | `1` | no |
| automation\_rule\_name | Automation rule name (UUID format). | `string` | `null` | no |
| automation\_triggers\_on | What triggers the automation. | `string` | `"Incidents"` | no |
| automation\_triggers\_when | When to trigger automation. | `string` | `"Created"` | no |
| custom\_name | Override default naming convention | `string` | `null` | no |
| deployment\_mode | Specifies how the infrastructure/resource is deployed. | `string` | `"terraform"` | no |
| enable | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| enable\_aad\_connector | Enable Azure Active Directory data connector (often locked by Defender portal primary workspace). | `bool` | `false` | no |
| enable\_aatp\_connector | Enable Azure Advanced Threat Protection / Defender for Identity data connector. | `bool` | `false` | no |
| enable\_asc\_connector | Enable Azure Security Center / Defender for Cloud data connector. | `bool` | `true` | no |
| enable\_automation\_rule | Enable Automation rule. | `bool` | `false` | no |
| enable\_dynamics\_connector | Enable Dynamics 365 data connector. | `bool` | `false` | no |
| enable\_fusion\_rule | Enable Fusion alert rule. | `bool` | `false` | no |
| enable\_iot\_connector | Enable IoT data connector. | `bool` | `false` | no |
| enable\_mcas\_connector | Enable Microsoft Cloud App Security / Defender for Cloud Apps data connector. | `bool` | `false` | no |
| enable\_mdatp\_connector | Enable Microsoft Defender for Endpoint (MDATP) data connector. | `bool` | `false` | no |
| enable\_ml\_behavior\_analytics\_rule | Enable ML Behavior Analytics rule. | `bool` | `false` | no |
| enable\_ms\_security\_incident\_rule | Enable MS Security Incident rule. | `bool` | `false` | no |
| enable\_mti\_connector | Enable Microsoft Threat Intelligence data connector. | `bool` | `true` | no |
| enable\_mtp\_connector | Enable Microsoft Threat Protection / Defender XDR data connector. | `bool` | `false` | no |
| enable\_nrt\_rule | Enable NRT alert rule. | `bool` | `false` | no |
| enable\_office365\_connector | Enable Office 365 data connector. | `bool` | `false` | no |
| enable\_office365\_project\_connector | Enable Office 365 Project data connector. | `bool` | `false` | no |
| enable\_office\_atp\_connector | Enable Office ATP data connector. | `bool` | `false` | no |
| enable\_office\_irm\_connector | Enable Office IRM data connector. | `bool` | `false` | no |
| enable\_office\_powerbi\_connector | Enable Office Power BI data connector. | `bool` | `false` | no |
| enable\_scheduled\_rule | Enable Scheduled alert rule. | `bool` | `true` | no |
| enable\_threat\_intelligence\_rule | Enable Threat Intelligence rule. | `bool` | `false` | no |
| enable\_ti\_connector | Enable Threat Intelligence data connector (often requires tenant admin roles). | `bool` | `false` | no |
| enable\_ti\_taxii\_connector | Enable Threat Intelligence TAXII data connector. | `bool` | `false` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `"dev"` | no |
| extra\_tags | Extra tags to apply to resources. | `map(string)` | `{}` | no |
| fusion\_alert\_rule\_template\_guid | Fusion alert rule template GUID. | `string` | `"f71aba3d-28fb-450b-b192-4e76a83015c8"` | no |
| fusion\_enabled | Enable fusion rule execution. | `bool` | `false` | no |
| fusion\_sources | Fusion rule sources configuration. | <pre>list(object({<br>    name    = string<br>    enabled = bool<br>    sub_types = list(object({<br>      name               = string<br>      enabled            = bool<br>      severities_allowed = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| label\_order | Order of labels used to construct resource names or tags. | `list(any)` | <pre>[<br>  "name",<br>  "environment",<br>  "location"<br>]</pre> | no |
| location | Azure region for resources. | `string` | `"centralus"` | no |
| log\_analytics\_workspace\_id | The resource ID of the Log Analytics Workspace where Sentinel is deployed. | `string` | n/a | yes |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| mcas\_alerts\_enabled | Enable alerts for Microsoft Cloud App Security connector (relevant only if enable\_mcas\_connector=true). | `bool` | `false` | no |
| mcas\_discovery\_logs\_enabled | Enable discovery logs for Microsoft Cloud App Security connector (relevant only if enable\_mcas\_connector=true). | `bool` | `false` | no |
| ml\_behavior\_analytics\_enabled | Enable ML Behavior Analytics execution. | `bool` | `false` | no |
| ml\_behavior\_analytics\_template\_guid | ML Behavior Analytics template GUID. | `string` | `"737a2ce1-70a3-4968-9e90-3e6aca836abf"` | no |
| ms\_security\_description | Description for MS Security Incident rule. | `string` | `null` | no |
| ms\_security\_display\_name | Display name for MS Security Incident rule. | `string` | `"MS Security Incident Alert Rule"` | no |
| ms\_security\_display\_name\_exclude\_filter | Display name exclude filter. | `list(string)` | `[]` | no |
| ms\_security\_display\_name\_filter | Display name filter. | `list(string)` | `[]` | no |
| ms\_security\_enabled | Enable MS Security Incident execution. | `bool` | `false` | no |
| ms\_security\_product\_filter | Product filter for MS Security Incident. | `string` | `"Microsoft Cloud App Security"` | no |
| ms\_security\_severity\_filter | Severity filter for MS Security Incident. | `list(string)` | <pre>[<br>  "High",<br>  "Medium"<br>]</pre> | no |
| ms\_security\_template\_guid | MS Security template GUID. | `string` | `null` | no |
| mti\_lookback\_date | Lookback date for Microsoft Threat Intelligence connector (ISO 8601). | `string` | `"1970-01-01T00:00:00Z"` | no |
| name | Name (e.g. `app` or `cluster`). | `string` | `"core"` | no |
| nrt\_alert\_details\_override | Alert details override configuration. | <pre>object({<br>    description_format   = string<br>    display_name_format  = string<br>    severity_column_name = string<br>    tactics_column_name  = string<br>    dynamic_properties = list(object({<br>      name  = string<br>      value = string<br>    }))<br>  })</pre> | `null` | no |
| nrt\_custom\_details | Custom details for NRT rule. | `map(string)` | `{}` | no |
| nrt\_description | Description for NRT rule. | `string` | `null` | no |
| nrt\_display\_name | Display name for NRT rule. | `string` | `"NRT Alert Rule"` | no |
| nrt\_enabled | Enable NRT rule execution. | `bool` | `false` | no |
| nrt\_entity\_mappings | Entity mappings configuration. | <pre>list(object({<br>    entity_type = string<br>    field_mappings = list(object({<br>      identifier  = string<br>      column_name = string<br>    }))<br>  }))</pre> | `[]` | no |
| nrt\_event\_grouping | Event grouping configuration. | <pre>object({<br>    aggregation_method = string<br>  })</pre> | `null` | no |
| nrt\_incident\_configuration | Incident configuration. | `any` | `null` | no |
| nrt\_query | KQL query for NRT rule. | `string` | `""` | no |
| nrt\_sentinel\_entity\_mappings | Sentinel entity mappings. | <pre>list(object({<br>    column_name = string<br>  }))</pre> | `[]` | no |
| nrt\_severity | Severity for NRT rule. | `string` | `"High"` | no |
| nrt\_suppression\_duration | Suppression duration. | `string` | `"PT5H"` | no |
| nrt\_suppression\_enabled | Enable suppression for NRT rule. | `bool` | `false` | no |
| nrt\_tactics | MITRE ATT&CK tactics. | `list(string)` | `[]` | no |
| nrt\_techniques | MITRE ATT&CK techniques. | `list(string)` | `[]` | no |
| nrt\_template\_guid | NRT template GUID. | `string` | `null` | no |
| nrt\_template\_version | NRT template version. | `string` | `null` | no |
| office365\_exchange\_enabled | Enable Exchange logs for Office 365 connector. | `bool` | `false` | no |
| office365\_sharepoint\_enabled | Enable SharePoint logs for Office 365 connector. | `bool` | `false` | no |
| office365\_teams\_enabled | Enable Teams logs for Office 365 connector. | `bool` | `false` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azurerm-sentinel"` | no |
| resource\_position\_prefix | Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.<br><br>- If true, the keyword is prepended: "vnet-core-dev".<br>- If false, the keyword is appended: "core-dev-vnet".<br><br>This helps maintain naming consistency based on organizational preferences. | `bool` | `true` | no |
| scheduled\_alert\_details\_override | Alert details override configuration. | <pre>object({<br>    description_format   = string<br>    display_name_format  = string<br>    severity_column_name = string<br>    tactics_column_name  = string<br>    dynamic_properties = list(object({<br>      name  = string<br>      value = string<br>    }))<br>  })</pre> | `null` | no |
| scheduled\_custom\_details | Custom details. | `map(string)` | <pre>{<br>  "caller": "Caller",<br>  "operation": "OperationNameValue",<br>  "rg": "ResourceGroup"<br>}</pre> | no |
| scheduled\_description | Description for Scheduled rule. | `string` | `"Detects privileged/critical Azure control-plane changes from AzureActivity."` | no |
| scheduled\_display\_name | Display name for Scheduled rule. | `string` | `"Azure Activity - Privileged Ops / Security Sensitive Changes"` | no |
| scheduled\_enabled | Enable Scheduled rule execution. | `bool` | `true` | no |
| scheduled\_entity\_mappings | Entity mappings configuration. | <pre>list(object({<br>    entity_type = string<br>    field_mappings = list(object({<br>      identifier  = string<br>      column_name = string<br>    }))<br>  }))</pre> | `[]` | no |
| scheduled\_event\_grouping | Event grouping configuration. | <pre>object({<br>    aggregation_method = string<br>  })</pre> | `null` | no |
| scheduled\_incident\_configuration | Incident configuration. | `any` | `null` | no |
| scheduled\_query | KQL query for Scheduled rule. | `string` | `"AzureActivity\n| where OperationNameValue has_any (\n  \"Microsoft.Authorization/roleAssignments/write\",\n  \"Microsoft.Authorization/roleAssignments/delete\",\n  \"Microsoft.Authorization/policyAssignments/write\",\n  \"Microsoft.Resources/subscriptions/resourceGroups/delete\",\n  \"Microsoft.Network/networkSecurityGroups/securityRules/write\",\n  \"Microsoft.Network/publicIPAddresses/write\"\n)\n| project\n    TimeGenerated,\n    Caller,\n    OperationNameValue,\n    ResourceGroup,\n    ResourceId,\n    ActivityStatusValue,\n    SubscriptionId\n"` | no |
| scheduled\_query\_frequency | Query frequency. | `string` | `"PT5M"` | no |
| scheduled\_query\_period | Query period. | `string` | `"PT1H"` | no |
| scheduled\_sentinel\_entity\_mappings | Sentinel entity mappings. | <pre>list(object({<br>    column_name = string<br>  }))</pre> | `[]` | no |
| scheduled\_severity | Severity for Scheduled rule. | `string` | `"Medium"` | no |
| scheduled\_suppression\_duration | Suppression duration. | `string` | `"PT1H"` | no |
| scheduled\_suppression\_enabled | Enable suppression. | `bool` | `false` | no |
| scheduled\_tactics | MITRE ATT&CK tactics. | `list(string)` | <pre>[<br>  "PrivilegeEscalation",<br>  "DefenseEvasion",<br>  "Impact"<br>]</pre> | no |
| scheduled\_techniques | MITRE ATT&CK techniques. | `list(string)` | <pre>[<br>  "T1098",<br>  "T1562",<br>  "T1485"<br>]</pre> | no |
| scheduled\_template\_guid | Scheduled template GUID. | `string` | `null` | no |
| scheduled\_template\_version | Scheduled template version. | `string` | `null` | no |
| scheduled\_trigger\_operator | Trigger operator. | `string` | `"GreaterThan"` | no |
| scheduled\_trigger\_threshold | Trigger threshold. | `number` | `0` | no |
| subscription\_id | The Azure subscription ID. | `string` | n/a | yes |
| tenant\_id | The Azure AD tenant ID. | `string` | n/a | yes |
| threat\_intelligence\_enabled | Enable Threat Intelligence execution. | `bool` | `false` | no |
| threat\_intelligence\_template\_guid | Threat Intelligence template GUID. | `string` | `"0dd422ee-e6af-4204-b219-f59ac172e4c6"` | no |
| ti\_lookback\_date | Lookback date for Threat Intelligence connector (ISO 8601). | `string` | `"1970-01-01T00:00:00Z"` | no |
| ti\_taxii\_api\_root\_url | API root URL for TAXII server. | `string` | `""` | no |
| ti\_taxii\_collection\_id | Collection ID for TAXII feed. | `string` | `""` | no |
| ti\_taxii\_display\_name | Display name for TAXII connector. | `string` | `null` | no |
| ti\_taxii\_lookback\_date | Lookback date for TAXII connector (ISO 8601). | `string` | `"1970-01-01T00:00:00Z"` | no |
| ti\_taxii\_password | Password for TAXII authentication. | `string` | `""` | no |
| ti\_taxii\_polling\_frequency | Polling frequency for TAXII connector (OnceAMinute, OnceAnHour, OnceADay). | `string` | `"OnceAnHour"` | no |
| ti\_taxii\_user\_name | Username for TAXII authentication. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| aad\_connector\_id | The ID of the Azure Active Directory Data Connector |
| aatp\_connector\_id | The ID of the Azure Advanced Threat Protection Data Connector |
| asc\_connector\_id | The ID of the Azure Security Center Data Connector |
| dynamics\_connector\_id | The ID of the Dynamics 365 Data Connector |
| iot\_connector\_id | The ID of the IoT Data Connector |
| mcas\_connector\_id | The ID of the Microsoft Cloud App Security Data Connector |
| mdatp\_connector\_id | The ID of the Microsoft Defender Advanced Threat Protection Data Connector |
| mti\_connector\_id | The ID of the Microsoft Threat Intelligence Data Connector |
| mtp\_connector\_id | The ID of the Microsoft Threat Protection Data Connector |
| office365\_connector\_id | The ID of the Office 365 Data Connector |
| office365\_project\_connector\_id | The ID of the Office 365 Project Data Connector |
| office\_atp\_connector\_id | The ID of the Office ATP Data Connector |
| office\_irm\_connector\_id | The ID of the Office IRM Data Connector |
| office\_powerbi\_connector\_id | The ID of the Office Power BI Data Connector |
| sentinel\_alert\_rule\_fusion\_id | The ID of the Sentinel Fusion Alert Rule |
| sentinel\_alert\_rule\_ml\_behavior\_analytics\_id | The ID of the Sentinel Machine Learning Behavior Analytics Alert Rule |
| sentinel\_alert\_rule\_ms\_security\_incident\_id | The ID of the Sentinel MS Security Incident Alert Rule |
| sentinel\_alert\_rule\_nrt\_id | The ID of the Sentinel NRT Alert Rule |
| sentinel\_alert\_rule\_scheduled\_id | The ID of the Sentinel Scheduled Alert Rule |
| sentinel\_alert\_rule\_threat\_intelligence\_id | The ID of the Sentinel Threat Intelligence Alert Rule |
| sentinel\_automation\_rule\_id | The ID of the Sentinel Automation Rule |
| sentinel\_workspace\_id | The ID of the Sentinel enabled Log Analytics Workspace |
| ti\_connector\_id | The ID of the Threat Intelligence Data Connector |
| ti\_taxii\_connector\_id | The ID of the Threat Intelligence TAXII Data Connector |

