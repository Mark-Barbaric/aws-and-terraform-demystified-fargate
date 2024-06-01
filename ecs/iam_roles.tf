resource "aws_iam_role" "ecs_task_execution_role" {
  name                              = "ecs_task_execution_role_${var.name}_${var.environment}"

  assume_role_policy                = <<POLICY
                                    {
                                      "Version": "2012-10-17",
                                      "Statement": [
                                        {
                                          "Sid": "",
                                          "Effect": "Allow",
                                          "Principal": {
                                            "Service": "ecs-tasks.amazonaws.com"
                                          },
                                          "Action": "sts:AssumeRole"
                                        }
                                      ]
                                    }
                                    POLICY
}