# Makefile for C basics

CC = gcc
# -g : allows use of GNU Debugger
# -Wall : show all warnings
FLAGS = -g -Wall

ASM_OUT = asm_main
ASM_SRC = asm_syscall.s

all: $(ASM_OUT)

$(ASM_OUT): $(ASM_SRC)
	$(CC) $(FLAGS) -o $(ASM_OUT) $(ASM_SRC)

# 'clean' rule for remove non-source files
# To use, call 'make clean'
# Note: you don't have to call this in between every
#       compilation, it's only in case you need to
#       clean out your directory for some reason.
clean:
	@# Using the '@' sign suppresses echoing
	@# the line while the command is run
	@rm -f $(OUTPUT)
