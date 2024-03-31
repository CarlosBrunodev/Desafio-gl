terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
  }
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }

}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "cert_manager" {
  name = "cert-manager"

  repository       = "jetstack"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "v1.14.4"
}

resource "helm_release" "rancher" {
  name = "rancher"

  repository = "rancher-latest"
  chart      = "rancher"
  namespace  = "cattle-system"
  set {
    name  = "hostname"
    value = "rancher.my.org"
    type  = "string"
  }

  set {
    name  = "ingress.tls.source"
    value = "letsEncrypt"
    type  = "string"
  }

  set {
    name  = "letsEncrypt.email"
    value = "me@example.org"
    type  = "string"
  }
  values = [
    "${file("values.yaml")}"
  ]
}

resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stack"
  namespace  = "monitoring"
  version    = "v57.1.1"
  repository = "prometheus-community"
  chart      = "kube-prometheus-stack"
}