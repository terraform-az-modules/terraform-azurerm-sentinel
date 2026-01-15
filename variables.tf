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
  default     = "https://github.com/terraform-az-modules/terraform-azure-sentinel"
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
  description = "Enable Fusion alert rule."
  default     = false
}

variable "fusion_alert_rule_template_guid" {
  type        = string
  description = "Fusion alert rule template GUID."
  default     = "f71aba3d-28fb-450b-b192-4e76a83015c8"
}

variable "fusion_enabled" {
  type        = bool
  description = "Enable fusion rule execution."
  default     = false
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
  description = "Fusion rule sources configuration."
  default     = []
}

##-----------------------------------------------------------------------------
# ML Behavior Analytics Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_ml_behavior_analytics_rule" {
  type        = bool
  description = "Enable ML Behavior Analytics rule."
  default     = false
}

variable "ml_behavior_analytics_template_guid" {
  type        = string
  description = "ML Behavior Analytics template GUID."
  default     = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
}

variable "ml_behavior_analytics_enabled" {
  type        = bool
  description = "Enable ML Behavior Analytics execution."
  default     = false
}

##-----------------------------------------------------------------------------
# MS Security Incident Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_ms_security_incident_rule" {
  type        = bool
  description = "Enable MS Security Incident rule."
  default     = false
}

variable "ms_security_display_name" {
  type        = string
  description = "Display name for MS Security Incident rule."
  default     = "MS Security Incident Alert Rule"
}

variable "ms_security_product_filter" {
  type        = string
  description = "Product filter for MS Security Incident."
  default     = "Microsoft Cloud App Security"
}

variable "ms_security_severity_filter" {
  type        = list(string)
  description = "Severity filter for MS Security Incident."
  default     = ["High", "Medium"]
}

variable "ms_security_template_guid" {
  type        = string
  description = "MS Security template GUID."
  default     = null
}

variable "ms_security_description" {
  type        = string
  description = "Description for MS Security Incident rule."
  default     = null
}

variable "ms_security_enabled" {
  type        = bool
  description = "Enable MS Security Incident execution."
  default     = false
}

variable "ms_security_display_name_filter" {
  type        = list(string)
  description = "Display name filter."
  default     = []
}

variable "ms_security_display_name_exclude_filter" {
  type        = list(string)
  description = "Display name exclude filter."
  default     = []
}

##-----------------------------------------------------------------------------
# NRT Alert Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_nrt_rule" {
  type        = bool
  description = "Enable NRT alert rule."
  default     = false
}

variable "nrt_display_name" {
  type        = string
  description = "Display name for NRT rule."
  default     = "NRT Alert Rule"
}

variable "nrt_severity" {
  type        = string
  description = "Severity for NRT rule."
  default     = "High"
}

variable "nrt_query" {
  type        = string
  description = "KQL query for NRT rule."
  default     = ""
}

variable "nrt_template_guid" {
  type        = string
  description = "NRT template GUID."
  default     = null
}

variable "nrt_template_version" {
  type        = string
  description = "NRT template version."
  default     = null
}

variable "nrt_description" {
  type        = string
  description = "Description for NRT rule."
  default     = null
}

variable "nrt_enabled" {
  type        = bool
  description = "Enable NRT rule execution."
  default     = false
}

variable "nrt_custom_details" {
  type        = map(string)
  description = "Custom details for NRT rule."
  default     = {}
}

variable "nrt_suppression_enabled" {
  type        = bool
  description = "Enable suppression for NRT rule."
  default     = false
}

variable "nrt_suppression_duration" {
  type        = string
  description = "Suppression duration."
  default     = "PT5H"
}

variable "nrt_tactics" {
  type        = list(string)
  description = "MITRE ATT&CK tactics."
  default     = []
}

variable "nrt_techniques" {
  type        = list(string)
  description = "MITRE ATT&CK techniques."
  default     = []
}

variable "nrt_event_grouping" {
  type = object({
    aggregation_method = string
  })
  description = "Event grouping configuration."
  default     = null
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
  description = "Alert details override configuration."
  default     = null
}

variable "nrt_entity_mappings" {
  type = list(object({
    entity_type = string
    field_mappings = list(object({
      identifier  = string
      column_name = string
    }))
  }))
  description = "Entity mappings configuration."
  default     = []
}

variable "nrt_sentinel_entity_mappings" {
  type = list(object({
    column_name = string
  }))
  description = "Sentinel entity mappings."
  default     = []
}

variable "nrt_incident_configuration" {
  type        = any
  description = "Incident configuration."
  default     = null
}

##-----------------------------------------------------------------------------
# Scheduled Alert Rule Variables (NON-NONSENSE DEFAULTS ON)
##-----------------------------------------------------------------------------
variable "enable_scheduled_rule" {
  type        = bool
  description = "Enable Scheduled alert rule."
  default     = true
}

