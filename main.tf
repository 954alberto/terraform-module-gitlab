resource "kubernetes_namespace" "gitlab" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_secret" "gitlab_postgres" {
  depends_on = [kubernetes_namespace.gitlab]
  metadata {
    name      = "gitlab-postgres"
    namespace = var.namespace
  }

  data = {
    postgresql-postgres-password = var.postgres_password
    postgresql-password          = var.postgres_password
    psql-password                = var.postgres_password
  }

}

data "helm_repository" "gitlab" {
  name = "gitlab"
  url  = "https://charts.gitlab.io"
}

resource "helm_release" "gitlab" {
  depends_on = [kubernetes_secret.gitlab_postgres]
  namespace  = var.namespace
  name       = var.name
  chart      = "gitlab/gitlab"
  version    = var.chart_version
  values     = [var.helm_values]
  timeout    = 1200
}