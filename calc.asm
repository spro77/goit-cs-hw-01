.section .data
    a: .byte 5
    b: .byte 3
    c: .byte 2
    resultMsg: .ascii "Result: "

.section .text
.global _start
_start:
    ldr x0, =b
    ldrb w4, [x0]
    ldr x0, =a
    ldrb w5, [x0]
    ldr x0, =c
    ldrb w6, [x0]
    add w4, w4, w5
    sub w4, w4, w6

    add w4, w4, #48

    mov x0, #1
    ldr x1, =resultMsg
    mov x2, #8
    mov x8, #64
    svc #0

    mov x0, #1
    sub sp, sp, #16
    strb w4, [sp]
    mov x1, sp
    mov x2, #1
    mov x8, #64
    svc #0
    add sp, sp, #16

    mov x0, #0
    mov x8, #93
    svc #0