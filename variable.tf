variable "name" {
  description = "Name of the Helm release"
}
variable "namespace" {
  description = "Name of the namespace to create"
}
variable "edition" {
  description = "Edition of Gitlab to deploy, ce or ee"
}
variable "certmanager_issuer_email" {
  description = "Email to be used for cert-manager issuer configuration"
}
variable "helm_values" {
  description = "Values file to use in the helm release"
}
variable "chart_version" {
  description = "Version of the chart to use in the helm release"
}
variable "postgres_password" {
  description = "Random generated password for postgres"
}