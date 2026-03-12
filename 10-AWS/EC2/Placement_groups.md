# AWS Placement Groups

Placement Groups control **how EC2 instances are physically placed on the underlying AWS infrastructure**.
They are used to optimize **network performance, latency, and fault tolerance**.

Placement groups are used with **Amazon EC2 instances** inside **AWS data centers**.

---

# Types of Placement Groups

There are **3 types of placement groups**:

1. Cluster Placement Group
2. Spread Placement Group
3. Partition Placement Group

---

# 1. Cluster Placement Group

## Purpose

Provide **low latency and high network throughput** between EC2 instances.

## How it Works

Instances are placed **physically close together**, often within the **same rack or nearby racks** inside a **single Availability Zone**.

## Key Characteristics

* Extremely **low network latency**
* Very **high network throughput**
* Limited to **one Availability Zone**
* Instances may fail together if the rack fails

## Use Cases

High performance workloads such as:

* High Performance Computing (HPC)
* Distributed Machine Learning
* Big Data analytics
* Scientific simulations

## Example

```
Cluster Placement Group

[EC2] [EC2] [EC2] [EC2]
  All instances close together
```

## Pros

* Best network performance
* Lowest latency

## Cons

* Single Availability Zone only
* Risk of correlated failures

---

# 2. Spread Placement Group

## Purpose

Maximize **fault tolerance** by isolating instances across hardware.

## How it Works

Each instance is placed on **different physical hardware (different racks)**.

## Key Characteristics

* Instances run on **separate racks**
* Reduces **correlated hardware failures**
* Maximum **7 instances per Availability Zone**

## Use Cases

Small number of **critical servers** such as:

* Primary database nodes
* Licensing servers
* Domain controllers
* Critical microservices

## Example

```
Spread Placement Group

Rack A → EC2-1
Rack B → EC2-2
Rack C → EC2-3
Rack D → EC2-4
```

If one rack fails, only one instance is affected.

## Pros

* Highest fault isolation
* Prevents simultaneous hardware failure

## Cons

* Limited to 7 instances per AZ
* No special networking advantage

---

# 3. Partition Placement Group

## Purpose

Support **large distributed systems** while limiting failure impact.

## How it Works

Instances are divided into **partitions**, and each partition is placed on **separate hardware racks**.

## Key Characteristics

* Up to **7 partitions per Availability Zone**
* Each partition can contain **many instances**
* Failures affect only **one partition**

## Use Cases

Large distributed systems like:

* Hadoop clusters
* Cassandra clusters
* Kafka clusters
* Elasticsearch clusters

## Example

```
Partition Placement Group

Partition 1 → EC2 EC2 EC2
Partition 2 → EC2 EC2 EC2
Partition 3 → EC2 EC2 EC2
```

If Partition 2 fails, other partitions continue working.

## Pros

* Supports large clusters
* Fault isolation between partitions
* Ideal for distributed databases

## Cons

* Slightly higher latency than cluster placement groups

---

# Comparison Table

| Feature            | Cluster             | Spread           | Partition            |
| ------------------ | ------------------- | ---------------- | -------------------- |
| Main Goal          | Performance         | Fault Isolation  | Scalability          |
| Instance Limit     | Many                | 7 per AZ         | Hundreds             |
| Hardware Placement | Same rack area      | Separate racks   | Separate rack groups |
| Availability Zones | 1 AZ only           | Multiple AZs     | Multiple AZs         |
| Use Case           | HPC / ML / Big Data | Critical servers | Distributed systems  |

---

# Common Interview Questions

## Which placement group provides the lowest latency?

Cluster Placement Group.

## Which placement group isolates instances across hardware racks?

Spread Placement Group.

## Which placement group supports the largest number of instances?

Partition Placement Group.

---

# Auto Scaling Interview Trap

When using **Cluster Placement Groups** with Auto Scaling:

* Instances may fail to launch due to **insufficient contiguous hardware capacity**.
* AWS needs available hardware that can place instances **close together**.

### Solutions

* Launch instances **all at once**
* Use **larger instance types**
* Reduce number of instances
* Use multiple placement groups

---

# Quick Memory Trick

Cluster → Performance
Spread → Fault Isolation
Partition → Large Distributed Systems

---

# Summary

Placement Groups allow you to control **how EC2 instances are placed physically in AWS infrastructure**.

They help optimize:

* Network performance
* Fault tolerance
* Scalability

Choosing the correct placement group depends on **your workload requirements**.
