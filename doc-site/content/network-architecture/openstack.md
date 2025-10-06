---
title: "OpenStack"
date: 2024-09-29
weight: 11
---

# OpenStack

Our OpenStack infrastructure is organized into three Virtual Private Clouds (VPCs) to separate environments and ensure proper isolation.

## VPCs Overview

### Test VPC

The Test VPC provides an isolated environment for development and testing activities.

### IntSys VPC

The IntSys (Internal Systems) VPC hosts internal PROD systems like the monitoring stack or SonarQube.

### PROD VPC

The PROD (Production) VPC runs all customer-facing applications.


## Architecture Diagram

![OpenStack VPCs Architecture](/images/openstack-vpcs.svg)

## Network Connectivity

Each VPC maintains its own:
- Security groups and access control lists
- Load balancers and floating IP pools
- Network monitoring and logging
