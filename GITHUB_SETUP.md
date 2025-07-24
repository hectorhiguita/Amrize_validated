# Instrucciones para conectar con GitHub

## 1. Crear repositorio en GitHub

1. Ve a https://github.com/new
2. Nombra el repositorio: `Amrize_validated` o el nombre que prefieras
3. **NO** inicialices con README, .gitignore o license (ya los tenemos)
4. Haz clic en "Create repository"

## 2. Conectar repositorio local con GitHub

Una vez creado el repositorio en GitHub, ejecuta estos comandos:

```bash
# Agregar el remoto (reemplaza 'username' con tu usuario de GitHub)
git remote add origin https://github.com/username/Amrize_validated.git

# O si usas SSH:
git remote add origin git@github.com:username/Amrize_validated.git

# Subir la rama master
git push -u origin master

# Subir la rama develop
git push -u origin develop
```

## 3. Verificar la conexión

```bash
# Ver los remotos configurados
git remote -v

# Ver el estado
git status
```

## 4. Flujo de trabajo recomendado

```bash
# Para nuevas funcionalidades
git checkout develop
git checkout -b feature/nueva-funcionalidad
# ... hacer cambios ...
git add .
git commit -m "Descripción del cambio"
git push origin feature/nueva-funcionalidad

# Luego crear Pull Request en GitHub desde feature/nueva-funcionalidad hacia develop
```

## 5. Comandos útiles para el futuro

```bash
# Sincronizar con GitHub
git pull origin master

# Ver historial
git log --oneline --graph

# Ver diferencias
git diff

# Ver estado
git status

# Cambiar de rama
git checkout develop
git checkout master
```

## Estado actual del repositorio

✅ Repositorio Git inicializado
✅ Archivos agregados y commitados
✅ .gitignore configurado correctamente
✅ README.md creado
✅ Rama develop creada
✅ Listo para conectar con GitHub

## Próximos pasos

1. Crear repositorio en GitHub
2. Ejecutar comandos de conexión arriba
3. Verificar que todo se subió correctamente
4. ¡Empezar a trabajar con el flujo de Git!
