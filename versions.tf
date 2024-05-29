terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
    cilium = {
      source  = "littlejo/cilium"
      version = "~> 0.2.0"
    }
  }
}

provider "kind" {}

provider "cilium" {
  config_path = kind_cluster.this.kubeconfig_path
}
