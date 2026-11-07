
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458df010:     	pushq	%r14
1458df012:     	pushq	%rsi
1458df013:     	pushq	%rdi
1458df014:     	pushq	%rbx
1458df015:     	subq	$0x28, %rsp
1458df019:     	testq	%rdx, %rdx
1458df01c:     	je	0x1458df096 <.text+0x58de096>
1458df01e:     	movq	%rdx, %r10
1458df021:     	movq	%rcx, %r9
1458df024:     	movq	%rdx, %rax
1458df027:     	shrq	$0x20, %rax
1458df02b:     	movq	(%r8), %r11
1458df02e:     	jne	0x1458df09a <.text+0x58de09a>
1458df030:     	bsrl	%r10d, %ecx
1458df034:     	notl	%ecx
1458df036:     	movl	%r10d, %eax
1458df039:     	shll	%cl, %eax
1458df03b:     	decl	%eax
1458df03d:     	movq	0x18(%r8), %rdi
1458df041:     	movq	0x8(%r8), %rsi
1458df045:     	movq	0x10(%r8), %rcx
1458df049:     	nopl	(%rax)
1458df050:     	leaq	(%r11,%rdi), %rdx
1458df054:     	rolq	$0x17, %rdx
1458df058:     	addq	%r11, %rdx
1458df05b:     	movq	%rsi, %rbx
1458df05e:     	shlq	$0x11, %rbx
1458df062:     	xorq	%r11, %rcx
1458df065:     	xorq	%rsi, %rdi
1458df068:     	xorq	%rcx, %rsi
1458df06b:     	xorq	%rdi, %r11
1458df06e:     	rolq	$0x2d, %rdi
1458df072:     	xorq	%rbx, %rcx
1458df075:     	shrq	$0x20, %rdx
1458df079:     	imulq	%r10, %rdx
1458df07d:     	cmpl	%edx, %eax
1458df07f:     	jb	0x1458df050 <.text+0x58de050>
1458df081:     	movq	%r11, (%r8)
1458df084:     	movq	%rdi, 0x18(%r8)
1458df088:     	movq	%rsi, 0x8(%r8)
1458df08c:     	movq	%rcx, 0x10(%r8)
1458df090:     	shrq	$0x20, %rdx
1458df094:     	jmp	0x1458df0fc <.text+0x58de0fc>
1458df096:     	xorl	%eax, %eax
1458df098:     	jmp	0x1458df105 <.text+0x58de105>
1458df09a:     	bsrq	%r10, %rcx
1458df09e:     	notl	%ecx
1458df0a0:     	movq	%r10, %rsi
1458df0a3:     	shlq	%cl, %rsi
1458df0a6:     	decq	%rsi
1458df0a9:     	movq	0x18(%r8), %rbx
1458df0ad:     	movq	0x8(%r8), %rdi
1458df0b1:     	movq	0x10(%r8), %rcx
1458df0b5:     	nopw	%cs:(%rax,%rax)
1458df0c0:     	leaq	(%r11,%rbx), %rax
1458df0c4:     	rolq	$0x17, %rax
1458df0c8:     	addq	%r11, %rax
1458df0cb:     	movq	%rdi, %r14
1458df0ce:     	shlq	$0x11, %r14
1458df0d2:     	xorq	%r11, %rcx
1458df0d5:     	xorq	%rdi, %rbx
1458df0d8:     	xorq	%rbx, %r11
1458df0db:     	rolq	$0x2d, %rbx
1458df0df:     	xorq	%rcx, %rdi
1458df0e2:     	mulq	%r10
1458df0e5:     	xorq	%r14, %rcx
1458df0e8:     	cmpq	%rax, %rsi
1458df0eb:     	jb	0x1458df0c0 <.text+0x58de0c0>
1458df0ed:     	movq	%r11, (%r8)
1458df0f0:     	movq	%rbx, 0x18(%r8)
1458df0f4:     	movq	%rdi, 0x8(%r8)
1458df0f8:     	movq	%rcx, 0x10(%r8)
1458df0fc:     	cmpq	%r10, %rdx
1458df0ff:     	jae	0x1458df10f <.text+0x58de10f>
1458df101:     	leaq	(%r9,%rdx,8), %rax
1458df105:     	addq	$0x28, %rsp
1458df109:     	popq	%rbx
1458df10a:     	popq	%rdi
1458df10b:     	popq	%rsi
1458df10c:     	popq	%r14
1458df10e:     	retq
1458df10f:     	leaq	0x157bada(%rip), %r8    # 0x146e5abf0
1458df116:     	movq	%rdx, %rcx
1458df119:     	movq	%r10, %rdx
1458df11c:     	callq	0x145d697e3 <.text+0x5d687e3>
1458df121:     	ud2
