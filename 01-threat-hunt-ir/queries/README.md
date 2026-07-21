# Hunt Queries

Drop your actual Advanced Hunting KQL here, one file per indicator —
this is what turns the report from a write-up into a demonstrable skill.
Suggested naming, matching the flags in the incident report:

- `01-suspicious-logon.kql` — DeviceLogonEvents, isolating the compromised account
- `02-remote-ip.kql` — tying the logon to the external source IP
- `03-execution-chain.kql` — DeviceProcessEvents, the wmiexec command line and parent process
- `04-c2-connection.kql` — DeviceNetworkEvents, filtering to the C2 domain
- `05-dropped-file.kql` — DeviceFileEvents, the implant hash
- `06-persistence.kql` — registry, scheduled task, and service artifacts
- `07-privilege-escalation.kql` — backdoor account creation
- `08-lateral-movement.kql` — scoping the second affected host

A screenshot of each query's result pane alongside the `.kql` file makes
this section far more credible than the query text alone.
