##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "aad_connector_id" {
  value       = module.sentinel.aad_connector_id
  description = "The ID of the Azure Active Directory Data Connector"
}

output "aatp_connector_id" {
  value       = module.sentinel.aatp_connector_id
  description = "The ID of the Azure Advanced Threat Protection Data Connector"
}

output "asc_connector_id" {
  value       = module.sentinel.asc_connector_id
  description = "The ID of the Azure Security Center Data Connector"
}

output "dynamics_connector_id" {
  value       = module.sentinel.dynamics_connector_id
  description = "The ID of the Dynamics 365 Data Connector"
}

output "iot_connector_id" {
  value       = module.sentinel.iot_connector_id
  description = "The ID of the IoT Data Connector"
}

output "mcas_connector_id" {
  value       = module.sentinel.mcas_connector_id
  description = "The ID of the Microsoft Cloud App Security Data Connector"
}

output "mdatp_connector_id" {
  value       = module.sentinel.mdatp_connector_id
  description = "The ID of the Microsoft Defender Advanced Threat Protection Data Connector"
}

output "mti_connector_id" {
  value       = module.sentinel.mti_connector_id
  description = "The ID of the Microsoft Threat Intelligence Data Connector"
}

output "mtp_connector_id" {
  value       = module.sentinel.mtp_connector_id
  description = "The ID of the Microsoft Threat Protection Data Connector"
}

output "office365_connector_id" {
  value       = module.sentinel.office365_connector_id
  description = "The ID of the Office 365 Data Connector"
}

output "office365_project_connector_id" {
  value       = module.sentinel.office365_project_connector_id
  description = "The ID of the Office 365 Project Data Connector"
}

output "office_atp_connector_id" {
  value       = module.sentinel.office_atp_connector_id
  description = "The ID of the Office ATP Data Connector"
}

output "office_irm_connector_id" {
  value       = module.sentinel.office_irm_connector_id
  description = "The ID of the Office IRM Data Connector"
}

output "office_powerbi_connector_id" {
  value       = module.sentinel.office_powerbi_connector_id
  description = "The ID of the Office Power BI Data Connector"
}

output "ti_connector_id" {
  value       = module.sentinel.ti_connector_id
  description = "The ID of the Threat Intelligence Data Connector"
}

output "ti_taxii_connector_id" {
  value       = module.sentinel.ti_taxii_connector_id
  description = "The ID of the Threat Intelligence TAXII Data Connector"
}

output "sentinel_alert_rule_fusion_id" {
  value       = module.sentinel.sentinel_alert_rule_fusion_id
  description = "The ID of the Sentinel Fusion Alert Rule"
}

output "sentinel_alert_rule_ml_behavior_analytics_id" {
  value       = module.sentinel.sentinel_alert_rule_ml_behavior_analytics_id
  description = "The ID of the Sentinel Machine Learning Behavior Analytics Alert Rule"
}

output "sentinel_alert_rule_ms_security_incident_id" {
  value       = module.sentinel.sentinel_alert_rule_ms_security_incident_id
  description = "The ID of the Sentinel MS Security Incident Alert Rule"
}

output "sentinel_alert_rule_nrt_id" {
  value       = module.sentinel.sentinel_alert_rule_nrt_id
  description = "The ID of the Sentinel NRT Alert Rule"
}

output "sentinel_alert_rule_scheduled_id" {
  value       = module.sentinel.sentinel_alert_rule_scheduled_id
  description = "The ID of the Sentinel Scheduled Alert Rule"
}

output "sentinel_alert_rule_threat_intelligence_id" {
  value       = module.sentinel.sentinel_alert_rule_threat_intelligence_id
  description = "The ID of the Sentinel Threat Intelligence Alert Rule"
}

output "sentinel_automation_rule_id" {
  value       = module.sentinel.sentinel_automation_rule_id
  description = "The ID of the Sentinel Automation Rule"
}

output "sentinel_workspace_id" {
  value       = module.sentinel.sentinel_workspace_id
  description = "The ID of the Sentinel enabled Log Analytics Workspace"
}
