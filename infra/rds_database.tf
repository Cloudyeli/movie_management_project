resource "aws_db_instance" "movie_db" {
  allocated_storage    = var.db_storage
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_envine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.movie-db-pw.secret_string))["movie_db_password"]
  skip_final_snapshot  = var.db_skip_last_snapshop
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.db_movie_sg.id]
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "movie-db-subnet-group"
  subnet_ids = [data.aws_subnet.private_subnet_1.id, data.aws_subnet.private_subnet_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}