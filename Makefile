.PHONY: qa lint cs csf phpstan tests coverage

all:
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"}'
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

# QA

qa: lint phpstan cs ## Check code quality - coding style and static analysis

lint: ## Check PHP files syntax
	vendor/bin/linter src tests

cs: ## Check PHP files coding style
	vendor/bin/codesniffer src tests

csf: ## Fix PHP files coding style
	vendor/bin/codefixer src tests

phpstan: ## Analyse code with PHPStan
	vendor/bin/phpstan analyse -l max -c phpstan.neon src

# Tests

tests:
	vendor/bin/tester -s -p php --colors 1 -C tests/cases

coverage-clover:
	vendor/bin/tester -s -p phpdbg --colors 1 -C --coverage ./coverage.xml --coverage-src ./src tests/cases

coverage-html:
	vendor/bin/tester -s -p phpdbg --colors 1 -C --coverage ./coverage.html --coverage-src ./src tests/cases
