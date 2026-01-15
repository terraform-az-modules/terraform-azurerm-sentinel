##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "aad_connector_id" {
  value       = try(azurerm_sentinel_data_connector_azure_active_directory.main[0].id, null)
  description = "The ID of the Azure Active Directory Data Connector"
}

output "aatp_connector_id" {
  value       = try(azurerm_sentinel_data_connector_azure_advanced_threat_protection.main[0].id, null)
  description = "The ID of the Azure Advanced Threat Protection Data Connector"
}

output "asc_connector_id" {
  value       = try(azurerm_sentinel_data_connector_azure_security_center.main[0].id, null)
  description = "The ID of the Azure Security Center Data Connector"
}

output "dynamics_connector_id" {
  value       = try(azurerm_sentinel_data_connector_dynamics_365.main[0].id, null)
  description = "The ID of the Dynamics 365 Data Connector"
}

output "iot_connector_id" {
  value       = try(azurerm_sentinel_data_connector_iot.main[0].id, null)
  description = "The ID of the IoT Data Connector"
}

output "mcas_connector_id" {
  value       = try(azurerm_sentinel_data_connector_microsoft_cloud_app_security.main[0].id, null)
  description = "The ID of the Microsoft Cloud App Security Data Connector"
}

output "mdatp_connector_id" {
  value       = try(azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.main[0].id, null)
  description = "The ID of the Microsoft Defender Advanced Threat Protection Data Connector"
}

output "mti_connector_id" {
  value       = try(azurerm_sentinel_data_connector_microsoft_threat_intelligence.main[0].id, null)
  description = "The ID of the Microsoft Threat Intelligence Data Connector"
}

output "mtp_connector_id" {
  value       = try(azurerm_sentinel_data_connector_microsoft_threat_protection.main[0].id, null)
  description = "The ID of the Microsoft Threat Protection Data Connector"
}

output "office365_connector_id" {
  value       = try(azurerm_sentinel_data_connector_office_365.main[0].id, null)
  description = "The ID of the Office 365 Data Connector"
}

output "office365_project_connector_id" {
  value       = try(azurerm_sentinel_data_connector_office_365_project.main[0].id, null)
  description = "The ID of the Office 365 Project Data Connector"
}

output "office_atp_connector_id" {
  value       = try(azurerm_sentinel_data_connector_office_atp.main[0].id, null)
  description = "The ID of the Office ATP Data Connector"
}

output "office_irm_connector_id" {
  value       = try(azurerm_sentinel_data_connector_office_irm.main[0].id, null)
  description = "The ID of the Office IRM Data Connector"
}

output "office_powerbi_connector_id" {
  value       = try(azurerm_sentinel_data_connector_office_power_bi.main[0].id, null)
  description = "The ID of the Office Power BI Data Connector"
}

output "ti_connector_id" {
  value       = try(azurerm_sentinel_data_connector_threat_intelligence.main[0].id, null)
  description = "The ID of the Threat Intelligence Data Connector"
}

output "ti_taxii_connector_id" {
  value       = try(azurerm_sentinel_data_connector_threat_intelligence_taxii.main[0].id, null)
  description = "The ID of the Threat Intelligence TAXII Data Connector"
}

output "sentinel_alert_rule_fusion_id" {
  value       = try(azurerm_sentinel_alert_rule_fusion.main[0].id, null)
  description = "The ID of the Sentinel Fusion Alert Rule"
}

output "sentinel_alert_rule_ml_behavior_analytics_id" {
  value       = try(azurerm_sentinel_alert_rule_machine_learning_behavior_analytics.main[0].id, null)
  description = "The ID of the Sentinel Machine Learning Behavior Analytics Alert Rule"
}

output "sentinel_alert_rule_ms_security_incident_id" {
  value       = try(azurerm_sentinel_alert_rule_ms_security_incident.main[0].id, null)
  description = "The ID of the Sentinel MS Security Incident Alert Rule"
}

output "sentinel_alert_rule_nrt_id" {
  value       = try(azurerm_sentinel_alert_rule_nrt.main[0].id, null)
  description = "The ID of the Sentinel NRT Alert Rule"
}

output "sentinel_alert_rule_scheduled_id" {
  value       = try(azurerm_sentinel_alert_rule_scheduled.main[0].id, null)
  description = "The ID of the Sentinel Scheduled Alert Rule"
}

output "sentinel_alert_rule_threat_intelligence_id" {
  value       = try(azurerm_sentinel_alert_rule_threat_intelligence.main[0].id, null)
  description = "The ID of the Sentinel Threat Intelligence Alert Rule"
}

output "sentinel_automation_rule_id" {
  value       = try(azurerm_sentinel_automation_rule.main[0].id, null)
  description = "The ID of the Sentinel Automation Rule"
}

output "sentinel_workspace_id" {
  value       = azurerm_sentinel_log_analytics_workspace_onboarding.main.workspace_id
  description = "The ID of the Sentinel enabled Log Analytics Workspace"
}
