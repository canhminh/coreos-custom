# Start from the official Fedora CoreOS image
FROM quay.io/fedora/fedora-coreos:stable

COPY veracrypt-fedora.rpm /tmp/veracrypt-fedora.rpm

# Install your packages.
# Add all your packages to a single RUN command.
RUN rpm-ostree install \
    nfs-utils \
    fuse-libs \
    qemu-guest-agent \
    /tmp/veracrypt-fedora.rpm \
    && \
    # This is a critical cleanup step
    rpm-ostree cleanup -m && \
    rm -f /tmp/veracrypt-fedora.rpm && \
    ostree container commit
    
