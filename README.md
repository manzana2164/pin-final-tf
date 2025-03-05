# Grupo 5 - PIN FINAL DevOps Mundose - Terraform EKS Cluster con Prometheus y Grafana

Este PIN FINAL presenta el deploy de un clúster `eks-cluster-mundose` en la region `us-east-1` de AWS. El Clúster incluye:
- Un Grupo de Nodo (`mundose-node-group`) con una isntancia `t3.medium`.
- Prometheus & Grafana se despliegan usando Helm.
- Un servicio NGINX (`nginx-logs-service`) para controlar los logs.

En este repositorio detallamos la configuración general del proyecto. En la documentación adjunta en PDF https://github.com/manzana2164/pin-final-tf/blob/ec067e970cf9e901cbdb73232fa750728ac7345d/DevOps%20-%20Pin%20Final%20Grupo%205.pdf, demostramos los pasos de cada instancia aplicados de este repositorio.

## Estructura del Proyecto del Clúster

```
terraform-eks-mundose/
├── provider.tf           # Configuraciones de proveedores: AWS, Kubernetes y Helm.
├── vpc.tf                # VPC y recursos de red
├── eks.tf                # Clúster EKS con la configuración del Nodo.
├── helm.tf               # Lanzamientos de Prometheus, Grafana y NGINX a través de HELM.
├── outputs.tf            # Outputs para los endpoints.
├── variables.tf          # Variables de configuración.
└── README.md             # Documentación de uso general.
```

## Prerequisitos

- Terraform instalado.
- AWS CLI con credenciales configuradas.
- kubectl instalado para el cluster de Kubernetes.
- Helm instalado para manejar las apps de Kubernetes.

## Instrucciones de configuración

1. **Clonar el Repositorio**

   Clonar este repo en la máquina local:

   ```
   git clone https://github.com/manzana2164/pin-final-tf.git
   cd terraform-eks-cluster
   ```


2. **Inicializar Terraform**

   Correr el comando de init para la configuración y descarga de la infraestructura:

   ```
   terraform init
   ```

3. **Deployment Plan**

   Generar un plan para la veriificación de recursos a crear:

   ```
   terraform plan
   ```

4. **Aplicar la configuración**

   Desplegar el clúster EKS y los recursos asocuados:

   ```
   terraform apply
   ```

   Confirmar la acción al momento de aplicar el plan.

5. **Acceso al Clúster EKS**

   Después del deploy completo, configuramos `kubectl` para usar el clúster creado:

   ```
   aws eks --region us-east-1 update-kubeconfig --name eks-cluster-mundose
   ```

6. **Deploy de Prometheus y Grafana**

   Los módulos de Prometheus y Grafana se crean de forma automática como parte del IaaC. Podemos chequear los outputs con los siguientes comandos de visualización de LoadBalancer:

   ```
   kubectl get svc -n monitoring
   kubectl get svc -n default
   ```


## Outputs

Después de completarse el deployment, tendremos disponible:

- EKS Cluster
- EKS Cluster Endpoint
- Prometheus
- Grafana
- NGINX

## Configuración de Prometheus como fuente de datos de Grafana

1. **Acceso a Grafana**

Accedemos al url de Grafana a través del y agregamos una nueva conexión con Prometheus.

2. **URL de Prometheus**

Como url de Prometheus colocamos http://prometheus-release-server 
Testeamos y probamos la conexión.

3. **Importación de Dashboards**

Agregamos nuevos dashboards desde el método de importación.
Códigos asociados a Prometheus:
***3119***
***6417***

4. **Visualización de Datos**

Confirmamos la correcta carga de datos del Clúster, con el nodo y los Pods configurados.


## Cleanup

Para eliminar todos los recursos que creamos en este proyecto, corremos:

```
terraform destroy
```

Confirmamos el destroy en el prompt y verificamos que se complete el proceso.

## Integrantes del grupo:

   - Emilio Pascutti - emiliopascutti2164@gmail.com
   - Natalio Cardozo - nathaliocardozo@gmail.com
   - Julio Gonzalez - aresden113@gmail.com
   - Jonathan David Martino - jonamartino@gmail.com
   - Gonzalo Martín Montalvo - montalvog@gmail.com

