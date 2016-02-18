/* ecs iam role and policies */
resource "aws_iam_role" "lambda_docker_not_alive" {
  name               = "lambda_docker_not_alive"
  assume_role_policy = "${template_file.lambda_role.rendered}"
}

resource "aws_iam_role_policy" "lambda_docker_not_alive_policy" {
  name     = "lambda_docker_not_alive_policy"
  policy   = "${template_file.lambda_role_policy.rendered}"
  role     = "${aws_iam_role.lambda_docker_not_alive.id}"
}

/** TEMPLATES */
resource "template_file" "lambda_role" {
  template = "${file("${path.module}/templates/lambda_role.tpl")}"
}
resource "template_file" "lambda_role_policy" {
  template = "${file("${path.module}/templates/lambda_role_policy.tpl")}"
}