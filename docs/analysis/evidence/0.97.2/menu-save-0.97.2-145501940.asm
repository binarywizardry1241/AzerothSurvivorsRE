
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145501940:     	pushq	%r15
145501942:     	pushq	%r14
145501944:     	pushq	%r13
145501946:     	pushq	%r12
145501948:     	pushq	%rsi
145501949:     	pushq	%rdi
14550194a:     	pushq	%rbp
14550194b:     	pushq	%rbx
14550194c:     	subq	$0x88, %rsp
145501953:     	movq	%rcx, 0x48(%rsp)
145501958:     	testq	%r8, %r8
14550195b:     	je	0x145501bab <.text+0x5500bab>
145501961:     	movq	%r8, %rsi
145501964:     	movq	%rdx, %rdi
145501967:     	xorl	%r12d, %r12d
14550196a:     	jmp	0x145501982 <.text+0x5500982>
14550196c:     	nopl	(%rax)
145501970:     	addq	%r13, %rdi
145501973:     	subq	%r13, %rsi
145501976:     	incq	%r12
145501979:     	testq	%rsi, %rsi
14550197c:     	je	0x145501bab <.text+0x5500bab>
145501982:     	cmpq	$0x14, %rsi
145501986:     	movl	$0x14, %r13d
14550198c:     	cmovbq	%rsi, %r13
145501990:     	movq	%r12, 0x50(%rsp)
145501995:     	leaq	0x14ac1f6(%rip), %rax   # 0x1469adb92
14550199c:     	movq	%rax, 0x58(%rsp)
1455019a1:     	movq	$0x2, 0x60(%rsp)
1455019aa:     	movq	0x48(%rsp), %rax
1455019af:     	movq	%rax, 0x68(%rsp)
1455019b4:     	movq	$0x10, 0x70(%rsp)
1455019bd:     	leaq	0x50(%rsp), %rax
1455019c2:     	movq	%rax, 0x78(%rsp)
1455019c7:     	movq	$0x8, 0x80(%rsp)
1455019d3:     	leaq	0x34(%rsp), %rcx
1455019d8:     	leaq	0x58(%rsp), %rdx
1455019dd:     	callq	0x145501bc0 <.text+0x5500bc0>
1455019e2:     	movzbl	0x34(%rsp), %r14d
1455019e8:     	movzbl	0x35(%rsp), %ebp
1455019ed:     	movzbl	0x36(%rsp), %r11d
1455019f3:     	movzbl	0x37(%rsp), %r10d
1455019f9:     	movzbl	0x38(%rsp), %r9d
1455019ff:     	movzbl	0x39(%rsp), %edx
145501a04:     	movzbl	0x3a(%rsp), %r8d
145501a0a:     	movzbl	0x3b(%rsp), %ecx
145501a0f:     	movzbl	0x3c(%rsp), %eax
145501a14:     	movzbl	0x3d(%rsp), %ebx
145501a19:     	movzbl	0x3e(%rsp), %r15d
145501a1f:     	movb	%r15b, 0x33(%rsp)
145501a24:     	movzbl	0x3f(%rsp), %r15d
145501a2a:     	movb	%r15b, 0x32(%rsp)
145501a2f:     	movzbl	0x40(%rsp), %r15d
145501a35:     	movb	%r15b, 0x31(%rsp)
145501a3a:     	movzbl	0x41(%rsp), %r15d
145501a40:     	movb	%r15b, 0x30(%rsp)
145501a45:     	movzbl	0x42(%rsp), %r15d
145501a4b:     	movb	%r15b, 0x2f(%rsp)
145501a50:     	movzbl	0x43(%rsp), %r15d
145501a56:     	movb	%r15b, 0x2e(%rsp)
145501a5b:     	movzbl	0x44(%rsp), %r15d
145501a61:     	movb	%r15b, 0x2d(%rsp)
145501a66:     	xorb	%r14b, (%rdi)
145501a69:     	movzbl	0x45(%rsp), %r15d
145501a6f:     	movzbl	0x46(%rsp), %r14d
145501a75:     	movb	%r14b, 0x2c(%rsp)
145501a7a:     	movzbl	0x47(%rsp), %r14d
145501a80:     	cmpq	$0x1, %rsi
145501a84:     	je	0x145501970 <.text+0x5500970>
145501a8a:     	xorb	%bpl, 0x1(%rdi)
145501a8e:     	cmpq	$0x2, %rsi
145501a92:     	je	0x145501970 <.text+0x5500970>
145501a98:     	xorb	%r11b, 0x2(%rdi)
145501a9c:     	cmpq	$0x3, %rsi
145501aa0:     	je	0x145501970 <.text+0x5500970>
145501aa6:     	xorb	%r10b, 0x3(%rdi)
145501aaa:     	cmpq	$0x4, %rsi
145501aae:     	je	0x145501970 <.text+0x5500970>
145501ab4:     	xorb	%r9b, 0x4(%rdi)
145501ab8:     	cmpq	$0x5, %rsi
145501abc:     	je	0x145501970 <.text+0x5500970>
145501ac2:     	xorb	%dl, 0x5(%rdi)
145501ac5:     	cmpq	$0x6, %rsi
145501ac9:     	je	0x145501970 <.text+0x5500970>
145501acf:     	xorb	%r8b, 0x6(%rdi)
145501ad3:     	cmpq	$0x7, %rsi
145501ad7:     	je	0x145501970 <.text+0x5500970>
145501add:     	xorb	%cl, 0x7(%rdi)
145501ae0:     	cmpq	$0x8, %rsi
145501ae4:     	je	0x145501970 <.text+0x5500970>
145501aea:     	xorb	%al, 0x8(%rdi)
145501aed:     	cmpq	$0x9, %rsi
145501af1:     	je	0x145501970 <.text+0x5500970>
145501af7:     	xorb	%bl, 0x9(%rdi)
145501afa:     	cmpq	$0xa, %rsi
145501afe:     	je	0x145501970 <.text+0x5500970>
145501b04:     	movzbl	0x33(%rsp), %eax
145501b09:     	xorb	%al, 0xa(%rdi)
145501b0c:     	cmpq	$0xb, %rsi
145501b10:     	je	0x145501970 <.text+0x5500970>
145501b16:     	movzbl	0x32(%rsp), %eax
145501b1b:     	xorb	%al, 0xb(%rdi)
145501b1e:     	cmpq	$0xc, %rsi
145501b22:     	je	0x145501970 <.text+0x5500970>
145501b28:     	movzbl	0x31(%rsp), %eax
145501b2d:     	xorb	%al, 0xc(%rdi)
145501b30:     	cmpq	$0xd, %rsi
145501b34:     	je	0x145501970 <.text+0x5500970>
145501b3a:     	movzbl	0x30(%rsp), %eax
145501b3f:     	xorb	%al, 0xd(%rdi)
145501b42:     	cmpq	$0xe, %rsi
145501b46:     	je	0x145501970 <.text+0x5500970>
145501b4c:     	movzbl	0x2f(%rsp), %eax
145501b51:     	xorb	%al, 0xe(%rdi)
145501b54:     	cmpq	$0xf, %rsi
145501b58:     	je	0x145501970 <.text+0x5500970>
145501b5e:     	movzbl	0x2e(%rsp), %eax
145501b63:     	xorb	%al, 0xf(%rdi)
145501b66:     	cmpq	$0x10, %rsi
145501b6a:     	je	0x145501970 <.text+0x5500970>
145501b70:     	movzbl	0x2d(%rsp), %eax
145501b75:     	xorb	%al, 0x10(%rdi)
145501b78:     	cmpq	$0x11, %rsi
145501b7c:     	je	0x145501970 <.text+0x5500970>
145501b82:     	xorb	%r15b, 0x11(%rdi)
145501b86:     	cmpq	$0x12, %rsi
145501b8a:     	je	0x145501970 <.text+0x5500970>
145501b90:     	movzbl	0x2c(%rsp), %eax
145501b95:     	xorb	%al, 0x12(%rdi)
145501b98:     	cmpq	$0x13, %rsi
145501b9c:     	je	0x145501970 <.text+0x5500970>
145501ba2:     	xorb	%r14b, 0x13(%rdi)
145501ba6:     	jmp	0x145501970 <.text+0x5500970>
145501bab:     	addq	$0x88, %rsp
145501bb2:     	popq	%rbx
145501bb3:     	popq	%rbp
145501bb4:     	popq	%rdi
145501bb5:     	popq	%rsi
145501bb6:     	popq	%r12
145501bb8:     	popq	%r13
145501bba:     	popq	%r14
145501bbc:     	popq	%r15
145501bbe:     	retq
