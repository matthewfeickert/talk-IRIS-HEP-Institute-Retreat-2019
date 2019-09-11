default: AS

all: AS pyhf key

AS: figures/gantt/AS_gantt.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.pdf

key: figures/gantt/gantt_key.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i gantt_key.mmd -o gantt_key.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i gantt_key.mmd -o gantt_key.pdf

pyhf: pyhf_docs pyhf_maintenance pyhf_dev pyhf_research

pyhf_docs: figures/gantt/pyhf_docs_gantt.mmd
	#docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.svg
	#docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.pdf
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_docs_gantt.mmd -o pyhf_docs_gantt.pdf

pyhf_maintenance: figures/gantt/pyhf_maintenance_gantt.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i pyhf_maintenance_gantt.mmd -o pyhf_maintenance_gantt.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i pyhf_maintenance_gantt.mmd -o pyhf_maintenance_gantt.pdf

pyhf_dev: figures/gantt/pyhf_dev_gantt.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_dev_gantt.mmd -o pyhf_dev_gantt.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_dev_gantt.mmd -o pyhf_dev_gantt.pdf

pyhf_research: figures/gantt/pyhf_research_gantt.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_research_gantt.mmd -o pyhf_research_gantt.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_research_gantt.mmd -o pyhf_research_gantt.pdf
