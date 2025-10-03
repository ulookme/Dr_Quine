CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Nom des exécutables
COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):
	$(CC) $(CFLAGS) -o $(COLLEEN) Colleen.c

$(GRACE):
	$(CC) $(CFLAGS) -o $(GRACE) Grace.c

$(SULLY):
	$(CC) $(CFLAGS) -o $(SULLY) Sully.c

clean:
	rm -f $(COLLEEN) $(GRACE) $(SULLY)
	rm -f Grace_kid.c
	rm -f Sully_*

fclean: clean
	rm -f $(COLLEEN) $(GRACE) $(SULLY)

re: fclean all

.PHONY: all clean fclean re
