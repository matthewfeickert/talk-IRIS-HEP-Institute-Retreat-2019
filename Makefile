default: AS

all: AS

AS: figures/AS_gantt.mmd
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.svg
	docker run --rm -v "${PWD}"/figures:/home/node/data matthewfeickert/mermaid-cli -w 1100 -i AS_gantt.mmd -o AS_gantt.pdf
