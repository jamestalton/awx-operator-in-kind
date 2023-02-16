# AWX Operator in KIND

Scripts to start the awx-operator in a KIND (Kubernetes in Docker) cluster.

| Script        | Description                                                      |
| ------------- | ---------------------------------------------------------------- |
| ./create.sh   | Create a kind cluster, deploy awx-operator, deploy awx instance. |
| ./delete.sh   | Delete the current kind cluster.                                 |
| ./password.sh | Show the admin password for the AWX deployment.                  |

## Create

```bash
./create.sh
```

This will

1. Create kind cluster
2. Apply the awx-operator to the cluster
3. Wait for the awx-operator to become available
4. Apply an AWX resource so that the awx-operator will create an AWX deployment
5. Wait for the awx deployment to be created
6. Wait for the awx deployment to become available
7. Expose the awx deployment on port 30000
8. Wait for the awx deployment to become available on port 30000
9. Get the admin password for the awx deployment

The AWX deployment should be available on <http://localhost:30000>

## Delete

To delete the cluster run

```bash
kind delete cluster
```
