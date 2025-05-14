CC=gfortran

CFLAGS= -Wall -Werror

# $< means the first prerequisite of the rule (e.g., first item after the :, and the $@ is a variable that has the target of the rule)

all: cryptography.o minitest.o
	$(CC) $(CFLAGS) $^ -o minitest

%.o : %.f90
	$(CC) $(CFLAGS) -c $<

clean: 
	rm -f *.o *.mod minitest
