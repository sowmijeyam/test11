provider "aws" {
  region = "ap-southeast-1"
  }
variable "acc_no" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_access_key" {
  type = string
}
resource "aws_iam_user" "sowmi"{
    name = "sowmi"
	}
resource "aws_iam_user" "subha"{
    name = "subha"
	}
resource "aws_iam_user" "saran"{
    name = "saran"
	}
resource "aws_iam_group" "cse"{
    name = "cse"
	}
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.sowmi.name,
    aws_iam_user.subha.name,
	aws_iam_user.saran.name
	
  ]

  group = aws_iam_group.cse.name
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.cse.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}