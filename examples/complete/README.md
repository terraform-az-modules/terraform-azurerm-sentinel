<!-- BEGIN_TF_DOCS -->

# Terraform Azure Microsoft Sentinel

This directory contains an example usage of the **terraform-azurerm-sentinel** module. It demonstrates how to onboard Microsoft Sentinel to an existing Log Analytics Workspace and configure data connectors and analytics rules using Terraform.
---

## 📋 Requirements

| Name      | Version     |
|-----------|-------------|
| Terraform | >= 1.6.6    |
| Azurerm   | >= 3.116.0  |

---

## 🔌 Providers

| Name   | Version     |
|--------|-------------|
| Azurerm | >= 3.116.0  |

---

## 📦 Modules

| Name            | Source                                      | Version |
|-----------------|---------------------------------------------|---------|
| resource_group  | terraform-az-modules/resource-group/azurerm | 1.0.3   |
| log-analytics   | terraform-az-modules/log-analytics/azure    | 1.0.2   |
| sentinel        | ../../                                      | n/a     |

---

## 🏗️ Resources

No resources are directly created in this example.

---

## 🔧 Inputs

No input variables are defined in this example.

---

## 📤 Outputs

| Name | Description |
|------|-------------|
| aad_connector_id | The ID of the Azure Active Directory Data Connector |
| aatp_connector_id | The ID of the Azure Advanced Threat Protection Data Connector |
| asc_connector_id | The ID of the Azure Security Center Data Connector |
| dynamics_connector_id | The ID of the Dynamics 365 Data Connector |
| iot_connector_id | The ID of the IoT Data Connector |
| mcas_connector_id | The ID of the Microsoft Cloud App Security Data Connector |
| mdatp_connector_id | The ID of the Microsoft Defender Advanced Threat Protection Data Connector |
| mti_connector_id | The ID of the Microsoft Threat Intelligence Data Connector |
| mtp_connector_id | The ID of the Microsoft Threat Protection Data Connector |
| office365_connector_id | The ID of the Office 365 Data Connector |
| office365_project_connector_id | The ID of the Office 365 Project Data Connector |
| office_atp_connector_id | The ID of the Office ATP Data Connector |
| office_irm_connector_id | The ID of the Office IRM Data Connector |
| office_powerbi_connector_id | The ID of the Office Power BI Data Connector |
| ti_connector_id | The ID of the Threat Intelligence Data Connector |
| ti_taxii_connector_id | The ID of the Threat Intelligence TAXII Data Connector |
| sentinel_alert_rule_fusion_id | The ID of the Sentinel Fusion Alert Rule |
| sentinel_alert_rule_ml_behavior_analytics_id | The ID of the Sentinel Machine Learning Behavior Analytics Alert Rule |
| sentinel_alert_rule_ms_security_incident_id | The ID of the Sentinel MS Security Incident Alert Rule |
| sentinel_alert_rule_nrt_id | The ID of the Sentinel NRT Alert Rule |
| sentinel_alert_rule_scheduled_id | The ID of the Sentinel Scheduled Alert Rule |
| sentinel_alert_rule_threat_intelligence_id | The ID of the Sentinel Threat Intelligence Alert Rule |
| sentinel_automation_rule_id | The ID of the Sentinel Automation Rule |
| sentinel_workspace_id | The ID of the Sentinel enabled Log Analytics Workspace |


<!-- END_TF_DOCS -->
