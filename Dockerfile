# Mengunduh atau mengambil base image bernama node dari Docker Hub dengan tag 14.21-alpine
FROM node:14.21-alpine

# Membuat direktori baru bernama app di dalam container dan menjadikannya sebagai direktori kerja
WORKDIR /app

# Menyalin berkas package.json dan package-lock.json ke direktori kerja saat ini yaitu "/app"
COPY package*.json ./

# Mengatur environment variable NODE_ENV digunakan agar aplikasi berjalan pada mode production.
ENV NODE_ENV=production

# Menginstalasi ketergantungan atau dependencies untuk production 
# dan selanjutnya melakukan build aplikasi
RUN npm install --production --unsafe-perm

# Menyalin semua berkas yang ada di direktori kerja saat ini ke direktori kerja pada container
COPY . .

# Mengekspos atau membuka port pada container yang digunakan oleh aplikasi yaitu 3001
EXPOSE 3000

# Mengeksekusi perintah saat Docker image telah dijalankan sebagai container yaitu npm start
CMD ["npm", "start"]
