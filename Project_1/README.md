Project Overview
This project automates the creation of a Google Kubernetes Engine (GKE) standard cluster with three nodes using Terraform. The infrastructure is modular, with each cluster component defined in separate Terraform modules for better organization and reusability.

Key Features
GKE Cluster Deployment: Creates a standard GKE cluster with three nodes.
Modular Design: Implements separate Terraform modules for each component of the cluster, ensuring scalability and maintainability.
State Management:
AWS S3 Backend: The Terraform state file is stored in an S3 bucket with versioning enabled, providing a backup mechanism and improved reliability.
DynamoDB Locking: Utilizes an AWS DynamoDB table for state file locking to ensure consistency during concurrent operations.