apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: grafana
  namespace: monitoring
  labels:
    k8s-app: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      k8s-app: grafana
  template:
    metadata:
      labels:
        k8s-app: grafana
    spec:
      containers:
      - envFrom:
        - secretRef:
            name: grafana-creds
        name: grafana
        image: dialogicbuzz/grafana-plugins:latest
        ports:
        - containerPort: 3000
          protocol: TCP
        volumeMounts:
        - mountPath: /etc/grafana/provisioning/datasources/influxdb-datasource.yaml
          name: grafana-config
          readOnly: true
          subPath: influxdb-datasource.yaml
        - mountPath: /etc/grafana/provisioning/dashboards/grafana-dashboard-provider.yaml
          name: grafana-config
          readOnly: true
          subPath: grafana-dashboard-provider.yaml
        - mountPath: /etc/grafana/provisioning/dashboards/system.json
          name: grafana-config
          readOnly: true
          subPath: system.json
        - mountPath: /etc/grafana/provisioning/dashboards/tenant.json
          name: grafana-config
          readOnly: true
          subPath: tenant.json
        - mountPath: /etc/grafana/provisioning/dashboards/subscriber.json
          name: grafana-config
          readOnly: true
          subPath: subscriber.json
      volumes:
      - configMap:
          name: grafana-config
        name: grafana-config
