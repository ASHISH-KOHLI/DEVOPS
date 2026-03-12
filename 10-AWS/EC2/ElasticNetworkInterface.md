# AWS ENI (Elastic Network Interface)

## What is ENI?

**Elastic Network Interface (ENI)** is a virtual network card in **Amazon Web Services (AWS)** that can be attached to an **EC2 instance** inside a **VPC**.

It enables network communication for EC2 instances and contains networking configuration such as IP addresses, security groups, and MAC address.

Think of it as a **virtual Network Interface Card (NIC)** for cloud servers.

---

## Key Components of an ENI

An ENI contains the following networking attributes:

* **Private IPv4 address** (Primary + Secondary)
* **Public IPv4 address / Elastic IP**
* **MAC address**
* **Security Groups**
* **Subnet association**
* **Source/Destination check flag**

---

## Types of ENI

### 1. Primary ENI

* Automatically created when an EC2 instance is launched.
* Cannot be detached from the instance.
* Assigned to the **primary subnet**.

### 2. Secondary ENI

* Additional ENIs that can be attached to the instance.
* Can be **attached or detached** dynamically.
* Useful for advanced networking setups.

---

## Key Features

### 1. Attach and Detach

An ENI can be detached from one EC2 instance and attached to another instance in the **same Availability Zone**.

### 2. Multiple ENIs per Instance

Depending on the EC2 instance type, multiple ENIs can be attached to a single instance.

Example:

* `eth0` → Primary ENI
* `eth1` → Secondary ENI

### 3. IP Address Retention

ENIs retain their:

* Private IP
* Elastic IP
* Security groups

This makes them useful for **failover scenarios**.

### 4. Security Groups per ENI

Each ENI can have different **security groups**, enabling granular network security.

---

## Example Architecture

EC2 Instance with Multiple ENIs:

* **ENI 1 (eth0)** → Public Subnet → Internet traffic
* **ENI 2 (eth1)** → Private Subnet → Internal service communication

This allows separation of **public and private network traffic**.

---

## Common Use Cases

* High availability and failover
* Network appliances (firewalls, proxies)
* Multi-homed instances
* Separate management and application traffic
* Load balancing architectures

---

## Important Limitations

* ENIs must be attached to instances within the **same Availability Zone**.
* The **number of ENIs per instance depends on the instance type**.
* The **primary ENI cannot be detached**.

---

## Example CLI Command

Attach an ENI to an EC2 instance:

```bash
aws ec2 attach-network-interface \
--network-interface-id eni-12345678 \
--instance-id i-12345678 \
--device-index 1
```

---

## Quick Summary

| Feature     | Description                    |
| ----------- | ------------------------------ |
| ENI         | Virtual network interface      |
| Attached To | EC2 Instances                  |
| Contains    | IPs, MAC, Security Groups      |
| Supports    | Attach/Detach                  |
| Used For    | Advanced networking & failover |

---


