# pyproject makefile

default: help

dev:
	pip install -e .[dev]

install:
	pip install -e .

uninstall:
	pip uninstall -y rstms-etherscan-python
	
.PHONY: test
unitest:
	bash ./run_tests.sh $(API_KEY)

clean:
	find . -type d -name __pycache__ -exec rm -rf "{}" +
	rm -rf build *.egg-info
	rm -f .black .flake8 .errors .coverage

include $(wildcard make/*.mk)
