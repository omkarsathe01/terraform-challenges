resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name = "frontend"
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

resource "kubernetes_service" "webapp-service" {
  metadata {
    name = "webapp-service"
  }
  spec {
    selector = {
      name = kubernetes_deployment.frontend.metadata.0.labels.name
    }

    port {
      node_port   = 30080
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}