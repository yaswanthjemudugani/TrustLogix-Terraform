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

## Task 2: Deploy a containerized application on AWS ECS Fargate using Terraform.

---
