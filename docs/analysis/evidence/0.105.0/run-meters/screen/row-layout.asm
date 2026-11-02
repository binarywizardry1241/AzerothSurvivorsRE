
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d0f90:     	movups	%xmm0, -0x30(%rbp)
1401d0f94:     	movq	0x10(%r14), %rbx
1401d0f98:     	movq	0x18(%r14), %rsi
1401d0f9c:     	movsd	0x20(%r14), %xmm8
1401d0fa2:     	movzbl	0x28(%r14), %r13d
1401d0fa7:     	movq	0x618(%rbp), %rdi
1401d0fae:     	movl	%edi, %eax
1401d0fb0:     	andl	$0x7, %eax
1401d0fb3:     	leaq	(%rax,%rax,4), %rax
1401d0fb7:     	leaq	0x5bea366(%rip), %rdx   # 0x145dbb324
1401d0fbe:     	movl	0x10(%rdx,%rax,4), %ecx
1401d0fc2:     	movl	%ecx, 0x240(%rbp)
1401d0fc8:     	movups	(%rdx,%rax,4), %xmm0
1401d0fcc:     	movaps	%xmm0, 0x230(%rbp)
1401d0fd3:     	movups	0x5be78a6(%rip), %xmm0  # 0x145db8880
1401d0fda:     	movaps	%xmm0, 0x520(%rbp)
1401d0fe1:     	movq	$0x0, 0x530(%rbp)
1401d0fec:     	movups	0x5be78a5(%rip), %xmm0  # 0x145db8898
1401d0ff3:     	leaq	0x538(%rbp), %rax
1401d0ffa:     	movups	%xmm0, (%rax)
1401d0ffd:     	movq	$0x0, 0x10(%rax)
1401d1005:     	movups	0x5be78a4(%rip), %xmm0  # 0x145db88b0
1401d100c:     	movups	%xmm0, 0x18(%rax)
1401d1010:     	movq	$0x0, 0x28(%rax)
1401d1018:     	movups	0x5be78a9(%rip), %xmm0  # 0x145db88c8
1401d101f:     	movups	%xmm0, 0x30(%rax)
1401d1023:     	movq	$0x0, 0x40(%rax)
1401d102b:     	movaps	0x520(%rbp), %xmm0
1401d1032:     	movq	0x530(%rbp), %rax
1401d1039:     	movq	0x538(%rbp), %rcx
1401d1040:     	movaps	0x540(%rbp), %xmm1
1401d1047:     	movaps	0x550(%rbp), %xmm2
1401d104e:     	movaps	%xmm0, 0x40(%rbp)
1401d1052:     	movq	%rax, 0x50(%rbp)
1401d1056:     	movq	%rcx, 0x58(%rbp)
1401d105a:     	movaps	%xmm1, 0x60(%rbp)
1401d105e:     	movaps	%xmm2, 0x70(%rbp)
1401d1062:     	movaps	0x560(%rbp), %xmm0
1401d1069:     	movaps	%xmm0, 0x80(%rbp)
1401d1070:     	movaps	0x570(%rbp), %xmm0
1401d1077:     	movaps	%xmm0, 0x90(%rbp)
1401d107e:     	leaq	0xd0(%rbp), %r12
1401d1085:     	movupd	%xmm13, -0x10(%r12)
1401d108c:     	movupd	%xmm13, -0x20(%r12)
1401d1093:     	movupd	%xmm13, -0x30(%r12)
1401d109a:     	movupd	%xmm13, 0x48(%r15)
1401d10a0:     	movupd	%xmm13, 0x38(%r15)
1401d10a6:     	movl	$0x90, %r8d
1401d10ac:     	leaq	0x308(%rbp), %rcx
1401d10b3:     	leaq	0x40(%rbp), %rdx
1401d10b7:     	callq	0x145bc977b <.text+0x5bc877b>
1401d10bc:     	movabsq	$0x4190000000000001, %rax # imm = 0x4190000000000001
1401d10c6:     	movq	%rax, 0x398(%rbp)
1401d10cd:     	movups	0x5be7863(%rip), %xmm9  # 0x145db8938
1401d10d5:     	movups	%xmm9, 0x58(%r15)
1401d10da:     	movupd	0x5be7865(%rip), %xmm14 # 0x145db8948
1401d10e3:     	movupd	%xmm14, 0x68(%r15)
1401d10e9:     	movaps	0x5b9c570(%rip), %xmm0  # 0x145d6d660
1401d10f0:     	movups	%xmm0, 0x3e0(%rbp)
1401d10f7:     	movaps	0x5b9c211(%rip), %xmm10 # 0x145d6d310
1401d10ff:     	movups	%xmm10, 0x3f0(%rbp)
1401d1107:     	movups	0x5be7869(%rip), %xmm15 # 0x145db8978
1401d110f:     	movups	%xmm15, 0x98(%r15)
1401d1117:     	movups	0x5be786a(%rip), %xmm7  # 0x145db8988
1401d111e:     	movups	%xmm7, 0xa8(%r15)
1401d1126:     	movaps	0x5b9c2d3(%rip), %xmm0  # 0x145d6d400
1401d112d:     	movups	%xmm0, 0x420(%rbp)
1401d1134:     	movups	%xmm0, 0x430(%rbp)
1401d113b:     	movaps	0x5b9c11e(%rip), %xmm6  # 0x145d6d260
1401d1142:     	movups	%xmm6, 0x440(%rbp)
1401d1149:     	movl	$0x1, 0x450(%rbp)
1401d1153:     	movss	0x5ba2cb5(%rip), %xmm0  # 0x145d73e10
1401d115b:     	movlps	%xmm0, 0x454(%rbp)
1401d1162:     	movb	$0x1, 0x45c(%rbp)
1401d1169:     	movq	$0x0, 0x460(%rbp)
1401d1174:     	movl	$0x0, 0x468(%rbp)
1401d117e:     	movw	$0x101, 0x46c(%rbp)     # imm = 0x101
1401d1187:     	movw	$0x0, 0x10a(%r15)
1401d1191:     	movl	$0x10000, 0x106(%r15)   # imm = 0x10000
1401d119c:     	movw	$0x0, 0x110(%r15)
1401d11a6:     	movl	$0x10000, 0x10c(%r15)   # imm = 0x10000
1401d11b1:     	movq	$0x0, 0x47a(%rbp)
1401d11bc:     	movl	$0x5, 0x482(%rbp)
1401d11c6:     	movq	%rdi, 0x488(%rbp)
1401d11cd:     	movl	$0x0, 0x490(%rbp)
1401d11d7:     	movaps	0x5be6eb2(%rip), %xmm0  # 0x145db8090
1401d11de:     	movups	%xmm0, 0x494(%rbp)
1401d11e5:     	movb	$0x2, 0x4a4(%rbp)
1401d11ec:     	movq	0x2f0(%rbp), %rax
1401d11f3:     	movq	%rax, 0x300(%rbp)
1401d11fa:     	leaq	-0x60(%rbp), %rcx
1401d11fe:     	leaq	-0x18(%rbp), %rdx
1401d1202:     	leaq	0x300(%rbp), %r8
1401d1209:     	callq	0x140194a00 <.text+0x193a00>
1401d120e:     	movq	-0x60(%rbp), %rcx
1401d1212:     	movq	-0x38(%rbp), %rax
1401d1216:     	movq	%rcx, 0x5e8(%rbp)
1401d121d:     	movq	%rcx, 0x10(%rbp)
1401d1221:     	movups	-0x58(%rbp), %xmm0
1401d1225:     	movups	%xmm0, 0x18(%rbp)
1401d1229:     	movups	-0x48(%rbp), %xmm0
1401d122d:     	movups	%xmm0, 0x28(%rbp)
1401d1231:     	movq	%rax, 0x38(%rbp)
1401d1235:     	movapd	%xmm8, %xmm11
1401d123a:     	mulsd	0x5bccb75(%rip), %xmm11 # 0x145d9ddb8
1401d1243:     	movapd	%xmm11, %xmm0
1401d1248:     	movq	0x2d8(%rbp), %rax
1401d124f:     	divsd	(%rax), %xmm0
1401d1253:     	cvtsd2ss	%xmm0, %xmm0
1401d1257:     	movw	$0x0, 0x1a4(%rbp)
1401d1260:     	movb	$0x1, 0x194(%rbp)
1401d1267:     	movss	0x5be6e11(%rip), %xmm1  # 0x145db8080
1401d126f:     	movups	%xmm1, 0xa8(%rbp)
1401d1276:     	movups	%xmm10, 0xb8(%rbp)
1401d127e:     	movl	$0x2, 0xc8(%rbp)
1401d1288:     	movss	%xmm0, 0xcc(%rbp)
1401d1290:     	movq	$0x0, 0xa0(%rbp)
1401d129b:     	movupd	%xmm13, 0x10(%r12)
1401d12a2:     	movupd	%xmm13, (%r12)
1401d12a8:     	movq	$0x0, 0x20(%r12)
1401d12b1:     	movw	$0x0, 0xec(%r12)
1401d12bc:     	movl	$0x0, 0xe8(%r12)
1401d12c8:     	movapd	%xmm14, %xmm13
1401d12cd:     	movupd	%xmm14, 0x38(%r12)
1401d12d4:     	movaps	%xmm7, %xmm0
1401d12d7:     	movups	0x5be75ea(%rip), %xmm7  # 0x145db88c8
1401d12de:     	movups	%xmm9, 0x28(%r12)
