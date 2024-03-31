terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }

  required_providers {
    rke = {
      source  = "rancher/rke"
      version = "1.4.4"
    }
  }
}

provider "rke" {
  debug = false
}


resource "rke_cluster" "cluster" {
  nodes {
    address = "0.0.0.0"
    user    = "adminuser"
    role    = ["controlplane", "worker", "etcd"]
    ssh_key = file("~/.ssh/id_rsa")
  }
  nodes {
    address = "0.0.0.0"
    user    = "adminuser"
    role    = ["controlplane", "worker", "etcd"]
    ssh_key = file("~/.ssh/id_rsa")
  }
  upgrade_strategy {
    drain                  = true
    max_unavailable_worker = "20%"
  }

  enable_cri_dockerd = true
}