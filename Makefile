CC=mpicc
CFLAGS= -ansi -Wall -pedantic -g -std=gnu99

CFILES=sync_ctl.c
HFILES=
OFILES=sync_ctl.o
BIN=sync_ctl

all:	sync_ctl

%.o:	%.c $(HFILES)
	$(CC) -c $(CFLAGS) $< -o $@

sync_ctl:	$(OFILES) $(HFILES)
	        $(CC) $(CFLAGS) $(OFILES) -o ./bin/$(BIN)


clean:	
	rm -f *~ $(OFILES) $(BIN)

mpirun_manager: 
	mpirun -hostfile myhosts ./bin/$(BIN) 0
	
mpirun_token: 
	mpirun -hostfile myhosts ./bin/$(BIN) 1

mpirun_reverse: 
	mpirun -hostfile myhosts ./bin/$(BIN) -1
