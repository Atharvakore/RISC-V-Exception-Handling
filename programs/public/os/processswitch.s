_start:
    la t0, exception_handler
    csrw mtvec, t0

    li t0, 0x80
    csrs mie, t0
    csrs mstatus, t0

    li t0, 325
    li t1, 0
    li t2, 0
    li t3, 0xFFFF0000
    sw t2, 0(t3)
    sw t1, 4(t3)
    li t3, 0xFFFF0008
    sw t0, 0(t3)
    sw t1, 4(t3)

    li t0, 0x4000000
    csrw mepc, t0

    li t0, 0
    sw t0, 0x00(zero)

    li t1, 0x4000000
    sw t2, 0x04(zero)

    li t2, 0x8000000
    sw t2, 0x90(zero)

    mret

exception_handler:
    csrr t6, mcause
    li s1, 0x80000007

    beq t6, s1, handle_timer

other_interrupt:
    mret

handle_timer:
    lw s1, 0x00(zero)

    li t0, 0x80
    csrc mip, t0

    bnez s1, save_process_2

save_process_1:
    sw x0, 0x08(zero)
    sw ra, 0x0C(zero)
    sw sp, 0x10(zero)
    sw gp, 0x14(zero)
    sw tp, 0x18(zero)
    
    sw t0, 0x1C(zero)
    sw t1, 0x20(zero)
    sw t2, 0x24(zero)
    
    sw s0, 0x28(zero)
    sw s1, 0x2C(zero)
    
    sw a0, 0x30(zero)
    sw a1, 0x34(zero)
    sw a2, 0x38(zero)
    sw a3, 0x3C(zero)
    sw a4, 0x40(zero)
    sw a5, 0x44(zero)
    sw a6, 0x48(zero)
    sw a7, 0x4C(zero)
    
    sw s2, 0x50(zero)
    sw s3, 0x54(zero)
    sw s4, 0x58(zero)
    sw s5, 0x5C(zero)
    sw s6, 0x60(zero)
    sw s7, 0x64(zero)
    sw s8, 0x68(zero)
    sw s9, 0x6C(zero)
    sw s10, 0x70(zero)
    sw s11, 0x74(zero)
    
    sw t3, 0x78(zero)
    sw t4, 0x7C(zero)
    sw t5, 0x80(zero)
    sw t6, 0x84(zero)

    csrr t0, mepc
    sw t0, 0x04(zero)

    li t0, 325
    li t1, 0
    li t2, 0
    li t3, 0xFFFF0000
    sw t2, 0(t3)
    sw t1, 4(t3)
    li t3, 0xFFFF0008
    sw t0, 0(t3)
    sw t1, 4(t3)

    li t0, 0x8000000
    csrw mepc, t0

    li t0, 1
    sw t0, 0x00(zero)

    j load_process_2

save_process_2:
    sw x0, 0x94(zero)
    sw ra, 0x98(zero)
    sw sp, 0x9C(zero)
    sw gp, 0xA0(zero)
    sw tp, 0xA4(zero)
    
    sw t0, 0xA8(zero)
    sw t1, 0xAC(zero)
    sw t2, 0xB0(zero)
    
    sw s0, 0xB4(zero)
    sw s1, 0xB8(zero)
    
    sw a0, 0xBC(zero)
    sw a1, 0xC0(zero)
    sw a2, 0xC4(zero)
    sw a3, 0xC8(zero)
    sw a4, 0xCC(zero)
    sw a5, 0xD0(zero)
    sw a6, 0xD4(zero)
    sw a7, 0xD8(zero)
    
    sw s2, 0xDC(zero)
    sw s3, 0xE0(zero)
    sw s4, 0xE4(zero)
    sw s5, 0xE8(zero)
    sw s6, 0xEC(zero)
    sw s7, 0xF0(zero)
    sw s8, 0xF4(zero)
    sw s9, 0xF8(zero)
    sw s10, 0xFC(zero)
    sw s11, 0x100(zero)
    
    sw t3, 0x104(zero)
    sw t4, 0x108(zero)
    sw t5, 0x10C(zero)
    sw t6, 0x110(zero)

    csrr t0, mepc
    sw t0, 0x90(zero)

    li t0, 325
    li t1, 0
    li t2, 0
    li t3, 0xFFFF0000
    sw t2, 0(t3)
    sw t1, 4(t3)
    li t3, 0xFFFF0008
    sw t0, 0(t3)
    sw t1, 4(t3)

    li t0, 0x4000000
    csrw mepc, t0

    li t0, 0
    sw t0, 0x00(zero)

    j load_process_1

load_process_2:
    lw t5, 0x90(zero)
    csrw mepc, t5

    lw x0, 0x94(zero)
    lw ra, 0x98(zero)
    lw sp, 0x9C(zero)
    lw gp, 0xA0(zero)
    lw tp, 0xA4(zero)
    
    lw t0, 0xA8(zero)
    lw t1, 0xAC(zero)
    lw t2, 0xB0(zero)
    
    lw s0, 0xB4(zero)
    lw s1, 0xB8(zero)
    
    lw a0, 0xBC(zero)
    lw a1, 0xC0(zero)
    lw a2, 0xC4(zero)
    lw a3, 0xC8(zero)
    lw a4, 0xCC(zero)
    lw a5, 0xD0(zero)
    lw a6, 0xD4(zero)
    lw a7, 0xD8(zero)
    
    lw s2, 0xDC(zero)
    lw s3, 0xE0(zero)
    lw s4, 0xE4(zero)
    lw s5, 0xE8(zero)
    lw s6, 0xEC(zero)
    lw s7, 0xF0(zero)
    lw s8, 0xF4(zero)
    lw s9, 0xF8(zero)
    lw s10, 0xFC(zero)
    lw s11, 0x100(zero)
    
    lw t3, 0x104(zero)
    lw t4, 0x108(zero)
    lw t5, 0x10C(zero)
    lw t6, 0x110(zero)

    mret

load_process_1:
    lw t5, 0x04(zero)
    csrw mepc, t5

    lw x0, 0x08(zero)
    lw ra, 0x0C(zero)
    lw sp, 0x10(zero)
    lw gp, 0x14(zero)
    lw tp, 0x18(zero)
    
    lw t0, 0x1C(zero)
    lw t1, 0x20(zero)
    lw t2, 0x24(zero)
    
    lw s0, 0x28(zero)
    lw s1, 0x2C(zero)
    
    lw a0, 0x30(zero)
    lw a1, 0x34(zero)
    lw a2, 0x38(zero)
    lw a3, 0x3C(zero)
    lw a4, 0x40(zero)
    lw a5, 0x44(zero)
    lw a6, 0x48(zero)
    lw a7, 0x4C(zero)
    
    lw s2, 0x50(zero)
    lw s3, 0x54(zero)
    lw s4, 0x58(zero)
    lw s5, 0x5C(zero)
    lw s6, 0x60(zero)
    lw s7, 0x64(zero)
    lw s8, 0x68(zero)
    lw s9, 0x6C(zero)
    lw s10, 0x70(zero)
    lw s11, 0x74(zero)
    
    lw t3, 0x78(zero)
    lw t4, 0x7C(zero)
    lw t5, 0x80(zero)
    lw t6, 0x84(zero)

    mret

