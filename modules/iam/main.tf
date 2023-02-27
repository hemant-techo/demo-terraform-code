resource "google_project_iam_member" "abhishek-roles" {
  for_each = toset([
    "roles/compute.networkAdmin",
    "roles/editor",
    "roles/iam.securityAdmin",
    "roles/iap.admin",
    "roles/secretmanager.admin",
    "roles/source.admin"
  ])
  role    = each.key
  member  = "user:abhishek.kumar@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "andrew-roles" {
  for_each = toset([
    "roles/owner"
  ])
  role    = each.key
  member  = "user:andrew@droneracingleague.com"
  project = var.project_id
}

resource "google_project_iam_member" "andrey-roles" {
  for_each = toset([
    "roles/owner",
    "roles/source.admin"
  ])
  role    = each.key
  member  = "user:andrey@droneracingleague.com"
  project = var.project_id
}

resource "google_project_iam_member" "anit-roles" {
  for_each = toset([
    "roles/editor",
    "roles/iam.securityAdmin",
    "roles/source.admin"
  ])
  role    = each.key
  member  = "user:anit.sharma@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "charen-roles" {
  for_each = toset([
    "roles/editor"
  ])
  role    = each.key
  member  = "user:charen.kumar@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "dan-roles" {
  for_each = toset([
    "roles/billing.projectManager",
    "roles/compute.viewer",
    "roles/editor",
    "roles/vpcaccess.user"
  ])
  role    = each.key
  member  = "user:dan.niles@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "dwight-roles" {
  for_each = toset([
    "roles/editor",
    "roles/iam.securityAdmin",
    "roles/recommender.billingAccountCudAdmin",
    "roles/resourcemanager.projectOwnerInvitee",
    "roles/serviceusage.serviceUsageAdmin"
  ])
  role    = each.key
  member  = "user:dwight.spencer@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "hemant-roles" {
  for_each = toset([
    "roles/editor"
  ])
  role    = each.key
  member  = "user:hemant.sahu@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "mikita-roles" {
  for_each = toset([
    "roles/appengine.appCreator",
    "roles/editor",
    "roles/secretmanager.admin"
  ])
  role    = each.key
  member  = "user:mikita@droneracingleague.com"
  project = var.project_id
}

resource "google_project_iam_member" "shivanand-roles" {
  for_each = toset([
    "roles/compute.networkAdmin",
    "roles/compute.viewer",
    "roles/editor",
    "roles/recommender.billingAccountCudAdmin",
    "roles/secretmanager.secretAccessor",
    "roles/vpcaccess.user"
  ])
  role    = each.key
  member  = "user:shivanand.uppar@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "shreya-roles" {
  for_each = toset([
    "roles/editor"
  ])
  role    = each.key
  member  = "user:shreya.shetty@techolution.com"
  project = var.project_id
}

resource "google_project_iam_member" "travis-roles" {
  for_each = toset([
    "roles/owner"
  ])
  role    = each.key
  member  = "user:travissmith@droneracingleague.com"
  project = var.project_id
}