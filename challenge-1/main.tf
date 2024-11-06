resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name  = "simple-webapp"
    }
  }

  spec {
    replicas = 4

    selector {
      match_labels = {
        name  = "simple-webapp"
      }
    }

    template {
      metadata {
        labels = {
          name  = "simple-webapp"
        }
      }

      spec {
        container {
          image = "kodekloud/webapp-color:v1"
          name  = "simple-webapp"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}