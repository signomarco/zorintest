# Builder
FROM python:3.11 as builder
COPY ./doc-custom-app /app
WORKDIR /app
RUN pip install -r requirements.txt && mkdocs build

# Production
FROM nginx:1.21.3-alpine
COPY --from=builder /app/site /usr/share/nginx/html
EXPOSE 80

