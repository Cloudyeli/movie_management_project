resource "aws_instance" "movie_mgmt_server" {
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.movie_app_sg.id]
  key_name               = var.keypair_name
  user_data              = file("${path.module}/user-data.sh")
  tags = {
    Name = "movie_mgmt_server"
  }
}