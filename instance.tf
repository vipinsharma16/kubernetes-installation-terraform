resource "aws_instance" "master" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "kubernetes"
    #user_data = filebase64("${path.module}/userdata.txt")
    user_data = base64encode(local.kubernetes-setup)
  
  tags = {
    Name = var.Name[0]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.hostname[0]}",
    ] 
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("${path.module}/id_rsa.pem")
      host = self.public_ip
      timeout = "1m"
    }  
  }
}

resource "aws_instance" "workernode1" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "kubernetes"
    #user_data = filebase64("${path.module}/userdata.txt")
    user_data = base64encode(local.kubernetes-setup)
  
  tags = {
    Name = var.Name[1]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.hostname[1]}",
    ] 
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("${path.module}/id_rsa.pem")
      host = self.public_ip
      timeout = "1m"
    }  
  }
}

resource "aws_instance" "workernode2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "kubernetes"
    #user_data = filebase64("${path.module}/userdata.txt")
    user_data = base64encode(local.kubernetes-setup)
  
  tags = {
    Name = var.Name[2]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.hostname[2]}",
    ] 
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("${path.module}/id_rsa.pem")
      host = self.public_ip
      timeout = "1m"
    } 
  }
}


variable "hostname" {
  type = list(string)
  default = [ "master-node","worker-node01","worker-node02" ]
}

variable "ami" {
  type = string
  default = "ami-0522ab6e1ddcc7055"
}

variable "instance_type" {
  type = string
  default = "t2.small"
}

variable "Name" {
  type = list(string)
  default = [ "master-node","worker-node01","worker-node02" ]
}

variable "availability_zone" {
   type = list(string)
   default = [ "ap-south-1a","ap-south-1b", ]
}