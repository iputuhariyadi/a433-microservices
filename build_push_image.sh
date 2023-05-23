#!/bin/bash

# Membuat Docker image dari Dockerfile yang terdapat di direktori kerja saat ini
# dengan nama item-app dan memiliki tag v1
docker build -t item-app:v1 .

# Menampilkan informasi daftar Docker image yang tersedia di lokal
docker images

# Mengubah nama image item-app:v1 ke format GitHub Packages
docker tag item-app:v1 ghcr.io/iputuhariyadi/item-app:v1

# Melakukan otentikasi login ke GitHub Packages menggunakan username iputuhariyadi
# dan password yang diambil dari environment variable bernama PASSWORD_GITHUB_PACKAGES
echo $PASSWORD_GITHUB_PACKAGES | docker login ghcr.io -u iputuhariyadi --password-stdin

# Mengunggah image ke GitHub Packages
docker push ghcr.io/iputuhariyadi/item-app:v1