locals {
  name        = "beta"
  environment = "dev"
}
# Test comment
resource "null_resource" "change" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}