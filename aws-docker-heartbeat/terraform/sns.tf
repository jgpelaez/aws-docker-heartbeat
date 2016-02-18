resource "aws_sns_topic" "docker_not_alive_in_instance" {
  name = "docker_not_alive_in_instance3"
}


resource "aws_sns_topic_subscription" "docker_not_alive_in_instance-lambda" {
    depends_on = ["aws_lambda_function.docker_not_alive_in_instance"]
    topic_arn = "${aws_sns_topic.docker_not_alive_in_instance.arn}"
    protocol = "lambda"
    endpoint = "${aws_lambda_function.docker_not_alive_in_instance.arn}"

}
/* */