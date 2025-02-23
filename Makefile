env ?= dev

setup:
	brew install pre-commit checkov tflint terraform terragrunt terraform-docs

init:
	find ./ -type d -name ".terraform" -exec rm -rf {} +
	cd environments/$(env) && terragrunt init

plan:
	cd environments/$(env) && terragrunt plan

apply:
	cd environments/$(env) && terragrunt apply -auto-approve

destroy:
	cd environments/$(env) && terragrunt destroy -auto-approve

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

repomix:
	repomix --include "**/*.tf,**/*.tfvars"

lint:
	pre-commit run --all-files
