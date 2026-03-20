##-----------------------------------------------------------------------------
## Naming convention
##-----------------------------------------------------------------------------
variable "custom_name" {
  type        = string
  default     = null
  description = "Override default naming convention"
}

variable "resource_position_prefix" {
  type        = bool
  default     = true
  description = <<EOT
Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.

- If true, the keyword is prepended: "vnet-core-dev".
- If false, the keyword is appended: "core-dev-vnet".

This helps maintain naming consistency based on organizational preferences.
EOT
}

##-----------------------------------------------------------------------------
## Labels
##-----------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = "core"
  description = "Name (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "managedby" {
  type        = string
  default     = "terraform-az-modules"
  description = "ManagedBy, eg 'terraform-az-modules'."
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to apply to resources."
}

variable "repository" {
  type        = string
  default     = "https://github.com/terraform-az-modules/terraform-azurerm-sentinel"
  description = "Terraform current module repo"

  validation {
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "location" {
  type        = string
  default     = "centralus"
  description = "Azure region for resources."
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment", "location"]
  description = "Order of labels used to construct resource names or tags."
}

##-----------------------------------------------------------------------------
## Global Variables
##-----------------------------------------------------------------------------
variable "enable" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to deploy Sentinel resources."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The resource ID of the Log Analytics Workspace where Sentinel is deployed."
}

variable "tenant_id" {
  type        = string
  description = "The Azure AD tenant ID."
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID."
}

##-----------------------------------------------------------------------------
# Data Connector Enable/Disable Flags (non-nonsense defaults)
##-----------------------------------------------------------------------------
variable "enable_aad_connector" {
  type        = bool
  default     = false
  description = "Enable Azure Active Directory data connector (often locked by Defender portal primary workspace)."
}

variable "enable_aatp_connector" {
  type        = bool
  default     = false
  description = "Enable Azure Advanced Threat Protection / Defender for Identity data connector."
}

variable "enable_asc_connector" {
  type        = bool
  default     = true
  description = "Enable Azure Security Center / Defender for Cloud data connector."
}

variable "enable_dynamics_connector" {
  type        = bool
  default     = false
  description = "Enable Dynamics 365 data connector."
}

variable "enable_iot_connector" {
  type        = bool
  default     = false
  description = "Enable IoT data connector."
}

variable "enable_mcas_connector" {
  type        = bool
  default     = false
  description = "Enable Microsoft Cloud App Security / Defender for Cloud Apps data connector."
}

variable "enable_mdatp_connector" {
  type        = bool
  default     = false
  description = "Enable Microsoft Defender for Endpoint (MDATP) data connector."
}

variable "enable_mti_connector" {
  type        = bool
  default     = true
  description = "Enable Microsoft Threat Intelligence data connector."
}

variable "enable_mtp_connector" {
  type        = bool
  default     = false
  description = "Enable Microsoft Threat Protection / Defender XDR data connector."
}

variable "enable_office365_connector" {
  type        = bool
  default     = false
  description = "Enable Office 365 data connector."
}

variable "enable_office365_project_connector" {
  type        = bool
  default     = false
  description = "Enable Office 365 Project data connector."
}

variable "enable_office_atp_connector" {
  type        = bool
  default     = false
  description = "Enable Office ATP data connector."
}

variable "enable_office_irm_connector" {
  type        = bool
  default     = false
  description = "Enable Office IRM data connector."
}

variable "enable_office_powerbi_connector" {
  type        = bool
  default     = false
  description = "Enable Office Power BI data connector."
}

variable "enable_ti_connector" {
  type        = bool
  default     = false
  description = "Enable Threat Intelligence data connector (often requires tenant admin roles)."
}

variable "enable_ti_taxii_connector" {
  type        = bool
  default     = false
  description = "Enable Threat Intelligence TAXII data connector."
}

##-----------------------------------------------------------------------------
# Microsoft Cloud App Security Specific Variables
##-----------------------------------------------------------------------------
variable "mcas_alerts_enabled" {
  type        = bool
  default     = false
  description = "Enable alerts for Microsoft Cloud App Security connector (relevant only if enable_mcas_connector=true)."
}

variable "mcas_discovery_logs_enabled" {
  type        = bool
  default     = false
  description = "Enable discovery logs for Microsoft Cloud App Security connector (relevant only if enable_mcas_connector=true)."
}

##-----------------------------------------------------------------------------
# Office 365 Specific Variables
##-----------------------------------------------------------------------------
variable "office365_exchange_enabled" {
  type        = bool
  default     = false
  description = "Enable Exchange logs for Office 365 connector."
}

variable "office365_teams_enabled" {
  type        = bool
  default     = false
  description = "Enable Teams logs for Office 365 connector."
}

variable "office365_sharepoint_enabled" {
  type        = bool
  default     = false
  description = "Enable SharePoint logs for Office 365 connector."
}

##-----------------------------------------------------------------------------
# Microsoft Threat Intelligence Variables
##-----------------------------------------------------------------------------
variable "mti_lookback_date" {
  type        = string
  default     = "1970-01-01T00:00:00Z"
  description = "Lookback date for Microsoft Threat Intelligence connector (ISO 8601)."
}

##-----------------------------------------------------------------------------
# Threat Intelligence Variables
##-----------------------------------------------------------------------------
variable "ti_lookback_date" {
  type        = string
  default     = "1970-01-01T00:00:00Z"
  description = "Lookback date for Threat Intelligence connector (ISO 8601)."
}

##-----------------------------------------------------------------------------
# Threat Intelligence TAXII Variables
##-----------------------------------------------------------------------------
variable "ti_taxii_display_name" {
  type        = string
  default     = null
  description = "Display name for TAXII connector."
}

variable "ti_taxii_api_root_url" {
  type        = string
  default     = ""
  description = "API root URL for TAXII server."
}

variable "ti_taxii_collection_id" {
  type        = string
  default     = ""
  description = "Collection ID for TAXII feed."
}

variable "ti_taxii_user_name" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Username for TAXII authentication."
}

