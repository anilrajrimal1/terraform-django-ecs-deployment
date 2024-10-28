resource "aws_key_pair" "key1" {
  key_name   = var.key_name
  public_key = file("/home/anil/.ssh/id_rsa.pub")
}