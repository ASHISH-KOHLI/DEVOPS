# 📘 etcd Notes (DevOps + Interview Preparation)

---

## 🔹 What is etcd?

**etcd** is a **distributed, reliable key-value store** used to store critical data in a cluster.

> It is widely used in Kubernetes to store cluster state and configuration.

---

## 🧠 Simple Understanding

Think of etcd as:

* A **central database** for distributed systems
* Stores configuration + system state
* Shared across multiple machines

---

## ⚙️ Why etcd is Important?

In distributed systems, we need:

* Shared configuration
* Service discovery
* Leader election
* Consistent data across nodes

👉 etcd provides all of this with **strong consistency**

---

## 🏗️ Key Features

### 1. Distributed

* Runs on multiple nodes
* Data is replicated across nodes

### 2. Strong Consistency

* Uses Raft Consensus Algorithm
* Ensures all nodes have the same data

### 3. High Availability

* Cluster continues working even if some nodes fail

### 4. Key-Value Store

Data is stored as:

```
key → value
```

Example:

```
/kubernetes/pods/nginx → running
```

### 5. Watch Mechanism

* Clients can watch for changes in keys
* Used heavily in Kubernetes

---

## 📦 Use Cases

### 1. Kubernetes

* Stores:

  * Pods
  * Services
  * Secrets
  * ConfigMaps
  * Cluster state

👉 Without etcd, Kubernetes cannot function

---

### 2. Service Discovery

* Helps services find each other dynamically

---

### 3. Configuration Management

* Stores runtime configuration

---

## 🧩 Architecture

### Cluster Setup

* Always use **odd number of nodes** (3, 5, 7)

### Node Types

* Leader
* Followers

👉 Leader handles all write requests

---

## 🔁 Working Flow

1. Client sends request
2. Leader receives request
3. Leader replicates data to followers
4. Majority (quorum) agrees
5. Data is committed

---

## 🔒 Data Safety

* Write Ahead Log (WAL)
* Snapshots for backup
* Data replication across nodes

---

## 📊 Basic Commands (etcdctl)

### Set Key

```bash
etcdctl put name "ashish"
```

### Get Key

```bash
etcdctl get name
```

### Delete Key

```bash
etcdctl del name
```

---

## ⚠️ Important Concepts

### Quorum

* Majority of nodes must agree for a write

### Leader Election

* One leader at a time
* Automatically re-elected if leader fails

### Snapshot

* Backup of etcd data

---

## 🧪 Real DevOps Scenario

* Kubernetes API server interacts with etcd
* When you run:

```bash
kubectl apply -f pod.yaml
```

👉 Data is stored in etcd

---

## 🔥 Interview Questions

### Q1: What is etcd?

A distributed key-value store used to store cluster data.

---

### Q2: Why is etcd important in Kubernetes?

It stores all cluster state and configuration.

---

### Q3: What happens if etcd fails?

Kubernetes stops functioning properly.

---

### Q4: Why use odd number of nodes?

To maintain quorum and avoid split-brain.

---

### Q5: What algorithm does etcd use?

Raft Consensus Algorithm.

---

### Q6: What is quorum?

Minimum majority required to commit a change.

---

### Q7: Can etcd handle high availability?

Yes, through clustering and replication.

---

## 📝 Quick Revision

* etcd = Distributed key-value store
* Strongly consistent
* Uses Raft algorithm
* Core component of Kubernetes
* Stores cluster state

---

## 🚀 Pro Tips (For Interviews)

* Always mention **Raft + quorum**
* Say **"etcd is the brain of Kubernetes"**
* Explain **leader-follower architecture**
* Give real example using `kubectl`

---

## 📌 Bonus (Advanced Topics)

* etcd backup & restore
* etcd security (TLS)
* etcd performance tuning
* Compaction & defragmentation

---

## ✅ Conclusion

etcd is a critical component in modern distributed systems, especially Kubernetes. Understanding its architecture and working is essential for any DevOps Engineer.

---
