resource "kind_cluster" "this" {
  name = "test-cluster"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role = "worker"
    }

    networking {
      disable_default_cni = true
    }
  }
}

resource "cilium" "this" {
  helm_set = [
    "ipam.mode=kubernetes",
    "operator.replicas=1",
    "tunnel=vxlan",
  ]
  version = "1.14.4"
}
