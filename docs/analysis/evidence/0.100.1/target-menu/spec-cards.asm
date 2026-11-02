
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140165440:     	pushq	%rbp
140165441:     	pushq	%r15
140165443:     	pushq	%r14
140165445:     	pushq	%r13
140165447:     	pushq	%r12
140165449:     	pushq	%rsi
14016544a:     	pushq	%rdi
14016544b:     	pushq	%rbx
14016544c:     	subq	$0x5f8, %rsp            # imm = 0x5F8
140165453:     	leaq	0x80(%rsp), %rbp
14016545b:     	movaps	%xmm14, 0x560(%rbp)
140165463:     	movaps	%xmm13, 0x550(%rbp)
14016546b:     	movaps	%xmm12, 0x540(%rbp)
140165473:     	movaps	%xmm11, 0x530(%rbp)
14016547b:     	movaps	%xmm10, 0x520(%rbp)
140165483:     	movaps	%xmm9, 0x510(%rbp)
14016548b:     	movaps	%xmm8, 0x500(%rbp)
140165493:     	movaps	%xmm7, 0x4f0(%rbp)
14016549a:     	movaps	%xmm6, 0x4e0(%rbp)
1401654a1:     	movq	$-0x2, 0x4d8(%rbp)
1401654ac:     	movq	(%rcx), %r15
1401654af:     	movq	0x28(%rcx), %rax
1401654b3:     	movq	%r15, -0x30(%rbp)
1401654b7:     	movups	0x8(%rcx), %xmm0
1401654bb:     	movups	%xmm0, -0x28(%rbp)
1401654bf:     	movq	%rcx, 0x348(%rbp)
1401654c6:     	movups	0x18(%rcx), %xmm0
1401654ca:     	movups	%xmm0, -0x18(%rbp)
1401654ce:     	movq	%rax, -0x8(%rbp)
1401654d2:     	movq	(%rdx), %rax
1401654d5:     	movq	%rax, 0x330(%rbp)
1401654dc:     	movq	0x8(%rdx), %rax
1401654e0:     	movq	%rax, 0x338(%rbp)
1401654e7:     	movq	0x10(%rdx), %rax
1401654eb:     	movq	%rax, 0x340(%rbp)
1401654f2:     	leaq	0xf8(%rbp), %rdi
1401654f9:     	leaq	0x3e4(%rbp), %r13
140165500:     	movq	0x18(%rdx), %rbx
140165504:     	xorps	%xmm6, %xmm6
140165507:     	movaps	0x57a1df2(%rip), %xmm7  # 0x145907300
14016550e:     	movaps	0x57a1fda(%rip), %xmm8  # 0x1459074f0
140165516:     	movaps	0x57a1dd2(%rip), %xmm9  # 0x1459072f0
14016551e:     	movaps	0x57b03da(%rip), %xmm10 # 0x145915900
140165526:     	movsd	0x57b3251(%rip), %xmm11 # 0x145918780
14016552f:     	movaps	0x57db019(%rip), %xmm12 # 0x145940550
140165537:     	movsd	0x57b0290(%rip), %xmm13 # 0x1459157d0
140165540:     	leaq	0x1(%rbx), %rax
140165544:     	movq	%rax, 0x478(%rbp)
14016554b:     	xorl	%r12d, %r12d
14016554e:     	movq	%r15, 0x488(%rbp)
140165555:     	movq	%rbx, 0x490(%rbp)
14016555c:     	cmpq	$0x2, %r12
140165560:     	ja	0x140166316 <.text+0x165316>
140165566:     	movq	0x330(%rbp), %rax
14016556d:     	movq	(%rax), %r14
140165570:     	movq	0x340(%rbp), %rax
140165577:     	movb	(%rax), %bl
140165579:     	leaq	0x318(%rbp), %rsi
140165580:     	movq	%rsi, %rcx
140165583:     	movq	0x338(%rbp), %rdx
14016558a:     	movl	%ebx, %r8d
14016558d:     	movq	%r12, %r9
140165590:     	callq	0x14542e5c0 <.text+0x542d5c0>
140165595:     	nop
140165596:     	leaq	0x44c(%rbp), %rcx
14016559d:     	movq	%rsi, %rdx
1401655a0:     	movl	%ebx, %r8d
1401655a3:     	callq	0x1454836b0 <.text+0x54826b0>
1401655a8:     	nop
1401655a9:     	cmpq	%r14, %r12
1401655ac:     	jne	0x1401655c0 <.text+0x1645c0>
1401655ae:     	movups	0x57db0d3(%rip), %xmm0  # 0x145940688
1401655b5:     	jmp	0x1401655c7 <.text+0x1645c7>
1401655b7:     	nopw	(%rax,%rax)
1401655c0:     	movups	0x57db439(%rip), %xmm0  # 0x145940a00
1401655c7:     	movaps	%xmm0, 0x4a0(%rbp)
1401655ce:     	movl	$0x3f800000, 0x4b0(%rbp) # imm = 0x3F800000
1401655d8:     	movups	0x57db131(%rip), %xmm0  # 0x145940710
1401655df:     	movaps	%xmm0, 0xe0(%rbp)
1401655e6:     	movq	$0x0, 0xf0(%rbp)
1401655f1:     	movups	0x57db130(%rip), %xmm0  # 0x145940728
1401655f8:     	movups	%xmm0, (%rdi)
1401655fb:     	movq	$0x0, 0x10(%rdi)
140165603:     	movups	0x57db136(%rip), %xmm0  # 0x145940740
14016560a:     	movups	%xmm0, 0x18(%rdi)
14016560e:     	movq	$0x0, 0x28(%rdi)
140165616:     	movups	0x57db13b(%rip), %xmm0  # 0x145940758
14016561d:     	movups	%xmm0, 0x30(%rdi)
140165621:     	movq	$0x0, 0x40(%rdi)
140165629:     	movl	0x4b0(%rbp), %eax
14016562f:     	leaq	0x2d4(%rbp), %rcx
140165636:     	movl	%eax, 0x38(%rcx)
140165639:     	movaps	0x4a0(%rbp), %xmm0
140165640:     	movups	%xmm0, 0x28(%rcx)
140165644:     	movaps	0x4a0(%rbp), %xmm0
14016564b:     	movaps	%xmm0, 0x2c0(%rbp)
140165652:     	movl	0x4b0(%rbp), %eax
140165658:     	movl	%eax, 0x2d0(%rbp)
14016565e:     	movl	%eax, 0x10(%rcx)
140165661:     	movups	%xmm0, (%rcx)
140165664:     	movl	0x4b0(%rbp), %eax
14016566a:     	movl	%eax, 0x24(%rcx)
14016566d:     	movaps	0x4a0(%rbp), %xmm0
140165674:     	movups	%xmm0, 0x14(%rcx)
140165678:     	movaps	0xe0(%rbp), %xmm0
14016567f:     	movaps	0xf0(%rbp), %xmm1
140165686:     	movaps	0x100(%rbp), %xmm2
14016568d:     	movaps	0x110(%rbp), %xmm3
140165694:     	movaps	%xmm0, (%rbp)
140165698:     	movaps	%xmm1, 0x10(%rbp)
14016569c:     	movaps	%xmm2, 0x20(%rbp)
1401656a0:     	movaps	%xmm3, 0x30(%rbp)
1401656a4:     	movaps	0x120(%rbp), %xmm0
1401656ab:     	movaps	%xmm0, 0x40(%rbp)
1401656af:     	movaps	0x130(%rbp), %xmm0
1401656b6:     	movaps	%xmm0, 0x50(%rbp)
1401656ba:     	leaq	0x8(%rbp), %rax
1401656be:     	movups	%xmm6, 0x98(%rax)
1401656c5:     	movups	%xmm6, 0x88(%rax)
1401656cc:     	movups	%xmm6, 0x78(%rax)
1401656d0:     	movups	%xmm6, 0x68(%rax)
1401656d4:     	movups	%xmm6, 0x58(%rax)
1401656d8:     	movq	$0x0, 0xa8(%rax)
1401656e3:     	movups	0x57db0ee(%rip), %xmm0  # 0x1459407d8
1401656ea:     	movups	%xmm0, 0xc0(%rax)
1401656f1:     	movups	0x57db0d0(%rip), %xmm0  # 0x1459407c8
1401656f8:     	movups	%xmm0, 0xb0(%rax)
1401656ff:     	movaps	0x2c0(%rbp), %xmm0
140165706:     	movaps	0x2d0(%rbp), %xmm1
14016570d:     	movaps	0x2e0(%rbp), %xmm2
140165714:     	movaps	0x2f0(%rbp), %xmm3
14016571b:     	movups	%xmm0, -0x12(%r13)
140165720:     	movups	%xmm1, -0x2(%r13)
140165725:     	movups	%xmm2, 0xe(%r13)
14016572a:     	movups	%xmm3, 0x1e(%r13)
14016572f:     	movaps	0x300(%rbp), %xmm0
140165736:     	movups	%xmm0, 0x2e(%r13)
14016573b:     	movl	$0xd8, %r8d
140165741:     	leaq	0xe8(%rbp), %rcx
140165748:     	movq	%rbp, %rdx
14016574b:     	callq	0x1457731ed <.text+0x57721ed>
140165750:     	movups	%xmm7, 0x1c0(%rbp)
140165757:     	movups	%xmm8, 0x1d0(%rbp)
14016575f:     	movups	%xmm9, 0x1e0(%rbp)
140165767:     	movups	%xmm9, 0x1f0(%rbp)
14016576f:     	movups	%xmm8, 0x200(%rbp)
140165777:     	movups	%xmm8, 0x210(%rbp)
14016577f:     	movups	%xmm10, 0x220(%rbp)
140165787:     	movl	$0x1, 0x230(%rbp)
140165791:     	movq	$0x0, 0x234(%rbp)
14016579c:     	movb	$0x1, 0x23c(%rbp)
1401657a3:     	movsd	%xmm11, 0x240(%rbp)
1401657ac:     	movl	$0x3f800000, 0x248(%rbp) # imm = 0x3F800000
1401657b6:     	movw	$0x0, 0x24c(%rbp)
1401657bf:     	movl	$0x10000, 0x156(%rdi)   # imm = 0x10000
1401657c9:     	movw	$0x0, 0x15a(%rdi)
1401657d2:     	movw	$0x0, 0x160(%rdi)
1401657db:     	movl	$0x10000, 0x15c(%rdi)   # imm = 0x10000
1401657e5:     	movl	$0x0, 0x25a(%rbp)
1401657ef:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
1401657f9:     	movq	%rax, 0x25e(%rbp)
140165800:     	movups	0x3d0(%rbp), %xmm0
140165807:     	movups	0x3e0(%rbp), %xmm1
14016580e:     	movups	0x3f0(%rbp), %xmm2
140165815:     	movups	0x400(%rbp), %xmm3
14016581c:     	movups	%xmm0, 0x16e(%rdi)
140165823:     	movups	%xmm1, 0x17e(%rdi)
14016582a:     	movups	%xmm2, 0x18e(%rdi)
140165831:     	movups	%xmm3, 0x19e(%rdi)
140165838:     	movups	0x410(%rbp), %xmm0
14016583f:     	movups	%xmm0, 0x1ae(%rdi)
140165846:     	movzwl	0x420(%rbp), %eax
14016584d:     	movw	%ax, 0x1be(%rdi)
140165854:     	movq	%r15, 0xe0(%rbp)
14016585b:     	leaq	0x2c0(%rbp), %rcx
140165862:     	leaq	-0x28(%rbp), %rdx
140165866:     	leaq	0xe0(%rbp), %r8
14016586d:     	callq	0x1400d77d0 <.text+0xd67d0>
140165872:     	nop
140165873:     	cmpq	%r14, %r12
140165876:     	jne	0x1401659c0 <.text+0x1649c0>
14016587c:     	movups	0x57dae05(%rip), %xmm0  # 0x145940688
140165883:     	movaps	%xmm0, 0x3d0(%rbp)
14016588a:     	movl	$0x3eb33333, 0x3e0(%rbp) # imm = 0x3EB33333
140165894:     	leaq	0xe0(%rbp), %rcx
14016589b:     	leaq	0x3d0(%rbp), %rdx
1401658a2:     	callq	0x144c8c290 <.text+0x4c8b290>
1401658a7:     	nop
1401658a8:     	movaps	0xe0(%rbp), %xmm0
1401658af:     	movups	%xmm0, 0x4(%rbp)
1401658b3:     	movl	$0x1, (%rbp)
1401658ba:     	movl	$0x41200000, 0x48(%rsp) # imm = 0x41200000
1401658c2:     	movl	$0x1, 0x40(%rsp)
1401658ca:     	movl	$0x0, 0x38(%rsp)
1401658d2:     	movl	$0x1, 0x30(%rsp)
1401658da:     	movl	$0x0, 0x28(%rsp)
1401658e2:     	movl	$0x1, 0x20(%rsp)
1401658ea:     	xorps	%xmm3, %xmm3
1401658ed:     	leaq	0xe0(%rbp), %rcx
1401658f4:     	movq	%rbp, %rdx
1401658f7:     	movl	$0x1, %r8d
1401658fd:     	callq	0x14265f6a0 <.text+0x265e6a0>
140165902:     	nop
140165903:     	movq	0xe0(%rbp), %rax
14016590a:     	movq	%rax, 0x4d0(%rbp)
140165911:     	movq	0xe8(%rbp), %rcx
140165918:     	movq	0xf0(%rbp), %r15
14016591f:     	movq	0x2c0(%rbp), %rax
140165926:     	movq	%rax, 0x4c8(%rbp)
14016592d:     	movq	0x2d8(%rbp), %rbx
140165934:     	movq	0x2e0(%rbp), %rsi
14016593b:     	testq	%rbx, %rbx
14016593e:     	movq	%rcx, 0x4c0(%rbp)
140165945:     	je	0x1401660af <.text+0x1650af>
14016594b:     	movq	(%rbx), %rax
14016594e:     	movq	0x10(%rbx), %r13
140165952:     	subq	%r13, %rax
140165955:     	cmpq	$0x47, %rax
140165959:     	jbe	0x140166293 <.text+0x165293>
14016595f:     	movq	0x8(%rbx), %rax
140165963:     	leaq	0x11b16(%rip), %rcx     # 0x140177480 <.text+0x176480>
14016596a:     	movq	%rcx, (%rax,%r13)
14016596e:     	movl	$0x0, 0x8(%rax,%r13)
140165977:     	movups	%xmm12, 0xc(%rax,%r13)
14016597d:     	movq	0x4d0(%rbp), %rcx
140165984:     	movq	%rcx, 0x20(%rax,%r13)
140165989:     	movq	0x4c0(%rbp), %rcx
140165990:     	movq	%rcx, 0x28(%rax,%r13)
140165995:     	movq	%r15, 0x30(%rax,%r13)
14016599a:     	movb	$0x0, 0x38(%rax,%r13)
1401659a0:     	movq	0x4c8(%rbp), %r15
1401659a7:     	movq	%r15, 0x40(%rax,%r13)
1401659ac:     	addq	$0x48, %r13
1401659b0:     	movq	%r13, 0x10(%rbx)
1401659b4:     	jmp	0x140165d87 <.text+0x164d87>
1401659b9:     	nopl	(%rax)
1401659c0:     	movl	0x4b0(%rbp), %eax
1401659c6:     	movl	%eax, 0x3e0(%rbp)
1401659cc:     	movaps	0x4a0(%rbp), %xmm0
1401659d3:     	movaps	%xmm0, 0x3d0(%rbp)
1401659da:     	movups	0x57dad1b(%rip), %xmm0  # 0x1459406fc
1401659e1:     	movups	%xmm0, (%r13)
1401659e6:     	movl	$0x3f800000, 0x10(%r13) # imm = 0x3F800000
1401659ee:     	leaq	0xe0(%rbp), %rcx
1401659f5:     	callq	0x1400b68f0 <.text+0xb58f0>
1401659fa:     	nop
1401659fb:     	movq	0x3f0(%rbp), %rax
140165a02:     	leaq	0x8(%rbp), %rcx
140165a06:     	movq	%rax, 0x20(%rcx)
140165a0a:     	movaps	0x3d0(%rbp), %xmm0
140165a11:     	movaps	0x3e0(%rbp), %xmm1
140165a18:     	movups	%xmm1, 0x10(%rcx)
140165a1c:     	movups	%xmm0, (%rcx)
140165a1f:     	movq	0x140(%rbp), %rax
140165a26:     	leaq	0x353(%rbp), %rcx
140165a2d:     	movq	%rax, 0x60(%rcx)
140165a31:     	movups	0x130(%rbp), %xmm0
140165a38:     	movups	%xmm0, 0x50(%rcx)
140165a3c:     	movups	0x120(%rbp), %xmm0
140165a43:     	movups	%xmm0, 0x40(%rcx)
140165a47:     	movups	0xe0(%rbp), %xmm0
140165a4e:     	movups	0xf0(%rbp), %xmm1
140165a55:     	movups	0x100(%rbp), %xmm2
140165a5c:     	movups	0x110(%rbp), %xmm3
140165a63:     	movups	%xmm3, 0x30(%rcx)
140165a67:     	movups	%xmm2, 0x20(%rcx)
140165a6b:     	movups	%xmm1, 0x10(%rcx)
140165a6f:     	movups	%xmm0, (%rcx)
140165a72:     	movq	0x2c0(%rbp), %r15
140165a79:     	movq	0x2d8(%rbp), %rbx
140165a80:     	movq	0x2e0(%rbp), %rsi
140165a87:     	testq	%rbx, %rbx
140165a8a:     	je	0x140165c0e <.text+0x164c0e>
140165a90:     	movq	$0x3, 0xe0(%rbp)
140165a9b:     	movq	%r12, 0xe8(%rbp)
140165aa2:     	movups	(%rbp), %xmm0
140165aa6:     	movups	0x10(%rbp), %xmm1
140165aaa:     	movups	0x20(%rbp), %xmm2
140165aae:     	movups	%xmm2, 0x18(%rdi)
140165ab2:     	movups	%xmm1, 0x8(%rdi)
140165ab6:     	movups	%xmm0, -0x8(%rdi)
140165aba:     	movl	$0x0, 0x120(%rbp)
140165ac4:     	movb	$0x2, 0x124(%rbp)
140165acb:     	movups	0x3ab(%rbp), %xmm0
140165ad2:     	movups	%xmm0, 0x88(%rdi)
140165ad9:     	movups	0x3a0(%rbp), %xmm0
140165ae0:     	movups	%xmm0, 0x7d(%rdi)
140165ae4:     	movups	0x390(%rbp), %xmm0
140165aeb:     	movups	%xmm0, 0x6d(%rdi)
140165aef:     	movups	0x350(%rbp), %xmm0
140165af6:     	movups	0x360(%rbp), %xmm1
140165afd:     	movups	0x370(%rbp), %xmm2
140165b04:     	movups	0x380(%rbp), %xmm3
140165b0b:     	movups	%xmm3, 0x5d(%rdi)
140165b0f:     	movups	%xmm2, 0x4d(%rdi)
140165b13:     	movups	%xmm1, 0x3d(%rdi)
140165b17:     	movups	%xmm0, 0x2d(%rdi)
140165b1b:     	movb	$0x0, 0x190(%rbp)
140165b22:     	movq	%r15, 0x198(%rbp)
140165b29:     	movq	(%rbx), %rax
140165b2c:     	movq	0x10(%rbx), %r13
140165b30:     	subq	%r13, %rax
140165b33:     	cmpq	$0xc7, %rax
140165b39:     	jbe	0x14016626d <.text+0x16526d>
140165b3f:     	movq	0x8(%rbx), %rax
140165b43:     	leaq	0x11ee6(%rip), %rcx     # 0x140177a30 <.text+0x176a30>
140165b4a:     	movq	%rcx, (%rax,%r13)
140165b4e:     	movq	$0x3, 0x8(%rax,%r13)
140165b57:     	movq	%r12, 0x10(%rax,%r13)
140165b5c:     	movups	(%rbp), %xmm0
140165b60:     	movups	0x10(%rbp), %xmm1
140165b64:     	movups	0x20(%rbp), %xmm2
140165b68:     	movups	%xmm0, 0x18(%rax,%r13)
140165b6e:     	movups	%xmm1, 0x28(%rax,%r13)
140165b74:     	movups	%xmm2, 0x38(%rax,%r13)
140165b7a:     	movl	$0x0, 0x48(%rax,%r13)
140165b83:     	movb	$0x2, 0x4c(%rax,%r13)
140165b89:     	movups	0x350(%rbp), %xmm0
140165b90:     	movups	0x360(%rbp), %xmm1
140165b97:     	movups	0x370(%rbp), %xmm2
140165b9e:     	movups	0x380(%rbp), %xmm3
140165ba5:     	movups	%xmm0, 0x4d(%rax,%r13)
140165bab:     	movups	%xmm1, 0x5d(%rax,%r13)
140165bb1:     	movups	%xmm2, 0x6d(%rax,%r13)
140165bb7:     	movups	%xmm3, 0x7d(%rax,%r13)
140165bbd:     	movups	0x390(%rbp), %xmm0
140165bc4:     	movups	%xmm0, 0x8d(%rax,%r13)
140165bcd:     	movups	0x3a0(%rbp), %xmm0
140165bd4:     	movups	%xmm0, 0x9d(%rax,%r13)
140165bdd:     	movups	0x3ab(%rbp), %xmm0
140165be4:     	movups	%xmm0, 0xa8(%rax,%r13)
140165bed:     	movb	$0x0, 0xb8(%rax,%r13)
140165bf6:     	movq	%r15, 0xc0(%rax,%r13)
140165bfe:     	addq	$0xc8, %r13
140165c05:     	movq	%r13, 0x10(%rbx)
140165c09:     	jmp	0x140165d87 <.text+0x164d87>
140165c0e:     	movq	$0x3, 0xe0(%rbp)
140165c19:     	movq	%r12, 0xe8(%rbp)
140165c20:     	movups	(%rbp), %xmm0
140165c24:     	movups	0x10(%rbp), %xmm1
140165c28:     	movups	0x20(%rbp), %xmm2
140165c2c:     	movups	%xmm2, 0x18(%rdi)
140165c30:     	movups	%xmm1, 0x8(%rdi)
140165c34:     	movups	%xmm0, -0x8(%rdi)
140165c38:     	movl	$0x0, 0x120(%rbp)
140165c42:     	movb	$0x2, 0x124(%rbp)
140165c49:     	movups	0x3ab(%rbp), %xmm0
140165c50:     	movups	%xmm0, 0x88(%rdi)
140165c57:     	movups	0x3a0(%rbp), %xmm0
140165c5e:     	movups	%xmm0, 0x7d(%rdi)
140165c62:     	movups	0x390(%rbp), %xmm0
140165c69:     	movups	%xmm0, 0x6d(%rdi)
140165c6d:     	movups	0x350(%rbp), %xmm0
140165c74:     	movups	0x360(%rbp), %xmm1
140165c7b:     	movups	0x370(%rbp), %xmm2
140165c82:     	movups	0x380(%rbp), %xmm3
140165c89:     	movups	%xmm3, 0x5d(%rdi)
140165c8d:     	movups	%xmm2, 0x4d(%rdi)
140165c91:     	movups	%xmm1, 0x3d(%rdi)
140165c95:     	movups	%xmm0, 0x2d(%rdi)
140165c99:     	movb	$0x0, 0x190(%rbp)
140165ca0:     	movq	%r15, 0x198(%rbp)
140165ca7:     	movq	(%rsi), %rax
140165caa:     	movq	0x10(%rsi), %r13
140165cae:     	subq	%r13, %rax
140165cb1:     	cmpq	$0xc7, %rax
140165cb7:     	jbe	0x1401662b9 <.text+0x1652b9>
140165cbd:     	movq	0x8(%rsi), %rax
140165cc1:     	leaq	0x11d68(%rip), %rcx     # 0x140177a30 <.text+0x176a30>
140165cc8:     	movq	%rcx, (%rax,%r13)
140165ccc:     	movq	$0x3, 0x8(%rax,%r13)
140165cd5:     	movq	%r12, 0x10(%rax,%r13)
140165cda:     	movups	(%rbp), %xmm0
140165cde:     	movups	0x10(%rbp), %xmm1
140165ce2:     	movups	0x20(%rbp), %xmm2
140165ce6:     	movups	%xmm0, 0x18(%rax,%r13)
140165cec:     	movups	%xmm1, 0x28(%rax,%r13)
140165cf2:     	movups	%xmm2, 0x38(%rax,%r13)
140165cf8:     	movl	$0x0, 0x48(%rax,%r13)
140165d01:     	movb	$0x2, 0x4c(%rax,%r13)
140165d07:     	movups	0x350(%rbp), %xmm0
140165d0e:     	movups	0x360(%rbp), %xmm1
140165d15:     	movups	0x370(%rbp), %xmm2
140165d1c:     	movups	0x380(%rbp), %xmm3
140165d23:     	movups	%xmm0, 0x4d(%rax,%r13)
140165d29:     	movups	%xmm1, 0x5d(%rax,%r13)
140165d2f:     	movups	%xmm2, 0x6d(%rax,%r13)
140165d35:     	movups	%xmm3, 0x7d(%rax,%r13)
140165d3b:     	movups	0x390(%rbp), %xmm0
140165d42:     	movups	%xmm0, 0x8d(%rax,%r13)
140165d4b:     	movups	0x3a0(%rbp), %xmm0
140165d52:     	movups	%xmm0, 0x9d(%rax,%r13)
140165d5b:     	movups	0x3ab(%rbp), %xmm0
140165d62:     	movups	%xmm0, 0xa8(%rax,%r13)
140165d6b:     	movb	$0x0, 0xb8(%rax,%r13)
140165d74:     	movq	%r15, 0xc0(%rax,%r13)
140165d7c:     	addq	$0xc8, %r13
140165d83:     	movq	%r13, 0x10(%rsi)
140165d87:     	leaq	0x3e4(%rbp), %r13
140165d8e:     	movq	%r15, 0x4c8(%rbp)
140165d95:     	movq	%r15, 0x3d0(%rbp)
140165d9c:     	movups	0x2c8(%rbp), %xmm0
140165da3:     	movups	%xmm0, 0x3d8(%rbp)
140165daa:     	movq	%rbx, 0x3e8(%rbp)
140165db1:     	movq	0x2e8(%rbp), %rax
140165db8:     	movq	%rsi, 0x3f0(%rbp)
140165dbf:     	movq	%rax, 0x3f8(%rbp)
140165dc6:     	cmpq	%r14, %r12
140165dc9:     	jne	0x140165de0 <.text+0x164de0>
140165dcb:     	movups	0x57da92a(%rip), %xmm0  # 0x1459406fc
140165dd2:     	jmp	0x140165de7 <.text+0x164de7>
140165dd4:     	nopw	%cs:(%rax,%rax)
140165de0:     	movups	0x57da8a1(%rip), %xmm0  # 0x145940688
140165de7:     	movaps	%xmm0, 0x430(%rbp)
140165dee:     	movl	$0x3f800000, 0x440(%rbp) # imm = 0x3F800000
140165df8:     	movq	0x490(%rbp), %rbx
140165dff:     	movq	0x488(%rbp), %r15
140165e06:     	movl	$0x8, %edx
140165e0b:     	leaq	0x57dca73(%rip), %rcx   # 0x145942885
140165e12:     	callq	0x145457c00 <.text+0x5456c00>
140165e17:     	nop
140165e18:     	movq	%rdx, %r8
140165e1b:     	incq	%r12
140165e1e:     	movq	%r12, 0x310(%rbp)
140165e25:     	leaq	0x57db2f0(%rip), %rcx   # 0x14594111c
140165e2c:     	movq	%rcx, 0x458(%rbp)
140165e33:     	movq	$0x1, 0x460(%rbp)
140165e3e:     	leaq	0x310(%rbp), %rcx
140165e45:     	movq	%rcx, 0x468(%rbp)
140165e4c:     	leaq	0x57daae5(%rip), %rcx   # 0x145940938
140165e53:     	movq	%rcx, 0x470(%rbp)
140165e5a:     	movq	$0x1, 0x20(%rsp)
140165e63:     	movq	%rbp, %rcx
140165e66:     	movq	%rax, %rdx
140165e69:     	leaq	0x458(%rbp), %r9
140165e70:     	callq	0x145458060 <.text+0x5457060>
140165e75:     	nop
140165e76:     	cmpb	$0x1, (%rbx)
140165e79:     	jne	0x140165ea0 <.text+0x164ea0>
140165e7b:     	movq	0x478(%rbp), %rcx
140165e82:     	movl	(%rcx), %eax
140165e84:     	movl	0x3(%rcx), %ecx
140165e87:     	movl	%ecx, 0x49b(%rbp)
140165e8d:     	movl	%eax, 0x498(%rbp)
140165e93:     	movq	0x8(%rbx), %rax
140165e97:     	movzbl	0x10(%rbx), %edx
140165e9b:     	movb	$0x1, %cl
140165e9d:     	jmp	0x140165eb0 <.text+0x164eb0>
140165e9f:     	nop
140165ea0:     	movq	0x8(%rbx), %rax
140165ea4:     	lock
140165ea5:     	incq	(%rax)
140165ea8:     	jle	0x140166314 <.text+0x165314>
140165eae:     	xorl	%ecx, %ecx
140165eb0:     	movq	0x10(%rbp), %r8
140165eb4:     	leaq	0xe8(%rbp), %r9
140165ebb:     	movq	%r8, 0x10(%r9)
140165ebf:     	movups	(%rbp), %xmm0
140165ec3:     	movups	%xmm0, (%r9)
140165ec7:     	movl	0x498(%rbp), %r8d
140165ece:     	movl	0x49b(%rbp), %r9d
140165ed5:     	movl	%r9d, 0x24(%rdi)
140165ed9:     	movl	%r8d, 0x21(%rdi)
140165edd:     	movl	0x440(%rbp), %r8d
140165ee4:     	leaq	0x3bc(%rbp), %r9
140165eeb:     	movl	%r8d, 0x10(%r9)
140165eef:     	movaps	0x430(%rbp), %xmm0
140165ef6:     	movups	%xmm0, (%r9)
140165efa:     	movq	$0x0, 0x100(%rbp)
140165f05:     	movq	$0x4, 0x108(%rbp)
140165f10:     	movq	$0x0, 0x110(%rbp)
140165f1b:     	movb	%cl, 0x118(%rbp)
140165f21:     	movq	%rax, 0x120(%rbp)
140165f28:     	movq	%rdx, 0x128(%rbp)
140165f2f:     	movl	$0x41600000, 0x130(%rbp) # imm = 0x41600000
140165f39:     	movw	$0x190, 0x134(%rbp)     # imm = 0x190
140165f42:     	movb	$0x1, 0x136(%rbp)
140165f49:     	movq	0x3c8(%rbp), %rax
140165f50:     	movq	%rax, 0x4c(%rdi)
140165f54:     	movups	0x3bb(%rbp), %xmm0
140165f5b:     	movups	%xmm0, 0x3f(%rdi)
140165f5f:     	movl	0x57b321a(%rip), %r14d  # 0x145919180
140165f66:     	movl	%r14d, 0x64(%rdi)
140165f6a:     	movups	0x57b31fe(%rip), %xmm14 # 0x145919170
140165f72:     	movups	%xmm14, 0x54(%rdi)
140165f77:     	movsd	%xmm13, 0x160(%rbp)
140165f80:     	movq	0x4c8(%rbp), %rax
140165f87:     	movq	%rax, 0xe0(%rbp)
140165f8e:     	movq	%rbp, %rcx
140165f91:     	leaq	0x3d8(%rbp), %rdx
140165f98:     	leaq	0xe0(%rbp), %r8
140165f9f:     	callq	0x1400dbfa0 <.text+0xdafa0>
140165fa4:     	nop
140165fa5:     	leaq	0x318(%rbp), %rcx
140165fac:     	callq	0x145483610 <.text+0x5482610>
140165fb1:     	nop
140165fb2:     	testl	%eax, %eax
140165fb4:     	je	0x140166050 <.text+0x165050>
140165fba:     	leaq	0x44c(%rbp), %rax
140165fc1:     	movq	%rax, 0xe0(%rbp)
140165fc8:     	leaq	0x55d4481(%rip), %rcx   # 0x14573a450 <.text+0x5739450>
140165fcf:     	movq	%rcx, 0xe8(%rbp)
140165fd6:     	leaq	0x450(%rbp), %rax
140165fdd:     	movq	%rax, 0xf0(%rbp)
140165fe4:     	movq	%rcx, 0xf8(%rbp)
140165feb:     	leaq	0x454(%rbp), %rax
140165ff2:     	movq	%rax, 0x100(%rbp)
140165ff9:     	movq	%rcx, 0x108(%rbp)
140166000:     	leaq	0x458(%rbp), %rcx
140166007:     	leaq	0x57dc884(%rip), %rdx   # 0x145942892
14016600e:     	leaq	0xe0(%rbp), %r8
140166015:     	callq	0x145728390 <.text+0x5727390>
14016601a:     	nop
14016601b:     	cmpb	$0x1, (%rbx)
14016601e:     	jne	0x14016614f <.text+0x16514f>
140166024:     	movq	0x478(%rbp), %rcx
14016602b:     	movl	(%rcx), %eax
14016602d:     	movl	0x3(%rcx), %ecx
140166030:     	movl	%ecx, 0x3(%rbp)
140166033:     	movl	%eax, (%rbp)
140166036:     	movq	0x8(%rbx), %rax
14016603a:     	movzbl	0x10(%rbx), %edx
14016603e:     	movb	$0x1, %cl
140166040:     	jmp	0x14016615f <.text+0x16515f>
140166045:     	nopw	%cs:(%rax,%rax)
140166050:     	movl	$0x5, %edx
140166055:     	leaq	0x57dc831(%rip), %rcx   # 0x14594288d
14016605c:     	callq	0x145457c00 <.text+0x5456c00>
140166061:     	nop
140166062:     	movq	%rdx, %rsi
140166065:     	testq	%rdx, %rdx
140166068:     	js	0x140166305 <.text+0x165305>
14016606e:     	testq	%rsi, %rsi
140166071:     	je	0x14016611d <.text+0x16511d>
140166077:     	movq	%rax, %rbx
14016607a:     	callq	0x140002200 <.text+0x1200>
14016607f:     	movl	$0x1, %edx
140166084:     	movq	%rsi, %rcx
140166087:     	callq	0x1400021c0 <.text+0x11c0>
14016608c:     	testq	%rax, %rax
14016608f:     	je	0x140166377 <.text+0x165377>
140166095:     	movq	%rax, %r15
140166098:     	movq	%rax, %rcx
14016609b:     	movq	%rbx, %rdx
14016609e:     	movq	%rsi, %r8
1401660a1:     	callq	0x1457731ed <.text+0x57721ed>
1401660a6:     	movq	0x490(%rbp), %rbx
1401660ad:     	jmp	0x140166123 <.text+0x165123>
1401660af:     	movq	(%rsi), %rax
1401660b2:     	movq	0x10(%rsi), %rbx
1401660b6:     	subq	%rbx, %rax
1401660b9:     	cmpq	$0x47, %rax
1401660bd:     	jbe	0x1401662df <.text+0x1652df>
1401660c3:     	movq	0x8(%rsi), %rax
1401660c7:     	leaq	0x113b2(%rip), %rcx     # 0x140177480 <.text+0x176480>
1401660ce:     	movq	%rcx, (%rax,%rbx)
1401660d2:     	movl	$0x0, 0x8(%rax,%rbx)
1401660da:     	movups	%xmm12, 0xc(%rax,%rbx)
1401660e0:     	movq	0x4d0(%rbp), %rcx
1401660e7:     	movq	%rcx, 0x20(%rax,%rbx)
1401660ec:     	movq	0x4c0(%rbp), %rcx
1401660f3:     	movq	%rcx, 0x28(%rax,%rbx)
1401660f8:     	movq	%r15, 0x30(%rax,%rbx)
1401660fd:     	movb	$0x0, 0x38(%rax,%rbx)
140166102:     	movq	0x4c8(%rbp), %r15
140166109:     	movq	%r15, 0x40(%rax,%rbx)
14016610e:     	addq	$0x48, %rbx
140166112:     	movq	%rbx, 0x10(%rsi)
140166116:     	xorl	%ebx, %ebx
140166118:     	jmp	0x140165d8e <.text+0x164d8e>
14016611d:     	movl	$0x1, %r15d
140166123:     	movq	%rsi, 0x458(%rbp)
14016612a:     	movq	%r15, 0x480(%rbp)
140166131:     	movq	%r15, 0x460(%rbp)
140166138:     	movq	%rsi, 0x468(%rbp)
14016613f:     	movq	0x488(%rbp), %r15
140166146:     	cmpb	$0x1, (%rbx)
140166149:     	je	0x140166024 <.text+0x165024>
14016614f:     	movq	0x8(%rbx), %rax
140166153:     	lock
140166154:     	incq	(%rax)
140166157:     	jle	0x140166314 <.text+0x165314>
14016615d:     	xorl	%ecx, %ecx
14016615f:     	movq	0x468(%rbp), %r8
140166166:     	leaq	0xe8(%rbp), %r9
14016616d:     	movq	%r8, 0x10(%r9)
140166171:     	movups	0x458(%rbp), %xmm0
140166178:     	movups	%xmm0, (%r9)
14016617c:     	movl	(%rbp), %r8d
140166180:     	movl	0x3(%rbp), %r9d
140166184:     	movl	%r9d, 0x24(%rdi)
140166188:     	movl	%r8d, 0x21(%rdi)
14016618c:     	movups	0x57da539(%rip), %xmm0  # 0x1459406cc
140166193:     	leaq	0x3bc(%rbp), %r8
14016619a:     	movups	%xmm0, (%r8)
14016619e:     	movl	$0x3f800000, 0x10(%r8)  # imm = 0x3F800000
1401661a6:     	movq	$0x0, 0x100(%rbp)
1401661b1:     	movq	$0x4, 0x108(%rbp)
1401661bc:     	movq	$0x0, 0x110(%rbp)
1401661c7:     	movb	%cl, 0x118(%rbp)
1401661cd:     	movq	%rax, 0x120(%rbp)
1401661d4:     	movq	%rdx, 0x128(%rbp)
1401661db:     	movl	$0x41300000, 0x130(%rbp) # imm = 0x41300000
1401661e5:     	movw	$0x190, 0x134(%rbp)     # imm = 0x190
1401661ee:     	movb	$0x1, 0x136(%rbp)
1401661f5:     	movq	0x3c8(%rbp), %rax
1401661fc:     	movq	%rax, 0x4c(%rdi)
140166200:     	movups	0x3bb(%rbp), %xmm0
140166207:     	movups	%xmm0, 0x3f(%rdi)
14016620b:     	movl	%r14d, 0x64(%rdi)
14016620f:     	movups	%xmm14, 0x54(%rdi)
140166214:     	movsd	%xmm13, 0x160(%rbp)
14016621d:     	movq	0x4c8(%rbp), %rax
140166224:     	movq	%rax, 0xe0(%rbp)
14016622b:     	movq	%rbp, %rcx
14016622e:     	leaq	0x3d8(%rbp), %rdx
140166235:     	leaq	0xe0(%rbp), %r8
14016623c:     	callq	0x1400dbfa0 <.text+0xdafa0>
140166241:     	nop
140166242:     	movq	0x318(%rbp), %rdx
140166249:     	testq	%rdx, %rdx
14016624c:     	je	0x14016555c <.text+0x16455c>
140166252:     	movq	0x320(%rbp), %rcx
140166259:     	shlq	$0x4, %rdx
14016625d:     	movl	$0x8, %r8d
140166263:     	callq	0x1400021d0 <.text+0x11d0>
140166268:     	jmp	0x14016555c <.text+0x16455c>
14016626d:     	movq	$0x1, 0x20(%rsp)
140166276:     	movl	$0xc8, %r8d
14016627c:     	movl	$0x1, %r9d
140166282:     	movq	%rbx, %rcx
140166285:     	movq	%r13, %rdx
140166288:     	callq	0x1457744b0 <.text+0x57734b0>
14016628d:     	nop
14016628e:     	jmp	0x140165b3f <.text+0x164b3f>
140166293:     	movq	$0x1, 0x20(%rsp)
14016629c:     	movl	$0x48, %r8d
1401662a2:     	movl	$0x1, %r9d
1401662a8:     	movq	%rbx, %rcx
1401662ab:     	movq	%r13, %rdx
1401662ae:     	callq	0x1457744b0 <.text+0x57734b0>
1401662b3:     	nop
1401662b4:     	jmp	0x14016595f <.text+0x16495f>
1401662b9:     	movq	$0x1, 0x20(%rsp)
1401662c2:     	movl	$0xc8, %r8d
1401662c8:     	movl	$0x1, %r9d
1401662ce:     	movq	%rsi, %rcx
1401662d1:     	movq	%r13, %rdx
1401662d4:     	callq	0x1457744b0 <.text+0x57734b0>
1401662d9:     	nop
1401662da:     	jmp	0x140165cbd <.text+0x164cbd>
1401662df:     	movq	$0x1, 0x20(%rsp)
1401662e8:     	movl	$0x48, %r8d
1401662ee:     	movl	$0x1, %r9d
1401662f4:     	movq	%rsi, %rcx
1401662f7:     	movq	%rbx, %rdx
1401662fa:     	callq	0x1457744b0 <.text+0x57734b0>
1401662ff:     	nop
140166300:     	jmp	0x1401660c3 <.text+0x1650c3>
140166305:     	xorl	%ecx, %ecx
140166307:     	movq	0x480(%rbp), %rdx
14016630e:     	callq	0x14590379b <.text+0x590279b>
140166313:     	nop
140166314:     	ud2
140166316:     	movq	0x348(%rbp), %rax
14016631d:     	movaps	0x4e0(%rbp), %xmm6
140166324:     	movaps	0x4f0(%rbp), %xmm7
14016632b:     	movaps	0x500(%rbp), %xmm8
140166333:     	movaps	0x510(%rbp), %xmm9
14016633b:     	movaps	0x520(%rbp), %xmm10
140166343:     	movaps	0x530(%rbp), %xmm11
14016634b:     	movaps	0x540(%rbp), %xmm12
140166353:     	movaps	0x550(%rbp), %xmm13
14016635b:     	movaps	0x560(%rbp), %xmm14
140166363:     	addq	$0x5f8, %rsp            # imm = 0x5F8
14016636a:     	popq	%rbx
14016636b:     	popq	%rdi
14016636c:     	popq	%rsi
14016636d:     	popq	%r12
14016636f:     	popq	%r13
140166371:     	popq	%r14
140166373:     	popq	%r15
140166375:     	popq	%rbp
140166376:     	retq
140166377:     	movq	%rsi, 0x480(%rbp)
14016637e:     	movl	$0x1, %ecx
140166383:     	jmp	0x140166307 <.text+0x165307>
