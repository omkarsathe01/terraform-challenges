Welcome to the terraform challenge series.
In this challenge we will deploy several Kubernetes resources using terraform.

Terraform version: 1.1.5
provider: kubernetes
Provider version: 2.11.0
kubeconfig file: /root/.kube/config

Image: kodekloud/webapp-color:v1
Container name: simple-webapp
Container port: 8080

Service name: webapp-service
Service Type: NodePort
Port: 8080
NodePort: 30080