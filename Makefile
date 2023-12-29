all: interface.c DB.c
	gcc -o interface interface.c
	gcc -o DB DB.c
