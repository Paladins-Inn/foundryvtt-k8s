apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    argocd.argoproj.io/tracking-id: fvtt-klenkes74:networking.k8s.io/Ingress:fvtt-tables/klenkes74
    cert-manager.io/cluster-issuer: letsencrypt-prod
    cert-manager.io/common-name: fvtt.lichti.de
    cert-manager.io/duration: 2160h0m0s
    cert-manager.io/renew-before: 1800h0m0s
  labels:
    app.kubernetes.io/instance: fvtt-klenkes74
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: foundry-vtt
    helm.sh/chart: foundry-vtt-2.0.0
  name: klenkes74
  namespace: fvtt-tables
spec:
  ingressClassName: nginx
  rules:
    - host: fvtt.lichti.de
      http:
        paths:
          - backend:
              service:
                name: klenkes74
                port:
                  name: http
            path: "/"
            pathType: Prefix
  tls:
    - hosts:
        - fvtt.lichti.de
      secretName: klenkes74-tls
