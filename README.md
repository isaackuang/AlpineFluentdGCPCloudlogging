#Alpine Fluentd GCP cloudlogging

## Environment Variables

`GOOGLE_APPLICATION_CREDENTIALS` = google credentials path

## k8s daemonset example

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: logger
  labels:
    app: logger
spec:
  selector:
    matchLabels:
      app: logger
  template:
    metadata:
      labels:
        app: logger
    spec:
      containers:
      - name: logger
        image: isaackuang/fluentd-gcp-cloudlogging
        ports:
        - containerPort: 24224
        env:
        - name: TZ
          value: UTC
        - name: GOOGLE_APPLICATION_CREDENTIALS
          value: /etc/sysconfig/logger-key.json
        resources:
            requests:
                memory: "256Mi"
                cpu: "200m"
            limits:
                memory: "512Mi"
                cpu: "200m"
        volumeMounts:
        - name: configs
          mountPath: /etc/sysconfig
      volumes:
      - name: configs
        configMap:
          name: logger-config
```
