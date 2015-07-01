	.file	"main.c"
	.text
	.globl	stringFree
	.type	stringFree, @function
stringFree:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	free
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	stringFree, .-stringFree
	.section	.rodata
.LC0:
	.string	"%d "
.LC1:
	.string	"hello"
.LC2:
	.string	"world"
.LC3:
	.string	"shabby"
.LC4:
	.string	"fuck"
.LC5:
	.string	"%s "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$96, %esp
	movl	$0, 8(%esp)
	movl	$4, 4(%esp)
	leal	56(%esp), %eax
	movl	%eax, (%esp)
	call	stackNew
	movl	$0, 28(%esp)
	jmp	.L3
.L4:
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	56(%esp), %eax
	movl	%eax, (%esp)
	call	stackPush
	movl	28(%esp), %eax
	addl	$1, %eax
	movl	%eax, 28(%esp)
.L3:
	movl	28(%esp), %eax
	cmpl	$999, %eax
	jle	.L4
	movl	$0, 28(%esp)
	jmp	.L5
.L6:
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	leal	56(%esp), %eax
	movl	%eax, (%esp)
	call	stackPop
	movl	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	28(%esp), %eax
	addl	$1, %eax
	movl	%eax, 28(%esp)
.L5:
	movl	28(%esp), %eax
	cmpl	$999, %eax
	jle	.L6
	leal	56(%esp), %eax
	movl	%eax, (%esp)
	call	stackDispose
	movl	$stringFree, 8(%esp)
	movl	$4, 4(%esp)
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	stackNew
	movl	$.LC1, 40(%esp)
	movl	$.LC2, 44(%esp)
	movl	$.LC3, 48(%esp)
	movl	$.LC4, 52(%esp)
	movl	$0, 28(%esp)
	jmp	.L7
.L8:
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	strdup
	movl	%eax, 36(%esp)
	leal	36(%esp), %eax
	movl	%eax, 4(%esp)
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	stackPush
	movl	28(%esp), %eax
	addl	$1, %eax
	movl	%eax, 28(%esp)
.L7:
	movl	28(%esp), %eax
	cmpl	$999999, %eax
	jle	.L8
	movl	$0, 28(%esp)
	jmp	.L9
.L10:
	leal	36(%esp), %eax
	movl	%eax, 4(%esp)
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	stackPop
	movl	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC5, (%esp)
	call	printf
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	28(%esp), %eax
	addl	$1, %eax
	movl	%eax, 28(%esp)
.L9:
	movl	28(%esp), %eax
	cmpl	$9, %eax
	jle	.L10
	leal	76(%esp), %eax
	movl	%eax, (%esp)
	call	stackDispose
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
