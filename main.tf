resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for idx, policy_arn in var.policy_arns : idx => policy_arn }
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

// Removed the duplicate output definitions from here
