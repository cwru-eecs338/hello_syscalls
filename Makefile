# Makefile for C basics

CC = gcc
# -g : allows use of GNU Debugger
# -Wall : show all warnings
FLAGS = -g -Wall

ASM_OUT = asm_main
ASM_SRC = asm_syscall.s
WRITE_OUT = write_main
WRITE_SRC = write_syscall.c
PRINT_OUT = print_main
PRINT_SRC = print_syscall.c

all: $(ASM_OUT) $(WRITE_OUT) $(PRINT_OUT)

$(PRINT_OUT): $(PRINT_SRC)
	$(CC) $(FLAGS) -o $@ $?

$(WRITE_OUT): $(WRITE_SRC)
	$(CC) $(FLAGS) -o $@ $?

$(ASM_OUT): $(ASM_SRC)
	$(CC) $(FLAGS) -o $@ $?

# 'clean' rule for remove non-source files
# To use, call 'make clean'
# Note: you don't have to call this in between every
#       compilation, it's only in case you need to
#       clean out your directory for some reason.
clean:
	@# Using the '@' sign suppresses echoing
	@# the line while the command is run
	@rm -f $(ASM_OUT) $(WRITE_OUT) $(PRINT_OUT)
