resource "aws_launch_template" "tomcat_lt" {
  name_prefix          = "tomcat-lt"
  image_id             = "ami-0f5ee92e2d63afc18"
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_group_names = [aws_security_group.tomcat_sg.name]

  user_data = base64encode(<<EOF
#!/bin/bash
yum install -y java-11-openjdk tomcat
systemctl start tomcat
systemctl enable tomcat
EOF
  )
}

resource "aws_autoscaling_group" "tomcat_asg" {
  desired_capacity = 2
  max_size         = 4
  min_size         = 2

  vpc_zone_identifier = [
    aws_subnet.backend_private_1.id,
    aws_subnet.backend_private_2.id
  ]

  launch_template {
    id      = aws_launch_template.tomcat_lt.id
    version = "$Latest"
  }
}
