# Threat Hunt and Incident Report: NPT-WS01

I investigated an intrusion using Microsoft Defender Advanced Hunting and wrote it up as a formal incident report following the NIST SP 800-61 Rev. 2 incident response lifecycle.

> **This was a lab exercise, not a live incident.** I completed it as a guided threat hunting exercise using simulated Defender telemetry. I'm sharing it to show my investigation process and report writing.

## Scenario

A help desk ticket reported repeated overnight login prompts on a Finance workstation (`NPT-WS01`). The user had dismissed them as noise. My investigation confirmed a real intrusion: compromised credentials, remote execution through WMI, four separate persistence mechanisms, and lateral movement toward a second host.

## What's in This Folder

| File | Contents |
|---|---|
| [`NPT-WS01-Incident-Report.pdf`](./NPT-WS01-Incident-Report.pdf) | The full report: executive summary, IOC table, why I started where I did, attack chain reconstruction, impact and scope, ATT&CK mapping, and a phased containment, eradication, and recovery plan |

## Hunt Queries

These are the KQL queries I ran in Microsoft Defender Advanced Hunting to find each flag. Screenshots of each result are in `screenshots/`.

| File | Flags | Table |
|---|---|---|
| `01-account-logon.kql` | 1, 2 | DeviceLogonEvents |
| `03-execution-chain.kql` | 3, 4 | DeviceProcessEvents |
| `04-c2-connection.kql` | 5 | DeviceNetworkEvents |
| `05-dropped-file.kql` | 6 | DeviceFileEvents |
| `06-registry-persistence.kql` | 7 | DeviceRegistryEvents |
| `07-scheduled-task.kql` | 8 | DeviceProcessEvents |
| `08-service-persistence.kql` | 9 | DeviceProcessEvents |
| `09-backdoor-account.kql` | 10 | DeviceProcessEvents |
| `10-lateral-movement.kql` | 11 | AlertEvidence |

## How I Approached It

- **I started with the logins, not the malware.** Once an attacker has valid credentials, everything they do after that looks authorized. The login from an unexpected source was the one clear anomaly, and following it led me to every other flag.
- **I only reported what the evidence showed.** One command line was cut off where the telemetry stopped capturing it. Instead of guessing the missing part, I noted in the report that it couldn't be recovered. Every finding in the report traces back to a specific table and column.
- **I mapped every stage to MITRE ATT&CK.** Each step of the attack, from credential access to lateral movement, has a specific technique ID instead of just a description.

## Skills

- Microsoft Defender Advanced Hunting (KQL)
- Attack chain reconstruction
- MITRE ATT&CK mapping
- NIST SP 800-61 incident response lifecycle
- Technical report writing