variable "ti_taxii_password" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Password for TAXII authentication."
}

variable "ti_taxii_polling_frequency" {
  type        = string
  default     = "OnceAnHour"
  description = "Polling frequency for TAXII connector (OnceAMinute, OnceAnHour, OnceADay)."

  validation {
    condition     = contains(["OnceAMinute", "OnceAnHour", "OnceADay"], var.ti_taxii_polling_frequency)
    error_message = "Polling frequency must be OnceAMinute, OnceAnHour, or OnceADay."
  }
}

variable "ti_taxii_lookback_date" {
  type        = string
  default     = "1970-01-01T00:00:00Z"
  description = "Lookback date for TAXII connector (ISO 8601)."
}

##-----------------------------------------------------------------------------
# Fusion Alert Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_fusion_rule" {
  type        = bool
  default     = false
  description = "Enable Fusion alert rule."
}

variable "fusion_alert_rule_template_guid" {
  type        = string
  default     = "f71aba3d-28fb-450b-b192-4e76a83015c8"
  description = "Fusion alert rule template GUID."
}

variable "fusion_enabled" {
  type        = bool
  default     = false
  description = "Enable fusion rule execution."
}

variable "fusion_sources" {
  type = list(object({
    name    = string
    enabled = bool
    sub_types = list(object({
      name               = string
      enabled            = bool
      severities_allowed = list(string)
    }))
  }))
  default     = []
  description = "Fusion rule sources configuration."
}

##-----------------------------------------------------------------------------
# ML Behavior Analytics Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_ml_behavior_analytics_rule" {
  type        = bool
  default     = false
  description = "Enable ML Behavior Analytics rule."
}

variable "ml_behavior_analytics_template_guid" {
  type        = string
  default     = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
  description = "ML Behavior Analytics template GUID."
}

variable "ml_behavior_analytics_enabled" {
  type        = bool
  default     = false
  description = "Enable ML Behavior Analytics execution."
}

##-----------------------------------------------------------------------------
# MS Security Incident Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_ms_security_incident_rule" {
  type        = bool
  default     = false
  description = "Enable MS Security Incident rule."
}

variable "ms_security_display_name" {
  type        = string
  default     = "MS Security Incident Alert Rule"
  description = "Display name for MS Security Incident rule."
}

variable "ms_security_product_filter" {
  type        = string
  default     = "Microsoft Cloud App Security"
  description = "Product filter for MS Security Incident."
}

variable "ms_security_severity_filter" {
  type        = list(string)
  default     = ["High", "Medium"]
  description = "Severity filter for MS Security Incident."
}

variable "ms_security_template_guid" {
  type        = string
  default     = null
  description = "MS Security template GUID."
}

variable "ms_security_description" {
  type        = string
  default     = null
  description = "Description for MS Security Incident rule."
}

variable "ms_security_enabled" {
  type        = bool
  default     = false
  description = "Enable MS Security Incident execution."
}

