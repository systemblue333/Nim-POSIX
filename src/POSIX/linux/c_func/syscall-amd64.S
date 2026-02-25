    .section .note.GNU-stack, "", @progbits
    .text
    .globl raw_syscall_amd64
    .type raw_syscall_amd64, @function

raw_syscall_amd64:
    movq %rdi, %rax      # syscall number
    movq %rsi, %rdi      # arg1
    movq %rdx, %rsi      # arg2
    movq %rcx, %rdx      # arg3
    movq %r8,  %r10      # arg4
    movq %r9,  %r8       # arg5
    movq 16(%rsp), %r9   # arg6 (passed on stack)

    syscall              # invoke syscall

    ret