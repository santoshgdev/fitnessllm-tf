

upgrade:
	terraform init -upgrade

clear_tables:
	@echo "Deleting tables from dataset $(DATASET_NAME) in project $(PROJECT_ID)"
	bq rm -f -r --dataset $(PROJECT_ID):$(DATASET_NAME)
