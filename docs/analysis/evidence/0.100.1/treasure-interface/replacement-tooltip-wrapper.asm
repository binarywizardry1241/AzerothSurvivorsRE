
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140113b60:     	pushq	%r15
140113b62:     	pushq	%r14
140113b64:     	pushq	%r13
140113b66:     	pushq	%r12
140113b68:     	pushq	%rsi
140113b69:     	pushq	%rdi
140113b6a:     	pushq	%rbp
140113b6b:     	pushq	%rbx
140113b6c:     	subq	$0x168, %rsp            # imm = 0x168
140113b73:     	movaps	%xmm7, 0x150(%rsp)
140113b7b:     	movaps	%xmm6, 0x140(%rsp)
140113b83:     	movq	%rdx, %r14
140113b86:     	movq	%rcx, %rsi
140113b89:     	movq	(%rcx), %r15
140113b8c:     	movq	0x28(%rcx), %rax
140113b90:     	movq	%r15, 0xe0(%rsp)
140113b98:     	movups	0x8(%rcx), %xmm0
140113b9c:     	movups	%xmm0, 0xe8(%rsp)
140113ba4:     	movups	0x18(%rcx), %xmm0
140113ba8:     	movups	%xmm0, 0xf8(%rsp)
140113bb0:     	movq	%rax, 0x108(%rsp)
140113bb8:     	movq	(%rdx), %rbx
140113bbb:     	leaq	0x582ee15(%rip), %rcx   # 0x1459429d7
140113bc2:     	movl	$0x8, %edx
140113bc7:     	callq	0x145457c00 <.text+0x5456c00>
140113bcc:     	movq	%rdx, %r8
140113bcf:     	leaq	0x110(%rsp), %rcx
140113bd7:     	movq	%rax, %rdx
140113bda:     	callq	0x1401f9790 <.text+0x1f8790>
140113bdf:     	cmpb	$0x1, (%rbx)
140113be2:     	jne	0x140113bfe <.text+0x112bfe>
140113be4:     	movl	0x1(%rbx), %eax
140113be7:     	movl	0x4(%rbx), %ecx
140113bea:     	movl	%ecx, 0x2f(%rsp)
140113bee:     	movl	%eax, 0x2c(%rsp)
140113bf2:     	movq	0x8(%rbx), %rax
140113bf6:     	movzbl	0x10(%rbx), %ecx
140113bfa:     	movb	$0x1, %dl
140113bfc:     	jmp	0x140113c0e <.text+0x112c0e>
140113bfe:     	movq	0x8(%rbx), %rax
140113c02:     	lock
140113c03:     	incq	(%rax)
140113c06:     	jle	0x140113ecf <.text+0x112ecf>
140113c0c:     	xorl	%edx, %edx
140113c0e:     	leaq	0xe8(%rsp), %rdi
140113c16:     	movq	0x120(%rsp), %r8
140113c1e:     	movq	%r8, 0x68(%rsp)
140113c23:     	movups	0x110(%rsp), %xmm0
140113c2b:     	movups	%xmm0, 0x58(%rsp)
140113c30:     	movups	0x582ca95(%rip), %xmm0  # 0x1459406cc
140113c37:     	movups	%xmm0, 0x3c(%rsp)
140113c3c:     	movl	$0x3f800000, 0x4c(%rsp) # imm = 0x3F800000
140113c44:     	movq	$0x0, 0x70(%rsp)
140113c4d:     	movq	$0x4, 0x78(%rsp)
140113c56:     	movq	$0x0, 0x80(%rsp)
140113c62:     	movb	%dl, 0x88(%rsp)
140113c69:     	movl	0x2c(%rsp), %edx
140113c6d:     	movl	0x2f(%rsp), %r8d
140113c72:     	movl	%edx, 0x89(%rsp)
140113c79:     	movl	%r8d, 0x8c(%rsp)
140113c81:     	movq	%rax, 0x90(%rsp)
140113c89:     	movq	%rcx, 0x98(%rsp)
140113c91:     	movl	$0x41300000, 0xa0(%rsp) # imm = 0x41300000
140113c9c:     	movw	$0x190, 0xa4(%rsp)      # imm = 0x190
140113ca6:     	movb	$0x1, 0xa6(%rsp)
140113cae:     	movq	0x48(%rsp), %rax
140113cb3:     	movq	%rax, 0xb4(%rsp)
140113cbb:     	movups	0x3b(%rsp), %xmm0
140113cc0:     	movups	%xmm0, 0xa7(%rsp)
140113cc8:     	movl	0x58054b2(%rip), %ebp   # 0x145919180
140113cce:     	movl	%ebp, 0xcc(%rsp)
140113cd5:     	movups	0x5805494(%rip), %xmm6  # 0x145919170
140113cdc:     	movups	%xmm6, 0xbc(%rsp)
140113ce4:     	movsd	0x5801ae4(%rip), %xmm7  # 0x1459157d0
140113cec:     	movsd	%xmm7, 0xd0(%rsp)
140113cf5:     	movq	%r15, 0x50(%rsp)
140113cfa:     	leaq	0x110(%rsp), %rcx
140113d02:     	leaq	0x50(%rsp), %r8
140113d07:     	movq	%rdi, %rdx
140113d0a:     	callq	0x1400dbfa0 <.text+0xdafa0>
140113d0f:     	movq	0x8(%r14), %r8
140113d13:     	movq	0x10(%r14), %r9
140113d17:     	leaq	0xe0(%rsp), %rcx
140113d1f:     	movq	%rbx, %rdx
140113d22:     	callq	0x1401f2c20 <.text+0x1f1c20>
140113d27:     	leaq	0x582ecb1(%rip), %rcx   # 0x1459429df
140113d2e:     	movl	$0x19, %edx
140113d33:     	callq	0x145457c00 <.text+0x5456c00>
140113d38:     	movq	%rdx, %r14
140113d3b:     	testq	%rdx, %rdx
140113d3e:     	jns	0x140113d50 <.text+0x112d50>
140113d40:     	xorl	%r13d, %r13d
140113d43:     	movq	%r13, %rcx
140113d46:     	movq	%r14, %rdx
140113d49:     	callq	0x14590379b <.text+0x590279b>
140113d4e:     	ud2
140113d50:     	je	0x140113da2 <.text+0x112da2>
140113d52:     	movq	%rax, %r12
140113d55:     	callq	0x140002200 <.text+0x1200>
140113d5a:     	movl	$0x1, %r13d
140113d60:     	movl	$0x1, %edx
140113d65:     	movq	%r14, %rcx
140113d68:     	callq	0x1400021c0 <.text+0x11c0>
140113d6d:     	testq	%rax, %rax
140113d70:     	je	0x140113d43 <.text+0x112d43>
140113d72:     	movq	%rax, %r15
140113d75:     	movq	%rax, %rcx
140113d78:     	movq	%r12, %rdx
140113d7b:     	movq	%r14, %r8
140113d7e:     	callq	0x1457731ed <.text+0x57721ed>
140113d83:     	cmpb	$0x1, (%rbx)
140113d86:     	jne	0x140113dad <.text+0x112dad>
140113d88:     	movl	0x1(%rbx), %eax
140113d8b:     	movl	0x4(%rbx), %ecx
140113d8e:     	movl	%ecx, 0x37(%rsp)
140113d92:     	movl	%eax, 0x34(%rsp)
140113d96:     	movq	0x8(%rbx), %rax
140113d9a:     	movzbl	0x10(%rbx), %ecx
140113d9e:     	movb	$0x1, %dl
140113da0:     	jmp	0x140113dbd <.text+0x112dbd>
140113da2:     	movl	$0x1, %r15d
140113da8:     	cmpb	$0x1, (%rbx)
140113dab:     	je	0x140113d88 <.text+0x112d88>
140113dad:     	movq	0x8(%rbx), %rax
140113db1:     	lock
140113db2:     	incq	(%rax)
140113db5:     	jle	0x140113ecf <.text+0x112ecf>
140113dbb:     	xorl	%edx, %edx
140113dbd:     	movups	0x582c924(%rip), %xmm0  # 0x1459406e8
140113dc4:     	movups	%xmm0, 0x3c(%rsp)
140113dc9:     	movl	$0x3f800000, 0x4c(%rsp) # imm = 0x3F800000
140113dd1:     	movq	0xe0(%rsp), %r8
140113dd9:     	movq	%r14, 0x58(%rsp)
140113dde:     	movq	%r15, 0x60(%rsp)
140113de3:     	movq	%r14, 0x68(%rsp)
140113de8:     	movq	$0x0, 0x70(%rsp)
140113df1:     	movq	$0x4, 0x78(%rsp)
140113dfa:     	movq	$0x0, 0x80(%rsp)
140113e06:     	movb	%dl, 0x88(%rsp)
140113e0d:     	movl	0x34(%rsp), %edx
140113e11:     	movl	0x37(%rsp), %r9d
140113e16:     	movl	%edx, 0x89(%rsp)
140113e1d:     	movl	%r9d, 0x8c(%rsp)
140113e25:     	movq	%rax, 0x90(%rsp)
140113e2d:     	movq	%rcx, 0x98(%rsp)
140113e35:     	movl	$0x41400000, 0xa0(%rsp) # imm = 0x41400000
140113e40:     	movw	$0x190, 0xa4(%rsp)      # imm = 0x190
140113e4a:     	movb	$0x1, 0xa6(%rsp)
140113e52:     	movups	0x3b(%rsp), %xmm0
140113e57:     	movups	%xmm0, 0xa7(%rsp)
140113e5f:     	movq	0x48(%rsp), %rax
140113e64:     	movq	%rax, 0xb4(%rsp)
140113e6c:     	movl	%ebp, 0xcc(%rsp)
140113e73:     	movups	%xmm6, 0xbc(%rsp)
140113e7b:     	movsd	%xmm7, 0xd0(%rsp)
140113e84:     	movw	$0x1, 0xd8(%rsp)
140113e8e:     	movq	%r8, 0x50(%rsp)
140113e93:     	leaq	0x110(%rsp), %rcx
140113e9b:     	leaq	0x50(%rsp), %r8
140113ea0:     	movq	%rdi, %rdx
140113ea3:     	callq	0x1400ebbc0 <.text+0xeabc0>
140113ea8:     	movq	%rsi, %rax
140113eab:     	movaps	0x140(%rsp), %xmm6
140113eb3:     	movaps	0x150(%rsp), %xmm7
140113ebb:     	addq	$0x168, %rsp            # imm = 0x168
140113ec2:     	popq	%rbx
140113ec3:     	popq	%rbp
140113ec4:     	popq	%rdi
140113ec5:     	popq	%rsi
140113ec6:     	popq	%r12
140113ec8:     	popq	%r13
140113eca:     	popq	%r14
140113ecc:     	popq	%r15
140113ece:     	retq
140113ecf:     	ud2
