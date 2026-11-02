AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14587bb2e:     	leaq	0x30(%rbp), %rcx
14587bb32:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bb37:     	nop
14587bb38:     	movq	0x38(%rbp), %rax
14587bb3c:     	movb	$0x24, (%rax)
14587bb3f:     	movb	$0x1, 0x8(%rax)
14587bb43:     	movq	%r14, 0x10(%rax)
14587bb47:     	movq	%r15, 0x18(%rax)
14587bb4b:     	movl	$0x3f19999a, 0x20(%rax) # imm = 0x3F19999A
14587bb52:     	movb	$0x3, 0x24(%rax)
14587bb56:     	movq	$0x1, 0x40(%rbp)
14587bb5e:     	movq	0x30(%rbp), %rcx
14587bb62:     	cmpq	$0x1, %rcx
14587bb66:     	jne	0x14587bb76 <.text+0x587ab76>
14587bb68:     	leaq	0x30(%rbp), %rcx
14587bb6c:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bb71:     	nop
14587bb72:     	movq	0x30(%rbp), %rcx
14587bb76:     	movq	0x38(%rbp), %rax
14587bb7a:     	movb	$0x24, 0x40(%rax)
14587bb7e:     	movb	$0x1, 0x48(%rax)
14587bb82:     	movq	%r14, 0x50(%rax)
14587bb86:     	movq	%r15, 0x58(%rax)
14587bb8a:     	movl	$0x3eb33333, 0x60(%rax) # imm = 0x3EB33333
14587bb91:     	movb	$0x0, 0x64(%rax)
14587bb95:     	movq	$0x2, 0x40(%rbp)
14587bb9d:     	cmpq	$0x2, %rcx
14587bba1:     	jne	0x14587bbb1 <.text+0x587abb1>
14587bba3:     	leaq	0x30(%rbp), %rcx
14587bba7:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bbac:     	nop
14587bbad:     	movq	0x38(%rbp), %rax
14587bbb1:     	movb	$0x8, 0x80(%rax)
14587bbb8:     	movabsq	$0x33f800000, %rcx      # imm = 0x33F800000
14587bbc2:     	movq	%rcx, 0x84(%rax)
14587bbc9:     	movl	$0x3fc00000, 0x8c(%rax) # imm = 0x3FC00000
14587bbd3:     	movl	$0x0, 0x98(%rax)
14587bbdd:     	movb	$0x1, 0xa0(%rax)
14587bbe4:     	movq	%r14, 0xa8(%rax)
14587bbeb:     	movq	%r15, 0xb0(%rax)
14587bbf2:     	movq	$0x3, 0x40(%rbp)
14587bbfa:     	cmpl	$0xb, 0x68(%rdi)
14587bbfe:     	jne	0x14587bc4a <.text+0x587ac4a>
14587bc00:     	cmpq	$0x3, 0x30(%rbp)
14587bc05:     	jne	0x14587bc15 <.text+0x587ac15>
14587bc07:     	leaq	0x30(%rbp), %rcx
14587bc0b:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bc10:     	nop
14587bc11:     	movq	0x38(%rbp), %rax
14587bc15:     	movb	$0x24, 0xc0(%rax)
14587bc1c:     	movb	$0x1, 0xc8(%rax)
14587bc23:     	movq	%r14, 0xd0(%rax)
14587bc2a:     	movq	%r15, 0xd8(%rax)
14587bc31:     	movl	$0x3eb33333, 0xe0(%rax) # imm = 0x3EB33333
14587bc3b:     	movb	$0x6, 0xe4(%rax)
14587bc42:     	movq	$0x4, 0x40(%rbp)
14587bc4a:     	leaq	0x1337848(%rip), %rbx   # 0x146bb3499
14587bc51:     	movl	$0x18, %esi
14587bc56:     	movl	$0x18, %edx
14587bc5b:     	movq	%rbx, %rcx
14587bc5e:     	callq	0x1458da590 <.text+0x58d9590>
14587bc63:     	nop
14587bc64:     	testq	%rax, %rax
14587bc67:     	cmoveq	%rsi, %rdx
14587bc6b:     	cmovneq	%rax, %rbx
14587bc6f:     	movl	$0x20, %esi
14587bc74:     	leaq	0x1337836(%rip), %rax   # 0x146bb34b1
14587bc7b:     	jmp	0x14587cd85 <.text+0x587bd85>
14587bc80:     	leaq	0x30(%rbp), %rcx
14587bc84:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bc89:     	nop
14587bc8a:     	movq	0x38(%rbp), %rax
14587bc8e:     	movb	$0x24, (%rax)
14587bc91:     	movb	$0x1, 0x8(%rax)
14587bc95:     	movq	%r14, 0x10(%rax)
14587bc99:     	movq	%r15, 0x18(%rax)
14587bc9d:     	movl	$0x3f000000, 0x20(%rax) # imm = 0x3F000000
14587bca4:     	movb	$0x3, 0x24(%rax)
14587bca8:     	movq	$0x1, 0x40(%rbp)
14587bcb0:     	movq	0x30(%rbp), %rcx
14587bcb4:     	cmpq	$0x1, %rcx
14587bcb8:     	jne	0x14587bcc8 <.text+0x587acc8>
14587bcba:     	leaq	0x30(%rbp), %rcx
14587bcbe:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bcc3:     	nop
14587bcc4:     	movq	0x30(%rbp), %rcx
14587bcc8:     	movq	0x38(%rbp), %rax
14587bccc:     	movb	$0x24, 0x40(%rax)
14587bcd0:     	movb	$0x1, 0x48(%rax)
14587bcd4:     	movq	%r14, 0x50(%rax)
14587bcd8:     	movq	%r15, 0x58(%rax)
14587bcdc:     	movl	$0x3f800000, 0x60(%rax) # imm = 0x3F800000
14587bce3:     	movb	$0x4, 0x64(%rax)
14587bce7:     	movq	$0x2, 0x40(%rbp)
14587bcef:     	cmpq	$0x2, %rcx
14587bcf3:     	jne	0x14587bd07 <.text+0x587ad07>
14587bcf5:     	leaq	0x30(%rbp), %rcx
14587bcf9:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bcfe:     	nop
14587bcff:     	movq	0x30(%rbp), %rcx
14587bd03:     	movq	0x38(%rbp), %rax
14587bd07:     	movb	$0x24, 0x80(%rax)
14587bd0e:     	movb	$0x1, 0x88(%rax)
14587bd15:     	movq	%r14, 0x90(%rax)
14587bd1c:     	movq	%r15, 0x98(%rax)
14587bd23:     	movl	$0x3f000000, 0xa0(%rax) # imm = 0x3F000000
14587bd2d:     	movb	$0x0, 0xa4(%rax)
14587bd34:     	movq	$0x3, 0x40(%rbp)
14587bd3c:     	cmpq	$0x3, %rcx
14587bd40:     	jne	0x14587bd50 <.text+0x587ad50>
14587bd42:     	leaq	0x30(%rbp), %rcx
14587bd46:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bd4b:     	nop
14587bd4c:     	movq	0x38(%rbp), %rax
14587bd50:     	movw	$0xb, 0xc0(%rax)
14587bd59:     	movsd	0x13373bf(%rip), %xmm0  # 0x146bb3120
14587bd61:     	movsd	%xmm0, 0xc4(%rax)
14587bd69:     	movabsq	$0x200002b69, %rcx      # imm = 0x200002B69
14587bd73:     	movq	%rcx, 0xcc(%rax)
14587bd7a:     	movb	$0x1, 0xd8(%rax)
14587bd81:     	movq	%r14, 0xe0(%rax)
14587bd88:     	movq	%r15, 0xe8(%rax)
14587bd8f:     	movq	$0x4, 0x40(%rbp)
14587bd97:     	leaq	0x1337733(%rip), %rbx   # 0x146bb34d1
14587bd9e:     	movl	$0x15, %esi
14587bda3:     	movl	$0x15, %edx
14587bda8:     	movq	%rbx, %rcx
14587bdab:     	callq	0x1458da590 <.text+0x58d9590>
14587bdb0:     	nop
14587bdb1:     	testq	%rax, %rax
14587bdb4:     	cmoveq	%rsi, %rdx
14587bdb8:     	cmovneq	%rax, %rbx
14587bdbc:     	movl	$0x20, %esi
14587bdc1:     	leaq	0x133771e(%rip), %rax   # 0x146bb34e6
14587bdc8:     	jmp	0x14587cd85 <.text+0x587bd85>
14587bdcd:     	leaq	0x30(%rbp), %rcx
14587bdd1:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bdd6:     	nop
14587bdd7:     	movq	0x38(%rbp), %rax
14587bddb:     	movb	$0x24, (%rax)
14587bdde:     	movb	$0x1, 0x8(%rax)
14587bde2:     	movq	%r14, 0x10(%rax)
14587bde6:     	movq	%r15, 0x18(%rax)
14587bdea:     	movl	$0x3ee66666, 0x20(%rax) # imm = 0x3EE66666
14587bdf1:     	movb	$0x0, 0x24(%rax)
14587bdf5:     	movq	$0x1, 0x40(%rbp)
14587bdfd:     	movq	0x30(%rbp), %rcx
14587be01:     	cmpq	$0x1, %rcx
14587be05:     	jne	0x14587be15 <.text+0x587ae15>
14587be07:     	leaq	0x30(%rbp), %rcx
14587be0b:     	callq	0x145bfb270 <.text+0x5bfa270>
14587be10:     	nop
14587be11:     	movq	0x30(%rbp), %rcx
14587be15:     	movq	0x38(%rbp), %rax
14587be19:     	movb	$0xa, 0x40(%rax)
14587be1d:     	movl	$0x3f000000, 0x44(%rax) # imm = 0x3F000000
14587be24:     	movb	$0x1, 0x48(%rax)
14587be28:     	movq	%r14, 0x50(%rax)
14587be2c:     	movq	%r15, 0x58(%rax)
14587be30:     	movq	$0x2, 0x40(%rbp)
14587be38:     	cmpq	$0x2, %rcx
14587be3c:     	jne	0x14587be4c <.text+0x587ae4c>
14587be3e:     	leaq	0x30(%rbp), %rcx
14587be42:     	callq	0x145bfb270 <.text+0x5bfa270>
14587be47:     	nop
14587be48:     	movq	0x38(%rbp), %rax
14587be4c:     	movb	$0x4, 0x80(%rax)
14587be53:     	movsd	0x13372a5(%rip), %xmm0  # 0x146bb3100
14587be5b:     	movsd	%xmm0, 0x84(%rax)
14587be63:     	xorps	%xmm0, %xmm0
14587be66:     	movups	%xmm0, 0x8c(%rax)
14587be6d:     	movb	$0x1, 0xa0(%rax)
14587be74:     	movq	%r14, 0xa8(%rax)
14587be7b:     	movq	%r15, 0xb0(%rax)
14587be82:     	movq	$0x3, 0x40(%rbp)
14587be8a:     	leaq	0x1337713(%rip), %rbx   # 0x146bb35a4
14587be91:     	movl	$0x13, %esi
14587be96:     	movl	$0x13, %edx
14587be9b:     	movq	%rbx, %rcx
14587be9e:     	callq	0x1458da590 <.text+0x58d9590>
14587bea3:     	nop
14587bea4:     	testq	%rax, %rax
14587bea7:     	cmoveq	%rsi, %rdx
14587beab:     	cmovneq	%rax, %rbx
14587beaf:     	movl	$0x20, %esi
14587beb4:     	leaq	0x13376fc(%rip), %rax   # 0x146bb35b7
14587bebb:     	jmp	0x14587cd85 <.text+0x587bd85>
14587bec0:     	cmpl	$0x0, 0x54(%rdi)
14587bec4:     	je	0x14587c4d7 <.text+0x587b4d7>
14587beca:     	leaq	0x30(%rbp), %rcx
14587bece:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bed3:     	nop
14587bed4:     	movq	0x38(%rbp), %rax
14587bed8:     	movb	$0x24, (%rax)
14587bedb:     	movb	$0x1, 0x8(%rax)
14587bedf:     	movq	%r14, 0x10(%rax)
14587bee3:     	movq	%r15, 0x18(%rax)
14587bee7:     	movl	$0x40800000, 0x20(%rax) # imm = 0x40800000
14587beee:     	movb	$0x2, 0x24(%rax)
14587bef2:     	movq	$0x1, 0x40(%rbp)
14587befa:     	cmpq	$0x1, 0x30(%rbp)
14587beff:     	movl	$0x1, %esi
14587bf04:     	je	0x14587c4d9 <.text+0x587b4d9>
14587bf0a:     	jmp	0x14587c4e3 <.text+0x587b4e3>
14587bf0f:     	cmpl	$0x0, 0x54(%rdi)
14587bf13:     	je	0x14587c588 <.text+0x587b588>
14587bf19:     	leaq	0x30(%rbp), %rcx
14587bf1d:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bf22:     	nop
14587bf23:     	movq	0x38(%rbp), %rax
14587bf27:     	movb	$0x24, (%rax)
14587bf2a:     	movb	$0x1, 0x8(%rax)
14587bf2e:     	movq	%r14, 0x10(%rax)
14587bf32:     	movq	%r15, 0x18(%rax)
14587bf36:     	movl	$0x40800000, 0x20(%rax) # imm = 0x40800000
14587bf3d:     	movb	$0x2, 0x24(%rax)
14587bf41:     	movq	$0x1, 0x40(%rbp)
14587bf49:     	cmpq	$0x1, 0x30(%rbp)
14587bf4e:     	movl	$0x1, %r12d
14587bf54:     	je	0x14587c58b <.text+0x587b58b>
14587bf5a:     	jmp	0x14587c595 <.text+0x587b595>
14587bf5f:     	cmpl	$0x0, 0x54(%rdi)
14587bf63:     	je	0x14587c626 <.text+0x587b626>
14587bf69:     	leaq	0x30(%rbp), %rcx
14587bf6d:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bf72:     	nop
14587bf73:     	movq	0x38(%rbp), %rax
14587bf77:     	movb	$0x24, (%rax)
14587bf7a:     	movb	$0x1, 0x8(%rax)
14587bf7e:     	movq	%r14, 0x10(%rax)
14587bf82:     	movq	%r15, 0x18(%rax)
14587bf86:     	movl	$0x40400000, 0x20(%rax) # imm = 0x40400000
14587bf8d:     	movb	$0x2, 0x24(%rax)
14587bf91:     	movq	$0x1, 0x40(%rbp)
14587bf99:     	cmpq	$0x1, 0x30(%rbp)
14587bf9e:     	movl	$0x1, %esi
14587bfa3:     	je	0x14587c628 <.text+0x587b628>
14587bfa9:     	jmp	0x14587c632 <.text+0x587b632>
14587bfae:     	leaq	0x30(%rbp), %rcx
14587bfb2:     	callq	0x145bfb270 <.text+0x5bfa270>
14587bfb7:     	nop
14587bfb8:     	movq	0x38(%rbp), %rax
14587bfbc:     	movb	$0x24, (%rax)
14587bfbf:     	movb	$0x1, 0x8(%rax)
14587bfc3:     	movq	%r14, 0x10(%rax)
14587bfc7:     	movq	%r15, 0x18(%rax)
14587bfcb:     	movl	$0x3f800000, 0x20(%rax) # imm = 0x3F800000
14587bfd2:     	movb	$0x4, 0x24(%rax)
14587bfd6:     	movq	$0x1, 0x40(%rbp)
14587bfde:     	movss	0x50(%rdi), %xmm0
14587bfe3:     	xorps	%xmm6, %xmm6
14587bfe6:     	ucomiss	%xmm6, %xmm0
14587bfe9:     	movl	$0x1, %esi
14587bfee:     	movq	0x30(%rbp), %rax
14587bff2:     	jbe	0x14587c034 <.text+0x587b034>
14587bff4:     	cmpq	$0x1, %rax
14587bff8:     	jne	0x14587c008 <.text+0x587b008>
14587bffa:     	leaq	0x30(%rbp), %rcx
14587bffe:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c003:     	nop
14587c004:     	movq	0x30(%rbp), %rax
14587c008:     	movq	0x38(%rbp), %rcx
14587c00c:     	movb	$0x24, 0x40(%rcx)
14587c010:     	movb	$0x1, 0x48(%rcx)
14587c014:     	movq	%r14, 0x50(%rcx)
14587c018:     	movq	%r15, 0x58(%rcx)
14587c01c:     	movl	$0x3f000000, 0x60(%rcx) # imm = 0x3F000000
14587c023:     	movb	$0x3, 0x64(%rcx)
14587c027:     	movq	$0x2, 0x40(%rbp)
14587c02f:     	movl	$0x2, %esi
14587c034:     	movss	0x44(%rdi), %xmm0
14587c039:     	ucomiss	%xmm6, %xmm0
14587c03c:     	jbe	0x14587c081 <.text+0x587b081>
14587c03e:     	cmpq	%rax, %rsi
14587c041:     	jne	0x14587c04d <.text+0x587b04d>
14587c043:     	leaq	0x30(%rbp), %rcx
14587c047:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c04c:     	nop
14587c04d:     	movq	0x38(%rbp), %rax
14587c051:     	movl	%esi, %ecx
14587c053:     	shll	$0x6, %ecx
14587c056:     	movb	$0x24, (%rax,%rcx)
14587c05a:     	movb	$0x1, 0x8(%rax,%rcx)
14587c05f:     	movq	%r14, 0x10(%rax,%rcx)
14587c064:     	movq	%r15, 0x18(%rax,%rcx)
14587c069:     	movl	$0x3f000000, 0x20(%rax,%rcx) # imm = 0x3F000000
14587c071:     	movb	$0x0, 0x24(%rax,%rcx)
14587c076:     	incq	%rsi
14587c079:     	movq	%rsi, 0x40(%rbp)
14587c07d:     	movq	0x30(%rbp), %rax
14587c081:     	cmpq	%rax, %rsi
14587c084:     	jne	0x14587c090 <.text+0x587b090>
14587c086:     	leaq	0x30(%rbp), %rcx
14587c08a:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c08f:     	nop
14587c090:     	movq	0x38(%rbp), %rax
14587c094:     	movl	%esi, %ecx
14587c096:     	shll	$0x6, %ecx
14587c099:     	movb	$0x16, (%rax,%rcx)
14587c09d:     	movl	$0x3c23d70a, 0x4(%rax,%rcx) # imm = 0x3C23D70A
14587c0a5:     	incq	%rsi
14587c0a8:     	movq	%rsi, 0x40(%rbp)
14587c0ac:     	leaq	0x13375be(%rip), %rbx   # 0x146bb3671
14587c0b3:     	movl	$0x16, %esi
14587c0b8:     	movl	$0x16, %edx
14587c0bd:     	movq	%rbx, %rcx
14587c0c0:     	callq	0x1458da590 <.text+0x58d9590>
14587c0c5:     	nop
14587c0c6:     	testq	%rax, %rax
14587c0c9:     	cmoveq	%rsi, %rdx
14587c0cd:     	cmovneq	%rax, %rbx
14587c0d1:     	movl	$0x17, %esi
14587c0d6:     	leaq	0x13375aa(%rip), %rax   # 0x146bb3687
14587c0dd:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c0e2:     	leaq	0x30(%rbp), %rcx
14587c0e6:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c0eb:     	nop
14587c0ec:     	movq	0x38(%rbp), %rax
14587c0f0:     	movb	$0x24, (%rax)
14587c0f3:     	movb	$0x1, 0x8(%rax)
14587c0f7:     	movq	%r14, 0x10(%rax)
14587c0fb:     	movq	%r15, 0x18(%rax)
14587c0ff:     	movl	$0x3f19999a, 0x20(%rax) # imm = 0x3F19999A
14587c106:     	movb	$0x3, 0x24(%rax)
14587c10a:     	movq	$0x1, 0x40(%rbp)
14587c112:     	movq	0x30(%rbp), %rcx
14587c116:     	cmpq	$0x1, %rcx
14587c11a:     	jne	0x14587c12a <.text+0x587b12a>
14587c11c:     	leaq	0x30(%rbp), %rcx
14587c120:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c125:     	nop
14587c126:     	movq	0x30(%rbp), %rcx
14587c12a:     	movq	0x38(%rbp), %rax
14587c12e:     	movb	$0x24, 0x40(%rax)
14587c132:     	movb	$0x1, 0x48(%rax)
14587c136:     	movq	%r14, 0x50(%rax)
14587c13a:     	movq	%r15, 0x58(%rax)
14587c13e:     	movl	$0x3e99999a, 0x60(%rax) # imm = 0x3E99999A
14587c145:     	movb	$0x0, 0x64(%rax)
14587c149:     	movq	$0x2, 0x40(%rbp)
14587c151:     	cmpq	$0x2, %rcx
14587c155:     	jne	0x14587c165 <.text+0x587b165>
14587c157:     	leaq	0x30(%rbp), %rcx
14587c15b:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c160:     	nop
14587c161:     	movq	0x38(%rbp), %rax
14587c165:     	movb	$0x9, 0x80(%rax)
14587c16c:     	movl	$0x316e, 0x84(%rax)     # imm = 0x316E
14587c176:     	movsd	0x1336f72(%rip), %xmm0  # 0x146bb30f0
14587c17e:     	movsd	%xmm0, 0x88(%rax)
14587c186:     	movl	$0x0, 0x90(%rax)
14587c190:     	movb	$0x1, 0x98(%rax)
14587c197:     	movq	%r14, 0xa0(%rax)
14587c19e:     	movq	%r15, 0xa8(%rax)
14587c1a5:     	movq	$0x3, 0x40(%rbp)
14587c1ad:     	leaq	0x1337423(%rip), %rbx   # 0x146bb35d7
14587c1b4:     	movl	$0x1a, %esi
14587c1b9:     	movl	$0x1a, %edx
14587c1be:     	movq	%rbx, %rcx
14587c1c1:     	callq	0x1458da590 <.text+0x58d9590>
14587c1c6:     	nop
14587c1c7:     	testq	%rax, %rax
14587c1ca:     	cmoveq	%rsi, %rdx
14587c1ce:     	cmovneq	%rax, %rbx
14587c1d2:     	movl	$0x17, %esi
14587c1d7:     	leaq	0x1337413(%rip), %rax   # 0x146bb35f1
14587c1de:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c1e3:     	xorl	%ebx, %ebx
14587c1e5:     	cmpl	$0xd, %r12d
14587c1e9:     	ja	0x14587c236 <.text+0x587b236>
14587c1eb:     	movl	$0x24c0, %eax           # imm = 0x24C0
14587c1f0:     	btl	%r12d, %eax
14587c1f4:     	jae	0x14587c236 <.text+0x587b236>
14587c1f6:     	cmpq	0x30(%rbp), %rbx
14587c1fa:     	jne	0x14587c206 <.text+0x587b206>
14587c1fc:     	leaq	0x30(%rbp), %rcx
14587c200:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c205:     	nop
14587c206:     	movq	0x38(%rbp), %rax
14587c20a:     	movl	%ebx, %ecx
14587c20c:     	shll	$0x6, %ecx
14587c20f:     	movb	$0x24, (%rax,%rcx)
14587c213:     	movb	$0x1, 0x8(%rax,%rcx)
14587c218:     	movq	%r14, 0x10(%rax,%rcx)
14587c21d:     	movq	%r15, 0x18(%rax,%rcx)
14587c222:     	movl	$0x3f19999a, 0x20(%rax,%rcx) # imm = 0x3F19999A
14587c22a:     	movb	$0x0, 0x24(%rax,%rcx)
14587c22f:     	incq	%rbx
14587c232:     	movq	%rbx, 0x40(%rbp)
14587c236:     	cmpl	$0xd, %r12d
14587c23a:     	ja	0x14587c24d <.text+0x587b24d>
14587c23c:     	movl	$0x2700, %eax           # imm = 0x2700
14587c241:     	btl	%r12d, %eax
14587c245:     	jae	0x14587c24d <.text+0x587b24d>
14587c247:     	ucomiss	0x48(%rdi), %xmm6
14587c24b:     	jae	0x14587c28d <.text+0x587b28d>
14587c24d:     	cmpq	0x30(%rbp), %rbx
14587c251:     	jne	0x14587c25d <.text+0x587b25d>
14587c253:     	leaq	0x30(%rbp), %rcx
14587c257:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c25c:     	nop
14587c25d:     	movq	0x38(%rbp), %rax
14587c261:     	movl	%ebx, %ecx
14587c263:     	shll	$0x6, %ecx
14587c266:     	movb	$0x24, (%rax,%rcx)
14587c26a:     	movb	$0x1, 0x8(%rax,%rcx)
14587c26f:     	movq	%r14, 0x10(%rax,%rcx)
14587c274:     	movq	%r15, 0x18(%rax,%rcx)
14587c279:     	movl	$0x3eb33333, 0x20(%rax,%rcx) # imm = 0x3EB33333
14587c281:     	movb	%sil, 0x24(%rax,%rcx)
14587c286:     	incq	%rbx
14587c289:     	movq	%rbx, 0x40(%rbp)
14587c28d:     	leaq	-0xb(%r15), %rax
14587c291:     	cmpq	$0x4, %rax
14587c295:     	ja	0x14587c909 <.text+0x587b909>
14587c29b:     	leaq	0x133a44a(%rip), %rcx   # 0x146bb66ec
14587c2a2:     	movslq	(%rcx,%rax,4), %rax
14587c2a6:     	addq	%rcx, %rax
14587c2a9:     	jmpq	*%rax
14587c2ab:     	movabsq	$0x727261625f656369, %rax # imm = 0x727261625F656369
14587c2b5:     	xorq	(%r14), %rax
14587c2b8:     	movabsq	$0x726569727261625f, %rcx # imm = 0x726569727261625F
14587c2c2:     	xorq	0x3(%r14), %rcx
14587c2c6:     	jmp	0x14587c8c2 <.text+0x587b8c2>
14587c2cb:     	movl	$0x1, %ebx
14587c2d0:     	leaq	-0x9(%r15), %rax
14587c2d4:     	cmpq	$0x4, %rax
14587c2d8:     	ja	0x14587cd59 <.text+0x587bd59>
14587c2de:     	leaq	0x133a3f3(%rip), %rcx   # 0x146bb66d8
14587c2e5:     	movslq	(%rcx,%rax,4), %rax
14587c2e9:     	addq	%rcx, %rax
14587c2ec:     	jmpq	*%rax
14587c2ee:     	movabsq	$0x676172646f6f6c62, %rax # imm = 0x676172646F6F6C62
14587c2f8:     	xorq	(%r14), %rax
14587c2fb:     	movzbl	0x8(%r14), %ecx
14587c300:     	xorq	$0x65, %rcx
14587c304:     	orq	%rax, %rcx
14587c307:     	je	0x14587cae6 <.text+0x587bae6>
14587c30d:     	movabsq	$0x7461665f6c616573, %rax # imm = 0x7461665F6C616573
14587c317:     	xorq	(%r14), %rax
14587c31a:     	movzbl	0x8(%r14), %ecx
14587c31f:     	xorq	$0x65, %rcx
14587c323:     	orq	%rax, %rcx
14587c326:     	je	0x14587cd15 <.text+0x587bd15>
14587c32c:     	movabsq	$0x7269665f6c756f73, %rax # imm = 0x7269665F6C756F73
14587c336:     	xorq	(%r14), %rax
14587c339:     	movzbl	0x8(%r14), %ecx
14587c33e:     	xorq	$0x65, %rcx
14587c342:     	orq	%rax, %rcx
14587c345:     	je	0x14587cd15 <.text+0x587bd15>
14587c34b:     	movabsq	$0x6c6577746867696c, %rax # imm = 0x6C6577746867696C
14587c355:     	xorq	(%r14), %rax
14587c358:     	movzbl	0x8(%r14), %ecx
14587c35d:     	xorq	$0x6c, %rcx
14587c361:     	orq	%rax, %rcx
14587c364:     	je	0x14587cf6c <.text+0x587bf6c>
14587c36a:     	movabsq	$0x70726f6d796c6f70, %rax # imm = 0x70726F6D796C6F70
14587c374:     	xorq	(%r14), %rax
14587c377:     	movzbl	0x8(%r14), %ecx
14587c37c:     	xorq	$0x68, %rcx
14587c380:     	jmp	0x14587cb3a <.text+0x587bb3a>
14587c385:     	xorl	%esi, %esi
14587c387:     	leaq	0x30(%rbp), %rcx
14587c38b:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c390:     	nop
14587c391:     	movq	0x38(%rbp), %rax
14587c395:     	movl	%esi, %ecx
14587c397:     	shll	$0x6, %ecx
14587c39a:     	movb	$0x24, (%rax,%rcx)
14587c39e:     	movb	$0x1, 0x8(%rax,%rcx)
14587c3a3:     	movq	%r14, 0x10(%rax,%rcx)
14587c3a8:     	movq	%r15, 0x18(%rax,%rcx)
14587c3ad:     	movl	$0x3e4ccccd, 0x20(%rax,%rcx) # imm = 0x3E4CCCCD
14587c3b5:     	movb	$0x0, 0x24(%rax,%rcx)
14587c3ba:     	leaq	0x1(%rsi), %rbx
14587c3be:     	movq	%rbx, 0x40(%rbp)
14587c3c2:     	cmpq	0x30(%rbp), %rbx
14587c3c6:     	jne	0x14587c3d2 <.text+0x587b3d2>
14587c3c8:     	leaq	0x30(%rbp), %rcx
14587c3cc:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c3d1:     	nop
14587c3d2:     	movq	0x38(%rbp), %rax
14587c3d6:     	shll	$0x6, %ebx
14587c3d9:     	movb	$0x17, (%rax,%rbx)
14587c3dd:     	orq	$0x2, %rsi
14587c3e1:     	movq	%rsi, 0x40(%rbp)
14587c3e5:     	leaq	0x133711a(%rip), %rbx   # 0x146bb3506
14587c3ec:     	movl	$0x17, %esi
14587c3f1:     	movl	$0x17, %edx
14587c3f6:     	movq	%rbx, %rcx
14587c3f9:     	callq	0x1458da590 <.text+0x58d9590>
14587c3fe:     	nop
14587c3ff:     	testq	%rax, %rax
14587c402:     	cmoveq	%rsi, %rdx
14587c406:     	cmovneq	%rax, %rbx
14587c40a:     	movl	$0x20, %esi
14587c40f:     	leaq	0x1337107(%rip), %rax   # 0x146bb351d
14587c416:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c41b:     	xorl	%esi, %esi
14587c41d:     	leaq	0x30(%rbp), %rcx
14587c421:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c426:     	nop
14587c427:     	movq	0x38(%rbp), %rax
14587c42b:     	movl	%esi, %ecx
14587c42d:     	shll	$0x6, %ecx
14587c430:     	movb	$0x24, (%rax,%rcx)
14587c434:     	movb	$0x1, 0x8(%rax,%rcx)
14587c439:     	movq	%r14, 0x10(%rax,%rcx)
14587c43e:     	movq	%r15, 0x18(%rax,%rcx)
14587c443:     	movl	$0x3e4ccccd, 0x20(%rax,%rcx) # imm = 0x3E4CCCCD
14587c44b:     	movb	$0x0, 0x24(%rax,%rcx)
14587c450:     	leaq	0x1(%rsi), %rbx
14587c454:     	movq	%rbx, 0x40(%rbp)
14587c458:     	cmpq	0x30(%rbp), %rbx
14587c45c:     	jne	0x14587c468 <.text+0x587b468>
14587c45e:     	leaq	0x30(%rbp), %rcx
14587c462:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c467:     	nop
14587c468:     	movq	0x38(%rbp), %rax
14587c46c:     	shll	$0x6, %ebx
14587c46f:     	movb	$0x6, (%rax,%rbx)
14587c473:     	movabsq	$0x3e99999a00000002, %rcx # imm = 0x3E99999A00000002
14587c47d:     	movq	%rcx, 0x4(%rax,%rbx)
14587c482:     	movl	$0x0, 0x10(%rax,%rbx)
14587c48a:     	movb	$0x1, 0x18(%rax,%rbx)
14587c48f:     	movq	%r14, 0x20(%rax,%rbx)
14587c494:     	movq	%r15, 0x28(%rax,%rbx)
14587c499:     	orq	$0x2, %rsi
14587c49d:     	movq	%rsi, 0x40(%rbp)
14587c4a1:     	leaq	0x1336f8e(%rip), %rbx   # 0x146bb3436
14587c4a8:     	movl	$0x18, %esi
14587c4ad:     	movl	$0x18, %edx
14587c4b2:     	movq	%rbx, %rcx
14587c4b5:     	callq	0x1458da590 <.text+0x58d9590>
14587c4ba:     	nop
14587c4bb:     	testq	%rax, %rax
14587c4be:     	cmoveq	%rsi, %rdx
14587c4c2:     	cmovneq	%rax, %rbx
14587c4c6:     	movl	$0x17, %esi
14587c4cb:     	leaq	0x1336f7c(%rip), %rax   # 0x146bb344e
14587c4d2:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c4d7:     	xorl	%esi, %esi
14587c4d9:     	leaq	0x30(%rbp), %rcx
14587c4dd:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c4e2:     	nop
14587c4e3:     	movq	0x38(%rbp), %rax
14587c4e7:     	movl	%esi, %ecx
14587c4e9:     	shll	$0x6, %ecx
14587c4ec:     	movb	$0x24, (%rax,%rcx)
14587c4f0:     	movb	$0x1, 0x8(%rax,%rcx)
14587c4f5:     	movq	%r14, 0x10(%rax,%rcx)
14587c4fa:     	movq	%r15, 0x18(%rax,%rcx)
14587c4ff:     	movl	$0x3e4ccccd, 0x20(%rax,%rcx) # imm = 0x3E4CCCCD
14587c507:     	movb	$0x0, 0x24(%rax,%rcx)
14587c50c:     	leaq	0x1(%rsi), %rbx
14587c510:     	movq	%rbx, 0x40(%rbp)
14587c514:     	cmpq	0x30(%rbp), %rbx
14587c518:     	jne	0x14587c524 <.text+0x587b524>
14587c51a:     	leaq	0x30(%rbp), %rcx
14587c51e:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c523:     	nop
14587c524:     	movq	0x38(%rbp), %rax
14587c528:     	shll	$0x6, %ebx
14587c52b:     	movb	$0x7, (%rax,%rbx)
14587c52f:     	movaps	0x1336bfa(%rip), %xmm0  # 0x146bb3130
14587c536:     	movups	%xmm0, 0x4(%rax,%rbx)
14587c53b:     	movb	$0x1, 0x18(%rax,%rbx)
14587c540:     	movq	%r14, 0x20(%rax,%rbx)
14587c545:     	movq	%r15, 0x28(%rax,%rbx)
14587c54a:     	orq	$0x2, %rsi
14587c54e:     	movq	%rsi, 0x40(%rbp)
14587c552:     	leaq	0x1336f0c(%rip), %rbx   # 0x146bb3465
14587c559:     	movl	$0x14, %esi
14587c55e:     	movl	$0x14, %edx
14587c563:     	movq	%rbx, %rcx
14587c566:     	callq	0x1458da590 <.text+0x58d9590>
14587c56b:     	nop
14587c56c:     	testq	%rax, %rax
14587c56f:     	cmoveq	%rsi, %rdx
14587c573:     	cmovneq	%rax, %rbx
14587c577:     	movl	$0x20, %esi
14587c57c:     	leaq	0x1336ef6(%rip), %rax   # 0x146bb3479
14587c583:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c588:     	xorl	%r12d, %r12d
14587c58b:     	leaq	0x30(%rbp), %rcx
14587c58f:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c594:     	nop
14587c595:     	movq	0x38(%rbp), %rax
14587c599:     	movl	%r12d, %ecx
14587c59c:     	shll	$0x6, %ecx
14587c59f:     	movb	$0x24, (%rax,%rcx)
14587c5a3:     	movb	$0x1, 0x8(%rax,%rcx)
14587c5a8:     	movq	%r14, 0x10(%rax,%rcx)
14587c5ad:     	movq	%r15, 0x18(%rax,%rcx)
14587c5b2:     	movl	$0x3f000000, 0x20(%rax,%rcx) # imm = 0x3F000000
14587c5ba:     	movb	$0x0, 0x24(%rax,%rcx)
14587c5bf:     	leaq	0x1(%r12), %rbx
14587c5c4:     	movq	%rbx, 0x40(%rbp)
14587c5c8:     	movl	0x68(%rdi), %eax
14587c5cb:     	orl	$0x4, %eax
14587c5ce:     	cmpl	$0x7, %eax
14587c5d1:     	jne	0x14587c6ec <.text+0x587b6ec>
14587c5d7:     	cmpq	0x30(%rbp), %rbx
14587c5db:     	jne	0x14587c5e7 <.text+0x587b5e7>
14587c5dd:     	leaq	0x30(%rbp), %rcx
14587c5e1:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c5e6:     	nop
14587c5e7:     	movq	0x38(%rbp), %rax
14587c5eb:     	shll	$0x6, %ebx
14587c5ee:     	movb	$0x24, (%rax,%rbx)
14587c5f2:     	movb	$0x1, 0x8(%rax,%rbx)
14587c5f7:     	movq	%r14, 0x10(%rax,%rbx)
14587c5fc:     	movq	%r15, 0x18(%rax,%rbx)
14587c601:     	movl	$0x3f800000, 0x20(%rax,%rbx) # imm = 0x3F800000
14587c609:     	movb	$0x6, 0x24(%rax,%rbx)
14587c60e:     	leaq	0x2(%r12), %rbx
14587c613:     	movq	%rbx, 0x40(%rbp)
14587c617:     	cmpq	$0x5, %r15
14587c61b:     	jne	0x14587c761 <.text+0x587b761>
14587c621:     	jmp	0x14587c7d9 <.text+0x587b7d9>
14587c626:     	xorl	%esi, %esi
14587c628:     	leaq	0x30(%rbp), %rcx
14587c62c:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c631:     	nop
14587c632:     	movq	0x38(%rbp), %rax
14587c636:     	movl	%esi, %ecx
14587c638:     	shll	$0x6, %ecx
14587c63b:     	movb	$0x24, (%rax,%rcx)
14587c63f:     	movb	$0x1, 0x8(%rax,%rcx)
14587c644:     	movq	%r14, 0x10(%rax,%rcx)
14587c649:     	movq	%r15, 0x18(%rax,%rcx)
14587c64e:     	movl	$0x3f666666, 0x20(%rax,%rcx) # imm = 0x3F666666
14587c656:     	movb	$0x0, 0x24(%rax,%rcx)
14587c65b:     	leaq	0x1(%rsi), %rbx
14587c65f:     	movq	%rbx, 0x40(%rbp)
14587c663:     	movl	0x40(%rdi), %r12d
14587c667:     	cmpq	0x30(%rbp), %rbx
14587c66b:     	jne	0x14587c677 <.text+0x587b677>
14587c66d:     	leaq	0x30(%rbp), %rcx
14587c671:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c676:     	nop
14587c677:     	movq	0x38(%rbp), %rax
14587c67b:     	shll	$0x6, %ebx
14587c67e:     	movw	$0x10b, (%rax,%rbx)     # imm = 0x10B
14587c684:     	movsd	0x1336a54(%rip), %xmm0  # 0x146bb30e0
14587c68c:     	movsd	%xmm0, 0x4(%rax,%rbx)
14587c692:     	movl	%r12d, 0xc(%rax,%rbx)
14587c697:     	movl	$0x2, 0x10(%rax,%rbx)
14587c69f:     	movb	$0x1, 0x18(%rax,%rbx)
14587c6a4:     	movq	%r14, 0x20(%rax,%rbx)
14587c6a9:     	movq	%r15, 0x28(%rax,%rbx)
14587c6ae:     	orq	$0x2, %rsi
14587c6b2:     	movq	%rsi, 0x40(%rbp)
14587c6b6:     	leaq	0x1336eb2(%rip), %rbx   # 0x146bb356f
14587c6bd:     	movl	$0x15, %esi
14587c6c2:     	movl	$0x15, %edx
14587c6c7:     	movq	%rbx, %rcx
14587c6ca:     	callq	0x1458da590 <.text+0x58d9590>
14587c6cf:     	nop
14587c6d0:     	testq	%rax, %rax
14587c6d3:     	cmoveq	%rsi, %rdx
14587c6d7:     	cmovneq	%rax, %rbx
14587c6db:     	movl	$0x20, %esi
14587c6e0:     	leaq	0x1336e9d(%rip), %rax   # 0x146bb3584
14587c6e7:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c6ec:     	cmpq	$0x5, %r15
14587c6f0:     	jne	0x14587c70a <.text+0x587b70a>
14587c6f2:     	movl	$0x65726873, %eax       # imm = 0x65726873
14587c6f7:     	xorl	(%r14), %eax
14587c6fa:     	movzbl	0x4(%r14), %ecx
14587c6ff:     	xorl	$0x64, %ecx
14587c702:     	orl	%eax, %ecx
14587c704:     	je	0x14587c7d9 <.text+0x587b7d9>
14587c70a:     	cmpq	0x30(%rbp), %rbx
14587c70e:     	jne	0x14587c71a <.text+0x587b71a>
14587c710:     	leaq	0x30(%rbp), %rcx
14587c714:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c719:     	nop
14587c71a:     	movq	0x38(%rbp), %rax
14587c71e:     	shll	$0x6, %ebx
14587c721:     	movb	$0x9, (%rax,%rbx)
14587c725:     	movl	$0x31b1, 0x4(%rax,%rbx) # imm = 0x31B1
14587c72d:     	movsd	0x13369db(%rip), %xmm0  # 0x146bb3110
14587c735:     	movsd	%xmm0, 0x8(%rax,%rbx)
14587c73b:     	movl	$0x0, 0x10(%rax,%rbx)
14587c743:     	movb	$0x1, 0x18(%rax,%rbx)
14587c748:     	movq	%r14, 0x20(%rax,%rbx)
14587c74d:     	movq	%r15, 0x28(%rax,%rbx)
14587c752:     	leaq	0x2(%r12), %rbx
14587c757:     	movq	%rbx, 0x40(%rbp)
14587c75b:     	cmpq	$0x5, %r15
14587c75f:     	je	0x14587c7d9 <.text+0x587b7d9>
14587c761:     	cmpq	$0xb, %r15
14587c765:     	jne	0x14587c83a <.text+0x587b83a>
14587c76b:     	movabsq	$0x696874646f6f6c62, %rax # imm = 0x696874646F6F6C62
14587c775:     	xorq	(%r14), %rax
14587c778:     	movabsq	$0x747372696874646f, %rcx # imm = 0x747372696874646F
14587c782:     	xorq	0x3(%r14), %rcx
14587c786:     	orq	%rax, %rcx
14587c789:     	jne	0x14587c83a <.text+0x587b83a>
14587c78f:     	cmpq	0x30(%rbp), %rbx
14587c793:     	jne	0x14587c79f <.text+0x587b79f>
14587c795:     	leaq	0x30(%rbp), %rcx
14587c799:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c79e:     	nop
14587c79f:     	movq	0x38(%rbp), %rax
14587c7a3:     	shll	$0x6, %ebx
14587c7a6:     	movb	$0x12, (%rax,%rbx)
14587c7aa:     	movsd	0x53bafe(%rip), %xmm0   # 0x145db82b0
14587c7b2:     	movsd	%xmm0, 0x4(%rax,%rbx)
14587c7b8:     	movl	$0x1, 0x10(%rax,%rbx)
14587c7c0:     	movb	$0x1, 0x18(%rax,%rbx)
14587c7c5:     	movq	%r14, 0x20(%rax,%rbx)
14587c7ca:     	movq	$0xb, 0x28(%rax,%rbx)
14587c7d3:     	addq	$0x3, %r12
14587c7d7:     	jmp	0x14587c836 <.text+0x587b836>
14587c7d9:     	movl	$0x65726873, %eax       # imm = 0x65726873
14587c7de:     	xorl	(%r14), %eax
14587c7e1:     	movzbl	0x4(%r14), %ecx
14587c7e6:     	xorl	$0x64, %ecx
14587c7e9:     	orl	%eax, %ecx
14587c7eb:     	jne	0x14587c83a <.text+0x587b83a>
14587c7ed:     	cmpq	0x30(%rbp), %rbx
14587c7f1:     	jne	0x14587c7fd <.text+0x587b7fd>
14587c7f3:     	leaq	0x30(%rbp), %rcx
14587c7f7:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c7fc:     	nop
14587c7fd:     	movq	0x38(%rbp), %rax
14587c801:     	movl	%ebx, %ecx
14587c803:     	shll	$0x6, %ecx
14587c806:     	movb	$0x6, (%rax,%rcx)
14587c80a:     	movabsq	$0x3f00000000000002, %rdx # imm = 0x3F00000000000002
14587c814:     	movq	%rdx, 0x4(%rax,%rcx)
14587c819:     	movl	$0x0, 0x10(%rax,%rcx)
14587c821:     	movb	$0x1, 0x18(%rax,%rcx)
14587c826:     	movq	%r14, 0x20(%rax,%rcx)
14587c82b:     	movq	%r15, 0x28(%rax,%rcx)
14587c830:     	incq	%rbx
14587c833:     	movq	%rbx, %r12
14587c836:     	movq	%r12, 0x40(%rbp)
14587c83a:     	leaq	0x1336cfc(%rip), %rbx   # 0x146bb353d
14587c841:     	movl	$0x1b, %esi
14587c846:     	movl	$0x1b, %edx
14587c84b:     	movq	%rbx, %rcx
14587c84e:     	callq	0x1458da590 <.text+0x58d9590>
14587c853:     	nop
14587c854:     	testq	%rax, %rax
14587c857:     	cmoveq	%rsi, %rdx
14587c85b:     	cmovneq	%rax, %rbx
14587c85f:     	movl	$0x17, %esi
14587c864:     	leaq	0x1336ced(%rip), %rax   # 0x146bb3558
14587c86b:     	jmp	0x14587cd85 <.text+0x587bd85>
14587c870:     	movabsq	$0x6e615f6563696c73, %rax # imm = 0x6E615F6563696C73
14587c87a:     	xorq	(%r14), %rax
14587c87d:     	movabsq	$0x656369645f646e61, %rcx # imm = 0x656369645F646E61
14587c887:     	xorq	0x6(%r14), %rcx
14587c88b:     	jmp	0x14587c8c2 <.text+0x587b8c2>
14587c88d:     	movabsq	$0x735f656c74746162, %rax # imm = 0x735F656C74746162
14587c897:     	xorq	(%r14), %rax
14587c89a:     	movl	0x8(%r14), %ecx
14587c89e:     	xorq	$0x74756f68, %rcx       # imm = 0x74756F68
14587c8a5:     	jmp	0x14587c8c2 <.text+0x587b8c2>
14587c8a7:     	movabsq	$0x696c616e65726461, %rax # imm = 0x696C616E65726461
14587c8b1:     	xorq	(%r14), %rax
14587c8b4:     	movabsq	$0x687375725f656e69, %rcx # imm = 0x687375725F656E69
14587c8be:     	xorq	0x7(%r14), %rcx
14587c8c2:     	orq	%rax, %rcx
14587c8c5:     	jne	0x14587c939 <.text+0x587b939>
14587c8c7:     	cmpq	0x30(%rbp), %rbx
14587c8cb:     	jne	0x14587c8d7 <.text+0x587b8d7>
14587c8cd:     	leaq	0x30(%rbp), %rcx
14587c8d1:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c8d6:     	nop
14587c8d7:     	movq	0x38(%rbp), %rax
14587c8db:     	movl	%ebx, %ecx
14587c8dd:     	shll	$0x6, %ecx
14587c8e0:     	movb	$0x24, (%rax,%rcx)
14587c8e4:     	movb	$0x1, 0x8(%rax,%rcx)
14587c8e9:     	movq	%r14, 0x10(%rax,%rcx)
14587c8ee:     	movq	%r15, 0x18(%rax,%rcx)
14587c8f3:     	movl	$0x3f800000, 0x20(%rax,%rcx) # imm = 0x3F800000
14587c8fb:     	movb	$0x6, 0x24(%rax,%rcx)
14587c900:     	incq	%rbx
14587c903:     	movq	%rbx, 0x40(%rbp)
14587c907:     	jmp	0x14587c939 <.text+0x587b939>
14587c909:     	cmpq	$0x13, %r15
14587c90d:     	jne	0x14587c939 <.text+0x587b939>
14587c90f:     	movdqu	(%r14), %xmm0
14587c914:     	movdqu	0x3(%r14), %xmm1
14587c91a:     	pcmpeqb	0x133677e(%rip), %xmm1  # 0x146bb30a0
14587c922:     	pcmpeqb	0x1336796(%rip), %xmm0  # 0x146bb30c0
14587c92a:     	pand	%xmm1, %xmm0
14587c92e:     	pmovmskb	%xmm0, %eax
14587c932:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
14587c937:     	je	0x14587c8c7 <.text+0x587b8c7>
14587c939:     	leal	-0x6(%r12), %eax
14587c93e:     	cmpl	$0x7, %eax
14587c941:     	ja	0x14587cbc9 <.text+0x587bbc9>
14587c947:     	leaq	0x1339db2(%rip), %rcx   # 0x146bb6700
14587c94e:     	movslq	(%rcx,%rax,4), %rax
14587c952:     	addq	%rcx, %rax
14587c955:     	jmpq	*%rax
14587c957:     	pxor	%xmm0, %xmm0
14587c95b:     	ucomiss	%xmm0, %xmm6
14587c95e:     	ja	0x14587cb77 <.text+0x587bb77>
14587c964:     	cmpq	0x30(%rbp), %rbx
14587c968:     	jne	0x14587c974 <.text+0x587b974>
14587c96a:     	leaq	0x30(%rbp), %rcx
14587c96e:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c973:     	nop
14587c974:     	movq	0x38(%rbp), %rax
14587c978:     	movl	%ebx, %ecx
14587c97a:     	shll	$0x6, %ecx
14587c97d:     	movb	$0x12, (%rax,%rcx)
14587c981:     	movsd	0x7ff1d7(%rip), %xmm0   # 0x14607bb60
14587c989:     	movsd	%xmm0, 0x4(%rax,%rcx)
14587c98f:     	jmp	0x14587cbab <.text+0x587bbab>
14587c994:     	cmpb	$0x1, 0x74(%rdi)
14587c998:     	je	0x14587ca0a <.text+0x587ba0a>
14587c99a:     	jmp	0x14587cbc9 <.text+0x587bbc9>
14587c99f:     	movzbl	0x74(%rdi), %esi
14587c9a3:     	cmpb	$0x1, %sil
14587c9a7:     	movl	$0x3b85, %eax           # imm = 0x3B85
14587c9ac:     	movl	$0x5a9, %ecx            # imm = 0x5A9
14587c9b1:     	cmovel	%eax, %ecx
14587c9b4:     	cmpb	$0x4, %sil
14587c9b8:     	movl	$0x7a, %r12d
14587c9be:     	cmovnel	%ecx, %r12d
14587c9c2:     	cmpq	0x30(%rbp), %rbx
14587c9c6:     	jne	0x14587c9d2 <.text+0x587b9d2>
14587c9c8:     	leaq	0x30(%rbp), %rcx
14587c9cc:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c9d1:     	nop
14587c9d2:     	movq	0x38(%rbp), %rax
14587c9d6:     	movl	%ebx, %ecx
14587c9d8:     	shll	$0x6, %ecx
14587c9db:     	movb	$0x3, (%rax,%rcx)
14587c9df:     	movb	%sil, 0x1(%rax,%rcx)
14587c9e4:     	movq	0x13366e4(%rip), %xmm0  # 0x146bb30d0
14587c9ec:     	movq	%xmm0, 0x4(%rax,%rcx)
14587c9f2:     	movl	%r12d, 0xc(%rax,%rcx)
14587c9f7:     	movl	$0xa, 0x10(%rax,%rcx)
14587c9ff:     	jmp	0x14587cbc2 <.text+0x587bbc2>
14587ca04:     	cmpb	$0x1, 0x74(%rdi)
14587ca08:     	jne	0x14587ca5c <.text+0x587ba5c>
14587ca0a:     	movl	0x40(%rdi), %esi
14587ca0d:     	cmpq	0x30(%rbp), %rbx
14587ca11:     	jne	0x14587ca1d <.text+0x587ba1d>
14587ca13:     	leaq	0x30(%rbp), %rcx
14587ca17:     	callq	0x145bfb270 <.text+0x5bfa270>
14587ca1c:     	nop
14587ca1d:     	movq	0x38(%rbp), %rax
14587ca21:     	movl	%ebx, %ecx
14587ca23:     	shll	$0x6, %ecx
14587ca26:     	movb	$0xc, (%rax,%rcx)
14587ca2a:     	movl	%esi, 0x4(%rax,%rcx)
14587ca2e:     	movq	0x13366aa(%rip), %xmm0  # 0x146bb30e0
14587ca36:     	movq	%xmm0, 0x8(%rax,%rcx)
14587ca3c:     	movabsq	$0x200003b85, %rdx      # imm = 0x200003B85
14587ca46:     	movq	%rdx, 0x10(%rax,%rcx)
14587ca4b:     	incq	%rbx
14587ca4e:     	movq	%rbx, 0x40(%rbp)
14587ca52:     	cmpl	$0xd, %r12d
14587ca56:     	jne	0x14587cbc9 <.text+0x587bbc9>
14587ca5c:     	ucomiss	0x48(%rdi), %xmm6
14587ca60:     	jb	0x14587cbc9 <.text+0x587bbc9>
14587ca66:     	cmpq	0x30(%rbp), %rbx
14587ca6a:     	jne	0x14587ca76 <.text+0x587ba76>
14587ca6c:     	leaq	0x30(%rbp), %rcx
14587ca70:     	callq	0x145bfb270 <.text+0x5bfa270>
14587ca75:     	nop
14587ca76:     	movq	0x38(%rbp), %rax
14587ca7a:     	movl	%ebx, %ecx
14587ca7c:     	shll	$0x6, %ecx
14587ca7f:     	movb	$0x8, (%rax,%rcx)
14587ca83:     	movabsq	$0x33e800000, %rdx      # imm = 0x33E800000
14587ca8d:     	movq	%rdx, 0x4(%rax,%rcx)
14587ca92:     	movl	$0x3fc00000, 0xc(%rax,%rcx) # imm = 0x3FC00000
14587ca9a:     	movl	$0x8, 0x18(%rax,%rcx)
14587caa2:     	jmp	0x14587cbc2 <.text+0x587bbc2>
14587caa7:     	movabsq	$0x665f656972656166, %rax # imm = 0x665F656972656166
14587cab1:     	xorq	(%r14), %rax
14587cab4:     	movabsq	$0x657269665f656972, %rcx # imm = 0x657269665F656972
14587cabe:     	xorq	0x3(%r14), %rcx
14587cac2:     	jmp	0x14587cb3a <.text+0x587bb3a>
14587cac4:     	movabsq	$0x6974706d65646572, %rax # imm = 0x6974706D65646572
14587cace:     	xorq	(%r14), %rax
14587cad1:     	movzwl	0x8(%r14), %ecx
14587cad6:     	xorq	$0x6e6f, %rcx           # imm = 0x6E6F
14587cadd:     	orq	%rax, %rcx
14587cae0:     	jne	0x14587cd59 <.text+0x587bd59>
14587cae6:     	cmpq	0x30(%rbp), %rbx
14587caea:     	jne	0x14587caf6 <.text+0x587baf6>
14587caec:     	leaq	0x30(%rbp), %rcx
14587caf0:     	callq	0x145bfb270 <.text+0x5bfa270>
14587caf5:     	nop
14587caf6:     	movq	0x38(%rbp), %rax
14587cafa:     	movl	%ebx, %ecx
14587cafc:     	shll	$0x6, %ecx
14587caff:     	movb	$0x24, (%rax,%rcx)
14587cb03:     	movb	$0x1, 0x8(%rax,%rcx)
14587cb08:     	movq	%r14, 0x10(%rax,%rcx)
14587cb0d:     	movq	%r15, 0x18(%rax,%rcx)
14587cb12:     	movl	$0x3f000000, 0x20(%rax,%rcx) # imm = 0x3F000000
14587cb1a:     	jmp	0x14587cd4d <.text+0x587bd4d>
14587cb1f:     	movabsq	$0x5f666f5f6c6c6163, %rax # imm = 0x5F666F5F6C6C6163
14587cb29:     	xorq	(%r14), %rax
14587cb2c:     	movabsq	$0x656d616c665f666f, %rcx # imm = 0x656D616C665F666F
14587cb36:     	xorq	0x5(%r14), %rcx
14587cb3a:     	orq	%rax, %rcx
14587cb3d:     	jne	0x14587cd59 <.text+0x587bd59>
14587cb43:     	cmpq	0x30(%rbp), %rbx
14587cb47:     	jne	0x14587cb53 <.text+0x587bb53>
14587cb49:     	leaq	0x30(%rbp), %rcx
14587cb4d:     	callq	0x145bfb270 <.text+0x5bfa270>
14587cb52:     	nop
14587cb53:     	movq	0x38(%rbp), %rax
14587cb57:     	movl	%ebx, %ecx
14587cb59:     	shll	$0x6, %ecx
14587cb5c:     	movb	$0xd, (%rax,%rcx)
14587cb60:     	movl	$0x3f000000, 0x4(%rax,%rcx) # imm = 0x3F000000
14587cb68:     	movq	%r14, 0x8(%rax,%rcx)
14587cb6d:     	movq	%r15, 0x10(%rax,%rcx)
14587cb72:     	jmp	0x14587cd52 <.text+0x587bd52>
14587cb77:     	cmpq	0x30(%rbp), %rbx
14587cb7b:     	jne	0x14587cb87 <.text+0x587bb87>
14587cb7d:     	leaq	0x30(%rbp), %rcx
14587cb81:     	callq	0x145bfb270 <.text+0x5bfa270>
14587cb86:     	nop
14587cb87:     	movq	0x38(%rbp), %rax
14587cb8b:     	movl	%ebx, %ecx
14587cb8d:     	shll	$0x6, %ecx
14587cb90:     	movw	$0xe0f, (%rax,%rcx)     # imm = 0xE0F
14587cb96:     	movabsq	$0x13d4ccccd, %rdx      # imm = 0x13D4CCCCD
14587cba0:     	movq	%rdx, 0x4(%rax,%rcx)
14587cba5:     	movss	%xmm6, 0xc(%rax,%rcx)
14587cbab:     	movl	$0x7, 0x10(%rax,%rcx)
14587cbb3:     	movb	$0x1, 0x18(%rax,%rcx)
14587cbb8:     	movq	%r14, 0x20(%rax,%rcx)
14587cbbd:     	movq	%r15, 0x28(%rax,%rcx)
14587cbc2:     	incq	%rbx
14587cbc5:     	movq	%rbx, 0x40(%rbp)
14587cbc9:     	cmpq	$0x13, %r15
14587cbcd:     	jne	0x14587cbf9 <.text+0x587bbf9>
14587cbcf:     	movdqu	(%r14), %xmm0
14587cbd4:     	movdqu	0x3(%r14), %xmm1
14587cbda:     	pcmpeqb	0x13364be(%rip), %xmm1  # 0x146bb30a0
14587cbe2:     	pcmpeqb	0x13364d6(%rip), %xmm0  # 0x146bb30c0
14587cbea:     	pand	%xmm1, %xmm0
14587cbee:     	pmovmskb	%xmm0, %eax
14587cbf2:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
14587cbf7:     	je	0x14587cc28 <.text+0x587bc28>
14587cbf9:     	leaq	0x1336a08(%rip), %rbx   # 0x146bb3608
14587cc00:     	movl	$0x14, %esi
14587cc05:     	movl	$0x14, %edx
14587cc0a:     	movq	%rbx, %rcx
14587cc0d:     	callq	0x1458da590 <.text+0x58d9590>
14587cc12:     	nop
14587cc13:     	testq	%rax, %rax
14587cc16:     	cmoveq	%rsi, %rdx
14587cc1a:     	cmovneq	%rax, %rbx
14587cc1e:     	movl	$0x17, %esi
14587cc23:     	jmp	0x14587cd7e <.text+0x587bd7e>
14587cc28:     	movq	%rdi, 0x8(%rbp)
14587cc2c:     	leaq	-0x587ab73(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14587cc33:     	movq	%rax, 0x10(%rbp)
14587cc37:     	leaq	0x13369f5(%rip), %rdx   # 0x146bb3633
14587cc3e:     	leaq	-0x18(%rbp), %rcx
14587cc42:     	leaq	0x8(%rbp), %r8
14587cc46:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14587cc4b:     	nop
14587cc4c:     	movq	-0x18(%rbp), %rax
14587cc50:     	movq	%rax, 0x20(%rbp)
14587cc54:     	movq	-0x10(%rbp), %rax
14587cc58:     	movq	%rax, 0x18(%rbp)
14587cc5c:     	movq	-0x8(%rbp), %rsi
14587cc60:     	leaq	0x13369d9(%rip), %rbx   # 0x146bb3640
14587cc67:     	movl	$0x1a, %r14d
14587cc6d:     	movl	$0x1a, %edx
14587cc72:     	movq	%rbx, %rcx
14587cc75:     	callq	0x1458da590 <.text+0x58d9590>
14587cc7a:     	nop
14587cc7b:     	movq	%rdx, %rdi
14587cc7e:     	testq	%rax, %rax
14587cc81:     	cmovneq	%rax, %rbx
14587cc85:     	cmoveq	%r14, %rdi
14587cc89:     	movq	$0x1, 0x20(%rsp)
14587cc92:     	leaq	-0x18(%rbp), %rcx
14587cc96:     	movl	$0x1, %r9d
14587cc9c:     	movq	%rdi, %rdx
14587cc9f:     	xorl	%r8d, %r8d
14587cca2:     	callq	0x14023ff50 <.text+0x23ef50>
14587cca7:     	movq	-0x10(%rbp), %r14
14587ccab:     	cmpl	$0x1, -0x18(%rbp)
14587ccaf:     	je	0x14587cfb8 <.text+0x587bfb8>
14587ccb5:     	movq	-0x8(%rbp), %r15
14587ccb9:     	testq	%rdi, %rdi
14587ccbc:     	je	0x14587cccc <.text+0x587bccc>
14587ccbe:     	movq	%r15, %rcx
14587ccc1:     	movq	%rbx, %rdx
14587ccc4:     	movq	%rdi, %r8
14587ccc7:     	callq	0x145bc977b <.text+0x5bc877b>
14587cccc:     	movq	0x40(%rbp), %rax
14587ccd0:     	movq	%rax, 0x40(%r13)
14587ccd4:     	movups	0x30(%rbp), %xmm0
14587ccd8:     	movups	%xmm0, 0x30(%r13)
14587ccdd:     	movq	0x20(%rbp), %rax
14587cce1:     	movq	%rax, (%r13)
14587cce5:     	movq	0x18(%rbp), %rax
14587cce9:     	movq	%rax, 0x8(%r13)
14587cced:     	movq	%rsi, 0x10(%r13)
14587ccf1:     	movq	%r14, 0x18(%r13)
14587ccf5:     	movq	%r15, 0x20(%r13)
14587ccf9:     	movq	%rdi, 0x28(%r13)
14587ccfd:     	leaq	0x1336956(%rip), %rax   # 0x146bb365a
14587cd04:     	movq	%rax, 0x48(%r13)
14587cd08:     	movq	$0x17, 0x50(%r13)
14587cd10:     	jmp	0x14587cf39 <.text+0x587bf39>
14587cd15:     	cmpq	0x30(%rbp), %rbx
14587cd19:     	jne	0x14587cd25 <.text+0x587bd25>
14587cd1b:     	leaq	0x30(%rbp), %rcx
14587cd1f:     	callq	0x145bfb270 <.text+0x5bfa270>
14587cd24:     	nop
14587cd25:     	movq	0x38(%rbp), %rax
14587cd29:     	movl	%ebx, %ecx
14587cd2b:     	shll	$0x6, %ecx
14587cd2e:     	movb	$0x24, (%rax,%rcx)
14587cd32:     	movb	$0x1, 0x8(%rax,%rcx)
14587cd37:     	movq	%r14, 0x10(%rax,%rcx)
14587cd3c:     	movq	$0x9, 0x18(%rax,%rcx)
14587cd45:     	movl	$0x3f800000, 0x20(%rax,%rcx) # imm = 0x3F800000
14587cd4d:     	movb	$0x6, 0x24(%rax,%rcx)
14587cd52:     	incq	%rbx
14587cd55:     	movq	%rbx, 0x40(%rbp)
14587cd59:     	leaq	0x1336953(%rip), %rbx   # 0x146bb36b3
14587cd60:     	movl	$0x17, %esi
14587cd65:     	movl	$0x17, %edx
14587cd6a:     	movq	%rbx, %rcx
14587cd6d:     	callq	0x1458da590 <.text+0x58d9590>
14587cd72:     	nop
14587cd73:     	testq	%rax, %rax
14587cd76:     	cmoveq	%rsi, %rdx
14587cd7a:     	cmovneq	%rax, %rbx
14587cd7e:     	leaq	0x1336897(%rip), %rax   # 0x146bb361c
14587cd85:     	movq	%rax, 0x28(%rbp)
14587cd89:     	movq	%rbx, -0x38(%rbp)
14587cd8d:     	movq	%rdx, -0x30(%rbp)
14587cd91:     	movq	%rdi, 0x8(%rbp)
14587cd95:     	leaq	-0x587acdc(%rip), %r12  # 0x1400020c0 <.text+0x10c0>
14587cd9c:     	movq	%r12, 0x10(%rbp)
14587cda0:     	leaq	0x133688c(%rip), %rdx   # 0x146bb3633
14587cda7:     	leaq	-0x18(%rbp), %rcx
14587cdab:     	leaq	0x8(%rbp), %rbx
14587cdaf:     	movq	%rbx, %r8
14587cdb2:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14587cdb7:     	nop
14587cdb8:     	movq	%rsi, -0x28(%rbp)
14587cdbc:     	movq	-0x18(%rbp), %rax
14587cdc0:     	movq	%rax, 0x20(%rbp)
14587cdc4:     	movq	-0x10(%rbp), %rax
14587cdc8:     	movq	%rax, 0x18(%rbp)
14587cdcc:     	movq	-0x8(%rbp), %rsi
14587cdd0:     	cmpq	$0xc, %r15
14587cdd4:     	je	0x14587ce10 <.text+0x587be10>
14587cdd6:     	cmpq	$0x5, %r15
14587cdda:     	jne	0x14587ce2d <.text+0x587be2d>
14587cddc:     	movl	$0x656e6572, %eax       # imm = 0x656E6572
14587cde1:     	xorl	(%r14), %eax
14587cde4:     	movzbl	0x4(%r14), %ecx
14587cde9:     	xorl	$0x77, %ecx
14587cdec:     	orl	%eax, %ecx
14587cdee:     	jne	0x14587ce2d <.text+0x587be2d>
14587cdf0:     	leaq	0x13368e8(%rip), %r14   # 0x146bb36df
14587cdf7:     	movl	$0xe, %r15d
14587cdfd:     	movl	$0xe, %edx
14587ce02:     	movq	%r14, %rcx
14587ce05:     	callq	0x1458da590 <.text+0x58d9590>
14587ce0a:     	nop
14587ce0b:     	jmp	0x14587ceb4 <.text+0x587beb4>
14587ce10:     	movabsq	$0x616e6576756a6572, %rax # imm = 0x616E6576756A6572
14587ce1a:     	xorq	(%r14), %rax
14587ce1d:     	movl	0x8(%r14), %ecx
14587ce21:     	xorq	$0x6e6f6974, %rcx       # imm = 0x6E6F6974
14587ce28:     	orq	%rax, %rcx
14587ce2b:     	je	0x14587ce99 <.text+0x587be99>
14587ce2d:     	movq	%rdi, 0x8(%rbp)
14587ce31:     	movq	%r12, 0x10(%rbp)
14587ce35:     	leaq	0x1323f13(%rip), %rdx   # 0x146ba0d4f
14587ce3c:     	leaq	-0x18(%rbp), %rcx
14587ce40:     	leaq	0x8(%rbp), %r8
14587ce44:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14587ce49:     	nop
14587ce4a:     	movq	%r13, %rbx
14587ce4d:     	movq	-0x10(%rbp), %rcx
14587ce51:     	movq	-0x8(%rbp), %rdx
14587ce55:     	movq	0x10(%rdi), %r14
14587ce59:     	movq	0x18(%rdi), %r13
14587ce5d:     	movq	%rcx, -0x20(%rbp)
14587ce61:     	callq	0x1458da590 <.text+0x58d9590>
14587ce66:     	nop
14587ce67:     	movq	%rax, %r15
14587ce6a:     	movq	%rdx, %rdi
14587ce6d:     	movq	-0x18(%rbp), %rdx
14587ce71:     	testq	%rdx, %rdx
14587ce74:     	je	0x14587ce85 <.text+0x587be85>
14587ce76:     	movl	$0x1, %r8d
14587ce7c:     	movq	-0x20(%rbp), %rcx
14587ce80:     	callq	0x1400021d0 <.text+0x11d0>
14587ce85:     	testq	%r15, %r15
14587ce88:     	cmoveq	%r13, %rdi
14587ce8c:     	cmovneq	%r15, %r14
14587ce90:     	movq	%rbx, %r13
14587ce93:     	leaq	0x8(%rbp), %rbx
14587ce97:     	jmp	0x14587cec2 <.text+0x587bec2>
14587ce99:     	leaq	0x133682a(%rip), %r14   # 0x146bb36ca
14587cea0:     	movl	$0x15, %r15d
14587cea6:     	movl	$0x15, %edx
14587ceab:     	movq	%r14, %rcx
14587ceae:     	callq	0x1458da590 <.text+0x58d9590>
14587ceb3:     	nop
14587ceb4:     	movq	%rdx, %rdi
14587ceb7:     	testq	%rax, %rax
14587ceba:     	cmoveq	%r15, %rdi
14587cebe:     	cmovneq	%rax, %r14
14587cec2:     	movq	%r14, 0x8(%rbp)
14587cec6:     	movq	%rdi, 0x10(%rbp)
14587ceca:     	leaq	-0x38(%rbp), %rax
14587cece:     	movq	%rax, -0x18(%rbp)
14587ced2:     	movq	%r12, -0x10(%rbp)
14587ced6:     	movq	%rbx, -0x8(%rbp)
14587ceda:     	movq	%r12, (%rbp)
14587cede:     	leaq	0x1336808(%rip), %rdx   # 0x146bb36ed
14587cee5:     	leaq	-0x50(%rbp), %rcx
14587cee9:     	leaq	-0x18(%rbp), %r8
14587ceed:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14587cef2:     	nop
14587cef3:     	movq	0x40(%rbp), %rax
14587cef7:     	movq	%rax, 0x40(%r13)
14587cefb:     	movups	0x30(%rbp), %xmm0
14587ceff:     	movups	%xmm0, 0x30(%r13)
14587cf04:     	movq	0x20(%rbp), %rax
14587cf08:     	movq	%rax, (%r13)
14587cf0c:     	movq	0x18(%rbp), %rax
14587cf10:     	movq	%rax, 0x8(%r13)
14587cf14:     	movq	%rsi, 0x10(%r13)
14587cf18:     	movups	-0x50(%rbp), %xmm0
14587cf1c:     	movups	%xmm0, 0x18(%r13)
14587cf21:     	movq	-0x40(%rbp), %rax
14587cf25:     	movq	%rax, 0x28(%r13)
14587cf29:     	movq	0x28(%rbp), %rax
14587cf2d:     	movq	%rax, 0x48(%r13)
14587cf31:     	movq	-0x28(%rbp), %rax
14587cf35:     	movq	%rax, 0x50(%r13)
14587cf39:     	movq	$0x4, 0x58(%r13)
14587cf41:     	movq	$0x4, 0x60(%r13)
14587cf49:     	movl	$0x1, 0x68(%r13)
14587cf51:     	movq	%r13, %rax
14587cf54:     	movaps	0x50(%rbp), %xmm6
14587cf58:     	addq	$0xe8, %rsp
14587cf5f:     	popq	%rbx
14587cf60:     	popq	%rdi
14587cf61:     	popq	%rsi
14587cf62:     	popq	%r12
14587cf64:     	popq	%r13
14587cf66:     	popq	%r14
14587cf68:     	popq	%r15
14587cf6a:     	popq	%rbp
14587cf6b:     	retq
14587cf6c:     	cmpq	0x30(%rbp), %rbx
14587cf70:     	jne	0x14587cf7c <.text+0x587bf7c>
14587cf72:     	leaq	0x30(%rbp), %rcx
14587cf76:     	callq	0x145bfb270 <.text+0x5bfa270>
14587cf7b:     	nop
14587cf7c:     	movq	0x38(%rbp), %rax
14587cf80:     	movl	%ebx, %ecx
14587cf82:     	shll	$0x6, %ecx
14587cf85:     	movb	$0x6, (%rax,%rcx)
14587cf89:     	movabsq	$0x3e99999a00000003, %rdx # imm = 0x3E99999A00000003
14587cf93:     	movq	%rdx, 0x4(%rax,%rcx)
14587cf98:     	movl	$0x0, 0x10(%rax,%rcx)
14587cfa0:     	movb	$0x1, 0x18(%rax,%rcx)
14587cfa5:     	movq	%r14, 0x20(%rax,%rcx)
14587cfaa:     	movq	$0x9, 0x28(%rax,%rcx)
14587cfb3:     	jmp	0x14587cd52 <.text+0x587bd52>
14587cfb8:     	movq	-0x8(%rbp), %rdx
14587cfbc:     	movq	%r14, %rcx
14587cfbf:     	callq	0x145d6944b <.text+0x5d6844b>
14587cfc4:     	nop
14587cfc5:     	ud2
