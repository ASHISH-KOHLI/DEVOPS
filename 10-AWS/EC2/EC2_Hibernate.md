# AWS EC2 Hibernate

## Overview

**Hibernate** in EC2 allows you to pause an instance while **saving the contents of RAM to the root EBS volume**. When the instance starts again, it resumes exactly where it left off.

This is useful when you want to **preserve the application state in memory** and avoid restarting applications.

---

## How Hibernate Works

1. When hibernation is triggered, the **RAM state is saved to the root EBS volume**.
2. The instance stops.
3. When the instance is started again, the **RAM state is restored**.
4. Applications resume from the same state.

---

## Instance State Flow

```text
Running
   ↓
Hibernate
   ↓
RAM Saved to EBS
   ↓
Instance Stopped
   ↓
Start Instance
   ↓
RAM Restored
   ↓
Running (same state as before)
```

---

# Benefits of EC2 Hibernate

* Resume applications quickly
* Preserve in-memory data
* Avoid application reinitialization
* Faster recovery compared to rebooting
* Useful for long-running workloads

---

# Requirements for EC2 Hibernate

| Requirement            | Description                                        |
| ---------------------- | -------------------------------------------------- |
| Instance Type          | Must support hibernation                           |
| Root Volume            | Must be **EBS volume**                             |
| Root Volume Encryption | Must be **encrypted**                              |
| RAM Size               | Must be **≤ 150 GB**                               |
| OS Support             | Amazon Linux, Ubuntu, Windows (supported versions) |
| Hibernation Enabled    | Must be enabled during instance launch             |

---

# Steps to Enable EC2 Hibernate

## 1. Launch EC2 Instance

1. Go to EC2 Console.
2. Click **Launch Instance**.
3. Choose AMI.
4. Select supported instance type.

---

## 2. Configure Instance Settings

Under **Advanced Details**:

Enable:

```
Enable hibernation
```

---

## 3. Configure Storage

* Root volume must be **EBS**
* Enable **EBS encryption**

---

## 4. Launch Instance

After launching, the instance will support **hibernate**.

---

# How to Hibernate an Instance

## Using AWS Console

1. Go to **EC2 Instances**
2. Select the instance
3. Click **Instance State**
4. Choose **Hibernate**

---

# CLI Command

```bash
aws ec2 stop-instances \
--instance-ids i-123456789 \
--hibernate
```

---

# Difference Between Stop and Hibernate

| Feature           | Stop            | Hibernate       |
| ----------------- | --------------- | --------------- |
| RAM preserved     | ❌ No            | ✅ Yes           |
| Boot time         | Normal restart  | Faster resume   |
| Application state | Lost            | Preserved       |
| Use case          | Normal shutdown | Pause workloads |

---

# Use Cases

* Long-running analytics jobs
* Machine learning workloads
* Development environments
* Applications requiring fast resume

---

# Limitations

* Must enable **before launching the instance**
* Not all instance types support hibernation
* RAM must be **≤150 GB**
* Root volume must be **encrypted EBS**
* Instance store volumes are **not supported**

---

# Interview Question

**What is EC2 Hibernate?**

**Answer:**

EC2 Hibernate allows an instance to save its RAM state to the root EBS volume and stop the instance. When the instance starts again, the RAM is restored and the applications resume from the previous state.
