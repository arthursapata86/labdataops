from datetime import timedelta

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago

args = {
    'owner': 'airflow',
}

dag = DAG(
    dag_id='Job_Vendas_Semanal',
    default_args=args,
    schedule_interval='0 5 * * 1',
    start_date=days_ago(2),
    dagrun_timeout=timedelta(minutes=60),
    tags=['Vendas', 'Semanal'],
    params={},
)


# [START howto_operator_bash]
run_this = BashOperator(
    task_id='Executa_Venda_Semanal',
    bash_command='sh /opt/airflow/dags/JobCuratedVendasSemanal_0.1/JobCuratedVendasSemanal/JobCuratedVendasSemanal_run.sh',
    dag=dag,
)


if __name__ == "__main__":
    dag.cli()