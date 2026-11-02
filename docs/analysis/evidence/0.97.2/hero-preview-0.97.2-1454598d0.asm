
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454598d0:     	pushq	%rbp
1454598d1:     	pushq	%r15
1454598d3:     	pushq	%r14
1454598d5:     	pushq	%r13
1454598d7:     	pushq	%r12
1454598d9:     	pushq	%rsi
1454598da:     	pushq	%rdi
1454598db:     	pushq	%rbx
1454598dc:     	subq	$0x68, %rsp
1454598e0:     	leaq	0x60(%rsp), %rbp
1454598e5:     	movq	$-0x2, (%rbp)
1454598ed:     	movl	%edx, %r12d
1454598f0:     	movq	%rcx, %rsi
1454598f3:     	cmpl	$0x838, %edx            # imm = 0x838
1454598f9:     	jg	0x145459934 <.text+0x5458934>
1454598fb:     	cmpl	$0x572, %r12d           # imm = 0x572
145459902:     	jg	0x1454599d9 <.text+0x54589d9>
145459908:     	leal	-0x19(%r12), %eax
14545990d:     	cmpl	$0x81, %eax
145459912:     	ja	0x145459bf8 <.text+0x5458bf8>
145459918:     	leaq	0x1531dfd(%rip), %rcx   # 0x14698b71c
14545991f:     	movslq	(%rcx,%rax,4), %rax
145459923:     	addq	%rcx, %rax
145459926:     	jmpq	*%rax
145459928:     	leaq	0x152ccc1(%rip), %r13   # 0x1469865f0
14545992f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459934:     	cmpl	$0xe4c, %r12d           # imm = 0xE4C
14545993b:     	jle	0x14545996a <.text+0x545896a>
14545993d:     	leal	-0x17d0(%r12), %eax
145459945:     	cmpl	$0x30, %eax
145459948:     	ja	0x145459a2e <.text+0x5458a2e>
14545994e:     	leaq	0x1531fcf(%rip), %rcx   # 0x14698b924
145459955:     	movslq	(%rcx,%rax,4), %rax
145459959:     	addq	%rcx, %rax
14545995c:     	jmpq	*%rax
14545995e:     	leaq	0x152d2f3(%rip), %r13   # 0x146986c58
145459965:     	jmp	0x145459cf5 <.text+0x5458cf5>
14545996a:     	cmpl	$0x9c7, %r12d           # imm = 0x9C7
145459971:     	jle	0x1454599a6 <.text+0x54589a6>
145459973:     	cmpl	$0xb82, %r12d           # imm = 0xB82
14545997a:     	jg	0x145459a0c <.text+0x5458a0c>
145459980:     	cmpl	$0x9c8, %r12d           # imm = 0x9C8
145459987:     	je	0x145459a54 <.text+0x5458a54>
14545998d:     	cmpl	$0x9cc, %r12d           # imm = 0x9CC
145459994:     	jne	0x145459bf8 <.text+0x5458bf8>
14545999a:     	leaq	0x152d217(%rip), %r13   # 0x146986bb8
1454599a1:     	jmp	0x145459cf5 <.text+0x5458cf5>
1454599a6:     	cmpl	$0x839, %r12d           # imm = 0x839
1454599ad:     	je	0x145459a78 <.text+0x5458a78>
1454599b3:     	cmpl	$0x939, %r12d           # imm = 0x939
1454599ba:     	je	0x145459a6c <.text+0x5458a6c>
1454599c0:     	cmpl	$0x93a, %r12d           # imm = 0x93A
1454599c7:     	jne	0x145459bf8 <.text+0x5458bf8>
1454599cd:     	leaq	0x152d194(%rip), %r13   # 0x146986b68
1454599d4:     	jmp	0x145459cf5 <.text+0x5458cf5>
1454599d9:     	cmpl	$0x573, %r12d           # imm = 0x573
1454599e0:     	je	0x145459bec <.text+0x5458bec>
1454599e6:     	cmpl	$0x574, %r12d           # imm = 0x574
1454599ed:     	je	0x145459be0 <.text+0x5458be0>
1454599f3:     	cmpl	$0x82c, %r12d           # imm = 0x82C
1454599fa:     	jne	0x145459bf8 <.text+0x5458bf8>
145459a00:     	leaq	0x152d0e9(%rip), %r13   # 0x146986af0
145459a07:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a0c:     	cmpl	$0xb83, %r12d           # imm = 0xB83
145459a13:     	je	0x145459a60 <.text+0x5458a60>
145459a15:     	cmpl	$0xc27, %r12d           # imm = 0xC27
145459a1c:     	jne	0x145459bf8 <.text+0x5458bf8>
145459a22:     	leaq	0x152d1df(%rip), %r13   # 0x146986c08
145459a29:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a2e:     	cmpl	$0xe4d, %r12d           # imm = 0xE4D
145459a35:     	je	0x145459cee <.text+0x5458cee>
145459a3b:     	cmpl	$0x2ffa, %r12d          # imm = 0x2FFA
145459a42:     	jne	0x145459bf8 <.text+0x5458bf8>
145459a48:     	leaq	0x152d5c9(%rip), %r13   # 0x146987018
145459a4f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a54:     	leaq	0x152d135(%rip), %r13   # 0x146986b90
145459a5b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a60:     	leaq	0x152d179(%rip), %r13   # 0x146986be0
145459a67:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a6c:     	leaq	0x152d0cd(%rip), %r13   # 0x146986b40
145459a73:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a78:     	leaq	0x152d099(%rip), %r13   # 0x146986b18
145459a7f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a84:     	leaq	0x152ce85(%rip), %r13   # 0x146986910
145459a8b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a90:     	leaq	0x152cf41(%rip), %r13   # 0x1469869d8
145459a97:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459a9c:     	leaq	0x152cebd(%rip), %r13   # 0x146986960
145459aa3:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459aa8:     	leaq	0x152cf79(%rip), %r13   # 0x146986a28
145459aaf:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ab4:     	leaq	0x152cdb5(%rip), %r13   # 0x146986870
145459abb:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ac0:     	leaq	0x152cb51(%rip), %r13   # 0x146986618
145459ac7:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459acc:     	leaq	0x152cbe5(%rip), %r13   # 0x1469866b8
145459ad3:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ad8:     	leaq	0x152cbb1(%rip), %r13   # 0x146986690
145459adf:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ae4:     	leaq	0x152cb55(%rip), %r13   # 0x146986640
145459aeb:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459af0:     	leaq	0x152cdc9(%rip), %r13   # 0x1469868c0
145459af7:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459afc:     	leaq	0x152cb65(%rip), %r13   # 0x146986668
145459b03:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b08:     	leaq	0x152cc49(%rip), %r13   # 0x146986758
145459b0f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b14:     	leaq	0x152cbed(%rip), %r13   # 0x146986708
145459b1b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b20:     	leaq	0x152cca9(%rip), %r13   # 0x1469867d0
145459b27:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b2c:     	leaq	0x152cbad(%rip), %r13   # 0x1469866e0
145459b33:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b38:     	leaq	0x152cd59(%rip), %r13   # 0x146986898
145459b3f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b44:     	leaq	0x152cd9d(%rip), %r13   # 0x1469868e8
145459b4b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b50:     	leaq	0x152cbd9(%rip), %r13   # 0x146986730
145459b57:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b5c:     	leaq	0x152cc95(%rip), %r13   # 0x1469867f8
145459b63:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b68:     	leaq	0x152ccb1(%rip), %r13   # 0x146986820
145459b6f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b74:     	leaq	0x152cc05(%rip), %r13   # 0x146986780
145459b7b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b80:     	leaq	0x152ce01(%rip), %r13   # 0x146986988
145459b87:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b8c:     	leaq	0x152cebd(%rip), %r13   # 0x146986a50
145459b93:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459b98:     	leaq	0x152ce61(%rip), %r13   # 0x146986a00
145459b9f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ba4:     	leaq	0x152cecd(%rip), %r13   # 0x146986a78
145459bab:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459bb0:     	leaq	0x152cbf1(%rip), %r13   # 0x1469867a8
145459bb7:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459bbc:     	leaq	0x152cded(%rip), %r13   # 0x1469869b0
145459bc3:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459bc8:     	leaq	0x152cc79(%rip), %r13   # 0x146986848
145459bcf:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459bd4:     	leaq	0x152cd5d(%rip), %r13   # 0x146986938
145459bdb:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459be0:     	leaq	0x152cee1(%rip), %r13   # 0x146986ac8
145459be7:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459bec:     	leaq	0x152cead(%rip), %r13   # 0x146986aa0
145459bf3:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459bf8:     	movq	$-0x1, (%rsi)
145459bff:     	jmp	0x145459e23 <.text+0x5458e23>
145459c04:     	leaq	0x152d395(%rip), %r13   # 0x146986fa0
145459c0b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c10:     	leaq	0x152d361(%rip), %r13   # 0x146986f78
145459c17:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c1c:     	leaq	0x152d2dd(%rip), %r13   # 0x146986f00
145459c23:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c28:     	leaq	0x152d281(%rip), %r13   # 0x146986eb0
145459c2f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c34:     	leaq	0x152d10d(%rip), %r13   # 0x146986d48
145459c3b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c40:     	leaq	0x152d309(%rip), %r13   # 0x146986f50
145459c47:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c4c:     	leaq	0x152d0a5(%rip), %r13   # 0x146986cf8
145459c53:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c58:     	leaq	0x152d279(%rip), %r13   # 0x146986ed8
145459c5f:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c64:     	leaq	0x152d065(%rip), %r13   # 0x146986cd0
145459c6b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c70:     	leaq	0x152d121(%rip), %r13   # 0x146986d98
145459c77:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c79:     	leaq	0x152d208(%rip), %r13   # 0x146986e88
145459c80:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c82:     	leaq	0x152d01f(%rip), %r13   # 0x146986ca8
145459c89:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c8b:     	leaq	0x152cfee(%rip), %r13   # 0x146986c80
145459c92:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c94:     	leaq	0x152d0d5(%rip), %r13   # 0x146986d70
145459c9b:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459c9d:     	leaq	0x152d1bc(%rip), %r13   # 0x146986e60
145459ca4:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ca6:     	leaq	0x152d163(%rip), %r13   # 0x146986e10
145459cad:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459caf:     	leaq	0x152d06a(%rip), %r13   # 0x146986d20
145459cb6:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459cb8:     	leaq	0x152d101(%rip), %r13   # 0x146986dc0
145459cbf:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459cc1:     	leaq	0x152d120(%rip), %r13   # 0x146986de8
145459cc8:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459cca:     	leaq	0x152d257(%rip), %r13   # 0x146986f28
145459cd1:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459cd3:     	leaq	0x152d15e(%rip), %r13   # 0x146986e38
145459cda:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459cdc:     	leaq	0x152d2e5(%rip), %r13   # 0x146986fc8
145459ce3:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459ce5:     	leaq	0x152d304(%rip), %r13   # 0x146986ff0
145459cec:     	jmp	0x145459cf5 <.text+0x5458cf5>
145459cee:     	leaq	0x152cf3b(%rip), %r13   # 0x146986c30
145459cf5:     	movl	0x18(%r13), %eax
145459cf9:     	decl	%eax
145459cfb:     	movb	$0x11, %dil
145459cfe:     	cmpl	$0x17, %eax
145459d01:     	jae	0x145459d10 <.text+0x5458d10>
145459d03:     	movl	%eax, %eax
145459d05:     	leaq	0x1531334(%rip), %rcx   # 0x14698b040
145459d0c:     	movzbl	(%rax,%rcx), %edi
145459d10:     	leaq	0x10(%r13), %rax
145459d14:     	movq	%rax, -0x38(%rbp)
145459d18:     	leaq	0x2c4321(%rip), %rax    # 0x14571e040 <.text+0x571d040>
145459d1f:     	movq	%rax, -0x30(%rbp)
145459d23:     	leaq	0x152db0c(%rip), %rdx   # 0x146987836
145459d2a:     	leaq	-0x28(%rbp), %rcx
145459d2e:     	leaq	-0x38(%rbp), %r8
145459d32:     	callq	0x14570bf80 <.text+0x570af80>
145459d37:     	movq	-0x20(%rbp), %rcx
145459d3b:     	movq	-0x18(%rbp), %rdx
145459d3f:     	movq	(%r13), %r14
145459d43:     	movq	0x8(%r13), %r15
145459d47:     	movq	%rcx, -0x8(%rbp)
145459d4b:     	callq	0x145452400 <.text+0x5451400>
145459d50:     	nop
145459d51:     	movq	%rdx, %rbx
145459d54:     	testq	%rax, %rax
145459d57:     	cmovneq	%rax, %r14
145459d5b:     	cmoveq	%r15, %rbx
145459d5f:     	testq	%rbx, %rbx
145459d62:     	jns	0x145459d75 <.text+0x5458d75>
145459d64:     	xorl	%r12d, %r12d
145459d67:     	movq	%r12, %rcx
145459d6a:     	movq	%rbx, %rdx
145459d6d:     	callq	0x1458e721b <.text+0x58e621b>
145459d72:     	nop
145459d73:     	ud2
145459d75:     	je	0x145459daf <.text+0x5458daf>
145459d77:     	movq	%r12, -0x10(%rbp)
145459d7b:     	callq	0x140002200 <.text+0x1200>
145459d80:     	movl	$0x1, %r12d
145459d86:     	movl	$0x1, %edx
145459d8b:     	movq	%rbx, %rcx
145459d8e:     	callq	0x1400021c0 <.text+0x11c0>
145459d93:     	testq	%rax, %rax
145459d96:     	je	0x145459d67 <.text+0x5458d67>
145459d98:     	movq	%rax, %r15
145459d9b:     	movq	%rax, %rcx
145459d9e:     	movq	%r14, %rdx
145459da1:     	movq	%rbx, %r8
145459da4:     	callq	0x145756ddd <.text+0x5755ddd>
145459da9:     	movq	-0x10(%rbp), %r12
145459dad:     	jmp	0x145459db5 <.text+0x5458db5>
145459daf:     	movl	$0x1, %r15d
145459db5:     	movl	0x24(%r13), %eax
145459db9:     	movq	%rbx, (%rsi)
145459dbc:     	movq	%r15, 0x8(%rsi)
145459dc0:     	movq	%rbx, 0x10(%rsi)
145459dc4:     	movq	$0x0, 0x18(%rsi)
145459dcc:     	movq	$0x4, 0x20(%rsi)
145459dd4:     	movq	$0x0, 0x48(%rsi)
145459ddc:     	xorps	%xmm0, %xmm0
145459ddf:     	movups	%xmm0, 0x28(%rsi)
145459de3:     	movq	$0x0, 0x38(%rsi)
145459deb:     	movl	%r12d, 0x50(%rsi)
145459def:     	movdqu	0x14(%r13), %xmm0
145459df5:     	pshufd	$0x78, %xmm0, %xmm0     # xmm0 = xmm0[0,2,3,1]
145459dfa:     	movdqu	%xmm0, 0x54(%rsi)
145459dff:     	movl	%eax, 0x64(%rsi)
145459e02:     	movb	%dil, 0x68(%rsi)
145459e06:     	movb	$0x0, 0x69(%rsi)
145459e0a:     	movq	-0x28(%rbp), %rdx
145459e0e:     	testq	%rdx, %rdx
145459e11:     	je	0x145459e23 <.text+0x5458e23>
145459e13:     	movl	$0x1, %r8d
145459e19:     	movq	-0x8(%rbp), %rcx
145459e1d:     	callq	0x1400021d0 <.text+0x11d0>
145459e22:     	nop
145459e23:     	addq	$0x68, %rsp
145459e27:     	popq	%rbx
145459e28:     	popq	%rdi
145459e29:     	popq	%rsi
145459e2a:     	popq	%r12
145459e2c:     	popq	%r13
145459e2e:     	popq	%r14
145459e30:     	popq	%r15
145459e32:     	popq	%rbp
145459e33:     	retq
