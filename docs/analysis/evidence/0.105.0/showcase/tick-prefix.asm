
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145901e4c:     	cmpb	$0x0, 0xa6c(%r13)
145901e54:     	je	0x1459021ba <.text+0x59011ba>
145901e5a:     	movss	0x478(%r13), %xmm0
145901e63:     	movss	%xmm0, 0x4e0(%r13)
145901e6c:     	movl	$0x0, 0x9f4(%r13)
145901e77:     	ucomiss	0xa4c(%r13), %xmm7
145901e7f:     	jb	0x1459021ba <.text+0x59011ba>
145901e85:     	addss	0x46b3e3(%rip), %xmm7   # 0x145d6d270
145901e8d:     	movss	%xmm7, 0xa4c(%r13)
145901e96:     	movq	0x290(%r13), %rcx
145901e9d:     	movq	0x298(%r13), %rdx
145901ea4:     	callq	0x1458753b0 <.text+0x58743b0>
145901ea9:     	imulq	$0xf0, %rax, %rax
145901eb0:     	leaq	0x12a7599(%rip), %rcx   # 0x146ba9450
145901eb7:     	movq	0x80(%rax,%rcx), %r14
145901ebf:     	testq	%r14, %r14
145901ec2:     	js	0x145901ecb <.text+0x5900ecb>
145901ec4:     	cvtsi2ss	%r14, %xmm11
145901ec9:     	jmp	0x145901ee4 <.text+0x5900ee4>
145901ecb:     	movq	%r14, %rax
145901ece:     	shrq	%rax
145901ed1:     	movl	%r14d, %ecx
145901ed4:     	andl	$0x1, %ecx
145901ed7:     	orq	%rax, %rcx
145901eda:     	cvtsi2ss	%rcx, %xmm11
145901edf:     	addss	%xmm11, %xmm11
145901ee4:     	movsd	0x4c8(%r13), %xmm10
145901eed:     	movss	0x4d0(%r13), %xmm9
145901ef6:     	xorl	%ebx, %ebx
145901ef8:     	movss	0x472147(%rip), %xmm12  # 0x145d74048
145901f01:     	movaps	0x15764c7(%rip), %xmm13 # 0x146e783d0
145901f09:     	leaq	0xa0(%rbp), %rdi
145901f10:     	jmp	0x145901f60 <.text+0x5900f60>
145901f12:     	nopw	%cs:(%rax,%rax)
145901f20:     	movss	0xb8(%r15), %xmm0
145901f29:     	leaq	0x1(%rbx), %rsi
145901f2d:     	movlps	%xmm7, 0xa4(%rbp)
145901f34:     	movss	%xmm0, 0xac(%rbp)
145901f3c:     	movl	$0x1, 0xa0(%rbp)
145901f46:     	movq	%r13, %rcx
145901f49:     	movq	%rbx, %rdx
145901f4c:     	movq	%rdi, %r8
145901f4f:     	callq	0x145932fe0 <.text+0x5931fe0>
145901f54:     	movq	%rsi, %rbx
145901f57:     	cmpq	%rsi, %r14
145901f5a:     	je	0x145902012 <.text+0x5901012>
145901f60:     	testq	%rbx, %rbx
145901f63:     	js	0x145901f70 <.text+0x5900f70>
145901f65:     	xorps	%xmm8, %xmm8
145901f69:     	cvtsi2ss	%rbx, %xmm8
145901f6e:     	jmp	0x145901f8c <.text+0x5900f8c>
145901f70:     	movq	%rbx, %rax
145901f73:     	shrq	%rax
145901f76:     	movl	%ebx, %ecx
145901f78:     	andl	$0x1, %ecx
145901f7b:     	orq	%rax, %rcx
145901f7e:     	xorps	%xmm8, %xmm8
145901f82:     	cvtsi2ss	%rcx, %xmm8
145901f87:     	addss	%xmm8, %xmm8
145901f8c:     	divss	%xmm11, %xmm8
145901f91:     	mulss	%xmm12, %xmm8
145901f96:     	movaps	%xmm8, %xmm0
145901f9a:     	callq	0x145bc97c3 <.text+0x5bc87c3>
145901f9f:     	movaps	%xmm0, %xmm7
145901fa2:     	movaps	%xmm8, %xmm0
145901fa6:     	callq	0x145bc97bd <.text+0x5bc87bd>
145901fab:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
145901fae:     	mulps	%xmm13, %xmm7
145901fb2:     	addps	%xmm10, %xmm7
145901fb6:     	movshdup	%xmm7, %xmm8            # xmm8 = xmm7[1,1,3,3]
145901fbb:     	movq	0x950(%r13), %r15
145901fc2:     	leaq	0x10(%r15), %rcx
145901fc6:     	movaps	%xmm7, %xmm1
145901fc9:     	movaps	%xmm8, %xmm2
145901fcd:     	callq	0x1458c7b60 <.text+0x58c6b60>
145901fd2:     	testb	$0x1, %al
145901fd4:     	jne	0x145901f29 <.text+0x5900f29>
145901fda:     	cmpq	$-0x1, 0x68(%r15)
145901fdf:     	je	0x145901f20 <.text+0x5900f20>
145901fe5:     	leaq	0x68(%r15), %rdx
145901fe9:     	movq	%rdi, %rcx
145901fec:     	movaps	%xmm7, %xmm2
145901fef:     	movaps	%xmm8, %xmm3
145901ff3:     	callq	0x1458cc950 <.text+0x58cb950>
145901ff8:     	cmpl	$0x1, 0xa0(%rbp)
145901fff:     	jne	0x145901f20 <.text+0x5900f20>
145902005:     	movss	0xac(%rbp), %xmm0
14590200d:     	jmp	0x145901f29 <.text+0x5900f29>
145902012:     	movss	0x559cde(%rip), %xmm0   # 0x145e5bcf8
14590201a:     	addps	%xmm10, %xmm0
14590201e:     	movlps	%xmm0, 0xa0(%rbp)
145902025:     	movss	%xmm9, 0xa8(%rbp)
14590202e:     	leaq	0xa0(%rbp), %rdi
145902035:     	movq	%r13, %rcx
145902038:     	xorl	%edx, %edx
14590203a:     	movl	$0x1, %r8d
145902040:     	movq	%rdi, %r9
145902043:     	callq	0x145939820 <.text+0x5938820>
145902048:     	movsd	0x1576390(%rip), %xmm0  # 0x146e783e0
145902050:     	addps	%xmm10, %xmm0
145902054:     	movlps	%xmm0, 0xa0(%rbp)
14590205b:     	movss	%xmm9, 0xa8(%rbp)
145902064:     	movq	%r13, %rcx
145902067:     	xorl	%edx, %edx
145902069:     	movl	$0x5, %r8d
14590206f:     	movq	%rdi, %r9
145902072:     	callq	0x145939820 <.text+0x5938820>
145902077:     	movsd	0x1576371(%rip), %xmm0  # 0x146e783f0
14590207f:     	addps	%xmm10, %xmm0
145902083:     	movlps	%xmm0, 0xa0(%rbp)
14590208a:     	movss	%xmm9, 0xa8(%rbp)
145902093:     	movq	%r13, %rcx
145902096:     	xorl	%edx, %edx
145902098:     	movl	$0x1e, %r8d
14590209e:     	movq	%rdi, %r9
1459020a1:     	callq	0x145939820 <.text+0x5938820>
1459020a6:     	movsd	0x1576352(%rip), %xmm0  # 0x146e78400
1459020ae:     	addps	%xmm10, %xmm0
1459020b2:     	movlps	%xmm0, 0xa0(%rbp)
1459020b9:     	movss	%xmm9, 0xa8(%rbp)
1459020c2:     	movq	%r13, %rcx
1459020c5:     	movl	$0x1, %edx
1459020ca:     	movl	$0x1, %r8d
1459020d0:     	movq	%rdi, %r9
1459020d3:     	callq	0x145939820 <.text+0x5938820>
1459020d8:     	movsd	0x1576330(%rip), %xmm0  # 0x146e78410
1459020e0:     	addps	%xmm10, %xmm0
1459020e4:     	movlps	%xmm0, 0xa0(%rbp)
1459020eb:     	movss	%xmm9, 0xa8(%rbp)
1459020f4:     	movq	%r13, %rcx
1459020f7:     	movl	$0x2, %edx
1459020fc:     	movq	%rdi, %r9
1459020ff:     	callq	0x145939820 <.text+0x5938820>
145902104:     	movsd	0x1576314(%rip), %xmm0  # 0x146e78420
14590210c:     	addps	%xmm10, %xmm0
145902110:     	movlps	%xmm0, 0xa0(%rbp)
145902117:     	movss	%xmm9, 0xa8(%rbp)
145902120:     	movq	%r13, %rcx
145902123:     	movl	$0x3, %edx
145902128:     	movq	%rdi, %r9
14590212b:     	callq	0x145939820 <.text+0x5938820>
145902130:     	movsd	0x15762f8(%rip), %xmm0  # 0x146e78430
145902138:     	addps	%xmm10, %xmm0
14590213c:     	movlps	%xmm0, 0xa0(%rbp)
145902143:     	movss	%xmm9, 0xa8(%rbp)
14590214c:     	movq	%r13, %rcx
14590214f:     	movl	$0x4, %edx
145902154:     	movq	%rdi, %r9
145902157:     	callq	0x145939820 <.text+0x5938820>
14590215c:     	movsd	0x15762dc(%rip), %xmm0  # 0x146e78440
145902164:     	addps	%xmm10, %xmm0
145902168:     	movlps	%xmm0, 0xa0(%rbp)
14590216f:     	movss	%xmm9, 0xa8(%rbp)
145902178:     	movq	%r13, %rcx
14590217b:     	movl	$0x5, %edx
145902180:     	movq	%rdi, %r9
145902183:     	callq	0x145939820 <.text+0x5938820>
145902188:     	addps	0x15762c0(%rip), %xmm10 # 0x146e78450
145902190:     	movlps	%xmm10, 0xa0(%rbp)
145902198:     	movss	%xmm9, 0xa8(%rbp)
1459021a1:     	movq	%r13, %rcx
1459021a4:     	movl	$0x6, %edx
1459021a9:     	movq	%rdi, %r9
1459021ac:     	callq	0x145939820 <.text+0x5938820>
1459021b1:     	movss	0x9ec(%r13), %xmm7
