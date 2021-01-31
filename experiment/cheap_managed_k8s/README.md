# Consul GKE experiment

- https://stackoverflow.com/questions/54119399/expose-port-80-on-digital-oceans-managed-kubernetes-without-a-load-balancer/55968709#55968709
- https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

TODO:




## Deploy

TF takes about 10 to 15mins to deploy.

- `terragrunt plan`
- `terragrunt apply`
- `helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
- `helm repo update`
- Download kubeconfig.yaml and do an `export KUBECONFIG=~/Downloads/experiment-cluster-kubeconfig.yaml`
- `helm install nginx-ingress ingress-nginx/ingress-nginx -f nginx-ingress.values.yaml`
- Browse `<ip_of_the_node>.xip.io` (you should get an nginx 404)

ACME

- https://cert-manager.io/docs/installation/kubernetes/#installing-with-helm
- https://cert-manager.io/docs/configuration/acme/

## Client configuration

## Clean up

5 mins to destroy.

- `terragrunt destroy`
- `kubectx -d gke_brodul-infra_europe-west1_consul-experiment`
