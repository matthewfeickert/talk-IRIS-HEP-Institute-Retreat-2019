default: AS

all: AS

AS: figures/AS_gantt.mmd
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.svg
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.pdf

pyhf_docs: figures/pyhf_docs_gantt.mmd
	#docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.svg
	#docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.pdf
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.svg
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.pdf

pyhf_maintenance: figures/pyhf_maintenance_gantt.mmd
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 900 -i pyhf_maintenance_gantt.mmd -o pyhf_maintenance_gantt.svg
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 900 -i pyhf_maintenance_gantt.mmd -o pyhf_maintenance_gantt.pdf

pyhf_dev: figures/pyhf_dev_gantt.mmd
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -i pyhf_dev_gantt.mmd -o pyhf_dev_gantt.svg
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -i pyhf_dev_gantt.mmd -o pyhf_dev_gantt.pdf

pyhf_research: figures/pyhf_research_gantt.mmd
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -i pyhf_research_gantt.mmd -o pyhf_research_gantt.svg
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -i pyhf_research_gantt.mmd -o pyhf_research_gantt.pdf
