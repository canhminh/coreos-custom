# Build CoreOS Custom

## Build the image

podman build -t coreos-custom .

## Tag it for your registry

podman tag coreos-custom:latest ghcr.io/canhminh/coreos-custom:latest

## Log in to your registry

podman login ghcr.io

## Push the image

podman push ghcr.io/canhminh/my-coreos-custom:latest

podman run --interactive --rm quay.io/coreos/butane:release \
       --pretty --strict < coreos.bu > coreos.ign
