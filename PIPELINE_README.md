# 🚀 Pipeline de Despliegue Automático

Este repositorio incluye un pipeline de CI/CD completamente configurado que despliega automáticamente tu aplicación a AWS ECS.

## ⚡ Inicio Rápido

### 1. Configurar Secrets en GitHub (⚠️ REQUERIDO)

Ve a tu repositorio en GitHub → **Settings** → **Secrets and variables** → **Actions** y crea estos secrets:

- `AWS_ACCESS_KEY_ID`: Tu clave de acceso de AWS
- `AWS_SECRET_ACCESS_KEY`: Tu clave secreta de AWS

### 2. ¡Hacer Push y Ver la Magia! ✨

```bash
# Cualquier cambio en estos archivos disparará el pipeline automáticamente:
git add .
git commit -m "Update application"
git push origin main
```

### 3. Monitorear el Despliegue

1. Ve a la pestaña **Actions** en GitHub
2. Observa el progreso del despliegue en tiempo real
3. Una vez completado, tu aplicación estará disponible en:
   ```
   http://AWS-test-ce-ALB-1499504438.us-east-1.elb.amazonaws.com
   ```

## 🎯 ¿Qué hace el Pipeline?

1. **Build**: Construye la imagen Docker desde tu `Dockerfile`
2. **Push**: Sube la imagen a Amazon ECR
3. **Deploy**: Actualiza el servicio ECS con la nueva imagen
4. **Verify**: Espera a que el servicio esté funcionando correctamente

## 🧪 Probar Localmente

Antes de hacer push, puedes probar tu aplicación localmente:

```bash
./test-local.sh
# Luego ve a http://localhost:8080
```

## 📁 Estructura del Proyecto

```
├── Dockerfile                     # Configuración de la imagen
├── public-html/                   # Tu aplicación web
│   └── index.html
├── .github/workflows/deploy.yml   # Pipeline de GitHub Actions
└── PIPELINE_SETUP.md             # Documentación completa
```

## 🔄 Triggers del Pipeline

El pipeline se ejecuta automáticamente cuando:
- ✅ Haces push a `main`
- ✅ Cambias `Dockerfile` o archivos en `public-html/`
- ✅ Lo ejecutas manualmente desde GitHub Actions

## ⚙️ Configuración Actual

- **📦 ECR Repository**: `amrize-ecr-repo`
- **🏗️ ECS Cluster**: `amrize-ecs-cluster`
- **🔄 ECS Service**: `apache-service`
- **🌍 Load Balancer**: Application Load Balancer configurado

## 📖 Documentación Completa

Para configuración avanzada y troubleshooting, consulta: [PIPELINE_SETUP.md](./PIPELINE_SETUP.md)

---

**¿Listo para desplegar?** Solo haz push a `main` y el pipeline hará el resto! 🚀
