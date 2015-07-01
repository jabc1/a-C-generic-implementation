	.file	"stack.c"
	.section	.rodata
.LC0:
	.string	"stack.c"
.LC1:
	.string	"elemSize > 0"
.LC2:
	.string	"s->base != ((void *)0)"
	.text
	.globl	stackNew
	.type	stackNew, @function
stackNew:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	jg	.L2
	movl	$__PRETTY_FUNCTION__.2617, 12(%esp)
	movl	$49, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$.LC1, (%esp)
	call	__assert_fail
.L2:
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	$4, 8(%eax)
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L1
	movl	$__PRETTY_FUNCTION__.2617, 12(%esp)
	movl	$55, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$.LC2, (%esp)
	call	__assert_fail
.L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	stackNew, .-stackNew
	.globl	stackDispose
	.type	stackDispose, @function
stackDispose:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	.L5
	movl	$0, -16(%ebp)
	jmp	.L6
.L7:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	imull	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	addl	$1, -16(%ebp)
.L6:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-16(%ebp), %eax
	jg	.L7
.L5:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	free
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	stackDispose, .-stackDispose
	.globl	stackGrow
	.type	stackGrow, @function
stackGrow:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	imull	%edx, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	realloc
	movl	8(%ebp), %edx
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L8
	movl	$__PRETTY_FUNCTION__.2629, 12(%esp)
	movl	$78, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$.LC2, (%esp)
	call	__assert_fail
.L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	stackGrow, .-stackGrow
	.globl	stackPush
	.type	stackPush, @function
stackPush:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	jne	.L11
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	stackGrow
.L11:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	memcpy
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	stackPush, .-stackPush
	.section	.rodata
.LC3:
	.string	"s->top != 0"
	.text
	.globl	stackPop
	.type	stackPop, @function
stackPop:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L13
	movl	$__PRETTY_FUNCTION__.2639, 12(%esp)
	movl	$92, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$.LC3, (%esp)
	call	__assert_fail
.L13:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	memcpy
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	stackPop, .-stackPop
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2617, @object
	.size	__PRETTY_FUNCTION__.2617, 9
__PRETTY_FUNCTION__.2617:
	.string	"stackNew"
	.type	__PRETTY_FUNCTION__.2629, @object
	.size	__PRETTY_FUNCTION__.2629, 10
__PRETTY_FUNCTION__.2629:
	.string	"stackGrow"
	.type	__PRETTY_FUNCTION__.2639, @object
	.size	__PRETTY_FUNCTION__.2639, 9
__PRETTY_FUNCTION__.2639:
	.string	"stackPop"
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
