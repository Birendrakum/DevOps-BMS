# --- Main CI/CD Server ---
resource "aws_instance" "main_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t3.medium"
  key_name      = "your-keypair"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.main_server_profile.name

  user_data = file("install-tools.sh")

  tags = {
    Name = "MainServer"
  }
}

# --- Monitoring Server ---
resource "aws_security_group" "monitoring_sg" {
  name        = "MonitoringSG"
  description = "Allow Prometheus, Grafana, Blackbox Exporter"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "Grafana UI"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Blackbox Exporter"
    from_port   = 9115
    to_port     = 9115
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MonitoringSG"
  }
}

resource "aws_instance" "monitoring_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t3.medium"
  key_name      = "your-keypair"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  user_data = file("install-monitoring.sh")

  tags = {
    Name = "MonitoringServer"
  }
}
