resource "aws_autoscaling_policy" "private_client_asg" {
  name                      = "private-client-asg-policy"
  autoscaling_group_name    = aws_autoscaling_group.private_client_asg.id
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 60


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}





#   target_tracking_configuration {
#     target_value = 100
#     customized_metric_specification {
#       metrics {
#         label = "Get the queue size (the number of messages waiting to be processed)"
#         id    = "m1"
#         metric_stat {
#           metric {
#             namespace   = "AWS/SQS"
#             metric_name = "ApproximateNumberOfMessagesVisible"
#             dimensions {
#               name  = "QueueName"
#               value = "my-queue"
#             }
#           }
#           stat   = "Sum"
#           period = 10
#         }
#         return_data = false
#       }
#       metrics {
#         label = "Get the group size (the number of InService instances)"
#         id    = "m2"
#         metric_stat {
#           metric {
#             namespace   = "AWS/AutoScaling"
#             metric_name = "GroupInServiceInstances"
#             dimensions {
#               name  = "AutoScalingGroupName"
#               value = "my-asg"
#             }
#           }
#           stat   = "Average"
#           period = 10
#         }
#         return_data = false
#       }
#       metrics {
#         label       = "Calculate the backlog per instance"
#         id          = "e1"
#         expression  = "m1 / m2"
#         return_data = true
#       }
#     }
#   }
# }