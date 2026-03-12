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


# AWS ENI – Create and Attach

## Overview

An **Elastic Network Interface (ENI)** is a virtual network card that can be attached to an EC2 instance inside a VPC. It enables network communication and contains networking attributes such as IP addresses, MAC address, and security groups.

---

# How to Create and Attach an ENI

## 1. Create an ENI (AWS Console)

1. Log in to the AWS Management Console.
2. Navigate to **EC2 Dashboard**.
3. In the left sidebar, select **Network Interfaces** under **Network & Security**.
4. Click **Create Network Interface**.
5. Configure the following:

| Setting         | Description                                 |
| --------------- | ------------------------------------------- |
| Subnet          | Select the subnet where ENI will be created |
| Private IPv4    | Auto-assign or manually assign              |
| Security Groups | Attach security groups                      |
| Description     | Optional description                        |

6. Click **Create Network Interface**.

The ENI will now be created and ready to attach to an instance.

---

# 2. Attach ENI to EC2 Instance

1. Go to **Network Interfaces** in the EC2 console.
2. Select the ENI you created.
3. Click **Actions → Attach**.
4. Select the **EC2 instance**.
5. Specify the **Device Index**.

| Device Index | Interface      |
| ------------ | -------------- |
| 0            | eth0 (Primary) |
| 1            | eth1           |
| 2            | eth2           |

6. Click **Attach**.

---

# AWS CLI Method

## Create ENI

```bash
aws ec2 create-network-interface \
--subnet-id subnet-123456 \
--groups sg-123456 \
--description "My ENI"
```

---

## Attach ENI

```bash
aws ec2 attach-network-interface \
--network-interface-id eni-123456 \
--instance-id i-123456 \
--device-index 1
```

---

# Verify ENI

```bash
aws ec2 describe-network-interfaces
```

---

# Workflow Diagram

```
Create ENI
   ↓
Select Subnet
   ↓
Assign Security Groups
   ↓
Attach to EC2 Instance
   ↓
Choose Device Index (eth0 / eth1)
```

---

# Important Notes

* ENI must be in the **same Availability Zone** as the EC2 instance.
* **Primary ENI cannot be detached**.
* Only **secondary ENIs can be attached or detached**.
* The **number of ENIs depends on the EC2 instance type**.

---

# Interview Answer (Short)

**Question:** How do you create and attach an ENI?

**Answer:**

1. Go to EC2 → Network Interfaces.
2. Click **Create Network Interface** and configure subnet, IP, and security groups.
3. After creation, select the ENI.
4. Click **Actions → Attach**.
5. Choose the EC2 instance and specify the device index.
6. Attach the ENI.



