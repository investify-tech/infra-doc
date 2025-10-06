---
title: "Kubernetes"
date: 2024-09-29
weight: 30
---

# Kubernetes

Kubernetes is our container orchestration platform for deploying and managing applications at scale.

## Cluster Architecture

### Control Plane
- **API Server**: Entry point for all operations
- **etcd**: Distributed key-value store
- **Scheduler**: Pod placement decisions
- **Controller Manager**: Maintains desired state

### Worker Nodes
- **kubelet**: Node agent
- **kube-proxy**: Network proxy
- **Container Runtime**: Docker/containerd

## Core Resources

### Workloads
- **Pods**: Smallest deployable unit
- **Deployments**: Manage replica sets
- **StatefulSets**: Ordered, persistent applications
- **DaemonSets**: One pod per node

### Services & Networking
- **Services**: Expose applications
- **Ingress**: HTTP/HTTPS routing
- **ConfigMaps**: Configuration data
- **Secrets**: Sensitive information

## Operations

```bash
# Basic commands
kubectl get pods
kubectl logs <pod-name>
kubectl exec -it <pod-name> -- /bin/bash
```

## Monitoring

Key metrics to track:
- CPU/Memory utilization
- Pod restart count
- Node status
- Network latency