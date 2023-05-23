# Mengunduh atau mengambil base image bernama node dari Docker Hub dengan tag 14.21.3-alpine
FROM node:14.21.3-alpine

# Membuat direktori baru bernama app di dalam container dan menjadikannya sebagai direktori kerja
WORKDIR /app

# Menyalin semua berkas yang ada di direktori kerja saat ini ke direktori kerja pada container
COPY . .

# Mengatur dua environment variable yaitu:
# a. NODE_ENV digunakan agar aplikasi berjalan pada mode production.
# b. DB_HOST digunakan agar aplikasi menggunakan container bernama item-db sebagai database host.
ENV NODE_ENV=production DB_HOST=item-db

# Menginstalasi ketergantungan atau dependencies untuk production
# dan selanjutnya melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos atau membuka port pada container yang digunakan oleh aplikasi yaitu 8080
EXPOSE 8080

# Mengeksekusi perintah saat Docker image telah dijalankan sebagai container yaitu npm start
CMD ["npm", "start"]