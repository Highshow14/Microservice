provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "null_resource" "install_jenkins" {
  provisioner "local-exec" {
    command = "helm repo add jenkins https://charts.jenkins.io && helm repo update && helm install jenkins jenkins/jenkins"
  }
}

resource "null_resource" "install_argocd" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
      helm repo add argo https://argoproj.github.io/argo-helm
      helm repo update
      helm install argocd argo/argo-cd -n argocd
    EOT
  }
}
