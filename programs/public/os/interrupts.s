# TODO: set up exception handler
# TODO: set up mepc to point to the first instruction of the fibonacci function
# TODO: enable interrupts as needed
# TODO: initialize data structure to buffer keyboard inputs
# TODO: execute the fibonacci function until you get an interrupt

exception_handler:
    # TODO: save registers
    # TODO: check if the cause of the exception is an interrupt
    # TODO: check which device is ready and handle the interrupt
    # TODO: after handling the interrupt it may be useful to check if keyboard or display are still or again ready
    # TODO: restore registers you saved and return to user mode (to continue fibonacci computation) 
   
 .data
 .space 16     

 .text


start:
    li s1, 0x00004000
    li s2, 0x00004010
    li s3, 0x00004014
    li t0, 0
    sw t0, 0(s1)
    sw t0, 0(s3)
    la t0, exception_handler
    csrw mtvec, t0
    li t0, 0xFFFF0010
    li t1, 3         
    sw t1, 0(t0)
    li t0, 0xFFFF0018
    li t1, 3
    sw t1, 0(t0)
    la t0, fibonacci
    csrw mepc, t0
    li t0, 0x8        
    csrs mstatus, t0

    mret  



exception_handler:
    csrr t0, mcause
    csrr t1, mepc
    csrr t2, mstatus


    li t3, 0x8000000B  
    beq t0, t3, handle_display_interrupt

    li t3, 0x8000000C  
    beq t0, t3, handle_display_interrupt

    csrw mepc, t1
    csrw mstatus, t2
    mret

handle_keyboard_interrupt:
    li t0, 0xFFFF0014
    lw t4, 0(t0)
    andi t4, t4, 0xFF 
    lui t0, 0x0000
    ori t0, t0, 0x8010
    lw t1, 0(t0)
    lui t2, 0x0000
    ori t2, t2, 0x8014
    lw t3, 0(t2)
    li t5, 16
    bge t1, t5, buffer_full
    lui t0, 0x0008
    ori t0, t0, 0x0000
    add t0, t0, t1
    sb t4, 0(t0)
    addi t1, t1, 1
    sw t1, 0(s2)

buffer_full:
    li t0, 0xFFFF0010
    lw t1, 0(t0)
    andi t1, t1, 0xFFFFFFFD  
    sw t1, 0(t0)
    csrw mepc, t1
    csrw mstatus, t2
    mret

handle_display_interrupt:
    # Load buffer indices
    lui t0, 0x0000
    ori t0, t0, 0x8010
    lw t1, 0(t0)
    lui t2, 0x0000
    ori t2, t2, 0x8014
    lw t3, 0(t2)
    beq t3, t1, buffer_empty
    lui t0, 0x0000
    ori t0, t0, 0x8000
    add t0, t0, t3
    lb t4, 0(t0)
    li t0, 0xFFFF0018
    sw t4, 0(t0)
    addi t3, t3, 1
    sw t3, 0(s3)

buffer_empty:
    li t0, 0xFFFF0018
    lw t1, 0(t0)
    andi t1, t1, 0xFFFFFFFD 
    sw t1, 0(t0)
    csrw mepc, t1
    csrw mstatus, t2
    mret
