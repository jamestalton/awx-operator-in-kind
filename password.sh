#!/usr/bin/env bash
PASSWORD=`kubectl get secret -n awx awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode`
echo Password: $PASSWORD