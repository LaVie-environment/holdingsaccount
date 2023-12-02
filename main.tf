locals {
  nonproduction_folder = var.nonproduction_folder_name
}
 "aws_folder" "production" {
  folder = var.production_folder_name
}

data "aws_folder" "nonproduction" {
  folder = var.nonproduction_folder_name
}

data "aws_folder" "development" {
  folder = var.development_folder_name
}

resource "aws_folder" "production" {
  name       = "${var.team_name}Production"
  project_id = "${var.project_prefix}-${var.team_name}-prod"
  folder_id  = data.aws_folder.production.name
}

resource "aws_folder" "preproduction" {
  name       = "${var.team_name}PreProduction"
  project_id = "${var.project_prefix}-${var.team_name}-preprod"
  folder_id  = data.aws_folder.nonproduction.name
}

resource "aws_folder" "development" {
  name       = "${var.team_name}Development"
  project_id = "${var.project_prefix}-${var.team_name}-dev"
  folder_id  = data.aws_folder.development.name
}

resource "aws_folder" "shared" {
  name       = "${var.team_name}Shared"
  project_id = "${var.project_prefix}-${var.team_name}-shared"
  folder_id  = data.aws_folder.production.name
}
