package main

import data.kubernetes

deny[msg] {
    input.kind == "Deployment"
    some i
    image := input.spec.template.spec.containers[i].image
    not startswith(image, "myacr.azurecr.io")
    msg := sprintf("image '%v' comes from untrusted registry", [image])
}
