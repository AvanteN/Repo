	.file	"uart.c"
	.text
	.section	.rodata
.LC0:
	.string	"/dev/ttyS3"
.LC1:
	.string	"%x,%D"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -84(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	OpenSerial
	movl	%eax, -80(%rbp)
	leaq	-64(%rbp), %rax
	movl	$50, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-80(%rbp), %eax
	cltq
	movq	%rax, %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rcx
	leaq	AnotherPortReceive(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movl	%eax, -76(%rbp)
.L3:
	leaq	-64(%rbp), %rcx
	movl	-80(%rbp), %eax
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -84(%rbp)
	cmpl	$0, -84(%rbp)
	jle	.L3
	movzbl	-64(%rbp), %eax
	movzbl	%al, %eax
	movl	-84(%rbp), %edx
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC2:
	.string	"Serial Port Open Fail. "
	.text
	.globl	OpenSerial
	.type	OpenSerial, @function
OpenSerial:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-104(%rbp), %rax
	movl	$258, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -84(%rbp)
	cmpl	$0, -84(%rbp)
	jns	.L6
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L8
.L6:
	leaq	-80(%rbp), %rax
	movl	$60, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$4, -80(%rbp)
	movl	$0, -76(%rbp)
	movl	$2224, -72(%rbp)
	movl	-72(%rbp), %eax
	orl	$4098, %eax
	movl	%eax, -72(%rbp)
	nop
	movl	$0, -68(%rbp)
	movb	$20, -58(%rbp)
	movb	$0, -57(%rbp)
	movl	-84(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	tcflush@PLT
	leaq	-80(%rbp), %rdx
	movl	-84(%rbp), %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	tcsetattr@PLT
	movl	-84(%rbp), %eax
.L8:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	OpenSerial, .-OpenSerial
	.globl	CloseSerial
	.type	CloseSerial, @function
CloseSerial:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	CloseSerial, .-CloseSerial
	.section	.rodata
.LC3:
	.string	"%x %d"
	.text
	.globl	AnotherPortReceive
	.type	AnotherPortReceive, @function
AnotherPortReceive:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -72(%rbp)
	leaq	-64(%rbp), %rax
	movl	$50, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-88(%rbp), %rax
	movl	%eax, -68(%rbp)
.L13:
	leaq	-64(%rbp), %rcx
	movl	-68(%rbp), %eax
	movl	$1, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -72(%rbp)
	cmpl	$0, -72(%rbp)
	jle	.L13
	movzbl	-64(%rbp), %eax
	movzbl	%al, %eax
	movl	-72(%rbp), %edx
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
	.cfi_endproc
.LFE9:
	.size	AnotherPortReceive, .-AnotherPortReceive
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
