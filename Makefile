.PHONY: install test lint run docker-build docker-run verify

install:
	pip install -r requirements.txt

test:
	pytest

lint:
	ruff check app tests

run:
	uvicorn app.main:app --reload

docker-build:
	docker build -t devops25-cicd-demo:local .

docker-run:
	docker run --rm -p 8000:8000 devops25-cicd-demo:local

verify:
	bash scripts/verify.sh
