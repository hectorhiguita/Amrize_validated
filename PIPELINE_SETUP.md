# Configuración del Pipeline CI/CD

Este documento explica cómo configurar el pipeline de GitHub Actions para desplegar automáticamente la aplicación en AWS ECS.

## 🔧 Configuración de Secrets en GitHub

Para que el pipeline funcione, necesitas configurar los siguientes secrets en tu repositorio de GitHub:

### 1. Navegar a la configuración de secrets

1. Ve a tu repositorio en GitHub: `https://github.com/hectorhiguita/Amrize_validated`
2. Haz clic en **Settings** (Configuración)
3. En el menú lateral, haz clic en **Secrets and variables** → **Actions**
4. Haz clic en **New repository secret**

### 2. Crear los siguientes secrets:

#### `AWS_ACCESS_KEY_ID`
- **Descripción**: ID de la clave de acceso de AWS
- **Valor**: Tu AWS Access Key ID
- **Cómo obtenerlo**: 
  ```bash
  aws configure list
  # O crear uno nuevo en AWS IAM
  ```

#### `AWS_SECRET_ACCESS_KEY`
- **Descripción**: Clave secreta de acceso de AWS
- **Valor**: Tu AWS Secret Access Key
- **Cómo obtenerlo**: 
  ```bash
  # Se obtiene junto con el Access Key ID en AWS IAM
  ```

### 3. Permisos necesarios para el usuario IAM

El usuario IAM debe tener los siguientes permisos:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:DescribeRepositories",
                "ecr:DescribeImages",
                "ecr:BatchDeleteImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:PutImage"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecs:DescribeTaskDefinition",
                "ecs:DescribeServices",
                "ecs:DescribeClusters",
                "ecs:UpdateService",
                "ecs:RegisterTaskDefinition"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:PassRole"
            ],
            "Resource": [
                "arn:aws:iam::506847187721:role/amrize-ecs-cluster-execution-role",
                "arn:aws:iam::506847187721:role/amrize-ecs-cluster-task-role"
            ]
        }
    ]
}
```

## 🚀 Cómo funciona el Pipeline

### Triggers (Disparadores)
El pipeline se ejecuta automáticamente cuando:
- Haces push a la rama `main`
- Cambias archivos en: `Dockerfile`, `public-html/**`, o el workflow
- Creas un Pull Request a `main`
- Lo ejecutas manualmente desde GitHub Actions

### Pasos del Pipeline

1. **Checkout del código**: Descarga el código del repositorio
2. **Configuración de AWS**: Configura las credenciales de AWS
3. **Login a ECR**: Se autentica con Amazon Elastic Container Registry
4. **Build de la imagen**: Construye la imagen Docker usando el Dockerfile
5. **Push a ECR**: Sube la imagen al registro ECR
6. **Actualización de ECS**: Actualiza el servicio ECS con la nueva imagen
7. **Verificación**: Espera a que el servicio esté estable

### Variables de entorno configuradas

```yaml
AWS_REGION: us-east-1
ECR_REPOSITORY: amrize-ecr-repo
ECS_SERVICE: apache-service
ECS_CLUSTER: amrize-ecs-cluster
ECS_TASK_DEFINITION: apache-task
CONTAINER_NAME: apache
```

## 📋 Checklist de configuración

- [ ] Secrets de AWS configurados en GitHub
- [ ] Usuario IAM con permisos adecuados
- [ ] ECR Repository existente: `amrize-ecr-repo`
- [ ] ECS Cluster activo: `amrize-ecs-cluster`
- [ ] ECS Service funcionando: `apache-service`
- [ ] Task Definition creada: `apache-task`

## 🔍 Verificación del despliegue

### Desde AWS Console
1. **ECR**: Verifica que la nueva imagen se subió correctamente
2. **ECS**: Revisa que el service se actualizó con la nueva task definition
3. **Load Balancer**: Accede a la URL para ver la aplicación funcionando

### URL de la aplicación
```
http://AWS-test-ce-ALB-1499504438.us-east-1.elb.amazonaws.com
```

### Desde línea de comandos
```bash
# Verificar imágenes en ECR
aws ecr describe-images --repository-name amrize-ecr-repo --region us-east-1

# Verificar servicio ECS
aws ecs describe-services --cluster amrize-ecs-cluster --services apache-service --region us-east-1

# Verificar task definition
aws ecs describe-task-definition --task-definition apache-task --region us-east-1
```

## 🛠️ Troubleshooting

### Error de permisos
- Verifica que los secrets estén configurados correctamente
- Revisa que el usuario IAM tenga todos los permisos necesarios

### Error de build
- Verifica que el Dockerfile sea válido
- Revisa que la carpeta `public-html` contenga los archivos necesarios

### Error de despliegue
- Verifica que el cluster ECS esté activo
- Revisa que el service `apache-service` exista y esté funcionando

## 📝 Logs del Pipeline

Para ver los logs del pipeline:
1. Ve a tu repositorio en GitHub
2. Haz clic en la pestaña **Actions**
3. Selecciona la ejecución del workflow
4. Revisa los logs de cada step para diagnosticar problemas
