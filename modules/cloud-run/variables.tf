variable "service_list" {
  type        = list(string)
  description = "Name the cloud run service "
  default     = ["drl-dashboard", "drl-backend"]
}

variable "image_list" {
  type        = list(string)
  description = "Provide default docker images for Dashboard & backend"
  default = [
    "us-east1-docker.pkg.dev/drl-simulator-prod/drl-dashboard/dl-dashboard:1edbeb8abd282f720a21156b9556248fb918b861",
    "us-east1-docker.pkg.dev/drl-simulator-prod/drl-backend/drl-backend:f0cd2bef4479523fa61d6428acb43d42f4591e45"
  ] # Index[0] contains image for Dashboard app & Index[1] contains image for Backend app
}
variable "project_region" {
  type        = string
  description = "Project Region for resources"
  default     = "us-east1"
}
variable "psql_connection_name" {
  type        = string
  description = "Connection name for SQL"
  default     = ""
}

variable "vpc_connector_name" {
  type        = string
  description = "Serverless VPC Connector name"
  default     = ""
}

variable "env-vars" {
  type        = list(map(string))
  description = "List of all env-vars to be pass into cloud run"
  default = [
    {
      "AWS_REGION"                    = "us-east-1",
      "MAILER_DEFAULT_URL"            = "dashboard-dev.drlgame.com",
      "MAILGUN_SMTP_PORT"             = "587",
      "MAILGUN_SMTP_SERVER"           = "smtp.mailgun.org",
      "POSTGRES_PORT"                 = "5432",
      "RACK_ENV"                      = "production",
      "RAILS_ENV"                     = "production",
      "RAILS_LOG_TO_STDOUT"           = "enabled",
      "RAILS_SERVE_STATIC_FILES"      = "enabled",
      "S3_BUCKET"                     = "drl-game-dashboard",
      "STREAK_CHECK_FREQUENCY"        = "30.minutes",
      "WEB_CONCURRENCY"               = "2",
      "XP_RANKING_DEMOTION_POSITION"  = "2",
      "XP_RANKING_PROMOTION_POSITION" = "1"
    }, # Index[0] contains env-vars for Dashboard app
    {
      "AWS_REGION"                    = "us-east-1",
      "CRONTAB_XP_RANKING_INTERVAL"   = "*/15 * * * *",
      "NEW_RELIC_LOG"                 = "stdout",
      "NEW_RELIC_NO_CONFIG_FILE"      = "TRUE",
      "NODE_ENV"                      = "production",
      "NODE_MODULES_CACHE"            = "FALSE",
      "NPM_CONFIG_PRODUCTION"         = "TRUE",
      "PING_INTERVAL"                 = "25000",
      "PING_TIMEOUT"                  = "5000",
      "PROFANITY_FILTER_WHITELIST"    = "spac",
      "RAILS_LOG_TO_STDOUT"           = "enabled",
      "RAILS_SERVE_STATIC_FILES"      = "enabled",
      "STREAK_CHECK_FREQUENCY"        = "30.minutes",
      "STREAK_POINTS_INTERVAL"        = "*/10 * * * *",
      "TITLE_ID"                      = "3BD5",
      "URL"                           = "https://api-dev.drlgame.com",
      "WEB_CONCURRENCY"               = "10",
      "XP_RANKING_DEMOTION_POSITION"  = "2",
      "XP_RANKING_PROMOTION_POSITION" = "1"
    } # Index[1] contains env-vars for Backend app
  ]
}

variable "env-secret" {
  type = list(list(string))
  default = [
    [
      "AWS_ACCESS_KEY",
      "AWS_SECRET_KEY",
      "MAILGUN_DOMAIN",
      "MAILGUN_PUBLIC_KEY",
      "MAILGUN_SMTP_LOGIN",
      "MAILGUN_SMTP_PASSWORD",
      "MONGODB_URI",
      "MONGODB_URI_OPOSITE_BRANCH",
      "POSTGRES_HOST",
      "POSTGRES_PASSWORD",
      "POSTGRES_USERNAME",
      "REDIS_URL",
      "SECRET_KEY_BASE",
      "STEAM_APP_ID",
      "STEAM_WEB_API"
    ], # Index[0] contains secret name for Dashboard app
    [
      "AWS_ACCESS_KEY",
      "AWS_SECRET_KEY",
      "GEOIP_LICENSE_KEY",
      "MONGODB_URI",
      "NEW_RELIC_APP_NAME",
      "NEW_RELIC_LICENSE_KEY",
      "POSTGRES_HOST",
      "POSTGRES_USERNAME",
      "REDIS_URL",
      "S3_BUCKET",
      "SECRET_KEY_BASE",
      "STEAM_APP_ID",
      "STEAM_WEB_API"
    ] # Index[1] contains secret name for Backend app
  ]
}