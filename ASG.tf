# Auto Scaling Group
resource "aws_autoscaling_group" "ec2_asg" {
  name                = "yt-web-server-asg"
  desired_capacity    = 2
  min_size            = 2
  max_size            = 3
  target_group_arns   = [aws_lb_target_group.alb_ec2_tg.arn]
  vpc_zone_identifier = aws_subnet.private_subnet[*].id

  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }

  health_check_type = "EC2"
}



resource "aws_autoscaling_group" "ec2_asg_priv" {
  name                = "yt-web-server-asg2"
  desired_capacity    = 2
  min_size            = 2
  max_size            = 3
  target_group_arns   = [aws_lb_target_group.alb_ec2_tg_priv.arn]
  vpc_zone_identifier = aws_subnet.private_subnet2[*].id

  launch_template {
    id      = aws_launch_template.ec2_priv_launch_template.id
    version = "$Latest"
  }

  health_check_type = "EC2"
}

