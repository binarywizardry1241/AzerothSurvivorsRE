
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14551e7f0:     	pushq	%rbp
14551e7f1:     	pushq	%r15
14551e7f3:     	pushq	%r14
14551e7f5:     	pushq	%r13
14551e7f7:     	pushq	%r12
14551e7f9:     	pushq	%rsi
14551e7fa:     	pushq	%rdi
14551e7fb:     	pushq	%rbx
14551e7fc:     	subq	$0x6c8, %rsp            # imm = 0x6C8
14551e803:     	leaq	0x80(%rsp), %rbp
14551e80b:     	movaps	%xmm6, 0x630(%rbp)
14551e812:     	movq	$-0x2, 0x628(%rbp)
14551e81d:     	movq	(%rcx), %rax
14551e820:     	movq	(%rax), %rcx
14551e823:     	movq	$0x0, (%rax)
14551e82a:     	testq	%rcx, %rcx
14551e82d:     	je	0x14552074d <.text+0x551f74d>
14551e833:     	movq	%rcx, -0x40(%rbp)
14551e837:     	movq	$0x0, 0x5b0(%rbp)
14551e842:     	movq	$0x8, 0x5b8(%rbp)
14551e84d:     	movq	$0x0, 0x5c0(%rbp)
14551e858:     	leaq	0x1817379(%rip), %rcx   # 0x146d35bd8
14551e85f:     	leaq	0x18173ca(%rip), %rdx   # 0x146d35c30
14551e866:     	leaq	0x40(%rbp), %rbx
14551e86a:     	leaq	0x518(%rbp), %r14
14551e871:     	xorl	%r12d, %r12d
14551e874:     	xorl	%r15d, %r15d
14551e877:     	cmpq	$0xb40, %r15            # imm = 0xB40
14551e87e:     	je	0x14551ee35 <.text+0x551de35>
14551e884:     	movq	%r14, %r13
14551e887:     	movl	$0xf, %eax
14551e88c:     	movq	%rcx, %r8
14551e88f:     	cmpq	$0xc, %r12
14551e893:     	jae	0x14551e8ac <.text+0x551d8ac>
14551e895:     	movq	%r12, %rax
14551e898:     	shlq	$0x4, %rax
14551e89c:     	leaq	0x1817275(%rip), %rcx   # 0x146d35b18
14551e8a3:     	movq	(%rax,%rcx), %r8
14551e8a7:     	movq	0x8(%rax,%rcx), %rax
14551e8ac:     	movq	%rax, 0x598(%rbp)
14551e8b3:     	movq	%r8, 0x5a0(%rbp)
14551e8ba:     	leaq	0x1214c57(%rip), %rax   # 0x146733518
14551e8c1:     	leaq	(%rax,%r15), %rdi
14551e8c5:     	leaq	0x8(%rdi), %r14
14551e8c9:     	movq	%r14, 0x518(%rbp)
14551e8d0:     	leaq	-0x551c817(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551e8d7:     	movq	%rax, 0x520(%rbp)
14551e8de:     	movq	%rbx, %rcx
14551e8e1:     	movq	%r13, %rsi
14551e8e4:     	movq	%r13, %r8
14551e8e7:     	callq	0x145728390 <.text+0x5727390>
14551e8ec:     	nop
14551e8ed:     	movq	0x40(%rbp), %rax
14551e8f1:     	movq	%rax, 0x5e8(%rbp)
14551e8f8:     	movq	0x48(%rbp), %rax
14551e8fc:     	movq	%rax, 0x5f0(%rbp)
14551e903:     	movq	0x50(%rbp), %rax
14551e907:     	movq	%rax, 0x588(%rbp)
14551e90e:     	movq	%r14, 0x518(%rbp)
14551e915:     	leaq	-0x551c85c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551e91c:     	movq	%rax, 0x520(%rbp)
14551e923:     	movb	$0x1, 0x603(%rbp)
14551e92a:     	movq	%rbx, %rcx
14551e92d:     	leaq	0x120d01b(%rip), %rdx   # 0x14672b94f
14551e934:     	movq	%rsi, %r8
14551e937:     	callq	0x145728390 <.text+0x5727390>
14551e93c:     	nop
14551e93d:     	movq	%rbx, %rsi
14551e940:     	movq	%r14, 0x618(%rbp)
14551e947:     	movq	0x48(%rbp), %rcx
14551e94b:     	movq	0x50(%rbp), %rdx
14551e94f:     	movq	0x18(%rdi), %rax
14551e953:     	movq	%rax, 0x608(%rbp)
14551e95a:     	movq	0x20(%rdi), %rax
14551e95e:     	movq	%rax, 0x610(%rbp)
14551e965:     	movq	%rcx, 0x5d0(%rbp)
14551e96c:     	callq	0x145457cb0 <.text+0x5456cb0>
14551e971:     	nop
14551e972:     	movq	%rax, %rdi
14551e975:     	movq	%rdx, %rbx
14551e978:     	movq	0x40(%rbp), %rdx
14551e97c:     	testq	%rdx, %rdx
14551e97f:     	movq	%r13, %r14
14551e982:     	je	0x14551e996 <.text+0x551d996>
14551e984:     	movl	$0x1, %r8d
14551e98a:     	movq	0x5d0(%rbp), %rcx
14551e991:     	callq	0x1400021d0 <.text+0x11d0>
14551e996:     	addq	$0xf0, %r15
14551e99d:     	testq	%rdi, %rdi
14551e9a0:     	cmoveq	0x608(%rbp), %rdi
14551e9a8:     	leaq	0x1(%r12), %rax
14551e9ad:     	cmoveq	0x610(%rbp), %rbx
14551e9b5:     	testq	%rbx, %rbx
14551e9b8:     	js	0x14551ee1a <.text+0x551de1a>
14551e9be:     	movq	%rax, 0x500(%rbp)
14551e9c5:     	movq	%rbx, 0x590(%rbp)
14551e9cc:     	movq	%r12, 0x5d0(%rbp)
14551e9d3:     	movq	%r15, 0x4f8(%rbp)
14551e9da:     	je	0x14551ea0e <.text+0x551da0e>
14551e9dc:     	callq	0x140002200 <.text+0x1200>
14551e9e1:     	movl	$0x1, %edx
14551e9e6:     	movq	%rbx, %rcx
14551e9e9:     	callq	0x1400021c0 <.text+0x11c0>
14551e9ee:     	testq	%rax, %rax
14551e9f1:     	je	0x145522b43 <.text+0x5521b43>
14551e9f7:     	movq	%rax, 0x5c8(%rbp)
14551e9fe:     	movq	%rax, %rcx
14551ea01:     	movq	%rdi, %rdx
14551ea04:     	movq	%rbx, %r8
14551ea07:     	callq	0x1457731ed <.text+0x57721ed>
14551ea0c:     	jmp	0x14551ea1a <.text+0x551da1a>
14551ea0e:     	movl	$0x1, %eax
14551ea13:     	movq	%rax, 0x5c8(%rbp)
14551ea1a:     	movb	$0x1, 0x625(%rbp)
14551ea21:     	movl	$0x27, %edx
14551ea26:     	leaq	0x181720b(%rip), %rcx   # 0x146d35c38
14551ea2d:     	callq	0x145457cb0 <.text+0x5456cb0>
14551ea32:     	nop
14551ea33:     	movq	0x618(%rbp), %rdi
14551ea3a:     	movq	%rax, %r13
14551ea3d:     	testq	%rax, %rax
14551ea40:     	leaq	0x18171f1(%rip), %rax   # 0x146d35c38
14551ea47:     	cmoveq	%rax, %r13
14551ea4b:     	movl	$0x27, %eax
14551ea50:     	cmoveq	%rax, %rdx
14551ea54:     	movq	0x5d0(%rbp), %rcx
14551ea5b:     	cmpq	$0xb, %rcx
14551ea5f:     	ja	0x145522b25 <.text+0x5521b25>
14551ea65:     	imulq	$0xf0, %rcx, %rax
14551ea6c:     	leaq	0x1214aa5(%rip), %rcx   # 0x146733518
14551ea73:     	movq	0x88(%rax,%rcx), %rbx
14551ea7b:     	cmpb	$0x0, 0x54(%rbx)
14551ea7f:     	movq	%rdx, 0x508(%rbp)
14551ea86:     	jne	0x14551ead0 <.text+0x551dad0>
14551ea88:     	cmpb	$0x0, 0xac(%rbx)
14551ea8f:     	je	0x14551ea97 <.text+0x551da97>
14551ea91:     	addq	$0x58, %rbx
14551ea95:     	jmp	0x14551ead0 <.text+0x551dad0>
14551ea97:     	cmpb	$0x0, 0x104(%rbx)
14551ea9e:     	je	0x14551eaa9 <.text+0x551daa9>
14551eaa0:     	addq	$0xb0, %rbx
14551eaa7:     	jmp	0x14551ead0 <.text+0x551dad0>
14551eaa9:     	cmpb	$0x0, 0x15c(%rbx)
14551eab0:     	je	0x14551eabb <.text+0x551dabb>
14551eab2:     	addq	$0x108, %rbx            # imm = 0x108
14551eab9:     	jmp	0x14551ead0 <.text+0x551dad0>
14551eabb:     	cmpb	$0x1, 0x1b4(%rbx)
14551eac2:     	jne	0x14551eddf <.text+0x551dddf>
14551eac8:     	addq	$0x160, %rbx            # imm = 0x160
14551eacf:     	nop
14551ead0:     	movb	$0x1, 0x625(%rbp)
14551ead7:     	movl	$0xe, %edx
14551eadc:     	leaq	0x18165b5(%rip), %rcx   # 0x146d35098
14551eae3:     	callq	0x145457cb0 <.text+0x5456cb0>
14551eae8:     	nop
14551eae9:     	leaq	0x30(%rbx), %rax
14551eaed:     	movq	%rax, 0x518(%rbp)
14551eaf4:     	leaq	0x21b955(%rip), %rax    # 0x14573a450 <.text+0x5739450>
14551eafb:     	movq	%rax, 0x520(%rbp)
14551eb02:     	movb	$0x1, 0x625(%rbp)
14551eb09:     	movq	%rsi, %rcx
14551eb0c:     	leaq	0x120ce0e(%rip), %rdx   # 0x14672b921
14551eb13:     	movq	%r14, %r8
14551eb16:     	callq	0x145728390 <.text+0x5727390>
14551eb1b:     	nop
14551eb1c:     	movq	%r14, %rdi
14551eb1f:     	movq	%rsi, %r14
14551eb22:     	movq	0x48(%rbp), %rcx
14551eb26:     	movq	0x50(%rbp), %rdx
14551eb2a:     	movq	(%rbx), %r12
14551eb2d:     	movq	0x8(%rbx), %rsi
14551eb31:     	movq	%rcx, 0x510(%rbp)
14551eb38:     	callq	0x145457cb0 <.text+0x5456cb0>
14551eb3d:     	nop
14551eb3e:     	movq	%rax, %rbx
14551eb41:     	movq	%rdx, %r15
14551eb44:     	movq	0x40(%rbp), %rdx
14551eb48:     	testq	%rdx, %rdx
14551eb4b:     	je	0x14551eb5f <.text+0x551db5f>
14551eb4d:     	movl	$0x1, %r8d
14551eb53:     	movq	0x510(%rbp), %rcx
14551eb5a:     	callq	0x1400021d0 <.text+0x11d0>
14551eb5f:     	testq	%rbx, %rbx
14551eb62:     	cmoveq	%rsi, %r15
14551eb66:     	cmovneq	%rbx, %r12
14551eb6a:     	movq	%r14, %rsi
14551eb6d:     	movq	%rdi, %r14
14551eb70:     	movq	0x618(%rbp), %rdi
14551eb77:     	movq	%r12, 0x470(%rbp)
14551eb7e:     	movq	%r15, 0x478(%rbp)
14551eb85:     	movq	%rdi, 0x518(%rbp)
14551eb8c:     	leaq	-0x551cad3(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551eb93:     	movq	%rax, 0x520(%rbp)
14551eb9a:     	movb	$0x1, 0x625(%rbp)
14551eba1:     	movq	%rsi, %rcx
14551eba4:     	leaq	0x120cda4(%rip), %rdx   # 0x14672b94f
14551ebab:     	movq	%r14, %r8
14551ebae:     	callq	0x145728390 <.text+0x5727390>
14551ebb3:     	nop
14551ebb4:     	movq	0x48(%rbp), %rcx
14551ebb8:     	movq	0x50(%rbp), %rdx
14551ebbc:     	movq	%rcx, 0x618(%rbp)
14551ebc3:     	callq	0x145457cb0 <.text+0x5456cb0>
14551ebc8:     	nop
14551ebc9:     	movq	%rax, %rbx
14551ebcc:     	movq	%rdx, %r15
14551ebcf:     	movq	0x40(%rbp), %rdx
14551ebd3:     	testq	%rdx, %rdx
14551ebd6:     	je	0x14551ebea <.text+0x551dbea>
14551ebd8:     	movl	$0x1, %r8d
14551ebde:     	movq	0x618(%rbp), %rcx
14551ebe5:     	callq	0x1400021d0 <.text+0x11d0>
14551ebea:     	testq	%rbx, %rbx
14551ebed:     	movq	0x608(%rbp), %rax
14551ebf4:     	cmovneq	%rbx, %rax
14551ebf8:     	cmoveq	0x610(%rbp), %r15
14551ec00:     	movq	%rax, 0x438(%rbp)
14551ec07:     	movq	%r15, 0x440(%rbp)
14551ec0e:     	leaq	0x18165b8(%rip), %rax   # 0x146d351cd
14551ec15:     	movq	%rax, 0x518(%rbp)
14551ec1c:     	movq	$0x4, 0x520(%rbp)
14551ec27:     	leaq	0x470(%rbp), %rax
14551ec2e:     	movq	%rax, 0x528(%rbp)
14551ec35:     	leaq	0x18164e4(%rip), %rax   # 0x146d35120
14551ec3c:     	movq	%rax, 0x530(%rbp)
14551ec43:     	leaq	0x1816587(%rip), %rcx   # 0x146d351d1
14551ec4a:     	movq	%rcx, 0x538(%rbp)
14551ec51:     	movq	$0x4, 0x540(%rbp)
14551ec5c:     	leaq	0x438(%rbp), %rcx
14551ec63:     	movq	%rcx, 0x548(%rbp)
14551ec6a:     	movq	%rax, 0x550(%rbp)
14551ec71:     	movb	$0x1, 0x625(%rbp)
14551ec78:     	movq	$0x2, 0x20(%rsp)
14551ec81:     	leaq	0x450(%rbp), %rcx
14551ec88:     	movq	%r13, %rdx
14551ec8b:     	movq	0x508(%rbp), %r8
14551ec92:     	movq	%r14, %r9
14551ec95:     	callq	0x145458060 <.text+0x5457060>
14551ec9a:     	nop
14551ec9b:     	movq	%rsi, %rbx
14551ec9e:     	leaq	0x1816fbb(%rip), %rax   # 0x146d35c60
14551eca5:     	movq	0x5d0(%rbp), %r8
14551ecac:     	movl	(%rax,%r8,4), %eax
14551ecb0:     	movq	0x5e8(%rbp), %rcx
14551ecb7:     	movq	%rcx, 0x40(%rbp)
14551ecbb:     	movq	0x5f0(%rbp), %rcx
14551ecc2:     	movq	%rcx, 0x48(%rbp)
14551ecc6:     	movq	0x588(%rbp), %rcx
14551eccd:     	movq	%rcx, 0x50(%rbp)
14551ecd1:     	movq	0x590(%rbp), %rdx
14551ecd8:     	movq	%rdx, 0x58(%rbp)
14551ecdc:     	movq	0x5c8(%rbp), %rcx
14551ece3:     	movq	%rcx, 0x60(%rbp)
14551ece7:     	movq	%rdx, 0x68(%rbp)
14551eceb:     	movq	0x460(%rbp), %rcx
14551ecf2:     	leaq	0x70(%rbp), %rdx
14551ecf6:     	movq	%rcx, 0x10(%rdx)
14551ecfa:     	movups	0x450(%rbp), %xmm0
14551ed01:     	movups	%xmm0, (%rdx)
14551ed04:     	movl	%eax, 0xa8(%rbp)
14551ed0a:     	movb	$0x0, 0xac(%rbp)
14551ed11:     	movq	0x5a0(%rbp), %rax
14551ed18:     	movq	%rax, 0x98(%rbp)
14551ed1f:     	movq	0x598(%rbp), %rax
14551ed26:     	movq	%rax, 0xa0(%rbp)
14551ed2d:     	movb	$0x0, 0x88(%rbp)
14551ed34:     	movq	%r8, 0x90(%rbp)
14551ed3b:     	movq	0x5c0(%rbp), %rsi
14551ed42:     	cmpq	0x5b0(%rbp), %rsi
14551ed49:     	jne	0x14551ed58 <.text+0x551dd58>
14551ed4b:     	leaq	0x5b0(%rbp), %rcx
14551ed52:     	callq	0x145778530 <.text+0x5777530>
14551ed57:     	nop
14551ed58:     	movq	0x5b8(%rbp), %rax
14551ed5f:     	imulq	$0x70, %rsi, %rcx
14551ed63:     	movups	0xa0(%rbp), %xmm0
14551ed6a:     	movups	%xmm0, 0x60(%rax,%rcx)
14551ed6f:     	movups	0x90(%rbp), %xmm0
14551ed76:     	movups	%xmm0, 0x50(%rax,%rcx)
14551ed7b:     	movups	0x80(%rbp), %xmm0
14551ed82:     	movups	%xmm0, 0x40(%rax,%rcx)
14551ed87:     	movups	0x40(%rbp), %xmm0
14551ed8b:     	movups	0x50(%rbp), %xmm1
14551ed8f:     	movups	0x60(%rbp), %xmm2
14551ed93:     	movups	0x70(%rbp), %xmm3
14551ed97:     	movups	%xmm3, 0x30(%rax,%rcx)
14551ed9c:     	movups	%xmm2, 0x20(%rax,%rcx)
14551eda1:     	movups	%xmm1, 0x10(%rax,%rcx)
14551eda6:     	movups	%xmm0, (%rax,%rcx)
14551edaa:     	incq	%rsi
14551edad:     	movq	%rsi, 0x5c0(%rbp)
14551edb4:     	movq	0x500(%rbp), %r12
14551edbb:     	leaq	0x1816e16(%rip), %rcx   # 0x146d35bd8
14551edc2:     	leaq	0x1816e67(%rip), %rdx   # 0x146d35c30
14551edc9:     	movq	0x4f8(%rbp), %r15
14551edd0:     	cmpq	$0xb40, %r15            # imm = 0xB40
14551edd7:     	jne	0x14551e884 <.text+0x551d884>
14551eddd:     	jmp	0x14551ee35 <.text+0x551de35>
14551eddf:     	movb	$0x1, 0x625(%rbp)
14551ede6:     	movl	$0xe, %edx
14551edeb:     	leaq	0x18162a6(%rip), %rcx   # 0x146d35098
14551edf2:     	callq	0x145457cb0 <.text+0x5456cb0>
14551edf7:     	nop
14551edf8:     	movq	%rax, %r12
14551edfb:     	movq	%rdx, %r15
14551edfe:     	testq	%rax, %rax
14551ee01:     	movl	$0xe, %eax
14551ee06:     	cmoveq	%rax, %r15
14551ee0a:     	leaq	0x1816287(%rip), %rax   # 0x146d35098
14551ee11:     	cmoveq	%rax, %r12
14551ee15:     	jmp	0x14551eb77 <.text+0x551db77>
14551ee1a:     	xorl	%ecx, %ecx
14551ee1c:     	movb	$0x1, 0x603(%rbp)
14551ee23:     	movq	0x5c8(%rbp), %rdx
14551ee2a:     	callq	0x14590379b <.text+0x590279b>
14551ee2f:     	nop
14551ee30:     	jmp	0x145522c20 <.text+0x5521c20>
14551ee35:     	xorl	%edi, %edi
14551ee37:     	leaq	0x40(%rbp), %r15
14551ee3b:     	leaq	0x518(%rbp), %r14
14551ee42:     	xorl	%r12d, %r12d
14551ee45:     	jmp	0x14551eebd <.text+0x551debd>
14551ee47:     	nopw	(%rax,%rax)
14551ee50:     	movq	0x588(%rbp), %r12
14551ee57:     	addq	$0xf0, %r12
14551ee5e:     	incq	%rdi
14551ee61:     	movq	0x5b8(%rbp), %rax
14551ee68:     	imulq	$0x70, %rsi, %rcx
14551ee6c:     	movups	0xa0(%rbp), %xmm0
14551ee73:     	movups	%xmm0, 0x60(%rax,%rcx)
14551ee78:     	movups	0x90(%rbp), %xmm0
14551ee7f:     	movups	%xmm0, 0x50(%rax,%rcx)
14551ee84:     	movups	0x80(%rbp), %xmm0
14551ee8b:     	movups	%xmm0, 0x40(%rax,%rcx)
14551ee90:     	movups	0x40(%rbp), %xmm0
14551ee94:     	movups	0x50(%rbp), %xmm1
14551ee98:     	movups	0x60(%rbp), %xmm2
14551ee9c:     	movups	0x70(%rbp), %xmm3
14551eea0:     	movups	%xmm3, 0x30(%rax,%rcx)
14551eea5:     	movups	%xmm2, 0x20(%rax,%rcx)
14551eeaa:     	movups	%xmm1, 0x10(%rax,%rcx)
14551eeaf:     	movups	%xmm0, (%rax,%rcx)
14551eeb3:     	incq	%rsi
14551eeb6:     	movq	%rsi, 0x5c0(%rbp)
14551eebd:     	cmpq	$0xb40, %r12            # imm = 0xB40
14551eec4:     	je	0x14551f418 <.text+0x551e418>
14551eeca:     	movl	$0xf, %ecx
14551eecf:     	leaq	0x1816d02(%rip), %rdx   # 0x146d35bd8
14551eed6:     	cmpq	$0xc, %rdi
14551eeda:     	jae	0x14551eef3 <.text+0x551def3>
14551eedc:     	movq	%rdi, %rax
14551eedf:     	shlq	$0x4, %rax
14551eee3:     	leaq	0x1816c2e(%rip), %rcx   # 0x146d35b18
14551eeea:     	movq	(%rax,%rcx), %rdx
14551eeee:     	movq	0x8(%rax,%rcx), %rcx
14551eef3:     	movq	%rdx, 0x598(%rbp)
14551eefa:     	movq	%rcx, 0x5f0(%rbp)
14551ef01:     	leaq	0x1214610(%rip), %rax   # 0x146733518
14551ef08:     	leaq	(%rax,%r12), %rbx
14551ef0c:     	leaq	0x8(%rbx), %rax
14551ef10:     	movq	%rax, 0x5e8(%rbp)
14551ef17:     	movq	%rax, 0x518(%rbp)
14551ef1e:     	leaq	-0x551ce65(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551ef25:     	movq	%rax, 0x520(%rbp)
14551ef2c:     	movq	%r15, %rcx
14551ef2f:     	leaq	0x1816cb1(%rip), %rdx   # 0x146d35be7
14551ef36:     	movq	%r14, %r8
14551ef39:     	callq	0x145728390 <.text+0x5727390>
14551ef3e:     	nop
14551ef3f:     	movq	%r12, 0x588(%rbp)
14551ef46:     	movq	0x40(%rbp), %rax
14551ef4a:     	movq	%rax, 0x618(%rbp)
14551ef51:     	movq	0x48(%rbp), %rax
14551ef55:     	movq	%rax, 0x5d0(%rbp)
14551ef5c:     	movq	0x50(%rbp), %rax
14551ef60:     	movq	%rax, 0x5a0(%rbp)
14551ef67:     	movb	$0x1, 0x605(%rbp)
14551ef6e:     	movl	$0x12, %edx
14551ef73:     	leaq	0x1816c76(%rip), %rcx   # 0x146d35bf0
14551ef7a:     	callq	0x145457cb0 <.text+0x5456cb0>
14551ef7f:     	nop
14551ef80:     	movq	%rax, %rsi
14551ef83:     	movq	%rdx, %r12
14551ef86:     	leaq	0x8(%rbx), %rax
14551ef8a:     	movq	%rax, 0x518(%rbp)
14551ef91:     	leaq	-0x551ced8(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551ef98:     	movq	%rax, 0x520(%rbp)
14551ef9f:     	movb	$0x1, 0x605(%rbp)
14551efa6:     	movq	%r15, %rcx
14551efa9:     	leaq	0x120c99f(%rip), %rdx   # 0x14672b94f
14551efb0:     	movq	%r14, %r8
14551efb3:     	callq	0x145728390 <.text+0x5727390>
14551efb8:     	nop
14551efb9:     	movq	0x48(%rbp), %rcx
14551efbd:     	movq	0x50(%rbp), %rdx
14551efc1:     	movq	0x18(%rbx), %rax
14551efc5:     	movq	%rax, 0x608(%rbp)
14551efcc:     	movq	0x20(%rbx), %rax
14551efd0:     	movq	%rax, 0x610(%rbp)
14551efd7:     	movq	%rcx, 0x5c8(%rbp)
14551efde:     	callq	0x145457cb0 <.text+0x5456cb0>
14551efe3:     	nop
14551efe4:     	movq	%rax, %rbx
14551efe7:     	movq	%rdx, %r13
14551efea:     	movq	0x40(%rbp), %rdx
14551efee:     	testq	%rdx, %rdx
14551eff1:     	je	0x14551f005 <.text+0x551e005>
14551eff3:     	movl	$0x1, %r8d
14551eff9:     	movq	0x5c8(%rbp), %rcx
14551f000:     	callq	0x1400021d0 <.text+0x11d0>
14551f005:     	testq	%rsi, %rsi
14551f008:     	movl	$0x12, %eax
14551f00d:     	cmoveq	%rax, %r12
14551f011:     	leaq	0x1816bd8(%rip), %rax   # 0x146d35bf0
14551f018:     	cmoveq	%rax, %rsi
14551f01c:     	testq	%rbx, %rbx
14551f01f:     	cmoveq	0x608(%rbp), %rbx
14551f027:     	cmoveq	0x610(%rbp), %r13
14551f02f:     	movq	%rbx, -0x38(%rbp)
14551f033:     	movq	%r13, -0x30(%rbp)
14551f037:     	leaq	0x1816193(%rip), %rax   # 0x146d351d1
14551f03e:     	movq	%rax, 0x450(%rbp)
14551f045:     	movq	$0x4, 0x458(%rbp)
14551f050:     	leaq	-0x38(%rbp), %rax
14551f054:     	movq	%rax, 0x460(%rbp)
14551f05b:     	leaq	0x18160be(%rip), %rax   # 0x146d35120
14551f062:     	movq	%rax, 0x468(%rbp)
14551f069:     	movb	$0x1, 0x605(%rbp)
14551f070:     	movq	$0x1, 0x20(%rsp)
14551f079:     	leaq	0x470(%rbp), %rcx
14551f080:     	movq	%rsi, %rdx
14551f083:     	movq	%r12, %r8
14551f086:     	leaq	0x450(%rbp), %r9
14551f08d:     	callq	0x145458060 <.text+0x5457060>
14551f092:     	nop
14551f093:     	movb	$0x1, 0x626(%rbp)
14551f09a:     	movl	$0x2e, %edx
14551f09f:     	leaq	0x1816b5c(%rip), %rcx   # 0x146d35c02
14551f0a6:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f0ab:     	nop
14551f0ac:     	movq	%rax, %rsi
14551f0af:     	movq	%rdx, %r12
14551f0b2:     	testq	%rax, %rax
14551f0b5:     	leaq	0x1816b46(%rip), %rax   # 0x146d35c02
14551f0bc:     	cmoveq	%rax, %rsi
14551f0c0:     	movl	$0x2e, %eax
14551f0c5:     	cmoveq	%rax, %r12
14551f0c9:     	cmpq	$0xb, %rdi
14551f0cd:     	ja	0x145522ae5 <.text+0x5521ae5>
14551f0d3:     	imulq	$0xf0, %rdi, %rax
14551f0da:     	leaq	0x1214437(%rip), %rcx   # 0x146733518
14551f0e1:     	movq	0x88(%rax,%rcx), %rbx
14551f0e9:     	cmpb	$0x0, 0x54(%rbx)
14551f0ed:     	jne	0x14551f140 <.text+0x551e140>
14551f0ef:     	cmpb	$0x0, 0xac(%rbx)
14551f0f6:     	je	0x14551f100 <.text+0x551e100>
14551f0f8:     	addq	$0x58, %rbx
14551f0fc:     	jmp	0x14551f140 <.text+0x551e140>
14551f0fe:     	nop
14551f100:     	cmpb	$0x0, 0x104(%rbx)
14551f107:     	je	0x14551f112 <.text+0x551e112>
14551f109:     	addq	$0xb0, %rbx
14551f110:     	jmp	0x14551f140 <.text+0x551e140>
14551f112:     	cmpb	$0x0, 0x15c(%rbx)
14551f119:     	je	0x14551f124 <.text+0x551e124>
14551f11b:     	addq	$0x108, %rbx            # imm = 0x108
14551f122:     	jmp	0x14551f140 <.text+0x551e140>
14551f124:     	cmpb	$0x1, 0x1b4(%rbx)
14551f12b:     	jne	0x14551f3dd <.text+0x551e3dd>
14551f131:     	addq	$0x160, %rbx            # imm = 0x160
14551f138:     	nopl	(%rax,%rax)
14551f140:     	movb	$0x1, 0x626(%rbp)
14551f147:     	movl	$0xe, %edx
14551f14c:     	leaq	0x1815f45(%rip), %rcx   # 0x146d35098
14551f153:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f158:     	nop
14551f159:     	leaq	0x30(%rbx), %rax
14551f15d:     	movq	%rax, 0x518(%rbp)
14551f164:     	leaq	0x21b2e5(%rip), %rax    # 0x14573a450 <.text+0x5739450>
14551f16b:     	movq	%rax, 0x520(%rbp)
14551f172:     	movb	$0x1, 0x626(%rbp)
14551f179:     	movq	%r15, %rcx
14551f17c:     	leaq	0x120c79e(%rip), %rdx   # 0x14672b921
14551f183:     	movq	%r14, %r8
14551f186:     	callq	0x145728390 <.text+0x5727390>
14551f18b:     	nop
14551f18c:     	movq	%rsi, 0x5c8(%rbp)
14551f193:     	movq	%r12, %rsi
14551f196:     	movq	%r15, %r12
14551f199:     	movq	%rdi, %r15
14551f19c:     	movq	0x48(%rbp), %rcx
14551f1a0:     	movq	0x50(%rbp), %rdx
14551f1a4:     	movq	(%rbx), %r13
14551f1a7:     	movq	0x8(%rbx), %rdi
14551f1ab:     	movq	%rcx, 0x590(%rbp)
14551f1b2:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f1b7:     	nop
14551f1b8:     	movq	%rax, %r14
14551f1bb:     	movq	%rdx, %rbx
14551f1be:     	movq	0x40(%rbp), %rdx
14551f1c2:     	testq	%rdx, %rdx
14551f1c5:     	je	0x14551f1d9 <.text+0x551e1d9>
14551f1c7:     	movl	$0x1, %r8d
14551f1cd:     	movq	0x590(%rbp), %rcx
14551f1d4:     	callq	0x1400021d0 <.text+0x11d0>
14551f1d9:     	testq	%r14, %r14
14551f1dc:     	cmoveq	%rdi, %rbx
14551f1e0:     	cmovneq	%r14, %r13
14551f1e4:     	movq	%r15, %rdi
14551f1e7:     	movq	%r12, %r15
14551f1ea:     	leaq	0x518(%rbp), %r14
14551f1f1:     	movq	%rsi, %r12
14551f1f4:     	movq	0x5c8(%rbp), %rsi
14551f1fb:     	movq	%r13, 0x428(%rbp)
14551f202:     	movq	%rbx, 0x430(%rbp)
14551f209:     	movq	0x5e8(%rbp), %rax
14551f210:     	movq	%rax, 0x518(%rbp)
14551f217:     	leaq	-0x551d15e(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551f21e:     	movq	%rax, 0x520(%rbp)
14551f225:     	movb	$0x1, 0x626(%rbp)
14551f22c:     	movq	%r15, %rcx
14551f22f:     	leaq	0x120c719(%rip), %rdx   # 0x14672b94f
14551f236:     	movq	%r14, %r8
14551f239:     	callq	0x145728390 <.text+0x5727390>
14551f23e:     	nop
14551f23f:     	movq	0x48(%rbp), %rcx
14551f243:     	movq	0x50(%rbp), %rdx
14551f247:     	movq	%rcx, 0x5e8(%rbp)
14551f24e:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f253:     	nop
14551f254:     	movq	%rax, %r14
14551f257:     	movq	%rdx, %rbx
14551f25a:     	movq	0x40(%rbp), %rdx
14551f25e:     	testq	%rdx, %rdx
14551f261:     	je	0x14551f275 <.text+0x551e275>
14551f263:     	movl	$0x1, %r8d
14551f269:     	movq	0x5e8(%rbp), %rcx
14551f270:     	callq	0x1400021d0 <.text+0x11d0>
14551f275:     	testq	%r14, %r14
14551f278:     	movq	0x608(%rbp), %rax
14551f27f:     	cmovneq	%r14, %rax
14551f283:     	cmoveq	0x610(%rbp), %rbx
14551f28b:     	movq	%rax, 0x418(%rbp)
14551f292:     	movq	%rbx, 0x420(%rbp)
14551f299:     	leaq	0x1815f2d(%rip), %rax   # 0x146d351cd
14551f2a0:     	movq	%rax, 0x518(%rbp)
14551f2a7:     	movq	$0x4, 0x520(%rbp)
14551f2b2:     	leaq	0x428(%rbp), %rax
14551f2b9:     	movq	%rax, 0x528(%rbp)
14551f2c0:     	leaq	0x1815e59(%rip), %rax   # 0x146d35120
14551f2c7:     	movq	%rax, 0x530(%rbp)
14551f2ce:     	leaq	0x1815efc(%rip), %rcx   # 0x146d351d1
14551f2d5:     	movq	%rcx, 0x538(%rbp)
14551f2dc:     	movq	$0x4, 0x540(%rbp)
14551f2e7:     	leaq	0x418(%rbp), %rcx
14551f2ee:     	movq	%rcx, 0x548(%rbp)
14551f2f5:     	movq	%rax, 0x550(%rbp)
14551f2fc:     	movb	$0x1, 0x626(%rbp)
14551f303:     	movq	$0x2, 0x20(%rsp)
14551f30c:     	leaq	0x438(%rbp), %rcx
14551f313:     	movq	%rsi, %rdx
14551f316:     	movq	%r12, %r8
14551f319:     	leaq	0x518(%rbp), %r14
14551f320:     	movq	%r14, %r9
14551f323:     	callq	0x145458060 <.text+0x5457060>
14551f328:     	nop
14551f329:     	movq	0x618(%rbp), %rax
14551f330:     	movq	%rax, 0x40(%rbp)
14551f334:     	movq	0x5d0(%rbp), %rax
14551f33b:     	movq	%rax, 0x48(%rbp)
14551f33f:     	movq	0x5a0(%rbp), %rax
14551f346:     	movq	%rax, 0x50(%rbp)
14551f34a:     	movq	0x480(%rbp), %rax
14551f351:     	leaq	0x58(%rbp), %rcx
14551f355:     	movq	%rax, 0x10(%rcx)
14551f359:     	movups	0x470(%rbp), %xmm0
14551f360:     	movups	%xmm0, (%rcx)
14551f363:     	movq	0x448(%rbp), %rax
14551f36a:     	leaq	0x70(%rbp), %rcx
14551f36e:     	movq	%rax, 0x10(%rcx)
14551f372:     	movups	0x438(%rbp), %xmm0
14551f379:     	movups	%xmm0, (%rcx)
14551f37c:     	movl	$0x19, 0xa8(%rbp)
14551f386:     	movb	$0x0, 0xac(%rbp)
14551f38d:     	movq	0x598(%rbp), %rax
14551f394:     	movq	%rax, 0x98(%rbp)
14551f39b:     	movq	0x5f0(%rbp), %rax
14551f3a2:     	movq	%rax, 0xa0(%rbp)
14551f3a9:     	movb	$0x1, 0x88(%rbp)
14551f3b0:     	movq	%rdi, 0x90(%rbp)
14551f3b7:     	movq	0x5c0(%rbp), %rsi
14551f3be:     	cmpq	0x5b0(%rbp), %rsi
14551f3c5:     	jne	0x14551ee50 <.text+0x551de50>
14551f3cb:     	leaq	0x5b0(%rbp), %rcx
14551f3d2:     	callq	0x145778530 <.text+0x5777530>
14551f3d7:     	nop
14551f3d8:     	jmp	0x14551ee50 <.text+0x551de50>
14551f3dd:     	movb	$0x1, 0x626(%rbp)
14551f3e4:     	movl	$0xe, %edx
14551f3e9:     	leaq	0x1815ca8(%rip), %rcx   # 0x146d35098
14551f3f0:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f3f5:     	nop
14551f3f6:     	movq	%rax, %r13
14551f3f9:     	movq	%rdx, %rbx
14551f3fc:     	testq	%rax, %rax
14551f3ff:     	movl	$0xe, %eax
14551f404:     	cmoveq	%rax, %rbx
14551f408:     	leaq	0x1815c89(%rip), %rax   # 0x146d35098
14551f40f:     	cmoveq	%rax, %r13
14551f413:     	jmp	0x14551f1fb <.text+0x551e1fb>
14551f418:     	xorl	%edi, %edi
14551f41a:     	leaq	0x518(%rbp), %rbx
14551f421:     	jmp	0x14551f49a <.text+0x551e49a>
14551f423:     	nopw	%cs:(%rax,%rax)
14551f430:     	movq	0x5d0(%rbp), %rdi
14551f437:     	addq	$0x90, %rdi
14551f43e:     	movq	0x5b8(%rbp), %rax
14551f445:     	imulq	$0x70, %rsi, %rcx
14551f449:     	movups	0xa0(%rbp), %xmm0
14551f450:     	movups	%xmm0, 0x60(%rax,%rcx)
14551f455:     	movups	0x90(%rbp), %xmm0
14551f45c:     	movups	%xmm0, 0x50(%rax,%rcx)
14551f461:     	movups	0x80(%rbp), %xmm0
14551f468:     	movups	%xmm0, 0x40(%rax,%rcx)
14551f46d:     	movups	0x40(%rbp), %xmm0
14551f471:     	movups	0x50(%rbp), %xmm1
14551f475:     	movups	0x60(%rbp), %xmm2
14551f479:     	movups	0x70(%rbp), %xmm3
14551f47d:     	movups	%xmm3, 0x30(%rax,%rcx)
14551f482:     	movups	%xmm2, 0x20(%rax,%rcx)
14551f487:     	movups	%xmm1, 0x10(%rax,%rcx)
14551f48c:     	movups	%xmm0, (%rax,%rcx)
14551f490:     	incq	%rsi
14551f493:     	movq	%rsi, 0x5c0(%rbp)
14551f49a:     	cmpq	$0x510, %rdi            # imm = 0x510
14551f4a1:     	je	0x14551f801 <.text+0x551e801>
14551f4a7:     	leaq	0x121639a(%rip), %rax   # 0x146735848
14551f4ae:     	addq	%rdi, %rax
14551f4b1:     	movq	%rax, 0x608(%rbp)
14551f4b8:     	leaq	0x10(%rax), %rsi
14551f4bc:     	movq	%rsi, 0x518(%rbp)
14551f4c3:     	leaq	-0x551d40a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551f4ca:     	movq	%rax, 0x520(%rbp)
14551f4d1:     	leaq	0x40(%rbp), %rcx
14551f4d5:     	leaq	0x1815c6a(%rip), %rdx   # 0x146d35146
14551f4dc:     	movq	%rbx, %r8
14551f4df:     	callq	0x145728390 <.text+0x5727390>
14551f4e4:     	nop
14551f4e5:     	movq	%rdi, 0x5d0(%rbp)
14551f4ec:     	movq	0x40(%rbp), %rax
14551f4f0:     	movq	%rax, 0x610(%rbp)
14551f4f7:     	movq	0x48(%rbp), %rax
14551f4fb:     	movq	%rax, 0x618(%rbp)
14551f502:     	movq	0x50(%rbp), %rax
14551f506:     	movq	%rax, 0x5e8(%rbp)
14551f50d:     	movb	$0x1, 0x607(%rbp)
14551f514:     	movl	$0x12, %edx
14551f519:     	leaq	0x1815c2f(%rip), %rcx   # 0x146d3514f
14551f520:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f525:     	nop
14551f526:     	movq	%rax, %r13
14551f529:     	movq	%rdx, %r12
14551f52c:     	movq	%rsi, 0x518(%rbp)
14551f533:     	leaq	-0x551d47a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551f53a:     	movq	%rax, 0x520(%rbp)
14551f541:     	movb	$0x1, 0x607(%rbp)
14551f548:     	leaq	0x40(%rbp), %rcx
14551f54c:     	leaq	0x120c387(%rip), %rdx   # 0x14672b8da
14551f553:     	movq	%rbx, %r8
14551f556:     	callq	0x145728390 <.text+0x5727390>
14551f55b:     	nop
14551f55c:     	movq	%rsi, %rbx
14551f55f:     	movq	0x48(%rbp), %rcx
14551f563:     	movq	0x50(%rbp), %rdx
14551f567:     	movq	0x608(%rbp), %rax
14551f56e:     	movq	0x20(%rax), %rsi
14551f572:     	movq	0x28(%rax), %rdi
14551f576:     	movq	%rcx, 0x5f0(%rbp)
14551f57d:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f582:     	nop
14551f583:     	movq	%rax, %r14
14551f586:     	movq	%rdx, %r15
14551f589:     	movq	0x40(%rbp), %rdx
14551f58d:     	testq	%rdx, %rdx
14551f590:     	je	0x14551f5a4 <.text+0x551e5a4>
14551f592:     	movl	$0x1, %r8d
14551f598:     	movq	0x5f0(%rbp), %rcx
14551f59f:     	callq	0x1400021d0 <.text+0x11d0>
14551f5a4:     	testq	%r13, %r13
14551f5a7:     	movl	$0x12, %eax
14551f5ac:     	cmoveq	%rax, %r12
14551f5b0:     	leaq	0x1815b98(%rip), %rax   # 0x146d3514f
14551f5b7:     	cmoveq	%rax, %r13
14551f5bb:     	testq	%r14, %r14
14551f5be:     	cmoveq	%rsi, %r14
14551f5c2:     	cmoveq	%rdi, %r15
14551f5c6:     	movq	%r14, 0x428(%rbp)
14551f5cd:     	movq	%r15, 0x430(%rbp)
14551f5d4:     	leaq	0x1815b86(%rip), %rax   # 0x146d35161
14551f5db:     	movq	%rax, 0x450(%rbp)
14551f5e2:     	movq	$0x5, 0x458(%rbp)
14551f5ed:     	leaq	0x428(%rbp), %rax
14551f5f4:     	movq	%rax, 0x460(%rbp)
14551f5fb:     	leaq	0x1815b1e(%rip), %rax   # 0x146d35120
14551f602:     	movq	%rax, 0x468(%rbp)
14551f609:     	movb	$0x1, 0x607(%rbp)
14551f610:     	movq	$0x1, 0x20(%rsp)
14551f619:     	leaq	0x470(%rbp), %rcx
14551f620:     	movq	%r13, %rdx
14551f623:     	movq	%r12, %r8
14551f626:     	leaq	0x450(%rbp), %r9
14551f62d:     	callq	0x145458060 <.text+0x5457060>
14551f632:     	nop
14551f633:     	leaq	0x518(%rbp), %r14
14551f63a:     	movb	$0x1, 0x604(%rbp)
14551f641:     	movl	$0x19, %edx
14551f646:     	leaq	0x1815b19(%rip), %rcx   # 0x146d35166
14551f64d:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f652:     	nop
14551f653:     	movq	%rax, %r12
14551f656:     	movq	%rdx, %r13
14551f659:     	movq	%rbx, 0x518(%rbp)
14551f660:     	leaq	-0x551d5a7(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551f667:     	movq	%rax, 0x520(%rbp)
14551f66e:     	movb	$0x1, 0x604(%rbp)
14551f675:     	leaq	0x40(%rbp), %rcx
14551f679:     	leaq	0x120c25a(%rip), %rdx   # 0x14672b8da
14551f680:     	movq	%r14, %r8
14551f683:     	callq	0x145728390 <.text+0x5727390>
14551f688:     	nop
14551f689:     	movq	0x48(%rbp), %rcx
14551f68d:     	movq	0x50(%rbp), %rdx
14551f691:     	movq	%rcx, 0x5f0(%rbp)
14551f698:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f69d:     	nop
14551f69e:     	movq	%rax, %r15
14551f6a1:     	movq	%rdx, %r14
14551f6a4:     	movq	0x40(%rbp), %rdx
14551f6a8:     	testq	%rdx, %rdx
14551f6ab:     	je	0x14551f6bf <.text+0x551e6bf>
14551f6ad:     	movl	$0x1, %r8d
14551f6b3:     	movq	0x5f0(%rbp), %rcx
14551f6ba:     	callq	0x1400021d0 <.text+0x11d0>
14551f6bf:     	testq	%r12, %r12
14551f6c2:     	movl	$0x19, %eax
14551f6c7:     	cmoveq	%rax, %r13
14551f6cb:     	leaq	0x1815a94(%rip), %rax   # 0x146d35166
14551f6d2:     	cmoveq	%rax, %r12
14551f6d6:     	testq	%r15, %r15
14551f6d9:     	cmovneq	%r15, %rsi
14551f6dd:     	cmoveq	%rdi, %r14
14551f6e1:     	movq	%rsi, 0x418(%rbp)
14551f6e8:     	movq	%r14, 0x420(%rbp)
14551f6ef:     	leaq	0x1815a6b(%rip), %rax   # 0x146d35161
14551f6f6:     	movq	%rax, 0x518(%rbp)
14551f6fd:     	movq	$0x5, 0x520(%rbp)
14551f708:     	leaq	0x418(%rbp), %rax
14551f70f:     	movq	%rax, 0x528(%rbp)
14551f716:     	leaq	0x1815a03(%rip), %rax   # 0x146d35120
14551f71d:     	movq	%rax, 0x530(%rbp)
14551f724:     	movb	$0x1, 0x604(%rbp)
14551f72b:     	movq	$0x1, 0x20(%rsp)
14551f734:     	leaq	0x438(%rbp), %rcx
14551f73b:     	movq	%r12, %rdx
14551f73e:     	movq	%r13, %r8
14551f741:     	leaq	0x518(%rbp), %rbx
14551f748:     	movq	%rbx, %r9
14551f74b:     	callq	0x145458060 <.text+0x5457060>
14551f750:     	nop
14551f751:     	movq	0x608(%rbp), %rax
14551f758:     	movups	0x60(%rax), %xmm0
14551f75c:     	movzbl	0x8c(%rax), %eax
14551f763:     	movq	0x610(%rbp), %rcx
14551f76a:     	movq	%rcx, 0x40(%rbp)
14551f76e:     	movq	0x618(%rbp), %rcx
14551f775:     	movq	%rcx, 0x48(%rbp)
14551f779:     	movq	0x5e8(%rbp), %rcx
14551f780:     	movq	%rcx, 0x50(%rbp)
14551f784:     	movq	0x480(%rbp), %rcx
14551f78b:     	leaq	0x58(%rbp), %rdx
14551f78f:     	movq	%rcx, 0x10(%rdx)
14551f793:     	movups	0x470(%rbp), %xmm1
14551f79a:     	movups	%xmm1, (%rdx)
14551f79d:     	movq	0x448(%rbp), %rcx
14551f7a4:     	leaq	0x70(%rbp), %rdx
14551f7a8:     	movq	%rcx, 0x10(%rdx)
14551f7ac:     	movups	0x438(%rbp), %xmm1
14551f7b3:     	movups	%xmm1, (%rdx)
14551f7b6:     	movl	$0xa, 0xa8(%rbp)
14551f7c0:     	movb	$0x1, 0xac(%rbp)
14551f7c7:     	movups	%xmm0, 0x98(%rbp)
14551f7ce:     	movb	$0x2, 0x88(%rbp)
14551f7d5:     	movb	%al, 0x89(%rbp)
14551f7db:     	movq	0x5c0(%rbp), %rsi
14551f7e2:     	cmpq	0x5b0(%rbp), %rsi
14551f7e9:     	jne	0x14551f430 <.text+0x551e430>
14551f7ef:     	leaq	0x5b0(%rbp), %rcx
14551f7f6:     	callq	0x145778530 <.text+0x5777530>
14551f7fb:     	nop
14551f7fc:     	jmp	0x14551f430 <.text+0x551e430>
14551f801:     	xorl	%edi, %edi
14551f803:     	jmp	0x14551f87a <.text+0x551e87a>
14551f805:     	nopw	%cs:(%rax,%rax)
14551f810:     	movq	0x5d0(%rbp), %rdi
14551f817:     	addq	$0x90, %rdi
14551f81e:     	movq	0x5b8(%rbp), %rax
14551f825:     	imulq	$0x70, %rsi, %rcx
14551f829:     	movups	0xa0(%rbp), %xmm0
14551f830:     	movups	%xmm0, 0x60(%rax,%rcx)
14551f835:     	movups	0x90(%rbp), %xmm0
14551f83c:     	movups	%xmm0, 0x50(%rax,%rcx)
14551f841:     	movups	0x80(%rbp), %xmm0
14551f848:     	movups	%xmm0, 0x40(%rax,%rcx)
14551f84d:     	movups	0x40(%rbp), %xmm0
14551f851:     	movups	0x50(%rbp), %xmm1
14551f855:     	movups	0x60(%rbp), %xmm2
14551f859:     	movups	0x70(%rbp), %xmm3
14551f85d:     	movups	%xmm3, 0x30(%rax,%rcx)
14551f862:     	movups	%xmm2, 0x20(%rax,%rcx)
14551f867:     	movups	%xmm1, 0x10(%rax,%rcx)
14551f86c:     	movups	%xmm0, (%rax,%rcx)
14551f870:     	incq	%rsi
14551f873:     	movq	%rsi, 0x5c0(%rbp)
14551f87a:     	cmpq	$0x510, %rdi            # imm = 0x510
14551f881:     	je	0x14551fd7f <.text+0x551ed7f>
14551f887:     	leaq	0x1215fba(%rip), %rax   # 0x146735848
14551f88e:     	addq	%rdi, %rax
14551f891:     	movq	%rax, 0x608(%rbp)
14551f898:     	addq	$0x10, %rax
14551f89c:     	movq	%rax, %r14
14551f89f:     	movq	%rax, 0x518(%rbp)
14551f8a6:     	leaq	-0x551d7ed(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551f8ad:     	movq	%rax, 0x520(%rbp)
14551f8b4:     	leaq	0x40(%rbp), %rcx
14551f8b8:     	leaq	0x18158c0(%rip), %rdx   # 0x146d3517f
14551f8bf:     	leaq	0x518(%rbp), %r8
14551f8c6:     	callq	0x145728390 <.text+0x5727390>
14551f8cb:     	nop
14551f8cc:     	movq	%rdi, 0x5d0(%rbp)
14551f8d3:     	movq	0x40(%rbp), %rax
14551f8d7:     	movq	%rax, 0x610(%rbp)
14551f8de:     	movq	0x48(%rbp), %rax
14551f8e2:     	movq	%rax, 0x618(%rbp)
14551f8e9:     	movq	0x50(%rbp), %rax
14551f8ed:     	movq	%rax, 0x5e8(%rbp)
14551f8f4:     	movb	$0x1, 0x606(%rbp)
14551f8fb:     	movl	$0x1a, %edx
14551f900:     	leaq	0x1815885(%rip), %rcx   # 0x146d3518c
14551f907:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f90c:     	nop
14551f90d:     	movq	%rax, %rdi
14551f910:     	movq	%rdx, %r13
14551f913:     	movq	%r14, 0x518(%rbp)
14551f91a:     	leaq	-0x551d861(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551f921:     	movq	%rax, 0x520(%rbp)
14551f928:     	movb	$0x1, 0x606(%rbp)
14551f92f:     	leaq	0x40(%rbp), %rcx
14551f933:     	leaq	0x120bfa0(%rip), %rdx   # 0x14672b8da
14551f93a:     	leaq	0x518(%rbp), %r8
14551f941:     	callq	0x145728390 <.text+0x5727390>
14551f946:     	nop
14551f947:     	movq	0x48(%rbp), %rcx
14551f94b:     	movq	0x50(%rbp), %rdx
14551f94f:     	movq	0x608(%rbp), %rax
14551f956:     	movq	0x20(%rax), %rsi
14551f95a:     	movq	0x28(%rax), %rbx
14551f95e:     	movq	%rcx, 0x5f0(%rbp)
14551f965:     	callq	0x145457cb0 <.text+0x5456cb0>
14551f96a:     	nop
14551f96b:     	movq	%rax, %r15
14551f96e:     	movq	%rdx, %r12
14551f971:     	movq	0x40(%rbp), %rdx
14551f975:     	testq	%rdx, %rdx
14551f978:     	je	0x14551f98c <.text+0x551e98c>
14551f97a:     	movl	$0x1, %r8d
14551f980:     	movq	0x5f0(%rbp), %rcx
14551f987:     	callq	0x1400021d0 <.text+0x11d0>
14551f98c:     	testq	%rdi, %rdi
14551f98f:     	movl	$0x1a, %eax
14551f994:     	cmoveq	%rax, %r13
14551f998:     	leaq	0x18157ed(%rip), %rax   # 0x146d3518c
14551f99f:     	cmoveq	%rax, %rdi
14551f9a3:     	testq	%r15, %r15
14551f9a6:     	cmoveq	%rsi, %r15
14551f9aa:     	cmoveq	%rbx, %r12
14551f9ae:     	movq	%r15, -0x50(%rbp)
14551f9b2:     	movq	%r12, -0x48(%rbp)
14551f9b6:     	leaq	0x18157a4(%rip), %rax   # 0x146d35161
14551f9bd:     	movq	%rax, 0x450(%rbp)
14551f9c4:     	movq	$0x5, 0x458(%rbp)
14551f9cf:     	leaq	-0x50(%rbp), %rax
14551f9d3:     	movq	%rax, 0x460(%rbp)
14551f9da:     	leaq	0x181573f(%rip), %rax   # 0x146d35120
14551f9e1:     	movq	%rax, 0x468(%rbp)
14551f9e8:     	movb	$0x1, 0x606(%rbp)
14551f9ef:     	movq	$0x1, 0x20(%rsp)
14551f9f8:     	leaq	0x470(%rbp), %rcx
14551f9ff:     	movq	%rdi, %rdx
14551fa02:     	movq	%r13, %r8
14551fa05:     	leaq	0x450(%rbp), %r9
14551fa0c:     	callq	0x145458060 <.text+0x5457060>
14551fa11:     	nop
14551fa12:     	movb	$0x1, 0x627(%rbp)
14551fa19:     	movl	$0x27, %edx
14551fa1e:     	leaq	0x1815781(%rip), %rcx   # 0x146d351a6
14551fa25:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fa2a:     	nop
14551fa2b:     	movq	%rax, %rdi
14551fa2e:     	movq	%rdx, %r13
14551fa31:     	testq	%rax, %rax
14551fa34:     	leaq	0x181576b(%rip), %rax   # 0x146d351a6
14551fa3b:     	cmoveq	%rax, %rdi
14551fa3f:     	movl	$0x27, %eax
14551fa44:     	cmoveq	%rax, %r13
14551fa48:     	movb	$0x1, 0x627(%rbp)
14551fa4f:     	movl	$0xe, %edx
14551fa54:     	leaq	0x181563d(%rip), %rcx   # 0x146d35098
14551fa5b:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fa60:     	nop
14551fa61:     	leaq	0x1212da0(%rip), %rax   # 0x146732808
14551fa68:     	movq	%rax, 0x518(%rbp)
14551fa6f:     	leaq	0x21a9da(%rip), %rax    # 0x14573a450 <.text+0x5739450>
14551fa76:     	movq	%rax, 0x520(%rbp)
14551fa7d:     	movb	$0x1, 0x627(%rbp)
14551fa84:     	leaq	0x40(%rbp), %rcx
14551fa88:     	leaq	0x120be92(%rip), %rdx   # 0x14672b921
14551fa8f:     	leaq	0x518(%rbp), %r8
14551fa96:     	callq	0x145728390 <.text+0x5727390>
14551fa9b:     	nop
14551fa9c:     	movq	0x48(%rbp), %rcx
14551faa0:     	movq	0x50(%rbp), %rdx
14551faa4:     	movq	%rcx, 0x5f0(%rbp)
14551faab:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fab0:     	nop
14551fab1:     	movq	%rax, %r15
14551fab4:     	movq	%rdx, %r12
14551fab7:     	movq	0x40(%rbp), %rdx
14551fabb:     	testq	%rdx, %rdx
14551fabe:     	je	0x14551fad2 <.text+0x551ead2>
14551fac0:     	movl	$0x1, %r8d
14551fac6:     	movq	0x5f0(%rbp), %rcx
14551facd:     	callq	0x1400021d0 <.text+0x11d0>
14551fad2:     	testq	%r15, %r15
14551fad5:     	leaq	0x1212b0c(%rip), %rax   # 0x1467325e8
14551fadc:     	cmoveq	%rax, %r15
14551fae0:     	movl	$0x6, %eax
14551fae5:     	cmoveq	%rax, %r12
14551fae9:     	movq	%r15, -0x38(%rbp)
14551faed:     	movq	%r12, -0x30(%rbp)
14551faf1:     	leaq	0x1214388(%rip), %rax   # 0x146733e80
14551faf8:     	movq	%rax, 0x518(%rbp)
14551faff:     	leaq	-0x551da46(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551fb06:     	movq	%rax, 0x520(%rbp)
14551fb0d:     	movb	$0x1, 0x627(%rbp)
14551fb14:     	leaq	0x40(%rbp), %rcx
14551fb18:     	leaq	0x120be30(%rip), %rdx   # 0x14672b94f
14551fb1f:     	leaq	0x518(%rbp), %r8
14551fb26:     	callq	0x145728390 <.text+0x5727390>
14551fb2b:     	nop
14551fb2c:     	movq	0x48(%rbp), %rcx
14551fb30:     	movq	0x50(%rbp), %rdx
14551fb34:     	movq	%rcx, 0x5f0(%rbp)
14551fb3b:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fb40:     	nop
14551fb41:     	movq	%rax, %r15
14551fb44:     	movq	%rdx, %r12
14551fb47:     	movq	0x40(%rbp), %rdx
14551fb4b:     	testq	%rdx, %rdx
14551fb4e:     	je	0x14551fb62 <.text+0x551eb62>
14551fb50:     	movl	$0x1, %r8d
14551fb56:     	movq	0x5f0(%rbp), %rcx
14551fb5d:     	callq	0x1400021d0 <.text+0x11d0>
14551fb62:     	testq	%r15, %r15
14551fb65:     	leaq	0x1212385(%rip), %rax   # 0x146731ef1
14551fb6c:     	cmoveq	%rax, %r15
14551fb70:     	movl	$0x12, %eax
14551fb75:     	cmoveq	%rax, %r12
14551fb79:     	movq	%r15, 0x428(%rbp)
14551fb80:     	movq	%r12, 0x430(%rbp)
14551fb87:     	movq	%r14, 0x518(%rbp)
14551fb8e:     	leaq	-0x551dad5(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14551fb95:     	movq	%rax, 0x520(%rbp)
14551fb9c:     	movb	$0x1, 0x627(%rbp)
14551fba3:     	leaq	0x40(%rbp), %rcx
14551fba7:     	leaq	0x120bd2c(%rip), %rdx   # 0x14672b8da
14551fbae:     	leaq	0x518(%rbp), %r8
14551fbb5:     	callq	0x145728390 <.text+0x5727390>
14551fbba:     	nop
14551fbbb:     	movq	0x48(%rbp), %rcx
14551fbbf:     	movq	0x50(%rbp), %rdx
14551fbc3:     	movq	%rcx, 0x5f0(%rbp)
14551fbca:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fbcf:     	nop
14551fbd0:     	movq	%rax, %r12
14551fbd3:     	movq	%rdx, %r15
14551fbd6:     	movq	0x40(%rbp), %rdx
14551fbda:     	testq	%rdx, %rdx
14551fbdd:     	je	0x14551fbf1 <.text+0x551ebf1>
14551fbdf:     	movl	$0x1, %r8d
14551fbe5:     	movq	0x5f0(%rbp), %rcx
14551fbec:     	callq	0x1400021d0 <.text+0x11d0>
14551fbf1:     	testq	%r12, %r12
14551fbf4:     	cmovneq	%r12, %rsi
14551fbf8:     	cmoveq	%rbx, %r15
14551fbfc:     	movq	%rsi, 0x418(%rbp)
14551fc03:     	movq	%r15, 0x420(%rbp)
14551fc0a:     	leaq	0x18155bc(%rip), %rax   # 0x146d351cd
14551fc11:     	movq	%rax, 0x518(%rbp)
14551fc18:     	movq	$0x4, 0x520(%rbp)
14551fc23:     	leaq	-0x38(%rbp), %rax
14551fc27:     	movq	%rax, 0x528(%rbp)
14551fc2e:     	leaq	0x18154eb(%rip), %rax   # 0x146d35120
14551fc35:     	movq	%rax, 0x530(%rbp)
14551fc3c:     	leaq	0x181558e(%rip), %rcx   # 0x146d351d1
14551fc43:     	movq	%rcx, 0x538(%rbp)
14551fc4a:     	movq	$0x4, 0x540(%rbp)
14551fc55:     	leaq	0x428(%rbp), %rcx
14551fc5c:     	movq	%rcx, 0x548(%rbp)
14551fc63:     	movq	%rax, 0x550(%rbp)
14551fc6a:     	leaq	0x18154f0(%rip), %rcx   # 0x146d35161
14551fc71:     	movq	%rcx, 0x558(%rbp)
14551fc78:     	movq	$0x5, 0x560(%rbp)
14551fc83:     	leaq	0x418(%rbp), %rcx
14551fc8a:     	movq	%rcx, 0x568(%rbp)
14551fc91:     	movq	%rax, 0x570(%rbp)
14551fc98:     	movb	$0x1, 0x627(%rbp)
14551fc9f:     	movq	$0x3, 0x20(%rsp)
14551fca8:     	leaq	0x438(%rbp), %rcx
14551fcaf:     	movq	%rdi, %rdx
14551fcb2:     	movq	%r13, %r8
14551fcb5:     	leaq	0x518(%rbp), %r9
14551fcbc:     	callq	0x145458060 <.text+0x5457060>
14551fcc1:     	nop
14551fcc2:     	movq	0x608(%rbp), %r14
14551fcc9:     	movups	0x60(%r14), %xmm0
14551fcce:     	movzbl	0x8c(%r14), %eax
14551fcd6:     	movq	0x610(%rbp), %rcx
14551fcdd:     	movq	%rcx, 0x40(%rbp)
14551fce1:     	movq	0x618(%rbp), %rcx
14551fce8:     	movq	%rcx, 0x48(%rbp)
14551fcec:     	movq	0x5e8(%rbp), %rcx
14551fcf3:     	movq	%rcx, 0x50(%rbp)
14551fcf7:     	movq	0x480(%rbp), %rcx
14551fcfe:     	leaq	0x58(%rbp), %rdx
14551fd02:     	movq	%rcx, 0x10(%rdx)
14551fd06:     	movups	0x470(%rbp), %xmm1
14551fd0d:     	movups	%xmm1, (%rdx)
14551fd10:     	movq	0x448(%rbp), %rcx
14551fd17:     	leaq	0x70(%rbp), %rdx
14551fd1b:     	movq	%rcx, 0x10(%rdx)
14551fd1f:     	movups	0x438(%rbp), %xmm1
14551fd26:     	movups	%xmm1, (%rdx)
14551fd29:     	movl	$0x19, 0xa8(%rbp)
14551fd33:     	movb	$0x1, 0xac(%rbp)
14551fd3a:     	movups	%xmm0, 0x98(%rbp)
14551fd41:     	movb	$0x3, 0x88(%rbp)
14551fd48:     	movb	%al, 0x89(%rbp)
14551fd4e:     	movq	$0xa, 0x90(%rbp)
14551fd59:     	movq	0x5c0(%rbp), %rsi
14551fd60:     	cmpq	0x5b0(%rbp), %rsi
14551fd67:     	jne	0x14551f810 <.text+0x551e810>
14551fd6d:     	leaq	0x5b0(%rbp), %rcx
14551fd74:     	callq	0x145778530 <.text+0x5777530>
14551fd79:     	nop
14551fd7a:     	jmp	0x14551f810 <.text+0x551e810>
14551fd7f:     	callq	0x140002200 <.text+0x1200>
14551fd84:     	movl	$0x9, %ecx
14551fd89:     	movl	$0x1, %edx
14551fd8e:     	callq	0x1400021c0 <.text+0x11c0>
14551fd93:     	testq	%rax, %rax
14551fd96:     	je	0x145522b8b <.text+0x5521b8b>
14551fd9c:     	movabsq	$0x3a73746e656c6174, %rbx # imm = 0x3A73746E656C6174
14551fda6:     	movq	%rbx, (%rax)
14551fda9:     	movq	%rax, 0x608(%rbp)
14551fdb0:     	movb	$0x31, 0x8(%rax)
14551fdb4:     	movb	$0x1, 0x602(%rbp)
14551fdbb:     	leaq	0x1815413(%rip), %rsi   # 0x146d351d5
14551fdc2:     	movl	$0xe, %edi
14551fdc7:     	movl	$0xe, %edx
14551fdcc:     	movq	%rsi, %rcx
14551fdcf:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fdd4:     	nop
14551fdd5:     	movq	%rdx, %r14
14551fdd8:     	testq	%rax, %rax
14551fddb:     	cmovneq	%rax, %rsi
14551fddf:     	cmoveq	%rdi, %r14
14551fde3:     	testq	%r14, %r14
14551fde6:     	jns	0x14551fe02 <.text+0x551ee02>
14551fde8:     	xorl	%edi, %edi
14551fdea:     	movb	$0x1, 0x602(%rbp)
14551fdf1:     	movq	%rdi, %rcx
14551fdf4:     	movq	%r14, %rdx
14551fdf7:     	callq	0x14590379b <.text+0x590279b>
14551fdfc:     	nop
14551fdfd:     	jmp	0x145522c20 <.text+0x5521c20>
14551fe02:     	movq	%r14, 0x610(%rbp)
14551fe09:     	je	0x14551fe3e <.text+0x551ee3e>
14551fe0b:     	callq	0x140002200 <.text+0x1200>
14551fe10:     	movl	$0x1, %edi
14551fe15:     	movl	$0x1, %edx
14551fe1a:     	movq	%r14, %rcx
14551fe1d:     	callq	0x1400021c0 <.text+0x11c0>
14551fe22:     	testq	%rax, %rax
14551fe25:     	je	0x14551fdea <.text+0x551edea>
14551fe27:     	movq	%rax, 0x618(%rbp)
14551fe2e:     	movq	%rax, %rcx
14551fe31:     	movq	%rsi, %rdx
14551fe34:     	movq	%r14, %r8
14551fe37:     	callq	0x1457731ed <.text+0x57721ed>
14551fe3c:     	jmp	0x14551fe4a <.text+0x551ee4a>
14551fe3e:     	movl	$0x1, %eax
14551fe43:     	movq	%rax, 0x618(%rbp)
14551fe4a:     	movb	$0x1, 0x5e7(%rbp)
14551fe51:     	leaq	0x181538b(%rip), %rsi   # 0x146d351e3
14551fe58:     	movl	$0x2a, %edi
14551fe5d:     	movl	$0x2a, %edx
14551fe62:     	movq	%rsi, %rcx
14551fe65:     	callq	0x145457cb0 <.text+0x5456cb0>
14551fe6a:     	nop
14551fe6b:     	movq	%rdx, %r8
14551fe6e:     	testq	%rax, %rax
14551fe71:     	cmovneq	%rax, %rsi
14551fe75:     	cmoveq	%rdi, %r8
14551fe79:     	movb	$0x1, 0x5e7(%rbp)
14551fe80:     	movq	$0x1, 0x20(%rsp)
14551fe89:     	leaq	0x18153a8(%rip), %r9    # 0x146d35238
14551fe90:     	leaq	0x518(%rbp), %rcx
14551fe97:     	movq	%rsi, %rdx
14551fe9a:     	callq	0x145458060 <.text+0x5457060>
14551fe9f:     	nop
14551fea0:     	movq	$0x9, 0x40(%rbp)
14551fea8:     	movq	0x608(%rbp), %rax
14551feaf:     	movq	%rax, 0x48(%rbp)
14551feb3:     	movq	$0x9, 0x50(%rbp)
14551febb:     	movq	0x610(%rbp), %rax
14551fec2:     	movq	%rax, 0x58(%rbp)
14551fec6:     	movq	0x618(%rbp), %rcx
14551fecd:     	movq	%rcx, 0x60(%rbp)
14551fed1:     	movq	%rax, 0x68(%rbp)
14551fed5:     	movups	0x518(%rbp), %xmm0
14551fedc:     	movups	%xmm0, 0x70(%rbp)
14551fee0:     	movq	0x528(%rbp), %rax
14551fee7:     	movq	%rax, 0x80(%rbp)
14551feee:     	movl	$0x19, 0xa8(%rbp)
14551fef8:     	movb	$0x1, 0xac(%rbp)
14551feff:     	leaq	0x1815352(%rip), %rax   # 0x146d35258
14551ff06:     	movq	%rax, 0x98(%rbp)
14551ff0d:     	movq	$0x10, 0xa0(%rbp)
14551ff18:     	movb	$0x4, 0x88(%rbp)
14551ff1f:     	movq	$0x1, 0x90(%rbp)
14551ff2a:     	movq	0x5c0(%rbp), %rsi
14551ff31:     	cmpq	0x5b0(%rbp), %rsi
14551ff38:     	jne	0x14551ff47 <.text+0x551ef47>
14551ff3a:     	leaq	0x5b0(%rbp), %rcx
14551ff41:     	callq	0x145778530 <.text+0x5777530>
14551ff46:     	nop
14551ff47:     	movq	0x5b8(%rbp), %rax
14551ff4e:     	imulq	$0x70, %rsi, %rcx
14551ff52:     	movups	0xa0(%rbp), %xmm0
14551ff59:     	movups	%xmm0, 0x60(%rax,%rcx)
14551ff5e:     	movups	0x90(%rbp), %xmm0
14551ff65:     	movups	%xmm0, 0x50(%rax,%rcx)
14551ff6a:     	movups	0x80(%rbp), %xmm0
14551ff71:     	movups	%xmm0, 0x40(%rax,%rcx)
14551ff76:     	movups	0x40(%rbp), %xmm0
14551ff7a:     	movups	0x50(%rbp), %xmm1
14551ff7e:     	movups	0x60(%rbp), %xmm2
14551ff82:     	movups	0x70(%rbp), %xmm3
14551ff86:     	movups	%xmm3, 0x30(%rax,%rcx)
14551ff8b:     	movups	%xmm2, 0x20(%rax,%rcx)
14551ff90:     	movups	%xmm1, 0x10(%rax,%rcx)
14551ff95:     	movups	%xmm0, (%rax,%rcx)
14551ff99:     	incq	%rsi
14551ff9c:     	movq	%rsi, 0x5c0(%rbp)
14551ffa3:     	callq	0x140002200 <.text+0x1200>
14551ffa8:     	movl	$0x9, %ecx
14551ffad:     	movl	$0x1, %edx
14551ffb2:     	callq	0x1400021c0 <.text+0x11c0>
14551ffb7:     	testq	%rax, %rax
14551ffba:     	je	0x145522bbc <.text+0x5521bbc>
14551ffc0:     	movq	%rbx, (%rax)
14551ffc3:     	movq	%rax, 0x608(%rbp)
14551ffca:     	movb	$0x39, 0x8(%rax)
14551ffce:     	movb	$0x1, 0x601(%rbp)
14551ffd5:     	leaq	0x181528c(%rip), %rsi   # 0x146d35268
14551ffdc:     	movl	$0xd, %edi
14551ffe1:     	movl	$0xd, %edx
14551ffe6:     	movq	%rsi, %rcx
14551ffe9:     	callq	0x145457cb0 <.text+0x5456cb0>
14551ffee:     	nop
14551ffef:     	testq	%rax, %rax
14551fff2:     	cmovneq	%rax, %rsi
14551fff6:     	movq	%rdx, %rbx
14551fff9:     	cmoveq	%rdi, %rbx
14551fffd:     	testq	%rbx, %rbx
145520000:     	jns	0x14552001c <.text+0x551f01c>
145520002:     	xorl	%edi, %edi
145520004:     	movb	$0x1, 0x601(%rbp)
14552000b:     	movq	%rdi, %rcx
14552000e:     	movq	%rbx, %rdx
145520011:     	callq	0x14590379b <.text+0x590279b>
145520016:     	nop
145520017:     	jmp	0x145522c20 <.text+0x5521c20>
14552001c:     	movq	%rbx, 0x610(%rbp)
145520023:     	je	0x145520058 <.text+0x551f058>
145520025:     	callq	0x140002200 <.text+0x1200>
14552002a:     	movl	$0x1, %edi
14552002f:     	movl	$0x1, %edx
145520034:     	movq	%rbx, %rcx
145520037:     	callq	0x1400021c0 <.text+0x11c0>
14552003c:     	testq	%rax, %rax
14552003f:     	je	0x145520004 <.text+0x551f004>
145520041:     	movq	%rax, 0x618(%rbp)
145520048:     	movq	%rax, %rcx
14552004b:     	movq	%rsi, %rdx
14552004e:     	movq	%rbx, %r8
145520051:     	callq	0x1457731ed <.text+0x57721ed>
145520056:     	jmp	0x145520064 <.text+0x551f064>
145520058:     	movl	$0x1, %eax
14552005d:     	movq	%rax, 0x618(%rbp)
145520064:     	movb	$0x1, 0x5e6(%rbp)
14552006b:     	leaq	0x1815203(%rip), %rsi   # 0x146d35275
145520072:     	movl	$0x2c, %edi
145520077:     	movl	$0x2c, %edx
14552007c:     	movq	%rsi, %rcx
14552007f:     	callq	0x145457cb0 <.text+0x5456cb0>
145520084:     	nop
145520085:     	movq	%rdx, %r8
145520088:     	testq	%rax, %rax
14552008b:     	cmovneq	%rax, %rsi
14552008f:     	cmoveq	%rdi, %r8
145520093:     	movb	$0x1, 0x5e6(%rbp)
14552009a:     	movq	$0x1, 0x20(%rsp)
1455200a3:     	leaq	0x181518e(%rip), %r9    # 0x146d35238
1455200aa:     	leaq	0x518(%rbp), %rcx
1455200b1:     	movq	%rsi, %rdx
1455200b4:     	callq	0x145458060 <.text+0x5457060>
1455200b9:     	nop
1455200ba:     	movq	$0x9, 0x40(%rbp)
1455200c2:     	movq	0x608(%rbp), %rax
1455200c9:     	movq	%rax, 0x48(%rbp)
1455200cd:     	movq	$0x9, 0x50(%rbp)
1455200d5:     	movq	0x610(%rbp), %rax
1455200dc:     	movq	%rax, 0x58(%rbp)
1455200e0:     	movq	0x618(%rbp), %rcx
1455200e7:     	movq	%rcx, 0x60(%rbp)
1455200eb:     	movq	%rax, 0x68(%rbp)
1455200ef:     	movups	0x518(%rbp), %xmm0
1455200f6:     	movups	%xmm0, 0x70(%rbp)
1455200fa:     	movq	0x528(%rbp), %rax
145520101:     	movq	%rax, 0x80(%rbp)
145520108:     	movl	$0x32, 0xa8(%rbp)
145520112:     	movb	$0x1, 0xac(%rbp)
145520119:     	leaq	0x1815181(%rip), %rax   # 0x146d352a1
145520120:     	movq	%rax, 0x98(%rbp)
145520127:     	movq	$0x10, 0xa0(%rbp)
145520132:     	movb	$0x4, 0x88(%rbp)
145520139:     	movq	$0x9, 0x90(%rbp)
145520144:     	movq	0x5c0(%rbp), %rsi
14552014b:     	cmpq	0x5b0(%rbp), %rsi
145520152:     	jne	0x145520161 <.text+0x551f161>
145520154:     	leaq	0x5b0(%rbp), %rcx
14552015b:     	callq	0x145778530 <.text+0x5777530>
145520160:     	nop
145520161:     	movq	0x5b8(%rbp), %rax
145520168:     	imulq	$0x70, %rsi, %rcx
14552016c:     	movups	0xa0(%rbp), %xmm0
145520173:     	movups	%xmm0, 0x60(%rax,%rcx)
145520178:     	movups	0x90(%rbp), %xmm0
14552017f:     	movups	%xmm0, 0x50(%rax,%rcx)
145520184:     	movups	0x80(%rbp), %xmm0
14552018b:     	movups	%xmm0, 0x40(%rax,%rcx)
145520190:     	movups	0x40(%rbp), %xmm0
145520194:     	movups	0x50(%rbp), %xmm1
145520198:     	movups	0x60(%rbp), %xmm2
14552019c:     	movups	0x70(%rbp), %xmm3
1455201a0:     	movups	%xmm3, 0x30(%rax,%rcx)
1455201a5:     	movups	%xmm2, 0x20(%rax,%rcx)
1455201aa:     	movups	%xmm1, 0x10(%rax,%rcx)
1455201af:     	movups	%xmm0, (%rax,%rcx)
1455201b3:     	incq	%rsi
1455201b6:     	movq	%rsi, 0x5c0(%rbp)
1455201bd:     	leaq	0x18150ed(%rip), %rsi   # 0x146d352b1
1455201c4:     	movl	$0x9, %ebx
1455201c9:     	movl	$0x9, %edx
1455201ce:     	movq	%rsi, %rcx
1455201d1:     	callq	0x145457cb0 <.text+0x5456cb0>
1455201d6:     	nop
1455201d7:     	movq	%rdx, %rdi
1455201da:     	testq	%rax, %rax
1455201dd:     	cmovneq	%rax, %rsi
1455201e1:     	cmoveq	%rbx, %rdi
1455201e5:     	leaq	0x18150dd(%rip), %rbx   # 0x146d352c9
1455201ec:     	movl	$0x7, %edx
1455201f1:     	movq	%rbx, %rcx
1455201f4:     	callq	0x145457cb0 <.text+0x5456cb0>
1455201f9:     	nop
1455201fa:     	movq	%rax, %r12
1455201fd:     	movq	%rdx, %r14
145520200:     	leaq	0x18150da(%rip), %r15   # 0x146d352e1
145520207:     	movl	$0x7, %r13d
14552020d:     	movl	$0x7, %edx
145520212:     	movq	%r15, %rcx
145520215:     	callq	0x145457cb0 <.text+0x5456cb0>
14552021a:     	nop
14552021b:     	testq	%r12, %r12
14552021e:     	cmoveq	%r13, %r14
145520222:     	cmovneq	%r12, %rbx
145520226:     	testq	%rax, %rax
145520229:     	cmovneq	%rax, %r15
14552022d:     	cmoveq	%r13, %rdx
145520231:     	movq	$0x0, 0x40(%rbp)
145520239:     	movq	$0x3, 0x48(%rbp)
145520241:     	leaq	0x50(%rbp), %r12
145520245:     	movq	%rsi, 0x50(%rbp)
145520249:     	movq	%rdi, 0x58(%rbp)
14552024d:     	movq	$0x19, 0x60(%rbp)
145520255:     	movl	$0xa, 0x68(%rbp)
14552025c:     	leaq	0x1815057(%rip), %rax   # 0x146d352ba
145520263:     	movq	%rax, 0x70(%rbp)
145520267:     	movq	$0xf, 0x78(%rbp)
14552026f:     	movq	%rbx, 0x80(%rbp)
145520276:     	movq	%r14, 0x88(%rbp)
14552027d:     	movq	$0x64, 0x90(%rbp)
145520288:     	movl	$0xa, 0x98(%rbp)
145520292:     	leaq	0x1815037(%rip), %rax   # 0x146d352d0
145520299:     	movq	%rax, 0xa0(%rbp)
1455202a0:     	movq	$0x11, 0xa8(%rbp)
1455202ab:     	movq	%r15, 0xb0(%rbp)
1455202b2:     	movq	%rdx, 0xb8(%rbp)
1455202b9:     	movq	$0xfa, 0xc0(%rbp)
1455202c4:     	movl	$0x19, 0xc8(%rbp)
1455202ce:     	leaq	0x1815013(%rip), %rax   # 0x146d352e8
1455202d5:     	movq	%rax, 0xd0(%rbp)
1455202dc:     	movq	$0xd, 0xd8(%rbp)
1455202e7:     	xorl	%r15d, %r15d
1455202ea:     	cmpq	$0x3, %r15
1455202ee:     	je	0x1455205ba <.text+0x551f5ba>
1455202f4:     	leaq	(%r15,%r15,2), %rax
1455202f8:     	shlq	$0x4, %rax
1455202fc:     	movq	(%r12,%rax), %r13
145520300:     	testq	%r13, %r13
145520303:     	je	0x1455205ba <.text+0x551f5ba>
145520309:     	leaq	(%r12,%rax), %rcx
14552030d:     	movq	0x8(%r12,%rax), %rdx
145520312:     	movq	%rdx, 0x608(%rbp)
145520319:     	movl	0x18(%r12,%rax), %r14d
14552031e:     	movq	0x20(%r12,%rax), %rdx
145520323:     	movq	%rdx, 0x5e8(%rbp)
14552032a:     	movq	%r12, %rsi
14552032d:     	movq	0x28(%r12,%rax), %rbx
145520332:     	movq	0x10(%rcx), %rax
145520336:     	movq	%rax, 0x470(%rbp)
14552033d:     	leaq	0x470(%rbp), %rax
145520344:     	movq	%rax, 0x450(%rbp)
14552034b:     	leaq	0x21afee(%rip), %rax    # 0x14573b340 <.text+0x573a340>
145520352:     	movq	%rax, 0x458(%rbp)
145520359:     	leaq	0x518(%rbp), %rcx
145520360:     	leaq	0x181565c(%rip), %rdx   # 0x146d359c3
145520367:     	leaq	0x450(%rbp), %r8
14552036e:     	callq	0x145728390 <.text+0x5727390>
145520373:     	nop
145520374:     	incq	%r15
145520377:     	movq	0x518(%rbp), %rax
14552037e:     	movq	%rax, 0x610(%rbp)
145520385:     	movq	0x520(%rbp), %rax
14552038c:     	movq	%rax, 0x618(%rbp)
145520393:     	cmpq	$0x0, 0x608(%rbp)
14552039b:     	js	0x14552066d <.text+0x551f66d>
1455203a1:     	movq	0x528(%rbp), %rdi
1455203a8:     	je	0x1455203f7 <.text+0x551f3f7>
1455203aa:     	movq	%rdi, 0x5f0(%rbp)
1455203b1:     	callq	0x140002200 <.text+0x1200>
1455203b6:     	movl	$0x1, %r12d
1455203bc:     	movl	$0x1, %edx
1455203c1:     	movq	0x608(%rbp), %rdi
1455203c8:     	movq	%rdi, %rcx
1455203cb:     	callq	0x1400021c0 <.text+0x11c0>
1455203d0:     	testq	%rax, %rax
1455203d3:     	je	0x145522bce <.text+0x5521bce>
1455203d9:     	movq	%rax, 0x5d0(%rbp)
1455203e0:     	movq	%rax, %rcx
1455203e3:     	movq	%r13, %rdx
1455203e6:     	movq	%rdi, %r8
1455203e9:     	callq	0x1457731ed <.text+0x57721ed>
1455203ee:     	movq	0x5f0(%rbp), %rdi
1455203f5:     	jmp	0x145520403 <.text+0x551f403>
1455203f7:     	movl	$0x1, %eax
1455203fc:     	movq	%rax, 0x5d0(%rbp)
145520403:     	movb	$0x1, 0x5de(%rbp)
14552040a:     	movl	$0x29, %edx
14552040f:     	leaq	0x18155b7(%rip), %r13   # 0x146d359cd
145520416:     	movq	%r13, %rcx
145520419:     	callq	0x145457cb0 <.text+0x5456cb0>
14552041e:     	nop
14552041f:     	movq	%rdx, %r8
145520422:     	movq	%rsi, %r12
145520425:     	testq	%rax, %rax
145520428:     	cmoveq	%r13, %rax
14552042c:     	movl	$0x29, %ecx
145520431:     	cmoveq	%rcx, %r8
145520435:     	leaq	0x1814dd1(%rip), %rcx   # 0x146d3520d
14552043c:     	movq	%rcx, 0x450(%rbp)
145520443:     	movq	$0x1, 0x458(%rbp)
14552044e:     	leaq	0x470(%rbp), %rcx
145520455:     	movq	%rcx, 0x460(%rbp)
14552045c:     	leaq	0x1815595(%rip), %rcx   # 0x146d359f8
145520463:     	movq	%rcx, 0x468(%rbp)
14552046a:     	movb	$0x1, 0x5de(%rbp)
145520471:     	movq	$0x1, 0x20(%rsp)
14552047a:     	leaq	0x438(%rbp), %rcx
145520481:     	movq	%rax, %rdx
145520484:     	leaq	0x450(%rbp), %r9
14552048b:     	callq	0x145458060 <.text+0x5457060>
145520490:     	nop
145520491:     	movq	0x470(%rbp), %rax
145520498:     	movq	0x610(%rbp), %rcx
14552049f:     	movq	%rcx, 0x518(%rbp)
1455204a6:     	movq	0x618(%rbp), %rcx
1455204ad:     	movq	%rcx, 0x520(%rbp)
1455204b4:     	movq	%rdi, 0x528(%rbp)
1455204bb:     	movq	0x608(%rbp), %rdx
1455204c2:     	movq	%rdx, 0x530(%rbp)
1455204c9:     	movq	0x5d0(%rbp), %rcx
1455204d0:     	movq	%rcx, 0x538(%rbp)
1455204d7:     	movq	%rdx, 0x540(%rbp)
1455204de:     	movq	0x448(%rbp), %rcx
1455204e5:     	leaq	0x548(%rbp), %rdx
1455204ec:     	movq	%rcx, 0x10(%rdx)
1455204f0:     	movups	0x438(%rbp), %xmm0
1455204f7:     	movups	%xmm0, (%rdx)
1455204fa:     	movl	%r14d, 0x580(%rbp)
145520501:     	movb	$0x2, 0x584(%rbp)
145520508:     	movq	0x5e8(%rbp), %rcx
14552050f:     	movq	%rcx, 0x570(%rbp)
145520516:     	movq	%rbx, 0x578(%rbp)
14552051d:     	movb	$0x5, 0x560(%rbp)
145520524:     	movq	%rax, 0x568(%rbp)
14552052b:     	movq	0x5c0(%rbp), %rsi
145520532:     	cmpq	0x5b0(%rbp), %rsi
145520539:     	jne	0x145520548 <.text+0x551f548>
14552053b:     	leaq	0x5b0(%rbp), %rcx
145520542:     	callq	0x145778530 <.text+0x5777530>
145520547:     	nop
145520548:     	movq	0x5b8(%rbp), %rax
14552054f:     	imulq	$0x70, %rsi, %rcx
145520553:     	movups	0x578(%rbp), %xmm0
14552055a:     	movups	%xmm0, 0x60(%rax,%rcx)
14552055f:     	movups	0x568(%rbp), %xmm0
145520566:     	movups	%xmm0, 0x50(%rax,%rcx)
14552056b:     	movups	0x558(%rbp), %xmm0
145520572:     	movups	%xmm0, 0x40(%rax,%rcx)
145520577:     	movups	0x518(%rbp), %xmm0
14552057e:     	movups	0x528(%rbp), %xmm1
145520585:     	movups	0x538(%rbp), %xmm2
14552058c:     	movups	0x548(%rbp), %xmm3
145520593:     	movups	%xmm3, 0x30(%rax,%rcx)
145520598:     	movups	%xmm2, 0x20(%rax,%rcx)
14552059d:     	movups	%xmm1, 0x10(%rax,%rcx)
1455205a2:     	movups	%xmm0, (%rax,%rcx)
1455205a6:     	incq	%rsi
1455205a9:     	movq	%rsi, 0x5c0(%rbp)
1455205b0:     	cmpq	$0x3, %r15
1455205b4:     	jne	0x1455202f4 <.text+0x551f2f4>
1455205ba:     	xorl	%esi, %esi
1455205bc:     	leaq	0x14b6785(%rip), %r14   # 0x1469d6d48
1455205c3:     	leaq	0x14b67ae(%rip), %r12   # 0x1469d6d78
1455205ca:     	leaq	0x518(%rbp), %rdi
1455205d1:     	leaq	0x40(%rbp), %rbx
1455205d5:     	xorl	%r15d, %r15d
1455205d8:     	jmp	0x1455205ea <.text+0x551f5ea>
1455205da:     	addq	%r13, %r15
1455205dd:     	incq	%rsi
1455205e0:     	cmpq	$0x9, %rsi
1455205e4:     	je	0x14552068c <.text+0x551f68c>
1455205ea:     	leaq	(%rsi,%rsi,8), %rax
1455205ee:     	shlq	$0x4, %rax
1455205f2:     	leaq	0x121524f(%rip), %rcx   # 0x146735848
1455205f9:     	movzbl	0x8c(%rax,%rcx), %eax
145520601:     	movb	%al, 0x450(%rbp)
145520607:     	movq	$0x0, 0x40(%rbp)
14552060f:     	movq	$0x0, 0x68(%rbp)
145520617:     	movq	%r14, 0x90(%rbp)
14552061e:     	movq	%r12, 0x98(%rbp)
145520625:     	leaq	0x450(%rbp), %rax
14552062c:     	movq	%rax, 0xa0(%rbp)
145520633:     	movq	%rdi, %rcx
145520636:     	movq	%rbx, %rdx
145520639:     	callq	0x14553eda0 <.text+0x553dda0>
14552063e:     	nop
14552063f:     	movq	0x518(%rbp), %rdx
145520646:     	movq	0x528(%rbp), %r13
14552064d:     	testq	%rdx, %rdx
145520650:     	je	0x1455205da <.text+0x551f5da>
145520652:     	movq	0x520(%rbp), %rcx
145520659:     	shlq	$0x2, %rdx
14552065d:     	movl	$0x4, %r8d
145520663:     	callq	0x1400021d0 <.text+0x11d0>
145520668:     	jmp	0x1455205da <.text+0x551f5da>
14552066d:     	xorl	%r12d, %r12d
145520670:     	movb	$0x1, 0x5df(%rbp)
145520677:     	movq	%r12, %rcx
14552067a:     	movq	0x5d0(%rbp), %rdx
145520681:     	callq	0x14590379b <.text+0x590279b>
145520686:     	nop
145520687:     	jmp	0x145522c20 <.text+0x5521c20>
14552068c:     	callq	0x140002200 <.text+0x1200>
145520691:     	movl	$0xa, %ecx
145520696:     	movl	$0x1, %edx
14552069b:     	callq	0x1400021c0 <.text+0x11c0>
1455206a0:     	testq	%rax, %rax
1455206a3:     	je	0x145522bda <.text+0x5521bda>
1455206a9:     	movabsq	$0x613a736563656970, %rcx # imm = 0x613A736563656970
1455206b3:     	movq	%rcx, (%rax)
1455206b6:     	movq	%rax, 0x608(%rbp)
1455206bd:     	movw	$0x6c6c, 0x8(%rax)      # imm = 0x6C6C
1455206c3:     	movb	$0x1, 0x600(%rbp)
1455206ca:     	leaq	0x1814c24(%rip), %rsi   # 0x146d352f5
1455206d1:     	movl	$0x10, %edi
1455206d6:     	movl	$0x10, %edx
1455206db:     	movq	%rsi, %rcx
1455206de:     	callq	0x145457cb0 <.text+0x5456cb0>
1455206e3:     	nop
1455206e4:     	testq	%rax, %rax
1455206e7:     	cmovneq	%rax, %rsi
1455206eb:     	movq	%rdx, %rbx
1455206ee:     	cmoveq	%rdi, %rbx
1455206f2:     	testq	%rbx, %rbx
1455206f5:     	jns	0x145520711 <.text+0x551f711>
1455206f7:     	xorl	%edi, %edi
1455206f9:     	movb	$0x1, 0x600(%rbp)
145520700:     	movq	%rdi, %rcx
145520703:     	movq	%rbx, %rdx
145520706:     	callq	0x14590379b <.text+0x590279b>
14552070b:     	nop
14552070c:     	jmp	0x145522c20 <.text+0x5521c20>
145520711:     	movq	%rbx, 0x610(%rbp)
145520718:     	je	0x14552075b <.text+0x551f75b>
14552071a:     	callq	0x140002200 <.text+0x1200>
14552071f:     	movl	$0x1, %edi
145520724:     	movl	$0x1, %edx
145520729:     	movq	%rbx, %rcx
14552072c:     	callq	0x1400021c0 <.text+0x11c0>
145520731:     	testq	%rax, %rax
145520734:     	je	0x1455206f9 <.text+0x551f6f9>
145520736:     	movq	%rax, 0x618(%rbp)
14552073d:     	movq	%rax, %rcx
145520740:     	movq	%rsi, %rdx
145520743:     	movq	%rbx, %r8
145520746:     	callq	0x1457731ed <.text+0x57721ed>
14552074b:     	jmp	0x145520767 <.text+0x551f767>
14552074d:     	leaq	0x181438c(%rip), %rcx   # 0x146d34ae0
145520754:     	callq	0x145903a90 <.text+0x5902a90>
145520759:     	ud2
14552075b:     	movl	$0x1, %eax
145520760:     	movq	%rax, 0x618(%rbp)
145520767:     	movb	$0x1, 0x5e5(%rbp)
14552076e:     	leaq	0x1814b90(%rip), %rdi   # 0x146d35305
145520775:     	movl	$0x2b, %ebx
14552077a:     	movl	$0x2b, %edx
14552077f:     	movq	%rdi, %rcx
145520782:     	callq	0x145457cb0 <.text+0x5456cb0>
145520787:     	nop
145520788:     	movq	%rdx, %rsi
14552078b:     	testq	%rax, %rax
14552078e:     	cmovneq	%rax, %rdi
145520792:     	cmoveq	%rbx, %rsi
145520796:     	testq	%rsi, %rsi
145520799:     	jns	0x1455207b6 <.text+0x551f7b6>
14552079b:     	xorl	%r14d, %r14d
14552079e:     	movb	$0x1, 0x5e5(%rbp)
1455207a5:     	movq	%r14, %rcx
1455207a8:     	movq	%rsi, %rdx
1455207ab:     	callq	0x14590379b <.text+0x590279b>
1455207b0:     	nop
1455207b1:     	jmp	0x145522c20 <.text+0x5521c20>
1455207b6:     	je	0x1455207e8 <.text+0x551f7e8>
1455207b8:     	callq	0x140002200 <.text+0x1200>
1455207bd:     	movl	$0x1, %r14d
1455207c3:     	movl	$0x1, %edx
1455207c8:     	movq	%rsi, %rcx
1455207cb:     	callq	0x1400021c0 <.text+0x11c0>
1455207d0:     	testq	%rax, %rax
1455207d3:     	je	0x14552079e <.text+0x551f79e>
1455207d5:     	movq	%rax, %rbx
1455207d8:     	movq	%rax, %rcx
1455207db:     	movq	%rdi, %rdx
1455207de:     	movq	%rsi, %r8
1455207e1:     	callq	0x1457731ed <.text+0x57721ed>
1455207e6:     	jmp	0x1455207ed <.text+0x551f7ed>
1455207e8:     	movl	$0x1, %ebx
1455207ed:     	movq	$0xa, 0x40(%rbp)
1455207f5:     	movq	0x608(%rbp), %rax
1455207fc:     	movq	%rax, 0x48(%rbp)
145520800:     	movq	$0xa, 0x50(%rbp)
145520808:     	movq	0x610(%rbp), %rax
14552080f:     	movq	%rax, 0x58(%rbp)
145520813:     	movq	0x618(%rbp), %rcx
14552081a:     	movq	%rcx, 0x60(%rbp)
14552081e:     	movq	%rax, 0x68(%rbp)
145520822:     	movq	%rsi, 0x70(%rbp)
145520826:     	movq	%rbx, 0x78(%rbp)
14552082a:     	movq	%rsi, 0x80(%rbp)
145520831:     	movl	$0x32, 0xa8(%rbp)
14552083b:     	movb	$0x2, 0xac(%rbp)
145520842:     	leaq	0x1814ae7(%rip), %rax   # 0x146d35330
145520849:     	movq	%rax, 0x98(%rbp)
145520850:     	movq	$0xd, 0xa0(%rbp)
14552085b:     	movb	$0x5, 0x88(%rbp)
145520862:     	movq	%r15, 0x90(%rbp)
145520869:     	movq	0x5c0(%rbp), %rsi
145520870:     	cmpq	0x5b0(%rbp), %rsi
145520877:     	jne	0x145520886 <.text+0x551f886>
145520879:     	leaq	0x5b0(%rbp), %rcx
145520880:     	callq	0x145778530 <.text+0x5777530>
145520885:     	nop
145520886:     	movq	0x5b8(%rbp), %rax
14552088d:     	imulq	$0x70, %rsi, %rcx
145520891:     	movups	0xa0(%rbp), %xmm0
145520898:     	movups	%xmm0, 0x60(%rax,%rcx)
14552089d:     	movups	0x90(%rbp), %xmm0
1455208a4:     	movups	%xmm0, 0x50(%rax,%rcx)
1455208a9:     	movups	0x80(%rbp), %xmm0
1455208b0:     	movups	%xmm0, 0x40(%rax,%rcx)
1455208b5:     	movups	0x40(%rbp), %xmm0
1455208b9:     	movups	0x50(%rbp), %xmm1
1455208bd:     	movups	0x60(%rbp), %xmm2
1455208c1:     	movups	0x70(%rbp), %xmm3
1455208c5:     	movups	%xmm3, 0x30(%rax,%rcx)
1455208ca:     	movups	%xmm2, 0x20(%rax,%rcx)
1455208cf:     	movups	%xmm1, 0x10(%rax,%rcx)
1455208d4:     	movups	%xmm0, (%rax,%rcx)
1455208d8:     	incq	%rsi
1455208db:     	movq	%rsi, 0x5c0(%rbp)
1455208e2:     	callq	0x140002200 <.text+0x1200>
1455208e7:     	movl	$0xc, %ecx
1455208ec:     	movl	$0x1, %edx
1455208f1:     	callq	0x1400021c0 <.text+0x11c0>
1455208f6:     	testq	%rax, %rax
1455208f9:     	je	0x145522bec <.text+0x5521bec>
1455208ff:     	movabsq	$0x7261646e6567656c, %rcx # imm = 0x7261646E6567656C
145520909:     	movq	%rcx, (%rax)
14552090c:     	movq	%rax, 0x608(%rbp)
145520913:     	movl	$0x74657379, 0x8(%rax)  # imm = 0x74657379
14552091a:     	movb	$0x1, 0x5ff(%rbp)
145520921:     	leaq	0x1814a15(%rip), %rsi   # 0x146d3533d
145520928:     	movl	$0x9, %edi
14552092d:     	movl	$0x9, %edx
145520932:     	movq	%rsi, %rcx
145520935:     	callq	0x145457cb0 <.text+0x5456cb0>
14552093a:     	nop
14552093b:     	testq	%rax, %rax
14552093e:     	cmovneq	%rax, %rsi
145520942:     	movq	%rdx, %rbx
145520945:     	cmoveq	%rdi, %rbx
145520949:     	testq	%rbx, %rbx
14552094c:     	jns	0x145520968 <.text+0x551f968>
14552094e:     	xorl	%edi, %edi
145520950:     	movb	$0x1, 0x5ff(%rbp)
145520957:     	movq	%rdi, %rcx
14552095a:     	movq	%rbx, %rdx
14552095d:     	callq	0x14590379b <.text+0x590279b>
145520962:     	nop
145520963:     	jmp	0x145522c20 <.text+0x5521c20>
145520968:     	movq	%rbx, 0x610(%rbp)
14552096f:     	je	0x1455209a4 <.text+0x551f9a4>
145520971:     	callq	0x140002200 <.text+0x1200>
145520976:     	movl	$0x1, %edi
14552097b:     	movl	$0x1, %edx
145520980:     	movq	%rbx, %rcx
145520983:     	callq	0x1400021c0 <.text+0x11c0>
145520988:     	testq	%rax, %rax
14552098b:     	je	0x145520950 <.text+0x551f950>
14552098d:     	movq	%rax, 0x618(%rbp)
145520994:     	movq	%rax, %rcx
145520997:     	movq	%rsi, %rdx
14552099a:     	movq	%rbx, %r8
14552099d:     	callq	0x1457731ed <.text+0x57721ed>
1455209a2:     	jmp	0x1455209b0 <.text+0x551f9b0>
1455209a4:     	movl	$0x1, %eax
1455209a9:     	movq	%rax, 0x618(%rbp)
1455209b0:     	movb	$0x1, 0x5e4(%rbp)
1455209b7:     	leaq	0x1814988(%rip), %rdi   # 0x146d35346
1455209be:     	movl	$0x2b, %ebx
1455209c3:     	movl	$0x2b, %edx
1455209c8:     	movq	%rdi, %rcx
1455209cb:     	callq	0x145457cb0 <.text+0x5456cb0>
1455209d0:     	nop
1455209d1:     	movq	%rdx, %rsi
1455209d4:     	testq	%rax, %rax
1455209d7:     	cmovneq	%rax, %rdi
1455209db:     	cmoveq	%rbx, %rsi
1455209df:     	testq	%rsi, %rsi
1455209e2:     	jns	0x1455209ff <.text+0x551f9ff>
1455209e4:     	xorl	%r14d, %r14d
1455209e7:     	movb	$0x1, 0x5e4(%rbp)
1455209ee:     	movq	%r14, %rcx
1455209f1:     	movq	%rsi, %rdx
1455209f4:     	callq	0x14590379b <.text+0x590279b>
1455209f9:     	nop
1455209fa:     	jmp	0x145522c20 <.text+0x5521c20>
1455209ff:     	je	0x145520a31 <.text+0x551fa31>
145520a01:     	callq	0x140002200 <.text+0x1200>
145520a06:     	movl	$0x1, %r14d
145520a0c:     	movl	$0x1, %edx
145520a11:     	movq	%rsi, %rcx
145520a14:     	callq	0x1400021c0 <.text+0x11c0>
145520a19:     	testq	%rax, %rax
145520a1c:     	je	0x1455209e7 <.text+0x551f9e7>
145520a1e:     	movq	%rax, %rbx
145520a21:     	movq	%rax, %rcx
145520a24:     	movq	%rdi, %rdx
145520a27:     	movq	%rsi, %r8
145520a2a:     	callq	0x1457731ed <.text+0x57721ed>
145520a2f:     	jmp	0x145520a36 <.text+0x551fa36>
145520a31:     	movl	$0x1, %ebx
145520a36:     	movq	$0xc, 0x40(%rbp)
145520a3e:     	movq	0x608(%rbp), %rax
145520a45:     	movq	%rax, 0x48(%rbp)
145520a49:     	movq	$0xc, 0x50(%rbp)
145520a51:     	movq	0x610(%rbp), %rax
145520a58:     	movq	%rax, 0x58(%rbp)
145520a5c:     	movq	0x618(%rbp), %rcx
145520a63:     	movq	%rcx, 0x60(%rbp)
145520a67:     	movq	%rax, 0x68(%rbp)
145520a6b:     	movq	%rsi, 0x70(%rbp)
145520a6f:     	movq	%rbx, 0x78(%rbp)
145520a73:     	movq	%rsi, 0x80(%rbp)
145520a7a:     	movl	$0x19, 0xa8(%rbp)
145520a84:     	movb	$0x2, 0xac(%rbp)
145520a8b:     	leaq	0x18148df(%rip), %rax   # 0x146d35371
145520a92:     	movq	%rax, 0x98(%rbp)
145520a99:     	movq	$0xc, 0xa0(%rbp)
145520aa4:     	movb	$0x6, 0x88(%rbp)
145520aab:     	movq	0x5c0(%rbp), %rsi
145520ab2:     	cmpq	0x5b0(%rbp), %rsi
145520ab9:     	jne	0x145520ac8 <.text+0x551fac8>
145520abb:     	leaq	0x5b0(%rbp), %rcx
145520ac2:     	callq	0x145778530 <.text+0x5777530>
145520ac7:     	nop
145520ac8:     	movq	0x5b8(%rbp), %rax
145520acf:     	imulq	$0x70, %rsi, %rcx
145520ad3:     	movups	0xa0(%rbp), %xmm0
145520ada:     	movups	%xmm0, 0x60(%rax,%rcx)
145520adf:     	movups	0x90(%rbp), %xmm0
145520ae6:     	movups	%xmm0, 0x50(%rax,%rcx)
145520aeb:     	movups	0x80(%rbp), %xmm0
145520af2:     	movups	%xmm0, 0x40(%rax,%rcx)
145520af7:     	movups	0x40(%rbp), %xmm0
145520afb:     	movups	0x50(%rbp), %xmm1
145520aff:     	movups	0x60(%rbp), %xmm2
145520b03:     	movups	0x70(%rbp), %xmm3
145520b07:     	movups	%xmm3, 0x30(%rax,%rcx)
145520b0c:     	movups	%xmm2, 0x20(%rax,%rcx)
145520b11:     	movups	%xmm1, 0x10(%rax,%rcx)
145520b16:     	movups	%xmm0, (%rax,%rcx)
145520b1a:     	incq	%rsi
145520b1d:     	movq	%rsi, 0x5c0(%rbp)
145520b24:     	callq	0x140002200 <.text+0x1200>
145520b29:     	movl	$0x8, %ecx
145520b2e:     	movl	$0x1, %edx
145520b33:     	callq	0x1400021c0 <.text+0x11c0>
145520b38:     	testq	%rax, %rax
145520b3b:     	je	0x145522bfe <.text+0x5521bfe>
145520b41:     	movabsq	$0x30353a7865646f63, %rcx # imm = 0x30353A7865646F63
145520b4b:     	movq	%rax, 0x608(%rbp)
145520b52:     	movq	%rcx, (%rax)
145520b55:     	movb	$0x1, 0x5fe(%rbp)
145520b5c:     	leaq	0x181481a(%rip), %rsi   # 0x146d3537d
145520b63:     	movl	$0xd, %edi
145520b68:     	movl	$0xd, %edx
145520b6d:     	movq	%rsi, %rcx
145520b70:     	callq	0x145457cb0 <.text+0x5456cb0>
145520b75:     	nop
145520b76:     	testq	%rax, %rax
145520b79:     	cmovneq	%rax, %rsi
145520b7d:     	movq	%rdx, %rbx
145520b80:     	cmoveq	%rdi, %rbx
145520b84:     	testq	%rbx, %rbx
145520b87:     	jns	0x145520ba3 <.text+0x551fba3>
145520b89:     	xorl	%edi, %edi
145520b8b:     	movb	$0x1, 0x5fe(%rbp)
145520b92:     	movq	%rdi, %rcx
145520b95:     	movq	%rbx, %rdx
145520b98:     	callq	0x14590379b <.text+0x590279b>
145520b9d:     	nop
145520b9e:     	jmp	0x145522c20 <.text+0x5521c20>
145520ba3:     	movq	%rbx, 0x610(%rbp)
145520baa:     	je	0x145520bea <.text+0x551fbea>
145520bac:     	callq	0x140002200 <.text+0x1200>
145520bb1:     	movl	$0x1, %edi
145520bb6:     	movl	$0x1, %edx
145520bbb:     	movq	0x610(%rbp), %rbx
145520bc2:     	movq	%rbx, %rcx
145520bc5:     	callq	0x1400021c0 <.text+0x11c0>
145520bca:     	movq	%rax, 0x618(%rbp)
145520bd1:     	testq	%rax, %rax
145520bd4:     	je	0x145520b8b <.text+0x551fb8b>
145520bd6:     	movq	0x618(%rbp), %rcx
145520bdd:     	movq	%rsi, %rdx
145520be0:     	movq	%rbx, %r8
145520be3:     	callq	0x1457731ed <.text+0x57721ed>
145520be8:     	jmp	0x145520bf6 <.text+0x551fbf6>
145520bea:     	movl	$0x1, %eax
145520bef:     	movq	%rax, 0x618(%rbp)
145520bf6:     	movb	$0x1, 0x5e3(%rbp)
145520bfd:     	leaq	0x1814786(%rip), %rdi   # 0x146d3538a
145520c04:     	movl	$0x34, %ebx
145520c09:     	movl	$0x34, %edx
145520c0e:     	movq	%rdi, %rcx
145520c11:     	callq	0x145457cb0 <.text+0x5456cb0>
145520c16:     	nop
145520c17:     	movq	%rdx, %rsi
145520c1a:     	testq	%rax, %rax
145520c1d:     	cmovneq	%rax, %rdi
145520c21:     	cmoveq	%rbx, %rsi
145520c25:     	testq	%rsi, %rsi
145520c28:     	jns	0x145520c45 <.text+0x551fc45>
145520c2a:     	xorl	%r14d, %r14d
145520c2d:     	movb	$0x1, 0x5e3(%rbp)
145520c34:     	movq	%r14, %rcx
145520c37:     	movq	%rsi, %rdx
145520c3a:     	callq	0x14590379b <.text+0x590279b>
145520c3f:     	nop
145520c40:     	jmp	0x145522c20 <.text+0x5521c20>
145520c45:     	je	0x145520c77 <.text+0x551fc77>
145520c47:     	callq	0x140002200 <.text+0x1200>
145520c4c:     	movl	$0x1, %r14d
145520c52:     	movl	$0x1, %edx
145520c57:     	movq	%rsi, %rcx
145520c5a:     	callq	0x1400021c0 <.text+0x11c0>
145520c5f:     	testq	%rax, %rax
145520c62:     	je	0x145520c2d <.text+0x551fc2d>
145520c64:     	movq	%rax, %rbx
145520c67:     	movq	%rax, %rcx
145520c6a:     	movq	%rdi, %rdx
145520c6d:     	movq	%rsi, %r8
145520c70:     	callq	0x1457731ed <.text+0x57721ed>
145520c75:     	jmp	0x145520c7c <.text+0x551fc7c>
145520c77:     	movl	$0x1, %ebx
145520c7c:     	movq	$0x8, 0x40(%rbp)
145520c84:     	movq	0x608(%rbp), %rax
145520c8b:     	movq	%rax, 0x48(%rbp)
145520c8f:     	movq	$0x8, 0x50(%rbp)
145520c97:     	movq	0x610(%rbp), %rax
145520c9e:     	movq	%rax, 0x58(%rbp)
145520ca2:     	movq	0x618(%rbp), %rcx
145520ca9:     	movq	%rcx, 0x60(%rbp)
145520cad:     	movq	%rax, 0x68(%rbp)
145520cb1:     	movq	%rsi, 0x70(%rbp)
145520cb5:     	movq	%rbx, 0x78(%rbp)
145520cb9:     	movq	%rsi, 0x80(%rbp)
145520cc0:     	movl	$0xa, 0xa8(%rbp)
145520cca:     	movb	$0x2, 0xac(%rbp)
145520cd1:     	leaq	0x18146e6(%rip), %rax   # 0x146d353be
145520cd8:     	movq	%rax, 0x98(%rbp)
145520cdf:     	movq	$0x13, 0xa0(%rbp)
145520cea:     	movb	$0x7, 0x88(%rbp)
145520cf1:     	movl	$0x32, 0x8c(%rbp)
145520cfb:     	movq	0x5c0(%rbp), %rsi
145520d02:     	cmpq	0x5b0(%rbp), %rsi
145520d09:     	jne	0x145520d18 <.text+0x551fd18>
145520d0b:     	leaq	0x5b0(%rbp), %rcx
145520d12:     	callq	0x145778530 <.text+0x5777530>
145520d17:     	nop
145520d18:     	movq	0x5b8(%rbp), %rax
145520d1f:     	imulq	$0x70, %rsi, %rcx
145520d23:     	movups	0xa0(%rbp), %xmm0
145520d2a:     	movups	%xmm0, 0x60(%rax,%rcx)
145520d2f:     	movups	0x90(%rbp), %xmm0
145520d36:     	movups	%xmm0, 0x50(%rax,%rcx)
145520d3b:     	movups	0x80(%rbp), %xmm0
145520d42:     	movups	%xmm0, 0x40(%rax,%rcx)
145520d47:     	movups	0x40(%rbp), %xmm0
145520d4b:     	movups	0x50(%rbp), %xmm1
145520d4f:     	movups	0x60(%rbp), %xmm2
145520d53:     	movups	0x70(%rbp), %xmm3
145520d57:     	movups	%xmm3, 0x30(%rax,%rcx)
145520d5c:     	movups	%xmm2, 0x20(%rax,%rcx)
145520d61:     	movups	%xmm1, 0x10(%rax,%rcx)
145520d66:     	movups	%xmm0, (%rax,%rcx)
145520d6a:     	incq	%rsi
145520d6d:     	movq	%rsi, 0x5c0(%rbp)
145520d74:     	callq	0x140002200 <.text+0x1200>
145520d79:     	movl	$0x9, %ecx
145520d7e:     	movl	$0x1, %edx
145520d83:     	callq	0x1400021c0 <.text+0x11c0>
145520d88:     	movq	%rax, 0x608(%rbp)
145520d8f:     	testq	%rax, %rax
145520d92:     	je	0x145522c10 <.text+0x5521c10>
145520d98:     	movabsq	$0x30313a7865646f63, %rax # imm = 0x30313A7865646F63
145520da2:     	movq	0x608(%rbp), %rcx
145520da9:     	movq	%rax, (%rcx)
145520dac:     	movb	$0x30, 0x8(%rcx)
145520db0:     	movb	$0x1, 0x5fd(%rbp)
145520db7:     	leaq	0x1814613(%rip), %rsi   # 0x146d353d1
145520dbe:     	movl	$0xc, %edi
145520dc3:     	movl	$0xc, %edx
145520dc8:     	movq	%rsi, %rcx
145520dcb:     	callq	0x145457cb0 <.text+0x5456cb0>
145520dd0:     	nop
145520dd1:     	testq	%rax, %rax
145520dd4:     	cmovneq	%rax, %rsi
145520dd8:     	cmoveq	%rdi, %rdx
145520ddc:     	movq	%rdx, 0x610(%rbp)
145520de3:     	testq	%rdx, %rdx
145520de6:     	jns	0x145520e06 <.text+0x551fe06>
145520de8:     	xorl	%edi, %edi
145520dea:     	movb	$0x1, 0x5fd(%rbp)
145520df1:     	movq	%rdi, %rcx
145520df4:     	movq	0x610(%rbp), %rdx
145520dfb:     	callq	0x14590379b <.text+0x590279b>
145520e00:     	nop
145520e01:     	jmp	0x145522c20 <.text+0x5521c20>
145520e06:     	je	0x145520e47 <.text+0x551fe47>
145520e08:     	callq	0x140002200 <.text+0x1200>
145520e0d:     	movl	$0x1, %edi
145520e12:     	movl	$0x1, %edx
145520e17:     	movq	0x610(%rbp), %rcx
145520e1e:     	callq	0x1400021c0 <.text+0x11c0>
145520e23:     	movq	%rax, 0x618(%rbp)
145520e2a:     	testq	%rax, %rax
145520e2d:     	je	0x145520dea <.text+0x551fdea>
145520e2f:     	movq	0x618(%rbp), %rcx
145520e36:     	movq	%rsi, %rdx
145520e39:     	movq	0x610(%rbp), %r8
145520e40:     	callq	0x1457731ed <.text+0x57721ed>
145520e45:     	jmp	0x145520e53 <.text+0x551fe53>
145520e47:     	movl	$0x1, %eax
145520e4c:     	movq	%rax, 0x618(%rbp)
145520e53:     	movb	$0x1, 0x5e2(%rbp)
145520e5a:     	leaq	0x181457c(%rip), %rdi   # 0x146d353dd
145520e61:     	movl	$0x30, %ebx
145520e66:     	movl	$0x30, %edx
145520e6b:     	movq	%rdi, %rcx
145520e6e:     	callq	0x145457cb0 <.text+0x5456cb0>
145520e73:     	nop
145520e74:     	movq	%rdx, %rsi
145520e77:     	testq	%rax, %rax
145520e7a:     	cmovneq	%rax, %rdi
145520e7e:     	cmoveq	%rbx, %rsi
145520e82:     	testq	%rsi, %rsi
145520e85:     	jns	0x145520ea2 <.text+0x551fea2>
145520e87:     	xorl	%r14d, %r14d
145520e8a:     	movb	$0x1, 0x5e2(%rbp)
145520e91:     	movq	%r14, %rcx
145520e94:     	movq	%rsi, %rdx
145520e97:     	callq	0x14590379b <.text+0x590279b>
145520e9c:     	nop
145520e9d:     	jmp	0x145522c20 <.text+0x5521c20>
145520ea2:     	je	0x145520ed4 <.text+0x551fed4>
145520ea4:     	callq	0x140002200 <.text+0x1200>
145520ea9:     	movl	$0x1, %r14d
145520eaf:     	movl	$0x1, %edx
145520eb4:     	movq	%rsi, %rcx
145520eb7:     	callq	0x1400021c0 <.text+0x11c0>
145520ebc:     	testq	%rax, %rax
145520ebf:     	je	0x145520e8a <.text+0x551fe8a>
145520ec1:     	movq	%rax, %rbx
145520ec4:     	movq	%rax, %rcx
145520ec7:     	movq	%rdi, %rdx
145520eca:     	movq	%rsi, %r8
145520ecd:     	callq	0x1457731ed <.text+0x57721ed>
145520ed2:     	jmp	0x145520ed9 <.text+0x551fed9>
145520ed4:     	movl	$0x1, %ebx
145520ed9:     	movq	$0x9, 0x40(%rbp)
145520ee1:     	movq	0x608(%rbp), %rax
145520ee8:     	movq	%rax, 0x48(%rbp)
145520eec:     	movq	$0x9, 0x50(%rbp)
145520ef4:     	movq	0x610(%rbp), %rax
145520efb:     	movq	%rax, 0x58(%rbp)
145520eff:     	movq	0x618(%rbp), %rcx
145520f06:     	movq	%rcx, 0x60(%rbp)
145520f0a:     	movq	%rax, 0x68(%rbp)
145520f0e:     	movq	%rsi, 0x70(%rbp)
145520f12:     	movq	%rbx, 0x78(%rbp)
145520f16:     	movq	%rsi, 0x80(%rbp)
145520f1d:     	movl	$0x19, 0xa8(%rbp)
145520f27:     	movb	$0x2, 0xac(%rbp)
145520f2e:     	leaq	0x18144d8(%rip), %rax   # 0x146d3540d
145520f35:     	movq	%rax, 0x98(%rbp)
145520f3c:     	movq	$0x20, 0xa0(%rbp)
145520f47:     	movb	$0x7, 0x88(%rbp)
145520f4e:     	movl	$0x64, 0x8c(%rbp)
145520f58:     	movq	0x5c0(%rbp), %rsi
145520f5f:     	cmpq	0x5b0(%rbp), %rsi
145520f66:     	jne	0x145520f75 <.text+0x551ff75>
145520f68:     	leaq	0x5b0(%rbp), %rcx
145520f6f:     	callq	0x145778530 <.text+0x5777530>
145520f74:     	nop
145520f75:     	movq	0x5b8(%rbp), %rax
145520f7c:     	imulq	$0x70, %rsi, %rcx
145520f80:     	movups	0xa0(%rbp), %xmm0
145520f87:     	movups	%xmm0, 0x60(%rax,%rcx)
145520f8c:     	movups	0x90(%rbp), %xmm0
145520f93:     	movups	%xmm0, 0x50(%rax,%rcx)
145520f98:     	movups	0x80(%rbp), %xmm0
145520f9f:     	movups	%xmm0, 0x40(%rax,%rcx)
145520fa4:     	movups	0x40(%rbp), %xmm0
145520fa8:     	movups	0x50(%rbp), %xmm1
145520fac:     	movups	0x60(%rbp), %xmm2
145520fb0:     	movups	0x70(%rbp), %xmm3
145520fb4:     	movups	%xmm3, 0x30(%rax,%rcx)
145520fb9:     	movups	%xmm2, 0x20(%rax,%rcx)
145520fbe:     	movups	%xmm1, 0x10(%rax,%rcx)
145520fc3:     	movups	%xmm0, (%rax,%rcx)
145520fc7:     	incq	%rsi
145520fca:     	movq	%rsi, 0x5c0(%rbp)
145520fd1:     	leaq	0x1814455(%rip), %rcx   # 0x146d3542d
145520fd8:     	movl	$0xe, %esi
145520fdd:     	movl	$0xe, %edx
145520fe2:     	movq	%rcx, 0x608(%rbp)
145520fe9:     	callq	0x145457cb0 <.text+0x5456cb0>
145520fee:     	movq	%rdx, 0x610(%rbp)
145520ff5:     	testq	%rax, %rax
145520ff8:     	movq	0x608(%rbp), %rcx
145520fff:     	cmovneq	%rax, %rcx
145521003:     	movq	%rcx, 0x608(%rbp)
14552100a:     	movq	0x610(%rbp), %rax
145521011:     	cmoveq	%rsi, %rax
145521015:     	movq	%rax, 0x610(%rbp)
14552101c:     	leaq	0x1814418(%rip), %rcx   # 0x146d3543b
145521023:     	movl	$0x1e, %esi
145521028:     	movl	$0x1e, %edx
14552102d:     	movq	%rcx, 0x618(%rbp)
145521034:     	callq	0x145457cb0 <.text+0x5456cb0>
145521039:     	movq	%rdx, 0x5e8(%rbp)
145521040:     	testq	%rax, %rax
145521043:     	movq	0x618(%rbp), %rcx
14552104a:     	cmovneq	%rax, %rcx
14552104e:     	movq	%rcx, 0x618(%rbp)
145521055:     	movq	0x5e8(%rbp), %rax
14552105c:     	cmoveq	%rsi, %rax
145521060:     	movq	%rax, 0x5e8(%rbp)
145521067:     	leaq	0x181440a(%rip), %rcx   # 0x146d35478
14552106e:     	movl	$0x7, %esi
145521073:     	movl	$0x7, %edx
145521078:     	movq	%rcx, 0x5d0(%rbp)
14552107f:     	callq	0x145457cb0 <.text+0x5456cb0>
145521084:     	movq	%rdx, 0x5f0(%rbp)
14552108b:     	testq	%rax, %rax
14552108e:     	movq	0x5d0(%rbp), %rcx
145521095:     	cmovneq	%rax, %rcx
145521099:     	movq	%rcx, 0x5d0(%rbp)
1455210a0:     	movq	0x5f0(%rbp), %rax
1455210a7:     	cmoveq	%rsi, %rax
1455210ab:     	movq	%rax, 0x5f0(%rbp)
1455210b2:     	leaq	0x18143c6(%rip), %rcx   # 0x146d3547f
1455210b9:     	movl	$0x1e, %esi
1455210be:     	movl	$0x1e, %edx
1455210c3:     	movq	%rcx, 0x598(%rbp)
1455210ca:     	callq	0x145457cb0 <.text+0x5456cb0>
1455210cf:     	movq	%rdx, 0x5a0(%rbp)
1455210d6:     	testq	%rax, %rax
1455210d9:     	movq	0x598(%rbp), %rcx
1455210e0:     	cmovneq	%rax, %rcx
1455210e4:     	movq	%rcx, 0x598(%rbp)
1455210eb:     	movq	0x5a0(%rbp), %rax
1455210f2:     	cmoveq	%rsi, %rax
1455210f6:     	movq	%rax, 0x5a0(%rbp)
1455210fd:     	leaq	0x18143bf(%rip), %rcx   # 0x146d354c3
145521104:     	movl	$0xc, %esi
145521109:     	movl	$0xc, %edx
14552110e:     	movq	%rcx, 0x588(%rbp)
145521115:     	callq	0x145457cb0 <.text+0x5456cb0>
14552111a:     	movq	%rdx, 0x5c8(%rbp)
145521121:     	testq	%rax, %rax
145521124:     	movq	0x588(%rbp), %rcx
14552112b:     	cmovneq	%rax, %rcx
14552112f:     	movq	%rcx, 0x588(%rbp)
145521136:     	movq	0x5c8(%rbp), %rax
14552113d:     	cmoveq	%rsi, %rax
145521141:     	movq	%rax, 0x5c8(%rbp)
145521148:     	leaq	0x1814380(%rip), %rcx   # 0x146d354cf
14552114f:     	movl	$0x2b, %esi
145521154:     	movl	$0x2b, %edx
145521159:     	movq	%rcx, 0x590(%rbp)
145521160:     	callq	0x145457cb0 <.text+0x5456cb0>
145521165:     	movq	%rdx, 0x4f8(%rbp)
14552116c:     	testq	%rax, %rax
14552116f:     	movq	0x590(%rbp), %rcx
145521176:     	cmovneq	%rax, %rcx
14552117a:     	movq	%rcx, 0x590(%rbp)
145521181:     	movq	0x4f8(%rbp), %rax
145521188:     	cmoveq	%rsi, %rax
14552118c:     	movq	%rax, 0x4f8(%rbp)
145521193:     	leaq	0x1814381(%rip), %rcx   # 0x146d3551b
14552119a:     	movl	$0x8, %esi
14552119f:     	movl	$0x8, %edx
1455211a4:     	movq	%rcx, 0x500(%rbp)
1455211ab:     	callq	0x145457cb0 <.text+0x5456cb0>
1455211b0:     	movq	%rdx, 0x508(%rbp)
1455211b7:     	testq	%rax, %rax
1455211ba:     	movq	0x500(%rbp), %rcx
1455211c1:     	cmovneq	%rax, %rcx
1455211c5:     	movq	%rcx, 0x500(%rbp)
1455211cc:     	movq	0x508(%rbp), %rax
1455211d3:     	cmoveq	%rsi, %rax
1455211d7:     	movq	%rax, 0x508(%rbp)
1455211de:     	leaq	0x181433e(%rip), %rcx   # 0x146d35523
1455211e5:     	movl	$0x21, %esi
1455211ea:     	movl	$0x21, %edx
1455211ef:     	movq	%rcx, 0x510(%rbp)
1455211f6:     	callq	0x145457cb0 <.text+0x5456cb0>
1455211fb:     	movq	%rdx, 0x488(%rbp)
145521202:     	testq	%rax, %rax
145521205:     	movq	0x510(%rbp), %rcx
14552120c:     	cmovneq	%rax, %rcx
145521210:     	movq	%rcx, 0x510(%rbp)
145521217:     	movq	0x488(%rbp), %rax
14552121e:     	cmoveq	%rsi, %rax
145521222:     	movq	%rax, 0x488(%rbp)
145521229:     	leaq	0x1814339(%rip), %rcx   # 0x146d35569
145521230:     	movl	$0x8, %esi
145521235:     	movl	$0x8, %edx
14552123a:     	movq	%rcx, 0x490(%rbp)
145521241:     	callq	0x145457cb0 <.text+0x5456cb0>
145521246:     	movq	%rdx, 0x498(%rbp)
14552124d:     	testq	%rax, %rax
145521250:     	movq	0x490(%rbp), %rcx
145521257:     	cmovneq	%rax, %rcx
14552125b:     	movq	%rcx, 0x490(%rbp)
145521262:     	movq	0x498(%rbp), %rax
145521269:     	cmoveq	%rsi, %rax
14552126d:     	movq	%rax, 0x498(%rbp)
145521274:     	leaq	0x18142f6(%rip), %rcx   # 0x146d35571
14552127b:     	movl	$0x21, %esi
145521280:     	movl	$0x21, %edx
145521285:     	movq	%rcx, 0x4a0(%rbp)
14552128c:     	callq	0x145457cb0 <.text+0x5456cb0>
145521291:     	movq	%rdx, 0x4a8(%rbp)
145521298:     	testq	%rax, %rax
14552129b:     	movq	0x4a0(%rbp), %rcx
1455212a2:     	cmovneq	%rax, %rcx
1455212a6:     	movq	%rcx, 0x4a0(%rbp)
1455212ad:     	movq	0x4a8(%rbp), %rax
1455212b4:     	cmoveq	%rsi, %rax
1455212b8:     	movq	%rax, 0x4a8(%rbp)
1455212bf:     	leaq	0x18142f1(%rip), %rcx   # 0x146d355b7
1455212c6:     	movl	$0xe, %esi
1455212cb:     	movl	$0xe, %edx
1455212d0:     	movq	%rcx, 0x4b0(%rbp)
1455212d7:     	callq	0x145457cb0 <.text+0x5456cb0>
1455212dc:     	movq	%rdx, 0x4b8(%rbp)
1455212e3:     	testq	%rax, %rax
1455212e6:     	movq	0x4b0(%rbp), %rcx
1455212ed:     	cmovneq	%rax, %rcx
1455212f1:     	movq	%rcx, 0x4b0(%rbp)
1455212f8:     	movq	0x4b8(%rbp), %rax
1455212ff:     	cmoveq	%rsi, %rax
145521303:     	movq	%rax, 0x4b8(%rbp)
14552130a:     	leaq	0x18142b4(%rip), %rcx   # 0x146d355c5
145521311:     	movl	$0x21, %esi
145521316:     	movl	$0x21, %edx
14552131b:     	movq	%rcx, 0x4c0(%rbp)
145521322:     	callq	0x145457cb0 <.text+0x5456cb0>
145521327:     	movq	%rdx, 0x4c8(%rbp)
14552132e:     	testq	%rax, %rax
145521331:     	movq	0x4c0(%rbp), %rcx
145521338:     	cmovneq	%rax, %rcx
14552133c:     	movq	%rcx, 0x4c0(%rbp)
145521343:     	movq	0x4c8(%rbp), %rax
14552134a:     	cmoveq	%rsi, %rax
14552134e:     	movq	%rax, 0x4c8(%rbp)
145521355:     	leaq	0x18142ad(%rip), %rcx   # 0x146d35609
14552135c:     	movl	$0xd, %esi
145521361:     	movl	$0xd, %edx
145521366:     	movq	%rcx, 0x4d0(%rbp)
14552136d:     	callq	0x145457cb0 <.text+0x5456cb0>
145521372:     	movq	%rdx, 0x4d8(%rbp)
145521379:     	testq	%rax, %rax
14552137c:     	movq	0x4d0(%rbp), %rcx
145521383:     	cmovneq	%rax, %rcx
145521387:     	movq	%rcx, 0x4d0(%rbp)
14552138e:     	movq	0x4d8(%rbp), %rax
145521395:     	cmoveq	%rsi, %rax
145521399:     	movq	%rax, 0x4d8(%rbp)
1455213a0:     	leaq	0x181426f(%rip), %rbx   # 0x146d35616
1455213a7:     	movl	$0x1a, %esi
1455213ac:     	movl	$0x1a, %edx
1455213b1:     	movq	%rbx, %rcx
1455213b4:     	callq	0x145457cb0 <.text+0x5456cb0>
1455213b9:     	movq	%rdx, 0x4e0(%rbp)
1455213c0:     	testq	%rax, %rax
1455213c3:     	cmovneq	%rax, %rbx
1455213c7:     	movq	0x4e0(%rbp), %rax
1455213ce:     	cmoveq	%rsi, %rax
1455213d2:     	movq	%rax, 0x4e0(%rbp)
1455213d9:     	leaq	0x181426b(%rip), %r12   # 0x146d3564b
1455213e0:     	movl	$0x7, %esi
1455213e5:     	movl	$0x7, %edx
1455213ea:     	movq	%r12, %rcx
1455213ed:     	callq	0x145457cb0 <.text+0x5456cb0>
1455213f2:     	movq	%rdx, 0x4e8(%rbp)
1455213f9:     	testq	%rax, %rax
1455213fc:     	cmovneq	%rax, %r12
145521400:     	movq	0x4e8(%rbp), %rax
145521407:     	cmoveq	%rsi, %rax
14552140b:     	movq	%rax, 0x4e8(%rbp)
145521412:     	leaq	0x1814239(%rip), %r14   # 0x146d35652
145521419:     	movl	$0x21, %esi
14552141e:     	movl	$0x21, %edx
145521423:     	movq	%r14, %rcx
145521426:     	callq	0x145457cb0 <.text+0x5456cb0>
14552142b:     	movq	%rdx, 0x4f0(%rbp)
145521432:     	testq	%rax, %rax
145521435:     	cmovneq	%rax, %r14
145521439:     	movq	0x4f0(%rbp), %rax
145521440:     	cmoveq	%rsi, %rax
145521444:     	movq	%rax, 0x4f0(%rbp)
14552144b:     	leaq	0x1814237(%rip), %r13   # 0x146d35689
145521452:     	movl	$0x10, %edx
145521457:     	movq	%r13, %rcx
14552145a:     	callq	0x145457cb0 <.text+0x5456cb0>
14552145f:     	nop
145521460:     	movq	%rax, %r15
145521463:     	movq	%rdx, %rdi
145521466:     	leaq	0x181422c(%rip), %rsi   # 0x146d35699
14552146d:     	movl	$0x34, %edx
145521472:     	movq	%rsi, %rcx
145521475:     	callq	0x145457cb0 <.text+0x5456cb0>
14552147a:     	nop
14552147b:     	testq	%r15, %r15
14552147e:     	movl	$0x10, %ecx
145521483:     	cmoveq	%rcx, %rdi
145521487:     	cmovneq	%r15, %r13
14552148b:     	testq	%rax, %rax
14552148e:     	cmovneq	%rax, %rsi
145521492:     	movl	$0x34, %eax
145521497:     	cmoveq	%rax, %rdx
14552149b:     	movq	$0x0, 0x40(%rbp)
1455214a3:     	movq	$0x9, 0x48(%rbp)
1455214ab:     	leaq	0x1813fa7(%rip), %rax   # 0x146d35459
1455214b2:     	movq	%rax, 0x50(%rbp)
1455214b6:     	movq	$0xe, 0x58(%rbp)
1455214be:     	movq	0x608(%rbp), %rax
1455214c5:     	movq	%rax, 0x60(%rbp)
1455214c9:     	movq	0x610(%rbp), %rax
1455214d0:     	movq	%rax, 0x68(%rbp)
1455214d4:     	movq	0x618(%rbp), %rax
1455214db:     	movq	%rax, 0x70(%rbp)
1455214df:     	movq	0x5e8(%rbp), %rax
1455214e6:     	movq	%rax, 0x78(%rbp)
1455214ea:     	leaq	0x1813f76(%rip), %rax   # 0x146d35467
1455214f1:     	movq	%rax, 0x80(%rbp)
1455214f8:     	movq	$0x11, 0x88(%rbp)
145521503:     	movq	$0xa, 0x90(%rbp)
14552150e:     	movl	$0x9c4, 0x98(%rbp)      # imm = 0x9C4
145521518:     	leaq	0x1813f7e(%rip), %rax   # 0x146d3549d
14552151f:     	movq	%rax, 0xa0(%rbp)
145521526:     	movq	$0xe, 0xa8(%rbp)
145521531:     	movq	0x5d0(%rbp), %rax
145521538:     	movq	%rax, 0xb0(%rbp)
14552153f:     	movq	0x5f0(%rbp), %rax
145521546:     	movq	%rax, 0xb8(%rbp)
14552154d:     	movq	0x598(%rbp), %rax
145521554:     	movq	%rax, 0xc0(%rbp)
14552155b:     	movq	0x5a0(%rbp), %rax
145521562:     	movq	%rax, 0xc8(%rbp)
145521569:     	leaq	0x1813f3b(%rip), %rax   # 0x146d354ab
145521570:     	movq	%rax, 0xd0(%rbp)
145521577:     	movq	$0x18, 0xd8(%rbp)
145521582:     	movq	$0x19, 0xe0(%rbp)
14552158d:     	movl	$0x1770, 0xe8(%rbp)     # imm = 0x1770
145521597:     	leaq	0x1813f5c(%rip), %rax   # 0x146d354fa
14552159e:     	movq	%rax, 0xf0(%rbp)
1455215a5:     	movq	$0xa, 0xf8(%rbp)
1455215b0:     	movq	0x588(%rbp), %rax
1455215b7:     	movq	%rax, 0x100(%rbp)
1455215be:     	movq	0x5c8(%rbp), %rax
1455215c5:     	movq	%rax, 0x108(%rbp)
1455215cc:     	movq	0x590(%rbp), %rax
1455215d3:     	movq	%rax, 0x110(%rbp)
1455215da:     	movq	0x4f8(%rbp), %rax
1455215e1:     	movq	%rax, 0x118(%rbp)
1455215e8:     	leaq	0x1813f15(%rip), %rax   # 0x146d35504
1455215ef:     	movq	%rax, 0x120(%rbp)
1455215f6:     	movq	$0x17, 0x128(%rbp)
145521601:     	movabsq	$0x100000019, %rax      # imm = 0x100000019
14552160b:     	movq	%rax, 0x130(%rbp)
145521612:     	leaq	0x1813f2b(%rip), %rax   # 0x146d35544
145521619:     	movq	%rax, 0x140(%rbp)
145521620:     	movq	$0xe, 0x148(%rbp)
14552162b:     	movq	0x500(%rbp), %rax
145521632:     	movq	%rax, 0x150(%rbp)
145521639:     	movq	0x508(%rbp), %rax
145521640:     	movq	%rax, 0x158(%rbp)
145521647:     	movq	0x510(%rbp), %rax
14552164e:     	movq	%rax, 0x160(%rbp)
145521655:     	movq	0x488(%rbp), %rax
14552165c:     	movq	%rax, 0x168(%rbp)
145521663:     	leaq	0x1813ee8(%rip), %rax   # 0x146d35552
14552166a:     	movq	%rax, 0x170(%rbp)
145521671:     	movq	$0x17, 0x178(%rbp)
14552167c:     	movabsq	$0x20000000a, %rax      # imm = 0x20000000A
145521686:     	movq	%rax, 0x180(%rbp)
14552168d:     	movl	$0x5dc, 0x188(%rbp)     # imm = 0x5DC
145521697:     	leaq	0x1813ef4(%rip), %rax   # 0x146d35592
14552169e:     	movq	%rax, 0x190(%rbp)
1455216a5:     	movq	$0xe, 0x198(%rbp)
1455216b0:     	movq	0x490(%rbp), %rax
1455216b7:     	movq	%rax, 0x1a0(%rbp)
1455216be:     	movq	0x498(%rbp), %rax
1455216c5:     	movq	%rax, 0x1a8(%rbp)
1455216cc:     	movq	0x4a0(%rbp), %rax
1455216d3:     	movq	%rax, 0x1b0(%rbp)
1455216da:     	movq	0x4a8(%rbp), %rax
1455216e1:     	movq	%rax, 0x1b8(%rbp)
1455216e8:     	leaq	0x1813eb1(%rip), %rax   # 0x146d355a0
1455216ef:     	movq	%rax, 0x1c0(%rbp)
1455216f6:     	movq	$0x17, 0x1c8(%rbp)
145521701:     	movabsq	$0x200000019, %rax      # imm = 0x200000019
14552170b:     	movq	%rax, 0x1d0(%rbp)
145521712:     	movl	$0x708, 0x1d8(%rbp)     # imm = 0x708
14552171c:     	leaq	0x1813ec3(%rip), %rax   # 0x146d355e6
145521723:     	movq	%rax, 0x1e0(%rbp)
14552172a:     	movq	$0xe, 0x1e8(%rbp)
145521735:     	movq	0x4b0(%rbp), %rax
14552173c:     	movq	%rax, 0x1f0(%rbp)
145521743:     	movq	0x4b8(%rbp), %rax
14552174a:     	movq	%rax, 0x1f8(%rbp)
145521751:     	movq	0x4c0(%rbp), %rax
145521758:     	movq	%rax, 0x200(%rbp)
14552175f:     	movq	0x4c8(%rbp), %rax
145521766:     	movq	%rax, 0x208(%rbp)
14552176d:     	leaq	0x1813e80(%rip), %rax   # 0x146d355f4
145521774:     	movq	%rax, 0x210(%rbp)
14552177b:     	movq	$0x15, 0x218(%rbp)
145521786:     	movabsq	$0x200000032, %rax      # imm = 0x200000032
145521790:     	movq	%rax, 0x220(%rbp)
145521797:     	movl	$0x960, 0x228(%rbp)     # imm = 0x960
1455217a1:     	leaq	0x1813e88(%rip), %rax   # 0x146d35630
1455217a8:     	movq	%rax, 0x230(%rbp)
1455217af:     	movq	$0x9, 0x238(%rbp)
1455217ba:     	movq	0x4d0(%rbp), %rax
1455217c1:     	movq	%rax, 0x240(%rbp)
1455217c8:     	movq	0x4d8(%rbp), %rax
1455217cf:     	movq	%rax, 0x248(%rbp)
1455217d6:     	movq	%rbx, 0x250(%rbp)
1455217dd:     	movq	0x4e0(%rbp), %rax
1455217e4:     	movq	%rax, 0x258(%rbp)
1455217eb:     	leaq	0x1813e47(%rip), %rax   # 0x146d35639
1455217f2:     	movq	%rax, 0x260(%rbp)
1455217f9:     	movq	$0x12, 0x268(%rbp)
145521804:     	movabsq	$0x300000019, %rax      # imm = 0x300000019
14552180e:     	movq	%rax, 0x270(%rbp)
145521815:     	leaq	0x1813e57(%rip), %rax   # 0x146d35673
14552181c:     	movq	%rax, 0x280(%rbp)
145521823:     	movq	$0xc, 0x288(%rbp)
14552182e:     	movq	%r12, 0x290(%rbp)
145521835:     	movq	0x4e8(%rbp), %rax
14552183c:     	movq	%rax, 0x298(%rbp)
145521843:     	movq	%r14, 0x2a0(%rbp)
14552184a:     	leaq	0x94(%rbp), %r14
145521851:     	movq	0x4f0(%rbp), %rax
145521858:     	movq	%rax, 0x2a8(%rbp)
14552185f:     	leaq	0x1813e19(%rip), %rax   # 0x146d3567f
145521866:     	movq	%rax, 0x2b0(%rbp)
14552186d:     	movq	$0xa, 0x2b8(%rbp)
145521878:     	movabsq	$0x400000019, %rax      # imm = 0x400000019
145521882:     	movq	%rax, 0x2c0(%rbp)
145521889:     	leaq	0x1813e3d(%rip), %rax   # 0x146d356cd
145521890:     	movq	%rax, 0x2d0(%rbp)
145521897:     	movq	$0x9, 0x2d8(%rbp)
1455218a2:     	movq	%r13, 0x2e0(%rbp)
1455218a9:     	movq	%rdi, 0x2e8(%rbp)
1455218b0:     	movq	%rsi, 0x2f0(%rbp)
1455218b7:     	movq	%rdx, 0x2f8(%rbp)
1455218be:     	leaq	0x1813e11(%rip), %rax   # 0x146d356d6
1455218c5:     	movq	%rax, 0x300(%rbp)
1455218cc:     	movq	$0x1d, 0x308(%rbp)
1455218d7:     	movabsq	$0x500000032, %rax      # imm = 0x500000032
1455218e1:     	movq	%rax, 0x310(%rbp)
1455218e8:     	movl	$0x1, %edi
1455218ed:     	movq	%rdi, 0x40(%rbp)
1455218f1:     	cmpl	$-0x1, (%r14)
1455218f5:     	je	0x145521b89 <.text+0x5520b89>
1455218fb:     	movq	-0x3c(%r14), %rax
1455218ff:     	movq	%rax, 0x608(%rbp)
145521906:     	testq	%rax, %rax
145521909:     	js	0x145522aae <.text+0x5521aae>
14552190f:     	movq	-0x34(%r14), %r15
145521913:     	movq	-0x2c(%r14), %rax
145521917:     	movq	%rax, 0x618(%rbp)
14552191e:     	movq	-0x24(%r14), %rsi
145521922:     	movq	-0x1c(%r14), %rbx
145521926:     	movq	-0x14(%r14), %rax
14552192a:     	movq	%rax, 0x5d0(%rbp)
145521931:     	movq	-0xc(%r14), %rax
145521935:     	movq	%rax, 0x5f0(%rbp)
14552193c:     	movl	-0x4(%r14), %eax
145521940:     	movl	%eax, 0x598(%rbp)
145521946:     	movsd	(%r14), %xmm6
14552194b:     	je	0x145521995 <.text+0x5520995>
14552194d:     	movq	-0x44(%r14), %r13
145521951:     	callq	0x140002200 <.text+0x1200>
145521956:     	movl	$0x1, %r12d
14552195c:     	movl	$0x1, %edx
145521961:     	movq	0x608(%rbp), %rcx
145521968:     	callq	0x1400021c0 <.text+0x11c0>
14552196d:     	movq	%rax, 0x610(%rbp)
145521974:     	testq	%rax, %rax
145521977:     	je	0x145522c22 <.text+0x5521c22>
14552197d:     	movq	0x610(%rbp), %rcx
145521984:     	movq	%r13, %rdx
145521987:     	movq	0x608(%rbp), %r8
14552198e:     	callq	0x1457731ed <.text+0x57721ed>
145521993:     	jmp	0x1455219a1 <.text+0x55209a1>
145521995:     	movl	$0x1, %eax
14552199a:     	movq	%rax, 0x610(%rbp)
1455219a1:     	cmpq	$0x0, 0x618(%rbp)
1455219a9:     	js	0x145522ac6 <.text+0x5521ac6>
1455219af:     	je	0x1455219f5 <.text+0x55209f5>
1455219b1:     	callq	0x140002200 <.text+0x1200>
1455219b6:     	movl	$0x1, %r12d
1455219bc:     	movl	$0x1, %edx
1455219c1:     	movq	0x618(%rbp), %rcx
1455219c8:     	callq	0x1400021c0 <.text+0x11c0>
1455219cd:     	movq	%rax, 0x5e8(%rbp)
1455219d4:     	testq	%rax, %rax
1455219d7:     	je	0x145522c35 <.text+0x5521c35>
1455219dd:     	movq	0x5e8(%rbp), %rcx
1455219e4:     	movq	%r15, %rdx
1455219e7:     	movq	0x618(%rbp), %r8
1455219ee:     	callq	0x1457731ed <.text+0x57721ed>
1455219f3:     	jmp	0x145521a01 <.text+0x5520a01>
1455219f5:     	movl	$0x1, %eax
1455219fa:     	movq	%rax, 0x5e8(%rbp)
145521a01:     	testq	%rbx, %rbx
145521a04:     	js	0x145522b06 <.text+0x5521b06>
145521a0a:     	je	0x145521a48 <.text+0x5520a48>
145521a0c:     	callq	0x140002200 <.text+0x1200>
145521a11:     	movl	$0x1, %r15d
145521a17:     	movl	$0x1, %edx
145521a1c:     	movq	%rbx, %rcx
145521a1f:     	callq	0x1400021c0 <.text+0x11c0>
145521a24:     	movq	%rax, 0x5a0(%rbp)
145521a2b:     	testq	%rax, %rax
145521a2e:     	je	0x145522c48 <.text+0x5521c48>
145521a34:     	movq	0x5a0(%rbp), %rcx
145521a3b:     	movq	%rsi, %rdx
145521a3e:     	movq	%rbx, %r8
145521a41:     	callq	0x1457731ed <.text+0x57721ed>
145521a46:     	jmp	0x145521a54 <.text+0x5520a54>
145521a48:     	movl	$0x1, %eax
145521a4d:     	movq	%rax, 0x5a0(%rbp)
145521a54:     	movq	0x608(%rbp), %rcx
145521a5b:     	movq	%rcx, 0x518(%rbp)
145521a62:     	movq	0x610(%rbp), %rax
145521a69:     	movq	%rax, 0x520(%rbp)
145521a70:     	movq	%rcx, 0x528(%rbp)
145521a77:     	movq	0x618(%rbp), %rcx
145521a7e:     	movq	%rcx, 0x530(%rbp)
145521a85:     	movq	0x5e8(%rbp), %rax
145521a8c:     	movq	%rax, 0x538(%rbp)
145521a93:     	movq	%rcx, 0x540(%rbp)
145521a9a:     	movq	%rbx, 0x548(%rbp)
145521aa1:     	movq	0x5a0(%rbp), %rax
145521aa8:     	movq	%rax, 0x550(%rbp)
145521aaf:     	movq	%rbx, 0x558(%rbp)
145521ab6:     	movl	0x598(%rbp), %eax
145521abc:     	movl	%eax, 0x580(%rbp)
145521ac2:     	movb	$0x3, 0x584(%rbp)
145521ac9:     	movq	0x5d0(%rbp), %rax
145521ad0:     	movq	%rax, 0x570(%rbp)
145521ad7:     	movq	0x5f0(%rbp), %rax
145521ade:     	movq	%rax, 0x578(%rbp)
145521ae5:     	movb	$0x9, 0x560(%rbp)
145521aec:     	movlps	%xmm6, 0x564(%rbp)
145521af3:     	movq	0x5c0(%rbp), %rsi
145521afa:     	cmpq	0x5b0(%rbp), %rsi
145521b01:     	jne	0x145521b10 <.text+0x5520b10>
145521b03:     	leaq	0x5b0(%rbp), %rcx
145521b0a:     	callq	0x145778530 <.text+0x5777530>
145521b0f:     	nop
145521b10:     	movq	0x5b8(%rbp), %rax
145521b17:     	imulq	$0x70, %rsi, %rcx
145521b1b:     	movups	0x578(%rbp), %xmm0
145521b22:     	movups	%xmm0, 0x60(%rax,%rcx)
145521b27:     	movups	0x568(%rbp), %xmm0
145521b2e:     	movups	%xmm0, 0x50(%rax,%rcx)
145521b33:     	movups	0x558(%rbp), %xmm0
145521b3a:     	movups	%xmm0, 0x40(%rax,%rcx)
145521b3f:     	movups	0x518(%rbp), %xmm0
145521b46:     	movups	0x528(%rbp), %xmm1
145521b4d:     	movups	0x538(%rbp), %xmm2
145521b54:     	movups	0x548(%rbp), %xmm3
145521b5b:     	movups	%xmm3, 0x30(%rax,%rcx)
145521b60:     	movups	%xmm2, 0x20(%rax,%rcx)
145521b65:     	movups	%xmm1, 0x10(%rax,%rcx)
145521b6a:     	movups	%xmm0, (%rax,%rcx)
145521b6e:     	incq	%rsi
145521b71:     	movq	%rsi, 0x5c0(%rbp)
145521b78:     	incq	%rdi
145521b7b:     	addq	$0x50, %r14
145521b7f:     	cmpq	$0xa, %rdi
145521b83:     	jne	0x1455218ed <.text+0x55208ed>
145521b89:     	leaq	0x1813b63(%rip), %rcx   # 0x146d356f3
145521b90:     	movl	$0xc, %esi
145521b95:     	movl	$0xc, %edx
145521b9a:     	movq	%rcx, 0x608(%rbp)
145521ba1:     	callq	0x145457cb0 <.text+0x5456cb0>
145521ba6:     	movq	%rdx, 0x610(%rbp)
145521bad:     	testq	%rax, %rax
145521bb0:     	movq	0x608(%rbp), %rcx
145521bb7:     	cmovneq	%rax, %rcx
145521bbb:     	movq	%rcx, 0x608(%rbp)
145521bc2:     	movq	0x610(%rbp), %rax
145521bc9:     	cmoveq	%rsi, %rax
145521bcd:     	movq	%rax, 0x610(%rbp)
145521bd4:     	leaq	0x1813b24(%rip), %rcx   # 0x146d356ff
145521bdb:     	movl	$0x14, %esi
145521be0:     	movl	$0x14, %edx
145521be5:     	movq	%rcx, 0x618(%rbp)
145521bec:     	callq	0x145457cb0 <.text+0x5456cb0>
145521bf1:     	movq	%rdx, 0x5e8(%rbp)
145521bf8:     	testq	%rax, %rax
145521bfb:     	movq	0x618(%rbp), %rcx
145521c02:     	cmovneq	%rax, %rcx
145521c06:     	movq	%rcx, 0x618(%rbp)
145521c0d:     	movq	0x5e8(%rbp), %rax
145521c14:     	cmoveq	%rsi, %rax
145521c18:     	movq	%rax, 0x5e8(%rbp)
145521c1f:     	leaq	0x1813b07(%rip), %rcx   # 0x146d3572d
145521c26:     	movl	$0x12, %esi
145521c2b:     	movl	$0x12, %edx
145521c30:     	movq	%rcx, 0x5d0(%rbp)
145521c37:     	callq	0x145457cb0 <.text+0x5456cb0>
145521c3c:     	movq	%rdx, 0x5f0(%rbp)
145521c43:     	testq	%rax, %rax
145521c46:     	movq	0x5d0(%rbp), %rcx
145521c4d:     	cmovneq	%rax, %rcx
145521c51:     	movq	%rcx, 0x5d0(%rbp)
145521c58:     	movq	0x5f0(%rbp), %rax
145521c5f:     	cmoveq	%rsi, %rax
145521c63:     	movq	%rax, 0x5f0(%rbp)
145521c6a:     	leaq	0x1813ace(%rip), %rcx   # 0x146d3573f
145521c71:     	movl	$0x15, %esi
145521c76:     	movl	$0x15, %edx
145521c7b:     	movq	%rcx, 0x598(%rbp)
145521c82:     	callq	0x145457cb0 <.text+0x5456cb0>
145521c87:     	movq	%rdx, 0x5a0(%rbp)
145521c8e:     	testq	%rax, %rax
145521c91:     	movq	0x598(%rbp), %rcx
145521c98:     	cmovneq	%rax, %rcx
145521c9c:     	movq	%rcx, 0x598(%rbp)
145521ca3:     	movq	0x5a0(%rbp), %rax
145521caa:     	cmoveq	%rsi, %rax
145521cae:     	movq	%rax, 0x5a0(%rbp)
145521cb5:     	leaq	0x1813aa7(%rip), %rcx   # 0x146d35763
145521cbc:     	movl	$0xe, %esi
145521cc1:     	movl	$0xe, %edx
145521cc6:     	movq	%rcx, 0x588(%rbp)
145521ccd:     	callq	0x145457cb0 <.text+0x5456cb0>
145521cd2:     	movq	%rdx, 0x5c8(%rbp)
145521cd9:     	testq	%rax, %rax
145521cdc:     	movq	0x588(%rbp), %rcx
145521ce3:     	cmovneq	%rax, %rcx
145521ce7:     	movq	%rcx, 0x588(%rbp)
145521cee:     	movq	0x5c8(%rbp), %rax
145521cf5:     	cmoveq	%rsi, %rax
145521cf9:     	movq	%rax, 0x5c8(%rbp)
145521d00:     	leaq	0x1813a6a(%rip), %rcx   # 0x146d35771
145521d07:     	movl	$0x17, %esi
145521d0c:     	movl	$0x17, %edx
145521d11:     	movq	%rcx, 0x590(%rbp)
145521d18:     	callq	0x145457cb0 <.text+0x5456cb0>
145521d1d:     	movq	%rdx, 0x4f8(%rbp)
145521d24:     	testq	%rax, %rax
145521d27:     	movq	0x590(%rbp), %rcx
145521d2e:     	cmovneq	%rax, %rcx
145521d32:     	movq	%rcx, 0x590(%rbp)
145521d39:     	movq	0x4f8(%rbp), %rax
145521d40:     	cmoveq	%rsi, %rax
145521d44:     	movq	%rax, 0x4f8(%rbp)
145521d4b:     	leaq	0x1813a59(%rip), %rcx   # 0x146d357ab
145521d52:     	movl	$0xd, %esi
145521d57:     	movl	$0xd, %edx
145521d5c:     	movq	%rcx, 0x500(%rbp)
145521d63:     	callq	0x145457cb0 <.text+0x5456cb0>
145521d68:     	movq	%rdx, 0x508(%rbp)
145521d6f:     	testq	%rax, %rax
145521d72:     	movq	0x500(%rbp), %rcx
145521d79:     	cmovneq	%rax, %rcx
145521d7d:     	movq	%rcx, 0x500(%rbp)
145521d84:     	movq	0x508(%rbp), %rax
145521d8b:     	cmoveq	%rsi, %rax
145521d8f:     	movq	%rax, 0x508(%rbp)
145521d96:     	leaq	0x1813a1b(%rip), %rcx   # 0x146d357b8
145521d9d:     	movl	$0x13, %esi
145521da2:     	movl	$0x13, %edx
145521da7:     	movq	%rcx, 0x510(%rbp)
145521dae:     	callq	0x145457cb0 <.text+0x5456cb0>
145521db3:     	movq	%rdx, 0x488(%rbp)
145521dba:     	testq	%rax, %rax
145521dbd:     	movq	0x510(%rbp), %rcx
145521dc4:     	cmovneq	%rax, %rcx
145521dc8:     	movq	%rcx, 0x510(%rbp)
145521dcf:     	movq	0x488(%rbp), %rax
145521dd6:     	cmoveq	%rsi, %rax
145521dda:     	movq	%rax, 0x488(%rbp)
145521de1:     	leaq	0x18139ff(%rip), %rcx   # 0x146d357e7
145521de8:     	movl	$0xf, %esi
145521ded:     	movl	$0xf, %edx
145521df2:     	movq	%rcx, 0x490(%rbp)
145521df9:     	callq	0x145457cb0 <.text+0x5456cb0>
145521dfe:     	movq	%rdx, 0x498(%rbp)
145521e05:     	testq	%rax, %rax
145521e08:     	movq	0x490(%rbp), %rcx
145521e0f:     	cmovneq	%rax, %rcx
145521e13:     	movq	%rcx, 0x490(%rbp)
145521e1a:     	movq	0x498(%rbp), %rax
145521e21:     	cmoveq	%rsi, %rax
145521e25:     	movq	%rax, 0x498(%rbp)
145521e2c:     	leaq	0x18139c3(%rip), %rcx   # 0x146d357f6
145521e33:     	movl	$0x14, %esi
145521e38:     	movl	$0x14, %edx
145521e3d:     	movq	%rcx, 0x4a0(%rbp)
145521e44:     	callq	0x145457cb0 <.text+0x5456cb0>
145521e49:     	movq	%rdx, 0x4a8(%rbp)
145521e50:     	testq	%rax, %rax
145521e53:     	movq	0x4a0(%rbp), %rcx
145521e5a:     	cmovneq	%rax, %rcx
145521e5e:     	movq	%rcx, 0x4a0(%rbp)
145521e65:     	movq	0x4a8(%rbp), %rax
145521e6c:     	cmoveq	%rsi, %rax
145521e70:     	movq	%rax, 0x4a8(%rbp)
145521e77:     	leaq	0x18139a9(%rip), %rcx   # 0x146d35827
145521e7e:     	movl	$0xb, %esi
145521e83:     	movl	$0xb, %edx
145521e88:     	movq	%rcx, 0x4b0(%rbp)
145521e8f:     	callq	0x145457cb0 <.text+0x5456cb0>
145521e94:     	movq	%rdx, 0x4b8(%rbp)
145521e9b:     	testq	%rax, %rax
145521e9e:     	movq	0x4b0(%rbp), %rcx
145521ea5:     	cmovneq	%rax, %rcx
145521ea9:     	movq	%rcx, 0x4b0(%rbp)
145521eb0:     	movq	0x4b8(%rbp), %rax
145521eb7:     	cmoveq	%rsi, %rax
145521ebb:     	movq	%rax, 0x4b8(%rbp)
145521ec2:     	leaq	0x1813969(%rip), %rcx   # 0x146d35832
145521ec9:     	movl	$0x13, %esi
145521ece:     	movl	$0x13, %edx
145521ed3:     	movq	%rcx, 0x4c0(%rbp)
145521eda:     	callq	0x145457cb0 <.text+0x5456cb0>
145521edf:     	movq	%rdx, 0x4c8(%rbp)
145521ee6:     	testq	%rax, %rax
145521ee9:     	movq	0x4c0(%rbp), %rcx
145521ef0:     	cmovneq	%rax, %rcx
145521ef4:     	movq	%rcx, 0x4c0(%rbp)
145521efb:     	movq	0x4c8(%rbp), %rax
145521f02:     	cmoveq	%rsi, %rax
145521f06:     	movq	%rax, 0x4c8(%rbp)
145521f0d:     	leaq	0x181395a(%rip), %rcx   # 0x146d3586e
145521f14:     	movl	$0xd, %esi
145521f19:     	movl	$0xd, %edx
145521f1e:     	movq	%rcx, 0x4d0(%rbp)
145521f25:     	callq	0x145457cb0 <.text+0x5456cb0>
145521f2a:     	movq	%rdx, 0x4d8(%rbp)
145521f31:     	testq	%rax, %rax
145521f34:     	movq	0x4d0(%rbp), %rcx
145521f3b:     	cmovneq	%rax, %rcx
145521f3f:     	movq	%rcx, 0x4d0(%rbp)
145521f46:     	movq	0x4d8(%rbp), %rax
145521f4d:     	cmoveq	%rsi, %rax
145521f51:     	movq	%rax, 0x4d8(%rbp)
145521f58:     	leaq	0x181391c(%rip), %rcx   # 0x146d3587b
145521f5f:     	movl	$0x13, %esi
145521f64:     	movl	$0x13, %edx
145521f69:     	movq	%rcx, 0x4e0(%rbp)
145521f70:     	callq	0x145457cb0 <.text+0x5456cb0>
145521f75:     	movq	%rdx, 0x4e8(%rbp)
145521f7c:     	testq	%rax, %rax
145521f7f:     	movq	0x4e0(%rbp), %rcx
145521f86:     	cmovneq	%rax, %rcx
145521f8a:     	movq	%rcx, 0x4e0(%rbp)
145521f91:     	movq	0x4e8(%rbp), %rax
145521f98:     	cmoveq	%rsi, %rax
145521f9c:     	movq	%rax, 0x4e8(%rbp)
145521fa3:     	leaq	0x1813910(%rip), %rcx   # 0x146d358ba
145521faa:     	movl	$0xb, %esi
145521faf:     	movl	$0xb, %edx
145521fb4:     	movq	%rcx, 0x4f0(%rbp)
145521fbb:     	callq	0x145457cb0 <.text+0x5456cb0>
145521fc0:     	movq	%rdx, -0x28(%rbp)
145521fc4:     	testq	%rax, %rax
145521fc7:     	movq	0x4f0(%rbp), %rcx
145521fce:     	cmovneq	%rax, %rcx
145521fd2:     	movq	%rcx, 0x4f0(%rbp)
145521fd9:     	movq	-0x28(%rbp), %rax
145521fdd:     	cmoveq	%rsi, %rax
145521fe1:     	movq	%rax, -0x28(%rbp)
145521fe5:     	leaq	0x18138d9(%rip), %rcx   # 0x146d358c5
145521fec:     	movl	$0x10, %esi
145521ff1:     	movl	$0x10, %edx
145521ff6:     	movq	%rcx, -0x20(%rbp)
145521ffa:     	callq	0x145457cb0 <.text+0x5456cb0>
145521fff:     	movq	%rdx, -0x18(%rbp)
145522003:     	testq	%rax, %rax
145522006:     	movq	-0x20(%rbp), %rcx
14552200a:     	cmovneq	%rax, %rcx
14552200e:     	movq	%rcx, -0x20(%rbp)
145522012:     	movq	-0x18(%rbp), %rax
145522016:     	cmoveq	%rsi, %rax
14552201a:     	movq	%rax, -0x18(%rbp)
14552201e:     	leaq	0x18138d6(%rip), %rcx   # 0x146d358fb
145522025:     	movl	$0xd, %esi
14552202a:     	movl	$0xd, %edx
14552202f:     	movq	%rcx, -0x10(%rbp)
145522033:     	callq	0x145457cb0 <.text+0x5456cb0>
145522038:     	movq	%rdx, -0x8(%rbp)
14552203c:     	testq	%rax, %rax
14552203f:     	movq	-0x10(%rbp), %rcx
145522043:     	cmovneq	%rax, %rcx
145522047:     	movq	%rcx, -0x10(%rbp)
14552204b:     	movq	-0x8(%rbp), %rax
14552204f:     	cmoveq	%rsi, %rax
145522053:     	movq	%rax, -0x8(%rbp)
145522057:     	leaq	0x18138aa(%rip), %rcx   # 0x146d35908
14552205e:     	movl	$0xf, %esi
145522063:     	movl	$0xf, %edx
145522068:     	movq	%rcx, (%rbp)
14552206c:     	callq	0x145457cb0 <.text+0x5456cb0>
145522071:     	movq	%rdx, 0x8(%rbp)
145522075:     	testq	%rax, %rax
145522078:     	movq	(%rbp), %rcx
14552207c:     	cmovneq	%rax, %rcx
145522080:     	movq	%rcx, (%rbp)
145522084:     	movq	0x8(%rbp), %rax
145522088:     	cmoveq	%rsi, %rax
14552208c:     	movq	%rax, 0x8(%rbp)
145522090:     	leaq	0x1813899(%rip), %rcx   # 0x146d35930
145522097:     	movl	$0x7, %esi
14552209c:     	movl	$0x7, %edx
1455220a1:     	movq	%rcx, 0x10(%rbp)
1455220a5:     	callq	0x145457cb0 <.text+0x5456cb0>
1455220aa:     	movq	%rdx, 0x18(%rbp)
1455220ae:     	testq	%rax, %rax
1455220b1:     	movq	0x10(%rbp), %rcx
1455220b5:     	cmovneq	%rax, %rcx
1455220b9:     	movq	%rcx, 0x10(%rbp)
1455220bd:     	movq	0x18(%rbp), %rax
1455220c1:     	cmoveq	%rsi, %rax
1455220c5:     	movq	%rax, 0x18(%rbp)
1455220c9:     	leaq	0x1813867(%rip), %rcx   # 0x146d35937
1455220d0:     	movl	$0xd, %esi
1455220d5:     	movl	$0xd, %edx
1455220da:     	movq	%rcx, 0x28(%rbp)
1455220de:     	callq	0x145457cb0 <.text+0x5456cb0>
1455220e3:     	movq	%rdx, 0x20(%rbp)
1455220e7:     	testq	%rax, %rax
1455220ea:     	movq	0x28(%rbp), %rcx
1455220ee:     	cmovneq	%rax, %rcx
1455220f2:     	movq	%rcx, 0x28(%rbp)
1455220f6:     	movq	0x20(%rbp), %rax
1455220fa:     	cmoveq	%rsi, %rax
1455220fe:     	movq	%rax, 0x20(%rbp)
145522102:     	leaq	0x1813857(%rip), %rsi   # 0x146d35960
145522109:     	movl	$0x7, %edi
14552210e:     	movl	$0x7, %edx
145522113:     	movq	%rsi, %rcx
145522116:     	callq	0x145457cb0 <.text+0x5456cb0>
14552211b:     	movq	%rdx, 0x30(%rbp)
14552211f:     	testq	%rax, %rax
145522122:     	cmovneq	%rax, %rsi
145522126:     	movq	0x30(%rbp), %rax
14552212a:     	cmoveq	%rdi, %rax
14552212e:     	movq	%rax, 0x30(%rbp)
145522132:     	leaq	0x181382e(%rip), %rbx   # 0x146d35967
145522139:     	movl	$0xe, %edi
14552213e:     	movl	$0xe, %edx
145522143:     	movq	%rbx, %rcx
145522146:     	callq	0x145457cb0 <.text+0x5456cb0>
14552214b:     	movq	%rdx, 0x38(%rbp)
14552214f:     	testq	%rax, %rax
145522152:     	cmovneq	%rax, %rbx
145522156:     	movq	0x38(%rbp), %rax
14552215a:     	cmoveq	%rdi, %rax
14552215e:     	movq	%rax, 0x38(%rbp)
145522162:     	leaq	0x1813829(%rip), %r14   # 0x146d35992
145522169:     	movl	$0x9, %edx
14552216e:     	movq	%r14, %rcx
145522171:     	callq	0x145457cb0 <.text+0x5456cb0>
145522176:     	nop
145522177:     	movq	%rax, %rdi
14552217a:     	movq	%rdx, %r12
14552217d:     	leaq	0x1813817(%rip), %r13   # 0x146d3599b
145522184:     	movl	$0xc, %r15d
14552218a:     	movl	$0xc, %edx
14552218f:     	movq	%r13, %rcx
145522192:     	callq	0x145457cb0 <.text+0x5456cb0>
145522197:     	nop
145522198:     	testq	%rdi, %rdi
14552219b:     	movl	$0x9, %ecx
1455221a0:     	cmoveq	%rcx, %r12
1455221a4:     	cmovneq	%rdi, %r14
1455221a8:     	testq	%rax, %rax
1455221ab:     	cmovneq	%rax, %r13
1455221af:     	cmoveq	%r15, %rdx
1455221b3:     	movq	$0x0, 0x40(%rbp)
1455221bb:     	movq	$0xc, 0x48(%rbp)
1455221c3:     	leaq	0x1813549(%rip), %rax   # 0x146d35713
1455221ca:     	movq	%rax, 0x50(%rbp)
1455221ce:     	movq	$0xe, 0x58(%rbp)
1455221d6:     	movq	0x608(%rbp), %rax
1455221dd:     	movq	%rax, 0x60(%rbp)
1455221e1:     	movq	0x610(%rbp), %rax
1455221e8:     	movq	%rax, 0x68(%rbp)
1455221ec:     	movq	0x618(%rbp), %rax
1455221f3:     	movq	%rax, 0x70(%rbp)
1455221f7:     	movq	0x5e8(%rbp), %rax
1455221fe:     	movq	%rax, 0x78(%rbp)
145522202:     	leaq	0x1813518(%rip), %rax   # 0x146d35721
145522209:     	movq	%rax, 0x80(%rbp)
145522210:     	movq	$0xc, 0x88(%rbp)
14552221b:     	movl	$0xa, 0x90(%rbp)
145522225:     	movb	$0x0, 0x94(%rbp)
14552222c:     	movq	$0x2710, 0x98(%rbp)     # imm = 0x2710
145522237:     	leaq	0x1813516(%rip), %rax   # 0x146d35754
14552223e:     	movq	%rax, 0xa0(%rbp)
145522245:     	movq	$0xf, 0xa8(%rbp)
145522250:     	movq	0x5d0(%rbp), %rax
145522257:     	movq	%rax, 0xb0(%rbp)
14552225e:     	movq	0x5f0(%rbp), %rax
145522265:     	movq	%rax, 0xb8(%rbp)
14552226c:     	movq	0x598(%rbp), %rax
145522273:     	movq	%rax, 0xc0(%rbp)
14552227a:     	movq	0x5a0(%rbp), %rax
145522281:     	movq	%rax, 0xc8(%rbp)
145522288:     	leaq	0x18130e2(%rip), %rax   # 0x146d35371
14552228f:     	movq	%rax, 0xd0(%rbp)
145522296:     	movq	$0xc, 0xd8(%rbp)
1455222a1:     	movl	$0x19, 0xe0(%rbp)
1455222ab:     	movb	$0x0, 0xe4(%rbp)
1455222b2:     	movq	$0x186a0, 0xe8(%rbp)    # imm = 0x186A0
1455222bd:     	leaq	0x18134c4(%rip), %rax   # 0x146d35788
1455222c4:     	movq	%rax, 0xf0(%rbp)
1455222cb:     	movq	$0xd, 0xf8(%rbp)
1455222d6:     	movq	0x588(%rbp), %rax
1455222dd:     	movq	%rax, 0x100(%rbp)
1455222e4:     	movq	0x5c8(%rbp), %rax
1455222eb:     	movq	%rax, 0x108(%rbp)
1455222f2:     	movq	0x590(%rbp), %rax
1455222f9:     	movq	%rax, 0x110(%rbp)
145522300:     	movq	0x4f8(%rbp), %rax
145522307:     	movq	%rax, 0x118(%rbp)
14552230e:     	leaq	0x1813480(%rip), %rax   # 0x146d35795
145522315:     	movq	%rax, 0x120(%rbp)
14552231c:     	movq	$0x16, 0x128(%rbp)
145522327:     	movl	$0x32, 0x130(%rbp)
145522331:     	movb	$0x0, 0x134(%rbp)
145522338:     	movq	$0xf4240, 0x138(%rbp)   # imm = 0xF4240
145522343:     	leaq	0x1813481(%rip), %rax   # 0x146d357cb
14552234a:     	movq	%rax, 0x140(%rbp)
145522351:     	movq	$0xc, 0x148(%rbp)
14552235c:     	movq	0x500(%rbp), %rax
145522363:     	movq	%rax, 0x150(%rbp)
14552236a:     	movq	0x508(%rbp), %rax
145522371:     	movq	%rax, 0x158(%rbp)
145522378:     	movq	0x510(%rbp), %rax
14552237f:     	movq	%rax, 0x160(%rbp)
145522386:     	movq	0x488(%rbp), %rax
14552238d:     	movq	%rax, 0x168(%rbp)
145522394:     	leaq	0x181343c(%rip), %rax   # 0x146d357d7
14552239b:     	movq	%rax, 0x170(%rbp)
1455223a2:     	movq	$0x10, 0x178(%rbp)
1455223ad:     	movl	$0xa, 0x180(%rbp)
1455223b7:     	movb	$0x1, 0x184(%rbp)
1455223be:     	movq	$0x1388, 0x188(%rbp)    # imm = 0x1388
1455223c9:     	leaq	0x181343a(%rip), %rax   # 0x146d3580a
1455223d0:     	movq	%rax, 0x190(%rbp)
1455223d7:     	movq	$0xd, 0x198(%rbp)
1455223e2:     	movq	0x490(%rbp), %rax
1455223e9:     	movq	%rax, 0x1a0(%rbp)
1455223f0:     	movq	0x498(%rbp), %rax
1455223f7:     	movq	%rax, 0x1a8(%rbp)
1455223fe:     	movq	0x4a0(%rbp), %rax
145522405:     	movq	%rax, 0x1b0(%rbp)
14552240c:     	movq	0x4a8(%rbp), %rax
145522413:     	movq	%rax, 0x1b8(%rbp)
14552241a:     	leaq	0x18133f6(%rip), %rax   # 0x146d35817
145522421:     	movq	%rax, 0x1c0(%rbp)
145522428:     	movq	$0x10, 0x1c8(%rbp)
145522433:     	movl	$0x19, 0x1d0(%rbp)
14552243d:     	movb	$0x1, 0x1d4(%rbp)
145522444:     	movq	$0xc350, 0x1d8(%rbp)    # imm = 0xC350
14552244f:     	leaq	0x18133ef(%rip), %rax   # 0x146d35845
145522456:     	movq	%rax, 0x1e0(%rbp)
14552245d:     	movq	$0x12, 0x1e8(%rbp)
145522468:     	movq	0x4b0(%rbp), %rax
14552246f:     	movq	%rax, 0x1f0(%rbp)
145522476:     	movq	0x4b8(%rbp), %rax
14552247d:     	movq	%rax, 0x1f8(%rbp)
145522484:     	movq	0x4c0(%rbp), %rax
14552248b:     	movq	%rax, 0x200(%rbp)
145522492:     	movq	0x4c8(%rbp), %rax
145522499:     	movq	%rax, 0x208(%rbp)
1455224a0:     	leaq	0x18133b0(%rip), %rax   # 0x146d35857
1455224a7:     	movq	%rax, 0x210(%rbp)
1455224ae:     	movq	$0x17, 0x218(%rbp)
1455224b9:     	movl	$0xa, 0x220(%rbp)
1455224c3:     	movb	$0x2, 0x224(%rbp)
1455224ca:     	movq	$0x64, 0x228(%rbp)
1455224d5:     	leaq	0x18133b2(%rip), %rax   # 0x146d3588e
1455224dc:     	movq	%rax, 0x230(%rbp)
1455224e3:     	movq	$0x12, 0x238(%rbp)
1455224ee:     	movq	0x4d0(%rbp), %rax
1455224f5:     	movq	%rax, 0x240(%rbp)
1455224fc:     	movq	0x4d8(%rbp), %rax
145522503:     	movq	%rax, 0x248(%rbp)
14552250a:     	movq	0x4e0(%rbp), %rax
145522511:     	movq	%rax, 0x250(%rbp)
145522518:     	movq	0x4e8(%rbp), %rax
14552251f:     	movq	%rax, 0x258(%rbp)
145522526:     	leaq	0x1813373(%rip), %rax   # 0x146d358a0
14552252d:     	movq	%rax, 0x260(%rbp)
145522534:     	movq	$0x1a, 0x268(%rbp)
14552253f:     	movl	$0x19, 0x270(%rbp)
145522549:     	movb	$0x2, 0x274(%rbp)
145522550:     	movq	$0x1f4, 0x278(%rbp)     # imm = 0x1F4
14552255b:     	leaq	0x1813373(%rip), %rax   # 0x146d358d5
145522562:     	movq	%rax, 0x280(%rbp)
145522569:     	movq	$0xf, 0x288(%rbp)
145522574:     	movq	0x4f0(%rbp), %rax
14552257b:     	movq	%rax, 0x290(%rbp)
145522582:     	movq	-0x28(%rbp), %rax
145522586:     	movq	%rax, 0x298(%rbp)
14552258d:     	movq	-0x20(%rbp), %rax
145522591:     	movq	%rax, 0x2a0(%rbp)
145522598:     	movq	-0x18(%rbp), %rax
14552259c:     	movq	%rax, 0x2a8(%rbp)
1455225a3:     	leaq	0x181333a(%rip), %rax   # 0x146d358e4
1455225aa:     	movq	%rax, 0x2b0(%rbp)
1455225b1:     	movq	$0x17, 0x2b8(%rbp)
1455225bc:     	movl	$0xa, 0x2c0(%rbp)
1455225c6:     	movb	$0x3, 0x2c4(%rbp)
1455225cd:     	movq	$0x64, 0x2c8(%rbp)
1455225d8:     	leaq	0x1813338(%rip), %rax   # 0x146d35917
1455225df:     	movq	%rax, 0x2d0(%rbp)
1455225e6:     	movq	$0xf, 0x2d8(%rbp)
1455225f1:     	movq	-0x10(%rbp), %rax
1455225f5:     	movq	%rax, 0x2e0(%rbp)
1455225fc:     	movq	-0x8(%rbp), %rax
145522600:     	movq	%rax, 0x2e8(%rbp)
145522607:     	movq	(%rbp), %rax
14552260b:     	movq	%rax, 0x2f0(%rbp)
145522612:     	movq	0x8(%rbp), %rax
145522616:     	movq	%rax, 0x2f8(%rbp)
14552261d:     	leaq	0x1813302(%rip), %rax   # 0x146d35926
145522624:     	movq	%rax, 0x300(%rbp)
14552262b:     	movq	$0xa, 0x308(%rbp)
145522636:     	movl	$0xa, 0x310(%rbp)
145522640:     	movb	$0x6, 0x314(%rbp)
145522647:     	movq	$0x64, 0x318(%rbp)
145522652:     	leaq	0x18132eb(%rip), %rax   # 0x146d35944
145522659:     	movq	%rax, 0x320(%rbp)
145522660:     	movq	$0xc, 0x328(%rbp)
14552266b:     	movq	0x10(%rbp), %rax
14552266f:     	movq	%rax, 0x330(%rbp)
145522676:     	movq	0x18(%rbp), %rax
14552267a:     	movq	%rax, 0x338(%rbp)
145522681:     	movq	0x28(%rbp), %rax
145522685:     	movq	%rax, 0x340(%rbp)
14552268c:     	movq	0x20(%rbp), %rax
145522690:     	movq	%rax, 0x348(%rbp)
145522697:     	leaq	0x18132b2(%rip), %rax   # 0x146d35950
14552269e:     	movq	%rax, 0x350(%rbp)
1455226a5:     	movq	$0x10, 0x358(%rbp)
1455226b0:     	movl	$0xa, 0x360(%rbp)
1455226ba:     	movb	$0x4, 0x364(%rbp)
1455226c1:     	movq	$0xa, 0x368(%rbp)
1455226cc:     	leaq	0x18132a2(%rip), %rax   # 0x146d35975
1455226d3:     	movq	%rax, 0x370(%rbp)
1455226da:     	movq	$0xd, 0x378(%rbp)
1455226e5:     	movq	%rsi, 0x380(%rbp)
1455226ec:     	movq	0x30(%rbp), %rax
1455226f0:     	movq	%rax, 0x388(%rbp)
1455226f7:     	movq	%rbx, 0x390(%rbp)
1455226fe:     	leaq	0x98(%rbp), %rsi
145522705:     	movq	0x38(%rbp), %rax
145522709:     	movq	%rax, 0x398(%rbp)
145522710:     	leaq	0x181326b(%rip), %rax   # 0x146d35982
145522717:     	movq	%rax, 0x3a0(%rbp)
14552271e:     	movq	$0x10, 0x3a8(%rbp)
145522729:     	movl	$0xa, 0x3b0(%rbp)
145522733:     	movb	$0x4, 0x3b4(%rbp)
14552273a:     	movq	$0x64, 0x3b8(%rbp)
145522745:     	leaq	0x181325b(%rip), %rax   # 0x146d359a7
14552274c:     	movq	%rax, 0x3c0(%rbp)
145522753:     	movq	$0xc, 0x3c8(%rbp)
14552275e:     	movq	%r14, 0x3d0(%rbp)
145522765:     	movq	%r12, 0x3d8(%rbp)
14552276c:     	movq	%r13, 0x3e0(%rbp)
145522773:     	movq	%rdx, 0x3e8(%rbp)
14552277a:     	leaq	0x1813232(%rip), %rax   # 0x146d359b3
145522781:     	movq	%rax, 0x3f0(%rbp)
145522788:     	movq	$0x10, 0x3f8(%rbp)
145522793:     	movl	$0x19, 0x400(%rbp)
14552279d:     	movb	$0x5, 0x404(%rbp)
1455227a4:     	movq	$0x32, 0x408(%rbp)
1455227af:     	movl	$0x1, %edi
1455227b4:     	movq	%rdi, 0x40(%rbp)
1455227b8:     	movzbl	-0x4(%rsi), %r14d
1455227bd:     	cmpb	$-0x1, %r14b
1455227c1:     	je	0x145522a72 <.text+0x5521a72>
1455227c7:     	movq	-0x40(%rsi), %rax
1455227cb:     	movq	%rax, 0x608(%rbp)
1455227d2:     	testq	%rax, %rax
1455227d5:     	js	0x145522b54 <.text+0x5521b54>
1455227db:     	movq	-0x38(%rsi), %r15
1455227df:     	movq	-0x30(%rsi), %rax
1455227e3:     	movq	%rax, 0x618(%rbp)
1455227ea:     	movq	-0x28(%rsi), %rax
1455227ee:     	movq	%rax, 0x588(%rbp)
1455227f5:     	movq	-0x20(%rsi), %rbx
1455227f9:     	movq	-0x18(%rsi), %rax
1455227fd:     	movq	%rax, 0x5f0(%rbp)
145522804:     	movq	-0x10(%rsi), %rax
145522808:     	movq	%rax, 0x598(%rbp)
14552280f:     	movl	-0x8(%rsi), %eax
145522812:     	movl	%eax, 0x5a0(%rbp)
145522818:     	movq	(%rsi), %rax
14552281b:     	movq	%rax, 0x5d0(%rbp)
145522822:     	je	0x14552286c <.text+0x552186c>
145522824:     	movq	-0x48(%rsi), %r13
145522828:     	callq	0x140002200 <.text+0x1200>
14552282d:     	movl	$0x1, %r12d
145522833:     	movl	$0x1, %edx
145522838:     	movq	0x608(%rbp), %rcx
14552283f:     	callq	0x1400021c0 <.text+0x11c0>
145522844:     	movq	%rax, 0x610(%rbp)
14552284b:     	testq	%rax, %rax
14552284e:     	je	0x145522c54 <.text+0x5521c54>
145522854:     	movq	0x610(%rbp), %rcx
14552285b:     	movq	%r13, %rdx
14552285e:     	movq	0x608(%rbp), %r8
145522865:     	callq	0x1457731ed <.text+0x57721ed>
14552286a:     	jmp	0x145522878 <.text+0x5521878>
14552286c:     	movl	$0x1, %eax
145522871:     	movq	%rax, 0x610(%rbp)
145522878:     	cmpq	$0x0, 0x618(%rbp)
145522880:     	js	0x145522b6c <.text+0x5521b6c>
145522886:     	je	0x1455228cc <.text+0x55218cc>
145522888:     	callq	0x140002200 <.text+0x1200>
14552288d:     	movl	$0x1, %r12d
145522893:     	movl	$0x1, %edx
145522898:     	movq	0x618(%rbp), %rcx
14552289f:     	callq	0x1400021c0 <.text+0x11c0>
1455228a4:     	movq	%rax, 0x5e8(%rbp)
1455228ab:     	testq	%rax, %rax
1455228ae:     	je	0x145522c67 <.text+0x5521c67>
1455228b4:     	movq	0x5e8(%rbp), %rcx
1455228bb:     	movq	%r15, %rdx
1455228be:     	movq	0x618(%rbp), %r8
1455228c5:     	callq	0x1457731ed <.text+0x57721ed>
1455228ca:     	jmp	0x1455228d8 <.text+0x55218d8>
1455228cc:     	movl	$0x1, %eax
1455228d1:     	movq	%rax, 0x5e8(%rbp)
1455228d8:     	testq	%rbx, %rbx
1455228db:     	js	0x145522ba0 <.text+0x5521ba0>
1455228e1:     	je	0x145522923 <.text+0x5521923>
1455228e3:     	callq	0x140002200 <.text+0x1200>
1455228e8:     	movl	$0x1, %r15d
1455228ee:     	movl	$0x1, %edx
1455228f3:     	movq	%rbx, %rcx
1455228f6:     	callq	0x1400021c0 <.text+0x11c0>
1455228fb:     	movq	%rax, 0x5c8(%rbp)
145522902:     	testq	%rax, %rax
145522905:     	je	0x145522c7a <.text+0x5521c7a>
14552290b:     	movq	0x5c8(%rbp), %rcx
145522912:     	movq	0x588(%rbp), %rdx
145522919:     	movq	%rbx, %r8
14552291c:     	callq	0x1457731ed <.text+0x57721ed>
145522921:     	jmp	0x14552292f <.text+0x552192f>
145522923:     	movl	$0x1, %eax
145522928:     	movq	%rax, 0x5c8(%rbp)
14552292f:     	movq	0x608(%rbp), %rcx
145522936:     	movq	%rcx, 0x518(%rbp)
14552293d:     	movq	0x610(%rbp), %rax
145522944:     	movq	%rax, 0x520(%rbp)
14552294b:     	movq	%rcx, 0x528(%rbp)
145522952:     	movq	0x618(%rbp), %rcx
145522959:     	movq	%rcx, 0x530(%rbp)
145522960:     	movq	0x5e8(%rbp), %rax
145522967:     	movq	%rax, 0x538(%rbp)
14552296e:     	movq	%rcx, 0x540(%rbp)
145522975:     	movq	%rbx, 0x548(%rbp)
14552297c:     	movq	0x5c8(%rbp), %rax
145522983:     	movq	%rax, 0x550(%rbp)
14552298a:     	movq	%rbx, 0x558(%rbp)
145522991:     	movl	0x5a0(%rbp), %eax
145522997:     	movl	%eax, 0x580(%rbp)
14552299d:     	movb	$0x4, 0x584(%rbp)
1455229a4:     	movq	0x5f0(%rbp), %rax
1455229ab:     	movq	%rax, 0x570(%rbp)
1455229b2:     	movq	0x598(%rbp), %rax
1455229b9:     	movq	%rax, 0x578(%rbp)
1455229c0:     	movb	$0x8, 0x560(%rbp)
1455229c7:     	movb	%r14b, 0x561(%rbp)
1455229ce:     	movq	0x5d0(%rbp), %rax
1455229d5:     	movq	%rax, 0x568(%rbp)
1455229dc:     	movq	0x5c0(%rbp), %rbx
1455229e3:     	cmpq	0x5b0(%rbp), %rbx
1455229ea:     	jne	0x1455229f9 <.text+0x55219f9>
1455229ec:     	leaq	0x5b0(%rbp), %rcx
1455229f3:     	callq	0x145778530 <.text+0x5777530>
1455229f8:     	nop
1455229f9:     	movq	0x5b8(%rbp), %rax
145522a00:     	imulq	$0x70, %rbx, %rcx
145522a04:     	movups	0x578(%rbp), %xmm0
145522a0b:     	movups	%xmm0, 0x60(%rax,%rcx)
145522a10:     	movups	0x568(%rbp), %xmm0
145522a17:     	movups	%xmm0, 0x50(%rax,%rcx)
145522a1c:     	movups	0x558(%rbp), %xmm0
145522a23:     	movups	%xmm0, 0x40(%rax,%rcx)
145522a28:     	movups	0x518(%rbp), %xmm0
145522a2f:     	movups	0x528(%rbp), %xmm1
145522a36:     	movups	0x538(%rbp), %xmm2
145522a3d:     	movups	0x548(%rbp), %xmm3
145522a44:     	movups	%xmm3, 0x30(%rax,%rcx)
145522a49:     	movups	%xmm2, 0x20(%rax,%rcx)
145522a4e:     	movups	%xmm1, 0x10(%rax,%rcx)
145522a53:     	movups	%xmm0, (%rax,%rcx)
145522a57:     	incq	%rbx
145522a5a:     	movq	%rbx, 0x5c0(%rbp)
145522a61:     	incq	%rdi
145522a64:     	addq	$0x50, %rsi
145522a68:     	cmpq	$0xd, %rdi
145522a6c:     	jne	0x1455227b4 <.text+0x55217b4>
145522a72:     	movq	0x5c0(%rbp), %rax
145522a79:     	movq	%rax, 0x50(%rbp)
145522a7d:     	movups	0x5b0(%rbp), %xmm0
145522a84:     	movaps	%xmm0, 0x40(%rbp)
145522a88:     	movq	-0x40(%rbp), %rcx
145522a8c:     	movq	%rax, 0x10(%rcx)
145522a90:     	movups	%xmm0, (%rcx)
145522a93:     	movaps	0x630(%rbp), %xmm6
145522a9a:     	addq	$0x6c8, %rsp            # imm = 0x6C8
145522aa1:     	popq	%rbx
145522aa2:     	popq	%rdi
145522aa3:     	popq	%rsi
145522aa4:     	popq	%r12
145522aa6:     	popq	%r13
145522aa8:     	popq	%r14
145522aaa:     	popq	%r15
145522aac:     	popq	%rbp
145522aad:     	retq
145522aae:     	xorl	%r12d, %r12d
145522ab1:     	movq	%r12, %rcx
145522ab4:     	movq	0x610(%rbp), %rdx
145522abb:     	callq	0x14590379b <.text+0x590279b>
145522ac0:     	nop
145522ac1:     	jmp	0x145522c20 <.text+0x5521c20>
145522ac6:     	xorl	%r12d, %r12d
145522ac9:     	movb	$0x1, 0x5e0(%rbp)
145522ad0:     	movq	%r12, %rcx
145522ad3:     	movq	0x5e8(%rbp), %rdx
145522ada:     	callq	0x14590379b <.text+0x590279b>
145522adf:     	nop
145522ae0:     	jmp	0x145522c20 <.text+0x5521c20>
145522ae5:     	movb	$0x1, 0x626(%rbp)
145522aec:     	leaq	0x181258d(%rip), %r8    # 0x146d35080
145522af3:     	movl	$0xc, %edx
145522af8:     	movq	%rdi, %rcx
145522afb:     	callq	0x145903b33 <.text+0x5902b33>
145522b00:     	nop
145522b01:     	jmp	0x145522c20 <.text+0x5521c20>
145522b06:     	xorl	%r15d, %r15d
145522b09:     	movb	$0x1, 0x5ae(%rbp)
145522b10:     	movq	%r15, %rcx
145522b13:     	movq	0x5a0(%rbp), %rdx
145522b1a:     	callq	0x14590379b <.text+0x590279b>
145522b1f:     	nop
145522b20:     	jmp	0x145522c20 <.text+0x5521c20>
145522b25:     	movb	$0x1, 0x625(%rbp)
145522b2c:     	leaq	0x181254d(%rip), %r8    # 0x146d35080
145522b33:     	movl	$0xc, %edx
145522b38:     	callq	0x145903b33 <.text+0x5902b33>
145522b3d:     	nop
145522b3e:     	jmp	0x145522c20 <.text+0x5521c20>
145522b43:     	movq	%rbx, 0x5c8(%rbp)
145522b4a:     	movl	$0x1, %ecx
145522b4f:     	jmp	0x14551ee1c <.text+0x551de1c>
145522b54:     	xorl	%r12d, %r12d
145522b57:     	movq	%r12, %rcx
145522b5a:     	movq	0x610(%rbp), %rdx
145522b61:     	callq	0x14590379b <.text+0x590279b>
145522b66:     	nop
145522b67:     	jmp	0x145522c20 <.text+0x5521c20>
145522b6c:     	xorl	%r12d, %r12d
145522b6f:     	movb	$0x1, 0x5e1(%rbp)
145522b76:     	movq	%r12, %rcx
145522b79:     	movq	0x5e8(%rbp), %rdx
145522b80:     	callq	0x14590379b <.text+0x590279b>
145522b85:     	nop
145522b86:     	jmp	0x145522c20 <.text+0x5521c20>
145522b8b:     	movl	$0x1, %ecx
145522b90:     	movl	$0x9, %edx
145522b95:     	callq	0x14590379b <.text+0x590279b>
145522b9a:     	nop
145522b9b:     	jmp	0x145522c20 <.text+0x5521c20>
145522ba0:     	xorl	%r15d, %r15d
145522ba3:     	movb	$0x1, 0x5af(%rbp)
145522baa:     	movq	%r15, %rcx
145522bad:     	movq	0x5c8(%rbp), %rdx
145522bb4:     	callq	0x14590379b <.text+0x590279b>
145522bb9:     	nop
145522bba:     	jmp	0x145522c20 <.text+0x5521c20>
145522bbc:     	movl	$0x1, %ecx
145522bc1:     	movl	$0x9, %edx
145522bc6:     	callq	0x14590379b <.text+0x590279b>
145522bcb:     	nop
145522bcc:     	jmp	0x145522c20 <.text+0x5521c20>
145522bce:     	movq	%rdi, 0x5d0(%rbp)
145522bd5:     	jmp	0x145520670 <.text+0x551f670>
145522bda:     	movl	$0x1, %ecx
145522bdf:     	movl	$0xa, %edx
145522be4:     	callq	0x14590379b <.text+0x590279b>
145522be9:     	nop
145522bea:     	jmp	0x145522c20 <.text+0x5521c20>
145522bec:     	movl	$0x1, %ecx
145522bf1:     	movl	$0xc, %edx
145522bf6:     	callq	0x14590379b <.text+0x590279b>
145522bfb:     	nop
145522bfc:     	jmp	0x145522c20 <.text+0x5521c20>
145522bfe:     	movl	$0x1, %ecx
145522c03:     	movl	$0x8, %edx
145522c08:     	callq	0x14590379b <.text+0x590279b>
145522c0d:     	nop
145522c0e:     	jmp	0x145522c20 <.text+0x5521c20>
145522c10:     	movl	$0x1, %ecx
145522c15:     	movl	$0x9, %edx
145522c1a:     	callq	0x14590379b <.text+0x590279b>
145522c1f:     	nop
145522c20:     	ud2
145522c22:     	movq	0x608(%rbp), %rax
145522c29:     	movq	%rax, 0x610(%rbp)
145522c30:     	jmp	0x145522ab1 <.text+0x5521ab1>
145522c35:     	movq	0x618(%rbp), %rax
145522c3c:     	movq	%rax, 0x5e8(%rbp)
145522c43:     	jmp	0x145522ac9 <.text+0x5521ac9>
145522c48:     	movq	%rbx, 0x5a0(%rbp)
145522c4f:     	jmp	0x145522b09 <.text+0x5521b09>
145522c54:     	movq	0x608(%rbp), %rax
145522c5b:     	movq	%rax, 0x610(%rbp)
145522c62:     	jmp	0x145522b57 <.text+0x5521b57>
145522c67:     	movq	0x618(%rbp), %rax
145522c6e:     	movq	%rax, 0x5e8(%rbp)
145522c75:     	jmp	0x145522b6f <.text+0x5521b6f>
145522c7a:     	movq	%rbx, 0x5c8(%rbp)
145522c81:     	jmp	0x145522ba3 <.text+0x5521ba3>
