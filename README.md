Infrastructure & Full-Stack Development Assignment

Candidate: Khaled

Technologies: Linux (Ubuntu), PostgreSQL, Apache Tomcat, Docker, K8s, Vagrant.
1. Operating System (Linux)
System Information Script (sys_info.sh)

I developed a shell script to automate system auditing.

    Execution: chmod +x sys_info.sh && ./sys_info.sh

    Tasks Completed:

        Created user PS with primary group PSgroup and secondary group dba.

        Installed MySQL DB Engine and HAProxy.

        Configured UFW Firewall to allow TCP/UDP traffic on port 3306.

        Modified root password and explored Linux directory architecture (/etc, /var, /bin).

2. SQL & Database Management

Different Types of JOINs
*  INNER JOIN
* LEFT (OUTER) JOIN
* RIGHT (OUTER) JOIN
* FULL (OUTER) JOIN

RDBMS and NoSQL
* RDBMS (Relational Database Management System)

**    The Concept: Data is organized into pre-defined tables with rows and columns (like an Excel workbook).

**    Key Feature: Uses SQL (Structured Query Language) and follows strict rules called ACID properties to ensure data is 100% accurate (crucial for banking/finance).

**    Scaling: Usually scales Vertically (you buy a more powerful server).

**    Examples: PostgreSQL, MySQL, Oracle.

* NoSQL (Non-Relational)

**    The Concept: Data is stored in flexible formats like documents (JSON), key-value pairs, or graphs.

**    Key Feature: There is no fixed schema; you can add new types of data without restarting the database. It prioritizes speed and flexibility over strict consistency.

**    Scaling: Scales Horizontally (you just add more cheap servers to a cluster).

**    Examples: MongoDB, Cassandra, Redis.

Table Schema & Constraints

Implemented a relational schema for MyEmployee with the following:

    Primary Keys: Unique identifiers for all tables.

    Foreign Keys: Linked MyEmployee to MyDepartment, MyGender, and MyUniversity.

    Check Constraints: Ensured SALARY > 0.

Task Solutions

    Q2 (Joins): Used INNER JOIN to retrieve Employee names alongside their Department, Gender, and University names.

    Q3 (Aggregation): Grouped by Job Titles, using HAVING SUM(salary) > 2500 while filtering out 'Sales'.

    Q4 (Syntax Errors): Identified errors in the provided statement:

        Used x instead of * for multiplication.

        Alias ANNUAL SALARY lacks an underscore or quotes.

        Semicolon ; placed before the FROM clause.

    Q5 (Function): Created F_HR_QUERY to list employees hired after 'SCOTT'.

    Q6 (Procedure): Created P_COPY_EMPLOYEE to migrate data to MyEmployee_update.

3. Apache Tomcat & Automation

    JVM: The engine that enables Java code to run on any platform by converting bytecode to machine instructions.

    Application Server: Software that provides an environment to run web business logic (e.g., Tomcat).

    WAR File: A Web Application Archive containing all resources (code, XML, UI). It is deployed in Tomcat’s /webapps folder.

Implementation

    Reverse Proxy: Configured Nginx on port 80 to forward traffic to Tomcat.

    Port Mapping: Changed Tomcat default port from 8080 to 7070.

    Vagrant: Created a Vagrantfile using bento/ubuntu-24.04 with 2GB RAM, forwarding guest port 7070 to host 9090.

4. DevOps (Docker & Kubernetes)
Docker

    Created a custom Dockerfile using openjdk:8-jdk-alpine.

    Deployed a sample WAR file and pushed the image to Docker Hub.

    Registry Link: khaled175/my-tomcat:v1

    Ran PostgreSQL and Nginx as isolated containers.

Kubernetes (K3s)

    Installed K3s for lightweight orchestration.

    Node Roles: Identified Master (Control Plane) vs. Worker nodes via kubectl get nodes.

    Deployment: Executed a sample Nginx deployment to test cluster scaling.

5. Key Concepts & Theory
RAID Levels

    RAID 0: Performance (Striping).

    RAID 1: Redundancy (Mirroring).

    RAID 5: Balanced (Distributed Parity).

    RAID 10: High Speed + High Safety.

Cloud Computing Models

    IaaS (Infrastructure): Renting virtual hardware (e.g., AWS EC2).

    PaaS (Platform): Renting a coding environment (e.g., Heroku).

    SaaS (Software): Using ready-made apps (e.g., Google Workspace).

Networking

    DNS: Translates human-readable domain names into IP addresses.

    Load Balancer: Distributes incoming traffic across multiple servers to ensure High Availability (HA).

    DR (Disaster Recovery): Strategies (like off-site backups) to restore data after a catastrophic failure.

6. Project Directory Structure

├── database/
│   └── assignment.sql       # Schema, Function, and Procedure
├── infrastructure/
│   └── Vagrantfile          # Automation & Provisioning
├── docker/
│   └── Dockerfile           # Custom Tomcat Image
├── documentation/
│   └── sys_info.sh          # OS Audit Script
└── README.md                # Full Project Report
