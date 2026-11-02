
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14009ad90:     	pushq	%r15
14009ad92:     	pushq	%r14
14009ad94:     	pushq	%r13
14009ad96:     	pushq	%r12
14009ad98:     	pushq	%rsi
14009ad99:     	pushq	%rdi
14009ad9a:     	pushq	%rbp
14009ad9b:     	pushq	%rbx
14009ad9c:     	subq	$0x128, %rsp            # imm = 0x128
14009ada3:     	movaps	%xmm15, 0x110(%rsp)
14009adac:     	movaps	%xmm14, 0x100(%rsp)
14009adb5:     	movaps	%xmm13, 0xf0(%rsp)
14009adbe:     	movaps	%xmm12, 0xe0(%rsp)
14009adc7:     	movaps	%xmm11, 0xd0(%rsp)
14009add0:     	movaps	%xmm10, 0xc0(%rsp)
14009add9:     	movaps	%xmm9, 0xb0(%rsp)
14009ade2:     	movaps	%xmm8, 0xa0(%rsp)
14009adeb:     	movaps	%xmm7, 0x90(%rsp)
14009adf3:     	movaps	%xmm6, 0x80(%rsp)
14009adfb:     	movq	(%rdx), %rax
14009adfe:     	movq	(%r8), %rcx
14009ae01:     	movq	0x8(%r8), %rdi
14009ae05:     	movl	0x14(%r8), %edx
14009ae09:     	movl	%edx, 0x64(%rsp)
14009ae0d:     	movss	0x5c(%rax), %xmm7
14009ae12:     	movq	0xf8(%rcx), %r14
14009ae19:     	movq	0x100(%rcx), %rax
14009ae20:     	leaq	(%r14,%rax,4), %r15
14009ae24:     	movq	%rcx, 0x38(%rsp)
14009ae29:     	movzbl	0x108(%rcx), %eax
14009ae30:     	movb	%al, 0x2f(%rsp)
14009ae34:     	movq	$0x0, 0x40(%rsp)
14009ae3d:     	movl	$0x8, %eax
14009ae42:     	movq	%rax, 0x68(%rsp)
14009ae47:     	movss	0x585e11c(%rip), %xmm8  # 0x1458f8f6c
14009ae50:     	movss	0x585e117(%rip), %xmm9  # 0x1458f8f70
14009ae59:     	movss	0x585b7be(%rip), %xmm10 # 0x1458f6620
14009ae62:     	movss	0x585e109(%rip), %xmm11 # 0x1458f8f74
14009ae6b:     	movss	0x585e104(%rip), %xmm12 # 0x1458f8f78
14009ae74:     	movss	0x5850603(%rip), %xmm13 # 0x1458eb480
14009ae7d:     	movss	0x585068e(%rip), %xmm14 # 0x1458eb514
14009ae86:     	movsd	0x585e0f1(%rip), %xmm15 # 0x1458f8f80
14009ae8f:     	movq	$0x0, 0x48(%rsp)
14009ae98:     	xorl	%r12d, %r12d
14009ae9b:     	xorl	%ebx, %ebx
14009ae9d:     	movq	$0x0, 0x30(%rsp)
14009aea6:     	jmp	0x14009aeda <.text+0x99eda>
14009aea8:     	nopl	(%rax,%rax)
14009aeb0:     	incl	%ebx
14009aeb2:     	mulss	%xmm14, %xmm0
14009aeb7:     	movq	0x78(%rsp), %rcx
14009aebc:     	movl	%eax, (%rcx)
14009aebe:     	movl	$0x0, (%r13)
14009aec6:     	movsd	%xmm15, 0x4(%r13)
14009aecc:     	movl	$0x3e8f5c29, 0xc(%r13)  # imm = 0x3E8F5C29
14009aed4:     	movss	%xmm0, 0x10(%r13)
14009aeda:     	cmpb	$0x0, 0x2f(%rsp)
14009aedf:     	je	0x14009af60 <.text+0x99f60>
14009aee1:     	cmpl	%r12d, %ebx
14009aee4:     	jne	0x14009b05d <.text+0x9a05d>
14009aeea:     	nopw	(%rax,%rax)
14009aef0:     	cmpq	%r15, %r14
14009aef3:     	je	0x14009b1a5 <.text+0x9a1a5>
14009aef9:     	movl	(%r14), %ecx
14009aefc:     	addq	$0x4, %r14
14009af00:     	movq	0x1a8(%rdi), %rax
14009af07:     	leaq	(%rcx,%rcx,8), %rcx
14009af0b:     	movq	0x10(%rax,%rcx,8), %r12
14009af10:     	testq	%r12, %r12
14009af13:     	je	0x14009aef0 <.text+0x99ef0>
14009af15:     	leaq	(%rax,%rcx,8), %rcx
14009af19:     	movq	0x38(%rsp), %rax
14009af1e:     	movq	0x110(%rax), %rdx
14009af25:     	movq	0x38(%rcx), %rax
14009af29:     	cmpq	0x40(%rcx), %rdx
14009af2d:     	jae	0x14009aff5 <.text+0x99ff5>
14009af33:     	movq	(%rax,%rdx,8), %rdx
14009af37:     	movq	0x18(%rcx), %rcx
14009af3b:     	testq	%rdx, %rdx
14009af3e:     	je	0x14009aff9 <.text+0x99ff9>
14009af44:     	notq	%rdx
14009af47:     	leaq	(%rdx,%rdx,2), %rdx
14009af4b:     	shlq	$0x4, %rdx
14009af4f:     	movq	0x10(%rcx,%rdx), %rdx
14009af54:     	movq	%rdx, 0x30(%rsp)
14009af59:     	jmp	0x14009b002 <.text+0x9a002>
14009af5e:     	nop
14009af60:     	cmpl	%r12d, %ebx
14009af63:     	jne	0x14009b0d5 <.text+0x9a0d5>
14009af69:     	nopl	(%rax)
14009af70:     	cmpq	%r15, %r14
14009af73:     	je	0x14009b1a5 <.text+0x9a1a5>
14009af79:     	movl	(%r14), %ecx
14009af7c:     	addq	$0x4, %r14
14009af80:     	movq	0x108(%rdi), %rax
14009af87:     	leaq	(%rcx,%rcx,4), %rcx
14009af8b:     	shlq	$0x5, %rcx
14009af8f:     	movq	0x58(%rax,%rcx), %r12
14009af94:     	testq	%r12, %r12
14009af97:     	je	0x14009af70 <.text+0x99f70>
14009af99:     	addq	%rcx, %rax
14009af9c:     	movl	0x94(%rax), %ecx
14009afa2:     	movq	0x1a8(%rdi), %r9
14009afa9:     	leaq	(%rcx,%rcx,8), %r10
14009afad:     	leaq	(%r9,%r10,8), %rdx
14009afb1:     	movq	0x38(%rsp), %rcx
14009afb6:     	movq	0x110(%rcx), %r8
14009afbd:     	movq	0x38(%r9,%r10,8), %rcx
14009afc2:     	cmpq	0x40(%r9,%r10,8), %r8
14009afc7:     	jae	0x14009b064 <.text+0x9a064>
14009afcd:     	movq	(%rcx,%r8,8), %r8
14009afd1:     	movq	0x18(%rdx), %rdx
14009afd5:     	testq	%r8, %r8
14009afd8:     	je	0x14009b068 <.text+0x9a068>
14009afde:     	notq	%r8
14009afe1:     	leaq	(%r8,%r8,2), %r8
14009afe5:     	shlq	$0x4, %r8
14009afe9:     	movq	0x10(%rdx,%r8), %r8
14009afee:     	movq	%r8, 0x30(%rsp)
14009aff3:     	jmp	0x14009b071 <.text+0x9a071>
14009aff5:     	movq	0x18(%rcx), %rcx
14009aff9:     	movq	$0x0, 0x30(%rsp)
14009b002:     	movq	0x38(%rsp), %r8
14009b007:     	movq	0x118(%r8), %rdx
14009b00e:     	movq	0x120(%r8), %r8
14009b015:     	movq	(%rax,%rdx,8), %rdx
14009b019:     	notq	%rdx
14009b01c:     	leaq	(%rdx,%rdx,2), %rdx
14009b020:     	shlq	$0x4, %rdx
14009b024:     	movq	0x10(%rcx,%rdx), %r9
14009b029:     	movq	%r9, 0x48(%rsp)
14009b02e:     	movq	0x28(%rcx,%rdx), %rdx
14009b033:     	movq	%rdx, 0x58(%rsp)
14009b038:     	movq	(%rax,%r8,8), %rax
14009b03c:     	notq	%rax
14009b03f:     	leaq	(%rax,%rax,2), %rax
14009b043:     	shlq	$0x4, %rax
14009b047:     	movq	0x10(%rcx,%rax), %rdx
14009b04c:     	movq	%rdx, 0x40(%rsp)
14009b051:     	movq	0x28(%rcx,%rax), %rax
14009b056:     	movq	%rax, 0x50(%rsp)
14009b05b:     	xorl	%ebx, %ebx
14009b05d:     	movl	%ebx, %esi
14009b05f:     	jmp	0x14009b0e6 <.text+0x9a0e6>
14009b064:     	movq	0x18(%rdx), %rdx
14009b068:     	movq	$0x0, 0x30(%rsp)
14009b071:     	movq	0x38(%rsp), %r9
14009b076:     	movq	0x118(%r9), %r8
14009b07d:     	movq	0x120(%r9), %r9
14009b084:     	movq	(%rcx,%r8,8), %r8
14009b088:     	notq	%r8
14009b08b:     	leaq	(%r8,%r8,2), %r8
14009b08f:     	shlq	$0x4, %r8
14009b093:     	movq	0x10(%rdx,%r8), %r10
14009b098:     	movq	%r10, 0x48(%rsp)
14009b09d:     	movq	0x28(%rdx,%r8), %r8
14009b0a2:     	movq	%r8, 0x58(%rsp)
14009b0a7:     	movq	(%rcx,%r9,8), %rcx
14009b0ab:     	notq	%rcx
14009b0ae:     	leaq	(%rcx,%rcx,2), %rcx
14009b0b2:     	shlq	$0x4, %rcx
14009b0b6:     	movq	0x10(%rdx,%rcx), %r8
14009b0bb:     	movq	%r8, 0x40(%rsp)
14009b0c0:     	movq	0x28(%rdx,%rcx), %rcx
14009b0c5:     	movq	%rcx, 0x50(%rsp)
14009b0ca:     	movq	0x50(%rax), %rax
14009b0ce:     	movq	%rax, 0x68(%rsp)
14009b0d3:     	xorl	%ebx, %ebx
14009b0d5:     	movl	%ebx, %eax
14009b0d7:     	shlq	$0x4, %rax
14009b0db:     	movq	0x68(%rsp), %rcx
14009b0e0:     	movl	0x8(%rcx,%rax), %esi
14009b0e4:     	notl	%esi
14009b0e6:     	leaq	(%rsi,%rsi,2), %rbp
14009b0ea:     	movq	0x58(%rsp), %rax
14009b0ef:     	leaq	(%rax,%rsi,4), %rax
14009b0f3:     	movq	%rax, 0x70(%rsp)
14009b0f8:     	leaq	(%rsi,%rsi,4), %rax
14009b0fc:     	movq	0x50(%rsp), %rcx
14009b101:     	leaq	(%rcx,%rsi,4), %rcx
14009b105:     	movq	%rcx, 0x78(%rsp)
14009b10a:     	shlq	$0x4, %rsi
14009b10e:     	addq	0x30(%rsp), %rsi
14009b113:     	shlq	$0x7, %rbp
14009b117:     	addq	0x48(%rsp), %rbp
14009b11c:     	movq	0x40(%rsp), %rcx
14009b121:     	leaq	(%rcx,%rax,4), %r13
14009b125:     	movss	0x4(%rsi), %xmm6
14009b12a:     	mulss	%xmm7, %xmm6
14009b12e:     	addss	0xc(%rsi), %xmm6
14009b133:     	movaps	%xmm6, %xmm0
14009b136:     	callq	0x145756e25 <.text+0x5755e25>
14009b13b:     	subss	%xmm0, %xmm6
14009b13f:     	movss	0x8(%rsi), %xmm0
14009b144:     	mulss	%xmm6, %xmm0
14009b148:     	addss	(%rsi), %xmm0
14009b14c:     	movl	$0x2, 0x68(%rbp)
14009b153:     	movss	%xmm0, 0x6c(%rbp)
14009b158:     	movaps	%xmm6, %xmm0
14009b15b:     	mulss	%xmm8, %xmm0
14009b160:     	addss	%xmm9, %xmm0
14009b165:     	movl	0x64(%rsp), %eax
14009b169:     	movq	0x70(%rsp), %rcx
14009b16e:     	movl	%eax, (%rcx)
14009b170:     	movl	$0x2, 0x78(%rbp)
14009b177:     	movss	%xmm0, 0x7c(%rbp)
14009b17c:     	ucomiss	%xmm6, %xmm10
14009b180:     	movaps	%xmm6, %xmm0
14009b183:     	addss	%xmm11, %xmm0
14009b188:     	divss	%xmm12, %xmm0
14009b18d:     	addss	%xmm13, %xmm0
14009b192:     	jbe	0x14009aeb0 <.text+0x99eb0>
14009b198:     	divss	%xmm10, %xmm6
14009b19d:     	movaps	%xmm6, %xmm0
14009b1a0:     	jmp	0x14009aeb0 <.text+0x99eb0>
14009b1a5:     	movaps	0x80(%rsp), %xmm6
14009b1ad:     	movaps	0x90(%rsp), %xmm7
14009b1b5:     	movaps	0xa0(%rsp), %xmm8
14009b1be:     	movaps	0xb0(%rsp), %xmm9
14009b1c7:     	movaps	0xc0(%rsp), %xmm10
14009b1d0:     	movaps	0xd0(%rsp), %xmm11
14009b1d9:     	movaps	0xe0(%rsp), %xmm12
14009b1e2:     	movaps	0xf0(%rsp), %xmm13
14009b1eb:     	movaps	0x100(%rsp), %xmm14
14009b1f4:     	movaps	0x110(%rsp), %xmm15
14009b1fd:     	addq	$0x128, %rsp            # imm = 0x128
14009b204:     	popq	%rbx
14009b205:     	popq	%rbp
14009b206:     	popq	%rdi
14009b207:     	popq	%rsi
14009b208:     	popq	%r12
14009b20a:     	popq	%r13
14009b20c:     	popq	%r14
14009b20e:     	popq	%r15
14009b210:     	retq
