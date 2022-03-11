resource "aws_lightsail_instance" "vps_instance" {
  name              = "p6_instance"
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "small_2_0"
}

resource "aws_lightsail_instance_public_ports" "https" {
  instance_name = aws_lightsail_instance.vps_instance.name

  # ssh
  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  # https
  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }

  # https
  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = var.root_domain
}

resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
  static_ip_name = aws_lightsail_static_ip.static_ip.id
  instance_name  = aws_lightsail_instance.vps_instance.id
}
