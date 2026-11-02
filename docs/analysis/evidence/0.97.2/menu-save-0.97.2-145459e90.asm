
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145459e90:     	pushq	%r14
145459e92:     	pushq	%rsi
145459e93:     	pushq	%rdi
145459e94:     	pushq	%rbp
145459e95:     	pushq	%rbx
145459e96:     	subq	$0x90, %rsp
145459e9d:     	movq	%r9, %rdi
145459ea0:     	movl	%edx, %ebx
145459ea2:     	movq	%rcx, %rsi
145459ea5:     	movq	0xe0(%rsp), %r14
145459ead:     	callq	0x145459600 <.text+0x5458600>
145459eb2:     	addb	$-0x2, %bl
145459eb5:     	cmpb	$0x7, %bl
145459eb8:     	setb	%al
145459ebb:     	movb	$0x59, %dl
145459ebd:     	movl	%ebx, %ecx
145459ebf:     	shrb	%cl, %dl
145459ec1:     	andb	%al, %dl
145459ec3:     	cmpb	$0x1, %dl
145459ec6:     	jne	0x145459fd9 <.text+0x5458fd9>
145459ecc:     	xorl	%eax, %eax
145459ece:     	movl	$0xcccccccd, %ecx       # imm = 0xCCCCCCCD
145459ed3:     	jmp	0x145459ef0 <.text+0x5458ef0>
145459ed5:     	nopw	%cs:(%rax,%rax)
145459ee0:     	movl	%edx, (%rsi,%rax,4)
145459ee3:     	incq	%rax
145459ee6:     	cmpq	$0x13, %rax
145459eea:     	je	0x14545a1af <.text+0x54591af>
145459ef0:     	movl	(%rdi,%rax,4), %edx
145459ef3:     	testl	%edx, %edx
145459ef5:     	je	0x145459f5b <.text+0x5458f5b>
145459ef7:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
145459efd:     	jb	0x145459f58 <.text+0x5458f58>
145459eff:     	leal	-0x186a0(%rdx), %r8d
145459f06:     	cmpl	$0x2edf, %r8d           # imm = 0x2EDF
145459f0d:     	ja	0x145459f58 <.text+0x5458f58>
145459f0f:     	movq	%r8, %r9
145459f12:     	imulq	%rcx, %r9
145459f16:     	shrq	$0x23, %r9
145459f1a:     	addl	%r9d, %r9d
145459f1d:     	leal	(%r9,%r9,4), %r9d
145459f21:     	movl	%r8d, %r10d
145459f24:     	subl	%r9d, %r10d
145459f27:     	jne	0x145459f58 <.text+0x5458f58>
145459f29:     	imull	$0xcccd, %r8d, %r8d     # imm = 0xCCCD
145459f30:     	shrl	$0x13, %r8d
145459f34:     	imull	$0xffffcccd, %r8d, %r8d # imm = 0xFFFFCCCD
145459f3b:     	decl	%r8d
145459f3e:     	rorw	%r8w
145459f42:     	movzwl	%r8w, %r8d
145459f46:     	leal	0xa(%rdx), %r9d
145459f4a:     	cmpl	$0x199a, %r8d           # imm = 0x199A
145459f51:     	cmovael	%edx, %r9d
145459f55:     	movl	%r9d, %edx
145459f58:     	movl	%edx, (%rsi,%rax,4)
145459f5b:     	cmpl	$0x1, (%r14,%rax,8)
145459f60:     	jne	0x145459ee3 <.text+0x5458ee3>
145459f62:     	movl	0x4(%r14,%rax,8), %edx
145459f67:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
145459f6d:     	jb	0x145459ee0 <.text+0x5458ee0>
145459f73:     	leal	-0x186a0(%rdx), %r8d
145459f7a:     	cmpl	$0x2edf, %r8d           # imm = 0x2EDF
145459f81:     	ja	0x145459ee0 <.text+0x5458ee0>
145459f87:     	movq	%r8, %r9
145459f8a:     	imulq	%rcx, %r9
145459f8e:     	shrq	$0x23, %r9
145459f92:     	addl	%r9d, %r9d
145459f95:     	leal	(%r9,%r9,4), %r9d
145459f99:     	movl	%r8d, %r10d
145459f9c:     	subl	%r9d, %r10d
145459f9f:     	jne	0x145459ee0 <.text+0x5458ee0>
145459fa5:     	imull	$0xcccd, %r8d, %r8d     # imm = 0xCCCD
145459fac:     	shrl	$0x13, %r8d
145459fb0:     	imull	$0xffffcccd, %r8d, %r8d # imm = 0xFFFFCCCD
145459fb7:     	decl	%r8d
145459fba:     	rorw	%r8w
145459fbe:     	movzwl	%r8w, %r8d
145459fc2:     	leal	0xa(%rdx), %r9d
145459fc6:     	cmpl	$0x199a, %r8d           # imm = 0x199A
145459fcd:     	cmovael	%edx, %r9d
145459fd1:     	movl	%r9d, %edx
145459fd4:     	jmp	0x145459ee0 <.text+0x5458ee0>
145459fd9:     	movl	(%rdi), %eax
145459fdb:     	testl	%eax, %eax
145459fdd:     	je	0x145459fe1 <.text+0x5458fe1>
145459fdf:     	movl	%eax, (%rsi)
145459fe1:     	cmpl	$0x1, (%r14)
145459fe5:     	jne	0x145459fed <.text+0x5458fed>
145459fe7:     	movl	0x4(%r14), %eax
145459feb:     	movl	%eax, (%rsi)
145459fed:     	movl	0x4(%rdi), %eax
145459ff0:     	testl	%eax, %eax
145459ff2:     	je	0x145459ff7 <.text+0x5458ff7>
145459ff4:     	movl	%eax, 0x4(%rsi)
145459ff7:     	cmpl	$0x1, 0x8(%r14)
145459ffc:     	jne	0x14545a005 <.text+0x5459005>
145459ffe:     	movl	0xc(%r14), %eax
14545a002:     	movl	%eax, 0x4(%rsi)
14545a005:     	movl	0x8(%rdi), %eax
14545a008:     	testl	%eax, %eax
14545a00a:     	je	0x14545a00f <.text+0x545900f>
14545a00c:     	movl	%eax, 0x8(%rsi)
14545a00f:     	cmpl	$0x1, 0x10(%r14)
14545a014:     	jne	0x14545a01d <.text+0x545901d>
14545a016:     	movl	0x14(%r14), %eax
14545a01a:     	movl	%eax, 0x8(%rsi)
14545a01d:     	movl	0xc(%rdi), %eax
14545a020:     	testl	%eax, %eax
14545a022:     	je	0x14545a027 <.text+0x5459027>
14545a024:     	movl	%eax, 0xc(%rsi)
14545a027:     	cmpl	$0x1, 0x18(%r14)
14545a02c:     	jne	0x14545a035 <.text+0x5459035>
14545a02e:     	movl	0x1c(%r14), %eax
14545a032:     	movl	%eax, 0xc(%rsi)
14545a035:     	movl	0x10(%rdi), %eax
14545a038:     	testl	%eax, %eax
14545a03a:     	je	0x14545a03f <.text+0x545903f>
14545a03c:     	movl	%eax, 0x10(%rsi)
14545a03f:     	cmpl	$0x1, 0x20(%r14)
14545a044:     	jne	0x14545a04d <.text+0x545904d>
14545a046:     	movl	0x24(%r14), %eax
14545a04a:     	movl	%eax, 0x10(%rsi)
14545a04d:     	movl	0x14(%rdi), %eax
14545a050:     	testl	%eax, %eax
14545a052:     	je	0x14545a057 <.text+0x5459057>
14545a054:     	movl	%eax, 0x14(%rsi)
14545a057:     	cmpl	$0x1, 0x28(%r14)
14545a05c:     	jne	0x14545a065 <.text+0x5459065>
14545a05e:     	movl	0x2c(%r14), %eax
14545a062:     	movl	%eax, 0x14(%rsi)
14545a065:     	movl	0x18(%rdi), %eax
14545a068:     	testl	%eax, %eax
14545a06a:     	je	0x14545a06f <.text+0x545906f>
14545a06c:     	movl	%eax, 0x18(%rsi)
14545a06f:     	cmpl	$0x1, 0x30(%r14)
14545a074:     	jne	0x14545a07d <.text+0x545907d>
14545a076:     	movl	0x34(%r14), %eax
14545a07a:     	movl	%eax, 0x18(%rsi)
14545a07d:     	movl	0x1c(%rdi), %eax
14545a080:     	testl	%eax, %eax
14545a082:     	je	0x14545a087 <.text+0x5459087>
14545a084:     	movl	%eax, 0x1c(%rsi)
14545a087:     	cmpl	$0x1, 0x38(%r14)
14545a08c:     	jne	0x14545a095 <.text+0x5459095>
14545a08e:     	movl	0x3c(%r14), %eax
14545a092:     	movl	%eax, 0x1c(%rsi)
14545a095:     	movl	0x20(%rdi), %eax
14545a098:     	testl	%eax, %eax
14545a09a:     	je	0x14545a09f <.text+0x545909f>
14545a09c:     	movl	%eax, 0x20(%rsi)
14545a09f:     	cmpl	$0x1, 0x40(%r14)
14545a0a4:     	jne	0x14545a0ad <.text+0x54590ad>
14545a0a6:     	movl	0x44(%r14), %eax
14545a0aa:     	movl	%eax, 0x20(%rsi)
14545a0ad:     	movl	0x24(%rdi), %eax
14545a0b0:     	testl	%eax, %eax
14545a0b2:     	je	0x14545a0b7 <.text+0x54590b7>
14545a0b4:     	movl	%eax, 0x24(%rsi)
14545a0b7:     	cmpl	$0x1, 0x48(%r14)
14545a0bc:     	jne	0x14545a0c5 <.text+0x54590c5>
14545a0be:     	movl	0x4c(%r14), %eax
14545a0c2:     	movl	%eax, 0x24(%rsi)
14545a0c5:     	movl	0x28(%rdi), %eax
14545a0c8:     	testl	%eax, %eax
14545a0ca:     	je	0x14545a0cf <.text+0x54590cf>
14545a0cc:     	movl	%eax, 0x28(%rsi)
14545a0cf:     	cmpl	$0x1, 0x50(%r14)
14545a0d4:     	jne	0x14545a0dd <.text+0x54590dd>
14545a0d6:     	movl	0x54(%r14), %eax
14545a0da:     	movl	%eax, 0x28(%rsi)
14545a0dd:     	movl	0x2c(%rdi), %eax
14545a0e0:     	testl	%eax, %eax
14545a0e2:     	je	0x14545a0e7 <.text+0x54590e7>
14545a0e4:     	movl	%eax, 0x2c(%rsi)
14545a0e7:     	cmpl	$0x1, 0x58(%r14)
14545a0ec:     	jne	0x14545a0f5 <.text+0x54590f5>
14545a0ee:     	movl	0x5c(%r14), %eax
14545a0f2:     	movl	%eax, 0x2c(%rsi)
14545a0f5:     	movl	0x30(%rdi), %eax
14545a0f8:     	testl	%eax, %eax
14545a0fa:     	je	0x14545a0ff <.text+0x54590ff>
14545a0fc:     	movl	%eax, 0x30(%rsi)
14545a0ff:     	cmpl	$0x1, 0x60(%r14)
14545a104:     	jne	0x14545a10d <.text+0x545910d>
14545a106:     	movl	0x64(%r14), %eax
14545a10a:     	movl	%eax, 0x30(%rsi)
14545a10d:     	movl	0x34(%rdi), %eax
14545a110:     	testl	%eax, %eax
14545a112:     	je	0x14545a117 <.text+0x5459117>
14545a114:     	movl	%eax, 0x34(%rsi)
14545a117:     	cmpl	$0x1, 0x68(%r14)
14545a11c:     	jne	0x14545a125 <.text+0x5459125>
14545a11e:     	movl	0x6c(%r14), %eax
14545a122:     	movl	%eax, 0x34(%rsi)
14545a125:     	movl	0x38(%rdi), %eax
14545a128:     	testl	%eax, %eax
14545a12a:     	je	0x14545a12f <.text+0x545912f>
14545a12c:     	movl	%eax, 0x38(%rsi)
14545a12f:     	cmpl	$0x1, 0x70(%r14)
14545a134:     	jne	0x14545a13d <.text+0x545913d>
14545a136:     	movl	0x74(%r14), %eax
14545a13a:     	movl	%eax, 0x38(%rsi)
14545a13d:     	movl	0x3c(%rdi), %eax
14545a140:     	testl	%eax, %eax
14545a142:     	je	0x14545a147 <.text+0x5459147>
14545a144:     	movl	%eax, 0x3c(%rsi)
14545a147:     	cmpl	$0x1, 0x78(%r14)
14545a14c:     	jne	0x14545a155 <.text+0x5459155>
14545a14e:     	movl	0x7c(%r14), %eax
14545a152:     	movl	%eax, 0x3c(%rsi)
14545a155:     	movl	0x40(%rdi), %eax
14545a158:     	testl	%eax, %eax
14545a15a:     	je	0x14545a15f <.text+0x545915f>
14545a15c:     	movl	%eax, 0x40(%rsi)
14545a15f:     	cmpl	$0x1, 0x80(%r14)
14545a167:     	jne	0x14545a173 <.text+0x5459173>
14545a169:     	movl	0x84(%r14), %eax
14545a170:     	movl	%eax, 0x40(%rsi)
14545a173:     	movl	0x44(%rdi), %eax
14545a176:     	testl	%eax, %eax
14545a178:     	je	0x14545a17d <.text+0x545917d>
14545a17a:     	movl	%eax, 0x44(%rsi)
14545a17d:     	cmpl	$0x1, 0x88(%r14)
14545a185:     	jne	0x14545a191 <.text+0x5459191>
14545a187:     	movl	0x8c(%r14), %eax
14545a18e:     	movl	%eax, 0x44(%rsi)
14545a191:     	movl	0x48(%rdi), %eax
14545a194:     	testl	%eax, %eax
14545a196:     	je	0x14545a19b <.text+0x545919b>
14545a198:     	movl	%eax, 0x48(%rsi)
14545a19b:     	cmpl	$0x1, 0x90(%r14)
14545a1a3:     	jne	0x14545a1af <.text+0x54591af>
14545a1a5:     	movl	0x94(%r14), %eax
14545a1ac:     	movl	%eax, 0x48(%rsi)
14545a1af:     	movl	0x3c(%rsi), %edx
14545a1b2:     	leaq	0x20(%rsp), %rcx
14545a1b7:     	callq	0x14545a320 <.text+0x5459320>
14545a1bc:     	movq	0x20(%rsp), %rdx
14545a1c1:     	cmpq	$-0x1, %rdx
14545a1c5:     	je	0x14545a213 <.text+0x5459213>
14545a1c7:     	movq	0x38(%rsp), %rdi
14545a1cc:     	movq	0x40(%rsp), %rbx
14545a1d1:     	movl	0x80(%rsp), %ebp
14545a1d8:     	testq	%rdx, %rdx
14545a1db:     	je	0x14545a1ed <.text+0x54591ed>
14545a1dd:     	movq	0x28(%rsp), %rcx
14545a1e2:     	movl	$0x1, %r8d
14545a1e8:     	callq	0x1400021d0 <.text+0x11d0>
14545a1ed:     	testq	%rdi, %rdi
14545a1f0:     	je	0x14545a207 <.text+0x5459207>
14545a1f2:     	shlq	$0x3, %rdi
14545a1f6:     	movl	$0x4, %r8d
14545a1fc:     	movq	%rbx, %rcx
14545a1ff:     	movq	%rdi, %rdx
14545a202:     	callq	0x1400021d0 <.text+0x11d0>
14545a207:     	cmpl	$0x11, %ebp
14545a20a:     	jne	0x14545a213 <.text+0x5459213>
14545a20c:     	movl	$0x0, 0x40(%rsi)
14545a213:     	movq	%rsi, %rax
14545a216:     	addq	$0x90, %rsp
14545a21d:     	popq	%rbx
14545a21e:     	popq	%rbp
14545a21f:     	popq	%rdi
14545a220:     	popq	%rsi
14545a221:     	popq	%r14
14545a223:     	retq
