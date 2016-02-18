resource "aws_lambda_function" "docker_not_alive_in_instance" {
    filename = "${path.module}/lambda/DockerNotAliveInInstance.lambda.zip"
    function_name = "DockerNotAliveInInstance3"
    role = "${aws_iam_role.lambda_docker_not_alive.arn}"
    handler = "index.handler"
}

/*
resource "aws_lambda_event_source_mapping" "docker_not_alive_in_instance" {
    event_source_arn = "${aws_sns_topic.docker_not_alive_in_instance.arn}"
    enabled = true
    function_name = "${aws_lambda_function.docker_not_alive_in_instance.function_name}"
    starting_position = "TRIM_HORIZON"
}
 */