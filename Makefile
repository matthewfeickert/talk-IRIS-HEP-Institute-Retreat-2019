default: AS

all: AS pyhf key compare summary

AS: figures/gantt/AS_gantt.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.pdf

key: figures/gantt/gantt_key.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i gantt_key.mmd -o gantt_key.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i gantt_key.mmd -o gantt_key.pdf

summary: figures/gantt/pyhf_AS_summary.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_AS_summary.mmd -o pyhf_AS_summary.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -i pyhf_AS_summary.mmd -o pyhf_AS_summary.pdf

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

compare: compare_ecosystem compare_cyber compare_benchmark compare_accelerate

compare_ecosystem: figures/gantt/compare_ecosystem.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_ecosystem.mmd -o compare_ecosystem.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_ecosystem.mmd -o compare_ecosystem.pdf

compare_cyber: figures/gantt/compare_cyber.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_cyber.mmd -o compare_cyber.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_cyber.mmd -o compare_cyber.pdf

compare_benchmark: figures/gantt/compare_benchmark.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_benchmark.mmd -o compare_benchmark.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_benchmark.mmd -o compare_benchmark.pdf

compare_accelerate: figures/gantt/compare_accelerate.mmd
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_accelerate.mmd -o compare_accelerate.svg
	docker run --rm -v "${PWD}"/figures/gantt:/home/node/data matthewfeickert/mermaid-cli -w 900 -i compare_accelerate.mmd -o compare_accelerate.pdf
