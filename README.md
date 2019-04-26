# Installation using Helm

Please follow the installation instructions from [istio.io](https://istio.io/docs/setup/kubernetes/helm-install.html).

## if not install helm and tiller, you must install them

Get new release [helm](https://github.com/helm/helm/releases) on github. 


```bash
  wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz 
  tar xf helm-v2.13.1-linux-amd64.tar.gz 
  cp helm /usr/local/bin 
  kubectl create -f istio-chart/helm-service-account.yaml 
  helm init --service-account tiller
```
you can use RBAC control helm's servcie account and use tls in helm with tiller, [helm-tls](https://helm.sh/docs/using_helm/#using-ssl-between-helm-and-tiller).

Create a istio use this chart,follow steps:

## First:

  create secret for kiali  that use to login kiali web ui

```bash
  cd istio-chart
  chmod +x kiali-sercret-generate.sh
  ./kiali-sercret-generate.sh
```
According to the prompt, input your username and password for kiali.

## Second:

  there use my define values file in istio-cahrt whict name is values-with-plugins.yaml, or you can use youself

```bash
  kubectl create namespace istio-system
  helm install istio-chart/istio-init --tiller-namespace [namespace] -n istio-init --namespace istio-system -f istio-chart/istio-init/values.yaml -f istio-chart/istio-init_values-cert.yaml
  helm install istio-chart/istio --tiller-namespace [namespce] -n istio --namespace istio-system -f istio-chart/istio/values.yaml -f istio-cahrt/istio_values-with-plugins.yaml
```

## Thrid:

   expose grafana、prometheus、jager、kiali if do not use ingress, because we use [kong-ingress-controlor](https://github.com/cuishuaigit/k8s-kong) or you have another 
   ingress-controlor,you won't execute this step.

   ```bash
   kubectl apply -f istio-chart/expose-without-ingress

   ```
## visit grafana、prometheus、jager、kiali
   *.k8s.qing.com is your ingress controlor domain.

  grafana: http://grafana.k8s.qing.com

  prometheus: http://prometheus.k8s.qing.com 

  jager: http://tracing.k8s.qing.com

  kiali: http://kiali.k8s.qing.com
