# Threat Hunt & Incident Report — NPT-WS01

A hands-on-keyboard intrusion investigation, reconstructed entirely from
Microsoft Defender Advanced Hunting telemetry and written up as a formal
incident report against the **NIST SP 800-61 Rev. 2** lifecycle.

> **Lab exercise, not a live incident.** This was completed as a guided
> threat-hunting exercise using simulated Defender telemetry. It is
> presented here for the investigative methodology and the report itself,
> not as evidence of production incident response.

## Scenario

A help desk ticket reported repeated overnight login prompts on a Finance
workstation (`NPT-WS01`) — dismissed by the user as noise. The investigation
confirmed a real intrusion: credential compromise, remote WMI execution,
four independent persistence mechanisms, and lateral movement toward a
second host.

## What's in this folder

| File | Contents |
|---|---|
| [`NPT-WS01-Incident-Report.pdf`](./NPT-WS01-Incident-Report.pdf) | Full report: executive summary, IOC table, detection-point rationale, attack chain reconstruction, impact/scope assessment, ATT&CK mapping, and a phased containment/eradication/recovery plan |
| `queries/` | *(add your own)* the actual KQL you ran in Advanced Hunting to recover each indicator — one `.kql` file per flag, e.g. `01-suspicious-logon.kql`, `02-remote-ip.kql` |

## Methodology highlights

- **Detection point.** The hunt starts at authentication, not at the
  malware. Once an attacker holds valid credentials, later actions are
  technically authorized — the logon from an unexpected source is the one
  unambiguous anomaly, and it's the pivot that unlocks every other flag.
- **Evidence discipline.** One recovered artifact (the execution command
  line) was truncated at the point telemetry stopped capturing it. The
  report states plainly what wasn't recoverable rather than inferring the
  missing portion — a deliberate choice to keep every claim traceable to
  a specific table and column.
- **MITRE ATT&CK mapping.** Every stage of the attack chain — credential
  access through lateral movement — is mapped to a specific technique ID,
  not just described narratively.

## Skills demonstrated

Microsoft Defender Advanced Hunting (KQL) · attack chain reconstruction ·
MITRE ATT&CK · NIST SP 800-61 incident response lifecycle · technical
report writing
