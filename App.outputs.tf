output "security_group" {
  value = aws_security_group.app-tier-sg.id
}

output "launch_configuration" {
  value = aws_launch_configuration.app-tier-lc.id
}

output "asg_name" {
  value = aws_autoscaling_group.app-tier-asg.id
}

output "elb_name" {
  value = aws_lb.app-tier-lb.dns_name
}
