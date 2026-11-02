AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b0ea0:     	pushq	%r15
1459b0ea2:     	pushq	%r14
1459b0ea4:     	pushq	%rsi
1459b0ea5:     	pushq	%rdi
1459b0ea6:     	pushq	%rbp
1459b0ea7:     	pushq	%rbx
1459b0ea8:     	movq	%rdx, %r8
1459b0eab:     	movq	0x8(%rdx), %r10
1459b0eaf:     	movq	0x10(%rdx), %r11
1459b0eb3:     	movq	(%rcx), %rsi
1459b0eb6:     	movq	0x10(%rcx), %rdi
1459b0eba:     	testq	%rdi, %rdi
1459b0ebd:     	je	0x1459b1030 <.text+0x59b0030>
1459b0ec3:     	movq	0x18(%rcx), %r9
1459b0ec7:     	cmpq	%r9, %rdi
1459b0eca:     	je	0x1459b1030 <.text+0x59b0030>
1459b0ed0:     	subq	%rdi, %r9
1459b0ed3:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1459b0edd:     	movq	%r9, %rax
1459b0ee0:     	mulq	%rdx
1459b0ee3:     	shrq	$0x4, %rdx
1459b0ee7:     	cmpq	$0x1f8, %r9             # imm = 0x1F8
1459b0eee:     	jb	0x1459b0f0d <.text+0x59aff0d>
1459b0ef0:     	leaq	(%r11,%r10,4), %rax
1459b0ef4:     	addq	%rdi, %r9
1459b0ef7:     	addq	$-0x14, %r9
1459b0efb:     	cmpq	%r9, %rax
1459b0efe:     	jae	0x1459b0f14 <.text+0x59aff14>
1459b0f00:     	leaq	(%r10,%rdx), %rax
1459b0f04:     	leaq	(%r11,%rax,4), %rax
1459b0f08:     	cmpq	%rax, %rdi
1459b0f0b:     	jae	0x1459b0f14 <.text+0x59aff14>
1459b0f0d:     	xorl	%eax, %eax
1459b0f0f:     	jmp	0x1459b0fa2 <.text+0x59affa2>
1459b0f14:     	leaq	(,%r10,4), %r9
1459b0f1c:     	movl	%edx, %eax
1459b0f1e:     	andl	$0x7, %eax
1459b0f21:     	movl	$0x8, %ebx
1459b0f26:     	cmovneq	%rax, %rbx
1459b0f2a:     	movq	%rdx, %rax
1459b0f2d:     	subq	%rbx, %rax
1459b0f30:     	addq	%rax, %r10
1459b0f33:     	addq	%r11, %r9
1459b0f36:     	addq	$0x10, %r9
1459b0f3a:     	xorl	%ebx, %ebx
1459b0f3c:     	movq	%rdi, %r14
1459b0f3f:     	nop
1459b0f40:     	movss	0x48(%r14), %xmm0
1459b0f46:     	movss	0x30(%r14), %xmm1
1459b0f4c:     	unpcklps	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
1459b0f4f:     	movss	0x18(%r14), %xmm0
1459b0f55:     	movss	(%r14), %xmm2
1459b0f5a:     	unpcklps	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
1459b0f5d:     	movlhps	%xmm1, %xmm2            # xmm2 = xmm2[0],xmm1[0]
1459b0f60:     	movss	0xa8(%r14), %xmm0
1459b0f69:     	movss	0x90(%r14), %xmm1
1459b0f72:     	unpcklps	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
1459b0f75:     	movss	0x78(%r14), %xmm0
1459b0f7b:     	movss	0x60(%r14), %xmm3
1459b0f81:     	unpcklps	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
1459b0f84:     	movlhps	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0]
1459b0f87:     	movups	%xmm2, -0x10(%r9,%rbx,4)
1459b0f8d:     	movups	%xmm3, (%r9,%rbx,4)
1459b0f92:     	addq	$0x8, %rbx
1459b0f96:     	addq	$0xc0, %r14
1459b0f9d:     	cmpq	%rbx, %rax
1459b0fa0:     	jne	0x1459b0f40 <.text+0x59aff40>
1459b0fa2:     	movl	%edx, %r9d
1459b0fa5:     	subl	%eax, %r9d
1459b0fa8:     	andl	$0x3, %r9d
1459b0fac:     	je	0x1459b0fe9 <.text+0x59affe9>
1459b0fae:     	leaq	(%r11,%r10,4), %rbx
1459b0fb2:     	leaq	(%rax,%rax,2), %r14
1459b0fb6:     	leaq	(%rdi,%r14,8), %r15
1459b0fba:     	negq	%r9
1459b0fbd:     	xorl	%r14d, %r14d
1459b0fc0:     	movl	(%r15), %ebp
1459b0fc3:     	movl	%ebp, (%rbx)
1459b0fc5:     	decq	%r14
1459b0fc8:     	addq	$0x4, %rbx
1459b0fcc:     	addq	$0x18, %r15
1459b0fd0:     	cmpq	%r14, %r9
1459b0fd3:     	jne	0x1459b0fc0 <.text+0x59affc0>
1459b0fd5:     	subq	%r14, %r10
1459b0fd8:     	movq	%rax, %r9
1459b0fdb:     	subq	%r14, %r9
1459b0fde:     	subq	%rdx, %rax
1459b0fe1:     	cmpq	$-0x4, %rax
1459b0fe5:     	jbe	0x1459b0ff5 <.text+0x59afff5>
1459b0fe7:     	jmp	0x1459b1030 <.text+0x59b0030>
1459b0fe9:     	movq	%rax, %r9
1459b0fec:     	subq	%rdx, %rax
1459b0fef:     	cmpq	$-0x4, %rax
1459b0ff3:     	ja	0x1459b1030 <.text+0x59b0030>
1459b0ff5:     	leaq	(%r9,%r9,2), %rax
1459b0ff9:     	leaq	(%rdi,%rax,8), %rax
1459b0ffd:     	subq	%r9, %rdx
1459b1000:     	movl	(%rax), %r9d
1459b1003:     	movl	%r9d, (%r11,%r10,4)
1459b1007:     	movl	0x18(%rax), %r9d
1459b100b:     	movl	%r9d, 0x4(%r11,%r10,4)
1459b1010:     	movl	0x30(%rax), %r9d
1459b1014:     	movl	%r9d, 0x8(%r11,%r10,4)
1459b1019:     	movl	0x48(%rax), %r9d
1459b101d:     	movl	%r9d, 0xc(%r11,%r10,4)
1459b1022:     	addq	$0x4, %r10
1459b1026:     	addq	$0x60, %rax
1459b102a:     	addq	$-0x4, %rdx
1459b102e:     	jne	0x1459b1000 <.text+0x59b0000>
1459b1030:     	movq	0x20(%rcx), %rdi
1459b1034:     	testq	%rsi, %rsi
1459b1037:     	je	0x1459b10d0 <.text+0x59b00d0>
1459b103d:     	movq	0x8(%rcx), %r9
1459b1041:     	cmpq	%r9, %rsi
1459b1044:     	je	0x1459b10d0 <.text+0x59b00d0>
1459b104a:     	subq	%rsi, %r9
1459b104d:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1459b1057:     	movq	%r9, %rax
1459b105a:     	mulq	%rdx
1459b105d:     	cmpq	$0x30, %r9
1459b1061:     	jne	0x1459b1067 <.text+0x59b0067>
1459b1063:     	xorl	%eax, %eax
1459b1065:     	jmp	0x1459b10b4 <.text+0x59b00b4>
1459b1067:     	shrq	$0x5, %rdx
1459b106b:     	movq	%rdx, %r9
1459b106e:     	andq	$-0x2, %r9
1459b1072:     	xorl	%eax, %eax
1459b1074:     	movq	%rsi, %rbx
1459b1077:     	nopw	(%rax,%rax)
1459b1080:     	movl	(%rbx), %ebp
1459b1082:     	movl	%ebp, (%r11,%r10,4)
1459b1086:     	movl	0x18(%rbx), %ebp
1459b1089:     	movl	%ebp, 0x4(%r11,%r10,4)
1459b108e:     	movl	0x30(%rbx), %ebp
1459b1091:     	movl	%ebp, 0x8(%r11,%r10,4)
1459b1096:     	movl	0x48(%rbx), %ebp
1459b1099:     	movl	%ebp, 0xc(%r11,%r10,4)
1459b109e:     	addq	$0x4, %r10
1459b10a2:     	addq	$0x2, %rax
1459b10a6:     	addq	$0x60, %rbx
1459b10aa:     	cmpq	%rax, %r9
1459b10ad:     	jne	0x1459b1080 <.text+0x59b0080>
1459b10af:     	testb	$0x1, %dl
1459b10b2:     	je	0x1459b10d0 <.text+0x59b00d0>
1459b10b4:     	leaq	(%rax,%rax,2), %rax
1459b10b8:     	shlq	$0x4, %rax
1459b10bc:     	movl	(%rsi,%rax), %edx
1459b10bf:     	movl	%edx, (%r11,%r10,4)
1459b10c3:     	movl	0x18(%rsi,%rax), %eax
1459b10c7:     	movl	%eax, 0x4(%r11,%r10,4)
1459b10cc:     	addq	$0x2, %r10
1459b10d0:     	movq	(%r8), %r8
1459b10d3:     	testq	%rdi, %rdi
1459b10d6:     	je	0x1459b124c <.text+0x59b024c>
1459b10dc:     	movq	0x28(%rcx), %rcx
1459b10e0:     	cmpq	%rcx, %rdi
1459b10e3:     	je	0x1459b124c <.text+0x59b024c>
1459b10e9:     	subq	%rdi, %rcx
1459b10ec:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1459b10f6:     	movq	%rcx, %rax
1459b10f9:     	mulq	%rdx
1459b10fc:     	shrq	$0x4, %rdx
1459b1100:     	cmpq	$0x1f8, %rcx            # imm = 0x1F8
1459b1107:     	jb	0x1459b1126 <.text+0x59b0126>
1459b1109:     	leaq	(%r11,%r10,4), %rax
1459b110d:     	addq	%rdi, %rcx
1459b1110:     	addq	$-0x14, %rcx
1459b1114:     	cmpq	%rcx, %rax
1459b1117:     	jae	0x1459b112d <.text+0x59b012d>
1459b1119:     	leaq	(%r10,%rdx), %rax
1459b111d:     	leaq	(%r11,%rax,4), %rax
1459b1121:     	cmpq	%rax, %rdi
1459b1124:     	jae	0x1459b112d <.text+0x59b012d>
1459b1126:     	xorl	%eax, %eax
1459b1128:     	jmp	0x1459b11ba <.text+0x59b01ba>
1459b112d:     	leaq	(,%r10,4), %rcx
1459b1135:     	movl	%edx, %eax
1459b1137:     	andl	$0x7, %eax
1459b113a:     	movl	$0x8, %r9d
1459b1140:     	cmovneq	%rax, %r9
1459b1144:     	movq	%rdx, %rax
1459b1147:     	subq	%r9, %rax
1459b114a:     	addq	%rax, %r10
1459b114d:     	addq	%r11, %rcx
1459b1150:     	addq	$0x10, %rcx
1459b1154:     	xorl	%r9d, %r9d
1459b1157:     	movq	%rdi, %rsi
1459b115a:     	nopw	(%rax,%rax)
1459b1160:     	movss	0x48(%rsi), %xmm0
1459b1165:     	movss	0x30(%rsi), %xmm1
1459b116a:     	unpcklps	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
1459b116d:     	movss	0x18(%rsi), %xmm0
1459b1172:     	movss	(%rsi), %xmm2
1459b1176:     	unpcklps	%xmm0, %xmm2            # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
1459b1179:     	movlhps	%xmm1, %xmm2            # xmm2 = xmm2[0],xmm1[0]
1459b117c:     	movss	0xa8(%rsi), %xmm0
1459b1184:     	movss	0x90(%rsi), %xmm1
1459b118c:     	unpcklps	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
1459b118f:     	movss	0x78(%rsi), %xmm0
1459b1194:     	movss	0x60(%rsi), %xmm3
1459b1199:     	unpcklps	%xmm0, %xmm3            # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
1459b119c:     	movlhps	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0]
1459b119f:     	movups	%xmm2, -0x10(%rcx,%r9,4)
1459b11a5:     	movups	%xmm3, (%rcx,%r9,4)
1459b11aa:     	addq	$0x8, %r9
1459b11ae:     	addq	$0xc0, %rsi
1459b11b5:     	cmpq	%r9, %rax
1459b11b8:     	jne	0x1459b1160 <.text+0x59b0160>
1459b11ba:     	movl	%edx, %ecx
1459b11bc:     	subl	%eax, %ecx
1459b11be:     	andl	$0x3, %ecx
1459b11c1:     	je	0x1459b1209 <.text+0x59b0209>
1459b11c3:     	leaq	(%r11,%r10,4), %r9
1459b11c7:     	leaq	(%rax,%rax,2), %rsi
1459b11cb:     	leaq	(%rdi,%rsi,8), %rbx
1459b11cf:     	negq	%rcx
1459b11d2:     	xorl	%esi, %esi
1459b11d4:     	nopw	%cs:(%rax,%rax)
1459b11e0:     	movl	(%rbx), %ebp
1459b11e2:     	movl	%ebp, (%r9)
1459b11e5:     	decq	%rsi
1459b11e8:     	addq	$0x4, %r9
1459b11ec:     	addq	$0x18, %rbx
1459b11f0:     	cmpq	%rsi, %rcx
1459b11f3:     	jne	0x1459b11e0 <.text+0x59b01e0>
1459b11f5:     	subq	%rsi, %r10
1459b11f8:     	movq	%rax, %rcx
1459b11fb:     	subq	%rsi, %rcx
1459b11fe:     	subq	%rdx, %rax
1459b1201:     	cmpq	$-0x4, %rax
1459b1205:     	jbe	0x1459b1215 <.text+0x59b0215>
1459b1207:     	jmp	0x1459b124c <.text+0x59b024c>
1459b1209:     	movq	%rax, %rcx
1459b120c:     	subq	%rdx, %rax
1459b120f:     	cmpq	$-0x4, %rax
1459b1213:     	ja	0x1459b124c <.text+0x59b024c>
1459b1215:     	leaq	(%rcx,%rcx,2), %rax
1459b1219:     	leaq	(%rdi,%rax,8), %rax
1459b121d:     	subq	%rcx, %rdx
1459b1220:     	movl	(%rax), %ecx
1459b1222:     	movl	%ecx, (%r11,%r10,4)
1459b1226:     	movl	0x18(%rax), %ecx
1459b1229:     	movl	%ecx, 0x4(%r11,%r10,4)
1459b122e:     	movl	0x30(%rax), %ecx
1459b1231:     	movl	%ecx, 0x8(%r11,%r10,4)
1459b1236:     	movl	0x48(%rax), %ecx
1459b1239:     	movl	%ecx, 0xc(%r11,%r10,4)
1459b123e:     	addq	$0x4, %r10
1459b1242:     	addq	$0x60, %rax
1459b1246:     	addq	$-0x4, %rdx
1459b124a:     	jne	0x1459b1220 <.text+0x59b0220>
1459b124c:     	movq	%r10, (%r8)
1459b124f:     	popq	%rbx
1459b1250:     	popq	%rbp
1459b1251:     	popq	%rdi
1459b1252:     	popq	%rsi
1459b1253:     	popq	%r14
1459b1255:     	popq	%r15
1459b1257:     	retq