variable "scheduled_display_name" {
  type        = string
  description = "Display name for Scheduled rule."
  default     = "Azure Activity - Privileged Ops / Security Sensitive Changes"
}

variable "scheduled_severity" {
  type        = string
  description = "Severity for Scheduled rule."
  default     = "Medium"
}

variable "scheduled_query" {
  type        = string
  description = "KQL query for Scheduled rule."
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
}

variable "scheduled_template_guid" {
  type        = string
  description = "Scheduled template GUID."
  default     = null
}

variable "scheduled_template_version" {
  type        = string
  description = "Scheduled template version."
  default     = null
}

variable "scheduled_description" {
  type        = string
  description = "Description for Scheduled rule."
  default     = "Detects privileged/critical Azure control-plane changes from AzureActivity (RBAC, policy, RG delete, NSG rules, Public IP)."
}

variable "scheduled_enabled" {
  type        = bool
  description = "Enable Scheduled rule execution."
  default     = true
}

variable "scheduled_query_frequency" {
  type        = string
  description = "Query frequency."
  default     = "PT5M"
}

variable "scheduled_query_period" {
  type        = string
  description = "Query period."
  default     = "PT1H"
}

variable "scheduled_trigger_operator" {
  type        = string
  description = "Trigger operator."
  default     = "GreaterThan"
}

variable "scheduled_trigger_threshold" {
  type        = number
  description = "Trigger threshold."
  default     = 0
}

variable "scheduled_suppression_enabled" {
  type        = bool
  description = "Enable suppression."
  default     = false
}

variable "scheduled_suppression_duration" {
  type        = string
  description = "Suppression duration."
  default     = "PT1H"
}

variable "scheduled_custom_details" {
  type        = map(string)
  description = "Custom details."
  default = {
    operation = "OperationNameValue"
    caller    = "Caller"
    rg        = "ResourceGroup"
  }
}

variable "scheduled_tactics" {
  type        = list(string)
  description = "MITRE ATT&CK tactics."
  default     = ["PrivilegeEscalation", "DefenseEvasion", "Impact"]
}

variable "scheduled_techniques" {
  type        = list(string)
  description = "MITRE ATT&CK techniques."
  default     = ["T1098", "T1562", "T1485"]
}

variable "scheduled_event_grouping" {
  type = object({
    aggregation_method = string
  })
  description = "Event grouping configuration."
  default     = null
}

variable "scheduled_alert_details_override" {
  type        = any
  description = "Alert details override configuration."
  default     = null
}

variable "scheduled_entity_mappings" {
  type        = list(any)
  description = "Entity mappings configuration."
  default     = []
}

variable "scheduled_sentinel_entity_mappings" {
  type        = list(any)
  description = "Sentinel entity mappings."
  default     = []
}

variable "scheduled_incident_configuration" {
  type        = any
  description = "Incident configuration."
  default     = null
}

##-----------------------------------------------------------------------------
# Threat Intelligence Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_threat_intelligence_rule" {
  type        = bool
  description = "Enable Threat Intelligence rule."
  default     = false
}

variable "threat_intelligence_template_guid" {
  type        = string
  description = "Threat Intelligence template GUID."
  default     = "0dd422ee-e6af-4204-b219-f59ac172e4c6"
}

variable "threat_intelligence_enabled" {
  type        = bool
  description = "Enable Threat Intelligence execution."
  default     = false
}

##-----------------------------------------------------------------------------
# Automation Rule Variables (kept OFF)
##-----------------------------------------------------------------------------
variable "enable_automation_rule" {
  type        = bool
  description = "Enable Automation rule."
  default     = false
}

variable "automation_rule_name" {
  type        = string
  description = "Automation rule name (UUID format)."
  default     = "00000000-0000-0000-0000-000000000001"
}

variable "automation_display_name" {
  type        = string
  description = "Automation rule display name."
  default     = "Automation Rule"
}

variable "automation_order" {
  type        = number
  description = "Automation rule order."
  default     = 1
}

variable "automation_enabled" {
  type        = bool
  description = "Enable automation rule."
  default     = false
}

variable "automation_expiration" {
  type        = string
  description = "Automation rule expiration date."
  default     = null
}

variable "automation_triggers_on" {
  type        = string
  description = "What triggers the automation."
  default     = "Incidents"
}

variable "automation_triggers_when" {
  type        = string
  description = "When to trigger automation."
  default     = "Created"
}

variable "automation_condition_json" {
  type        = string
  description = "Condition JSON for automation rule."
  default     = null
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
  description = "Incident actions."
  default     = []
}

variable "automation_action_tasks" {
  type = list(object({
    order       = number
    title       = string
    description = string
  }))
  description = "Task actions."
  default     = []
}

variable "automation_action_playbooks" {
  type = list(object({
    logic_app_id = string
    order        = number
    tenant_id    = string
  }))
  description = "Playbook actions."
  default     = []
}
