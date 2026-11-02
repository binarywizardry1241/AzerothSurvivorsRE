
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f10c0:     	pushq	%rbp
1454f10c1:     	pushq	%r15
1454f10c3:     	pushq	%r14
1454f10c5:     	pushq	%r13
1454f10c7:     	pushq	%r12
1454f10c9:     	pushq	%rsi
1454f10ca:     	pushq	%rdi
1454f10cb:     	pushq	%rbx
1454f10cc:     	subq	$0x58, %rsp
1454f10d0:     	leaq	0x50(%rsp), %rbp
1454f10d5:     	movaps	%xmm6, -0x10(%rbp)
1454f10d9:     	movq	$-0x2, -0x18(%rbp)
1454f10e1:     	movq	(%rcx), %rsi
1454f10e4:     	movq	0x8(%rcx), %rdi
1454f10e8:     	movq	(%rdx), %rax
1454f10eb:     	movq	0x8(%rdx), %r8
1454f10ef:     	cmpq	%rdi, %rsi
1454f10f2:     	je	0x1454f1281 <.text+0x54f0281>
1454f10f8:     	movq	%rax, -0x28(%rbp)
1454f10fc:     	movq	0x10(%rcx), %rbx
1454f1100:     	movq	0x10(%rdx), %rax
1454f1104:     	subq	%rsi, %rdi
1454f1107:     	shrq	$0x3, %rdi
1454f110b:     	movq	%r8, -0x20(%rbp)
1454f110f:     	leaq	(%rax,%r8,8), %r15
1454f1113:     	xorl	%r14d, %r14d
1454f1116:     	leaq	0x15c1f3b(%rip), %r12   # 0x146ab3058
1454f111d:     	movss	0x3b7463(%rip), %xmm6   # 0x1458a8588
1454f1125:     	leaq	0x15c290c(%rip), %r13   # 0x146ab3a38
1454f112c:     	jmp	0x1454f1147 <.text+0x54f0147>
1454f112e:     	movl	%edx, %ecx
1454f1130:     	shlq	$0x20, %rax
1454f1134:     	orq	%rcx, %rax
1454f1137:     	movq	%rax, (%r15,%r14,8)
1454f113b:     	incq	%r14
1454f113e:     	cmpq	%r14, %rdi
1454f1141:     	je	0x1454f1276 <.text+0x54f0276>
1454f1147:     	movq	(%rbx), %rcx
1454f114a:     	cmpq	$0x4, %rcx
1454f114e:     	ja	0x1454f1299 <.text+0x54f0299>
1454f1154:     	movq	(%rsi,%r14,8), %rdx
1454f1158:     	movss	(%r12,%rcx,4), %xmm0
1454f115e:     	mulss	%xmm6, %xmm0
1454f1162:     	movq	%rdx, %rax
1454f1165:     	shrq	$0x20, %rax
1454f1169:     	movl	%edx, %ecx
1454f116b:     	movslq	(%r13,%rcx,4), %rcx
1454f1170:     	addq	%r13, %rcx
1454f1173:     	jmpq	*%rcx
1454f1175:     	movd	%eax, %xmm1
1454f1179:     	mulss	%xmm1, %xmm0
1454f117d:     	movd	%xmm0, %eax
1454f1181:     	xorl	%ecx, %ecx
1454f1183:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f1185:     	movd	%eax, %xmm1
1454f1189:     	mulss	%xmm1, %xmm0
1454f118d:     	movd	%xmm0, %eax
1454f1191:     	movl	$0x4, %ecx
1454f1196:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f1198:     	movd	%eax, %xmm1
1454f119c:     	mulss	%xmm1, %xmm0
1454f11a0:     	movd	%xmm0, %eax
1454f11a4:     	movl	$0xc, %ecx
1454f11a9:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f11ab:     	movd	%eax, %xmm1
1454f11af:     	mulss	%xmm1, %xmm0
1454f11b3:     	movd	%xmm0, %eax
1454f11b7:     	movl	$0x9, %ecx
1454f11bc:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f11c1:     	movd	%eax, %xmm1
1454f11c5:     	mulss	%xmm1, %xmm0
1454f11c9:     	callq	0x145714a5d <.text+0x5713a5d>
1454f11ce:     	movd	%xmm0, %eax
1454f11d2:     	movl	$0x2, %ecx
1454f11d7:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f11dc:     	movd	%eax, %xmm1
1454f11e0:     	mulss	%xmm1, %xmm0
1454f11e4:     	movd	%xmm0, %eax
1454f11e8:     	movl	$0x3, %ecx
1454f11ed:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f11f2:     	movd	%eax, %xmm1
1454f11f6:     	mulss	%xmm1, %xmm0
1454f11fa:     	movd	%xmm0, %eax
1454f11fe:     	movl	$0x7, %ecx
1454f1203:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f1208:     	movd	%eax, %xmm1
1454f120c:     	mulss	%xmm1, %xmm0
1454f1210:     	movd	%xmm0, %eax
1454f1214:     	movl	$0x1, %ecx
1454f1219:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f121e:     	movd	%eax, %xmm1
1454f1222:     	mulss	%xmm1, %xmm0
1454f1226:     	movd	%xmm0, %eax
1454f122a:     	movl	$0x5, %ecx
1454f122f:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f1234:     	movd	%eax, %xmm1
1454f1238:     	mulss	%xmm1, %xmm0
1454f123c:     	movd	%xmm0, %eax
1454f1240:     	movl	$0x6, %ecx
1454f1245:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f124a:     	movd	%eax, %xmm1
1454f124e:     	mulss	%xmm1, %xmm0
1454f1252:     	movd	%xmm0, %eax
1454f1256:     	movl	$0xa, %ecx
1454f125b:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f1260:     	movd	%eax, %xmm1
1454f1264:     	mulss	%xmm1, %xmm0
1454f1268:     	movd	%xmm0, %eax
1454f126c:     	movl	$0x8, %ecx
1454f1271:     	jmp	0x1454f1130 <.text+0x54f0130>
1454f1276:     	movq	-0x20(%rbp), %r8
1454f127a:     	addq	%r14, %r8
1454f127d:     	movq	-0x28(%rbp), %rax
1454f1281:     	movq	%r8, (%rax)
1454f1284:     	movaps	-0x10(%rbp), %xmm6
1454f1288:     	addq	$0x58, %rsp
1454f128c:     	popq	%rbx
1454f128d:     	popq	%rdi
1454f128e:     	popq	%rsi
1454f128f:     	popq	%r12
1454f1291:     	popq	%r13
1454f1293:     	popq	%r14
1454f1295:     	popq	%r15
1454f1297:     	popq	%rbp
1454f1298:     	retq
1454f1299:     	addq	%r14, -0x20(%rbp)
1454f129d:     	leaq	0x15c1dcc(%rip), %r8    # 0x146ab3070
1454f12a4:     	movl	$0x5, %edx
1454f12a9:     	callq	0x1458a3f23 <.text+0x58a2f23>
1454f12ae:     	nop
1454f12af:     	ud2
