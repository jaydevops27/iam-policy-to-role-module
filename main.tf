resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for idx, policy_arn in var.policy_arns : idx => policy_arn }
  role       = data.aws_iam_role.this.name
  policy_arn = each.value
}
