# DevOps + SRE Daily Challenge: Terraform Input Variables

Welcome to our DevOps + SRE Daily Challenge! 🎉 Today, we're exploring Input Variables in Terraform - a crucial concept for creating flexible and reusable infrastructure code.

## What are Input Variables?

Input variables in Terraform allow you to:
- Parameterize your configurations
- Make code reusable across different environments
- Avoid hardcoding values
- Share configurations with different settings

## Variable Declaration Syntax

### Basic Variable Declaration
```hcl
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources"
}
```

### Variable with Validation
```hcl
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch"
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Instance type must be either t2.micro or t3.micro."
  }
}
```

## Variable Value Resolution Priority

Terraform resolves variable values in the following order (highest to lowest priority):

1. **CLI Flags**
   ```bash
   terraform apply -var="region=us-west-2"
   ```

2. **Environment Variables**
   ```bash
   export TF_VAR_region=us-west-2
   terraform apply
   ```

3. **Variable Files (.tfvars)**
   ```hcl
   # terraform.tfvars
   region = "us-west-2"
   ```

4. **Default Values** (in variable blocks)

## Practical Examples

### Example 1: EC2 Instance Deployment
```hcl
# variables.tf
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of EC2 instance to launch"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

# main.tf
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = var.instance_type
}
```

### Example 2: Using Lists and Maps
```hcl
# variables.tf
variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Development"
    "Owner"       = "Team A"
  }
}

# main.tf
resource "aws_subnet" "example" {
  count             = length(var.availability_zones)
  availability_zone = var.availability_zones[count.index]
  cidr_block        = "10.0.${count.index}.0/24"
  tags              = var.tags
}
```

## Best Practices

1. **Documentation**
   - Always include descriptions for variables
   - Document any constraints or requirements
   - Provide examples in comments when helpful

2. **Validation**
   - Add validation blocks for critical variables
   - Include meaningful error messages
   - Restrict values to valid options

3. **Organization**
   - Use separate files for variables (variables.tf)
   - Group related variables together
   - Use consistent naming conventions

4. **Environment Management**
   - Create separate .tfvars files for different environments
   - Use workspace-specific variables when appropriate
   - Document required variables in README files

## Variable Types

- `string`: Text values
- `number`: Numeric values
- `bool`: True/false values
- `list`: Ordered sequence of values
- `map`: Collection of key-value pairs
- `object`: Complex structured data
- `tuple`: Fixed-length sequences
- `set`: Unordered collection of unique values

## Special Announcement 🎉

Complete all 50 challenges in this Daily DevOps+SRE Challenge series to receive a 50% discount voucher for the CNCF Exam!

## Next Steps

Stay tuned for Part 4 of the series, where we'll explore Terraform Output Values.

## Author

Sagar Utekar

---
*Part of the DevOps + SRE Daily Challenge series. Check our GitHub repository for previous challenges.*
