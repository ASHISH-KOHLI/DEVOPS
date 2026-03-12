# AWS EBS – Elastic Block Store

## Overview

**Amazon Elastic Block Store (EBS)** provides **persistent block-level storage** for **Amazon EC2 instances**.
It functions like a **hard disk in the cloud**. Data persists independently of the EC2 instance lifecycle, making it ideal for **databases, applications, and boot volumes**.

---

## Key Features

* **Persistent Storage:** Data survives instance stop/termination.
* **Block-Level Storage:** Can be formatted with a filesystem like ext4, XFS, or NTFS.
* **Attachable to EC2:** Can attach/detach to instances in the same Availability Zone (AZ).
* **Snapshots:** Backup volumes to S3.
* **High Availability:** Data is replicated within the AZ.
* **Scalable:** Resize volume and change type dynamically for some types.
* **Encrypted:** Supports encryption at rest using AWS KMS.

---

## EBS Volume Types

| Volume Type   | Description              | Use Case                              |
| ------------- | ------------------------ | ------------------------------------- |
| **gp3 / gp2** | General Purpose SSD      | Boot volumes, transactional workloads |
| **io2 / io1** | Provisioned IOPS SSD     | Databases requiring high IOPS         |
| **st1**       | Throughput Optimized HDD | Big data, log processing              |
| **sc1**       | Cold HDD                 | Infrequent access, archival           |

---

## Key Concepts

1. **Volume:** Virtual disk that attaches to EC2.
2. **Snapshot:** Backup of a volume stored in S3.
3. **Attach/Detach:** Volumes can be attached/detached to EC2 instances in the same AZ.
4. **Encryption:** Optional using AWS KMS.
5. **Performance Metrics:** IOPS, throughput, and latency can vary by volume type.

---

## How EBS Works

* EBS volumes are **replicated within the same AZ** for durability.
* Attach a volume to an EC2 instance.
* Format the volume with a filesystem (ext4, XFS, NTFS).
* Mount and use it like a normal disk.
* Create snapshots for backup or migration.

---

## CLI Commands

### Create a Volume

```bash id="ebs-create"
aws ec2 create-volume \
--availability-zone us-east-1a \
--size 100 \
--volume-type gp3
```

### Attach a Volume

```bash id="ebs-attach"
aws ec2 attach-volume \
--volume-id vol-0123456789abcdef0 \
--instance-id i-0123456789abcdef0 \
--device /dev/sdf
```

### Detach a Volume

```bash id="ebs-detach"
aws ec2 detach-volume \
--volume-id vol-0123456789abcdef0
```

### Create a Snapshot

```bash id="ebs-snapshot"
aws ec2 create-snapshot \
--volume-id vol-0123456789abcdef0 \
--description "Backup snapshot"
```

### Delete a Snapshot

```bash id="ebs-snapshot-delete"
aws ec2 delete-snapshot \
--snapshot-id snap-0123456789abcdef0
```

---

## EBS vs Instance Store

| Feature       | EBS                                   | Instance Store           |
| ------------- | ------------------------------------- | ------------------------ |
| Persistence   | ✅ Persistent                          | ❌ Lost on stop/terminate |
| Backup        | ✅ Snapshots                           | ❌ No snapshot support    |
| Attach/Detach | ✅ Can attach to other instances in AZ | ❌ Fixed to instance      |
| Performance   | High, depends on type                 | Very high I/O            |
| Use Case      | Databases, critical data              | Temporary storage, cache |

---

## EBS Lifecycle

```text id="ebs-lifecycle"
Create Volume
     ↓
Attach to EC2
     ↓
Format & Mount
     ↓
Use for applications
     ↓
Optional: Snapshot for backup
     ↓
Detach / Delete when done
```

---

## Common Use Cases

* Boot volumes for EC2 instances
* Database storage (MySQL, PostgreSQL, MongoDB)
* File systems for applications
* Big data and analytics workloads
* Persistent storage for long-running workloads

---

## Interview Tip

**Question:** What is EBS in AWS?

**Answer:**
Amazon EBS (Elastic Block Store) provides **persistent block-level storage** for EC2 instances.
It can be attached/detached to instances, supports **snapshots**, offers **high availability**, and is ideal for **databases, boot volumes, and applications requiring durable storage**.

