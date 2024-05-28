resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = var.role_name
  policy_arn = each.value
  for_each   = { for idx, policy_arn in var.policy_arns : idx => policy_arn }
}

