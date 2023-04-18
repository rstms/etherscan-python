install:
	pip install -e .

.PHONY: test
test:
	bash ./run_tests.sh $(API_KEY)

clean:
	find . -type d -name __pycache__ -exec rm -rf "{}" +
	rm -rf build *.egg-info
	rm -f .black .flake8 .errors .coverage

fmt:
	black -l 135 etherscan
	flake8 --max-line-len 135 etherscan
