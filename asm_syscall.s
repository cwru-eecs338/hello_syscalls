.data
message: .string "Hello System Calls!\n"
msg_len = . - message
.text
.globl main
main:

    # Print Message
    mov    $4, %rax          # write() call = 4
    mov    $1, %rbx          # STDOUT: file descriptor #1
    mov    $message, %rcx    # Pointer to message
    mov    $msg_len, %rdx    # Length of message
    int    $0x80             # Kernel handles interrupt, performs syscall

    # Exit
    mov    $1, %rax          # exit() call
    mov    $0, %rbx          # status = 0 (EXIT_SUCCESS)
    int    $0x80             # Kernel handles interrupt, performs syscall
