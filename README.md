# Azure Detection & Response Portfolio

Two connected projects built in a lab environment to demonstrate the full
detection lifecycle on Microsoft's security stack: **hunt → detect → respond**.

Rather than two unrelated dashboards, these are meant to be read together —
one shows I can reconstruct an intrusion by hand from raw telemetry; the
other shows I can turn that same class of finding into a standing detection
that catches it automatically next time.

## Projects

| Project | What it demonstrates | Stack | Link |
|---|---|---|---|
| **Threat Hunt & Incident Report** | Manual investigation of a simulated intrusion using Microsoft Defender Advanced Hunting (KQL); full write-up structured on NIST SP 800-61 | Microsoft Defender, KQL, MITRE ATT&CK | [`01-threat-hunt-ir/`](./01-threat-hunt-ir) |
| **Sentinel Risk-Tiered Geo Map** | Detection engineering: a Microsoft Sentinel workbook that geolocates and risk-scores Azure control-plane changes by caller IP | Microsoft Sentinel, KQL, Azure Workbooks | [`02-sentinel-geomap/`](./02-sentinel-geomap) |

## Why these two together

The threat hunt asks: *given raw logs, can you find the attacker's account,
the entry point, the persistence, and the blast radius?* The Sentinel project
asks the next question: *can you build something that flags that pattern
before an analyst has to hunt for it manually?*

The risk-tiering logic in the Sentinel workbook (Critical / High / Medium
operations) is built from the same reasoning as the ATT&CK mapping in the
incident report — both are judgment calls about which actions actually
matter, not just which actions are loggable.

## A note on the data

Both projects use **simulated telemetry in a lab/cyber-range environment**
(a guided exercise for the first project, a personal Azure subscription for
the second). No production systems, customer data, or real incidents are
represented here. Resource IDs and workspace identifiers have been redacted
or replaced with placeholders.

## About me

Technical Services Manager / Information Security Officer with production
experience in HIPAA-regulated environments (HITRUST CSF, AWS security
architecture, incident response). These lab projects supplement that
production background by demonstrating hands-on work with Microsoft's
security tooling specifically.

- Portfolio: [sahilk.io](https://sahilk.io)
- GitHub: [@FarmProtector](https://github.com/FarmProtector)
