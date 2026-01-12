resource "aws_launch_template" "nginx_lt" {
  name_prefix          = "nginx-lt"
  image_id             = "ami-0f5ee92e2d63afc18" # Amazon Linux 2
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_group_names = [aws_security_group.nginx_sg.name]

  user_data = base64encode(<<EOF
#!/bin/bash
yum install -y nginx
systemctl start nginx
systemctl enable nginx
EOF
  )
}

resource "aws_autoscaling_group" "nginx_asg" {
  desired_capacity = 2
  max_size         = 4
  min_size         = 2

  vpc_zone_identifier = [
    aws_subnet.frontend_public_1.id,
    aws_subnet.frontend_public_2.id
  ]

  launch_template {
    id      = aws_launch_template.nginx_lt.id
    version = "$Latest"
  }
}
