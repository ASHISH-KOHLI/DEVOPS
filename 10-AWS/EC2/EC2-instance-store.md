# EC2 Instance Store -- Notes

## What is EC2 Instance Store

EC2 Instance Store is temporary storage provided by Amazon EC2
instances.\
It is physically attached to the host machine where the EC2 instance
runs.

-   Provides high-speed input/output performance
-   Used for temporary data
-   Data is not persistent

**Important:** If the instance stops or terminates, the data is lost.

------------------------------------------------------------------------

## Key Characteristics

  Feature        Description
  -------------- -----------------------------
  Storage Type   Local disk attached to host
  Persistence    Temporary
  Performance    Very high I/O
  Cost           Included with instance
  Durability     Not durable

------------------------------------------------------------------------

## When Data Gets Deleted

Data in Instance Store is deleted when:

-   Instance stops
-   Instance terminates
-   Underlying host fails

Data **remains during a reboot**.

------------------------------------------------------------------------

## Common Use Cases

Instance Store is useful for temporary workloads such as:

-   Cache storage
-   Buffers
-   Temporary files
-   Scratch data
-   Big data processing
-   Video rendering

------------------------------------------------------------------------

## Instance Store vs EBS

  Feature           Instance Store            EBS
  ----------------- ------------------------- ---------------------
  Persistence       Temporary                 Persistent
  Attachment        Local to host             Network attached
  Performance       Very high                 High
  Data durability   No                        Yes
  Typical use       Cache or temporary data   Databases, OS disks

------------------------------------------------------------------------

## Memory Tip

**Instance Store = Fast but Temporary**\
**EBS = Persistent Storage**
