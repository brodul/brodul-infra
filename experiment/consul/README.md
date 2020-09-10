# Consul GKE experiment

Execution of docs https://learn.hashicorp.com/tutorials/consul/kubernetes-gke-google .

TODO:

- 1.5x this video https://www.youtube.com/watch?v=ly1eNhrm8i4 - Consul: Service Mesh for Kubernetes and Beyond
- I don't really know if consul service discovery is used.
- Need to explore ACl on services
- Need to explore prometheus integration


## Deploy

TF takes about 10 to 15mins to deploy.

- `terragrunt plan`
- `terragrunt apply`
- `helm repo add hashicorp https://helm.releases.hashicorp.com`
- `gcloud container clusters get-credentials consul-experiment --zone europe-west1-b --project brodul-infra`
- `helm install -f helm-consul-values.yaml hashicorp hashicorp/consul`

## Client configuration

- `CONSUL_HTTP_ADDR=http://<LB_SERVICE_PUBLIC_IP>:80 consul members`

## Clean up

5 mins to destroy.

- `terragrunt destroy`
- `kubectx -d gke_brodul-infra_europe-west1_consul-experiment`
