# Use uma imagem Python oficial como base
FROM python:3.13.5-alpine3.22

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo de requisitos primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instalar as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código da aplicação para o container
COPY . .

# Expor a porta que a aplicação irá usar
EXPOSE 8000

# Comando para executar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]