# AWS EBS Snapshots – Notes

## 1. What is an EBS Snapshot?

An **EBS Snapshot** is a **point-in-time backup of an EBS volume** used by EC2 instances.
Snapshots allow you to store and restore data from a specific moment.

* Stored in **Amazon S3 (managed internally by AWS)**
* Used for **backup, disaster recovery, and migration**

---

# 2. Key Characteristics

## Incremental Backup

EBS snapshots are **incremental**.

Example:

| Snapshot   | Data Stored                      |
| ---------- | -------------------------------- |
| Snapshot 1 | 100 GB (full copy)               |
| Snapshot 2 | Only changed blocks (e.g., 5 GB) |
| Snapshot 3 | Only changed blocks (e.g., 2 GB) |

Benefits:

* Reduced storage cost
* Faster backups
* Efficient storage usage

---

# 3. Snapshot Workflow

```
EBS Volume
     ↓
Create Snapshot
     ↓
Stored in S3
     ↓
Restore Snapshot
     ↓
New EBS Volume
```

---

# 4. Common Use Cases

## Backup and Recovery

* Protect against accidental deletion or corruption.

## Create New Volumes

* Launch new volumes from snapshots.

## Disaster Recovery

* Copy snapshots to another region.

## Create AMIs

* Snapshots are used when creating EC2 machine images.

---

# 5. Snapshot Features

### Encryption

* Encrypted volumes create encrypted snapshots.

### Cross-Region Copy

* Snapshots can be copied to other regions.

### Cross-Account Sharing

* Snapshots can be shared between AWS accounts.

### Fast Snapshot Restore (FSR)

* Improves volume restore performance.

---

# 6. Snapshot Lifecycle Management

AWS provides automated snapshot management using lifecycle policies.

Example tasks:

* Daily snapshots
* Weekly retention
* Automatic deletion

Benefits:

* Automation
* Cost control
* Compliance

---

# 7. Pricing

You are charged for:

* Snapshot storage (per GB/month)
* Cross-region snapshot copy
* Fast Snapshot Restore (optional)

Example:

```
Snapshot Storage Cost ≈ $0.05 per GB/month
```

---

# 8. AWS CLI Examples

## Create Snapshot

```bash
aws ec2 create-snapshot \
--volume-id vol-1234567890abcdef \
--description "Daily Backup"
```

## Create Volume from Snapshot

```bash
aws ec2 create-volume \
--snapshot-id snap-1234567890abcdef \
--availability-zone ap-south-1a
```

---

# 9. Best Practices

* Take **regular snapshots**
* Use **lifecycle policies**
* Copy critical snapshots to **another region**
* Enable **encryption**
* Delete unused snapshots to save cost

---

# 10. Interview Quick Answer

**EBS Snapshot** is a **point-in-time incremental backup of an EBS volume stored in Amazon S3**, used for **backup, recovery, and creating new volumes**.
