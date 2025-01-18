# DevOps + SRE Daily Challenge: Terraform Fundamentals and Beyond

Welcome to the first challenge in our Terraform Fundamentals subseries! 🎉

## Challenge Overview

This challenge introduces you to the fundamentals of Infrastructure as Code (IaC) using Terraform. You'll learn about Terraform's core concepts and create your first infrastructure deployment.

## Learning Objectives

By completing this challenge, you will:
- Understand Infrastructure as Code (IaC) concepts
- Learn Terraform's advantages over other IaC tools
- Explore multi-cloud and provider-agnostic benefits
- Install and configure Terraform providers
- Create and deploy a basic Terraform configuration

## Prerequisites

- Basic understanding of cloud computing concepts
- AWS Account (free tier is sufficient)
- Command-line interface familiarity

## Concepts Covered

### Infrastructure as Code (IaC)
- Definition and importance
- Benefits including consistency, scalability, and version control
- Comparison with manual infrastructure management

### Why Terraform?
- Provider ecosystem with 1700+ providers
- Declarative syntax using HCL
- Multi-cloud management capabilities
- State management features
- Modular design principles

### Terraform Workflow
1. Configuration using `.tf` files
2. Initialization with `terraform init`
3. Planning with `terraform plan`
4. Applying changes using `terraform apply`
5. State management via `terraform.tfstate`

## Hands-on Task

### Goal
Create a Terraform configuration to provision a basic S3 bucket in AWS.

### Steps

1. **Install Terraform**
   - Download from [Terraform Downloads](https://www.terraform.io/downloads.html)
   - Add to system PATH
   - Verify installation: `terraform version`

2. **Create Configuration**
   ```hcl
   provider "aws" {
     region  = "us-east-1"
     version = "~> 5.0"
   }

   resource "aws_s3_bucket" "my_bucket" {
     bucket = "terraform-basics-bucket"
     acl    = "private"
   }
   ```

3. **Initialize and Deploy**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **Verify Resources**
   - Check AWS Console for S3 bucket creation

5. **Clean Up**
   ```bash
   terraform destroy
   ```

## Submission Requirements

1. Your `main.tf` file
2. Screenshot of successful `terraform apply` output
3. Brief description of the Terraform workflow (init → plan → apply → destroy)

## Pro Tips

- Always use provider version constraints
- Validate configurations before applying
- Clean up resources after completion
- Use meaningful names for resources

## Additional Resources

- [Official HashiCorp Terraform Introduction](https://www.terraform.io/intro/index.html)
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Share Your Progress!

Share your achievement on social media using:
- #getfitwithsagar
- #SRELife
- #DevOpsForAll
- #terraformwithsagar

## Author

Sagar Utekar

---
*Note: This challenge is part of the DevOps + SRE Daily Challenge series. For previous challenges, check our GitHub repository.*
