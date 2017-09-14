CC=g++
MC=mex
CFLAGS=-fPIC -Wall
LDFLAGS=-lm
MEX_SRC=TransformDecompose.cpp

all: Decompose.o $(MEX_SRC)
	$(MC) $(MEX_SRC) Decompose.o
Decompose.o: Decompose.h
	$(CC) $(CFLAGS) $(LDFLAGS) -c Decompose.c

clean:
	rm *.o *.mex*
