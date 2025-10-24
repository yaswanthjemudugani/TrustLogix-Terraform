# TrustLogix-Terraform

---

## Task 1: Create Terraform Modules

1. Create Terraform modules to provision **two VPCs** — Control Plane (CP) and Data Plane (DP).  
2. Follow **best security practices** for creating subnets, route tables, and gateways.  
3. Implement **secure security groups** for restricted access and traffic control.  
4. Establish **VPC Peering** between CP and DP for inter-VPC communication.  

---

### Assumptions and Considerations

**AWS Region:**  
The deployment is configured for the **ap-south-1 (Mumbai)** region.

**CIDR Ranges:**  
- Control Plane VPC → `10.0.0.0/16`  
- Data Plane VPC → `192.168.0.0/16`

**Subnet Design:**  
Each VPC includes both **public** and **private** subnets for network segregation and security.

**Routing Configuration:**  
- Public subnets use an **Internet Gateway (IGW)** for external connectivity.  
- Private subnets route traffic via a **NAT Gateway** for outbound access.  
- Separate **route tables** are defined for public and private subnets, maintaining a least-privilege approach.

**Security Groups:**  
- **Inbound access** is restricted to the admin IP (`103.52.38.125/32`) for SSH and management.  
- **Outbound access** is permitted to the internet (`0.0.0.0/0`) for updates.  
- Security group rules follow **AWS best practices** and the **principle of least privilege**.

**VPC Peering:**  
- A dedicated **vpc-peering module** connects the Control Plane and Data Plane VPCs.  
- Route tables are automatically updated to enable **bidirectional communication** between them.  
- Connectivity is tightly controlled across both public and private subnets.

**Modular Design:**  
- The project follows **Terraform best practices** with reusable modules (`vpc` and `vpc-peering`).  
- **Variables** and **outputs** are parameterized for flexibility, scalability, and maintainability.

---

## Task 2: Deploy a Containerized Application on AWS ECS Fargate using Terraform

### Overview
This Terraform configuration provisions a fully managed ECS Fargate setup running an **Nginx** container from the public Docker registry.  
It automatically creates the networking layer, IAM roles, ECS cluster, task definition, and ECS service with public internet access.

---

### Assumptions and Considerations

**AWS Region:** ap-south-1 (Mumbai)

**Application Name:** nginx-fargate  
**Container Image:** nginx:latest  
**Container Port:** 80

**VPC Design:**
- CIDR: `10.0.0.0/16`
- Two public subnets: `10.0.1.0/24` (ap-south-1a) and `10.0.2.0/24` (ap-south-1b)
- Includes an Internet Gateway and route table for internet access.

**Security Group:**
- Allows inbound HTTP (port 80) from anywhere (`0.0.0.0/0`).
- Allows all outbound traffic for internet access.
- Follows least-privilege and best security practices.

**ECS Configuration:**
- Launch type: FARGATE  
- ECS Cluster name: `nginx-fargate-cluster`  
- Task Definition: defines an Nginx container with CPUs 0.25 / Memory 0.5 GB.  
- ECS Service: runs 1 replica with a public IP assigned to the task.

**IAM Configuration:**
- Creates an ECS Task Execution Role.
- Attaches AWS managed policy `AmazonECSTaskExecutionRolePolicy` for pulling images and logging.

**Load Balancer (Optional):**
- Code for ALB creation is included but commented out.
- Can be enabled later if ALB access is required.
  
**Note:** 
- This limitation is due to an **AWS Free Tier and billing restriction**, which currently prevents the creation of Application Load Balancers in any region.
- As a workaround, the configuration assigns a **public IP** to the ECS Fargate task to allow external access to the container without using a Load Balancer.

---
