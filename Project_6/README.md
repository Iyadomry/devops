## deploy Prometheus chart in kubernetes to monitor the cluster using helm 
- create name space 
    kubectl create ns monitoring
- create value.yml file and add the following as base config

    prometheus:
    prometheusSpec:
        serviceMonitorSelectorNilUsesHelmValues: false

    grafana:
    adminUser: "admin"
    adminPassword: "password"

- create Prometheus deployment 
    helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --values values.yaml