variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-1"
}

# subnets to be uesed in web tier, provide by Farruh
variable "app-subnets" {
  description = "subnets used for app tier"
  default     = "subnet-02eb98a6c98657948,subnet-0f07916fc5091eb99"
}



# Amazon Linux 2 AMI 2.0.20200722.0 x86_64 HVM 8GB
variable "aws_amis" {
  default = {
    "us-west-1" = "ami-05655c267c89566dd"
  }
}

variable "availability_zones" {
  default     = "us-west-1a,us-west-1b"
  description = "List of availability zones that we will use in N California "
}

variable "key_name" {
  type        = string
  default     = "CA_key"
  description = "my key is N CA"

}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "1"
}

variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "2"
}

variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "1"
}

variable "alarms_sms" {
  description = "sms to use to send notifications"
  default     = "+17033091494"
}

# for the purpose of validating NACLs, added VPC variable:
variable "vpc_id" {
  description = "the VPC that Farruh is creating"
  default     = "vpc-0597074cbd4d61848"
}

#Note - terraform doesnt support email as SNS requires validation
################ please erase below, another option for local email sns set up #######

#variable "sns_subscription_email_address_list" {
#type = string
# description = "List of email addresses as string(space separated)"
#  default = "rpaskalev@premieraquatics.com"
#}

variable "web-sg-id" {
  description = "id of the security group for the web tier instances"
  #default     = "${aws_security_group.web-tier-sg.id}"
}