CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Executables
COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

# Fichiers générés automatiquement
GENERATED = Grace_kid.c Sully_*

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): Colleen.c
	$(CC) $(CFLAGS) -o $@ $<

$(GRACE): Grace.c
	$(CC) $(CFLAGS) -o $@ $<

$(SULLY): Sully.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(GENERATED)

fclean: clean
	rm -f $(COLLEEN) $(GRACE) $(SULLY)
	

re: fclean all

.PHONY: all clean fclean re

