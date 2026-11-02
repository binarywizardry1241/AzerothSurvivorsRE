
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14012bb00:     	pushq	%rbp
14012bb01:     	pushq	%r15
14012bb03:     	pushq	%r14
14012bb05:     	pushq	%r13
14012bb07:     	pushq	%r12
14012bb09:     	pushq	%rsi
14012bb0a:     	pushq	%rdi
14012bb0b:     	pushq	%rbx
14012bb0c:     	subq	$0x508, %rsp            # imm = 0x508
14012bb13:     	leaq	0x80(%rsp), %rbp
14012bb1b:     	movaps	%xmm8, 0x470(%rbp)
14012bb23:     	movaps	%xmm7, 0x460(%rbp)
14012bb2a:     	movaps	%xmm6, 0x450(%rbp)
14012bb31:     	movq	$-0x2, 0x448(%rbp)
14012bb3c:     	movq	%r9, 0x410(%rbp)
14012bb43:     	movq	%r8, 0x408(%rbp)
14012bb4a:     	movq	%rdx, 0x418(%rbp)
14012bb51:     	movq	%rcx, 0x430(%rbp)
14012bb58:     	movq	0x4f0(%rbp), %rax
14012bb5f:     	movzbl	0x38(%rax), %r15d
14012bb64:     	movl	%r15d, %ecx
14012bb67:     	callq	0x1458e6170 <.text+0x58e5170>
14012bb6c:     	movq	%rax, 0x400(%rbp)
14012bb73:     	testq	%rax, %rax
14012bb76:     	je	0x14012c1ce <.text+0x12b1ce>
14012bb7c:     	movq	0x4f8(%rbp), %rsi
14012bb83:     	leaq	0x3e0(%rbp), %rbx
14012bb8a:     	movq	%rbx, %rcx
14012bb8d:     	movq	%rsi, %rdx
14012bb90:     	movl	%r15d, %r8d
14012bb93:     	callq	0x145886b00 <.text+0x5885b00>
14012bb98:     	nop
14012bb99:     	movq	%rsi, %rcx
14012bb9c:     	movl	%r15d, %edx
14012bb9f:     	callq	0x145885bb0 <.text+0x5884bb0>
14012bba4:     	movl	%eax, 0x438(%rbp)
14012bbaa:     	leaq	0x1d0(%rbp), %rcx
14012bbb1:     	movq	0x4f8(%rbp), %rdx
14012bbb8:     	movl	%r15d, %r8d
14012bbbb:     	callq	0x145886b00 <.text+0x5885b00>
14012bbc0:     	nop
14012bbc1:     	leaq	0x1d0(%rbp), %rcx
14012bbc8:     	callq	0x1458e2230 <.text+0x58e1230>
14012bbcd:     	nop
14012bbce:     	movl	%eax, 0x42c(%rbp)
14012bbd4:     	movq	0x1d0(%rbp), %rdx
14012bbdb:     	testq	%rdx, %rdx
14012bbde:     	je	0x14012bbf6 <.text+0x12abf6>
14012bbe0:     	movq	0x1d8(%rbp), %rcx
14012bbe7:     	shlq	$0x4, %rdx
14012bbeb:     	movl	$0x8, %r8d
14012bbf1:     	callq	0x1400021d0 <.text+0x11d0>
14012bbf6:     	leaq	0x230(%rbp), %rsi
14012bbfd:     	movq	0x430(%rbp), %rax
14012bc04:     	addq	$0x8, %rax
14012bc08:     	movq	%rax, 0x420(%rbp)
14012bc0f:     	xorl	%r8d, %r8d
14012bc12:     	xorps	%xmm6, %xmm6
14012bc15:     	movaps	0x5c41684(%rip), %xmm7  # 0x145d6d2a0
14012bc1c:     	movaps	0x5c4188c(%rip), %xmm8  # 0x145d6d4b0
14012bc24:     	leaq	0x1d0(%rbp), %r12
14012bc2b:     	leaq	0x1a0(%rbp), %r13
14012bc32:     	xorl	%edi, %edi
14012bc34:     	cmpq	$0xc0, %rdi
14012bc3b:     	je	0x14012bedf <.text+0x12aedf>
14012bc41:     	nopw	%cs:(%rax,%rax)
14012bc50:     	movb	%r15b, 0x447(%rbp)
14012bc57:     	movl	0x438(%rbp), %eax
14012bc5d:     	movl	%eax, 0x440(%rbp)
14012bc63:     	movzbl	0x500(%rbp), %eax
14012bc6a:     	movb	%al, 0x446(%rbp)
14012bc70:     	movq	%rbx, %rcx
14012bc73:     	movl	%r15d, %edx
14012bc76:     	movq	%r8, 0x3f8(%rbp)
14012bc7d:     	movb	$0x7, %r9b
14012bc80:     	callq	0x1458e29a0 <.text+0x58e19a0>
14012bc85:     	nop
14012bc86:     	movl	%eax, 0x43c(%rbp)
14012bc8c:     	movw	$0x0, 0x334(%rbp)
14012bc95:     	movb	$0x1, 0x324(%rbp)
14012bc9c:     	movups	%xmm6, 0x40(%rsi)
14012bca0:     	movups	%xmm6, 0x30(%rsi)
14012bca4:     	movups	%xmm6, 0x20(%rsi)
14012bca8:     	movups	%xmm6, 0x10(%rsi)
14012bcac:     	movups	%xmm6, (%rsi)
14012bcaf:     	movq	$0x0, 0x50(%rsi)
14012bcb7:     	movl	$0x5, 0x34a(%rbp)
14012bcc1:     	movups	0x5c7e1c0(%rip), %xmm0  # 0x145da9e88
14012bcc8:     	movups	%xmm0, 0x68(%rsi)
14012bccc:     	movups	0x5c7e1a5(%rip), %xmm0  # 0x145da9e78
14012bcd3:     	movups	%xmm0, 0x58(%rsi)
14012bcd7:     	movups	%xmm7, 0x2a8(%rbp)
14012bcde:     	movups	%xmm7, 0x2b8(%rbp)
14012bce5:     	movups	0x5c7e1dc(%rip), %xmm0  # 0x145da9ec8
14012bcec:     	movups	%xmm0, 0xa8(%rsi)
14012bcf3:     	movups	0x5c7e1be(%rip), %xmm0  # 0x145da9eb8
14012bcfa:     	movups	%xmm0, 0x98(%rsi)
14012bd01:     	movups	0x5c7e1d0(%rip), %xmm0  # 0x145da9ed8
14012bd08:     	movups	%xmm0, 0xb8(%rsi)
14012bd0f:     	movups	0x5c7e1d2(%rip), %xmm0  # 0x145da9ee8
14012bd16:     	movups	%xmm0, 0xc8(%rsi)
14012bd1d:     	movq	$0x0, 0x328(%rbp)
14012bd28:     	movl	$0x0, 0x330(%rbp)
14012bd32:     	movups	%xmm8, 0x308(%rbp)
14012bd3a:     	movl	$0x1, 0x318(%rbp)
14012bd44:     	movq	$0x0, 0x31c(%rbp)
14012bd4f:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
14012bd59:     	movq	%rax, 0x342(%rbp)
14012bd60:     	movups	0x5c7e059(%rip), %xmm0  # 0x145da9dc0
14012bd67:     	movaps	%xmm0, 0x1d0(%rbp)
14012bd6e:     	movq	$0x0, 0x1e0(%rbp)
14012bd79:     	movups	0x5c7e058(%rip), %xmm0  # 0x145da9dd8
14012bd80:     	movups	%xmm0, -0x48(%rsi)
14012bd84:     	movq	$0x0, -0x38(%rsi)
14012bd8c:     	movups	0x5c7e05d(%rip), %xmm0  # 0x145da9df0
14012bd93:     	movups	%xmm0, -0x30(%rsi)
14012bd97:     	movq	$0x0, -0x20(%rsi)
14012bd9f:     	movups	0x5c7e062(%rip), %xmm0  # 0x145da9e08
14012bda6:     	movups	%xmm0, -0x18(%rsi)
14012bdaa:     	movq	$0x0, -0x8(%rsi)
14012bdb2:     	movl	$0x10000, 0x106(%rsi)   # imm = 0x10000
14012bdbc:     	movw	$0x0, 0x10a(%rsi)
14012bdc5:     	movw	$0x0, 0x110(%rsi)
14012bdce:     	movl	$0x10000, 0x10c(%rsi)   # imm = 0x10000
14012bdd8:     	leaq	-0x60(%rbp), %rcx
14012bddc:     	movq	%r12, %rdx
14012bddf:     	callq	0x140012c60 <.text+0x11c60>
14012bde4:     	nop
14012bde5:     	movq	%r12, %r14
14012bde8:     	movl	%r15d, %r12d
14012bdeb:     	movq	%r13, %r15
14012bdee:     	movq	%rbx, %r13
14012bdf1:     	movq	0x430(%rbp), %rax
14012bdf8:     	movq	(%rax), %rbx
14012bdfb:     	movl	$0x200, %r8d            # imm = 0x200
14012be01:     	leaq	0x1d8(%rbp), %rcx
14012be08:     	leaq	-0x60(%rbp), %rdx
14012be0c:     	callq	0x145bc977b <.text+0x5bc877b>
14012be11:     	movq	%rbx, 0x1d0(%rbp)
14012be18:     	movq	%r13, %rbx
14012be1b:     	movq	%r15, %r13
14012be1e:     	movb	%r12b, %r15b
14012be21:     	movq	%r14, %r12
14012be24:     	movq	%r13, %rcx
14012be27:     	movq	0x420(%rbp), %rdx
14012be2e:     	movq	%r14, %r8
14012be31:     	leaq	0x5c42178(%rip), %r9    # 0x145d6dfb0
14012be38:     	callq	0x14018b7d0 <.text+0x18a7d0>
14012be3d:     	nop
14012be3e:     	movq	0x400(%rbp), %rax
14012be45:     	addq	%rdi, %rax
14012be48:     	movq	0x408(%rbp), %rcx
14012be4f:     	movq	%rcx, 0x1d0(%rbp)
14012be56:     	movq	%rax, 0x1d8(%rbp)
14012be5d:     	movq	0x418(%rbp), %rax
14012be64:     	movq	%rax, 0x1e0(%rbp)
14012be6b:     	leaq	0x43c(%rbp), %rax
14012be72:     	movq	%rax, 0x1e8(%rbp)
14012be79:     	leaq	0x447(%rbp), %rax
14012be80:     	movq	%rax, 0x1f0(%rbp)
14012be87:     	movq	%rbx, 0x1f8(%rbp)
14012be8e:     	movq	0x410(%rbp), %rax
14012be95:     	movq	%rax, 0x200(%rbp)
14012be9c:     	leaq	0x440(%rbp), %rax
14012bea3:     	movq	%rax, 0x208(%rbp)
14012beaa:     	leaq	0x446(%rbp), %rax
14012beb1:     	movq	%rax, 0x210(%rbp)
14012beb8:     	movq	%r13, %rcx
14012bebb:     	movq	%r12, %rdx
14012bebe:     	callq	0x14021aed0 <.text+0x219ed0>
14012bec3:     	nop
14012bec4:     	addq	$0x40, %rdi
14012bec8:     	movq	0x3f8(%rbp), %r8
14012becf:     	incq	%r8
14012bed2:     	cmpq	$0xc0, %rdi
14012bed9:     	jne	0x14012bc50 <.text+0x12ac50>
14012bedf:     	movb	%r15b, 0x447(%rbp)
14012bee6:     	movl	0x438(%rbp), %eax
14012beec:     	movl	%eax, 0x440(%rbp)
14012bef2:     	movl	0x42c(%rbp), %eax
14012bef8:     	movl	%eax, 0x43c(%rbp)
14012befe:     	movzbl	0x500(%rbp), %eax
14012bf05:     	movb	%al, 0x446(%rbp)
14012bf0b:     	movw	$0x0, 0x334(%rbp)
14012bf14:     	movb	$0x1, 0x324(%rbp)
14012bf1b:     	xorps	%xmm0, %xmm0
14012bf1e:     	movups	%xmm0, 0x238(%rbp)
14012bf25:     	movups	%xmm0, 0x248(%rbp)
14012bf2c:     	movabsq	$0x439b000000000001, %rax # imm = 0x439B000000000001
14012bf36:     	movq	%rax, 0x258(%rbp)
14012bf3d:     	movaps	%xmm0, 0x260(%rbp)
14012bf44:     	movl	$0x1, 0x270(%rbp)
14012bf4e:     	movq	$0x0, 0x230(%rbp)
14012bf59:     	movups	%xmm0, 0x274(%rbp)
14012bf60:     	movl	$0x0, 0x284(%rbp)
14012bf6a:     	movl	$0x0, 0x348(%rbp)
14012bf74:     	movw	$0x0, 0x34c(%rbp)
14012bf7d:     	movups	0x5c7def4(%rip), %xmm0  # 0x145da9e78
14012bf84:     	movups	%xmm0, 0x288(%rbp)
14012bf8b:     	movups	0x5c7def6(%rip), %xmm0  # 0x145da9e88
14012bf92:     	movups	%xmm0, 0x298(%rbp)
14012bf99:     	movaps	0x5c414a0(%rip), %xmm0  # 0x145d6d440
14012bfa0:     	movups	%xmm0, 0x2a8(%rbp)
14012bfa7:     	movaps	0x5c41342(%rip), %xmm0  # 0x145d6d2f0
14012bfae:     	movups	%xmm0, 0x2b8(%rbp)
14012bfb5:     	movups	0x5c7df0c(%rip), %xmm0  # 0x145da9ec8
14012bfbc:     	movups	%xmm0, 0x2d8(%rbp)
14012bfc3:     	movups	0x5c7deee(%rip), %xmm0  # 0x145da9eb8
14012bfca:     	movups	%xmm0, 0x2c8(%rbp)
14012bfd1:     	movups	0x5c7df10(%rip), %xmm0  # 0x145da9ee8
14012bfd8:     	movups	%xmm0, 0x2f8(%rbp)
14012bfdf:     	movups	0x5c7def2(%rip), %xmm0  # 0x145da9ed8
14012bfe6:     	movups	%xmm0, 0x2e8(%rbp)
14012bfed:     	movb	$0x1, 0x346(%rbp)
14012bff4:     	movl	$0x0, 0x342(%rbp)
14012bffe:     	movq	$0x0, 0x328(%rbp)
14012c009:     	movl	$0x0, 0x330(%rbp)
14012c013:     	movaps	0x5c41436(%rip), %xmm0  # 0x145d6d450
14012c01a:     	movups	%xmm0, 0x308(%rbp)
14012c021:     	movl	$0x1, 0x318(%rbp)
14012c02b:     	movq	$0x0, 0x31c(%rbp)
14012c036:     	movb	$0x0, 0x347(%rbp)
14012c03d:     	movups	0x5c7dd7c(%rip), %xmm0  # 0x145da9dc0
14012c044:     	movaps	%xmm0, 0x1d0(%rbp)
14012c04b:     	movq	$0x0, 0x1e0(%rbp)
14012c056:     	movups	0x5c7dd7b(%rip), %xmm0  # 0x145da9dd8
14012c05d:     	movups	%xmm0, 0x1e8(%rbp)
14012c064:     	movq	$0x0, 0x1f8(%rbp)
14012c06f:     	movups	0x5c7dd7a(%rip), %xmm0  # 0x145da9df0
14012c076:     	movaps	%xmm0, 0x200(%rbp)
14012c07d:     	movq	$0x0, 0x210(%rbp)
14012c088:     	movups	0x5c7dd79(%rip), %xmm0  # 0x145da9e08
14012c08f:     	movups	%xmm0, 0x218(%rbp)
14012c096:     	movq	$0x0, 0x228(%rbp)
14012c0a1:     	movw	$0x0, 0x33a(%rbp)
14012c0aa:     	movl	$0x10000, 0x336(%rbp)   # imm = 0x10000
14012c0b4:     	movw	$0x0, 0x340(%rbp)
14012c0bd:     	movl	$0x10000, 0x33c(%rbp)   # imm = 0x10000
14012c0c7:     	leaq	-0x60(%rbp), %rcx
14012c0cb:     	leaq	0x1d0(%rbp), %rdx
14012c0d2:     	callq	0x140012c60 <.text+0x11c60>
14012c0d7:     	nop
14012c0d8:     	movq	0x430(%rbp), %rax
14012c0df:     	movq	(%rax), %rsi
14012c0e2:     	leaq	0x1d8(%rbp), %rcx
14012c0e9:     	leaq	-0x60(%rbp), %rdx
14012c0ed:     	movl	$0x200, %r8d            # imm = 0x200
14012c0f3:     	callq	0x145bc977b <.text+0x5bc877b>
14012c0f8:     	movq	%rsi, 0x1d0(%rbp)
14012c0ff:     	leaq	0x5c41eaa(%rip), %r9    # 0x145d6dfb0
14012c106:     	leaq	0x1a0(%rbp), %rcx
14012c10d:     	leaq	0x1d0(%rbp), %r8
14012c114:     	movq	0x420(%rbp), %rdx
14012c11b:     	callq	0x14018b7d0 <.text+0x18a7d0>
14012c120:     	nop
14012c121:     	leaq	0x446(%rbp), %rax
14012c128:     	movq	%rax, 0x1d0(%rbp)
14012c12f:     	movq	0x418(%rbp), %rax
14012c136:     	movq	%rax, 0x1d8(%rbp)
14012c13d:     	movq	0x4f8(%rbp), %rax
14012c144:     	movq	%rax, 0x1e0(%rbp)
14012c14b:     	leaq	0x447(%rbp), %rax
14012c152:     	movq	%rax, 0x1e8(%rbp)
14012c159:     	leaq	0x440(%rbp), %rax
14012c160:     	movq	%rax, 0x1f0(%rbp)
14012c167:     	leaq	0x43c(%rbp), %rax
14012c16e:     	movq	%rax, 0x1f8(%rbp)
14012c175:     	movq	%rbx, 0x200(%rbp)
14012c17c:     	movq	0x410(%rbp), %rax
14012c183:     	movq	%rax, 0x208(%rbp)
14012c18a:     	movq	0x408(%rbp), %rax
14012c191:     	movq	%rax, 0x210(%rbp)
14012c198:     	leaq	0x1a0(%rbp), %rcx
14012c19f:     	leaq	0x1d0(%rbp), %rdx
14012c1a6:     	callq	0x140217570 <.text+0x216570>
14012c1ab:     	nop
14012c1ac:     	movq	0x3e0(%rbp), %rdx
14012c1b3:     	testq	%rdx, %rdx
14012c1b6:     	je	0x14012c1ce <.text+0x12b1ce>
14012c1b8:     	movq	0x3e8(%rbp), %rcx
14012c1bf:     	shlq	$0x4, %rdx
14012c1c3:     	movl	$0x8, %r8d
14012c1c9:     	callq	0x1400021d0 <.text+0x11d0>
14012c1ce:     	movaps	0x450(%rbp), %xmm6
14012c1d5:     	movaps	0x460(%rbp), %xmm7
14012c1dc:     	movaps	0x470(%rbp), %xmm8
14012c1e4:     	addq	$0x508, %rsp            # imm = 0x508
14012c1eb:     	popq	%rbx
14012c1ec:     	popq	%rdi
14012c1ed:     	popq	%rsi
14012c1ee:     	popq	%r12
14012c1f0:     	popq	%r13
14012c1f2:     	popq	%r14
14012c1f4:     	popq	%r15
14012c1f6:     	popq	%rbp
14012c1f7:     	retq
