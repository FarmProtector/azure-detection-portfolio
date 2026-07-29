# Azure Detection & Response Portfolio

Four connected projects built in a lab environment to demonstrate the full
detection lifecycle on Microsoft's security stack: **hunt → detect → respond → prevent**.

Rather than unrelated dashboards, these are meant to be read together —
one shows I can reconstruct an intrusion by hand from raw telemetry, the
second turns that same class of finding into a standing detection, the
third wires that detection into an actual response, and the fourth builds
the identity controls meant to stop the intrusion from succeeding in the
first place.

## Projects

| Project | What it demonstrates | Stack | Link |
|---|---|---|---|
| **Threat Hunt & Incident Report** | Manual investigation of a simulated intrusion using Microsoft Defender Advanced Hunting (KQL); full write-up structured on NIST SP 800-61 | Microsoft Defender, KQL, MITRE ATT&CK | [`01-threat-hunt-ir/`](./01-threat-hunt-ir) |
| **Sentinel Risk-Tiered Geo Map** | Detection engineering: a Microsoft Sentinel workbook that geolocates and risk-scores Azure control-plane changes by caller IP | Microsoft Sentinel, KQL, Azure Workbooks | [`02-sentinel-geomap/`](./02-sentinel-geomap) |
| **Sentinel Analytics Rule & Response** | Converts the risk-tiered detection logic into a live Sentinel rule with entity mapping and MITRE ATT&CK technique mapping | Microsoft Sentinel, KQL, MITRE ATT&CK | [`03-sentinel-analytics-rule/`](./03-sentinel-analytics-rule) |
| **Zero Trust / Conditional Access Policy Design** | Five Conditional Access policies and an Intune compliance policy, validated with Entra's "What If" tool and exported via Microsoft Graph PowerShell | Microsoft Entra ID, Intune, Microsoft Graph PowerShell | [`04-zero-trust-conditional-access/`](./04-zero-trust-conditional-access) |

## Why these four together

The threat hunt asks: *given raw logs, can you find the attacker's account,
the entry point, the persistence, and the blast radius?* The geo-map project
asks the next question: *can you build something that flags that pattern
before an analyst has to hunt for it manually?* The analytics rule closes
that loop: *can that detection actually fire, with the entity context an
analyst needs to act on it?* The Conditional Access project asks a
different question entirely: *what would have stopped the intrusion from
happening at all?*

The risk-tiering logic in the Sentinel workbook (Critical / High / Medium
operations) is built from the same reasoning as the ATT&CK mapping in the
incident report, and the analytics rule reuses both directly — same
Critical-tier classifier, same technique mapping, now running live rather
than sitting in a dashboard. The Conditional Access project closes a gap
the other three share: none of them prevent the initial compromise, the
threat hunt's attacker got in with a valid but unprotected credential from
an unexpected source, which is exactly the scenario CA001 and CA004 are
built to catch before it becomes something to hunt.

## A note on the data

All four projects use **simulated telemetry** — the Sentinel workbook,
analytics rule, and Conditional Access project in personal Microsoft
365/Azure lab tenants, the threat hunt in a guided exercise inside a shared
community cyber-range. No production systems, customer data, or real
incidents are represented here. Resource IDs, tenant IDs, and user object
IDs have been redacted or replaced with placeholders throughout. Two
projects document a validation gap rather than papering over it: the
analytics rule was validated by query logic and configuration review after
the shared range blocked its live-fire test, and the Conditional Access
project's Intune compliance policy has no enrolled device to evaluate it,
both are noted in their respective project READMEs.

## About me

Technical Services Manager / Information Security Officer with production
experience in HIPAA-regulated environments (HITRUST CSF, AWS security
architecture, incident response). These lab projects supplement that
production background by demonstrating hands-on work with Microsoft's
security tooling specifically.

- Portfolio: [sahilk.io](https://sahilk.io)
- GitHub: [@FarmProtector](https://github.com/FarmProtector)
