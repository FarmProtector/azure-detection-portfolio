<#
.SYNOPSIS
    Exports Conditional Access and Intune compliance policies as JSON.
.DESCRIPTION
    Connects to Microsoft Graph with read-only scopes and exports current
    Conditional Access policies and Intune device compliance policies for
    documentation and version control.
.EXAMPLE
    ./Export-CAPolicies.ps1
#>
Connect-MgGraph -Scopes "Policy.Read.All","DeviceManagementConfiguration.Read.All"
Get-MgIdentityConditionalAccessPolicy | ConvertTo-Json -Depth 10 | Out-File "ca-policies-export.json" -Encoding utf8
Get-MgDeviceManagementDeviceCompliancePolicy | ConvertTo-Json -Depth 10 | Out-File "intune-compliance-export.json" -Encoding utf8
Disconnect-MgGraph
