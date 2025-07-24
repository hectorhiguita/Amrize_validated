# Amrize Infrastructure Project

Este proyecto contiene la infraestructura como código (IaC) para el proyecto Amrize como prueba técnica de Alejandro Higuita, fue implementado usando módulos creados manualmente se Terraform en AWS y una pequeña imagen en apache con un texto plano en HTML para demostrar el sitio funcionando.

Por el momento se no se usaron buckets S3 para guardar el terraform state, sin embargo sí se ocultaron de commit para evitar filtraciones de información.

## Descripción

La infraestructura incluye:

- **VPC**: Red privada virtual con subnets públicas y privadas
- **ECS**: Cluster de contenedores para ejecutar aplicaciones
- **ECR**: Registro de contenedores de Docker
- **ALB**: Application Load Balancer para distribución de tráfico
- **IAM**: Roles y políticas para servicios de AWS

## Estructura del Proyecto

```
.
├── main.tf                    # Configuración principal
├── variables.tf               # Variables de entrada
├── outputs.tf                 # Valores de salida
├── terraform.tfvars          # Valores de las variables (no incluido en Git)
├── Dockerfile                # Imagen de contenedor Apache
└── Modules/
    ├── VPC/                  # Módulo de red
    ├── ECS/                  # Módulo de contenedores
    ├── ECR/                  # Módulo de registro
    └── APP_Load_Balancer/    # Módulo de load balancer
```

## Prerrequisitos

- Terraform >= 1.0
- AWS CLI configurado
- Credenciales de AWS con permisos apropiados

## Uso

1. **Clonar el repositorio:**
   ```bash
   git clone <repository-url>
   cd Amrize_validated
   ```

2. **Configurar variables:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Editar terraform.tfvars con tus valores
   ```

3. **Inicializar Terraform:**
   ```bash
   terraform init
   ```

4. **Validar la infraestructura:**
   ```bash
   terraform validate
   ```
5. **Planificar la infraestructura:**
   ```bash
   terraform plan
   ```

6. **Aplicar la infraestructura:**
   ```bash
   terraform apply
   ```

## Recursos Creados

- VPC con subnets públicas y privadas
- ECS Cluster con Fargate
- ECR Repository
- Application Load Balancer
- Security Groups
- IAM Roles y Policies

## Outputs

Después del deployment, obtendrás:

- `alb_url`: URL del Application Load Balancer
- `ecr_repository_url`: URL del repositorio ECR
- `ecs_cluster_name`: ARN del cluster ECS
- `vpc_id`: ID de la VPC creada

## Limpieza

Para destruir la infraestructura:

```bash
terraform destroy
```

## Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crea un Pull Request

## Autor

- **Alejandro Higuita** - [hahiguit](https://github.com/hahiguit)