variable "ms_security_display_name_filter" {
  type        = list(string)
  default     = []
  description = "Display name filter."
}

variable "ms_security_display_name_exclude_filter" {
  type        = list(string)
  default     = []
  description = "Display name exclude filter."
}

##-----------------------------------------------------------------------------
# NRT Alert Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_nrt_rule" {
  type        = bool
  default     = false
  description = "Enable NRT alert rule."
}

variable "nrt_display_name" {
  type        = string
  default     = "NRT Alert Rule"
  description = "Display name for NRT rule."
}

variable "nrt_severity" {
  type        = string
  default     = "High"
  description = "Severity for NRT rule."
}

variable "nrt_query" {
  type        = string
  default     = ""
  description = "KQL query for NRT rule."
}

variable "nrt_template_guid" {
  type        = string
  default     = null
  description = "NRT template GUID."
}

variable "nrt_template_version" {
  type        = string
  default     = null
  description = "NRT template version."
}

variable "nrt_description" {
  type        = string
  default     = null
  description = "Description for NRT rule."
}

variable "nrt_enabled" {
  type        = bool
  default     = false
  description = "Enable NRT rule execution."
}

variable "nrt_custom_details" {
  type        = map(string)
  default     = {}
  description = "Custom details for NRT rule."
}

variable "nrt_suppression_enabled" {
  type        = bool
  default     = false
  description = "Enable suppression for NRT rule."
}

variable "nrt_suppression_duration" {
  type        = string
  default     = "PT5H"
  description = "Suppression duration."
}

variable "nrt_tactics" {
  type        = list(string)
  default     = []
  description = "MITRE ATT&CK tactics."
}

variable "nrt_techniques" {
  type        = list(string)
  default     = []
  description = "MITRE ATT&CK techniques."
}

variable "nrt_event_grouping" {
  type = object({
    aggregation_method = string
  })
  default     = null
  description = "Event grouping configuration."
}

variable "nrt_alert_details_override" {
  type = object({
    description_format   = string
    display_name_format  = string
    severity_column_name = string
    tactics_column_name  = string
    dynamic_properties = list(object({
      name  = string
      value = string
    }))
  })
  default     = null
  description = "Alert details override configuration."
}

variable "nrt_entity_mappings" {
  type = list(object({
    entity_type = string
    field_mappings = list(object({
      identifier  = string
      column_name = string
    }))
  }))
  default     = []
  description = "Entity mappings configuration."
}

variable "nrt_sentinel_entity_mappings" {
  type = list(object({
    column_name = string
  }))
  default     = []
  description = "Sentinel entity mappings."
}

variable "nrt_incident_configuration" {
  type        = any
  default     = null
  description = "Incident configuration."
}

##-----------------------------------------------------------------------------
# Scheduled Alert Rule Variables (DEFAULTS ON)
##-----------------------------------------------------------------------------
variable "enable_scheduled_rule" {
  type        = bool
  default     = true
  description = "Enable Scheduled alert rule."
}

variable "scheduled_display_name" {
  type        = string
  default     = "Azure Activity - Privileged Ops / Security Sensitive Changes"
  description = "Display name for Scheduled rule."
}

variable "scheduled_severity" {
  type        = string
  default     = "Medium"
  description = "Severity for Scheduled rule."
}

variable "scheduled_query" {
  type        = string
  default     = <<-KQL
    AzureActivity
    | where OperationNameValue has_any (
      "Microsoft.Authorization/roleAssignments/write",
      "Microsoft.Authorization/roleAssignments/delete",
      "Microsoft.Authorization/policyAssignments/write",
      "Microsoft.Resources/subscriptions/resourceGroups/delete",
      "Microsoft.Network/networkSecurityGroups/securityRules/write",
      "Microsoft.Network/publicIPAddresses/write"
    )
    | project
        TimeGenerated,
        Caller,
        OperationNameValue,
        ResourceGroup,
        ResourceId,
        ActivityStatusValue,
        SubscriptionId
  KQL
  description = "KQL query for Scheduled rule."
}

variable "scheduled_template_guid" {
  type        = string
  default     = null
  description = "Scheduled template GUID."
}

variable "scheduled_template_version" {
  type        = string
  default     = null
  description = "Scheduled template version."
}

variable "scheduled_description" {
  type        = string
  default     = "Detects privileged/critical Azure control-plane changes from AzureActivity."
  description = "Description for Scheduled rule."
}

