#!/usr/bin/env bash
kubectl logs -f deployments/awx-operator-controller-manager -c awx-manager --follow=false