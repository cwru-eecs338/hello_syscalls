Hello System Calls!
===================

Getting the files:
------------------
If git is installed, you can just use:

    git clone git://github.com/cwru-eecs338/hello_syscalls.git

Otherwise, you can download and extract the tarball using:

    wget --no-check-certificate -q -O - https://github.com/cwru-eecs338/hello_syscalls/tarball/master | tar -xzvf -

Lessons:
--------
* Even basic operations like printing strings require system calls to the kernel
* Printing to standard out is treated like writing bytes to a special file
* In Linux, system calls are implemented by putting arguments into appropriate registers, then using an interrupt

Instructions:
-------------
First, open `print_syscall.c` and note that it is just a simple "Hello World!"
program. However, because printing to the screen in UNIX is the same as writing
to an abstract file called "standard out," this process requires a system call
`write()`.

Now, open `write_syscall.c` and see that we have now implemented printing to
standard out as an explicit call to `write()`. Normally, you have to open a file
to write to it. When you open a file, you are given a file descriptor (just an
integer) that you use to specify the file to which you want to write. In this
case, standard out is a special file that always has file descriptor 1, and it
is already opened for writing. Note that now, we specify the buffer of bytes
(characters) that we want to the file, as well as the number of bytes to write.

Finally, open `asm_syscall.s`, which is written in x86 assembly. As you probably
know from compilers or computer architecture, assembly is essentially a human
readable version of the instructions that are executed by a processor. Looking
at the assembly code helps illustrate how system calls are actually implemented.

At the top of the assembly program, there is a data section that holds the
string we want to print as well as its length. In the `main` section of the
program, we first move values (via `mov`) into the appropriate registers for
specifying the system call we want to make.

Every system call has a number assigned to it; the number for `write()` happens
to be 4, so we move 4 into `rax`. The next three registers hold the arguments to
`write()`, which are the file descriptor (1), the starting address of the byte
string (`$message`), and the length of the message (`$msg_len`).

After the system call is set up, the instruction `int $0x80` causes an interrupt
to occur. When this interrupt occurs, control is handed over to the kernel,
which decides what to do. In this case, it see the interrupt code is `0x80`, so
it knows this is a system call, performs the appropriate call using the values
placed in the registers, and eventually returns control to the calling process.

As you can see, a similar process occurs for the `exit()` system call.
