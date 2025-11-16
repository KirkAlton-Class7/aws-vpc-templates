# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.private_client_asg.id
  lb_target_group_arn    = aws_lb_target_group.private_asg_tg.arn
}