
from datetime import timedelta

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago

args = {
    'owner': 'airflow',
}

dag = DAG(
    dag_id='Job_Churn',
    default_args=args,
    schedule_interval='0 0 * * *',
    start_date=days_ago(2),
    dagrun_timeout=timedelta(minutes=60),
    tags=['Churn'],
    params={},
)


# [START howto_operator_bash]
run_this = BashOperator(
    task_id='Executa_Job_Churn',
    bash_command='sh /opt/airflow/dags/JobCuratedChurn_0.2/JobCuratedChurn/JobCuratedChurn_run.sh',
    dag=dag,
)

if __name__ == "__main__":
    dag.cli()