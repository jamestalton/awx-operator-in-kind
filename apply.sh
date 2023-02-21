#!/usr/bin/env bash

echo ===============================================================================
echo 2.Apply the awx-operator to the cluster
echo -------------------------------------------------------------------------------
kustomize build . | kubectl apply -f -
echo

echo ===============================================================================
echo 3. Wait for the awx-operator to become available
echo -------------------------------------------------------------------------------
kubectl wait deployment awx-operator-controller-manager -n awx --for condition=Available=True --timeout=300s
echo

echo ===============================================================================
echo 4. Apply an AWX resource so that the awx-operator will create an AWX deployment
echo -------------------------------------------------------------------------------
kubectl apply -f awx-demo.yaml
echo

echo ===============================================================================
echo 5. Wait for the AWX deployment to be created
echo -------------------------------------------------------------------------------
while : ; do
  kubectl get deployment awx-demo -n awx > /dev/null 2>&1 && break
  sleep 1
done
echo

echo ===============================================================================
echo 6. Wait for the AWX deployment to become available
echo -------------------------------------------------------------------------------
kubectl wait deployment -n awx awx-demo --for condition=Available=True --timeout=300s
echo

echo ===============================================================================
echo 7. Expose the AWX deployment on port 30000
echo -------------------------------------------------------------------------------
kubectl expose deployment -n awx awx-demo --type=LoadBalancer --port=30000
echo

echo ===============================================================================
echo 8. Wait for the AWX deployment to become available on port 30000
echo -------------------------------------------------------------------------------
while : ; do
  curl localhost:30000  > /dev/null 2>&1 && break
  sleep 1
done
echo

echo ===============================================================================
echo 9. Get the admin password for the AWX deployment
echo -------------------------------------------------------------------------------
PASSWORD=`kubectl get secret -n awx awx-demo-admin-password -o jsonpath="{.data.password}" | base64 --decode`
echo Password: $PASSWORD
echo

echo The AWX deployment should be available on http://localhost:30000
echo
