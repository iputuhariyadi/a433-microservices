#!/bin/bash

# Membuat Docker image dari Dockerfile yang terdapat di direktori kerja saat ini
# dengan format penamaan GitHub Packages
# shipping-service dan memiliki tag latest
docker build -t ghcr.io/iputuhariyadi/shipping-service:latest .

# Melakukan otentikasi login ke GitHub Packages menggunakan username iputuhariyadi
# dan password yang diambil dari environment variable bernama PASSWORD_GITHUB_PACKAGES
echo $PASSWORD_GITHUB_PACKAGES | docker login ghcr.io -u iputuhariyadi --password-stdin

# Mengunggah image ke GitHub Packages
docker push ghcr.io/iputuhariyadi/shipping-service:latest