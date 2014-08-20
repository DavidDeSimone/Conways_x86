    .file   "conway.c"
    .text
.globl update
    .type   update, @function
update:
    pushl %ebp 
    movl %esp, %ebp
    movl 8(%ebp), %eax 
    movl 12(%ebp), %edx 
    movl 16(%ebp), %ebx 
    subl $24, %esp 
    movl %edx, %ecx 
    movl %eax, -4(%ebp)
    movl $0, %edx
    
.outer_loop:
    movl 12(%ebp), %ecx
    addl $1, %ecx
    loop .inner_loop
.endOfinner:
    addl $1, %edx
    cmpl %ebx, %edx
    jne .outer_loop
    jmp .clearArray
	
.clearArray:
    movl $0, %edx
.outer_clear:
    movl $0, %ecx
    jmp .inner_clear
.endofin:
    addl $1, %edx
    cmpl %ebx, %edx
    jne .outer_clear
    subl $24, %ebp
    jmp .complete

.inner_clear:
    movl -4(%ebp), %eax
    movl (%eax, %edx, 4), %eax
    leal (%eax, %ecx, 4), %eax
    movl $0, (%eax)
    addl $1, %ecx
    cmpl %ecx, 12(%ebp)	
    jne .inner_clear
    jmp .endofin

.complete:
break2:	
	cmpl %esp, %ebp
break3:	
	je .END
break4:	
	popl %eax
break5:	
	movl $1, (%eax)
break6:	
	cmpl %esp, %ebp
break7:	
	jne .complete
	jmp .END
	
	
.inner_loop:
    movl $0, -8(%ebp)
    #movl %edx, -12(%ebp) %edx = -12(%ebp)
    #movl %ecx, -16(%ebp)
con1:	
    subl $1, %edx
    cmpl $0, %edx	
    jge .J1
con2:
    addl $1, %edx
    cmpl $0, %edx
    jge .J3
con3:
    addl $1, %edx
    cmpl %ebx, %edx
    jl .J5
    jmp con4
d2:
   loop .inner_loop
   jmp .endOfinner
con4:
    subl $1, %edx	
    subl $1, %edx
    cmp $0, %edx
    jge .J7
con5:
    addl $1, %edx
    cmpl $0, %edx
    jge .J9
con6:
    addl $1, %edx
    cmp %ebx, %edx
    jl .J11
con7:
    subl $1, %edx
    subl $1, %edx
    cmp $0, %edx
    jge .J13
con8:
    addl $1, %edx
    cmp $0, %edx
    jge .J15
con9:
    addl $1, %edx
    cmp %ebx, %edx
    jl .J17
final:
    subl $1, %edx
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx	
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmpl $1, (%eax)	
	je CASE1
	jne CASE2
	jmp .ERROR

d1:
    jmp d2
	
CASE1:
	cmpl $2, -8(%ebp)	
	je SETTOONE
	cmpl $3, -8(%ebp)
	je SETTOONE
	jmp d1
CASE2:
	cmpl $3, -8(%ebp)
	je SETTOONE
	jmp d1
SETTOONE:
        pushl %eax
check:	
	jmp d1
	
	
cond1ret:	
    addl $1, %ecx
    jmp con2

.J1:
    subl $1, %ecx		
    cmpl $0, %ecx
    jge .J2
    jmp cond1ret
	
.J2:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax	
    movl -20(%ebp), %ebx	
    cmpl $1, (%eax)
    je .ADD
    jmp cond1ret
	
.ADD:
    addl $1, -8(%ebp)
    jmp cond1ret

cond2ret:
    addl $1, %ecx
    jmp con3	
	
.J3:
    subl $1, %ecx
    cmp $0, %ecx
    jge .J4
    jmp cond2ret
	
.J4:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD2
    jmp cond2ret
.ADD2:
    addl $1, -8(%ebp)
    jmp cond2ret
	
cond3ret:	
    addl $1, %ecx
    jmp con4	
	
.J5:
    subl $1, %ecx
    cmp $0, %ecx
    jge .J6
    jmp cond3ret
	
.J6:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD3
    jmp cond3ret
.ADD3:
    addl $1, -8(%ebp)
    jmp cond3ret	
	
cond4ret:
	jmp con5

.J7:
    cmp $0, %eax
    jge .J8
    jmp cond4ret
.J8:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD4
    jmp cond4ret
.ADD4:
    addl $1, -8(%ebp)
    jmp cond4ret

cond5ret:
	jmp con6

.J9:
    jmp cond5ret
    movl %ecx, -16(%ebp)
    cmp $0, -16(%ebp)
    jge .J10
    jmp cond5ret
.J10:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl -12(%ebp), %ebx
    movl (%eax, %ebx, 4), %eax
    movl -16(%ebp), %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, %eax
    je .ADD5
    jmp cond5ret
.ADD5:
    addl $1, -8(%ebp)
    jmp cond5ret		

cond6ret:	
	jmp con7

.J11:
    cmp $0, %ecx
    jge .J12
    jmp cond6ret
.J12:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD6
    jmp cond6ret
.ADD6:
    addl $1, -8(%ebp)
    jmp cond6ret

cond7ret:
	subl $1, %ecx
	jmp con8

.J13:
    addl $1, %ecx
    movl %ebx, -20(%ebp)
    cmp 16(%ebp), %ecx
    jle .J14
    jmp cond7ret
.J14:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD7
    jmp cond7ret
.ADD7:
    addl $1, -8(%ebp)
    jmp cond7ret
	
cond8ret:
    subl $1, %ecx	
    jmp con9

.J15:
    addl $1, %ecx
    movl %ebx, -20(%ebp)
    cmp 16(%ebp), %ecx
    jle .J16
    jmp cond8ret
.J16:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD8
    jmp cond8ret
.ADD8:
    addl $1, -8(%ebp)
    jmp cond8ret
	
cond9ret:
    subl $1, %ecx	
    jmp final

.J17:
	addl $1, %ecx
    movl %ebx, -20(%ebp)
    movl 16(%ebp), %ebx
    cmp 16(%ebp), %ecx
    jle .J18
    jmp cond9ret
.J18:
    movl -4(%ebp), %eax
    movl %ebx, -20(%ebp)
    movl %edx, %ebx
    movl (%eax, %ebx, 4), %eax
    movl %ecx, %ebx
    subl $1, %ebx
    leal (%eax, %ebx, 4), %eax
    movl -20(%ebp), %ebx
    cmp $1, (%eax)
    je .ADD9
    jmp cond9ret
.ADD9:
    addl $1, -8(%ebp)
    jmp cond9ret
	
	
.ERROR:
	movl $150, %eax
	jmp .END

.END:
    addl $24, %ebp
    movl %ebp, %esp
    popl %ebp
    ret
	
.BOT:
