# ASM/Makefile (Ubuntu/Linux x86-64, NASM + GCC non-PIE)
NASM    = nasm
ASFLAGS = -felf64
CC      = gcc
LDFLAGS = -no-pie

PROGS   = Colleen Grace Sully
OBJS    = $(PROGS:%=%.o)

.PHONY: all clean fclean re

all: $(PROGS)

Colleen: Colleen.o
	@$(CC) $(LDFLAGS) -o $@ $^

Grace: Grace.o
	@$(CC) $(LDFLAGS) -o $@ $^

Sully: Sully.o
	@$(CC) $(LDFLAGS) -o $@ $^

%.o: %.s
	@$(NASM) $(ASFLAGS) $< -o $@

clean:
	@rm -f $(OBJS) Grace_kid.s Sully_*.s

fclean: clean
	@rm -f $(PROGS) Sully_*   # binaires générés par Sully

re: fclean all
