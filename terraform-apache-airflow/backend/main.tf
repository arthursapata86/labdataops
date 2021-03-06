resource "google_compute_instance" "backend_instance" {
  name                      = "backend-instance"
  machine_type              = var.machine.small
  zone                      = var.zone.default
  allow_stopping_for_update = true

  metadata = {
    startup-script = <<-EOF
      #!/bin/bash

      sudo apt-get update -qqq
      sudo apt-get install docker-compose -qqq

      sudo docker run \
        --net=host \
        -e POSTGRES_USER=airflow \
        -e POSTGRES_PASSWORD=airflow \
        -e POSTGRES_DB=airflow \
        -d postgres:12-alpine

      sudo docker run \
        --net=host \
        -d redis:6.0.9-alpine

      sudo docker run \
        --net=host \
        -e AIRFLOW__CORE__EXECUTOR=CeleryExecutor \
        -e AIRFLOW__CELERY__RESULT_BACKEND=db+postgresql://airflow:airflow@localhost:5432/airflow \
        -e AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@localhost:5432/airflow \
        -e AIRFLOW__CELERY__BROKER_URL=redis://localhost:6379/1 \
        -e AIRFLOW__CORE__LOAD_EXAMPLES=TRUE \
        apache/airflow:2.0.1-python3.8 \
        db upgrade

      docker_id=$(sudo docker run \
        --net=host \
        -e AIRFLOW__CORE__EXECUTOR=CeleryExecutor \
        -e AIRFLOW__CELERY__RESULT_BACKEND=db+postgresql://airflow:airflow@localhost:5432/airflow \
        -e AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@localhost:5432/airflow \
        -e AIRFLOW__CELERY__BROKER_URL=redis://localhost:6379/1 \
        -e AIRFLOW__CORE__LOAD_EXAMPLES=TRUE \
        -d apache/airflow:2.0.1-python3.8 \
        scheduler)

      sudo docker exec -d $docker_id \
        airflow users create \
          --role ${var.webserver.role} \
          --username ${var.webserver.username} \
          --password ${var.webserver.password} \
          --firstname ${var.webserver.firstname} \
          --lastname ${var.webserver.lastname} \
          --email ${var.webserver.email}

      sudo docker exec -d $docker_id bash \
        git clone https://github.com/arthursapata86/labdataops.git ; \
        cd labdataops/airflow-folder/dags/ ; \
        cp -r * /opt/airflow/dags/


      EOF
  }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {}
  }
}

resource "time_sleep" "backend_instance_sleep" {
  create_duration = "80s"
  depends_on      = [google_compute_instance.backend_instance]
}
