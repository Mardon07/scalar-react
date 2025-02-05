# Используем официальный образ Node.js
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package.json package-lock.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем весь проект
COPY . .

# Собираем Vite-проект
RUN npm run build

# Открываем порт для Vite-сервера
EXPOSE 4173

# Запускаем Vite в preview-режиме
# CMD ["npm", "run", "preview"]
CMD ["npm", "run", "preview", "--", "--host"]
