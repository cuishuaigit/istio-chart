# Installation using Helm

Please follow the installation instructions from [istio.io](https://istio.io/docs/setup/kubernetes/helm-install.html).

Create a istio use this chart,follow steps:

First:
  create secret for kiali  that use to login kiali web ui

```bash
  cd istio-chart
  chmod +x kiali-sercret-generate.sh
  ./kiali-sercret-generate.sh
```
According to the prompt, input your username and password for kiali.

Second:
  there use my define values file in istio-cahrt whict name is values-with-plugins.yaml, or you can use youself

```bash
  kubectl create namespace istio-system
  helm install istio-chart/istio-init --tiller-namespace [namespace] -n istio-init --namespace istio-system -f istio-chart/istio-init/values-cert.yaml
  helm install istio-chart/istio --tiller-namespace [namespce] -n istio --namespace istio-system -f istio-cahrt/istio/values-with-plugins.yaml
```

Thrid:
   expose grafana、prometheus、jager、kiali 

   ```bash
   kubectl apply -f istio-chart/expose

   ```
## visit grafana、prometheus、jager、kiali

grafana: http://node-ip:30161
prometheus: http://node-ip:30971
jager: http://node-ip:32217
kiali: http://node-ip:31502/kiali
