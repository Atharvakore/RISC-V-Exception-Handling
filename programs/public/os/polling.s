# TODO: wait for keyboard input
# TODO: read keyboard input
# TODO: wait for display ready
# TODO: print keyboard input to display
# TODO: start again

poll_loop:
    li t0, 0xFFFF0010          
poll_keyboard:
    lw t1, 0(t0)                    
    andi t1, t1, 1                  
    beqz t1, poll_keyboard          

    li t0, 0xFFFF0014            
    lw t2, 0(t0)                    
    andi t2, t2, 0xFF               

    li t0, 0xFFFF0018            
poll_display:
    lw t1, 0(t0)                    
    andi t1, t1, 1                  
    beqz t1, poll_display           

    li t0, 0xFFFF001C             
    sw t2, 0(t0)                    

    j poll_loop                  

