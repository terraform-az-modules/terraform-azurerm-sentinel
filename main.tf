##-----------------------------------------------------------------------------
# Standard Tagging Module – Applies standard tags to all resources for traceability
##-----------------------------------------------------------------------------
module "labels" {
  source          = "terraform-az-modules/tags/azurerm"
  version         = "1.0.2"
  name            = var.custom_name == null ? var.name : var.custom_name
  location        = var.location
  environment     = var.environment
  managedby       = var.managedby
  label_order     = var.label_order
  repository      = var.repository
  deployment_mode = var.deployment_mode
  extra_tags      = var.extra_tags
}

data "azurerm_client_config" "current" {}

##-----------------------------------------------------------------------------
# Azure Active Directory Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_azure_active_directory" "main" {
  count                      = var.enable && var.enable_aad_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("aad-%s", local.name) : format("%s-aad", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Random UUID (Automation Rulegit status)
##-----------------------------------------------------------------------------
resource "random_uuid" "automation_rule" {
  count = var.enable && var.enable_automation_rule ? 1 : 0
}

##-----------------------------------------------------------------------------
# Azure Advanced Threat Protection Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_azure_advanced_threat_protection" "main" {
  count                      = var.enable && var.enable_aatp_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("aatp-%s", local.name) : format("%s-aatp", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Azure Security Center Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_azure_security_center" "main" {
  count                      = var.enable && var.enable_asc_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("asc-%s", local.name) : format("%s-asc", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  subscription_id            = var.subscription_id
}

##-----------------------------------------------------------------------------
# Dynamics 365 Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_dynamics_365" "main" {
  count                      = var.enable && var.enable_dynamics_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("dynamics365-%s", local.name) : format("%s-dynamics365", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# IoT Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_iot" "main" {
  count                      = var.enable && var.enable_iot_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("iot-%s", local.name) : format("%s-iot", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  subscription_id            = var.subscription_id
}

##-----------------------------------------------------------------------------
# Microsoft Cloud App Security Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "main" {
  count                      = var.enable && var.enable_mcas_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("mcas-%s", local.name) : format("%s-mcas", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  alerts_enabled             = var.mcas_alerts_enabled
  discovery_logs_enabled     = var.mcas_discovery_logs_enabled
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Microsoft Defender Advanced Threat Protection Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "main" {
  count                      = var.enable && var.enable_mdatp_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("mdatp-%s", local.name) : format("%s-mdatp", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Sentinel Log Analytics Workspace
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "main" {
  count        = var.enable ? 1 : 0
  workspace_id = var.log_analytics_workspace_id
}

##-----------------------------------------------------------------------------
# Microsoft Threat Intelligence Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_microsoft_threat_intelligence" "main" {
  count                                        = var.enable && var.enable_mti_connector ? 1 : 0
  name                                         = var.resource_position_prefix ? format("mti-%s", local.name) : format("%s-mti", local.name)
  log_analytics_workspace_id                   = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  microsoft_emerging_threat_feed_lookback_date = var.mti_lookback_date
  tenant_id                                    = var.tenant_id
}

##-----------------------------------------------------------------------------
# Microsoft Threat Protection Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_microsoft_threat_protection" "main" {
  count                      = var.enable && var.enable_mtp_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("mtp-%s", local.name) : format("%s-mtp", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Office 365 Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_office_365" "main" {
  count                      = var.enable && var.enable_office365_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("o365-%s", local.name) : format("%s-o365", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  exchange_enabled           = var.office365_exchange_enabled
  teams_enabled              = var.office365_teams_enabled
  sharepoint_enabled         = var.office365_sharepoint_enabled
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Office 365 Project Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_office_365_project" "main" {
  count                      = var.enable && var.enable_office365_project_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("o365-project-%s", local.name) : format("%s-o365-project", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Office ATP Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_office_atp" "main" {
  count                      = var.enable && var.enable_office_atp_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("office-atp-%s", local.name) : format("%s-office-atp", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Office IRM Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_office_irm" "main" {
  count                      = var.enable && var.enable_office_irm_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("office-irm-%s", local.name) : format("%s-office-irm", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Office Power BI Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_office_power_bi" "main" {
  count                      = var.enable && var.enable_office_powerbi_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("office-powerbi-%s", local.name) : format("%s-office-powerbi", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Threat Intelligence Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_threat_intelligence" "main" {
  count                      = var.enable && var.enable_ti_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("ti-%s", local.name) : format("%s-ti", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  tenant_id                  = var.tenant_id
  lookback_date              = var.ti_lookback_date
}

##-----------------------------------------------------------------------------
# Threat Intelligence TAXII Data Connector
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_data_connector_threat_intelligence_taxii" "main" {
  count                      = var.enable && var.enable_ti_taxii_connector ? 1 : 0
  name                       = var.resource_position_prefix ? format("ti-taxii-%s", local.name) : format("%s-ti-taxii", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  display_name               = var.ti_taxii_display_name
  api_root_url               = var.ti_taxii_api_root_url
  collection_id              = var.ti_taxii_collection_id
  user_name                  = var.ti_taxii_user_name
  password                   = var.ti_taxii_password
  polling_frequency          = var.ti_taxii_polling_frequency
  lookback_date              = var.ti_taxii_lookback_date
  tenant_id                  = var.tenant_id
}

##-----------------------------------------------------------------------------
# Sentinel Alert Rule - Fusion
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_alert_rule_fusion" "main" {
  count                      = var.enable && var.enable_fusion_rule ? 1 : 0
  name                       = var.resource_position_prefix ? format("fusion-%s", local.name) : format("%s-fusion", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  alert_rule_template_guid   = var.fusion_alert_rule_template_guid
  enabled                    = var.fusion_enabled
  dynamic "source" {
    for_each = var.fusion_sources
    content {
      name    = source.value.name
      enabled = source.value.enabled
      dynamic "sub_type" {
        for_each = source.value.sub_types
        content {
          name               = sub_type.value.name
          enabled            = sub_type.value.enabled
          severities_allowed = sub_type.value.severities_allowed
        }
      }
    }
  }
}

##-----------------------------------------------------------------------------
# Sentinel Alert Rule - Machine Learning Behavior Analytics
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_alert_rule_machine_learning_behavior_analytics" "main" {
  count                      = var.enable && var.enable_ml_behavior_analytics_rule ? 1 : 0
  name                       = var.resource_position_prefix ? format("ml-behavior-%s", local.name) : format("%s-ml-behavior", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  alert_rule_template_guid   = var.ml_behavior_analytics_template_guid
  enabled                    = var.ml_behavior_analytics_enabled
}

##-----------------------------------------------------------------------------
# Sentinel Alert Rule - MS Security Incident
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_alert_rule_ms_security_incident" "main" {
  count                       = var.enable && var.enable_ms_security_incident_rule ? 1 : 0
  name                        = var.resource_position_prefix ? format("ms-security-%s", local.name) : format("%s-ms-security", local.name)
  log_analytics_workspace_id  = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  display_name                = var.ms_security_display_name
  product_filter              = var.ms_security_product_filter
  severity_filter             = var.ms_security_severity_filter
  alert_rule_template_guid    = var.ms_security_template_guid
  description                 = var.ms_security_description
  enabled                     = var.ms_security_enabled
  display_name_filter         = var.ms_security_display_name_filter
  display_name_exclude_filter = var.ms_security_display_name_exclude_filter
}

##-----------------------------------------------------------------------------
# Sentinel Alert Rule - NRT (Near Real-Time)
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_alert_rule_nrt" "main" {
  count                       = var.enable && var.enable_nrt_rule ? 1 : 0
  name                        = var.resource_position_prefix ? format("nrt-%s", local.name) : format("%s-nrt", local.name)
  log_analytics_workspace_id  = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  display_name                = var.nrt_display_name
  severity                    = var.nrt_severity
  query                       = var.nrt_query
  alert_rule_template_guid    = var.nrt_template_guid
  alert_rule_template_version = var.nrt_template_version
  description                 = var.nrt_description
  enabled                     = var.nrt_enabled
  custom_details              = var.nrt_custom_details
  suppression_enabled         = var.nrt_suppression_enabled
  suppression_duration        = var.nrt_suppression_duration
  tactics                     = var.nrt_tactics
  techniques                  = var.nrt_techniques

  dynamic "event_grouping" {
    for_each = var.nrt_event_grouping != null ? [var.nrt_event_grouping] : []
    content {
      aggregation_method = event_grouping.value.aggregation_method
    }
  }
  dynamic "alert_details_override" {
    for_each = var.nrt_alert_details_override != null ? [var.nrt_alert_details_override] : []
    content {
      description_format   = alert_details_override.value.description_format
      display_name_format  = alert_details_override.value.display_name_format
      severity_column_name = alert_details_override.value.severity_column_name
      tactics_column_name  = alert_details_override.value.tactics_column_name

      dynamic "dynamic_property" {
        for_each = alert_details_override.value.dynamic_properties != null ? alert_details_override.value.dynamic_properties : []
        content {
          name  = dynamic_property.value.name
          value = dynamic_property.value.value
        }
      }
    }
  }

  dynamic "entity_mapping" {
    for_each = var.nrt_entity_mappings != null ? var.nrt_entity_mappings : []
    content {
      entity_type = entity_mapping.value.entity_type

      dynamic "field_mapping" {
        for_each = entity_mapping.value.field_mappings
        content {
          identifier  = field_mapping.value.identifier
          column_name = field_mapping.value.column_name
        }
      }
    }
  }
  dynamic "sentinel_entity_mapping" {
    for_each = var.nrt_sentinel_entity_mappings != null ? var.nrt_sentinel_entity_mappings : []
    content {
      column_name = sentinel_entity_mapping.value.column_name
    }
  }
  dynamic "incident" {
    for_each = var.nrt_incident_configuration != null ? [var.nrt_incident_configuration] : []
    content {
      create_incident_enabled = incident.value.create_incident_enabled

      dynamic "grouping" {
        for_each = incident.value.grouping != null ? [incident.value.grouping] : []
        content {
          enabled                 = grouping.value.enabled
          lookback_duration       = grouping.value.lookback_duration
          reopen_closed_incidents = grouping.value.reopen_closed_incidents
          entity_matching_method  = grouping.value.entity_matching_method
          by_entities             = grouping.value.by_entities
          by_alert_details        = grouping.value.by_alert_details
          by_custom_details       = grouping.value.by_custom_details
        }
      }
    }
  }
}

##-----------------------------------------------------------------------------
# Sentinel Alert Rule - Scheduled
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_alert_rule_scheduled" "main" {
  count                       = var.enable && var.enable_scheduled_rule ? 1 : 0
  name                        = var.resource_position_prefix ? format("scheduled-%s", local.name) : format("%s-scheduled", local.name)
  log_analytics_workspace_id  = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  display_name                = var.scheduled_display_name
  severity                    = var.scheduled_severity
  query                       = var.scheduled_query
  alert_rule_template_guid    = var.scheduled_template_guid
  alert_rule_template_version = var.scheduled_template_version
  description                 = var.scheduled_description
  enabled                     = var.scheduled_enabled
  query_frequency             = var.scheduled_query_frequency
  query_period                = var.scheduled_query_period
  trigger_operator            = var.scheduled_trigger_operator
  trigger_threshold           = var.scheduled_trigger_threshold
  suppression_enabled         = var.scheduled_suppression_enabled
  suppression_duration        = var.scheduled_suppression_duration
  custom_details              = var.scheduled_custom_details
  tactics                     = var.scheduled_tactics
  techniques                  = var.scheduled_techniques
  dynamic "event_grouping" {
    for_each = var.scheduled_event_grouping != null ? [var.scheduled_event_grouping] : []
    content {
      aggregation_method = event_grouping.value.aggregation_method
    }
  }

  dynamic "alert_details_override" {
    for_each = var.scheduled_alert_details_override != null ? [var.scheduled_alert_details_override] : []
    content {
      description_format   = alert_details_override.value.description_format
      display_name_format  = alert_details_override.value.display_name_format
      severity_column_name = alert_details_override.value.severity_column_name
      tactics_column_name  = alert_details_override.value.tactics_column_name
      dynamic "dynamic_property" {
        for_each = alert_details_override.value.dynamic_properties != null ? alert_details_override.value.dynamic_properties : []
        content {
          name  = dynamic_property.value.name
          value = dynamic_property.value.value
        }
      }
    }
  }

  dynamic "entity_mapping" {
    for_each = var.scheduled_entity_mappings != null ? var.scheduled_entity_mappings : []
    content {
      entity_type = entity_mapping.value.entity_type
      dynamic "field_mapping" {
        for_each = entity_mapping.value.field_mappings
        content {
          identifier  = field_mapping.value.identifier
          column_name = field_mapping.value.column_name
        }
      }
    }
  }
  dynamic "sentinel_entity_mapping" {
    for_each = var.scheduled_sentinel_entity_mappings != null ? var.scheduled_sentinel_entity_mappings : []
    content {
      column_name = sentinel_entity_mapping.value.column_name
    }
  }
  dynamic "incident" {
    for_each = var.scheduled_incident_configuration != null ? [var.scheduled_incident_configuration] : []
    content {
      create_incident_enabled = incident.value.create_incident_enabled

      dynamic "grouping" {
        for_each = incident.value.grouping != null ? [incident.value.grouping] : []
        content {
          enabled                 = grouping.value.enabled
          lookback_duration       = grouping.value.lookback_duration
          reopen_closed_incidents = grouping.value.reopen_closed_incidents
          entity_matching_method  = grouping.value.entity_matching_method
          by_entities             = grouping.value.by_entities
          by_alert_details        = grouping.value.by_alert_details
          by_custom_details       = grouping.value.by_custom_details
        }
      }
    }
  }
}

##-----------------------------------------------------------------------------
# Sentinel Alert Rule - Threat Intelligence
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_alert_rule_threat_intelligence" "main" {
  count                      = var.enable && var.enable_threat_intelligence_rule ? 1 : 0
  name                       = var.resource_position_prefix ? format("threat-intel-%s", local.name) : format("%s-threat-intel", local.name)
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  alert_rule_template_guid   = var.threat_intelligence_template_guid
  enabled                    = var.threat_intelligence_enabled
}

##-----------------------------------------------------------------------------
# Sentinel Automation Rule
##-----------------------------------------------------------------------------
resource "azurerm_sentinel_automation_rule" "main" {
  count                      = var.enable && var.enable_automation_rule ? 1 : 0
  name                       = var.automation_rule_name != null ? var.automation_rule_name : random_uuid.automation_rule[0].result
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace_onboarding.main[0].workspace_id
  display_name               = var.automation_display_name
  order                      = var.automation_order
  enabled                    = var.automation_enabled
  expiration                 = var.automation_expiration
  triggers_on                = var.automation_triggers_on
  triggers_when              = var.automation_triggers_when
  condition_json             = var.automation_condition_json
  dynamic "action_incident" {
    for_each = var.automation_action_incidents != null ? var.automation_action_incidents : []
    content {
      order                  = action_incident.value.order
      status                 = action_incident.value.status
      severity               = action_incident.value.severity
      owner_id               = action_incident.value.owner_id
      labels                 = action_incident.value.labels
      classification         = action_incident.value.classification
      classification_comment = action_incident.value.classification_comment
    }
  }
  dynamic "action_incident_task" {
    for_each = var.automation_action_tasks != null ? var.automation_action_tasks : []
    content {
      order       = action_incident_task.value.order
      title       = action_incident_task.value.title
      description = action_incident_task.value.description
    }
  }
  dynamic "action_playbook" {
    for_each = var.automation_action_playbooks != null ? var.automation_action_playbooks : []
    content {
      logic_app_id = action_playbook.value.logic_app_id
      order        = action_playbook.value.order
      tenant_id    = action_playbook.value.tenant_id
    }
  }
}