
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400909d0:     	pushq	%rbp
1400909d1:     	pushq	%r15
1400909d3:     	pushq	%r14
1400909d5:     	pushq	%r13
1400909d7:     	pushq	%r12
1400909d9:     	pushq	%rsi
1400909da:     	pushq	%rdi
1400909db:     	pushq	%rbx
1400909dc:     	subq	$0x208, %rsp            # imm = 0x208
1400909e3:     	leaq	0x80(%rsp), %rbp
1400909eb:     	movaps	%xmm7, 0x170(%rbp)
1400909f2:     	movaps	%xmm6, 0x160(%rbp)
1400909f9:     	movq	$-0x2, 0x158(%rbp)
140090a04:     	movq	0x1f8(%rbp), %rax
140090a0b:     	movq	0x1f0(%rbp), %rcx
140090a12:     	movq	(%rdx), %rdi
140090a15:     	movq	(%r9), %rdx
140090a18:     	movq	%rdx, 0xa0(%rbp)
140090a1f:     	movq	(%rcx), %r12
140090a22:     	movq	0x8(%rcx), %r15
140090a26:     	movl	0x10(%rcx), %r13d
140090a2a:     	movl	0x14(%rcx), %esi
140090a2d:     	movq	(%rax), %rcx
140090a30:     	movq	%rcx, 0xb0(%rbp)
140090a37:     	movq	0x8(%rax), %r14
140090a3b:     	movl	0x18(%rax), %eax
140090a3e:     	movl	%eax, 0x120(%rbp)
140090a44:     	leaq	0x60(%rdi), %rax
140090a48:     	movzbl	0x60(%rdi), %ecx
140090a4c:     	movb	%cl, 0x143(%rbp)
140090a52:     	cmpb	$-0x1, %cl
140090a55:     	movq	%r14, 0xa8(%rbp)
140090a5c:     	movq	%rax, 0x118(%rbp)
140090a63:     	je	0x140090a98 <.text+0x8fa98>
140090a65:     	movq	(%r8), %rbx
140090a68:     	leaq	0x58860d1(%rip), %rcx   # 0x145916b40
140090a6f:     	movl	$0xc, %edx
140090a74:     	movq	%rax, %r8
140090a77:     	callq	0x142affbe0 <.text+0x2afebe0>
140090a7c:     	testq	%rax, %rax
140090a7f:     	jne	0x140090a88 <.text+0x8fa88>
140090a81:     	movq	0x797cd30(%rip), %rax   # 0x147a0d7b8
140090a88:     	cmpb	$0x2, (%rax)
140090a8b:     	jne	0x140090a98 <.text+0x8fa98>
140090a8d:     	cmpq	$0x0, 0x8(%rax)
140090a92:     	je	0x140090d22 <.text+0x8fd22>
140090a98:     	movq	$0x0, 0x110(%rbp)
140090aa3:     	movl	$0x0, 0x144(%rbp)
140090aad:     	movl	%esi, 0x20(%rsp)
140090ab1:     	leaq	-0x50(%rbp), %rcx
140090ab5:     	movq	%r15, %rdx
140090ab8:     	movq	%r12, %r8
140090abb:     	movl	%r13d, %r9d
140090abe:     	callq	0x140044a40 <.text+0x43a40>
140090ac3:     	movq	-0x50(%rbp), %rcx
140090ac7:     	movq	-0x48(%rbp), %rdx
140090acb:     	movq	-0x20(%rbp), %rax
140090acf:     	movq	%rax, 0x138(%rbp)
140090ad6:     	movq	-0x10(%rbp), %rax
140090ada:     	movq	%rax, 0x128(%rbp)
140090ae1:     	movl	-0x4(%rbp), %eax
140090ae4:     	movl	%eax, 0xec(%rbp)
140090aea:     	movq	(%rbp), %rax
140090aee:     	movq	%rax, 0x108(%rbp)
140090af5:     	movq	0x10(%rbp), %rax
140090af9:     	movq	%rax, 0x100(%rbp)
140090b00:     	movl	0x1c(%rbp), %eax
140090b03:     	movl	%eax, 0xf0(%rbp)
140090b09:     	movq	0x20(%rbp), %r9
140090b0d:     	movq	0x30(%rbp), %r13
140090b11:     	movl	0x3c(%rbp), %eax
140090b14:     	movl	%eax, 0xe8(%rbp)
140090b1a:     	movq	0x40(%rbp), %r14
140090b1e:     	movq	0x50(%rbp), %r10
140090b22:     	movzbl	0x90(%rbp), %esi
140090b29:     	movl	0x5c(%rbp), %eax
140090b2c:     	movl	%eax, 0xf4(%rbp)
140090b32:     	movq	0x60(%rbp), %rax
140090b36:     	movq	%rax, 0x148(%rbp)
140090b3d:     	movq	0x68(%rbp), %rdi
140090b41:     	movq	0x78(%rbp), %r8
140090b45:     	movl	0x84(%rbp), %ebx
140090b4b:     	movl	0x88(%rbp), %r11d
140090b52:     	movl	0x8c(%rbp), %eax
140090b58:     	movb	%sil, 0x134(%rbp)
140090b5f:     	testb	$0x1, %sil
140090b63:     	je	0x140090c05 <.text+0x8fc05>
140090b69:     	cmpl	%r11d, %eax
140090b6c:     	jne	0x140090d0b <.text+0x8fd0b>
140090b72:     	nopw	%cs:(%rax,%rax)
140090b80:     	cmpq	%rdx, %rcx
140090b83:     	je	0x140090cbb <.text+0x8fcbb>
140090b89:     	movl	(%rcx), %r8d
140090b8c:     	addq	$0x4, %rcx
140090b90:     	movq	0x1a8(%r15), %rax
140090b97:     	leaq	(%r8,%r8,8), %r8
140090b9b:     	movq	0x10(%rax,%r8,8), %rsi
140090ba0:     	testq	%rsi, %rsi
140090ba3:     	je	0x140090b80 <.text+0x8fb80>
140090ba5:     	leaq	(%rax,%r8,8), %rdi
140090ba9:     	movq	0x18(%rdi), %r8
140090bad:     	movq	0x38(%rdi), %r11
140090bb1:     	movq	0x110(%r12), %rax
140090bb9:     	movq	0x118(%r12), %r10
140090bc1:     	movq	(%r11,%rax,8), %rax
140090bc5:     	notq	%rax
140090bc8:     	leaq	(%rax,%rax,2), %r9
140090bcc:     	shlq	$0x4, %r9
140090bd0:     	xorl	%eax, %eax
140090bd2:     	cmpq	0x40(%rdi), %r10
140090bd6:     	jae	0x140090d6e <.text+0x8fd6e>
140090bdc:     	movq	(%r11,%r10,8), %r10
140090be0:     	testq	%r10, %r10
140090be3:     	je	0x140090d6e <.text+0x8fd6e>
140090be9:     	notq	%r10
140090bec:     	leaq	(%r10,%r10,2), %r10
140090bf0:     	shlq	$0x4, %r10
140090bf4:     	movq	0x10(%r8,%r10), %r10
140090bf9:     	movq	%r10, 0x148(%rbp)
140090c00:     	jmp	0x140090d79 <.text+0x8fd79>
140090c05:     	movl	%ebx, 0x124(%rbp)
140090c0b:     	cmpl	%r11d, %eax
140090c0e:     	jne	0x140090d19 <.text+0x8fd19>
140090c14:     	nopw	%cs:(%rax,%rax)
140090c20:     	cmpq	%rdx, %rcx
140090c23:     	je	0x140090cbb <.text+0x8fcbb>
140090c29:     	movl	(%rcx), %eax
140090c2b:     	addq	$0x4, %rcx
140090c2f:     	movq	0x108(%r15), %rsi
140090c36:     	leaq	(%rax,%rax,4), %rax
140090c3a:     	shlq	$0x5, %rax
140090c3e:     	movq	0x58(%rsi,%rax), %rbx
140090c43:     	testq	%rbx, %rbx
140090c46:     	je	0x140090c20 <.text+0x8fc20>
140090c48:     	addq	%rax, %rsi
140090c4b:     	movl	0x94(%rsi), %eax
140090c51:     	movq	0x1a8(%r15), %rdi
140090c58:     	leaq	(%rax,%rax,8), %r14
140090c5c:     	movq	0x18(%rdi,%r14,8), %r8
140090c61:     	movq	0x38(%rdi,%r14,8), %r11
140090c66:     	movq	0x110(%r12), %rax
140090c6e:     	movq	0x118(%r12), %r10
140090c76:     	movq	(%r11,%rax,8), %rax
140090c7a:     	notq	%rax
140090c7d:     	leaq	(%rax,%rax,2), %r9
140090c81:     	shlq	$0x4, %r9
140090c85:     	xorl	%eax, %eax
140090c87:     	cmpq	0x40(%rdi,%r14,8), %r10
140090c8c:     	jae	0x140090e34 <.text+0x8fe34>
140090c92:     	movq	(%r11,%r10,8), %r10
140090c96:     	testq	%r10, %r10
140090c99:     	je	0x140090e34 <.text+0x8fe34>
140090c9f:     	notq	%r10
140090ca2:     	leaq	(%r10,%r10,2), %r10
140090ca6:     	shlq	$0x4, %r10
140090caa:     	movq	0x10(%r8,%r10), %r10
140090caf:     	movq	%r10, 0x148(%rbp)
140090cb6:     	jmp	0x140090e3f <.text+0x8fe3f>
140090cbb:     	xorl	%ebx, %ebx
140090cbd:     	movl	%r11d, %r8d
140090cc0:     	testb	$0x1, 0x134(%rbp)
140090cc7:     	jne	0x140090f82 <.text+0x8ff82>
140090ccd:     	cmpl	%r8d, %r11d
140090cd0:     	jne	0x140091855 <.text+0x90855>
140090cd6:     	nopw	%cs:(%rax,%rax)
140090ce0:     	cmpq	%rdx, %rcx
140090ce3:     	je	0x140090fb3 <.text+0x8ffb3>
140090ce9:     	movl	(%rcx), %eax
140090ceb:     	addq	$0x4, %rcx
140090cef:     	movq	0x108(%r15), %r8
140090cf6:     	leaq	(%rax,%rax,4), %rax
140090cfa:     	shlq	$0x5, %rax
140090cfe:     	cmpq	$0x0, 0x58(%r8,%rax)
140090d04:     	je	0x140090ce0 <.text+0x8fce0>
140090d06:     	jmp	0x140091855 <.text+0x90855>
140090d0b:     	movl	%ebx, 0x124(%rbp)
140090d11:     	movl	%eax, %r12d
140090d14:     	jmp	0x140090efe <.text+0x8fefe>
140090d19:     	movq	-0x30(%rbp), %rsi
140090d1d:     	jmp	0x140090ef0 <.text+0x8fef0>
140090d22:     	movq	0x10(%rax), %rcx
140090d26:     	movq	%rcx, 0x110(%rbp)
140090d2d:     	testq	%rcx, %rcx
140090d30:     	je	0x140090aa3 <.text+0x8faa3>
140090d36:     	cmpb	$0x0, 0x7(%rbx)
140090d3a:     	je	0x140090aa3 <.text+0x8faa3>
140090d40:     	cmpb	$-0x1, 0x80(%rdi)
140090d47:     	jne	0x140090aa3 <.text+0x8faa3>
140090d4d:     	cmpb	$-0x1, 0xa0(%rdi)
140090d54:     	jne	0x140090aa3 <.text+0x8faa3>
140090d5a:     	movzbl	0xea(%rdi), %eax
140090d61:     	xorb	$0x1, %al
140090d63:     	movl	%eax, 0x144(%rbp)
140090d69:     	jmp	0x140090aad <.text+0x8faad>
140090d6e:     	movq	$0x0, 0x148(%rbp)
140090d79:     	movl	%ebx, 0x124(%rbp)
140090d7f:     	movq	0x10(%r8,%r9), %r10
140090d84:     	movq	%r10, 0x138(%rbp)
140090d8b:     	movq	0x28(%r8,%r9), %r9
140090d90:     	movq	%r9, 0x128(%rbp)
140090d97:     	movq	0x120(%r12), %r9
140090d9f:     	movq	0x128(%r12), %r10
140090da7:     	movq	(%r11,%r9,8), %r9
140090dab:     	notq	%r9
140090dae:     	leaq	(%r9,%r9,2), %r9
140090db2:     	shlq	$0x4, %r9
140090db6:     	movq	0x10(%r8,%r9), %rdi
140090dbb:     	movq	%rdi, 0x108(%rbp)
140090dc2:     	movq	0x28(%r8,%r9), %r9
140090dc7:     	movq	%r9, 0x100(%rbp)
140090dce:     	movq	(%r11,%r10,8), %r9
140090dd2:     	notq	%r9
140090dd5:     	leaq	(%r9,%r9,2), %r10
140090dd9:     	shlq	$0x4, %r10
140090ddd:     	movq	0x10(%r8,%r10), %r9
140090de2:     	movq	0x28(%r8,%r10), %r13
140090de7:     	movq	0x130(%r12), %r10
140090def:     	movq	(%r11,%r10,8), %r10
140090df3:     	notq	%r10
140090df6:     	leaq	(%r10,%r10,2), %r10
140090dfa:     	shlq	$0x4, %r10
140090dfe:     	movq	0x10(%r8,%r10), %r14
140090e03:     	movq	0x28(%r8,%r10), %r10
140090e08:     	movq	0x138(%r12), %rdi
140090e10:     	movq	(%r11,%rdi,8), %r11
140090e14:     	notq	%r11
140090e17:     	leaq	(%r11,%r11,2), %r11
140090e1b:     	shlq	$0x4, %r11
140090e1f:     	movq	0x10(%r8,%r11), %rdi
140090e24:     	movq	0x28(%r8,%r11), %r8
140090e29:     	movl	%esi, %r11d
140090e2c:     	movl	%eax, %r12d
140090e2f:     	jmp	0x140090efe <.text+0x8fefe>
140090e34:     	movq	$0x0, 0x148(%rbp)
140090e3f:     	movq	0x10(%r8,%r9), %r10
140090e44:     	movq	%r10, 0x138(%rbp)
140090e4b:     	movq	0x28(%r8,%r9), %r9
140090e50:     	movq	%r9, 0x128(%rbp)
140090e57:     	movq	0x120(%r12), %r9
140090e5f:     	movq	0x128(%r12), %r10
140090e67:     	movq	(%r11,%r9,8), %r9
140090e6b:     	notq	%r9
140090e6e:     	leaq	(%r9,%r9,2), %r9
140090e72:     	shlq	$0x4, %r9
140090e76:     	movq	0x10(%r8,%r9), %rdi
140090e7b:     	movq	%rdi, 0x108(%rbp)
140090e82:     	movq	0x28(%r8,%r9), %r9
140090e87:     	movq	%r9, 0x100(%rbp)
140090e8e:     	movq	(%r11,%r10,8), %r9
140090e92:     	notq	%r9
140090e95:     	leaq	(%r9,%r9,2), %r10
140090e99:     	shlq	$0x4, %r10
140090e9d:     	movq	0x10(%r8,%r10), %r9
140090ea2:     	movq	0x28(%r8,%r10), %r13
140090ea7:     	movq	0x130(%r12), %r10
140090eaf:     	movq	(%r11,%r10,8), %r10
140090eb3:     	notq	%r10
140090eb6:     	leaq	(%r10,%r10,2), %r10
140090eba:     	shlq	$0x4, %r10
140090ebe:     	movq	0x10(%r8,%r10), %r14
140090ec3:     	movq	0x28(%r8,%r10), %r10
140090ec8:     	movq	0x138(%r12), %rdi
140090ed0:     	movq	(%r11,%rdi,8), %r11
140090ed4:     	notq	%r11
140090ed7:     	leaq	(%r11,%r11,2), %r11
140090edb:     	shlq	$0x4, %r11
140090edf:     	movq	0x10(%r8,%r11), %rdi
140090ee4:     	movq	0x28(%r8,%r11), %r8
140090ee9:     	movq	0x50(%rsi), %rsi
140090eed:     	movl	%ebx, %r11d
140090ef0:     	movl	%eax, %ebx
140090ef2:     	shlq	$0x4, %rbx
140090ef6:     	movl	0x8(%rsi,%rbx), %r12d
140090efb:     	notl	%r12d
140090efe:     	leaq	(%r12,%r12,2), %rsi
140090f02:     	leaq	(%r14,%rsi,8), %rbx
140090f06:     	movq	%rbx, 0xf8(%rbp)
140090f0d:     	shlq	$0x7, %rsi
140090f11:     	addq	0x108(%rbp), %rsi
140090f18:     	leaq	(%r12,%r12,4), %r14
140090f1c:     	shlq	$0x4, %r14
140090f20:     	addq	%r9, %r14
140090f23:     	movq	0x138(%rbp), %r9
140090f2a:     	leaq	(%r9,%r12,4), %rbx
140090f2e:     	movq	0x128(%rbp), %r9
140090f35:     	leaq	(%r9,%r12,4), %r9
140090f39:     	movq	%r9, 0x138(%rbp)
140090f40:     	addq	%r12, 0x148(%rbp)
140090f47:     	movq	0x100(%rbp), %r9
140090f4e:     	leaq	(%r9,%r12,4), %r9
140090f52:     	leaq	(%r13,%r12,4), %r13
140090f57:     	leaq	(%r10,%r12,4), %r10
140090f5b:     	movq	%r10, 0x128(%rbp)
140090f62:     	leaq	(%r8,%r12,4), %r10
140090f66:     	shlq	$0x5, %r12
140090f6a:     	addq	%rdi, %r12
140090f6d:     	movl	%r11d, %r8d
140090f70:     	incl	%eax
140090f72:     	movl	%eax, %r11d
140090f75:     	testb	$0x1, 0x134(%rbp)
140090f7c:     	je	0x140090ccd <.text+0x8fccd>
140090f82:     	cmpl	%r8d, %r11d
140090f85:     	jne	0x140091855 <.text+0x90855>
140090f8b:     	nopl	(%rax,%rax)
140090f90:     	cmpq	%rdx, %rcx
140090f93:     	je	0x140090fb3 <.text+0x8ffb3>
140090f95:     	movl	(%rcx), %eax
140090f97:     	addq	$0x4, %rcx
140090f9b:     	movq	0x1a8(%r15), %r8
140090fa2:     	leaq	(%rax,%rax,8), %rax
140090fa6:     	cmpq	$0x0, 0x10(%r8,%rax,8)
140090fac:     	je	0x140090f90 <.text+0x8ff90>
140090fae:     	jmp	0x140091855 <.text+0x90855>
140090fb3:     	testq	%rbx, %rbx
140090fb6:     	je	0x140091855 <.text+0x90855>
140090fbc:     	xorl	%eax, %eax
140090fbe:     	movl	0x144(%rbp), %ecx
140090fc4:     	testb	%cl, %cl
140090fc6:     	sete	%al
140090fc9:     	leal	(%rax,%rax,2), %eax
140090fcc:     	cmpb	%al, 0x175(%rsi)
140090fd2:     	je	0x140090fe3 <.text+0x8ffe3>
140090fd4:     	movl	0xf0(%rbp), %edx
140090fda:     	movl	%edx, (%r9)
140090fdd:     	movb	%al, 0x175(%rsi)
140090fe3:     	testb	%cl, %cl
140090fe5:     	je	0x140091855 <.text+0x90855>
140090feb:     	movq	%r10, %rsi
140090fee:     	movq	0x148(%rbp), %rax
140090ff5:     	cmpb	$0x2, (%rax)
140090ff8:     	xorps	%xmm0, %xmm0
140090ffb:     	movss	0x587648d(%rip), %xmm1  # 0x145907490
140091003:     	je	0x140091008 <.text+0x90008>
140091005:     	movaps	%xmm1, %xmm0
140091008:     	subss	(%rbx), %xmm0
14009100c:     	movq	0xa0(%rbp), %rax
140091013:     	movss	0x58(%rax), %xmm7
140091018:     	mulss	0x5884898(%rip), %xmm7  # 0x1459158b8
140091020:     	minss	%xmm1, %xmm7
140091024:     	mulss	%xmm0, %xmm7
140091028:     	movl	0xec(%rbp), %ecx
14009102e:     	movq	0x138(%rbp), %r8
140091035:     	movl	%ecx, (%r8)
140091038:     	addss	(%rbx), %xmm7
14009103c:     	movss	%xmm7, (%rbx)
140091040:     	movss	0x5c(%rax), %xmm0
140091045:     	mulss	0x588486f(%rip), %xmm0  # 0x1459158bc
14009104d:     	callq	0x145773235 <.text+0x5772235>
140091052:     	movaps	%xmm0, %xmm6
140091055:     	movss	0x587643b(%rip), %xmm0  # 0x145907498
14009105d:     	mulss	%xmm0, %xmm6
140091061:     	addss	%xmm0, %xmm6
140091065:     	movss	0x58764ab(%rip), %xmm0  # 0x145907518
14009106d:     	mulss	%xmm6, %xmm0
140091071:     	movaps	%xmm7, %xmm1
140091074:     	maxss	%xmm0, %xmm1
140091078:     	movaps	%xmm1, %xmm3
14009107b:     	cmpunordss	%xmm1, %xmm3
140091080:     	andps	%xmm3, %xmm7
140091083:     	andnps	%xmm1, %xmm3
140091086:     	orps	%xmm7, %xmm3
140091089:     	leaq	0x5885abc(%rip), %rdx   # 0x145916b4c
140091090:     	leaq	0x5885ac9(%rip), %r8    # 0x145916b60
140091097:     	leaq	0xd0(%rbp), %rcx
14009109e:     	callq	0x144c93240 <.text+0x4c92240>
1400910a3:     	movl	0xe0(%rbp), %eax
1400910a9:     	movl	%eax, -0x40(%rbp)
1400910ac:     	movups	0xd0(%rbp), %xmm0
1400910b3:     	movaps	%xmm0, -0x50(%rbp)
1400910b7:     	movups	%xmm0, -0x3c(%rbp)
1400910bb:     	movl	%eax, -0x2c(%rbp)
1400910be:     	movups	%xmm0, -0x28(%rbp)
1400910c2:     	movl	%eax, -0x18(%rbp)
1400910c5:     	movups	%xmm0, -0x14(%rbp)
1400910c9:     	movl	%eax, -0x4(%rbp)
1400910cc:     	movl	0xe8(%rbp), %eax
1400910d2:     	movl	%eax, (%r13)
1400910d6:     	movaps	-0x10(%rbp), %xmm0
1400910da:     	movups	%xmm0, 0x40(%r14)
1400910df:     	movaps	-0x50(%rbp), %xmm0
1400910e3:     	movaps	-0x40(%rbp), %xmm1
1400910e7:     	movaps	-0x30(%rbp), %xmm2
1400910eb:     	movaps	-0x20(%rbp), %xmm3
1400910ef:     	movups	%xmm3, 0x30(%r14)
1400910f4:     	movups	%xmm2, 0x20(%r14)
1400910f9:     	movups	%xmm1, 0x10(%r14)
1400910fe:     	movups	%xmm0, (%r14)
140091102:     	callq	0x140002200 <.text+0x1200>
140091107:     	movl	$0x68, %ecx
14009110c:     	movl	$0x4, %edx
140091111:     	callq	0x1400021c0 <.text+0x11c0>
140091116:     	movq	%rax, 0x148(%rbp)
14009111d:     	testq	%rax, %rax
140091120:     	je	0x140091877 <.text+0x90877>
140091126:     	movaps	0x5884793(%rip), %xmm0  # 0x1459158c0
14009112d:     	movups	%xmm0, -0x4c(%rbp)
140091131:     	movl	$0x0, -0x50(%rbp)
140091138:     	leaq	0xd0(%rbp), %rcx
14009113f:     	leaq	-0x50(%rbp), %rdx
140091143:     	callq	0x144c8c290 <.text+0x4c8b290>
140091148:     	nop
140091149:     	mulss	0x587848f(%rip), %xmm6  # 0x1459095e0
140091151:     	addss	0x58763c3(%rip), %xmm6  # 0x14590751c
140091159:     	movaps	0xd0(%rbp), %xmm7
140091160:     	movss	(%rbx), %xmm0
140091164:     	mulss	0x5884764(%rip), %xmm0  # 0x1459158d0
14009116c:     	addss	%xmm6, %xmm0
140091170:     	movups	0x58859fd(%rip), %xmm1  # 0x145916b74
140091177:     	movaps	%xmm1, -0x50(%rbp)
14009117b:     	movss	%xmm0, -0x40(%rbp)
140091180:     	leaq	0xd0(%rbp), %r15
140091187:     	leaq	-0x50(%rbp), %rdx
14009118b:     	movq	%r15, %rcx
14009118e:     	callq	0x144c8c290 <.text+0x4c8b290>
140091193:     	nop
140091194:     	movss	(%rbx), %xmm0
140091198:     	mulss	0x5884734(%rip), %xmm0  # 0x1459158d4
1400911a0:     	movaps	0xd0(%rbp), %xmm1
1400911a7:     	addss	0x5884729(%rip), %xmm0  # 0x1459158d8
1400911af:     	movaps	0x588472a(%rip), %xmm2  # 0x1459158e0
1400911b6:     	movq	0x148(%rbp), %rdi
1400911bd:     	movups	%xmm2, (%rdi)
1400911c0:     	movaps	0x5884729(%rip), %xmm2  # 0x1459158f0
1400911c7:     	movups	%xmm2, 0x10(%rdi)
1400911cb:     	movl	$0x1, 0x20(%rdi)
1400911d2:     	movups	%xmm7, 0x24(%rdi)
1400911d6:     	movaps	0x5884723(%rip), %xmm2  # 0x145915900
1400911dd:     	movups	%xmm2, 0x34(%rdi)
1400911e1:     	movabsq	$0x3f80000000000001, %rax # imm = 0x3F80000000000001
1400911eb:     	movq	%rax, 0x44(%rdi)
1400911ef:     	movl	$0x1, 0x4c(%rdi)
1400911f6:     	movss	%xmm0, 0x50(%rdi)
1400911fb:     	movl	$0x1, 0x54(%rdi)
140091202:     	movups	%xmm1, 0x58(%rdi)
140091206:     	movl	0xf4(%rbp), %eax
14009120c:     	movq	0x128(%rbp), %rcx
140091213:     	movl	%eax, (%rcx)
140091215:     	movq	0xf8(%rbp), %rcx
14009121c:     	movq	(%rcx), %rax
14009121f:     	testq	%rax, %rax
140091222:     	je	0x14009123e <.text+0x9023e>
140091224:     	movq	0x8(%rcx), %rcx
140091228:     	imulq	$0x34, %rax, %rdx
14009122c:     	movl	$0x4, %r8d
140091232:     	callq	0x1400021d0 <.text+0x11d0>
140091237:     	movq	0xf8(%rbp), %rcx
14009123e:     	movq	$0x2, (%rcx)
140091245:     	movq	%rdi, 0x8(%rcx)
140091249:     	movq	$0x2, 0x10(%rcx)
140091251:     	movss	(%rbx), %xmm0
140091255:     	mulss	0x58846b3(%rip), %xmm0  # 0x145915910
14009125d:     	movl	0x124(%rbp), %eax
140091263:     	movl	%eax, (%rsi)
140091265:     	movq	$0x1, (%r12)
14009126d:     	movl	$0x1, 0x8(%r12)
140091276:     	movss	%xmm0, 0xc(%r12)
14009127d:     	movss	(%rbx), %xmm0
140091281:     	mulss	0x588468b(%rip), %xmm0  # 0x145915914
140091289:     	addss	0x58761ff(%rip), %xmm0  # 0x145907490
140091291:     	movl	%eax, (%rsi)
140091293:     	movss	%xmm0, 0x10(%r12)
14009129a:     	movss	%xmm0, 0x14(%r12)
1400912a1:     	leaq	-0x50(%rbp), %rdx
1400912a5:     	movl	$0x14, %r8d
1400912ab:     	movq	0x110(%rbp), %rcx
1400912b2:     	callq	0x14572f900 <.text+0x572e900>
1400912b7:     	movq	%rdx, %rsi
1400912ba:     	testq	%rdx, %rdx
1400912bd:     	jns	0x1400912cf <.text+0x902cf>
1400912bf:     	xorl	%r12d, %r12d
1400912c2:     	movq	%r12, %rcx
1400912c5:     	movq	%rsi, %rdx
1400912c8:     	callq	0x14590379b <.text+0x590279b>
1400912cd:     	ud2
1400912cf:     	movq	%rsi, 0x148(%rbp)
1400912d6:     	je	0x14009130f <.text+0x9030f>
1400912d8:     	movq	%rax, %r14
1400912db:     	callq	0x140002200 <.text+0x1200>
1400912e0:     	movl	$0x1, %r12d
1400912e6:     	movl	$0x1, %edx
1400912eb:     	movq	%rsi, %rcx
1400912ee:     	callq	0x1400021c0 <.text+0x11c0>
1400912f3:     	testq	%rax, %rax
1400912f6:     	je	0x1400912c2 <.text+0x902c2>
1400912f8:     	movq	%rax, 0x138(%rbp)
1400912ff:     	movq	%rax, %rcx
140091302:     	movq	%r14, %rdx
140091305:     	movq	%rsi, %r8
140091308:     	callq	0x1457731ed <.text+0x57721ed>
14009130d:     	jmp	0x14009131b <.text+0x9031b>
14009130f:     	movl	$0x1, %eax
140091314:     	movq	%rax, 0x138(%rbp)
14009131b:     	movb	$0x1, 0x157(%rbp)
140091322:     	movq	0xb0(%rbp), %r12
140091329:     	movq	%r12, %rcx
14009132c:     	movq	0xa8(%rbp), %r14
140091333:     	movq	%r14, %rdx
140091336:     	callq	0x14036aed0 <.text+0x369ed0>
14009133b:     	nop
14009133c:     	movq	0xf8(%r12), %rcx
140091344:     	movq	0x100(%r12), %rdx
14009134c:     	movzbl	0x108(%r12), %r8d
140091355:     	leaq	(,%rdx,4), %r10
14009135d:     	movq	%rcx, %rax
140091360:     	testb	%r8b, %r8b
140091363:     	je	0x1400913d0 <.text+0x903d0>
140091365:     	nopw	%cs:(%rax,%rax)
140091370:     	testq	%r10, %r10
140091373:     	je	0x14009145b <.text+0x9045b>
140091379:     	movl	(%rax), %r9d
14009137c:     	addq	$0x4, %rax
140091380:     	movq	0x1a8(%r14), %r11
140091387:     	leaq	(%r9,%r9,8), %rsi
14009138b:     	movq	0x10(%r11,%rsi,8), %r9
140091390:     	addq	$-0x4, %r10
140091394:     	testq	%r9, %r9
140091397:     	je	0x140091370 <.text+0x90370>
140091399:     	leaq	(%r11,%rsi,8), %r10
14009139d:     	movq	0x110(%r12), %r11
1400913a5:     	movq	0x18(%r10), %rdi
1400913a9:     	movq	0x38(%r10), %r10
1400913ad:     	movq	(%r10,%r11,8), %r10
1400913b1:     	notq	%r10
1400913b4:     	leaq	(%r10,%r10,2), %r10
1400913b8:     	shlq	$0x4, %r10
1400913bc:     	movq	0x10(%rdi,%r10), %rsi
1400913c1:     	movq	0x28(%rdi,%r10), %rdi
1400913c6:     	jmp	0x140091453 <.text+0x90453>
1400913cb:     	nopl	(%rax,%rax)
1400913d0:     	testq	%r10, %r10
1400913d3:     	je	0x14009145b <.text+0x9045b>
1400913d9:     	movl	(%rax), %r9d
1400913dc:     	addq	$0x4, %rax
1400913e0:     	movq	0x108(%r14), %r11
1400913e7:     	leaq	(%r9,%r9,4), %rsi
1400913eb:     	shlq	$0x5, %rsi
1400913ef:     	movq	0x58(%r11,%rsi), %r9
1400913f4:     	addq	$-0x4, %r10
1400913f8:     	testq	%r9, %r9
1400913fb:     	je	0x1400913d0 <.text+0x903d0>
1400913fd:     	addq	%rsi, %r11
140091400:     	movl	0x94(%r11), %r10d
140091407:     	movq	0x1a8(%r14), %rsi
14009140e:     	leaq	(%r10,%r10,8), %r10
140091412:     	movq	0x110(%r12), %rdi
14009141a:     	movq	0x18(%rsi,%r10,8), %rbx
14009141f:     	movq	0x38(%rsi,%r10,8), %r10
140091424:     	movq	(%r10,%rdi,8), %r10
140091428:     	notq	%r10
14009142b:     	movq	0x50(%r11), %r11
14009142f:     	movl	0x8(%r11), %edi
140091433:     	leaq	(%r10,%r10,2), %r10
140091437:     	shlq	$0x4, %r10
14009143b:     	notl	%edi
14009143d:     	leaq	(%rdi,%rdi,2), %rsi
140091441:     	shlq	$0x3, %rsi
140091445:     	addq	0x10(%rbx,%r10), %rsi
14009144a:     	shlq	$0x2, %rdi
14009144e:     	addq	0x28(%rbx,%r10), %rdi
140091453:     	movl	$0x1, %r10d
140091459:     	jmp	0x140091463 <.text+0x90463>
14009145b:     	xorl	%r9d, %r9d
14009145e:     	xorl	%r10d, %r10d
140091461:     	xorl	%esi, %esi
140091463:     	leaq	(%rcx,%rdx,4), %rcx
140091467:     	movb	$0x1, %r13b
14009146a:     	testb	%r8b, %r8b
14009146d:     	je	0x14009149e <.text+0x9049e>
14009146f:     	cmpl	%r9d, %r10d
140091472:     	jne	0x1400914d1 <.text+0x904d1>
140091474:     	movq	0x118(%rbp), %r9
14009147b:     	cmpq	%rcx, %rax
14009147e:     	je	0x1400914da <.text+0x904da>
140091480:     	movl	(%rax), %edx
140091482:     	addq	$0x4, %rax
140091486:     	movq	0x1a8(%r14), %r8
14009148d:     	leaq	(%rdx,%rdx,8), %rdx
140091491:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
140091497:     	je	0x14009147b <.text+0x9047b>
140091499:     	jmp	0x140091551 <.text+0x90551>
14009149e:     	cmpl	%r9d, %r10d
1400914a1:     	jne	0x1400914d1 <.text+0x904d1>
1400914a3:     	movq	0x118(%rbp), %r9
1400914aa:     	cmpq	%rcx, %rax
1400914ad:     	je	0x1400914da <.text+0x904da>
1400914af:     	movl	(%rax), %edx
1400914b1:     	addq	$0x4, %rax
1400914b5:     	movq	0x108(%r14), %r8
1400914bc:     	leaq	(%rdx,%rdx,4), %rdx
1400914c0:     	shlq	$0x5, %rdx
1400914c4:     	cmpq	$0x0, 0x58(%r8,%rdx)
1400914ca:     	je	0x1400914aa <.text+0x904aa>
1400914cc:     	jmp	0x140091551 <.text+0x90551>
1400914d1:     	movq	0x118(%rbp), %r9
1400914d8:     	jmp	0x140091551 <.text+0x90551>
1400914da:     	movb	$0x1, %r13b
1400914dd:     	testq	%rsi, %rsi
1400914e0:     	je	0x140091551 <.text+0x90551>
1400914e2:     	movq	0x148(%rbp), %rax
1400914e9:     	cmpq	%rax, 0x10(%rsi)
1400914ed:     	jne	0x140091510 <.text+0x90510>
1400914ef:     	movq	0x8(%rsi), %rcx
1400914f3:     	movq	0x138(%rbp), %rdx
1400914fa:     	movq	0x148(%rbp), %r8
140091501:     	movq	%r9, %rbx
140091504:     	callq	0x1457731e7 <.text+0x57721e7>
140091509:     	movq	%rbx, %r9
14009150c:     	testl	%eax, %eax
14009150e:     	je	0x140091551 <.text+0x90551>
140091510:     	movl	0x120(%rbp), %eax
140091516:     	movl	%eax, (%rdi)
140091518:     	movq	(%rsi), %rdx
14009151b:     	testq	%rdx, %rdx
14009151e:     	je	0x140091535 <.text+0x90535>
140091520:     	movq	0x8(%rsi), %rcx
140091524:     	movl	$0x1, %r8d
14009152a:     	movq	%r9, %rdi
14009152d:     	callq	0x1400021d0 <.text+0x11d0>
140091532:     	movq	%rdi, %r9
140091535:     	movq	0x148(%rbp), %rax
14009153c:     	movq	%rax, (%rsi)
14009153f:     	movq	0x138(%rbp), %rcx
140091546:     	movq	%rcx, 0x8(%rsi)
14009154a:     	movq	%rax, 0x10(%rsi)
14009154e:     	xorl	%r13d, %r13d
140091551:     	movl	$0x1, %esi
140091556:     	cmpb	$-0x1, 0x143(%rbp)
14009155d:     	je	0x140091597 <.text+0x90597>
14009155f:     	movb	%r13b, 0x157(%rbp)
140091566:     	leaq	0x58852a0(%rip), %rcx   # 0x14591680d
14009156d:     	movl	$0x5, %edx
140091572:     	movq	%r9, %r8
140091575:     	callq	0x142affbe0 <.text+0x2afebe0>
14009157a:     	nop
14009157b:     	testq	%rax, %rax
14009157e:     	jne	0x140091587 <.text+0x90587>
140091580:     	movq	0x797c231(%rip), %rax   # 0x147a0d7b8
140091587:     	cmpb	$0x2, (%rax)
14009158a:     	jne	0x140091597 <.text+0x90597>
14009158c:     	cmpq	$0x0, 0x8(%rax)
140091591:     	jne	0x140091597 <.text+0x90597>
140091593:     	movq	0x10(%rax), %rsi
140091597:     	movq	%rsi, 0xd0(%rbp)
14009159e:     	movb	%r13b, 0x157(%rbp)
1400915a5:     	leaq	0x58855dc(%rip), %rcx   # 0x145916b88
1400915ac:     	movl	$0x9, %edx
1400915b1:     	callq	0x145457c00 <.text+0x5456c00>
1400915b6:     	nop
1400915b7:     	movq	%rdx, %r8
1400915ba:     	leaq	0x58855f7(%rip), %rcx   # 0x145916bb8
1400915c1:     	movq	%rcx, -0x50(%rbp)
1400915c5:     	movq	$0x1, -0x48(%rbp)
1400915cd:     	movq	%r15, -0x40(%rbp)
1400915d1:     	leaq	0x58855c0(%rip), %rcx   # 0x145916b98
1400915d8:     	movq	%rcx, -0x38(%rbp)
1400915dc:     	movb	%r13b, 0x157(%rbp)
1400915e3:     	movq	$0x1, 0x20(%rsp)
1400915ec:     	leaq	0xb8(%rbp), %rcx
1400915f3:     	leaq	-0x50(%rbp), %r9
1400915f7:     	movq	%rax, %rdx
1400915fa:     	callq	0x145458060 <.text+0x5457060>
1400915ff:     	nop
140091600:     	movl	%r13d, 0x134(%rbp)
140091607:     	leaq	0x120(%r12), %rcx
14009160f:     	movq	%r14, %rdx
140091612:     	callq	0x14036aed0 <.text+0x369ed0>
140091617:     	nop
140091618:     	movq	0x218(%r12), %rcx
140091620:     	movq	0x220(%r12), %rdx
140091628:     	movzbl	0x228(%r12), %r8d
140091631:     	leaq	(,%rdx,4), %r10
140091639:     	movq	%rcx, %rax
14009163c:     	testb	%r8b, %r8b
14009163f:     	je	0x1400916b0 <.text+0x906b0>
140091641:     	nopw	%cs:(%rax,%rax)
140091650:     	testq	%r10, %r10
140091653:     	je	0x14009173b <.text+0x9073b>
140091659:     	movl	(%rax), %r9d
14009165c:     	addq	$0x4, %rax
140091660:     	movq	0x1a8(%r14), %r11
140091667:     	leaq	(%r9,%r9,8), %rsi
14009166b:     	movq	0x10(%r11,%rsi,8), %r9
140091670:     	addq	$-0x4, %r10
140091674:     	testq	%r9, %r9
140091677:     	je	0x140091650 <.text+0x90650>
140091679:     	leaq	(%r11,%rsi,8), %r10
14009167d:     	movq	0x230(%r12), %r11
140091685:     	movq	0x18(%r10), %rdi
140091689:     	movq	0x38(%r10), %r10
14009168d:     	movq	(%r10,%r11,8), %r10
140091691:     	notq	%r10
140091694:     	leaq	(%r10,%r10,2), %r10
140091698:     	shlq	$0x4, %r10
14009169c:     	movq	0x10(%rdi,%r10), %rsi
1400916a1:     	movq	0x28(%rdi,%r10), %rdi
1400916a6:     	jmp	0x140091733 <.text+0x90733>
1400916ab:     	nopl	(%rax,%rax)
1400916b0:     	testq	%r10, %r10
1400916b3:     	je	0x14009173b <.text+0x9073b>
1400916b9:     	movl	(%rax), %r9d
1400916bc:     	addq	$0x4, %rax
1400916c0:     	movq	0x108(%r14), %r11
1400916c7:     	leaq	(%r9,%r9,4), %rsi
1400916cb:     	shlq	$0x5, %rsi
1400916cf:     	movq	0x58(%r11,%rsi), %r9
1400916d4:     	addq	$-0x4, %r10
1400916d8:     	testq	%r9, %r9
1400916db:     	je	0x1400916b0 <.text+0x906b0>
1400916dd:     	addq	%rsi, %r11
1400916e0:     	movl	0x94(%r11), %r10d
1400916e7:     	movq	0x1a8(%r14), %rsi
1400916ee:     	leaq	(%r10,%r10,8), %r10
1400916f2:     	movq	0x230(%r12), %rdi
1400916fa:     	movq	0x18(%rsi,%r10,8), %rbx
1400916ff:     	movq	0x38(%rsi,%r10,8), %r10
140091704:     	movq	(%r10,%rdi,8), %r10
140091708:     	notq	%r10
14009170b:     	movq	0x50(%r11), %r11
14009170f:     	movl	0x8(%r11), %edi
140091713:     	leaq	(%r10,%r10,2), %r10
140091717:     	shlq	$0x4, %r10
14009171b:     	notl	%edi
14009171d:     	leaq	(%rdi,%rdi,2), %rsi
140091721:     	shlq	$0x3, %rsi
140091725:     	addq	0x10(%rbx,%r10), %rsi
14009172a:     	shlq	$0x2, %rdi
14009172e:     	addq	0x28(%rbx,%r10), %rdi
140091733:     	movl	$0x1, %r10d
140091739:     	jmp	0x140091743 <.text+0x90743>
14009173b:     	xorl	%r9d, %r9d
14009173e:     	xorl	%r10d, %r10d
140091741:     	xorl	%esi, %esi
140091743:     	leaq	(%rcx,%rdx,4), %rcx
140091747:     	testb	%r8b, %r8b
14009174a:     	movl	0x134(%rbp), %ebx
140091750:     	je	0x14009177e <.text+0x9077e>
140091752:     	cmpl	%r9d, %r10d
140091755:     	jne	0x14009180e <.text+0x9080e>
14009175b:     	cmpq	%rcx, %rax
14009175e:     	je	0x1400917ab <.text+0x907ab>
140091760:     	movl	(%rax), %edx
140091762:     	addq	$0x4, %rax
140091766:     	movq	0x1a8(%r14), %r8
14009176d:     	leaq	(%rdx,%rdx,8), %rdx
140091771:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
140091777:     	je	0x14009175b <.text+0x9075b>
140091779:     	jmp	0x14009180e <.text+0x9080e>
14009177e:     	cmpl	%r9d, %r10d
140091781:     	jne	0x14009180e <.text+0x9080e>
140091787:     	cmpq	%rcx, %rax
14009178a:     	je	0x1400917ab <.text+0x907ab>
14009178c:     	movl	(%rax), %edx
14009178e:     	addq	$0x4, %rax
140091792:     	movq	0x108(%r14), %r8
140091799:     	leaq	(%rdx,%rdx,4), %rdx
14009179d:     	shlq	$0x5, %rdx
1400917a1:     	cmpq	$0x0, 0x58(%r8,%rdx)
1400917a7:     	je	0x140091787 <.text+0x90787>
1400917a9:     	jmp	0x14009180e <.text+0x9080e>
1400917ab:     	testq	%rsi, %rsi
1400917ae:     	je	0x14009180e <.text+0x9080e>
1400917b0:     	movq	0x10(%rsi), %r8
1400917b4:     	cmpq	0xc8(%rbp), %r8
1400917bb:     	jne	0x1400917d1 <.text+0x907d1>
1400917bd:     	movq	0xc0(%rbp), %rdx
1400917c4:     	movq	0x8(%rsi), %rcx
1400917c8:     	callq	0x1457731e7 <.text+0x57721e7>
1400917cd:     	testl	%eax, %eax
1400917cf:     	je	0x14009180e <.text+0x9080e>
1400917d1:     	movl	0x120(%rbp), %eax
1400917d7:     	movl	%eax, (%rdi)
1400917d9:     	movq	(%rsi), %rdx
1400917dc:     	testq	%rdx, %rdx
1400917df:     	je	0x1400917f0 <.text+0x907f0>
1400917e1:     	movq	0x8(%rsi), %rcx
1400917e5:     	movl	$0x1, %r8d
1400917eb:     	callq	0x1400021d0 <.text+0x11d0>
1400917f0:     	movq	0xc8(%rbp), %rax
1400917f7:     	movq	%rax, 0x10(%rsi)
1400917fb:     	movups	0xb8(%rbp), %xmm0
140091802:     	movups	%xmm0, (%rsi)
140091805:     	movq	0x148(%rbp), %rsi
14009180c:     	jmp	0x140091833 <.text+0x90833>
14009180e:     	movq	0xb8(%rbp), %rdx
140091815:     	testq	%rdx, %rdx
140091818:     	movq	0x148(%rbp), %rsi
14009181f:     	je	0x140091833 <.text+0x90833>
140091821:     	movq	0xc0(%rbp), %rcx
140091828:     	movl	$0x1, %r8d
14009182e:     	callq	0x1400021d0 <.text+0x11d0>
140091833:     	xorb	$0x1, %bl
140091836:     	testq	%rsi, %rsi
140091839:     	sete	%al
14009183c:     	orb	%bl, %al
14009183e:     	jne	0x140091855 <.text+0x90855>
140091840:     	movl	$0x1, %r8d
140091846:     	movq	0x138(%rbp), %rcx
14009184d:     	movq	%rsi, %rdx
140091850:     	callq	0x1400021d0 <.text+0x11d0>
140091855:     	movaps	0x160(%rbp), %xmm6
14009185c:     	movaps	0x170(%rbp), %xmm7
140091863:     	addq	$0x208, %rsp            # imm = 0x208
14009186a:     	popq	%rbx
14009186b:     	popq	%rdi
14009186c:     	popq	%rsi
14009186d:     	popq	%r12
14009186f:     	popq	%r13
140091871:     	popq	%r14
140091873:     	popq	%r15
140091875:     	popq	%rbp
140091876:     	retq
140091877:     	movl	$0x4, %ecx
14009187c:     	movl	$0x68, %edx
140091881:     	callq	0x145903781 <.text+0x5902781>
140091886:     	ud2
