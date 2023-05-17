# ---compute/outputs.tf --

output "instance" {
  value     = aws_instance.node[*]
  sensitive = true
}