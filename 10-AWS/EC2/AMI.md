# Amazon Machine Image (AMI) – Notes

## Introduction
An **Amazon Machine Image (AMI)** is a pre-configured template used to create virtual servers called **instances** in Amazon Web Services (AWS) EC2.

It contains the information required to launch an instance in the cloud.

---

## Components of an AMI

An AMI typically includes:

1. **Operating System**
   - Linux
   - Windows
   - Ubuntu

2. **Application Server (Optional)**
   - Apache
   - Nginx
   - Tomcat

3. **Applications and Code**
   - Installed software
   - Custom application code

4. **Configuration Settings**
   - System configuration
   - Startup scripts
   - Storage configuration

---

## Purpose of AMI

The main purpose of AMI is to **quickly launch multiple identical virtual machines**.

Example:
- A system administrator configures one EC2 instance.
- Creates an AMI from that instance.
- Uses the AMI to launch many instances with the same configuration.

---

## Types of AMIs

### 1. Public AMI
- Available for anyone to use
- Provided by AWS or community users

### 2. Private AMI
- Created for personal or organizational use
- Not publicly available

### 3. Shared AMI
- Shared with specific AWS accounts

---

## AMI Components Structure

| Component | Description |
|----------|-------------|
| Root Volume Template | Contains OS and base software |
| Launch Permissions | Controls who can use the AMI |
| Block Device Mapping | Defines storage volumes attached |

---

## AMI Lifecycle

1. Launch an EC2 instance
2. Configure software and settings
3. Create an AMI from the instance
4. Store AMI in AWS
5. Launch new instances using the AMI

---

## Working of AMI
