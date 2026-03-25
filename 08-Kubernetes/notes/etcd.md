🔹 What is etcd?

etcd is a distributed, reliable key-value store used to store critical data in a cluster.

👉 It is a core component of Kubernetes, where it stores the entire cluster state.

🔹 Simple Explanation

etcd acts like a central brain/database of a distributed system.

It keeps track of:

System configuration
Cluster state
Service information
🔹 Why etcd is Needed?

In distributed systems, we need:

Consistent shared data
Fault tolerance
Coordination between nodes

👉 etcd solves all of these problems.

🔹 Key Features
✅ 1. Distributed
Runs on multiple nodes (cluster)
Data replicated across nodes
✅ 2. Strong Consistency
Uses Raft Consensus Algorithm
Ensures all nodes see the same data
✅ 3. High Availability
Cluster continues working even if some nodes fail
✅ 4. Key-Value Storage

Data format:

key → value

Example:

/cluster/node1/status → active
✅ 5. Watch Mechanism
Clients can “watch” keys
Used for real-time updates (important in Kubernetes)
🔹 Use Cases
1. Kubernetes (Most Important)

Stores:

Pods
Services
Secrets
ConfigMaps
Cluster state

👉 If etcd fails → Kubernetes control plane fails

2. Service Discovery
Helps services locate each other
3. Configuration Management
Stores dynamic configs centrally
🔹 Architecture
Cluster Setup
Recommended: Odd number of nodes (3, 5, 7)
Node Roles
Leader
Followers

👉 Only leader handles writes

🔹 How etcd Works
Client sends request
Leader receives request
Leader replicates data to followers
Majority (quorum) agrees
Data is committed
🔹 Important Concepts
🔸 Quorum
Majority of nodes must agree
Example: In 3 nodes → 2 required
🔸 Leader Election
One leader at a time
Automatically re-elected if leader fails
🔸 Snapshot
Backup of etcd data
Used for recovery
🔸 WAL (Write Ahead Log)
Logs changes before applying
Ensures durability
🔹 Basic Commands (etcdctl)
# Set key
etcdctl put name "ashish"

# Get key
etcdctl get name

# Delete key
etcdctl del name

# Check cluster health
etcdctl endpoint health

# Take snapshot
etcdctl snapshot save backup.db
🔹 Security Features
TLS encryption
Authentication (RBAC)
Data encryption at rest
🔹 Best Practices
Always use odd number of nodes
Take regular snapshots
Secure with TLS
Monitor etcd performance
Keep etcd on dedicated nodes (in production)
🔹 Common Issues
Issue	Impact
etcd down	Kubernetes stops working
Network partition	Split-brain risk
Disk slow	Performance issues
No backup	Data loss
