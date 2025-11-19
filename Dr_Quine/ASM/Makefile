NASM    = nasm
ASFLAGS = -f elf64
CC      = gcc
LDFLAGS = -no-pie

PROGS   = Colleen Grace Sully
OBJS    = $(PROGS:%=%.o)

.PHONY: all clean fclean re

all: $(PROGS)

Colleen: Colleen.o
	$(CC) $(LDFLAGS) -o $@ $^

Grace: Grace.o
	$(CC) $(LDFLAGS) -o $@ $^

Sully: Sully.o
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.s
	$(NASM) $(ASFLAGS) $< -o $@

clean:
	rm -f $(OBJS) Grace_kid.s Sully_*.s Sully_*.o

fclean: clean
	rm -f $(PROGS) Sully_*

re: fclean all