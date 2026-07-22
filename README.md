# Azure Detection & Response Portfolio

Three connected projects built in a lab environment to demonstrate the full
detection lifecycle on Microsoft's security stack: **hunt → detect → respond**.

Rather than unrelated dashboards, these are meant to be read together —
one shows I can reconstruct an intrusion by hand from raw telemetry, the
second turns that same class of finding into a standing detection, and the
third wires that detection into an actual response.

## Projects

| Project | What it demonstrates | Stack | Link |
|---|---|---|---|
| **Threat Hunt & Incident Report** | Manual investigation of a simulated intrusion using Microsoft Defender Advanced Hunting (KQL); full write-up structured on NIST SP 800-61 | Microsoft Defender, KQL, MITRE ATT&CK | [`01-threat-hunt-ir/`](./01-threat-hunt-ir) |
| **Sentinel Risk-Tiered Geo Map** | Detection engineering: a Microsoft Sentinel workbook that geolocates and risk-scores Azure control-plane changes by caller IP | Microsoft Sentinel, KQL, Azure Workbooks | [`02-sentinel-geomap/`](./02-sentinel-geomap) |
| **Sentinel Analytics Rule & Response** | Converts the risk-tiered detection logic into a live Sentinel rule with entity mapping and MITRE ATT&CK technique mapping | Microsoft Sentinel, KQL, MITRE ATT&CK | [`03-sentinel-analytics-rule/`](./03-sentinel-analytics-rule) |

## Why these three together

The threat hunt asks: *given raw logs, can you find the attacker's account,
the entry point, the persistence, and the blast radius?* The geo-map project
asks the next question: *can you build something that flags that pattern
before an analyst has to hunt for it manually?* The analytics rule closes
the loop: *can that detection actually fire, with the entity context an
analyst needs to act on it?*

The risk-tiering logic in the Sentinel workbook (Critical / High / Medium
operations) is built from the same reasoning as the ATT&CK mapping in the
incident report, and the analytics rule reuses both directly — same
Critical-tier classifier, same technique mapping, now running live rather
than sitting in a dashboard.

## A note on the data

Both the workbook and the analytics rule use **simulated telemetry in a
personal Azure lab subscription**; the threat hunt uses a guided exercise
in a shared community cyber-range. No production systems, customer data,
or real incidents are represented here. Resource IDs and workspace
identifiers have been redacted or replaced with placeholders. The
analytics rule was validated by query logic and configuration review
rather than a live-fire incident, after the shared range's student
permissions blocked the safe test action used to trigger it — noted in
that project's README.

## About me

Technical Services Manager / Information Security Officer with production
experience in HIPAA-regulated environments (HITRUST CSF, AWS security
architecture, incident response). These lab projects supplement that
production background by demonstrating hands-on work with Microsoft's
security tooling specifically.

- Portfolio: [sahilk.io](https://sahilk.io)
- GitHub: [@FarmProtector](https://github.com/FarmProtector)