variable "scheduled_enabled" {
  type        = bool
  default     = true
  description = "Enable Scheduled rule execution."
}

variable "scheduled_query_frequency" {
  type        = string
  default     = "PT5M"
  description = "Query frequency."
}

variable "scheduled_query_period" {
  type        = string
  default     = "PT1H"
  description = "Query period."
}

variable "scheduled_trigger_operator" {
  type        = string
  default     = "GreaterThan"
  description = "Trigger operator."
}

variable "scheduled_trigger_threshold" {
  type        = number
  default     = 0
  description = "Trigger threshold."
}

variable "scheduled_suppression_enabled" {
  type        = bool
  default     = false
  description = "Enable suppression."
}

variable "scheduled_suppression_duration" {
  type        = string
  default     = "PT1H"
  description = "Suppression duration."
}

variable "scheduled_custom_details" {
  type = map(string)
  default = {
    operation = "OperationNameValue"
    caller    = "Caller"
    rg        = "ResourceGroup"
  }
  description = "Custom details."
}

variable "scheduled_tactics" {
  type        = list(string)
  default     = ["PrivilegeEscalation", "DefenseEvasion", "Impact"]
  description = "MITRE ATT&CK tactics."
}

variable "scheduled_techniques" {
  type        = list(string)
  default     = ["T1098", "T1562", "T1485"]
  description = "MITRE ATT&CK techniques."
}

variable "scheduled_event_grouping" {
  type = object({
    aggregation_method = string
  })
  default     = null
  description = "Event grouping configuration."
}

variable "scheduled_alert_details_override" {
  type = object({
    description_format   = string
    display_name_format  = string
    severity_column_name = string
    tactics_column_name  = string
    dynamic_properties = list(object({
      name  = string
      value = string
    }))
  })
  default     = null
  description = "Alert details override configuration."
}

variable "scheduled_entity_mappings" {
  type = list(object({
    entity_type = string
    field_mappings = list(object({
      identifier  = string
      column_name = string
    }))
  }))
  default     = []
  description = "Entity mappings configuration."
}

variable "scheduled_sentinel_entity_mappings" {
  type = list(object({
    column_name = string
  }))
  default     = []
  description = "Sentinel entity mappings."
}

variable "scheduled_incident_configuration" {
  type        = any
  default     = null
  description = "Incident configuration."
}

##-----------------------------------------------------------------------------
# Threat Intelligence Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_threat_intelligence_rule" {
  type        = bool
  default     = false
  description = "Enable Threat Intelligence rule."
}

variable "threat_intelligence_template_guid" {
  type        = string
  default     = "0dd422ee-e6af-4204-b219-f59ac172e4c6"
  description = "Threat Intelligence template GUID."
}

variable "threat_intelligence_enabled" {
  type        = bool
  default     = false
  description = "Enable Threat Intelligence execution."
}

##-----------------------------------------------------------------------------
# Automation Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_automation_rule" {
  type        = bool
  default     = false
  description = "Enable Automation rule."
}

variable "automation_rule_name" {
  type        = string
  default     = null
  description = "Automation rule name (UUID format)."
}

variable "automation_display_name" {
  type        = string
  default     = "Automation Rule"
  description = "Automation rule display name."
}

variable "automation_order" {
  type        = number
  default     = 1
  description = "Automation rule order."
}

variable "automation_enabled" {
  type        = bool
  default     = false
  description = "Enable automation rule."
}

variable "automation_expiration" {
  type        = string
  default     = null
  description = "Automation rule expiration date."
}

variable "automation_triggers_on" {
  type        = string
  default     = "Incidents"
  description = "What triggers the automation."
}

variable "automation_triggers_when" {
  type        = string
  default     = "Created"
  description = "When to trigger automation."
}

variable "automation_condition_json" {
  type        = string
  default     = null
  description = "Condition JSON for automation rule."
}

variable "automation_action_incidents" {
  type = list(object({
    order                  = number
    status                 = string
    severity               = string
    owner_id               = string
    labels                 = list(string)
    classification         = string
    classification_comment = string
  }))
  default     = []
  description = "Incident actions."
}

variable "automation_action_tasks" {
  type = list(object({
    order       = number
    title       = string
    description = string
  }))
  default     = []
  description = "Task actions."
}

variable "automation_action_playbooks" {
  type = list(object({
    logic_app_id = string
    order        = number
    tenant_id    = string
  }))
  default     = []
  description = "Playbook actions."
}
