#Makefile

usac01: main.o extract_token.o
		gcc main.o extract_token.o -z noexecstack -o usac01

main.o: main.c extract_token.h
		gcc -g -Wall -Wextra -fanalyzer -c main.c -o main.o
		
extract_token.o:  extract_token.s 
		gcc -g -Wall -Wextra -fanalyzer -c extract_token.s -o extract_token.o
		
run: usac01
		./usac01
		
clean: 
		-rm -f *.o usac01
