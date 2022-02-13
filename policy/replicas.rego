package main

deny_replicas[msg] {
    input.kind == "Deployment"                          # If it is a Deployment
    input.spec.replicas < 2                             # And the replicas are < 2
    msg := "Deployments must have 2 or more replicas"   # Set the return variable to the error message and fail the test
}
