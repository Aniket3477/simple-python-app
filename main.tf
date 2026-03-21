# 1. AWS Provider Configuration

provider "aws" {
  region = "ap-south-1" # Mumbai Region
}

# 2. Security Group (Firewall) Definition

resource "aws_security_group" "devsecops_sg" {
  name        = "devsecops-project-sg"
  description = "Allow SSH and Jenkins ports"

  # Inbound Rule: SSH ke liye (Port 22)
  ingress {
    description = "Allowing access for DevSecOps project"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["49.36.144.10/32"] # Sabke liye open (testing ke liye)
  }

  # Inbound Rule: Jenkins/App ke liye (Port 8080)
  ingress {
   description = "Allowing access for DevSecOps project"
   from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["49.36.144.10/32"]
  }

  # Outbound Rule: Internet access ke liye (All Traffic)
  egress {
    description = "Allowing access for DevSecOps project"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp" # -1 matlab saare protocols allowed hain
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound HTTP for updates"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "DevSecOps-SG"
  }
}

# 3. EC2 Instance (The Server) Definition

resource "aws_instance" "devsecops_server" {
  ami           = "ami-03bb6d83c60fc5f7c" # Ubuntu 22.04 LTS (Mumbai)
  instance_type = "t3.small"             # Jenkins ke liye minimum requirement

# Fix 2: Enforce IMDSv2 (High Issue)
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required" 
  }
  # Console par banayi gayi Key ka naam yahan likhein
  key_name      = "my-laptop-key" 

  # Server ko Security Group se connect karna
  vpc_security_group_ids = [aws_security_group.devsecops_sg.id]

  # Storage configuration (Default 8GB hota hai, humne 20GB kar diya)

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true    # Fix 1: Encryption yahan add karein
    delete_on_termination = true
  }

  tags = {
    Name = "DevSecOps-Jenkins-Server"
  }
}

# 4. Output: Server banne ke baad IP address dikhane ke 

output "server_public_ip" {
  value = aws_instance.devsecops_server.public_ip
}
