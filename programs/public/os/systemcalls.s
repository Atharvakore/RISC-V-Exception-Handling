# bootup 

_start:
    la t0, exception_handler        # setting up exception handler
    csrw mtvec, t0                  # ...

    # TODO: set mepc to user_systemcalls

    la t0, user_systemcalls             
    csrw mepc, t0                   
    mret                            # Return to user mode


exception_handler:
    # TODO: save registers you need to handle the exception
    # TODO: check the cause of the exception
    # TODO: handle the system call
    # TODO: restore registers you saved and return to user mode

    
    sw ra, 0x00(zero)
    sw t0, 0x04(zero)
    sw t1, 0x08(zero)
    sw t2, 0x0C(zero)
    sw t3, 0x10(zero)
    sw t4, 0x14(zero)
    sw t5, 0x18(zero)
    sw t6, 0x1C(zero)
    sw s0, 0x20(zero)
    sw s1, 0x24(zero)
    sw s2, 0x28(zero)
    sw s3, 0x2C(zero)
    sw s4, 0x30(zero)
    sw s5, 0x34(zero)
    sw s6, 0x38(zero)
    sw s7, 0x3C(zero)
    sw s8, 0x40(zero)
    sw s9, 0x44(zero)
    sw s10, 0x48(zero)
    sw s11, 0x4C(zero)
    sw a0, 0x50(zero)
    sw a1, 0x54(zero)
    sw a2, 0x58(zero)
    sw a3, 0x5C(zero)
    sw a4, 0x60(zero)
    sw a5, 0x64(zero)
    sw a6, 0x68(zero)
    sw a7, 0x6C(zero)

    csrr t0, mcause                 
    li t1, 8                        
    beq t0, t1, handle_ecall        
    j restore_and_return            

handle_ecall:
    lw t1, 0x6C(zero)               
    li t2, 11                       
    beq t1, t2, print_char
    li t2, 4                        
    beq t1, t2, print_string
    j restore_and_return            

print_char:
    lw a0, 0x50(zero)               
    li t3, 0xffff0018               
wait_ready_char:
    lw t4, 0(t3)                    
    andi t4, t4, 1                  
    beqz t4, wait_ready_char        
    li t3, 0xffff001c               
    sw a0, 0(t3)                    
    j adjust_mepc

print_string:
    lw a0, 0x50(zero)               
print_string_loop:
    lb t2, 0(a0)                    
    beqz t2, adjust_mepc            
    li t3, 0xffff0018                
wait_ready_string:
    lw t4, 0(t3)                    
    andi t4, t4, 1                  
    beqz t4, wait_ready_string      
    li t3, 0xffff001c               
    sw t2, 0(t3)                   
    addi a0, a0, 1                  
    j print_string_loop             

adjust_mepc:
    csrr t1, mepc                   
    addi t1, t1, 4                  
    csrw mepc, t1                   
    j restore_and_return

restore_and_return:
    # Restore registers
    lw ra, 0x00(zero)
    lw t0, 0x04(zero)
    lw t1, 0x08(zero)
    lw t2, 0x0C(zero)
    lw t3, 0x10(zero)
    lw t4, 0x14(zero)
    lw t5, 0x18(zero)
    lw t6, 0x1C(zero)
    lw s0, 0x20(zero)
    lw s1, 0x24(zero)
    lw s2, 0x28(zero)
    lw s3, 0x2C(zero)
    lw s4, 0x30(zero)
    lw s5, 0x34(zero)
    lw s6, 0x38(zero)
    lw s7, 0x3C(zero)
    lw s8, 0x40(zero)
    lw s9, 0x44(zero)
    lw s10, 0x48(zero)
    lw s11, 0x4C(zero)
    lw a0, 0x50(zero)
    lw a1, 0x54(zero)
    lw a2, 0x58(zero)
    lw a3, 0x5C(zero)
    lw a4, 0x60(zero)
    lw a5, 0x64(zero)
    lw a6, 0x68(zero)
    lw a7, 0x6C(zero)
    mret                            