#!/usr/bin/env bash
kubectl config set-context --current --namespace=awx
echo
echo -- Deployments --
kubectl get deployments
echo
echo -- Pods --
kubectl get pods
echo
echo -- Services --
kubectl get services
echo
echo -- AWX --
kubectl get AWX
echo
