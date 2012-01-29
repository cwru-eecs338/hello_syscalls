.data
message: .string "Hello System Calls!\n"
msg_len = . - message
.text
.globl main
main:

    # Print Message
    movq    $4, %rax          # write() call = 4
    movq    $1, %rbx          # STDOUT: file descriptor #1
    movq    $message, %rcx    # Pointer to message
    movq    $msg_len, %rdx    # Length of message
    int     $0x80             # Kernel handles interrupt, performs syscall

    # Exit
    movq    $1, %rax          # exit() call
    movq    $0, %rbx          # status = 0 (EXIT_SUCCESS)
    int     $0x80             # Kernel handles interrupt, performs syscall
