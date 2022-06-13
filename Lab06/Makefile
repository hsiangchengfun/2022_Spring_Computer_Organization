CC = g++
CFLAGS = -I./include main.cpp direct_mapped_cache.cpp set_associative_cache.cpp

all: main.o

main.o: main.cpp
	$(CC) $(CFLAGS) -o main.o

clean:
	rm -f *.o
