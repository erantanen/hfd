	.file	"hfd.c"
	.globl	version
	.data
	.align 32
	.type	version, @object
	.size	version, 40
version:
	.string	"hfd v001.1 20sep12 by Ed Rantanen"
	.zero	6
	.section	.rodata
	.align 4
.LC0:
	.string	"\n 1 In correct usage,\n ' hfd -help '"
	.align 4
.LC1:
	.string	"Try for a better understanding of how to use hfd.\n"
.LC2:
	.string	" %02x%02x "
.LC3:
	.string	"\n %06x:"
.LC4:
	.string	"-u"
.LC5:
	.string	" %02X%02X "
.LC6:
	.string	"r"
	.align 4
.LC7:
	.string	"\n 2 In correct usage,\n ' hfd -help '"
.LC8:
	.string	"-ps"
.LC9:
	.string	"%02x%02x"
.LC10:
	.string	"\n"
.LC11:
	.string	"-v"
.LC12:
	.string	"\n%s \n\n"
.LC13:
	.string	"-c"
.LC14:
	.string	"-h"
.LC15:
	.string	"man ./hfd_man"
.LC16:
	.string	"Unable to locate help file"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	subl	$88, %esp
	movl	%ecx, %ebx
	movl	%esp, %eax
	movl	%eax, -76(%ebp)
	movl	$16, -60(%ebp)
	movl	$1, -56(%ebp)
	movl	$0, -52(%ebp)
	movl	-60(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -36(%ebp)
	leal	15(%eax), %edx
	movl	$16, %eax
	subl	$1, %eax
	addl	%edx, %eax
	movl	$16, -80(%ebp)
	movl	$0, %edx
	divl	-80(%ebp)
	imull	$16, %eax, %eax
	subl	%eax, %esp
	leal	16(%esp), %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	movl	%eax, -32(%ebp)
	cmpl	$1, (%ebx)
	jle	.L2
	cmpl	$4, (%ebx)
	jle	.L3
.L2:
	movl	$.LC0, (%esp)
	call	puts
	movl	$.LC1, (%esp)
	call	puts
	movl	$1, (%esp)
	call	exit
.L3:
	movl	$.LC2, -48(%ebp)
	movl	$.LC3, -44(%ebp)
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC4, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L4
	movl	$.LC5, -48(%ebp)
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	.L5
	movl	$.LC7, (%esp)
	call	puts
	movl	$.LC1, (%esp)
	call	puts
	movl	$1, (%esp)
	call	exit
.L5:
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	jmp	.L14
.L4:
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC8, %eax
	movl	$4, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L7
	movl	$.LC9, -48(%ebp)
	movl	$.LC10, -44(%ebp)
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	.L8
	movl	$.LC7, (%esp)
	call	puts
	movl	$.LC1, (%esp)
	call	puts
	movl	$1, (%esp)
	call	exit
.L8:
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	jmp	.L14
.L7:
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC11, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L9
	movl	$.LC12, %eax
	movl	$version, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$1, (%esp)
	call	exit
.L9:
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC13, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L10
	movl	4(%ebx), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, -60(%ebp)
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	.L11
	movl	$.LC7, (%esp)
	call	puts
	movl	$.LC1, (%esp)
	call	puts
	movl	$1, (%esp)
	call	exit
.L11:
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$12, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	jmp	.L14
.L10:
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	$.LC14, %eax
	movl	$3, %ecx
	movl	%edx, %esi
	movl	%eax, %edi
	repz cmpsb
	seta	%dl
	setb	%al
	movl	%edx, %ecx
	subb	%al, %cl
	movl	%ecx, %eax
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L12
	movl	$.LC15, (%esp)
	call	system
	movl	%eax, -28(%ebp)
	cmpl	$-1, -28(%ebp)
	jne	.L13
	movl	$.LC16, (%esp)
	call	puts
.L13:
	movl	$1, (%esp)
	call	exit
.L12:
	movl	$.LC6, %edx
	movl	4(%ebx), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -40(%ebp)
	cmpl	$0, -40(%ebp)
	jne	.L14
	movl	$.LC7, (%esp)
	call	puts
	movl	$.LC1, (%esp)
	call	puts
	movl	$1, (%esp)
	call	exit
.L22:
	movl	-60(%ebp), %edx
	movl	-32(%ebp), %eax
	movl	-40(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	fread
	movl	%eax, -56(%ebp)
	movl	-44(%ebp), %eax
	movl	-52(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, -64(%ebp)
	jmp	.L15
.L16:
	movl	-64(%ebp), %eax
	leal	1(%eax), %edx
	movl	-32(%ebp), %eax
	movzbl	(%eax,%edx), %eax
	movzbl	%al, %ecx
	movl	-32(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movl	-48(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	addl	$2, -64(%ebp)
.L15:
	movl	-64(%ebp), %eax
	cmpl	-60(%ebp), %eax
	jl	.L16
	movl	$9, (%esp)
	call	putchar
	movl	$0, -64(%ebp)
	jmp	.L17
.L21:
	movl	-32(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$31, %al
	jbe	.L18
	movl	-32(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jns	.L19
.L18:
	movl	$46, (%esp)
	call	putchar
	jmp	.L20
.L19:
	movl	-32(%ebp), %edx
	movl	-64(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	putchar
.L20:
	addl	$1, -64(%ebp)
.L17:
	movl	-64(%ebp), %eax
	cmpl	-60(%ebp), %eax
	jl	.L21
	movl	-60(%ebp), %eax
	addl	%eax, -52(%ebp)
.L14:
	cmpl	$0, -56(%ebp)
	jne	.L22
	movl	$.LC10, (%esp)
	call	puts
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	$0, %eax
	movl	-76(%ebp), %esp
	leal	-16(%ebp), %esp
	popl	%ecx
	.cfi_def_cfa 1, 0
	.cfi_restore 1
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
