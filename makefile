PROGS =	fork select

all:	${PROGS}

fork:
	gcc -o hw1_server_fork hw1_server_fork.c 
select:
	gcc -o hw1_server_select hw1_server_select.c 
clean:
	rm -f hw1_server_fork
	rm -f hw1_server_select
