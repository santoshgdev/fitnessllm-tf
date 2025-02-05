apply:
	terraform apply -auto-approve

upgrade:
	terraform init -upgrade

clear_tables_strava:
	@echo "Deleting tables from dataset dev_strava in project $(PROJECT_ID)"
	bq rm -f -r --dataset $(PROJECT_ID):dev_strava

clear_tables_metrics:
	@echo "Deleting tables from dataset dev_metrics in project $(PROJECT_ID)"
	bq rm -f -r --dataset $(PROJECT_ID):dev_metrics

clear_all_tables:
	make clear_tables_strava
	make clear_tables_metrics

reset:
	make clear_all_tables
	make apply