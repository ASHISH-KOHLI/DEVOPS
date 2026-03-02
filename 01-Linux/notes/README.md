# 🖥️ Increase Ubuntu VM Disk Size (Hypervisor + Non-LVM Setup)

This guide explains how to increase the disk size of an Ubuntu VM and properly extend the filesystem inside the VM.

---

# Step 1: Increase Disk Size from Hypervisor

First, increase the virtual disk size from your hypervisor settings.

> ⚠️ Do NOT resize the disk while the VM is running.

---

# Step 2: Identify VM Disk File (On Host Machine)

On the **Linux host** (not inside the VM), run:

```bash
virsh list --all
````

Find your VM name, then:

```bash
virsh domblklist <VM_NAME>
```

Example output:

```
vda   /var/lib/libvirt/images/ubuntu.qcow2
```

👉 Note the `.qcow2` or `.img` path.

---

# Step 3: Shutdown the VM (Mandatory)

```bash
virsh shutdown <VM_NAME>
```

Wait until it’s completely off:

```bash
virsh list --all
```

---

# Step 4: Increase Disk Size (Host Machine)

Example: Increase disk by **+20GB**

```bash
qemu-img resize /var/lib/libvirt/images/ubuntu.qcow2 +20G
```

Verify:

```bash
qemu-img info /var/lib/libvirt/images/ubuntu.qcow2
```

> ⚠️ This increases the virtual disk only — NOT the filesystem.

---

# Step 5: Start the VM

```bash
virsh start <VM_NAME>
```

Login to the Ubuntu VM.

---

# Step 6: Check Disk Inside VM

Inside the VM:

```bash
lsblk
```

Example:

```
vda      40G
├─vda1   20G
└─vda2   19G
```

The disk is larger, but the partition is not yet expanded.

---

# Choose Your Case 👇

---

# ✅ CASE 1: LVM (Most Ubuntu Server Installs)

Check:

```bash
lsblk
```

If you see something like:

```
vda
└─vda3
  └─ubuntu--vg-ubuntu--lv
```

You are using LVM.

---

## Step A: Extend Partition

```bash
sudo growpart /dev/vda 3
```

## Step B: Resize Physical Volume

```bash
sudo pvresize /dev/vda3
```

## Step C: Extend Logical Volume

```bash
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
```

## Step D: Resize Filesystem

For ext4:

```bash
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
```

Verify:

```bash
df -h
```

🎉 Done!

---

# ✅ CASE 2: Non-LVM (Single ext4 Partition)

Example:

```
vda
└─vda1
```

## Step A: Grow Partition

```bash
sudo growpart /dev/vda 1
```

## Step B: Resize Filesystem

```bash
sudo resize2fs /dev/vda1
```

Verify:

```bash
df -h
```

---

# If `growpart` Is Not Installed

```bash
sudo apt update
sudo apt install cloud-guest-utils
```

---

# 🧪 Real Example (Your Setup)

You ran:

```bash
lsblk
```

Output:

```
sda       8:0    0    50G  0 disk
├─sda1    8:1    0  11.9G  0 part /
├─sda14   8:14   0     4M  0 part
└─sda15   8:15   0   106M  0 part /boot/efi
```

### Analysis:

* Disk size: **50 GB**
* Root partition: **11.9 GB**
* Not using LVM
* Remaining space is unallocated

We just need to expand `sda1`.

---

# ✅ Safe Fix for Your Setup

## Step 1: Install Required Tool

```bash
sudo apt update
sudo apt install -y cloud-guest-utils
```

## Step 2: Grow Root Partition

```bash
sudo growpart /dev/sda 1
```

Expected output:

```
CHANGED: partition=1 start=2048 old: size=24903680 end=24905728 new: size=104855519 end=104857567
```

If you see **CHANGED**, it worked.

---

## Step 3: Resize Filesystem

```bash
sudo resize2fs /dev/sda1
```

---

## Step 4: Verify

```bash
df -h
```

You should now see:

```
Filesystem      Size  Used  Avail  Use%
/dev/sda1        49G   8G    38G    18%
```

🎉 Disk successfully increased!

---

# 🐳 Why This Fixes Docker Errors

Earlier error:

```
no space left on device
```

Docker stores data in:

```
/var/lib/docker
```

That lives on `/`, which was only **11.9GB**.

Now you have ~50GB available, so:

```bash
docker pull mysql
```

will work without issues.

---

# Optional: Clean Old Docker Data

After resizing:

```bash
docker system prune -a
```

---

# ❌ Common Mistakes

* ❌ Resizing disk while VM is running
* ❌ Forgetting filesystem resize
* ❌ Editing partitions manually with `fdisk` (risky)

---

# ✅ Quick Checklist

✔ VM powered off
✔ Disk resized on host
✔ `growpart` executed inside VM
✔ `resize2fs` executed
✔ Verified with `df -h`

