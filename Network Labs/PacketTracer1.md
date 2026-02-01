## Network Lab Technical Summary

This lab involved designing and implementing a **two-LAN enterprise-style network** with segmented broadcast domains using **IEEE 802.1Q VLANs** and **inter-VLAN routing via a router-on-a-stick (ROAS) configuration**. Layer 3 switching via SVIs was intentionally avoided to ensure full visibility and understanding of how VLAN tagging, trunking, and routing interact at each layer.

### VLAN and Switching Design

Four VLANs were created to represent separate office networks, each mapped to its own IP subnet. 

Access switches were configured with **access ports** assigned to the appropriate VLANs, while uplinks between access and core switches were configured as **802.1Q trunks** carrying multiple VLANs.

Key concepts and configurations included:
- `switchport mode access`
- `switchport access vlan <id>`
- `switchport mode trunk`
- `switchport trunk allowed vlan <list>`

**Spanning Tree Protocol (STP)** was enabled and verified across the switching topology to prevent Layer 2 loops, particularly within the second LAN where redundant paths were present. This reinforced the importance of loop prevention even in relatively small topologies.

### Inter-VLAN Routing (Router-on-a-Stick)

Inter-VLAN routing was implemented using a single router interface with multiple **sub-interfaces**, each tagged with an 802.1Q VLAN ID and assigned a gateway IP address for its respective subnet.

Key configurations included:
- `interface g0/0.<vlan-id>`
- `encapsulation dot1Q <vlan-id>`
- `ip address <gateway> <subnet-mask>`

This approach made VLAN-to-VLAN traffic routing explicit and easy to validate through interface-level testing.

### DHCP and Broadcast Forwarding

A central DHCP server was deployed to service over **100 endpoints**, with a **separate DHCP scope per VLAN**. Because DHCP operates using broadcast messages (DISCOVER/OFFER), clients in different VLANs could not reach the DHCP server directly.

To resolve this, **DHCP relay** was configured on each router sub-interface using:

```text
ip helper-address <DHCP-server-IP>


This ensured DHCP broadcasts were converted to unicast traffic and forwarded correctly to the server. Troubleshooting this stage reinforced how tightly DHCP behaviour is coupled to proper VLAN and routing configuration.

Routing Between LANs

A second LAN was added and connected via routed links. Static routing was configured on the routers to enable end-to-end connectivity between subnets in different LANs.

Key validation steps included:

Verifying routing tables (show ip route)

End-to-end ICMP testing across VLAN and LAN boundaries

Ensuring correct next-hop configuration

Troubleshooting and Root Cause Analysis

Several connectivity failures were traced using ICMP, ARP, and interface-level inspection:

ping to verify Layer 3 reachability

show arp to validate address resolution

show interfaces trunk to confirm VLAN propagation

A critical fault was identified where multiple uplinks between core and access switches were mistakenly configured as access ports instead of trunks, silently blocking VLAN traffic. This resulted in DHCP failures and inter-VLAN communication breakdowns despite correct routing and server configuration. Once these links were corrected to trunks, network functionality was restored immediately.

## Key Outcomes

This lab solidified practical understanding of:
- VLAN isolation and broadcast containment
- The dependency of DHCP on correct Layer 2 and Layer 3 design
- STP’s role in preventing Layer 2 instability
- How ROAS compares to Layer 3 switching in real deployments
- Structured troubleshooting using ARP and ICMP rather than trial-and-error

The final result was a stable, scalable LAN design with clear separation of concerns between switching, routing, and services. 

The lab reinforced that most network failures stem from design and interface configuration errors, not endpoint misconfiguration.
