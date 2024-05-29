resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for idx, policy_arn in var.policy_arns : idx => policy_arn }
  role       = var.role_name
  policy_arn = each.value
}

// Removed output definitions from here
// output "role_name" {
//   description = "The name of the IAM role."
//   value       = var.role_name
// }

// output "role_arn" {
//   description = "The ARN of the IAM role."
//   value       = aws_iam_role_policy_attachment.this[0].role
// }
