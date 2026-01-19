# 3-Tier VPC

This template deploys a 3-tier AWS VPC architecture across three Availability Zones.

- **Public Subnet**: load balancers, bastion hosts, etc. (public internet)
- **Private-Egress Subnet**: application tier (egress via NAT Gateway)
- **Private-Data Subnet**: databases and internal services (fully isolated, no internet)

Supports environment tags and deployment in 6 regions.

## Default Variable Values

- `application` = `sandbox`
- `environment` = `dev`
- `region` = `us-west-2`