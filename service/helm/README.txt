Please select different values.yaml to deploy different test line.
one example to deploy dev env is listed below.
helm install devstack . -f values.yaml -f values-dev.yaml -n dev --create-namespace

