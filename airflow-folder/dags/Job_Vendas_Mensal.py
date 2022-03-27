from datetime import timedelta

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago

args = {
    'owner': 'airflow',
}

dag = DAG(
    dag_id='Job_Vendas_Mensal',
    default_args=args,
    schedule_interval='0 3 1 * *',
    start_date=days_ago(2),
    dagrun_timeout=timedelta(minutes=60),
    tags=['Vendas', 'Mensal'],
    params={"example_key": "example_value"},
)


# [START howto_operator_bash]
run_this = BashOperator(
    task_id='Executa_Job_Vendas_Mensal',
    bash_command='sh /opt/airflow/dags/JobCuratedVendasMensal_0.1/JobCuratedVendasMensal/JobCuratedVendasMensal_run.sh',
    dag=dag,
)

if __name__ == "__main__":
    dag.cli()