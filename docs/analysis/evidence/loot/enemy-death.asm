
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c2eb0:     	pushq	%rbp
1454c2eb1:     	pushq	%r15
1454c2eb3:     	pushq	%r14
1454c2eb5:     	pushq	%r13
1454c2eb7:     	pushq	%r12
1454c2eb9:     	pushq	%rsi
1454c2eba:     	pushq	%rdi
1454c2ebb:     	pushq	%rbx
1454c2ebc:     	subq	$0x2a8, %rsp            # imm = 0x2A8
1454c2ec3:     	leaq	0x80(%rsp), %rbp
1454c2ecb:     	movaps	%xmm15, 0x210(%rbp)
1454c2ed3:     	movaps	%xmm14, 0x200(%rbp)
1454c2edb:     	movaps	%xmm13, 0x1f0(%rbp)
1454c2ee3:     	movaps	%xmm12, 0x1e0(%rbp)
1454c2eeb:     	movaps	%xmm11, 0x1d0(%rbp)
1454c2ef3:     	movaps	%xmm10, 0x1c0(%rbp)
1454c2efb:     	movaps	%xmm9, 0x1b0(%rbp)
1454c2f03:     	movaps	%xmm8, 0x1a0(%rbp)
1454c2f0b:     	movaps	%xmm7, 0x190(%rbp)
1454c2f12:     	movaps	%xmm6, 0x180(%rbp)
1454c2f19:     	movq	$-0x2, 0x178(%rbp)
1454c2f24:     	cmpb	$0x1, 0x95f(%rcx)
1454c2f2b:     	jne	0x1454c61ae <.text+0x54c51ae>
1454c2f31:     	movl	%r9d, %ebx
1454c2f34:     	movaps	%xmm2, %xmm6
1454c2f37:     	movq	%rdx, %rdi
1454c2f3a:     	movq	%rcx, %rsi
1454c2f3d:     	movzbl	0x2a0(%rbp), %r12d
1454c2f45:     	movss	0x8e4(%rcx), %xmm0
1454c2f4d:     	movq	0x4c8(%rcx), %r14
1454c2f54:     	movq	0x4d0(%rcx), %rcx
1454c2f5b:     	imulq	$0x160, %rcx, %rax      # imm = 0x160
1454c2f62:     	xorl	%edx, %edx
1454c2f64:     	movss	0x428513(%rip), %xmm8   # 0x1458eb480
1454c2f6d:     	movq	%r14, %r8
1454c2f70:     	cmpq	%rdx, %rax
1454c2f73:     	je	0x1454c3398 <.text+0x54c2398>
1454c2f79:     	addq	$0x160, %rdx            # imm = 0x160
1454c2f80:     	cmpq	%rdi, 0x88(%r8)
1454c2f87:     	leaq	0x160(%r8), %r8
1454c2f8e:     	jne	0x1454c2f70 <.text+0x54c1f70>
1454c2f90:     	movss	-0x1c(%r14,%rdx), %xmm1
1454c2f97:     	ucomiss	%xmm0, %xmm1
1454c2f9a:     	ja	0x1454c2fb7 <.text+0x54c1fb7>
1454c2f9c:     	movss	-0xc4(%r14,%rdx), %xmm1
1454c2fa6:     	ucomiss	%xmm0, %xmm1
1454c2fa9:     	ja	0x1454c2fb7 <.text+0x54c1fb7>
1454c2fab:     	movss	-0x10(%r14,%rdx), %xmm1
1454c2fb2:     	ucomiss	%xmm0, %xmm1
1454c2fb5:     	jbe	0x1454c2fde <.text+0x54c1fde>
1454c2fb7:     	movq	0x6d0(%rsi), %r10
1454c2fbe:     	testq	%r10, %r10
1454c2fc1:     	je	0x1454c2fde <.text+0x54c1fde>
1454c2fc3:     	movq	0x6c8(%rsi), %r8
1454c2fca:     	cmpq	$0x1, %r10
1454c2fce:     	jne	0x1454c2ffb <.text+0x54c1ffb>
1454c2fd0:     	movss	0x4336a3(%rip), %xmm8   # 0x1458f667c
1454c2fd9:     	xorl	%r9d, %r9d
1454c2fdc:     	jmp	0x1454c304e <.text+0x54c204e>
1454c2fde:     	movss	0x428499(%rip), %xmm8   # 0x1458eb480
1454c2fe7:     	cmpq	$-0x1, -0x148(%r14,%rdx)
1454c2ff0:     	jne	0x1454c3078 <.text+0x54c2078>
1454c2ff6:     	jmp	0x1454c3070 <.text+0x54c2070>
1454c2ffb:     	movq	%r10, %r11
1454c2ffe:     	andq	$-0x2, %r11
1454c3002:     	movss	0x433671(%rip), %xmm8   # 0x1458f667c
1454c300b:     	xorl	%r9d, %r9d
1454c300e:     	jmp	0x1454c3019 <.text+0x54c2019>
1454c3010:     	addq	$0x2, %r9
1454c3014:     	cmpq	%r9, %r11
1454c3017:     	je	0x1454c3048 <.text+0x54c2048>
1454c3019:     	cmpb	$0x12, (%r8,%r9,8)
1454c301e:     	je	0x1454c3030 <.text+0x54c2030>
1454c3020:     	cmpb	$0x12, 0x8(%r8,%r9,8)
1454c3026:     	jne	0x1454c3010 <.text+0x54c2010>
1454c3028:     	jmp	0x1454c303f <.text+0x54c203f>
1454c302a:     	nopw	(%rax,%rax)
1454c3030:     	addss	0x4(%r8,%r9,8), %xmm8
1454c3037:     	cmpb	$0x12, 0x8(%r8,%r9,8)
1454c303d:     	jne	0x1454c3010 <.text+0x54c2010>
1454c303f:     	addss	0xc(%r8,%r9,8), %xmm8
1454c3046:     	jmp	0x1454c3010 <.text+0x54c2010>
1454c3048:     	testb	$0x1, %r10b
1454c304c:     	je	0x1454c305c <.text+0x54c205c>
1454c304e:     	cmpb	$0x12, (%r8,%r9,8)
1454c3053:     	jne	0x1454c305c <.text+0x54c205c>
1454c3055:     	addss	0x4(%r8,%r9,8), %xmm8
1454c305c:     	addss	0x42841b(%rip), %xmm8   # 0x1458eb480
1454c3065:     	cmpq	$-0x1, -0x148(%r14,%rdx)
1454c306e:     	jne	0x1454c3078 <.text+0x54c2078>
1454c3070:     	cmpb	$0x1, -0x8(%r14,%rdx)
1454c3076:     	jne	0x1454c30a1 <.text+0x54c20a1>
1454c3078:     	movq	0x6d0(%rsi), %r10
1454c307f:     	testq	%r10, %r10
1454c3082:     	je	0x1454c30ed <.text+0x54c20ed>
1454c3084:     	movq	0x6c8(%rsi), %r8
1454c308b:     	cmpq	$0x1, %r10
1454c308f:     	jne	0x1454c30f7 <.text+0x54c20f7>
1454c3091:     	movss	0x4335e3(%rip), %xmm1   # 0x1458f667c
1454c3099:     	xorl	%r9d, %r9d
1454c309c:     	jmp	0x1454c314e <.text+0x54c214e>
1454c30a1:     	movss	-0x6c(%r14,%rdx), %xmm1
1454c30a8:     	mulss	0x447d94(%rip), %xmm1   # 0x14590ae44
1454c30b0:     	ucomiss	-0x70(%r14,%rdx), %xmm1
1454c30b6:     	jbe	0x1454c317c <.text+0x54c217c>
1454c30bc:     	movq	0x6d0(%rsi), %r10
1454c30c3:     	testq	%r10, %r10
1454c30c6:     	je	0x1454c3239 <.text+0x54c2239>
1454c30cc:     	movq	0x6c8(%rsi), %r8
1454c30d3:     	cmpq	$0x1, %r10
1454c30d7:     	jne	0x1454c3243 <.text+0x54c2243>
1454c30dd:     	movss	0x433597(%rip), %xmm1   # 0x1458f667c
1454c30e5:     	xorl	%r9d, %r9d
1454c30e8:     	jmp	0x1454c329e <.text+0x54c229e>
1454c30ed:     	movss	0x433587(%rip), %xmm1   # 0x1458f667c
1454c30f5:     	jmp	0x1454c315c <.text+0x54c215c>
1454c30f7:     	movq	%r10, %r11
1454c30fa:     	andq	$-0x2, %r11
1454c30fe:     	movss	0x433576(%rip), %xmm1   # 0x1458f667c
1454c3106:     	xorl	%r9d, %r9d
1454c3109:     	jmp	0x1454c3119 <.text+0x54c2119>
1454c310b:     	nopl	(%rax,%rax)
1454c3110:     	addq	$0x2, %r9
1454c3114:     	cmpq	%r9, %r11
1454c3117:     	je	0x1454c3148 <.text+0x54c2148>
1454c3119:     	cmpb	$0x13, (%r8,%r9,8)
1454c311e:     	je	0x1454c3130 <.text+0x54c2130>
1454c3120:     	cmpb	$0x13, 0x8(%r8,%r9,8)
1454c3126:     	jne	0x1454c3110 <.text+0x54c2110>
1454c3128:     	jmp	0x1454c313f <.text+0x54c213f>
1454c312a:     	nopw	(%rax,%rax)
1454c3130:     	addss	0x4(%r8,%r9,8), %xmm1
1454c3137:     	cmpb	$0x13, 0x8(%r8,%r9,8)
1454c313d:     	jne	0x1454c3110 <.text+0x54c2110>
1454c313f:     	addss	0xc(%r8,%r9,8), %xmm1
1454c3146:     	jmp	0x1454c3110 <.text+0x54c2110>
1454c3148:     	testb	$0x1, %r10b
1454c314c:     	je	0x1454c315c <.text+0x54c215c>
1454c314e:     	cmpb	$0x13, (%r8,%r9,8)
1454c3153:     	jne	0x1454c315c <.text+0x54c215c>
1454c3155:     	addss	0x4(%r8,%r9,8), %xmm1
1454c315c:     	addss	%xmm1, %xmm8
1454c3161:     	movss	-0x6c(%r14,%rdx), %xmm1
1454c3168:     	mulss	0x447cd4(%rip), %xmm1   # 0x14590ae44
1454c3170:     	ucomiss	-0x70(%r14,%rdx), %xmm1
1454c3176:     	ja	0x1454c30bc <.text+0x54c20bc>
1454c317c:     	cmpq	$0x0, -0x150(%r14,%rdx)
1454c3185:     	je	0x1454c32c0 <.text+0x54c22c0>
1454c318b:     	movq	0x6d0(%rsi), %r10
1454c3192:     	testq	%r10, %r10
1454c3195:     	je	0x1454c31b1 <.text+0x54c21b1>
1454c3197:     	movq	0x6c8(%rsi), %r8
1454c319e:     	cmpq	$0x1, %r10
1454c31a2:     	jne	0x1454c31bb <.text+0x54c21bb>
1454c31a4:     	movss	0x4334d0(%rip), %xmm1   # 0x1458f667c
1454c31ac:     	xorl	%r9d, %r9d
1454c31af:     	jmp	0x1454c320e <.text+0x54c220e>
1454c31b1:     	movss	0x4334c3(%rip), %xmm1   # 0x1458f667c
1454c31b9:     	jmp	0x1454c321c <.text+0x54c221c>
1454c31bb:     	movq	%r10, %r11
1454c31be:     	andq	$-0x2, %r11
1454c31c2:     	movss	0x4334b2(%rip), %xmm1   # 0x1458f667c
1454c31ca:     	xorl	%r9d, %r9d
1454c31cd:     	jmp	0x1454c31d9 <.text+0x54c21d9>
1454c31cf:     	nop
1454c31d0:     	addq	$0x2, %r9
1454c31d4:     	cmpq	%r9, %r11
1454c31d7:     	je	0x1454c3208 <.text+0x54c2208>
1454c31d9:     	cmpb	$0x15, (%r8,%r9,8)
1454c31de:     	je	0x1454c31f0 <.text+0x54c21f0>
1454c31e0:     	cmpb	$0x15, 0x8(%r8,%r9,8)
1454c31e6:     	jne	0x1454c31d0 <.text+0x54c21d0>
1454c31e8:     	jmp	0x1454c31ff <.text+0x54c21ff>
1454c31ea:     	nopw	(%rax,%rax)
1454c31f0:     	addss	0x4(%r8,%r9,8), %xmm1
1454c31f7:     	cmpb	$0x15, 0x8(%r8,%r9,8)
1454c31fd:     	jne	0x1454c31d0 <.text+0x54c21d0>
1454c31ff:     	addss	0xc(%r8,%r9,8), %xmm1
1454c3206:     	jmp	0x1454c31d0 <.text+0x54c21d0>
1454c3208:     	testb	$0x1, %r10b
1454c320c:     	je	0x1454c321c <.text+0x54c221c>
1454c320e:     	cmpb	$0x15, (%r8,%r9,8)
1454c3213:     	jne	0x1454c321c <.text+0x54c221c>
1454c3215:     	addss	0x4(%r8,%r9,8), %xmm1
1454c321c:     	addss	%xmm1, %xmm8
1454c3221:     	movss	-0xb4(%r14,%rdx), %xmm1
1454c322b:     	ucomiss	%xmm0, %xmm1
1454c322e:     	ja	0x1454c32cf <.text+0x54c22cf>
1454c3234:     	jmp	0x1454c32d9 <.text+0x54c22d9>
1454c3239:     	movss	0x43343b(%rip), %xmm1   # 0x1458f667c
1454c3241:     	jmp	0x1454c32ac <.text+0x54c22ac>
1454c3243:     	movq	%r10, %r11
1454c3246:     	andq	$-0x2, %r11
1454c324a:     	movss	0x43342a(%rip), %xmm1   # 0x1458f667c
1454c3252:     	xorl	%r9d, %r9d
1454c3255:     	jmp	0x1454c3269 <.text+0x54c2269>
1454c3257:     	nopw	(%rax,%rax)
1454c3260:     	addq	$0x2, %r9
1454c3264:     	cmpq	%r9, %r11
1454c3267:     	je	0x1454c3298 <.text+0x54c2298>
1454c3269:     	cmpb	$0x14, (%r8,%r9,8)
1454c326e:     	je	0x1454c3280 <.text+0x54c2280>
1454c3270:     	cmpb	$0x14, 0x8(%r8,%r9,8)
1454c3276:     	jne	0x1454c3260 <.text+0x54c2260>
1454c3278:     	jmp	0x1454c328f <.text+0x54c228f>
1454c327a:     	nopw	(%rax,%rax)
1454c3280:     	addss	0x4(%r8,%r9,8), %xmm1
1454c3287:     	cmpb	$0x14, 0x8(%r8,%r9,8)
1454c328d:     	jne	0x1454c3260 <.text+0x54c2260>
1454c328f:     	addss	0xc(%r8,%r9,8), %xmm1
1454c3296:     	jmp	0x1454c3260 <.text+0x54c2260>
1454c3298:     	testb	$0x1, %r10b
1454c329c:     	je	0x1454c32ac <.text+0x54c22ac>
1454c329e:     	cmpb	$0x14, (%r8,%r9,8)
1454c32a3:     	jne	0x1454c32ac <.text+0x54c22ac>
1454c32a5:     	addss	0x4(%r8,%r9,8), %xmm1
1454c32ac:     	addss	%xmm1, %xmm8
1454c32b1:     	cmpq	$0x0, -0x150(%r14,%rdx)
1454c32ba:     	jne	0x1454c318b <.text+0x54c218b>
1454c32c0:     	movss	-0xb4(%r14,%rdx), %xmm1
1454c32ca:     	ucomiss	%xmm0, %xmm1
1454c32cd:     	jbe	0x1454c32d9 <.text+0x54c22d9>
1454c32cf:     	addss	-0xb8(%r14,%rdx), %xmm8
1454c32d9:     	movss	0x404(%rsi), %xmm0
1454c32e1:     	xorps	%xmm1, %xmm1
1454c32e4:     	ucomiss	%xmm1, %xmm0
1454c32e7:     	jbe	0x1454c3391 <.text+0x54c2391>
1454c32ed:     	movq	0x6d0(%rsi), %r10
1454c32f4:     	testq	%r10, %r10
1454c32f7:     	je	0x1454c3313 <.text+0x54c2313>
1454c32f9:     	movq	0x6c8(%rsi), %r8
1454c3300:     	cmpq	$0x1, %r10
1454c3304:     	jne	0x1454c331d <.text+0x54c231d>
1454c3306:     	movss	0x43336e(%rip), %xmm0   # 0x1458f667c
1454c330e:     	xorl	%r9d, %r9d
1454c3311:     	jmp	0x1454c337e <.text+0x54c237e>
1454c3313:     	movss	0x433361(%rip), %xmm0   # 0x1458f667c
1454c331b:     	jmp	0x1454c338c <.text+0x54c238c>
1454c331d:     	movq	%r10, %r11
1454c3320:     	andq	$-0x2, %r11
1454c3324:     	movss	0x433350(%rip), %xmm0   # 0x1458f667c
1454c332c:     	xorl	%r9d, %r9d
1454c332f:     	jmp	0x1454c3349 <.text+0x54c2349>
1454c3331:     	nopw	%cs:(%rax,%rax)
1454c3340:     	addq	$0x2, %r9
1454c3344:     	cmpq	%r9, %r11
1454c3347:     	je	0x1454c3378 <.text+0x54c2378>
1454c3349:     	cmpb	$0x1c, (%r8,%r9,8)
1454c334e:     	je	0x1454c3360 <.text+0x54c2360>
1454c3350:     	cmpb	$0x1c, 0x8(%r8,%r9,8)
1454c3356:     	jne	0x1454c3340 <.text+0x54c2340>
1454c3358:     	jmp	0x1454c336f <.text+0x54c236f>
1454c335a:     	nopw	(%rax,%rax)
1454c3360:     	addss	0x4(%r8,%r9,8), %xmm0
1454c3367:     	cmpb	$0x1c, 0x8(%r8,%r9,8)
1454c336d:     	jne	0x1454c3340 <.text+0x54c2340>
1454c336f:     	addss	0xc(%r8,%r9,8), %xmm0
1454c3376:     	jmp	0x1454c3340 <.text+0x54c2340>
1454c3378:     	testb	$0x1, %r10b
1454c337c:     	je	0x1454c338c <.text+0x54c238c>
1454c337e:     	cmpb	$0x1c, (%r8,%r9,8)
1454c3383:     	jne	0x1454c338c <.text+0x54c238c>
1454c3385:     	addss	0x4(%r8,%r9,8), %xmm0
1454c338c:     	addss	%xmm0, %xmm8
1454c3391:     	addss	-0x24(%r14,%rdx), %xmm8
1454c3398:     	testq	%rcx, %rcx
1454c339b:     	je	0x1454c61ae <.text+0x54c51ae>
1454c33a1:     	xorl	%r15d, %r15d
1454c33a4:     	jmp	0x1454c33c0 <.text+0x54c23c0>
1454c33a6:     	nopw	%cs:(%rax,%rax)
1454c33b0:     	addq	$0x160, %r15            # imm = 0x160
1454c33b7:     	cmpq	%r15, %rax
1454c33ba:     	je	0x1454c61ae <.text+0x54c51ae>
1454c33c0:     	cmpq	%rdi, 0x88(%r14,%r15)
1454c33c8:     	jne	0x1454c33b0 <.text+0x54c23b0>
1454c33ca:     	cmpl	$0x1, 0x68(%r14,%r15)
1454c33d0:     	je	0x1454c33b0 <.text+0x54c23b0>
1454c33d2:     	mulss	%xmm6, %xmm8
1454c33d7:     	maxss	0x4280a0(%rip), %xmm8   # 0x1458eb480
1454c33e0:     	movss	0xf0(%r14,%r15), %xmm3
1454c33ea:     	movss	0x128(%r14,%r15), %xmm2
1454c33f4:     	xorps	%xmm1, %xmm1
1454c33f7:     	movaps	%xmm3, %xmm0
1454c33fa:     	maxss	%xmm1, %xmm0
1454c33fe:     	subss	%xmm8, %xmm3
1454c3403:     	movss	%xmm3, 0xf0(%r14,%r15)
1454c340d:     	ucomiss	%xmm2, %xmm1
1454c3410:     	jae	0x1454c3481 <.text+0x54c2481>
1454c3412:     	movss	0x8e4(%rsi), %xmm3
1454c341a:     	subss	0x124(%r14,%r15), %xmm3
1454c3424:     	divss	%xmm2, %xmm3
1454c3428:     	maxss	%xmm3, %xmm1
1454c342c:     	movss	0x42804c(%rip), %xmm2   # 0x1458eb480
1454c3434:     	minss	%xmm1, %xmm2
1454c3438:     	movsd	0x10c(%r14,%r15), %xmm1
1454c3442:     	movsd	0x118(%r14,%r15), %xmm3
1454c344c:     	subps	%xmm1, %xmm3
1454c344f:     	movsldup	%xmm2, %xmm9            # xmm9 = xmm2[0,0,2,2]
1454c3454:     	mulps	%xmm3, %xmm9
1454c3458:     	addps	%xmm1, %xmm9
1454c345c:     	movss	0x114(%r14,%r15), %xmm1
1454c3466:     	movss	0x120(%r14,%r15), %xmm10
1454c3470:     	subss	%xmm1, %xmm10
1454c3475:     	mulss	%xmm2, %xmm10
1454c347a:     	addss	%xmm1, %xmm10
1454c347f:     	jmp	0x1454c3495 <.text+0x54c2495>
1454c3481:     	movsd	0x118(%r14,%r15), %xmm9
1454c348b:     	movss	0x120(%r14,%r15), %xmm10
1454c3495:     	movaps	%xmm8, %xmm7
1454c3499:     	minss	%xmm0, %xmm7
1454c349d:     	movq	0x18(%r14,%r15), %r13
1454c34a2:     	cvtss2sd	%xmm8, %xmm11
1454c34a7:     	movsd	0x610(%rsi), %xmm0
1454c34af:     	addsd	%xmm11, %xmm0
1454c34b4:     	movsd	%xmm0, 0x610(%rsi)
1454c34bc:     	leaq	0x638(%rsi), %rax
1454c34c3:     	movq	0x638(%rsi), %rcx
1454c34ca:     	testq	%rcx, %rcx
1454c34cd:     	je	0x1454c355a <.text+0x54c255a>
1454c34d3:     	movq	0x640(%rsi), %rdx
1454c34da:     	movzwl	0x8e(%rcx), %r9d
1454c34e2:     	movl	%r9d, %r10d
1454c34e5:     	shll	$0x2, %r10d
1454c34e9:     	movq	$-0x1, %r8
1454c34f0:     	testq	%r10, %r10
1454c34f3:     	je	0x1454c351a <.text+0x54c251a>
1454c34f5:     	cmpl	0x64(%rcx,%r8,4), %ebx
1454c34fa:     	seta	%r11b
1454c34fe:     	sbbb	$0x0, %r11b
1454c3502:     	incq	%r8
1454c3505:     	addq	$-0x4, %r10
1454c3509:     	cmpb	$0x1, %r11b
1454c350d:     	je	0x1454c34f0 <.text+0x54c24f0>
1454c350f:     	movzbl	%r11b, %r9d
1454c3513:     	testl	%r9d, %r9d
1454c3516:     	jne	0x1454c351d <.text+0x54c251d>
1454c3518:     	jmp	0x1454c3531 <.text+0x54c2531>
1454c351a:     	movq	%r9, %r8
1454c351d:     	subq	$0x1, %rdx
1454c3521:     	jb	0x1454c4859 <.text+0x54c3859>
1454c3527:     	movq	0x90(%rcx,%r8,8), %rcx
1454c352f:     	jmp	0x1454c34da <.text+0x54c24da>
1454c3531:     	movq	%rcx, 0xf8(%rbp)
1454c3538:     	movq	%rdx, 0x100(%rbp)
1454c353f:     	movq	%r8, 0x108(%rbp)
1454c3546:     	movq	%rax, 0x110(%rbp)
1454c354d:     	movq	$0x0, 0xf0(%rbp)
1454c3558:     	jmp	0x1454c3572 <.text+0x54c2572>
1454c355a:     	movq	%rax, 0xf0(%rbp)
1454c3561:     	movq	$0x0, 0xf8(%rbp)
1454c356c:     	movl	%ebx, 0x110(%rbp)
1454c3572:     	leaq	0xf0(%rbp), %rcx
1454c3579:     	callq	0x145427860 <.text+0x5426860>
1454c357e:     	addsd	(%rax), %xmm11
1454c3583:     	movsd	%xmm11, (%rax)
1454c3588:     	movss	0xf0(%r14,%r15), %xmm11
1454c3592:     	xorps	%xmm12, %xmm12
1454c3596:     	movaps	%xmm11, %xmm0
1454c359a:     	maxss	%xmm12, %xmm0
1454c359f:     	callq	0x145756e6d <.text+0x5755e6d>
1454c35a4:     	cvttss2si	%xmm0, %rax
1454c35a9:     	xorl	%ecx, %ecx
1454c35ab:     	ucomiss	%xmm12, %xmm0
1454c35af:     	cmovael	%eax, %ecx
1454c35b2:     	ucomiss	0x427f63(%rip), %xmm0   # 0x1458eb51c
1454c35b9:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454c35bf:     	cmovbel	%ecx, %r14d
1454c35c3:     	cvtss2sd	%xmm7, %xmm7
1454c35c7:     	leaq	0xf0(%rbp), %r15
1454c35ce:     	movq	%r15, %rcx
1454c35d1:     	movq	%rsi, %rdx
1454c35d4:     	movl	%ebx, %r8d
1454c35d7:     	callq	0x14548f030 <.text+0x548e030>
1454c35dc:     	leaq	0x5c8(%rsi), %rcx
1454c35e3:     	movq	%r15, %rdx
1454c35e6:     	movaps	%xmm7, %xmm2
1454c35e9:     	callq	0x1454eff80 <.text+0x54eef80>
1454c35ee:     	cmpq	$-0x1, %r13
1454c35f2:     	je	0x1454c368f <.text+0x54c268f>
1454c35f8:     	cmpl	$0x0, 0x654(%rsi)
1454c35ff:     	je	0x1454c3668 <.text+0x54c2668>
1454c3601:     	movss	0x8e4(%rsi), %xmm0
1454c3609:     	movss	%xmm0, 0x650(%rsi)
1454c3611:     	movl	$0x0, 0x654(%rsi)
1454c361b:     	movq	0x600(%rsi), %r15
1454c3622:     	movq	0x608(%rsi), %r13
1454c3629:     	movq	$0x0, 0x608(%rsi)
1454c3634:     	testq	%r13, %r13
1454c3637:     	je	0x1454c3668 <.text+0x54c2668>
1454c3639:     	addq	$0x8, %r15
1454c363d:     	jmp	0x1454c3649 <.text+0x54c2649>
1454c363f:     	nop
1454c3640:     	addq	$0x38, %r15
1454c3644:     	decq	%r13
1454c3647:     	je	0x1454c3668 <.text+0x54c2668>
1454c3649:     	movq	-0x8(%r15), %rdx
1454c364d:     	cmpq	$-0x1, %rdx
1454c3651:     	je	0x1454c3640 <.text+0x54c2640>
1454c3653:     	testq	%rdx, %rdx
1454c3656:     	je	0x1454c3640 <.text+0x54c2640>
1454c3658:     	movq	(%r15), %rcx
1454c365b:     	movl	$0x1, %r8d
1454c3661:     	callq	0x1400021d0 <.text+0x11d0>
1454c3666:     	jmp	0x1454c3640 <.text+0x54c2640>
1454c3668:     	leaq	0xf0(%rbp), %r15
1454c366f:     	movq	%r15, %rcx
1454c3672:     	movq	%rsi, %rdx
1454c3675:     	movl	%ebx, %r8d
1454c3678:     	callq	0x14548f030 <.text+0x548e030>
1454c367d:     	leaq	0x5f8(%rsi), %rcx
1454c3684:     	movq	%r15, %rdx
1454c3687:     	movaps	%xmm7, %xmm2
1454c368a:     	callq	0x1454eff80 <.text+0x54eef80>
1454c368f:     	testl	%ebx, %ebx
1454c3691:     	sete	%al
1454c3694:     	orb	%r12b, %al
1454c3697:     	jne	0x1454c376b <.text+0x54c276b>
1454c369d:     	movq	0x3d0(%rsi), %r8
1454c36a4:     	cmpl	$0x3ea6, %ebx           # imm = 0x3EA6
1454c36aa:     	je	0x1454c36cf <.text+0x54c26cf>
1454c36ac:     	cmpl	$0x376a, %ebx           # imm = 0x376A
1454c36b2:     	je	0x1454c36c7 <.text+0x54c26c7>
1454c36b4:     	movl	%ebx, %r9d
1454c36b7:     	cmpl	$0x14bc, %ebx           # imm = 0x14BC
1454c36bd:     	jne	0x1454c36d5 <.text+0x54c26d5>
1454c36bf:     	movl	$0x50a7, %r9d           # imm = 0x50A7
1454c36c5:     	jmp	0x1454c36d5 <.text+0x54c26d5>
1454c36c7:     	movl	$0x832, %r9d            # imm = 0x832
1454c36cd:     	jmp	0x1454c36d5 <.text+0x54c26d5>
1454c36cf:     	movl	$0x209d, %r9d           # imm = 0x209D
1454c36d5:     	cvttss2si	%xmm8, %rax
1454c36da:     	xorl	%ecx, %ecx
1454c36dc:     	xorps	%xmm0, %xmm0
1454c36df:     	ucomiss	%xmm0, %xmm8
1454c36e3:     	cmovael	%eax, %ecx
1454c36e6:     	ucomiss	0x427e2e(%rip), %xmm8   # 0x1458eb51c
1454c36ee:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454c36f3:     	cmovbel	%ecx, %eax
1454c36f6:     	movzbl	0x298(%rbp), %ecx
1454c36fd:     	movb	%cl, 0x30(%rsp)
1454c3701:     	movzbl	0x290(%rbp), %ecx
1454c3708:     	movb	%cl, 0x28(%rsp)
1454c370c:     	movl	%eax, 0x20(%rsp)
1454c3710:     	leaq	0xf0(%rbp), %rcx
1454c3717:     	movq	%rdi, %rdx
1454c371a:     	callq	0x145444a90 <.text+0x5443a90>
1454c371f:     	movq	0x548(%rsi), %r15
1454c3726:     	cmpq	0x538(%rsi), %r15
1454c372d:     	jne	0x1454c373c <.text+0x54c273c>
1454c372f:     	leaq	0x538(%rsi), %rcx
1454c3736:     	callq	0x1457580b0 <.text+0x57570b0>
1454c373b:     	nop
1454c373c:     	movq	0x540(%rsi), %rax
1454c3743:     	movq	%r15, %rcx
1454c3746:     	shlq	$0x5, %rcx
1454c374a:     	movups	0xf0(%rbp), %xmm0
1454c3751:     	movups	0x100(%rbp), %xmm1
1454c3758:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c375d:     	movups	%xmm0, (%rax,%rcx)
1454c3761:     	incq	%r15
1454c3764:     	movq	%r15, 0x548(%rsi)
1454c376b:     	movq	$0x0, -0x28(%rbp)
1454c3773:     	movq	$0x0, -0x18(%rbp)
1454c377b:     	leaq	-0x28(%rbp), %rax
1454c377f:     	movq	%rax, 0xf0(%rbp)
1454c3786:     	xorps	%xmm0, %xmm0
1454c3789:     	movups	%xmm0, 0xf8(%rbp)
1454c3790:     	movq	$0x16, 0x110(%rbp)
1454c379b:     	leaq	0xb8(%rbp), %rcx
1454c37a2:     	leaq	0xf0(%rbp), %rdx
1454c37a9:     	movl	%r14d, %r8d
1454c37ac:     	callq	0x145427a50 <.text+0x5426a50>
1454c37b1:     	nop
1454c37b2:     	movl	$0x0, 0x38(%rbp)
1454c37b9:     	movq	$0x0, 0x20(%rbp)
1454c37c1:     	movq	$0x1, 0x28(%rbp)
1454c37c9:     	movq	$0x0, 0x30(%rbp)
1454c37d1:     	cmpq	$0x0, -0x18(%rbp)
1454c37d6:     	je	0x1454c3824 <.text+0x54c2824>
1454c37d8:     	movb	$0x1, 0x175(%rbp)
1454c37df:     	leaq	0x20(%rbp), %rcx
1454c37e3:     	callq	0x1458e7110 <.text+0x58e6110>
1454c37e8:     	nop
1454c37e9:     	movq	0x28(%rbp), %rax
1454c37ed:     	movb	$0x0, (%rax)
1454c37f0:     	movq	$0x1, 0x30(%rbp)
1454c37f8:     	movb	$0x1, 0x175(%rbp)
1454c37ff:     	leaq	0x20(%rbp), %rdx
1454c3803:     	movq	%rdi, %rcx
1454c3806:     	callq	0x145509090 <.text+0x5508090>
1454c380b:     	nop
1454c380c:     	movb	$0x1, 0x175(%rbp)
1454c3813:     	leaq	-0x28(%rbp), %rcx
1454c3817:     	leaq	0x20(%rbp), %rdx
1454c381b:     	callq	0x145500460 <.text+0x54ff460>
1454c3820:     	nop
1454c3821:     	incl	0x38(%rbp)
1454c3824:     	movq	0x20(%rbp), %rax
1454c3828:     	movq	0x28(%rbp), %rcx
1454c382c:     	movq	0x30(%rbp), %rdx
1454c3830:     	movq	%rdx, 0x100(%rbp)
1454c3837:     	movl	0x38(%rbp), %edx
1454c383a:     	movl	%edx, 0x108(%rbp)
1454c3840:     	movl	0x3c(%rbp), %edx
1454c3843:     	movl	%edx, 0x10c(%rbp)
1454c3849:     	movq	%rax, 0xf0(%rbp)
1454c3850:     	movq	%rcx, 0xf8(%rbp)
1454c3857:     	movb	$0x0, 0x175(%rbp)
1454c385e:     	leaq	0xb8(%rbp), %rcx
1454c3865:     	leaq	0xf0(%rbp), %rdx
1454c386c:     	callq	0x1454ffad0 <.text+0x54fead0>
1454c3871:     	nop
1454c3872:     	movq	0x548(%rsi), %r14
1454c3879:     	cmpq	0x538(%rsi), %r14
1454c3880:     	jne	0x1454c388f <.text+0x54c288f>
1454c3882:     	leaq	0x538(%rsi), %rcx
1454c3889:     	callq	0x1457580b0 <.text+0x57570b0>
1454c388e:     	nop
1454c388f:     	movq	0x540(%rsi), %rax
1454c3896:     	movq	%r14, %rcx
1454c3899:     	shlq	$0x5, %rcx
1454c389d:     	movups	0xb8(%rbp), %xmm0
1454c38a4:     	movups	0xc8(%rbp), %xmm1
1454c38ab:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c38b0:     	movups	%xmm0, (%rax,%rcx)
1454c38b4:     	incq	%r14
1454c38b7:     	movq	%r14, 0x548(%rsi)
1454c38be:     	movq	%rsi, %rcx
1454c38c1:     	callq	0x1454b03e0 <.text+0x54af3e0>
1454c38c6:     	xorps	%xmm12, %xmm12
1454c38ca:     	ucomiss	%xmm12, %xmm0
1454c38ce:     	jbe	0x1454c3b8a <.text+0x54c2b8a>
1454c38d4:     	mulss	%xmm0, %xmm8
1454c38d9:     	movss	0x400(%rsi), %xmm1
1454c38e1:     	movss	0x458(%rsi), %xmm7
1454c38e9:     	addss	%xmm1, %xmm8
1454c38ee:     	movaps	%xmm8, %xmm2
1454c38f2:     	minss	%xmm7, %xmm2
1454c38f6:     	movaps	%xmm2, %xmm0
1454c38f9:     	cmpunordss	%xmm2, %xmm0
1454c38fe:     	andps	%xmm0, %xmm8
1454c3902:     	andnps	%xmm2, %xmm0
1454c3905:     	orps	%xmm8, %xmm0
1454c3909:     	movss	%xmm0, 0x400(%rsi)
1454c3911:     	movaps	%xmm0, %xmm8
1454c3915:     	subss	%xmm1, %xmm8
1454c391a:     	ucomiss	%xmm8, %xmm12
1454c391e:     	jae	0x1454c39bd <.text+0x54c29bd>
1454c3924:     	movb	$0x0, 0x175(%rbp)
1454c392b:     	leaq	0x14e769e(%rip), %r14   # 0x1469aafd0
1454c3932:     	movl	$0x5, %r15d
1454c3938:     	movl	$0x5, %edx
1454c393d:     	movq	%r14, %rcx
1454c3940:     	callq	0x145452400 <.text+0x5451400>
1454c3945:     	nop
1454c3946:     	testq	%rax, %rax
1454c3949:     	cmovneq	%rax, %r14
1454c394d:     	cmoveq	%r15, %rdx
1454c3951:     	movq	$-0x1, 0xf0(%rbp)
1454c395c:     	movq	%r14, 0xf8(%rbp)
1454c3963:     	movq	%rdx, 0x100(%rbp)
1454c396a:     	leaq	0x14e7664(%rip), %rax   # 0x1469aafd5
1454c3971:     	movq	%rax, 0x108(%rbp)
1454c3978:     	movq	$0x18, 0x110(%rbp)
1454c3983:     	movb	$0x0, 0x118(%rbp)
1454c398a:     	leaq	0x5e0(%rsi), %rcx
1454c3991:     	xorps	%xmm2, %xmm2
1454c3994:     	cvtss2sd	%xmm8, %xmm2
1454c3999:     	movb	$0x0, 0x175(%rbp)
1454c39a0:     	leaq	0xf0(%rbp), %rdx
1454c39a7:     	callq	0x1454eff80 <.text+0x54eef80>
1454c39ac:     	nop
1454c39ad:     	movss	0x400(%rsi), %xmm0
1454c39b5:     	movss	0x458(%rsi), %xmm7
1454c39bd:     	xorps	%xmm8, %xmm8
1454c39c1:     	maxss	%xmm8, %xmm0
1454c39c6:     	callq	0x145756e6d <.text+0x5755e6d>
1454c39cb:     	cvttss2si	%xmm0, %rax
1454c39d0:     	xorl	%ecx, %ecx
1454c39d2:     	ucomiss	%xmm8, %xmm0
1454c39d6:     	cmovbl	%ecx, %eax
1454c39d9:     	ucomiss	0x427b3c(%rip), %xmm0   # 0x1458eb51c
1454c39e0:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454c39e6:     	cmovbel	%eax, %r8d
1454c39ea:     	leaq	0x8b8(%rsi), %r14
1454c39f1:     	movq	0x8b8(%rsi), %rax
1454c39f8:     	testq	%rax, %rax
1454c39fb:     	je	0x1454c3a62 <.text+0x54c2a62>
1454c39fd:     	movq	0x8c0(%rsi), %rcx
1454c3a04:     	movw	$0x16, %dx
1454c3a08:     	movzwl	0x36(%rax), %r10d
1454c3a0d:     	movl	%r10d, %r11d
1454c3a10:     	addl	%r11d, %r11d
1454c3a13:     	movq	$-0x1, %r9
1454c3a1a:     	nopw	(%rax,%rax)
1454c3a20:     	testq	%r11, %r11
1454c3a23:     	je	0x1454c3a4b <.text+0x54c2a4b>
1454c3a25:     	cmpw	0x3a(%rax,%r9,2), %dx
1454c3a2b:     	seta	%r15b
1454c3a2f:     	sbbb	$0x0, %r15b
1454c3a33:     	incq	%r9
1454c3a36:     	addq	$-0x2, %r11
1454c3a3a:     	cmpb	$0x1, %r15b
1454c3a3e:     	je	0x1454c3a20 <.text+0x54c2a20>
1454c3a40:     	movzbl	%r15b, %r10d
1454c3a44:     	testl	%r10d, %r10d
1454c3a47:     	jne	0x1454c3a4e <.text+0x54c2a4e>
1454c3a49:     	jmp	0x1454c3a5b <.text+0x54c2a5b>
1454c3a4b:     	movq	%r10, %r9
1454c3a4e:     	subq	$0x1, %rcx
1454c3a52:     	jb	0x1454c3a64 <.text+0x54c2a64>
1454c3a54:     	movq	0x50(%rax,%r9,8), %rax
1454c3a59:     	jmp	0x1454c3a08 <.text+0x54c2a08>
1454c3a5b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454c3a60:     	jmp	0x1454c3aaa <.text+0x54c2aaa>
1454c3a62:     	xorl	%eax, %eax
1454c3a64:     	movq	%r14, 0xf0(%rbp)
1454c3a6b:     	movq	%rax, 0xf8(%rbp)
1454c3a72:     	movq	$0x0, 0x100(%rbp)
1454c3a7d:     	movq	%r9, 0x108(%rbp)
1454c3a84:     	movq	$0x16, 0x110(%rbp)
1454c3a8f:     	movb	$0x0, 0x175(%rbp)
1454c3a96:     	leaq	0xb8(%rbp), %rcx
1454c3a9d:     	leaq	0xf0(%rbp), %rdx
1454c3aa4:     	callq	0x145427a50 <.text+0x5426a50>
1454c3aa9:     	nop
1454c3aaa:     	movaps	%xmm7, %xmm0
1454c3aad:     	callq	0x145756e6d <.text+0x5755e6d>
1454c3ab2:     	cvttss2si	%xmm0, %rax
1454c3ab7:     	xorl	%ecx, %ecx
1454c3ab9:     	xorps	%xmm1, %xmm1
1454c3abc:     	ucomiss	%xmm1, %xmm0
1454c3abf:     	cmovbl	%ecx, %eax
1454c3ac2:     	ucomiss	0x427a53(%rip), %xmm0   # 0x1458eb51c
1454c3ac9:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454c3acf:     	cmovbel	%eax, %r8d
1454c3ad3:     	movq	(%r14), %rax
1454c3ad6:     	testq	%rax, %rax
1454c3ad9:     	je	0x1454c3b42 <.text+0x54c2b42>
1454c3adb:     	movq	0x8c0(%rsi), %rcx
1454c3ae2:     	movw	$0x1c, %dx
1454c3ae6:     	movzwl	0x36(%rax), %r10d
1454c3aeb:     	movl	%r10d, %r11d
1454c3aee:     	addl	%r11d, %r11d
1454c3af1:     	movq	$-0x1, %r9
1454c3af8:     	nopl	(%rax,%rax)
1454c3b00:     	testq	%r11, %r11
1454c3b03:     	je	0x1454c3b2b <.text+0x54c2b2b>
1454c3b05:     	cmpw	0x3a(%rax,%r9,2), %dx
1454c3b0b:     	seta	%r15b
1454c3b0f:     	sbbb	$0x0, %r15b
1454c3b13:     	incq	%r9
1454c3b16:     	addq	$-0x2, %r11
1454c3b1a:     	cmpb	$0x1, %r15b
1454c3b1e:     	je	0x1454c3b00 <.text+0x54c2b00>
1454c3b20:     	movzbl	%r15b, %r10d
1454c3b24:     	testl	%r10d, %r10d
1454c3b27:     	jne	0x1454c3b2e <.text+0x54c2b2e>
1454c3b29:     	jmp	0x1454c3b3b <.text+0x54c2b3b>
1454c3b2b:     	movq	%r10, %r9
1454c3b2e:     	subq	$0x1, %rcx
1454c3b32:     	jb	0x1454c3b44 <.text+0x54c2b44>
1454c3b34:     	movq	0x50(%rax,%r9,8), %rax
1454c3b39:     	jmp	0x1454c3ae6 <.text+0x54c2ae6>
1454c3b3b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454c3b40:     	jmp	0x1454c3b8a <.text+0x54c2b8a>
1454c3b42:     	xorl	%eax, %eax
1454c3b44:     	movq	%r14, 0xf0(%rbp)
1454c3b4b:     	movq	%rax, 0xf8(%rbp)
1454c3b52:     	movq	$0x0, 0x100(%rbp)
1454c3b5d:     	movq	%r9, 0x108(%rbp)
1454c3b64:     	movq	$0x1c, 0x110(%rbp)
1454c3b6f:     	movb	$0x0, 0x175(%rbp)
1454c3b76:     	leaq	0xb8(%rbp), %rcx
1454c3b7d:     	leaq	0xf0(%rbp), %rdx
1454c3b84:     	callq	0x145427a50 <.text+0x5426a50>
1454c3b89:     	nop
1454c3b8a:     	ucomiss	%xmm11, %xmm12
1454c3b8e:     	jb	0x1454c3c4a <.text+0x54c2c4a>
1454c3b94:     	movq	0x4c8(%rsi), %rax
1454c3b9b:     	movq	0x4d0(%rsi), %rcx
1454c3ba2:     	leaq	-0x160(%rax), %r9
1454c3ba9:     	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454c3bb0:     	testq	%r8, %r8
1454c3bb3:     	je	0x1454c3c5a <.text+0x54c2c5a>
1454c3bb9:     	leaq	0x160(%r9), %rdx
1454c3bc0:     	addq	$-0x160, %r8            # imm = 0xFEA0
1454c3bc7:     	cmpq	%rdi, 0x1e8(%r9)
1454c3bce:     	movq	%rdx, %r9
1454c3bd1:     	jne	0x1454c3bb0 <.text+0x54c2bb0>
1454c3bd3:     	movss	0xf4(%rdx), %xmm7
1454c3bdb:     	movb	$0x0, 0x175(%rbp)
1454c3be2:     	leaq	0xf0(%rbp), %rcx
1454c3be9:     	callq	0x145537d10 <.text+0x5536d10>
1454c3bee:     	nop
1454c3bef:     	movss	%xmm7, 0x108(%rbp)
1454c3bf7:     	movlps	%xmm9, 0x10c(%rbp)
1454c3bff:     	movss	%xmm10, 0x114(%rbp)
1454c3c08:     	movq	0xf0(%rbp), %rax
1454c3c0f:     	movq	%rax, 0xe0(%rbp)
1454c3c16:     	movq	0xf8(%rbp), %rax
1454c3c1d:     	movq	%rax, 0x80(%rbp)
1454c3c24:     	movups	0x100(%rbp), %xmm0
1454c3c2b:     	movaps	%xmm0, (%rbp)
1454c3c2f:     	movq	0x110(%rbp), %rax
1454c3c36:     	movq	%rax, 0x10(%rbp)
1454c3c3a:     	movq	0x4c8(%rsi), %rax
1454c3c41:     	movq	0x4d0(%rsi), %rcx
1454c3c48:     	jmp	0x1454c3c65 <.text+0x54c2c65>
1454c3c4a:     	movq	$-0x1, 0xe0(%rbp)
1454c3c55:     	jmp	0x1454c4d60 <.text+0x54c3d60>
1454c3c5a:     	movq	$-0x1, 0xe0(%rbp)
1454c3c65:     	movss	0x8e4(%rsi), %xmm8
1454c3c6e:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454c3c74:     	imulq	$0x160, %rcx, %rdx      # imm = 0x160
1454c3c7b:     	nopl	(%rax,%rax)
1454c3c80:     	testq	%rdx, %rdx
1454c3c83:     	je	0x1454c4d50 <.text+0x54c3d50>
1454c3c89:     	leaq	0x160(%rax), %rcx
1454c3c90:     	addq	$-0x160, %rdx           # imm = 0xFEA0
1454c3c97:     	cmpq	%rdi, 0x1e8(%rax)
1454c3c9e:     	movq	%rcx, %rax
1454c3ca1:     	jne	0x1454c3c80 <.text+0x54c2c80>
1454c3ca3:     	movss	0x128(%rcx), %xmm0
1454c3cab:     	xorps	%xmm1, %xmm1
1454c3cae:     	ucomiss	%xmm0, %xmm1
1454c3cb1:     	jae	0x1454c3d1d <.text+0x54c2d1d>
1454c3cb3:     	movaps	%xmm8, %xmm2
1454c3cb7:     	subss	0x124(%rcx), %xmm2
1454c3cbf:     	divss	%xmm0, %xmm2
1454c3cc3:     	maxss	%xmm2, %xmm1
1454c3cc7:     	movss	0x4277b1(%rip), %xmm2   # 0x1458eb480
1454c3ccf:     	minss	%xmm1, %xmm2
1454c3cd3:     	movss	0x114(%rcx), %xmm1
1454c3cdb:     	movss	0x120(%rcx), %xmm3
1454c3ce3:     	subss	%xmm1, %xmm3
1454c3ce7:     	mulss	%xmm2, %xmm3
1454c3ceb:     	addss	%xmm1, %xmm3
1454c3cef:     	movsd	0x10c(%rcx), %xmm1
1454c3cf7:     	movsd	0x118(%rcx), %xmm4
1454c3cff:     	subps	%xmm1, %xmm4
1454c3d02:     	movsldup	%xmm2, %xmm2            # xmm2 = xmm2[0,0,2,2]
1454c3d06:     	mulps	%xmm4, %xmm2
1454c3d09:     	addps	%xmm1, %xmm2
1454c3d0c:     	movlps	%xmm2, 0x158(%rbp)
1454c3d13:     	movss	%xmm3, 0x160(%rbp)
1454c3d1b:     	jmp	0x1454c3d37 <.text+0x54c2d37>
1454c3d1d:     	movl	0x120(%rcx), %eax
1454c3d23:     	movl	%eax, 0x160(%rbp)
1454c3d29:     	movq	0x118(%rcx), %rax
1454c3d30:     	movq	%rax, 0x158(%rbp)
1454c3d37:     	xorps	%xmm1, %xmm1
1454c3d3a:     	ucomiss	%xmm1, %xmm0
1454c3d3d:     	jbe	0x1454c3d51 <.text+0x54c2d51>
1454c3d3f:     	addss	0x124(%rcx), %xmm0
1454c3d47:     	ucomiss	%xmm8, %xmm0
1454c3d4b:     	seta	%r12b
1454c3d4f:     	jmp	0x1454c3d54 <.text+0x54c2d54>
1454c3d51:     	xorl	%r12d, %r12d
1454c3d54:     	movl	0x160(%rbp), %eax
1454c3d5a:     	movl	%eax, 0x114(%rcx)
1454c3d60:     	movq	0x158(%rbp), %rax
1454c3d67:     	movq	%rax, 0x10c(%rcx)
1454c3d6e:     	movq	0x158(%rbp), %rax
1454c3d75:     	movq	%rax, 0x118(%rcx)
1454c3d7c:     	movl	0x160(%rbp), %eax
1454c3d82:     	movl	%eax, 0x120(%rcx)
1454c3d88:     	xorps	%xmm0, %xmm0
1454c3d8b:     	movss	%xmm8, %xmm0            # xmm0 = xmm8[0],xmm0[1,2,3]
1454c3d90:     	movlps	%xmm0, 0x124(%rcx)
1454c3d97:     	movl	$0x1, 0x68(%rcx)
1454c3d9e:     	movss	%xmm8, 0x6c(%rcx)
1454c3da4:     	movq	$0x0, 0x10(%rcx)
1454c3dac:     	cmpq	$-0x1, 0x18(%rcx)
1454c3db1:     	je	0x1454c3dc0 <.text+0x54c2dc0>
1454c3db3:     	movq	0x30(%rcx), %rax
1454c3db7:     	movq	%rax, 0x150(%rbp)
1454c3dbe:     	jmp	0x1454c3dcb <.text+0x54c2dcb>
1454c3dc0:     	movq	$0x0, 0x150(%rbp)
1454c3dcb:     	movq	0x40(%rcx), %r13
1454c3dcf:     	cmpq	$-0x1, %r13
1454c3dd3:     	je	0x1454c3ddf <.text+0x54c2ddf>
1454c3dd5:     	movq	0x58(%rcx), %rax
1454c3dd9:     	movq	%rax, 0x70(%rbp)
1454c3ddd:     	jmp	0x1454c3ddf <.text+0x54c2ddf>
1454c3ddf:     	movq	0x90(%rcx), %rax
1454c3de6:     	movq	%rax, 0xb0(%rbp)
1454c3ded:     	movb	0x158(%rcx), %r15b
1454c3df4:     	callq	0x14540d290 <.text+0x540c290>
1454c3df9:     	movq	%rax, 0x168(%rbp)
1454c3e00:     	movq	%rdx, 0xe8(%rbp)
1454c3e07:     	testb	%r12b, %r12b
1454c3e0a:     	je	0x1454c3ebf <.text+0x54c2ebf>
1454c3e10:     	movq	0x878(%rsi), %rcx
1454c3e17:     	addq	$0x10, %rcx
1454c3e1b:     	movsd	0x158(%rbp), %xmm7
1454c3e23:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454c3e27:     	movaps	%xmm7, %xmm1
1454c3e2a:     	callq	0x1454627f0 <.text+0x54617f0>
1454c3e2f:     	nop
1454c3e30:     	testb	$0x1, %al
1454c3e32:     	jne	0x1454c3e3c <.text+0x54c2e3c>
1454c3e34:     	movss	0x160(%rbp), %xmm0
1454c3e3c:     	movlps	%xmm7, 0xb8(%rbp)
1454c3e43:     	movss	%xmm0, 0xc0(%rbp)
1454c3e4b:     	movl	0x908(%rsi), %r9d
1454c3e52:     	incl	%r9d
1454c3e55:     	movl	%r9d, 0x908(%rsi)
1454c3e5c:     	leaq	0xf0(%rbp), %rcx
1454c3e63:     	leaq	0xb8(%rbp), %r8
1454c3e6a:     	movq	%rdi, %rdx
1454c3e6d:     	callq	0x1454451b0 <.text+0x54441b0>
1454c3e72:     	nop
1454c3e73:     	movq	0x548(%rsi), %r14
1454c3e7a:     	cmpq	0x538(%rsi), %r14
1454c3e81:     	jne	0x1454c3e90 <.text+0x54c2e90>
1454c3e83:     	leaq	0x538(%rsi), %rcx
1454c3e8a:     	callq	0x1457580b0 <.text+0x57570b0>
1454c3e8f:     	nop
1454c3e90:     	movq	0x540(%rsi), %rax
1454c3e97:     	movq	%r14, %rcx
1454c3e9a:     	shlq	$0x5, %rcx
1454c3e9e:     	movups	0xf0(%rbp), %xmm0
1454c3ea5:     	movups	0x100(%rbp), %xmm1
1454c3eac:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c3eb1:     	movups	%xmm0, (%rax,%rcx)
1454c3eb5:     	incq	%r14
1454c3eb8:     	movq	%r14, 0x548(%rsi)
1454c3ebf:     	movq	$0x0, 0x48(%rbp)
1454c3ec7:     	movq	$0x0, 0x58(%rbp)
1454c3ecf:     	leaq	0x48(%rbp), %rax
1454c3ed3:     	movq	%rax, 0xf0(%rbp)
1454c3eda:     	xorps	%xmm0, %xmm0
1454c3edd:     	movups	%xmm0, 0xf8(%rbp)
1454c3ee4:     	movq	$0x16, 0x110(%rbp)
1454c3eef:     	leaq	0xb8(%rbp), %rcx
1454c3ef6:     	leaq	0xf0(%rbp), %rdx
1454c3efd:     	xorl	%r8d, %r8d
1454c3f00:     	callq	0x145427a50 <.text+0x5426a50>
1454c3f05:     	nop
1454c3f06:     	leaq	0x48(%rbp), %rcx
1454c3f0a:     	movw	$0x10, %dx
1454c3f0e:     	xorl	%r8d, %r8d
1454c3f11:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454c3f16:     	nop
1454c3f17:     	movl	$0x0, 0xa0(%rbp)
1454c3f21:     	movq	$0x0, 0x88(%rbp)
1454c3f2c:     	movq	$0x1, 0x90(%rbp)
1454c3f37:     	movq	$0x0, 0x98(%rbp)
1454c3f42:     	cmpq	$0x0, 0x58(%rbp)
1454c3f47:     	je	0x1454c3fa7 <.text+0x54c2fa7>
1454c3f49:     	movb	$0x1, 0x177(%rbp)
1454c3f50:     	leaq	0x88(%rbp), %rcx
1454c3f57:     	callq	0x1458e7110 <.text+0x58e6110>
1454c3f5c:     	nop
1454c3f5d:     	movq	0x90(%rbp), %rax
1454c3f64:     	movb	$0x0, (%rax)
1454c3f67:     	movq	$0x1, 0x98(%rbp)
1454c3f72:     	movb	$0x1, 0x177(%rbp)
1454c3f79:     	leaq	0x88(%rbp), %rdx
1454c3f80:     	movq	%rdi, %rcx
1454c3f83:     	callq	0x145509090 <.text+0x5508090>
1454c3f88:     	nop
1454c3f89:     	movb	$0x1, 0x177(%rbp)
1454c3f90:     	leaq	0x48(%rbp), %rcx
1454c3f94:     	leaq	0x88(%rbp), %rdx
1454c3f9b:     	callq	0x145500460 <.text+0x54ff460>
1454c3fa0:     	nop
1454c3fa1:     	incl	0xa0(%rbp)
1454c3fa7:     	movq	0x88(%rbp), %rax
1454c3fae:     	movq	0x90(%rbp), %rcx
1454c3fb5:     	movq	0x98(%rbp), %rdx
1454c3fbc:     	movq	%rdx, 0x100(%rbp)
1454c3fc3:     	movl	0xa0(%rbp), %edx
1454c3fc9:     	movl	%edx, 0x108(%rbp)
1454c3fcf:     	movl	0xa4(%rbp), %edx
1454c3fd5:     	movl	%edx, 0x10c(%rbp)
1454c3fdb:     	movq	%rax, 0xf0(%rbp)
1454c3fe2:     	movq	%rcx, 0xf8(%rbp)
1454c3fe9:     	movb	$0x0, 0x177(%rbp)
1454c3ff0:     	leaq	0xb8(%rbp), %rcx
1454c3ff7:     	leaq	0xf0(%rbp), %rdx
1454c3ffe:     	callq	0x1454ffad0 <.text+0x54fead0>
1454c4003:     	nop
1454c4004:     	movq	0x548(%rsi), %r14
1454c400b:     	cmpq	0x538(%rsi), %r14
1454c4012:     	jne	0x1454c4021 <.text+0x54c3021>
1454c4014:     	leaq	0x538(%rsi), %rcx
1454c401b:     	callq	0x1457580b0 <.text+0x57570b0>
1454c4020:     	nop
1454c4021:     	movq	0x540(%rsi), %rax
1454c4028:     	movq	%r14, %rcx
1454c402b:     	shlq	$0x5, %rcx
1454c402f:     	movups	0xb8(%rbp), %xmm0
1454c4036:     	movups	0xc8(%rbp), %xmm1
1454c403d:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c4042:     	movups	%xmm0, (%rax,%rcx)
1454c4046:     	incq	%r14
1454c4049:     	movq	%r14, 0x548(%rsi)
1454c4050:     	incl	0x65c(%rsi)
1454c4056:     	testb	%r15b, %r15b
1454c4059:     	je	0x1454c4061 <.text+0x54c3061>
1454c405b:     	incl	0x660(%rsi)
1454c4061:     	movss	0x494(%rsi), %xmm12
1454c406a:     	xorps	%xmm0, %xmm0
1454c406d:     	ucomiss	%xmm0, %xmm12
1454c4071:     	jbe	0x1454c41d3 <.text+0x54c31d3>
1454c4077:     	movb	$0x0, 0x177(%rbp)
1454c407e:     	leaq	0x14e77cd(%rip), %r15   # 0x1469ab852
1454c4085:     	movl	$0xf, %edx
1454c408a:     	movq	%r15, %rcx
1454c408d:     	callq	0x145452400 <.text+0x5451400>
1454c4092:     	nop
1454c4093:     	movss	0x400(%rsi), %xmm2
1454c409b:     	movss	0x458(%rsi), %xmm7
1454c40a3:     	addss	%xmm2, %xmm12
1454c40a8:     	movaps	%xmm12, %xmm1
1454c40ac:     	minss	%xmm7, %xmm1
1454c40b0:     	movaps	%xmm1, %xmm0
1454c40b3:     	cmpunordss	%xmm1, %xmm0
1454c40b8:     	andps	%xmm0, %xmm12
1454c40bc:     	andnps	%xmm1, %xmm0
1454c40bf:     	orps	%xmm12, %xmm0
1454c40c3:     	movss	%xmm0, 0x400(%rsi)
1454c40cb:     	movaps	%xmm0, %xmm1
1454c40ce:     	subss	%xmm2, %xmm1
1454c40d2:     	xorps	%xmm12, %xmm12
1454c40d6:     	ucomiss	%xmm1, %xmm12
1454c40da:     	jae	0x1454c4157 <.text+0x54c3157>
1454c40dc:     	testq	%rax, %rax
1454c40df:     	movl	$0xf, %ecx
1454c40e4:     	cmoveq	%rcx, %rdx
1454c40e8:     	cmovneq	%rax, %r15
1454c40ec:     	movq	$-0x1, 0xf0(%rbp)
1454c40f7:     	movq	%r15, 0xf8(%rbp)
1454c40fe:     	movq	%rdx, 0x100(%rbp)
1454c4105:     	leaq	0x14e7755(%rip), %rax   # 0x1469ab861
1454c410c:     	movq	%rax, 0x108(%rbp)
1454c4113:     	movq	$0x16, 0x110(%rbp)
1454c411e:     	movb	$0x0, 0x118(%rbp)
1454c4125:     	leaq	0x5e0(%rsi), %rcx
1454c412c:     	xorps	%xmm2, %xmm2
1454c412f:     	cvtss2sd	%xmm1, %xmm2
1454c4133:     	movb	$0x0, 0x177(%rbp)
1454c413a:     	leaq	0xf0(%rbp), %rdx
1454c4141:     	callq	0x1454eff80 <.text+0x54eef80>
1454c4146:     	nop
1454c4147:     	movss	0x400(%rsi), %xmm0
1454c414f:     	movss	0x458(%rsi), %xmm7
1454c4157:     	maxss	%xmm12, %xmm0
1454c415c:     	callq	0x145756e6d <.text+0x5755e6d>
1454c4161:     	cvttss2si	%xmm0, %r8
1454c4166:     	xorl	%r12d, %r12d
1454c4169:     	ucomiss	%xmm12, %xmm0
1454c416d:     	cmovbl	%r12d, %r8d
1454c4171:     	ucomiss	0x4273a4(%rip), %xmm0   # 0x1458eb51c
1454c4178:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454c417e:     	cmoval	%r14d, %r8d
1454c4182:     	leaq	0x8b8(%rsi), %r15
1454c4189:     	movb	$0x0, 0x177(%rbp)
1454c4190:     	movq	%r15, %rcx
1454c4193:     	movw	$0x16, %dx
1454c4197:     	callq	0x145500230 <.text+0x54ff230>
1454c419c:     	nop
1454c419d:     	movaps	%xmm7, %xmm0
1454c41a0:     	callq	0x145756e6d <.text+0x5755e6d>
1454c41a5:     	cvttss2si	%xmm0, %r8
1454c41aa:     	xorps	%xmm1, %xmm1
1454c41ad:     	ucomiss	%xmm1, %xmm0
1454c41b0:     	cmovbl	%r12d, %r8d
1454c41b4:     	ucomiss	0x427361(%rip), %xmm0   # 0x1458eb51c
1454c41bb:     	cmoval	%r14d, %r8d
1454c41bf:     	movb	$0x0, 0x177(%rbp)
1454c41c6:     	movq	%r15, %rcx
1454c41c9:     	movw	$0x1c, %dx
1454c41cd:     	callq	0x145500230 <.text+0x54ff230>
1454c41d2:     	nop
1454c41d3:     	movq	0x150(%rbp), %rcx
1454c41da:     	testq	%rcx, %rcx
1454c41dd:     	je	0x1454c422b <.text+0x54c322b>
1454c41df:     	movq	0x4c8(%rsi), %r8
1454c41e6:     	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454c41f1:     	nopw	%cs:(%rax,%rax)
1454c4200:     	testq	%rax, %rax
1454c4203:     	je	0x1454c44dd <.text+0x54c34dd>
1454c4209:     	movq	%r8, %rdx
1454c420c:     	addq	$0x160, %r8             # imm = 0x160
1454c4213:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454c4219:     	cmpb	$0x0, 0x68(%rdx)
1454c421d:     	jne	0x1454c4200 <.text+0x54c3200>
1454c421f:     	cmpq	$-0x1, 0x18(%rdx)
1454c4224:     	je	0x1454c4200 <.text+0x54c3200>
1454c4226:     	jmp	0x1454c4509 <.text+0x54c3509>
1454c422b:     	cmpq	$-0x1, %r13
1454c422f:     	je	0x1454c487e <.text+0x54c387e>
1454c4235:     	movq	0x70(%rbp), %rcx
1454c4239:     	cmpq	0x590(%rsi), %rcx
1454c4240:     	jae	0x1454c426b <.text+0x54c326b>
1454c4242:     	movq	0x588(%rsi), %rax
1454c4249:     	leaq	(%rcx,%rcx,4), %rcx
1454c424d:     	movq	$0x0, (%rax,%rcx,8)
1454c4255:     	movss	0x8e4(%rsi), %xmm0
1454c425d:     	addss	0x5039bf(%rip), %xmm0   # 0x1459c7c24
1454c4265:     	movss	%xmm0, 0x24(%rax,%rcx,8)
1454c426b:     	movq	$0x0, (%rsi)
1454c4272:     	incl	0x664(%rsi)
1454c4278:     	movb	$0x0, 0x177(%rbp)
1454c427f:     	leaq	0x14e863a(%rip), %r15   # 0x1469ac8c0
1454c4286:     	movl	$0x5e, %r14d
1454c428c:     	movl	$0x5e, %edx
1454c4291:     	movq	%r15, %rcx
1454c4294:     	callq	0x145452400 <.text+0x5451400>
1454c4299:     	nop
1454c429a:     	testq	%rax, %rax
1454c429d:     	cmovneq	%rax, %r15
1454c42a1:     	cmoveq	%r14, %rdx
1454c42a5:     	movb	$0x0, 0x177(%rbp)
1454c42ac:     	movq	%rdx, 0x20(%rsp)
1454c42b1:     	leaq	0xf0(%rbp), %rcx
1454c42b8:     	movq	0x168(%rbp), %rdx
1454c42bf:     	movq	0xe8(%rbp), %r8
1454c42c6:     	movq	%r15, %r9
1454c42c9:     	callq	0x14543f640 <.text+0x543e640>
1454c42ce:     	nop
1454c42cf:     	movq	0x548(%rsi), %r14
1454c42d6:     	cmpq	0x538(%rsi), %r14
1454c42dd:     	jne	0x1454c42ec <.text+0x54c32ec>
1454c42df:     	leaq	0x538(%rsi), %rcx
1454c42e6:     	callq	0x1457580b0 <.text+0x57570b0>
1454c42eb:     	nop
1454c42ec:     	movq	0x540(%rsi), %rax
1454c42f3:     	movq	%r14, %rcx
1454c42f6:     	shlq	$0x5, %rcx
1454c42fa:     	movups	0xf0(%rbp), %xmm0
1454c4301:     	movups	0x100(%rbp), %xmm1
1454c4308:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c430d:     	movups	%xmm0, (%rax,%rcx)
1454c4311:     	incq	%r14
1454c4314:     	movq	%r14, 0x548(%rsi)
1454c431b:     	movb	$0x0, 0x177(%rbp)
1454c4322:     	leaq	0xf0(%rbp), %rcx
1454c4329:     	movl	$0x1fee, %edx           # imm = 0x1FEE
1454c432e:     	callq	0x145440110 <.text+0x543f110>
1454c4333:     	nop
1454c4334:     	movq	0x548(%rsi), %r14
1454c433b:     	cmpq	0x538(%rsi), %r14
1454c4342:     	jne	0x1454c4351 <.text+0x54c3351>
1454c4344:     	leaq	0x538(%rsi), %rcx
1454c434b:     	callq	0x1457580b0 <.text+0x57570b0>
1454c4350:     	nop
1454c4351:     	movq	0x540(%rsi), %rax
1454c4358:     	movq	%r14, %rcx
1454c435b:     	shlq	$0x5, %rcx
1454c435f:     	movups	0xf0(%rbp), %xmm0
1454c4366:     	movups	0x100(%rbp), %xmm1
1454c436d:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c4372:     	movups	%xmm0, (%rax,%rcx)
1454c4376:     	incq	%r14
1454c4379:     	movq	%r14, 0x548(%rsi)
1454c4380:     	movb	$0x0, 0x177(%rbp)
1454c4387:     	leaq	0xf0(%rbp), %rcx
1454c438e:     	callq	0x145450bf0 <.text+0x544fbf0>
1454c4393:     	nop
1454c4394:     	movb	$0x0, 0x177(%rbp)
1454c439b:     	leaq	0x14e6596(%rip), %rax   # 0x1469aa938
1454c43a2:     	movq	%rax, 0x20(%rsp)
1454c43a7:     	movq	$0x8, 0x28(%rsp)
1454c43b0:     	leaq	0x14e6c9a(%rip), %r8    # 0x1469ab051
1454c43b7:     	leaq	0xb8(%rbp), %rcx
1454c43be:     	leaq	0xf0(%rbp), %rdx
1454c43c5:     	movl	$0x4, %r9d
1454c43cb:     	callq	0x145451620 <.text+0x5450620>
1454c43d0:     	nop
1454c43d1:     	movb	$0x0, 0x177(%rbp)
1454c43d8:     	movq	0xe8(%rbp), %rax
1454c43df:     	movq	%rax, 0x28(%rsp)
1454c43e4:     	movq	0x168(%rbp), %rax
1454c43eb:     	movq	%rax, 0x20(%rsp)
1454c43f0:     	leaq	0x14e6c2f(%rip), %r8    # 0x1469ab026
1454c43f7:     	leaq	0xf0(%rbp), %rcx
1454c43fe:     	leaq	0xb8(%rbp), %rdx
1454c4405:     	movl	$0x4, %r9d
1454c440b:     	callq	0x145451620 <.text+0x5450620>
1454c4410:     	nop
1454c4411:     	movb	$0x0, 0x177(%rbp)
1454c4418:     	leaq	0xb8(%rbp), %rcx
1454c441f:     	leaq	0xf0(%rbp), %rdx
1454c4426:     	callq	0x1454512c0 <.text+0x54502c0>
1454c442b:     	nop
1454c442c:     	movq	0x560(%rsi), %r14
1454c4433:     	cmpq	0x550(%rsi), %r14
1454c443a:     	jne	0x1454c4465 <.text+0x54c3465>
1454c443c:     	leaq	0x550(%rsi), %rcx
1454c4443:     	movq	0xb8(%rbp), %rax
1454c444a:     	movq	%rax, 0x150(%rbp)
1454c4451:     	movq	0xc0(%rbp), %rax
1454c4458:     	movq	%rax, 0x168(%rbp)
1454c445f:     	callq	0x145757f60 <.text+0x5756f60>
1454c4464:     	nop
1454c4465:     	movq	0x558(%rsi), %rax
1454c446c:     	leaq	(%r14,%r14,2), %rcx
1454c4470:     	movq	0xc8(%rbp), %rdx
1454c4477:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454c447c:     	movups	0xb8(%rbp), %xmm0
1454c4483:     	movups	%xmm0, (%rax,%rcx,8)
1454c4487:     	incq	%r14
1454c448a:     	movq	%r14, 0x560(%rsi)
1454c4491:     	movl	0x664(%rsi), %eax
1454c4497:     	leal	(%rax,%rax,4), %r8d
1454c449b:     	addl	$0x19, %r8d
1454c449f:     	movb	$0x0, 0x177(%rbp)
1454c44a6:     	leaq	0x158(%rbp), %r9
1454c44ad:     	movq	%rsi, %rcx
1454c44b0:     	movl	$0x1, %edx
1454c44b5:     	callq	0x1454c8110 <.text+0x54c7110>
1454c44ba:     	nop
1454c44bb:     	movb	$0x0, 0x177(%rbp)
1454c44c2:     	leaq	0x158(%rbp), %rdx
1454c44c9:     	movq	%rsi, %rcx
1454c44cc:     	callq	0x1454c16a0 <.text+0x54c06a0>
1454c44d1:     	nop
1454c44d2:     	incl	0x8f8(%rsi)
1454c44d8:     	jmp	0x1454c4d46 <.text+0x54c3d46>
1454c44dd:     	movl	0x654(%rsi), %eax
1454c44e3:     	cmpl	$0x2, %eax
1454c44e6:     	sete	%dl
1454c44e9:     	orb	%dl, %al
1454c44eb:     	testb	$0x1, %al
1454c44ed:     	jne	0x1454c4509 <.text+0x54c3509>
1454c44ef:     	movss	0x8e4(%rsi), %xmm0
1454c44f7:     	movl	$0x1, 0x654(%rsi)
1454c4501:     	movss	%xmm0, 0x658(%rsi)
1454c4509:     	incl	0x668(%rsi)
1454c450f:     	movb	$0x0, 0x177(%rbp)
1454c4516:     	callq	0x14540e4a0 <.text+0x540d4a0>
1454c451b:     	nop
1454c451c:     	movq	%rax, %r14
1454c451f:     	movq	%rdx, %r15
1454c4522:     	movb	$0x0, 0x177(%rbp)
1454c4529:     	leaq	0x14e7347(%rip), %r13   # 0x1469ab877
1454c4530:     	movl	$0xd, %r12d
1454c4536:     	movl	$0xd, %edx
1454c453b:     	movq	%r13, %rcx
1454c453e:     	callq	0x145452400 <.text+0x5451400>
1454c4543:     	nop
1454c4544:     	testq	%rax, %rax
1454c4547:     	cmovneq	%rax, %r13
1454c454b:     	cmoveq	%r12, %rdx
1454c454f:     	movb	$0x0, 0x177(%rbp)
1454c4556:     	movq	%rdx, 0x28(%rsp)
1454c455b:     	movq	%r13, 0x20(%rsp)
1454c4560:     	leaq	0xf0(%rbp), %rcx
1454c4567:     	movq	%rdi, %rdx
1454c456a:     	movq	%r14, %r8
1454c456d:     	movq	%r15, %r9
1454c4570:     	callq	0x145441160 <.text+0x5440160>
1454c4575:     	nop
1454c4576:     	movq	0x548(%rsi), %r14
1454c457d:     	cmpq	0x538(%rsi), %r14
1454c4584:     	jne	0x1454c4593 <.text+0x54c3593>
1454c4586:     	leaq	0x538(%rsi), %rcx
1454c458d:     	callq	0x1457580b0 <.text+0x57570b0>
1454c4592:     	nop
1454c4593:     	movq	0x540(%rsi), %rax
1454c459a:     	movq	%r14, %rcx
1454c459d:     	shlq	$0x5, %rcx
1454c45a1:     	movups	0xf0(%rbp), %xmm0
1454c45a8:     	movups	0x100(%rbp), %xmm1
1454c45af:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c45b4:     	movups	%xmm0, (%rax,%rcx)
1454c45b8:     	incq	%r14
1454c45bb:     	movq	%r14, 0x548(%rsi)
1454c45c2:     	movb	$0x0, 0x177(%rbp)
1454c45c9:     	leaq	0xf0(%rbp), %rcx
1454c45d0:     	callq	0x145450bf0 <.text+0x544fbf0>
1454c45d5:     	nop
1454c45d6:     	movb	$0x0, 0x177(%rbp)
1454c45dd:     	leaq	0x14e72a0(%rip), %rax   # 0x1469ab884
1454c45e4:     	movq	%rax, 0x20(%rsp)
1454c45e9:     	movq	$0x8, 0x28(%rsp)
1454c45f2:     	leaq	0x14e6a58(%rip), %r8    # 0x1469ab051
1454c45f9:     	leaq	0xb8(%rbp), %rcx
1454c4600:     	leaq	0xf0(%rbp), %rdx
1454c4607:     	movl	$0x4, %r9d
1454c460d:     	callq	0x145451620 <.text+0x5450620>
1454c4612:     	nop
1454c4613:     	movb	$0x1, 0x173(%rbp)
1454c461a:     	movq	0x150(%rbp), %rcx
1454c4621:     	callq	0x14540e4a0 <.text+0x540d4a0>
1454c4626:     	nop
1454c4627:     	movb	$0x0, 0x173(%rbp)
1454c462e:     	movq	%rdx, 0x28(%rsp)
1454c4633:     	movq	%rax, 0x20(%rsp)
1454c4638:     	leaq	0x14e69e7(%rip), %r8    # 0x1469ab026
1454c463f:     	leaq	0xf0(%rbp), %rcx
1454c4646:     	leaq	0xb8(%rbp), %rdx
1454c464d:     	movl	$0x4, %r9d
1454c4653:     	callq	0x145451620 <.text+0x5450620>
1454c4658:     	nop
1454c4659:     	movb	$0x0, 0x177(%rbp)
1454c4660:     	leaq	0xb8(%rbp), %rcx
1454c4667:     	leaq	0xf0(%rbp), %rdx
1454c466e:     	callq	0x1454512c0 <.text+0x54502c0>
1454c4673:     	nop
1454c4674:     	movq	0x560(%rsi), %r14
1454c467b:     	cmpq	0x550(%rsi), %r14
1454c4682:     	jne	0x1454c46ad <.text+0x54c36ad>
1454c4684:     	leaq	0x550(%rsi), %rcx
1454c468b:     	movq	0xb8(%rbp), %rax
1454c4692:     	movq	%rax, 0x168(%rbp)
1454c4699:     	movq	0xc0(%rbp), %rax
1454c46a0:     	movq	%rax, 0xe8(%rbp)
1454c46a7:     	callq	0x145757f60 <.text+0x5756f60>
1454c46ac:     	nop
1454c46ad:     	movq	0x558(%rsi), %rax
1454c46b4:     	leaq	(%r14,%r14,2), %rcx
1454c46b8:     	movq	0xc8(%rbp), %rdx
1454c46bf:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454c46c4:     	movups	0xb8(%rbp), %xmm0
1454c46cb:     	movups	%xmm0, (%rax,%rcx,8)
1454c46cf:     	incq	%r14
1454c46d2:     	movq	%r14, 0x560(%rsi)
1454c46d9:     	movl	0x668(%rsi), %eax
1454c46df:     	leal	(%rax,%rax,4), %eax
1454c46e2:     	leal	0x3c(,%rax,4), %r8d
1454c46ea:     	movb	$0x0, 0x177(%rbp)
1454c46f1:     	leaq	0x158(%rbp), %r9
1454c46f8:     	movq	%rsi, %rcx
1454c46fb:     	xorl	%edx, %edx
1454c46fd:     	callq	0x1454c8110 <.text+0x54c7110>
1454c4702:     	nop
1454c4703:     	movl	0x668(%rsi), %eax
1454c4709:     	leal	(%rax,%rax,4), %eax
1454c470c:     	leal	0x28(,%rax,4), %r8d
1454c4714:     	movsd	0x158(%rbp), %xmm12
1454c471d:     	movss	0x160(%rbp), %xmm7
1454c4725:     	movsd	0x14e5e63(%rip), %xmm0  # 0x1469aa590
1454c472d:     	addps	%xmm12, %xmm0
1454c4731:     	movlps	%xmm0, 0xf0(%rbp)
1454c4738:     	movss	%xmm7, 0xf8(%rbp)
1454c4740:     	movb	$0x0, 0x177(%rbp)
1454c4747:     	leaq	0xf0(%rbp), %r9
1454c474e:     	movq	%rsi, %rcx
1454c4751:     	movl	$0x1, %edx
1454c4756:     	callq	0x1454c8110 <.text+0x54c7110>
1454c475b:     	nop
1454c475c:     	cmpq	$0x0, 0x688(%rsi)
1454c4764:     	je	0x1454c47cb <.text+0x54c37cb>
1454c4766:     	movq	0x680(%rsi), %rax
1454c476d:     	movss	(%rax), %xmm0
1454c4771:     	ucomiss	0x8e4(%rsi), %xmm0
1454c4778:     	ja	0x1454c47cb <.text+0x54c37cb>
1454c477a:     	leaq	0x678(%rsi), %rcx
1454c4781:     	movb	$0x0, 0x177(%rbp)
1454c4788:     	leaq	0x14e6e81(%rip), %r8    # 0x1469ab610
1454c478f:     	xorl	%edx, %edx
1454c4791:     	callq	0x1455259a0 <.text+0x55249a0>
1454c4796:     	nop
1454c4797:     	addps	0x14e5dc1(%rip), %xmm12 # 0x1469aa560
1454c479f:     	movlps	%xmm12, 0xf0(%rbp)
1454c47a7:     	movss	%xmm7, 0xf8(%rbp)
1454c47af:     	movb	$0x0, 0x177(%rbp)
1454c47b6:     	leaq	0xf0(%rbp), %r9
1454c47bd:     	movq	%rsi, %rcx
1454c47c0:     	movl	$0x6, %edx
1454c47c5:     	callq	0x1454c8110 <.text+0x54c7110>
1454c47ca:     	nop
1454c47cb:     	cmpb	$0x0, 0x958(%rsi)
1454c47d2:     	jne	0x1454c4ab3 <.text+0x54c3ab3>
1454c47d8:     	movq	0x210(%rsi), %rcx
1454c47df:     	movq	0x218(%rsi), %rdx
1454c47e6:     	callq	0x14540e820 <.text+0x540d820>
1454c47eb:     	imulq	$0xf0, %rax, %rcx
1454c47f2:     	leaq	0x1251c3f(%rip), %rax   # 0x146716438
1454c47f9:     	movq	0x88(%rcx,%rax), %rdx
1454c4801:     	movq	0x150(%rbp), %r9
1454c4808:     	cmpq	%r9, %rdx
1454c480b:     	je	0x1454c48c1 <.text+0x54c38c1>
1454c4811:     	leaq	0x58(%rdx), %r8
1454c4815:     	cmpq	%r9, %r8
1454c4818:     	je	0x1454c48c6 <.text+0x54c38c6>
1454c481e:     	leaq	0xb0(%rdx), %r8
1454c4825:     	cmpq	%r9, %r8
1454c4828:     	je	0x1454c48ce <.text+0x54c38ce>
1454c482e:     	leaq	0x108(%rdx), %r8
1454c4835:     	cmpq	%r9, %r8
1454c4838:     	je	0x1454c4922 <.text+0x54c3922>
1454c483e:     	addq	$0x160, %rdx            # imm = 0x160
1454c4845:     	cmpq	%r9, %rdx
1454c4848:     	jne	0x1454c4ab3 <.text+0x54c3ab3>
1454c484e:     	movl	$0x4, %r14d
1454c4854:     	jmp	0x1454c4928 <.text+0x54c3928>
1454c4859:     	movq	%rcx, 0xf8(%rbp)
1454c4860:     	movq	$0x0, 0x100(%rbp)
1454c486b:     	movq	%r8, 0x108(%rbp)
1454c4872:     	movq	%rax, 0xf0(%rbp)
1454c4879:     	jmp	0x1454c356c <.text+0x54c256c>
1454c487e:     	movq	0xb0(%rbp), %rcx
1454c4885:     	testq	%rcx, %rcx
1454c4888:     	je	0x1454c4d46 <.text+0x54c3d46>
1454c488e:     	cmpb	$0x1, 0x4c(%rcx)
1454c4892:     	jne	0x1454c48d6 <.text+0x54c38d6>
1454c4894:     	movzwl	0x230(%rsi), %eax
1454c489b:     	xorps	%xmm0, %xmm0
1454c489e:     	cvtsi2ss	%eax, %xmm0
1454c48a2:     	divss	0x426c82(%rip), %xmm0   # 0x1458eb52c
1454c48aa:     	movss	0x14e5ced(%rip), %xmm8  # 0x1469aa5a0
1454c48b3:     	divss	%xmm0, %xmm8
1454c48b8:     	movl	0x40(%rcx), %r8d
1454c48bc:     	jmp	0x1454c4bb7 <.text+0x54c3bb7>
1454c48c1:     	xorl	%r14d, %r14d
1454c48c4:     	jmp	0x1454c4928 <.text+0x54c3928>
1454c48c6:     	movl	$0x1, %r14d
1454c48cc:     	jmp	0x1454c4928 <.text+0x54c3928>
1454c48ce:     	movl	$0x2, %r14d
1454c48d4:     	jmp	0x1454c4928 <.text+0x54c3928>
1454c48d6:     	movss	0x44(%rcx), %xmm0
1454c48db:     	addss	0x910(%rsi), %xmm0
1454c48e3:     	movss	%xmm0, 0x910(%rsi)
1454c48eb:     	movzwl	0x230(%rsi), %eax
1454c48f2:     	xorps	%xmm0, %xmm0
1454c48f5:     	cvtsi2ss	%eax, %xmm0
1454c48f9:     	divss	0x426c2b(%rip), %xmm0   # 0x1458eb52c
1454c4901:     	movss	0x14e5c96(%rip), %xmm8  # 0x1469aa5a0
1454c490a:     	divss	%xmm0, %xmm8
1454c490f:     	cmpb	$0x1, 0x4c(%rcx)
1454c4913:     	jne	0x1454c4af9 <.text+0x54c3af9>
1454c4919:     	movl	0x40(%rcx), %r8d
1454c491d:     	jmp	0x1454c4bb7 <.text+0x54c3bb7>
1454c4922:     	movl	$0x3, %r14d
1454c4928:     	addq	%rcx, %rax
1454c492b:     	movq	0x8(%rax), %rcx
1454c492f:     	movq	0x10(%rax), %rdx
1454c4933:     	callq	0x14540e820 <.text+0x540d820>
1454c4938:     	movq	%rax, %r15
1454c493b:     	leaq	0x230(%rsi), %rcx
1454c4942:     	movb	$0x0, 0x177(%rbp)
1454c4949:     	callq	0x145451160 <.text+0x5450160>
1454c494e:     	nop
1454c494f:     	movaps	%xmm0, %xmm7
1454c4952:     	movzbl	0x284(%rsi), %edx
1454c4959:     	movb	$0x0, 0x177(%rbp)
1454c4960:     	leaq	0xf0(%rbp), %rcx
1454c4967:     	movq	%r15, %r8
1454c496a:     	movq	%r14, %r9
1454c496d:     	callq	0x1454589f0 <.text+0x54579f0>
1454c4972:     	nop
1454c4973:     	movq	0xf0(%rbp), %rax
1454c497a:     	movq	%rax, 0xe8(%rbp)
1454c4981:     	movq	0xf8(%rbp), %rax
1454c4988:     	movq	%rax, 0x168(%rbp)
1454c498f:     	movq	0x100(%rbp), %rax
1454c4996:     	testq	%rax, %rax
1454c4999:     	je	0x1454c4a91 <.text+0x54c3a91>
1454c499f:     	movq	0x168(%rbp), %r13
1454c49a6:     	leaq	(,%rax,8), %r15
1454c49ae:     	addq	%r13, %r15
1454c49b1:     	movss	0x526a06(%rip), %xmm12  # 0x1459eb3c0
1454c49ba:     	jmp	0x1454c49de <.text+0x54c39de>
1454c49bc:     	movq	0x5a0(%rsi), %rax
1454c49c3:     	movl	%r12d, (%rax,%r14,4)
1454c49c7:     	incq	%r14
1454c49ca:     	movq	%r14, 0x5a8(%rsi)
1454c49d1:     	addq	$0x8, %r13
1454c49d5:     	cmpq	%r15, %r13
1454c49d8:     	je	0x1454c4a91 <.text+0x54c3a91>
1454c49de:     	movl	(%r13), %r12d
1454c49e2:     	movss	0x4(%r13), %xmm0
1454c49e8:     	movq	0x898(%rsi), %rax
1454c49ef:     	movq	0x880(%rsi), %rcx
1454c49f6:     	movq	0x888(%rsi), %rdx
1454c49fd:     	leaq	(%rax,%rcx), %r8
1454c4a01:     	rolq	$0x17, %r8
1454c4a05:     	addq	%rcx, %r8
1454c4a08:     	movq	%rdx, %r9
1454c4a0b:     	shlq	$0x11, %r9
1454c4a0f:     	movq	0x890(%rsi), %r10
1454c4a16:     	xorq	%rcx, %r10
1454c4a19:     	xorq	%rdx, %rax
1454c4a1c:     	xorq	%r10, %rdx
1454c4a1f:     	movq	%rdx, 0x888(%rsi)
1454c4a26:     	xorq	%rax, %rcx
1454c4a29:     	movq	%rcx, 0x880(%rsi)
1454c4a30:     	xorq	%r9, %r10
1454c4a33:     	rolq	$0x2d, %rax
1454c4a37:     	shrq	$0x28, %r8
1454c4a3b:     	xorps	%xmm1, %xmm1
1454c4a3e:     	cvtsi2ss	%r8d, %xmm1
1454c4a43:     	movq	%r10, 0x890(%rsi)
1454c4a4a:     	movq	%rax, 0x898(%rsi)
1454c4a51:     	addss	0x208(%rsi), %xmm0
1454c4a59:     	mulss	%xmm12, %xmm1
1454c4a5e:     	mulss	%xmm7, %xmm0
1454c4a62:     	ucomiss	%xmm1, %xmm0
1454c4a65:     	jbe	0x1454c49d1 <.text+0x54c39d1>
1454c4a6b:     	movq	0x5a8(%rsi), %r14
1454c4a72:     	cmpq	0x598(%rsi), %r14
1454c4a79:     	jne	0x1454c49bc <.text+0x54c39bc>
1454c4a7f:     	leaq	0x598(%rsi), %rcx
1454c4a86:     	callq	0x14575b6b0 <.text+0x575a6b0>
1454c4a8b:     	nop
1454c4a8c:     	jmp	0x1454c49bc <.text+0x54c39bc>
1454c4a91:     	movq	0xe8(%rbp), %rdx
1454c4a98:     	testq	%rdx, %rdx
1454c4a9b:     	je	0x1454c4ab3 <.text+0x54c3ab3>
1454c4a9d:     	shlq	$0x3, %rdx
1454c4aa1:     	movl	$0x4, %r8d
1454c4aa7:     	movq	0x168(%rbp), %rcx
1454c4aae:     	callq	0x1400021d0 <.text+0x11d0>
1454c4ab3:     	movb	$0x0, 0x177(%rbp)
1454c4aba:     	movq	%rsi, %rcx
1454c4abd:     	callq	0x1454d2380 <.text+0x54d1380>
1454c4ac2:     	nop
1454c4ac3:     	movq	0x150(%rbp), %rax
1454c4aca:     	cmpb	$0x1, 0x54(%rax)
1454c4ace:     	jne	0x1454c4d46 <.text+0x54c3d46>
1454c4ad4:     	cmpb	$0x0, 0x858(%rsi)
1454c4adb:     	jne	0x1454c4d46 <.text+0x54c3d46>
1454c4ae1:     	movl	$0x1, 0x858(%rsi)
1454c4aeb:     	movss	%xmm8, 0x85c(%rsi)
1454c4af4:     	jmp	0x1454c4d46 <.text+0x54c3d46>
1454c4af9:     	movl	0x40(%rcx), %r9d
1454c4afd:     	movq	0x898(%rsi), %rax
1454c4b04:     	movq	0x880(%rsi), %rdx
1454c4b0b:     	movq	0x888(%rsi), %r10
1454c4b12:     	leaq	(%rax,%rdx), %rcx
1454c4b16:     	rolq	$0x17, %rcx
1454c4b1a:     	addq	%rdx, %rcx
1454c4b1d:     	movq	%r10, %r11
1454c4b20:     	shlq	$0x11, %r11
1454c4b24:     	movq	0x890(%rsi), %r8
1454c4b2b:     	xorq	%rdx, %r8
1454c4b2e:     	xorq	%r10, %rax
1454c4b31:     	xorq	%r8, %r10
1454c4b34:     	movq	%r10, 0x888(%rsi)
1454c4b3b:     	xorq	%rax, %rdx
1454c4b3e:     	xorq	%r11, %r8
1454c4b41:     	rolq	$0x2d, %rax
1454c4b45:     	cvtsi2ss	%r9, %xmm7
1454c4b4a:     	mulss	%xmm8, %xmm7
1454c4b4f:     	cvttss2si	%xmm7, %r9
1454c4b54:     	xorl	%r10d, %r10d
1454c4b57:     	xorps	%xmm0, %xmm0
1454c4b5a:     	ucomiss	%xmm0, %xmm7
1454c4b5d:     	cmovael	%r9d, %r10d
1454c4b61:     	movq	%rdx, 0x880(%rsi)
1454c4b68:     	ucomiss	0x4269ad(%rip), %xmm7   # 0x1458eb51c
1454c4b6f:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454c4b75:     	cmovbel	%r10d, %r14d
1454c4b79:     	shrq	$0x28, %rcx
1454c4b7d:     	xorps	%xmm12, %xmm12
1454c4b81:     	cvtsi2ss	%ecx, %xmm12
1454c4b86:     	movq	%r8, 0x890(%rsi)
1454c4b8d:     	movq	%rax, 0x898(%rsi)
1454c4b94:     	mulss	0x526823(%rip), %xmm12  # 0x1459eb3c0
1454c4b9d:     	movaps	%xmm7, %xmm0
1454c4ba0:     	callq	0x145756e25 <.text+0x5755e25>
1454c4ba5:     	subss	%xmm0, %xmm7
1454c4ba9:     	xorl	%r8d, %r8d
1454c4bac:     	ucomiss	%xmm12, %xmm7
1454c4bb0:     	seta	%r8b
1454c4bb4:     	addl	%r14d, %r8d
1454c4bb7:     	testl	%r8d, %r8d
1454c4bba:     	je	0x1454c4bd5 <.text+0x54c3bd5>
1454c4bbc:     	movb	$0x0, 0x177(%rbp)
1454c4bc3:     	leaq	0x158(%rbp), %r9
1454c4bca:     	movq	%rsi, %rcx
1454c4bcd:     	xorl	%edx, %edx
1454c4bcf:     	callq	0x1454c8110 <.text+0x54c7110>
1454c4bd4:     	nop
1454c4bd5:     	movq	0xb0(%rbp), %r11
1454c4bdc:     	cmpb	$0x0, 0x4c(%r11)
1454c4be1:     	jne	0x1454c4bee <.text+0x54c3bee>
1454c4be3:     	mulss	0x431a34(%rip), %xmm8   # 0x1458f6620
1454c4bec:     	jmp	0x1454c4bf7 <.text+0x54c3bf7>
1454c4bee:     	movss	0x426889(%rip), %xmm8   # 0x1458eb480
1454c4bf7:     	movq	0x898(%rsi), %rax
1454c4bfe:     	movq	0x880(%rsi), %rcx
1454c4c05:     	leaq	(%rax,%rcx), %rdx
1454c4c09:     	rolq	$0x17, %rdx
1454c4c0d:     	movq	0x888(%rsi), %r8
1454c4c14:     	addq	%rcx, %rdx
1454c4c17:     	movq	%r8, %r9
1454c4c1a:     	shlq	$0x11, %r9
1454c4c1e:     	movq	0x890(%rsi), %r10
1454c4c25:     	xorq	%rcx, %r10
1454c4c28:     	xorq	%r8, %rax
1454c4c2b:     	xorq	%r10, %r8
1454c4c2e:     	movq	%r8, 0x888(%rsi)
1454c4c35:     	xorq	%rax, %rcx
1454c4c38:     	movq	%rcx, 0x880(%rsi)
1454c4c3f:     	xorq	%r9, %r10
1454c4c42:     	movq	%r10, 0x890(%rsi)
1454c4c49:     	rolq	$0x2d, %rax
1454c4c4d:     	movq	%rax, 0x898(%rsi)
1454c4c54:     	shrq	$0x28, %rdx
1454c4c58:     	xorps	%xmm0, %xmm0
1454c4c5b:     	cvtsi2ss	%edx, %xmm0
1454c4c5f:     	mulss	0x526759(%rip), %xmm0   # 0x1459eb3c0
1454c4c67:     	ucomiss	%xmm0, %xmm8
1454c4c6b:     	jbe	0x1454c4ce6 <.text+0x54c3ce6>
1454c4c6d:     	movl	$0xf, %r8d
1454c4c73:     	cmpb	$0x0, 0x4c(%r11)
1454c4c78:     	jne	0x1454c4c9d <.text+0x54c3c9d>
1454c4c7a:     	leaq	0x880(%rsi), %rcx
1454c4c81:     	movb	$0x0, 0x177(%rbp)
1454c4c88:     	xorl	%edx, %edx
1454c4c8a:     	movl	$0x3, %r8d
1454c4c90:     	callq	0x1454f9a40 <.text+0x54f8a40>
1454c4c95:     	nop
1454c4c96:     	movl	%eax, %r8d
1454c4c99:     	addl	$0x2, %r8d
1454c4c9d:     	movsd	0x158(%rbp), %xmm0
1454c4ca5:     	addps	0x503864(%rip), %xmm0   # 0x1459c8510
1454c4cac:     	movss	0x160(%rbp), %xmm1
1454c4cb4:     	movlps	%xmm0, 0xf0(%rbp)
1454c4cbb:     	movss	%xmm1, 0xf8(%rbp)
1454c4cc3:     	movb	$0x0, 0x177(%rbp)
1454c4cca:     	leaq	0xf0(%rbp), %r9
1454c4cd1:     	movq	%rsi, %rcx
1454c4cd4:     	movl	$0x1, %edx
1454c4cd9:     	callq	0x1454c8110 <.text+0x54c7110>
1454c4cde:     	nop
1454c4cdf:     	movq	0xb0(%rbp), %r11
1454c4ce6:     	cmpb	$0x0, 0x4c(%r11)
1454c4ceb:     	je	0x1454c4d46 <.text+0x54c3d46>
1454c4ced:     	movsd	0x158(%rbp), %xmm7
1454c4cf5:     	addps	0x14e58b4(%rip), %xmm7  # 0x1469aa5b0
1454c4cfc:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454c4d00:     	movq	0x878(%rsi), %rcx
1454c4d07:     	addq	$0x10, %rcx
1454c4d0b:     	movb	$0x0, 0x177(%rbp)
1454c4d12:     	movaps	%xmm7, %xmm1
1454c4d15:     	callq	0x1454606b0 <.text+0x545f6b0>
1454c4d1a:     	nop
1454c4d1b:     	movlps	%xmm7, 0xf0(%rbp)
1454c4d22:     	movss	%xmm0, 0xf8(%rbp)
1454c4d2a:     	movb	$0x0, 0x177(%rbp)
1454c4d31:     	leaq	0xf0(%rbp), %r9
1454c4d38:     	movq	%rsi, %rcx
1454c4d3b:     	movl	$0x2, %edx
1454c4d40:     	callq	0x1454c8110 <.text+0x54c7110>
1454c4d45:     	nop
1454c4d46:     	leaq	0x48(%rbp), %rcx
1454c4d4a:     	callq	0x1455127d0 <.text+0x55117d0>
1454c4d4f:     	nop
1454c4d50:     	movaps	(%rbp), %xmm0
1454c4d54:     	movaps	%xmm0, -0x40(%rbp)
1454c4d58:     	movq	0x10(%rbp), %rax
1454c4d5c:     	movq	%rax, -0x30(%rbp)
1454c4d60:     	movlps	%xmm9, 0x60(%rbp)
1454c4d65:     	movss	%xmm10, 0x68(%rbp)
1454c4d6b:     	movq	%rdi, -0x10(%rbp)
1454c4d6f:     	movq	0x298(%rsi), %rax
1454c4d76:     	imulq	$0x58, 0x2a0(%rsi), %rcx
1454c4d7e:     	xorl	%edx, %edx
1454c4d80:     	cmpq	%rdx, %rcx
1454c4d83:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c4d89:     	movq	(%rax,%rdx), %r8
1454c4d8d:     	addq	$0x58, %rdx
1454c4d91:     	cmpb	$0xb, 0x75(%r8)
1454c4d96:     	jne	0x1454c4d80 <.text+0x54c3d80>
1454c4d98:     	movzbl	0x111(%rsi), %r15d
1454c4da0:     	testl	%r15d, %r15d
1454c4da3:     	sete	%r13b
1454c4da7:     	cmpq	$0x0, 0x40(%rsi)
1454c4dac:     	sete	%al
1454c4daf:     	cmpl	$0x0, 0x104(%rsi)
1454c4db6:     	sete	%cl
1454c4db9:     	andb	%al, %cl
1454c4dbb:     	movzbl	0x7ec(%rsi), %eax
1454c4dc2:     	xorb	$0x1, %al
1454c4dc4:     	andb	%cl, %al
1454c4dc6:     	xorps	%xmm0, %xmm0
1454c4dc9:     	ucomiss	%xmm11, %xmm0
1454c4dcd:     	jb	0x1454c4ded <.text+0x54c3ded>
1454c4dcf:     	movl	%r15d, %ecx
1454c4dd2:     	leaq	0x14e7fbb(%rip), %rdx   # 0x1469acd94
1454c4dd9:     	movslq	(%rdx,%rcx,4), %rcx
1454c4ddd:     	addq	%rdx, %rcx
1454c4de0:     	movl	%eax, %edx
1454c4de2:     	jmpq	*%rcx
1454c4de4:     	movzbl	0x30(%rsi), %edx
1454c4de8:     	xorb	$0x1, %dl
1454c4deb:     	jmp	0x1454c4def <.text+0x54c3def>
1454c4ded:     	xorl	%edx, %edx
1454c4def:     	movl	%edx, 0x150(%rbp)
1454c4df5:     	andb	%al, %r13b
1454c4df8:     	leaq	0x798(%rsi), %r14
1454c4dff:     	movq	0x7a0(%rsi), %rdx
1454c4e06:     	movq	0x7a8(%rsi), %rcx
1454c4e0d:     	movabsq	$0xffffffffffffff8, %r8 # imm = 0xFFFFFFFFFFFFFF8
1454c4e17:     	andq	%rcx, %r8
1454c4e1a:     	xorl	%r9d, %r9d
1454c4e1d:     	nopl	(%rax)
1454c4e20:     	cmpq	%r9, %r8
1454c4e23:     	je	0x1454c4e62 <.text+0x54c3e62>
1454c4e25:     	cmpq	%rdi, (%rdx,%r9,8)
1454c4e29:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e2b:     	cmpq	%rdi, 0x8(%rdx,%r9,8)
1454c4e30:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e32:     	cmpq	%rdi, 0x10(%rdx,%r9,8)
1454c4e37:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e39:     	cmpq	%rdi, 0x18(%rdx,%r9,8)
1454c4e3e:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e40:     	cmpq	%rdi, 0x20(%rdx,%r9,8)
1454c4e45:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e47:     	cmpq	%rdi, 0x28(%rdx,%r9,8)
1454c4e4c:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e4e:     	cmpq	%rdi, 0x30(%rdx,%r9,8)
1454c4e53:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e55:     	cmpq	%rdi, 0x38(%rdx,%r9,8)
1454c4e5a:     	leaq	0x8(%r9), %r9
1454c4e5e:     	jne	0x1454c4e20 <.text+0x54c3e20>
1454c4e60:     	jmp	0x1454c4e78 <.text+0x54c3e78>
1454c4e62:     	shll	$0x3, %ecx
1454c4e65:     	andl	$0x38, %ecx
1454c4e68:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c4e6e:     	cmpq	%rdi, (%rdx,%r8,8)
1454c4e72:     	jne	0x1454c4fcd <.text+0x54c3fcd>
1454c4e78:     	cmpb	$0x2, %r15b
1454c4e7c:     	setb	%cl
1454c4e7f:     	andb	%al, %cl
1454c4e81:     	cmpb	$0x1, %cl
1454c4e84:     	jne	0x1454c4fb3 <.text+0x54c3fb3>
1454c4e8a:     	movq	$-0x160, %rax           # imm = 0xFEA0
1454c4e91:     	addq	0x4c8(%rsi), %rax
1454c4e98:     	imulq	$0x160, 0x4d0(%rsi), %rcx # imm = 0x160
1454c4ea3:     	nopw	%cs:(%rax,%rax)
1454c4eb0:     	movb	$0x1, %r12b
1454c4eb3:     	testq	%rcx, %rcx
1454c4eb6:     	je	0x1454c4fd9 <.text+0x54c3fd9>
1454c4ebc:     	leaq	0x160(%rax), %rdx
1454c4ec3:     	addq	$-0x160, %rcx           # imm = 0xFEA0
1454c4eca:     	cmpq	%rdi, 0x1e8(%rax)
1454c4ed1:     	movq	%rdx, %rax
1454c4ed4:     	jne	0x1454c4eb0 <.text+0x54c3eb0>
1454c4ed6:     	movss	0x8e4(%rsi), %xmm2
1454c4ede:     	movss	0xf4(%rdx), %xmm7
1454c4ee6:     	leaq	0xf4(%rbp), %rcx
1454c4eed:     	callq	0x14540d200 <.text+0x540c200>
1454c4ef2:     	movl	0xfc(%rbp), %eax
1454c4ef8:     	movl	%eax, 0x160(%rbp)
1454c4efe:     	movq	0xf4(%rbp), %rax
1454c4f05:     	movq	%rax, 0x158(%rbp)
1454c4f0c:     	movq	%rdi, 0xf0(%rbp)
1454c4f13:     	leaq	0xf0(%rbp), %rdx
1454c4f1a:     	movq	%r14, %rcx
1454c4f1d:     	callq	0x145524410 <.text+0x5523410>
1454c4f22:     	movss	0x8e4(%rsi), %xmm0
1454c4f2a:     	movq	0x4c8(%rsi), %rax
1454c4f31:     	imulq	$0x160, 0x4d0(%rsi), %rdx # imm = 0x160
1454c4f3c:     	xorl	%ecx, %ecx
1454c4f3e:     	movq	%rax, %r8
1454c4f41:     	cmpq	%rcx, %rdx
1454c4f44:     	je	0x1454c5687 <.text+0x54c4687>
1454c4f4a:     	addq	$0x160, %rcx            # imm = 0x160
1454c4f51:     	cmpq	%rdi, 0x88(%r8)
1454c4f58:     	leaq	0x160(%r8), %r8
1454c4f5f:     	jne	0x1454c4f41 <.text+0x54c3f41>
1454c4f61:     	movl	$0x0, -0x20(%rax,%rcx)
1454c4f69:     	movss	%xmm0, -0x34(%rax,%rcx)
1454c4f6f:     	movl	-0xf8(%rax,%rcx), %r8d
1454c4f77:     	movq	-0xd0(%rax,%rcx), %rdx
1454c4f7f:     	testq	%rdx, %rdx
1454c4f82:     	je	0x1454c5666 <.text+0x54c4666>
1454c4f88:     	testl	%r8d, %r8d
1454c4f8b:     	jne	0x1454c5687 <.text+0x54c4687>
1454c4f91:     	movss	-0x58(%rax,%rcx), %xmm3
1454c4f97:     	movl	0x24(%rdx), %r8d
1454c4f9b:     	movb	$0x1, 0x176(%rbp)
1454c4fa2:     	movq	%rsi, %rcx
1454c4fa5:     	movq	%rdi, %rdx
1454c4fa8:     	callq	0x1454d5440 <.text+0x54d4440>
1454c4fad:     	nop
1454c4fae:     	jmp	0x1454c566b <.text+0x54c466b>
1454c4fb3:     	movb	$0x1, %r12b
1454c4fb6:     	xorps	%xmm0, %xmm0
1454c4fb9:     	ucomiss	%xmm11, %xmm0
1454c4fbd:     	jb	0x1454c4fd9 <.text+0x54c3fd9>
1454c4fbf:     	leaq	-0x10(%rbp), %rdx
1454c4fc3:     	movq	%r14, %rcx
1454c4fc6:     	callq	0x145524410 <.text+0x5523410>
1454c4fcb:     	jmp	0x1454c4fd9 <.text+0x54c3fd9>
1454c4fcd:     	cmpl	$0x8, %ecx
1454c4fd0:     	jne	0x1454c5119 <.text+0x54c4119>
1454c4fd6:     	xorl	%r12d, %r12d
1454c4fd9:     	testb	%r13b, %r13b
1454c4fdc:     	je	0x1454c59e9 <.text+0x54c49e9>
1454c4fe2:     	movq	0x2a0(%rsi), %rcx
1454c4fe9:     	testq	%rcx, %rcx
1454c4fec:     	je	0x1454c51eb <.text+0x54c41eb>
1454c4ff2:     	movq	0x298(%rsi), %rax
1454c4ff9:     	imulq	$0x58, %rcx, %rcx
1454c4ffd:     	xorl	%edx, %edx
1454c4fff:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454c5009:     	jmp	0x1454c501d <.text+0x54c401d>
1454c500b:     	nopl	(%rax,%rax)
1454c5010:     	addq	$0x58, %rdx
1454c5014:     	cmpq	%rdx, %rcx
1454c5017:     	je	0x1454c50b8 <.text+0x54c40b8>
1454c501d:     	movq	(%rax,%rdx), %r9
1454c5021:     	cmpq	$0x9, 0x8(%r9)
1454c5026:     	jne	0x1454c5010 <.text+0x54c4010>
1454c5028:     	movq	(%r9), %r9
1454c502b:     	movq	(%r9), %r10
1454c502e:     	xorq	%r8, %r10
1454c5031:     	movzbl	0x8(%r9), %r9d
1454c5036:     	xorq	$0x65, %r9
1454c503a:     	orq	%r10, %r9
1454c503d:     	jne	0x1454c5010 <.text+0x54c4010>
1454c503f:     	movss	0x7c8(%rsi), %xmm0
1454c5047:     	movss	0x8e4(%rsi), %xmm1
1454c504f:     	movaps	%xmm0, %xmm2
1454c5052:     	minss	0x4315ca(%rip), %xmm2   # 0x1458f6624
1454c505a:     	xorps	%xmm3, %xmm3
1454c505d:     	maxss	%xmm3, %xmm2
1454c5061:     	subss	%xmm2, %xmm0
1454c5065:     	movss	%xmm0, 0x7c8(%rsi)
1454c506d:     	addss	0x7c4(%rsi), %xmm2
1454c5075:     	minss	0x4264af(%rip), %xmm2   # 0x1458eb52c
1454c507d:     	movss	%xmm2, 0x7c4(%rsi)
1454c5085:     	movss	%xmm1, 0x7cc(%rsi)
1454c508d:     	movb	$0x1, 0x176(%rbp)
1454c5094:     	movq	%rsi, %rcx
1454c5097:     	callq	0x1454d69f0 <.text+0x54d59f0>
1454c509c:     	nop
1454c509d:     	movq	0x2a0(%rsi), %rcx
1454c50a4:     	testq	%rcx, %rcx
1454c50a7:     	je	0x1454c51eb <.text+0x54c41eb>
1454c50ad:     	movq	0x298(%rsi), %rax
1454c50b4:     	imulq	$0x58, %rcx, %rcx
1454c50b8:     	addq	%rax, %rcx
1454c50bb:     	movabsq	$0x7461665f6c616573, %rdx # imm = 0x7461665F6C616573
1454c50c5:     	jmp	0x1454c50dd <.text+0x54c40dd>
1454c50c7:     	nopw	(%rax,%rax)
1454c50d0:     	addq	$0x58, %rax
1454c50d4:     	cmpq	%rcx, %rax
1454c50d7:     	je	0x1454c51eb <.text+0x54c41eb>
1454c50dd:     	movq	(%rax), %r8
1454c50e0:     	cmpq	$0x9, 0x8(%r8)
1454c50e5:     	jne	0x1454c50d0 <.text+0x54c40d0>
1454c50e7:     	movq	(%r8), %r8
1454c50ea:     	movq	(%r8), %r9
1454c50ed:     	xorq	%rdx, %r9
1454c50f0:     	movzbl	0x8(%r8), %r8d
1454c50f5:     	xorq	$0x65, %r8
1454c50f9:     	orq	%r9, %r8
1454c50fc:     	jne	0x1454c50d0 <.text+0x54c40d0>
1454c50fe:     	cmpb	$0x0, 0x298(%rbp)
1454c5105:     	jne	0x1454c5177 <.text+0x54c4177>
1454c5107:     	movss	0x426370(%rip), %xmm8   # 0x1458eb480
1454c5110:     	jmp	0x1454c5180 <.text+0x54c4180>
1454c5112:     	movb	$0x1, %dl
1454c5114:     	jmp	0x1454c4def <.text+0x54c3def>
1454c5119:     	cmpq	%rdi, 0x8(%rdx,%r8,8)
1454c511e:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c5124:     	cmpl	$0x10, %ecx
1454c5127:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c512d:     	cmpq	%rdi, 0x10(%rdx,%r8,8)
1454c5132:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c5138:     	cmpl	$0x18, %ecx
1454c513b:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c5141:     	cmpq	%rdi, 0x18(%rdx,%r8,8)
1454c5146:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c514c:     	cmpl	$0x20, %ecx
1454c514f:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c5155:     	cmpq	%rdi, 0x20(%rdx,%r8,8)
1454c515a:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c5160:     	movl	%r15d, %r9d
1454c5163:     	cmpl	$0x28, %ecx
1454c5166:     	jne	0x1454c63af <.text+0x54c53af>
1454c516c:     	xorl	%r12d, %r12d
1454c516f:     	movl	%r9d, %r15d
1454c5172:     	jmp	0x1454c4fd9 <.text+0x54c3fd9>
1454c5177:     	movss	0x4314a4(%rip), %xmm8   # 0x1458f6624
1454c5180:     	movss	0x7d4(%rsi), %xmm7
1454c5188:     	movaps	%xmm7, %xmm0
1454c518b:     	callq	0x145756e55 <.text+0x5755e55>
1454c5190:     	minss	%xmm8, %xmm0
1454c5195:     	xorps	%xmm1, %xmm1
1454c5198:     	maxss	%xmm1, %xmm0
1454c519c:     	subss	%xmm0, %xmm7
1454c51a0:     	cvttss2si	%xmm0, %rax
1454c51a5:     	xorl	%ecx, %ecx
1454c51a7:     	ucomiss	%xmm1, %xmm0
1454c51aa:     	cmovael	%eax, %ecx
1454c51ad:     	movss	%xmm7, 0x7d4(%rsi)
1454c51b5:     	ucomiss	0x426360(%rip), %xmm0   # 0x1458eb51c
1454c51bc:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454c51c1:     	cmovbel	%ecx, %eax
1454c51c4:     	addl	0x7d0(%rsi), %eax
1454c51ca:     	cmpl	$0x5, %eax
1454c51cd:     	movl	$0x5, %ecx
1454c51d2:     	cmovbl	%eax, %ecx
1454c51d5:     	movl	%ecx, 0x7d0(%rsi)
1454c51db:     	movb	$0x1, 0x176(%rbp)
1454c51e2:     	movq	%rsi, %rcx
1454c51e5:     	callq	0x1454d7020 <.text+0x54d6020>
1454c51ea:     	nop
1454c51eb:     	movq	0x770(%rsi), %rax
1454c51f2:     	movq	0x778(%rsi), %rcx
1454c51f9:     	shlq	$0x4, %rcx
1454c51fd:     	xorl	%r8d, %r8d
1454c5200:     	cmpq	%r8, %rcx
1454c5203:     	je	0x1454c5984 <.text+0x54c4984>
1454c5209:     	leaq	0x10(%r8), %rdx
1454c520d:     	cmpq	%rdi, (%rax,%r8)
1454c5211:     	movq	%rdx, %r8
1454c5214:     	jne	0x1454c5200 <.text+0x54c4200>
1454c5216:     	movss	-0x8(%rax,%rdx), %xmm0
1454c521c:     	movss	0x42625c(%rip), %xmm7   # 0x1458eb480
1454c5224:     	ucomiss	%xmm0, %xmm7
1454c5227:     	ja	0x1454c5984 <.text+0x54c4984>
1454c522d:     	addss	0x4262c7(%rip), %xmm0   # 0x1458eb4fc
1454c5235:     	movss	%xmm0, -0x8(%rax,%rdx)
1454c523b:     	movq	0x2a0(%rsi), %rcx
1454c5242:     	testq	%rcx, %rcx
1454c5245:     	je	0x1454c5984 <.text+0x54c4984>
1454c524b:     	movq	0x298(%rsi), %rax
1454c5252:     	imulq	$0x58, %rcx, %rdx
1454c5256:     	xorl	%ecx, %ecx
1454c5258:     	movabsq	$0x665f656972656166, %r8 # imm = 0x665F656972656166
1454c5262:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454c526c:     	jmp	0x1454c527b <.text+0x54c427b>
1454c526e:     	addq	$0x58, %rcx
1454c5272:     	cmpq	%rcx, %rdx
1454c5275:     	je	0x1454c5984 <.text+0x54c4984>
1454c527b:     	movq	(%rax,%rcx), %r14
1454c527f:     	cmpq	$0xb, 0x8(%r14)
1454c5284:     	jne	0x1454c526e <.text+0x54c426e>
1454c5286:     	movq	(%r14), %r10
1454c5289:     	movq	(%r10), %r11
1454c528c:     	xorq	%r8, %r11
1454c528f:     	movq	0x3(%r10), %r10
1454c5293:     	xorq	%r9, %r10
1454c5296:     	orq	%r11, %r10
1454c5299:     	jne	0x1454c526e <.text+0x54c426e>
1454c529b:     	movl	0x8(%rax,%rcx), %edx
1454c529f:     	movss	0x14(%rax,%rcx), %xmm0
1454c52a5:     	movl	0x18(%rax,%rcx), %r8d
1454c52aa:     	movl	0x34(%rax,%rcx), %r9d
1454c52af:     	movl	%r9d, 0x124(%rbp)
1454c52b6:     	movups	0x24(%rax,%rcx), %xmm1
1454c52bb:     	movups	%xmm1, 0x114(%rbp)
1454c52c2:     	movups	0x38(%rax,%rcx), %xmm1
1454c52c7:     	movups	0x44(%rax,%rcx), %xmm2
1454c52cc:     	movups	%xmm1, 0x128(%rbp)
1454c52d3:     	movups	%xmm2, 0x134(%rbp)
1454c52da:     	movq	%r14, 0xf0(%rbp)
1454c52e1:     	movl	%edx, 0xf8(%rbp)
1454c52e7:     	movss	0x10(%rax,%rcx), %xmm8
1454c52ee:     	movsd	0xc(%rax,%rcx), %xmm1
1454c52f4:     	movsd	%xmm1, 0xfc(%rbp)
1454c52fc:     	movss	%xmm0, 0x104(%rbp)
1454c5304:     	movl	%r8d, 0x108(%rbp)
1454c530b:     	movsd	0x1c(%rax,%rcx), %xmm0
1454c5311:     	movsd	%xmm0, 0x10c(%rbp)
1454c5319:     	movss	0x8e4(%rsi), %xmm2
1454c5321:     	movq	$-0x160, %rax           # imm = 0xFEA0
1454c5328:     	addq	0x4c8(%rsi), %rax
1454c532f:     	imulq	$0x160, 0x4d0(%rsi), %rcx # imm = 0x160
1454c533a:     	testq	%rcx, %rcx
1454c533d:     	je	0x1454c5984 <.text+0x54c4984>
1454c5343:     	leaq	0x160(%rax), %rdx
1454c534a:     	addq	$-0x160, %rcx           # imm = 0xFEA0
1454c5351:     	cmpq	%rdi, 0x1e8(%rax)
1454c5358:     	movq	%rdx, %rax
1454c535b:     	jne	0x1454c533a <.text+0x54c433a>
1454c535d:     	leaq	0xbc(%rbp), %rcx
1454c5364:     	callq	0x14540d200 <.text+0x540c200>
1454c5369:     	movl	0xc4(%rbp), %eax
1454c536f:     	movl	%eax, 0x8(%rbp)
1454c5372:     	movq	0xbc(%rbp), %rax
1454c5379:     	movq	%rax, (%rbp)
1454c537d:     	leaq	0x458(%rsi), %rdx
1454c5384:     	movss	0x458(%rsi), %xmm12
1454c538d:     	movzbl	0x75(%r14), %eax
1454c5392:     	addb	$-0x2, %al
1454c5394:     	cmpb	$0x6, %al
1454c5396:     	ja	0x1454c53a7 <.text+0x54c43a7>
1454c5398:     	movzbl	%al, %eax
1454c539b:     	leaq	0x14e76fa(%rip), %rcx   # 0x1469aca9c
1454c53a2:     	movss	(%rcx,%rax,4), %xmm7
1454c53a7:     	movss	0x128(%rbp), %xmm15
1454c53b0:     	movss	0x45c(%rsi), %xmm13
1454c53b9:     	movss	0x44(%r14), %xmm14
1454c53bf:     	mulss	0x13c(%rbp), %xmm12
1454c53c8:     	leaq	0xf0(%rbp), %rcx
1454c53cf:     	callq	0x1454f96d0 <.text+0x54f86d0>
1454c53d4:     	movq	%rdi, 0x88(%rbp)
1454c53db:     	movb	$0x1, 0x176(%rbp)
1454c53e2:     	leaq	0x88(%rbp), %rax
1454c53e9:     	movq	%rax, 0x20(%rsp)
1454c53ee:     	movq	$0x1, 0x28(%rsp)
1454c53f7:     	leaq	0xb8(%rbp), %rcx
1454c53fe:     	movq	%rbp, %r8
1454c5401:     	movq	%rsi, %rdx
1454c5404:     	movaps	%xmm0, %xmm3
1454c5407:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454c540c:     	nop
1454c540d:     	movl	%r15d, 0xb0(%rbp)
1454c5414:     	movaps	%xmm8, %xmm0
1454c5418:     	mulss	%xmm15, %xmm0
1454c541d:     	sqrtss	%xmm0, %xmm0
1454c5421:     	mulss	0x4311ff(%rip), %xmm0   # 0x1458f6628
1454c5429:     	minss	0x4379bb(%rip), %xmm0   # 0x1458fcdec
1454c5431:     	mulss	%xmm6, %xmm0
1454c5435:     	xorps	%xmm1, %xmm1
1454c5438:     	cmpltss	%xmm14, %xmm1
1454c543e:     	andps	%xmm12, %xmm1
1454c5442:     	mulss	0x4338f5(%rip), %xmm14  # 0x1458f8d40
1454c544b:     	mulss	%xmm8, %xmm14
1454c5450:     	mulss	%xmm15, %xmm14
1454c5455:     	mulss	%xmm7, %xmm14
1454c545a:     	addss	%xmm1, %xmm14
1454c545f:     	mulss	%xmm14, %xmm13
1454c5464:     	movaps	%xmm0, %xmm1
1454c5467:     	minss	%xmm13, %xmm1
1454c546c:     	movaps	%xmm1, %xmm7
1454c546f:     	cmpunordss	%xmm1, %xmm7
1454c5474:     	movaps	%xmm7, %xmm2
1454c5477:     	andnps	%xmm1, %xmm2
1454c547a:     	andps	%xmm0, %xmm7
1454c547d:     	orps	%xmm2, %xmm7
1454c5480:     	movq	0xb8(%rbp), %rax
1454c5487:     	movq	%rax, 0x78(%rbp)
1454c548b:     	movq	0xc0(%rbp), %rdx
1454c5492:     	movq	0xc8(%rbp), %rax
1454c5499:     	xorl	%ecx, %ecx
1454c549b:     	cmpq	$0x1, %rax
1454c549f:     	setne	%cl
1454c54a2:     	testq	%rax, %rax
1454c54a5:     	leaq	0x8(,%rcx,8), %rcx
1454c54ad:     	cmoveq	%rax, %rcx
1454c54b1:     	addq	%rdx, %rcx
1454c54b4:     	movq	%rcx, 0xe8(%rbp)
1454c54bb:     	movq	%rdx, 0x40(%rbp)
1454c54bf:     	cmpq	0xe8(%rbp), %rdx
1454c54c6:     	movq	%rdx, 0x168(%rbp)
1454c54cd:     	je	0x1454c55fa <.text+0x54c45fa>
1454c54d3:     	movq	(%rdx), %r13
1454c54d6:     	movq	%r13, 0x158(%rbp)
1454c54dd:     	movq	%r13, 0x90(%rbp)
1454c54e4:     	movl	$0x0, 0x88(%rbp)
1454c54ee:     	movl	$0x0, 0x48(%rbp)
1454c54f5:     	leaq	0x48(%rbp), %rax
1454c54f9:     	movq	%rax, 0x30(%rsp)
1454c54fe:     	leaq	0x88(%rbp), %rax
1454c5505:     	movq	%rax, 0x28(%rsp)
1454c550a:     	movq	$0x1, 0x20(%rsp)
1454c5513:     	leaq	0xb8(%rbp), %rcx
1454c551a:     	movq	%rdi, %rdx
1454c551d:     	movl	$0x22d9, %r8d           # imm = 0x22D9
1454c5523:     	leaq	0x158(%rbp), %r9
1454c552a:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c552f:     	nop
1454c5530:     	movq	0x548(%rsi), %r15
1454c5537:     	cmpq	0x538(%rsi), %r15
1454c553e:     	jne	0x1454c554d <.text+0x54c454d>
1454c5540:     	leaq	0x538(%rsi), %rcx
1454c5547:     	callq	0x1457580b0 <.text+0x57570b0>
1454c554c:     	nop
1454c554d:     	movq	0x540(%rsi), %rax
1454c5554:     	movq	%r15, %rcx
1454c5557:     	shlq	$0x5, %rcx
1454c555b:     	movups	0xb8(%rbp), %xmm0
1454c5562:     	movups	0xc8(%rbp), %xmm1
1454c5569:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c556e:     	movups	%xmm0, (%rax,%rcx)
1454c5572:     	incq	%r15
1454c5575:     	movq	%r15, 0x548(%rsi)
1454c557c:     	movl	0x40(%r14), %r9d
1454c5580:     	movzbl	0x74(%r14), %eax
1454c5585:     	movb	0x111(%rsi), %r15b
1454c558c:     	movb	$0x3, 0x111(%rsi)
1454c5593:     	movups	0x20(%rsi), %xmm8
1454c5598:     	movups	0x40(%rsi), %xmm12
1454c559d:     	movq	$0x0, 0x20(%rsi)
1454c55a5:     	movq	$0x0, 0x40(%rsi)
1454c55ad:     	movb	%al, 0x20(%rsp)
1454c55b1:     	movb	$0x0, 0x30(%rsp)
1454c55b6:     	movb	$0x0, 0x28(%rsp)
1454c55bb:     	movq	%rsi, %rcx
1454c55be:     	movq	%r13, %rdx
1454c55c1:     	movaps	%xmm7, %xmm2
1454c55c4:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454c55c9:     	nop
1454c55ca:     	movq	0x168(%rbp), %rdx
1454c55d1:     	addq	$0x8, %rdx
1454c55d5:     	movb	%r15b, 0x111(%rsi)
1454c55dc:     	movups	%xmm8, 0x20(%rsi)
1454c55e1:     	movups	%xmm12, 0x40(%rsi)
1454c55e6:     	cmpq	0xe8(%rbp), %rdx
1454c55ed:     	movq	%rdx, 0x168(%rbp)
1454c55f4:     	jne	0x1454c54d3 <.text+0x54c44d3>
1454c55fa:     	movq	0x700(%rsi), %r15
1454c5601:     	testq	%r15, %r15
1454c5604:     	je	0x1454c5961 <.text+0x54c4961>
1454c560a:     	movq	(%r14), %rax
1454c560d:     	movq	%rax, 0x70(%rbp)
1454c5611:     	movq	0x8(%r14), %r8
1454c5615:     	movq	0x6f8(%rsi), %r13
1454c561c:     	addq	$0x10, %r13
1454c5620:     	movss	0x431053(%rip), %xmm8   # 0x1458f667c
1454c5629:     	movq	%r8, -0x8(%rbp)
1454c562d:     	jmp	0x1454c5640 <.text+0x54c4640>
1454c562f:     	movq	-0x8(%rbp), %r8
1454c5633:     	addq	$0x40, %r13
1454c5637:     	decq	%r15
1454c563a:     	je	0x1454c5954 <.text+0x54c4954>
1454c5640:     	cmpb	$0xd, -0x10(%r13)
1454c5645:     	jne	0x1454c5633 <.text+0x54c4633>
1454c5647:     	cmpq	%r8, (%r13)
1454c564b:     	jne	0x1454c5633 <.text+0x54c4633>
1454c564d:     	movq	-0x8(%r13), %rcx
1454c5651:     	movq	0x70(%rbp), %rdx
1454c5655:     	callq	0x145756dd7 <.text+0x5755dd7>
1454c565a:     	testl	%eax, %eax
1454c565c:     	jne	0x1454c562f <.text+0x54c462f>
1454c565e:     	addss	-0xc(%r13), %xmm8
1454c5664:     	jmp	0x1454c562f <.text+0x54c462f>
1454c5666:     	testl	%r8d, %r8d
1454c5669:     	jne	0x1454c5687 <.text+0x54c4687>
1454c566b:     	movb	$0x1, 0x176(%rbp)
1454c5672:     	movq	%rsi, %rcx
1454c5675:     	movq	%rdi, %rdx
1454c5678:     	movl	$0x76, %r8d
1454c567e:     	xorl	%r9d, %r9d
1454c5681:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454c5686:     	nop
1454c5687:     	movq	0x2a0(%rsi), %rax
1454c568e:     	testq	%rax, %rax
1454c5691:     	je	0x1454c4fd9 <.text+0x54c3fd9>
1454c5697:     	movq	0x298(%rsi), %rcx
1454c569e:     	imulq	$0x58, %rax, %r8
1454c56a2:     	xorl	%edx, %edx
1454c56a4:     	movabsq	$0x70726f6d796c6f70, %r9 # imm = 0x70726F6D796C6F70
1454c56ae:     	jmp	0x1454c56bd <.text+0x54c46bd>
1454c56b0:     	addq	$0x58, %rdx
1454c56b4:     	cmpq	%rdx, %r8
1454c56b7:     	je	0x1454c4fd9 <.text+0x54c3fd9>
1454c56bd:     	movq	(%rcx,%rdx), %rax
1454c56c1:     	cmpq	$0x9, 0x8(%rax)
1454c56c6:     	jne	0x1454c56b0 <.text+0x54c46b0>
1454c56c8:     	movq	(%rax), %r10
1454c56cb:     	movq	(%r10), %r11
1454c56ce:     	xorq	%r9, %r11
1454c56d1:     	movzbl	0x8(%r10), %r10d
1454c56d6:     	xorq	$0x68, %r10
1454c56da:     	orq	%r11, %r10
1454c56dd:     	jne	0x1454c56b0 <.text+0x54c46b0>
1454c56df:     	movl	0x8(%rcx,%rdx), %r8d
1454c56e4:     	movss	0x14(%rcx,%rdx), %xmm0
1454c56ea:     	movl	0x18(%rcx,%rdx), %r9d
1454c56ef:     	movl	0x34(%rcx,%rdx), %r10d
1454c56f4:     	movl	%r10d, 0x124(%rbp)
1454c56fb:     	movups	0x24(%rcx,%rdx), %xmm1
1454c5700:     	movups	%xmm1, 0x114(%rbp)
1454c5707:     	movups	0x38(%rcx,%rdx), %xmm1
1454c570c:     	movups	0x44(%rcx,%rdx), %xmm2
1454c5711:     	movups	%xmm2, 0x134(%rbp)
1454c5718:     	movups	%xmm1, 0x128(%rbp)
1454c571f:     	movq	%rax, 0xf0(%rbp)
1454c5726:     	movl	%r8d, 0xf8(%rbp)
1454c572d:     	movss	0x10(%rcx,%rdx), %xmm8
1454c5734:     	movsd	0xc(%rcx,%rdx), %xmm1
1454c573a:     	movsd	%xmm1, 0xfc(%rbp)
1454c5742:     	movss	%xmm0, 0x104(%rbp)
1454c574a:     	movl	%r9d, 0x108(%rbp)
1454c5751:     	movsd	0x1c(%rcx,%rdx), %xmm0
1454c5757:     	movsd	%xmm0, 0x10c(%rbp)
1454c575f:     	leaq	0x458(%rsi), %rdx
1454c5766:     	movss	0x458(%rsi), %xmm12
1454c576f:     	movzbl	0x75(%rax), %ecx
1454c5773:     	addb	$-0x2, %cl
1454c5776:     	cmpb	$0x6, %cl
1454c5779:     	ja	0x1454c578d <.text+0x54c478d>
1454c577b:     	movzbl	%cl, %ecx
1454c577e:     	leaq	0x14e7317(%rip), %r8    # 0x1469aca9c
1454c5785:     	movss	(%r8,%rcx,4), %xmm0
1454c578b:     	jmp	0x1454c5795 <.text+0x54c4795>
1454c578d:     	movss	0x425ceb(%rip), %xmm0   # 0x1458eb480
1454c5795:     	movss	%xmm0, 0xe8(%rbp)
1454c579d:     	movss	0x45c(%rsi), %xmm14
1454c57a6:     	movss	0x44(%rax), %xmm13
1454c57ac:     	movss	0x128(%rbp), %xmm15
1454c57b5:     	mulss	0x13c(%rbp), %xmm12
1454c57be:     	leaq	0xf0(%rbp), %rcx
1454c57c5:     	callq	0x1454f96d0 <.text+0x54f86d0>
1454c57ca:     	movb	$0x1, 0x176(%rbp)
1454c57d1:     	movq	$0x0, 0x28(%rsp)
1454c57da:     	movq	$0x8, 0x20(%rsp)
1454c57e3:     	leaq	0x88(%rbp), %rcx
1454c57ea:     	leaq	0x158(%rbp), %r8
1454c57f1:     	movq	%rsi, %rdx
1454c57f4:     	movaps	%xmm0, %xmm3
1454c57f7:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454c57fc:     	nop
1454c57fd:     	movl	%r15d, 0xb0(%rbp)
1454c5804:     	movq	0x90(%rbp), %r9
1454c580b:     	movq	0x98(%rbp), %r14
1454c5812:     	movl	$0x2, 0x48(%rbp)
1454c5819:     	movl	$0x0, (%rbp)
1454c5820:     	movq	%rbp, %rax
1454c5823:     	movq	%rax, 0x30(%rsp)
1454c5828:     	leaq	0x48(%rbp), %rax
1454c582c:     	movq	%rax, 0x28(%rsp)
1454c5831:     	movq	%r14, 0x20(%rsp)
1454c5836:     	leaq	0xb8(%rbp), %rcx
1454c583d:     	movq	%rdi, %rdx
1454c5840:     	movl	$0x5a9, %r8d            # imm = 0x5A9
1454c5846:     	movq	%r9, 0x168(%rbp)
1454c584d:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c5852:     	nop
1454c5853:     	movq	0x548(%rsi), %r15
1454c585a:     	cmpq	0x538(%rsi), %r15
1454c5861:     	jne	0x1454c5870 <.text+0x54c4870>
1454c5863:     	leaq	0x538(%rsi), %rcx
1454c586a:     	callq	0x1457580b0 <.text+0x57570b0>
1454c586f:     	nop
1454c5870:     	mulss	0x425cb0(%rip), %xmm7   # 0x1458eb528
1454c5878:     	xorps	%xmm0, %xmm0
1454c587b:     	cmpltss	%xmm13, %xmm0
1454c5881:     	andps	%xmm12, %xmm0
1454c5885:     	mulss	0x4334b2(%rip), %xmm13  # 0x1458f8d40
1454c588e:     	mulss	%xmm13, %xmm8
1454c5893:     	mulss	%xmm8, %xmm15
1454c5898:     	mulss	0xe8(%rbp), %xmm15
1454c58a1:     	addss	%xmm0, %xmm15
1454c58a6:     	mulss	%xmm15, %xmm14
1454c58ab:     	movaps	%xmm7, %xmm0
1454c58ae:     	minss	%xmm14, %xmm0
1454c58b3:     	movaps	%xmm0, %xmm1
1454c58b6:     	cmpunordss	%xmm0, %xmm1
1454c58bb:     	movaps	%xmm1, %xmm2
1454c58be:     	andnps	%xmm0, %xmm2
1454c58c1:     	andps	%xmm7, %xmm1
1454c58c4:     	orps	%xmm2, %xmm1
1454c58c7:     	movq	0x540(%rsi), %rax
1454c58ce:     	movq	%r15, %rcx
1454c58d1:     	shlq	$0x5, %rcx
1454c58d5:     	movups	0xb8(%rbp), %xmm0
1454c58dc:     	movups	0xc8(%rbp), %xmm2
1454c58e3:     	movups	%xmm2, 0x10(%rax,%rcx)
1454c58e8:     	movups	%xmm0, (%rax,%rcx)
1454c58ec:     	incq	%r15
1454c58ef:     	movq	%r15, 0x548(%rsi)
1454c58f6:     	movss	%xmm1, 0x30(%rsp)
1454c58fc:     	movq	%r14, 0x28(%rsp)
1454c5901:     	movq	0x168(%rbp), %rax
1454c5908:     	movq	%rax, 0x20(%rsp)
1454c590d:     	leaq	0xf0(%rbp), %rdx
1454c5914:     	movq	%rsi, %rcx
1454c5917:     	movq	%rdi, %r8
1454c591a:     	movl	$0x5a9, %r9d            # imm = 0x5A9
1454c5920:     	callq	0x1454d43d0 <.text+0x54d33d0>
1454c5925:     	nop
1454c5926:     	movq	0x88(%rbp), %rdx
1454c592d:     	testq	%rdx, %rdx
1454c5930:     	je	0x1454c5948 <.text+0x54c4948>
1454c5932:     	shlq	$0x3, %rdx
1454c5936:     	movl	$0x8, %r8d
1454c593c:     	movq	0x168(%rbp), %rcx
1454c5943:     	callq	0x1400021d0 <.text+0x11d0>
1454c5948:     	movl	0xb0(%rbp), %r15d
1454c594f:     	jmp	0x1454c4fd9 <.text+0x54c3fd9>
1454c5954:     	xorps	%xmm0, %xmm0
1454c5957:     	ucomiss	%xmm0, %xmm8
1454c595b:     	ja	0x1454c622b <.text+0x54c522b>
1454c5961:     	movq	0x78(%rbp), %rdx
1454c5965:     	testq	%rdx, %rdx
1454c5968:     	movl	0xb0(%rbp), %r15d
1454c596f:     	je	0x1454c5984 <.text+0x54c4984>
1454c5971:     	shlq	$0x3, %rdx
1454c5975:     	movl	$0x8, %r8d
1454c597b:     	movq	0x40(%rbp), %rcx
1454c597f:     	callq	0x1400021d0 <.text+0x11d0>
1454c5984:     	xorps	%xmm0, %xmm0
1454c5987:     	ucomiss	%xmm11, %xmm0
1454c598b:     	jb	0x1454c59cc <.text+0x54c49cc>
1454c598d:     	cmpb	$0x0, 0x150(%rbp)
1454c5994:     	je	0x1454c5a3a <.text+0x54c4a3a>
1454c599a:     	movb	$0x1, 0x176(%rbp)
1454c59a1:     	movq	%rsi, %rcx
1454c59a4:     	callq	0x1454d68b0 <.text+0x54d58b0>
1454c59a9:     	nop
1454c59aa:     	movb	$0x1, 0x176(%rbp)
1454c59b1:     	leaq	0x60(%rbp), %r8
1454c59b5:     	movq	%rsi, %rcx
1454c59b8:     	movq	%rdi, %rdx
1454c59bb:     	movl	$0x1, %r9d
1454c59c1:     	callq	0x1454d5230 <.text+0x54d4230>
1454c59c6:     	nop
1454c59c7:     	jmp	0x1454c5a66 <.text+0x54c4a66>
1454c59cc:     	testl	%ebx, %ebx
1454c59ce:     	sete	%al
1454c59d1:     	orb	%r12b, %al
1454c59d4:     	jne	0x1454c59e9 <.text+0x54c49e9>
1454c59d6:     	movb	$0x1, 0x176(%rbp)
1454c59dd:     	movq	%rsi, %rcx
1454c59e0:     	movq	%rdi, %rdx
1454c59e3:     	callq	0x1454d4dc0 <.text+0x54d3dc0>
1454c59e8:     	nop
1454c59e9:     	cmpb	$0x0, 0x150(%rbp)
1454c59f0:     	je	0x1454c5a2d <.text+0x54c4a2d>
1454c59f2:     	movb	$0x1, 0x176(%rbp)
1454c59f9:     	movq	%rsi, %rcx
1454c59fc:     	callq	0x1454d68b0 <.text+0x54d58b0>
1454c5a01:     	nop
1454c5a02:     	movb	$0x1, 0x176(%rbp)
1454c5a09:     	leaq	0x60(%rbp), %r8
1454c5a0d:     	movq	%rsi, %rcx
1454c5a10:     	movq	%rdi, %rdx
1454c5a13:     	movl	$0x1, %r9d
1454c5a19:     	callq	0x1454d5230 <.text+0x54d4230>
1454c5a1e:     	nop
1454c5a1f:     	xorps	%xmm0, %xmm0
1454c5a22:     	ucomiss	%xmm11, %xmm0
1454c5a26:     	jae	0x1454c5a66 <.text+0x54c4a66>
1454c5a28:     	jmp	0x1454c5fc8 <.text+0x54c4fc8>
1454c5a2d:     	xorps	%xmm0, %xmm0
1454c5a30:     	ucomiss	%xmm11, %xmm0
1454c5a34:     	jb	0x1454c5fc8 <.text+0x54c4fc8>
1454c5a3a:     	cmpb	$0x3, %r15b
1454c5a3e:     	jne	0x1454c5a66 <.text+0x54c4a66>
1454c5a40:     	cmpl	$0x1, 0x7e4(%rsi)
1454c5a47:     	jne	0x1454c5a66 <.text+0x54c4a66>
1454c5a49:     	movb	$0x1, 0x176(%rbp)
1454c5a50:     	leaq	0x60(%rbp), %r8
1454c5a54:     	movq	%rsi, %rcx
1454c5a57:     	movq	%rdi, %rdx
1454c5a5a:     	movl	$0x2, %r9d
1454c5a60:     	callq	0x1454d5230 <.text+0x54d4230>
1454c5a65:     	nop
1454c5a66:     	testq	%rdi, %rdi
1454c5a69:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5a6f:     	cmpq	0x7b0(%rsi), %rdi
1454c5a76:     	jne	0x1454c5e6f <.text+0x54c4e6f>
1454c5a7c:     	movl	0x68(%rbp), %eax
1454c5a7f:     	movl	%eax, 0x160(%rbp)
1454c5a85:     	movq	0x60(%rbp), %rax
1454c5a89:     	movq	%rax, 0x158(%rbp)
1454c5a90:     	movq	$0x0, 0x7b0(%rsi)
1454c5a9b:     	movss	0x8e4(%rsi), %xmm7
1454c5aa3:     	movss	0x4259d5(%rip), %xmm0   # 0x1458eb480
1454c5aab:     	addss	%xmm7, %xmm0
1454c5aaf:     	movss	%xmm0, 0x7e8(%rsi)
1454c5ab7:     	movq	0x2a0(%rsi), %rcx
1454c5abe:     	testq	%rcx, %rcx
1454c5ac1:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5ac7:     	movq	0x298(%rsi), %rax
1454c5ace:     	imulq	$0x58, %rcx, %r8
1454c5ad2:     	xorl	%ecx, %ecx
1454c5ad4:     	movabsq	$0x5f737265746e7568, %r9 # imm = 0x5F737265746E7568
1454c5ade:     	jmp	0x1454c5aed <.text+0x54c4aed>
1454c5ae0:     	addq	$0x58, %rcx
1454c5ae4:     	cmpq	%rcx, %r8
1454c5ae7:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5aed:     	movq	(%rax,%rcx), %r14
1454c5af1:     	cmpq	$0xc, 0x8(%r14)
1454c5af6:     	jne	0x1454c5ae0 <.text+0x54c4ae0>
1454c5af8:     	movq	(%r14), %rdx
1454c5afb:     	movq	(%rdx), %r10
1454c5afe:     	xorq	%r9, %r10
1454c5b01:     	movl	0x8(%rdx), %r11d
1454c5b05:     	xorq	$0x6b72616d, %r11       # imm = 0x6B72616D
1454c5b0c:     	orq	%r10, %r11
1454c5b0f:     	jne	0x1454c5ae0 <.text+0x54c4ae0>
1454c5b11:     	movl	0x8(%rax,%rcx), %r8d
1454c5b16:     	movss	0x14(%rax,%rcx), %xmm0
1454c5b1c:     	movl	0x18(%rax,%rcx), %r9d
1454c5b21:     	movl	0x34(%rax,%rcx), %r10d
1454c5b26:     	movl	%r10d, 0x124(%rbp)
1454c5b2d:     	movups	0x24(%rax,%rcx), %xmm1
1454c5b32:     	movups	%xmm1, 0x114(%rbp)
1454c5b39:     	movups	0x38(%rax,%rcx), %xmm1
1454c5b3e:     	movups	0x44(%rax,%rcx), %xmm2
1454c5b43:     	movups	%xmm1, 0x128(%rbp)
1454c5b4a:     	movups	%xmm2, 0x134(%rbp)
1454c5b51:     	movq	%r14, 0xf0(%rbp)
1454c5b58:     	movl	%r8d, 0xf8(%rbp)
1454c5b5f:     	movss	0x10(%rax,%rcx), %xmm8
1454c5b66:     	movsd	0xc(%rax,%rcx), %xmm1
1454c5b6c:     	movsd	%xmm1, 0xfc(%rbp)
1454c5b74:     	movss	%xmm0, 0x104(%rbp)
1454c5b7c:     	movl	%r9d, 0x108(%rbp)
1454c5b83:     	movsd	0x1c(%rax,%rcx), %xmm0
1454c5b89:     	movsd	%xmm0, 0x10c(%rbp)
1454c5b91:     	leaq	0x720(%rsi), %rcx
1454c5b98:     	movl	$0xc, %r8d
1454c5b9e:     	callq	0x145413960 <.text+0x5412960>
1454c5ba3:     	ucomiss	%xmm0, %xmm7
1454c5ba6:     	jb	0x1454c5e6f <.text+0x54c4e6f>
1454c5bac:     	movb	$0x1, 0x176(%rbp)
1454c5bb3:     	leaq	0xf0(%rbp), %rdx
1454c5bba:     	movq	%rsi, %rcx
1454c5bbd:     	callq	0x1454d49e0 <.text+0x54d39e0>
1454c5bc2:     	nop
1454c5bc3:     	leaq	0x458(%rsi), %rdx
1454c5bca:     	movss	0x458(%rsi), %xmm11
1454c5bd3:     	movss	0x45c(%rsi), %xmm7
1454c5bdb:     	leaq	0xf0(%rbp), %rcx
1454c5be2:     	callq	0x1454f96d0 <.text+0x54f86d0>
1454c5be7:     	movq	%rdi, 0xb8(%rbp)
1454c5bee:     	movb	$0x1, 0x176(%rbp)
1454c5bf5:     	leaq	0xb8(%rbp), %rax
1454c5bfc:     	movq	%rax, 0x20(%rsp)
1454c5c01:     	movq	$0x1, 0x28(%rsp)
1454c5c0a:     	leaq	0x88(%rbp), %rcx
1454c5c11:     	leaq	0x158(%rbp), %r8
1454c5c18:     	movq	%rsi, %rdx
1454c5c1b:     	movaps	%xmm0, %xmm3
1454c5c1e:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454c5c23:     	nop
1454c5c24:     	movq	0x90(%rbp), %r9
1454c5c2b:     	movq	0x98(%rbp), %r15
1454c5c32:     	movl	$0x2, 0x48(%rbp)
1454c5c39:     	movl	$0x0, (%rbp)
1454c5c40:     	movb	$0x1, 0x174(%rbp)
1454c5c47:     	movq	%rbp, %rax
1454c5c4a:     	movq	%rax, 0x30(%rsp)
1454c5c4f:     	leaq	0x48(%rbp), %rax
1454c5c53:     	movq	%rax, 0x28(%rsp)
1454c5c58:     	movq	%r15, 0x20(%rsp)
1454c5c5d:     	leaq	0xb8(%rbp), %rcx
1454c5c64:     	movq	%rdi, %rdx
1454c5c67:     	movl	$0x5a9, %r8d            # imm = 0x5A9
1454c5c6d:     	movq	%r9, 0x150(%rbp)
1454c5c74:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c5c79:     	nop
1454c5c7a:     	movq	0x548(%rsi), %r12
1454c5c81:     	cmpq	0x538(%rsi), %r12
1454c5c88:     	jne	0x1454c5c97 <.text+0x54c4c97>
1454c5c8a:     	leaq	0x538(%rsi), %rcx
1454c5c91:     	callq	0x1457580b0 <.text+0x57570b0>
1454c5c96:     	nop
1454c5c97:     	movq	0x540(%rsi), %rax
1454c5c9e:     	movq	%r12, %rcx
1454c5ca1:     	shlq	$0x5, %rcx
1454c5ca5:     	movups	0xb8(%rbp), %xmm0
1454c5cac:     	movups	0xc8(%rbp), %xmm1
1454c5cb3:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c5cb8:     	movups	%xmm0, (%rax,%rcx)
1454c5cbc:     	incq	%r12
1454c5cbf:     	movq	%r12, 0x548(%rsi)
1454c5cc6:     	movzbl	0x75(%r14), %eax
1454c5ccb:     	addb	$-0x2, %al
1454c5ccd:     	cmpb	$0x6, %al
1454c5ccf:     	ja	0x1454c5ce2 <.text+0x54c4ce2>
1454c5cd1:     	movzbl	%al, %eax
1454c5cd4:     	leaq	0x14e6dc1(%rip), %rcx   # 0x1469aca9c
1454c5cdb:     	movss	(%rcx,%rax,4), %xmm0
1454c5ce0:     	jmp	0x1454c5cea <.text+0x54c4cea>
1454c5ce2:     	movss	0x425796(%rip), %xmm0   # 0x1458eb480
1454c5cea:     	movq	0x88(%rbp), %rax
1454c5cf1:     	movq	%rax, 0x168(%rbp)
1454c5cf8:     	testq	%r15, %r15
1454c5cfb:     	je	0x1454c5e4d <.text+0x54c4e4d>
1454c5d01:     	movss	0x44(%r14), %xmm1
1454c5d07:     	mulss	0x13c(%rbp), %xmm11
1454c5d10:     	xorps	%xmm2, %xmm2
1454c5d13:     	cmpltss	%xmm1, %xmm2
1454c5d18:     	andps	%xmm11, %xmm2
1454c5d1c:     	mulss	0x43301c(%rip), %xmm1   # 0x1458f8d40
1454c5d24:     	mulss	%xmm1, %xmm8
1454c5d29:     	mulss	0x128(%rbp), %xmm8
1454c5d32:     	mulss	%xmm0, %xmm8
1454c5d37:     	addss	%xmm2, %xmm8
1454c5d3c:     	mulss	%xmm8, %xmm7
1454c5d41:     	shlq	$0x3, %r15
1454c5d45:     	movzbl	0x111(%rsi), %r12d
1454c5d4d:     	movups	0x20(%rsi), %xmm8
1454c5d52:     	movups	0x40(%rsi), %xmm11
1454c5d57:     	xorl	%r13d, %r13d
1454c5d5a:     	movss	0x52565d(%rip), %xmm12  # 0x1459eb3c0
1454c5d63:     	movq	0x150(%rbp), %rax
1454c5d6a:     	movq	(%rax,%r13), %rdx
1454c5d6e:     	movq	0x880(%rsi), %rax
1454c5d75:     	movq	0x898(%rsi), %rcx
1454c5d7c:     	leaq	(%rcx,%rax), %r8
1454c5d80:     	rolq	$0x17, %r8
1454c5d84:     	addq	%rax, %r8
1454c5d87:     	movq	0x888(%rsi), %r9
1454c5d8e:     	movq	%r9, %r10
1454c5d91:     	shlq	$0x11, %r10
1454c5d95:     	movq	0x890(%rsi), %r11
1454c5d9c:     	xorq	%rax, %r11
1454c5d9f:     	xorq	%r9, %rcx
1454c5da2:     	xorq	%r11, %r9
1454c5da5:     	movq	%r9, 0x888(%rsi)
1454c5dac:     	xorq	%rcx, %rax
1454c5daf:     	movq	%rax, 0x880(%rsi)
1454c5db6:     	xorq	%r10, %r11
1454c5db9:     	movq	%r11, 0x890(%rsi)
1454c5dc0:     	rolq	$0x2d, %rcx
1454c5dc4:     	movq	%rcx, 0x898(%rsi)
1454c5dcb:     	shrq	$0x28, %r8
1454c5dcf:     	xorps	%xmm0, %xmm0
1454c5dd2:     	cvtsi2ss	%r8d, %xmm0
1454c5dd7:     	mulss	%xmm12, %xmm0
1454c5ddc:     	movss	0x464(%rsi), %xmm1
1454c5de4:     	movss	0x468(%rsi), %xmm2
1454c5dec:     	mulss	%xmm7, %xmm2
1454c5df0:     	movl	0x40(%r14), %r9d
1454c5df4:     	movzbl	0x74(%r14), %eax
1454c5df9:     	movb	$0x3, 0x111(%rsi)
1454c5e00:     	movq	$0x0, 0x20(%rsi)
1454c5e08:     	movq	$0x0, 0x40(%rsi)
1454c5e10:     	ucomiss	%xmm0, %xmm1
1454c5e13:     	ja	0x1454c5e18 <.text+0x54c4e18>
1454c5e15:     	movaps	%xmm7, %xmm2
1454c5e18:     	seta	0x28(%rsp)
1454c5e1d:     	movb	%al, 0x20(%rsp)
1454c5e21:     	movb	$0x0, 0x30(%rsp)
1454c5e26:     	movq	%rsi, %rcx
1454c5e29:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454c5e2e:     	nop
1454c5e2f:     	movb	%r12b, 0x111(%rsi)
1454c5e36:     	movups	%xmm8, 0x20(%rsi)
1454c5e3b:     	movups	%xmm11, 0x40(%rsi)
1454c5e40:     	addq	$0x8, %r13
1454c5e44:     	cmpq	%r13, %r15
1454c5e47:     	jne	0x1454c5d63 <.text+0x54c4d63>
1454c5e4d:     	movq	0x168(%rbp), %rdx
1454c5e54:     	testq	%rdx, %rdx
1454c5e57:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5e59:     	shlq	$0x3, %rdx
1454c5e5d:     	movl	$0x8, %r8d
1454c5e63:     	movq	0x150(%rbp), %rcx
1454c5e6a:     	callq	0x1400021d0 <.text+0x11d0>
1454c5e6f:     	movq	0x770(%rsi), %rax
1454c5e76:     	movq	0x778(%rsi), %rcx
1454c5e7d:     	shlq	$0x4, %rcx
1454c5e81:     	xorl	%edx, %edx
1454c5e83:     	nopw	%cs:(%rax,%rax)
1454c5e90:     	cmpq	%rdx, %rcx
1454c5e93:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5e99:     	cmpq	%rdi, (%rax,%rdx)
1454c5e9d:     	leaq	0x10(%rdx), %rdx
1454c5ea1:     	jne	0x1454c5e90 <.text+0x54c4e90>
1454c5ea3:     	leaq	0x768(%rsi), %rcx
1454c5eaa:     	leaq	-0x10(%rbp), %rdx
1454c5eae:     	callq	0x145524320 <.text+0x5523320>
1454c5eb3:     	movq	0x2a0(%rsi), %rcx
1454c5eba:     	testq	%rcx, %rcx
1454c5ebd:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5ec3:     	movq	0x298(%rsi), %rax
1454c5eca:     	imulq	$0x58, %rcx, %rdx
1454c5ece:     	xorl	%ecx, %ecx
1454c5ed0:     	movabsq	$0x665f656972656166, %r8 # imm = 0x665F656972656166
1454c5eda:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454c5ee4:     	jmp	0x1454c5efd <.text+0x54c4efd>
1454c5ee6:     	nopw	%cs:(%rax,%rax)
1454c5ef0:     	addq	$0x58, %rcx
1454c5ef4:     	cmpq	%rcx, %rdx
1454c5ef7:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5efd:     	movq	(%rax,%rcx), %r10
1454c5f01:     	cmpq	$0xb, 0x8(%r10)
1454c5f06:     	jne	0x1454c5ef0 <.text+0x54c4ef0>
1454c5f08:     	movq	(%r10), %r11
1454c5f0b:     	movq	(%r11), %r14
1454c5f0e:     	xorq	%r8, %r14
1454c5f11:     	movq	0x3(%r11), %r11
1454c5f15:     	xorq	%r9, %r11
1454c5f18:     	orq	%r14, %r11
1454c5f1b:     	jne	0x1454c5ef0 <.text+0x54c4ef0>
1454c5f1d:     	movq	0x778(%rsi), %rdx
1454c5f24:     	movl	0x54(%r10), %r8d
1454c5f28:     	testl	%r8d, %r8d
1454c5f2b:     	je	0x1454c5f53 <.text+0x54c4f53>
1454c5f2d:     	movl	0x18(%rax,%rcx), %r9d
1454c5f32:     	addl	0x40(%rax,%rcx), %r9d
1454c5f37:     	addl	0x48c(%rsi), %r9d
1454c5f3e:     	addl	%r8d, %r9d
1454c5f41:     	cmpl	$0x3, %r9d
1454c5f45:     	movl	$0x3, %eax
1454c5f4a:     	cmovbl	%r9d, %eax
1454c5f4e:     	testl	%r9d, %r9d
1454c5f51:     	jne	0x1454c5f58 <.text+0x54c4f58>
1454c5f53:     	movl	$0x1, %eax
1454c5f58:     	movl	%eax, %eax
1454c5f5a:     	cmpq	%rax, %rdx
1454c5f5d:     	jae	0x1454c5fc8 <.text+0x54c4fc8>
1454c5f5f:     	movb	$0x1, 0x176(%rbp)
1454c5f66:     	leaq	0xf0(%rbp), %rcx
1454c5f6d:     	leaq	0x60(%rbp), %r8
1454c5f71:     	movss	0x425587(%rip), %xmm3   # 0x1458eb500
1454c5f79:     	movq	%rsi, %rdx
1454c5f7c:     	callq	0x1454d5950 <.text+0x54d4950>
1454c5f81:     	nop
1454c5f82:     	cmpq	$0x0, 0x100(%rbp)
1454c5f8a:     	je	0x1454c5fa6 <.text+0x54c4fa6>
1454c5f8c:     	movq	0xf8(%rbp), %rax
1454c5f93:     	movq	%rax, 0x150(%rbp)
1454c5f9a:     	movq	(%rax), %rdx
1454c5f9d:     	movq	%rsi, %rcx
1454c5fa0:     	callq	0x1454d7810 <.text+0x54d6810>
1454c5fa5:     	nop
1454c5fa6:     	movq	0xf0(%rbp), %rdx
1454c5fad:     	testq	%rdx, %rdx
1454c5fb0:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5fb2:     	movq	0xf8(%rbp), %rcx
1454c5fb9:     	shlq	$0x3, %rdx
1454c5fbd:     	movl	$0x8, %r8d
1454c5fc3:     	callq	0x1400021d0 <.text+0x11d0>
1454c5fc8:     	movzbl	0x111(%rsi), %r14d
1454c5fd0:     	cmpb	$0x3, %r14b
1454c5fd4:     	je	0x1454c5ffa <.text+0x54c4ffa>
1454c5fd6:     	cmpq	$0x0, 0x700(%rsi)
1454c5fde:     	je	0x1454c5ffa <.text+0x54c4ffa>
1454c5fe0:     	xorl	%eax, %eax
1454c5fe2:     	cmpb	$0x1, %r14b
1454c5fe6:     	sete	%cl
1454c5fe9:     	movl	0x110(%rsi), %edx
1454c5fef:     	cmovel	%edx, %eax
1454c5ff2:     	jne	0x1454c601c <.text+0x54c501c>
1454c5ff4:     	testb	%dl, %dl
1454c5ff6:     	jne	0x1454c6021 <.text+0x54c5021>
1454c5ff8:     	jmp	0x1454c6052 <.text+0x54c5052>
1454c5ffa:     	movq	0xe0(%rbp), %rcx
1454c6001:     	leaq	-0x1(%rcx), %rax
1454c6005:     	cmpq	$-0x3, %rax
1454c6009:     	ja	0x1454c61a5 <.text+0x54c51a5>
1454c600f:     	shlq	$0x4, %rcx
1454c6013:     	leaq	(%rcx,%rcx,2), %rdx
1454c6017:     	jmp	0x1454c6193 <.text+0x54c5193>
1454c601c:     	testb	%r14b, %r14b
1454c601f:     	jne	0x1454c6052 <.text+0x54c5052>
1454c6021:     	movq	0xf0(%rsi), %rdx
1454c6028:     	testq	%rdx, %rdx
1454c602b:     	je	0x1454c6052 <.text+0x54c5052>
1454c602d:     	movq	0xe8(%rsi), %r8
1454c6034:     	leaq	(,%rdx,4), %r10
1454c603c:     	xorl	%r9d, %r9d
1454c603f:     	cmpl	%ebx, (%r8,%r9,4)
1454c6043:     	je	0x1454c6210 <.text+0x54c5210>
1454c6049:     	incq	%r9
1454c604c:     	addq	$-0x4, %r10
1454c6050:     	jne	0x1454c603f <.text+0x54c503f>
1454c6052:     	xorl	%r15d, %r15d
1454c6055:     	movb	%cl, 0xa5(%rbp)
1454c605b:     	movl	%ebx, 0x90(%rbp)
1454c6061:     	movzbl	0x290(%rbp), %ecx
1454c6068:     	movb	%cl, 0xa4(%rbp)
1454c606e:     	movzbl	0x298(%rbp), %ecx
1454c6075:     	movb	%cl, 0xa7(%rbp)
1454c607b:     	movq	%rdi, 0x88(%rbp)
1454c6082:     	movlps	%xmm9, 0x94(%rbp)
1454c608a:     	movss	%xmm10, 0x9c(%rbp)
1454c6093:     	movss	%xmm6, 0xa0(%rbp)
1454c609b:     	movb	%r14b, 0xa6(%rbp)
1454c60a2:     	movb	%r15b, 0xa8(%rbp)
1454c60a9:     	movb	%al, 0xa9(%rbp)
1454c60af:     	movb	$0x0, 0x172(%rbp)
1454c60b6:     	leaq	0x88(%rbp), %rdx
1454c60bd:     	movq	%rsi, %rcx
1454c60c0:     	xorl	%r8d, %r8d
1454c60c3:     	callq	0x1454b9930 <.text+0x54b8930>
1454c60c8:     	nop
1454c60c9:     	movq	0xe0(%rbp), %rcx
1454c60d0:     	cmpq	$-0x1, %rcx
1454c60d4:     	je	0x1454c61a5 <.text+0x54c51a5>
1454c60da:     	movq	%rcx, 0xb8(%rbp)
1454c60e1:     	movq	0x80(%rbp), %rax
1454c60e8:     	movq	%rax, 0xc0(%rbp)
1454c60ef:     	movaps	-0x40(%rbp), %xmm0
1454c60f3:     	movups	%xmm0, 0xc8(%rbp)
1454c60fa:     	movq	-0x30(%rbp), %rax
1454c60fe:     	movq	%rax, 0xd8(%rbp)
1454c6105:     	movb	$0x2, 0x10d(%rbp)
1454c610c:     	movl	%ebx, 0xf8(%rbp)
1454c6112:     	movzbl	0x290(%rbp), %eax
1454c6119:     	movb	%al, 0x10c(%rbp)
1454c611f:     	movzbl	0x298(%rbp), %eax
1454c6126:     	movb	%al, 0x10f(%rbp)
1454c612c:     	movq	%rdi, 0xf0(%rbp)
1454c6133:     	movlps	%xmm9, 0xfc(%rbp)
1454c613b:     	movss	%xmm10, 0x104(%rbp)
1454c6144:     	movss	%xmm6, 0x108(%rbp)
1454c614c:     	movb	%r14b, 0x10e(%rbp)
1454c6153:     	movb	%r15b, 0x110(%rbp)
1454c615a:     	movb	$0x0, 0x111(%rbp)
1454c6161:     	leaq	0xf0(%rbp), %rdx
1454c6168:     	leaq	0xb8(%rbp), %r8
1454c616f:     	movq	%rcx, 0xe0(%rbp)
1454c6176:     	movq	%rsi, %rcx
1454c6179:     	callq	0x1454b9930 <.text+0x54b8930>
1454c617e:     	nop
1454c617f:     	movq	0xe0(%rbp), %rax
1454c6186:     	testq	%rax, %rax
1454c6189:     	je	0x1454c61a5 <.text+0x54c51a5>
1454c618b:     	shlq	$0x4, %rax
1454c618f:     	leaq	(%rax,%rax,2), %rdx
1454c6193:     	movl	$0x8, %r8d
1454c6199:     	movq	0x80(%rbp), %rcx
1454c61a0:     	callq	0x1400021d0 <.text+0x11d0>
1454c61a5:     	leaq	-0x28(%rbp), %rcx
1454c61a9:     	callq	0x1455127d0 <.text+0x55117d0>
1454c61ae:     	movaps	0x180(%rbp), %xmm6
1454c61b5:     	movaps	0x190(%rbp), %xmm7
1454c61bc:     	movaps	0x1a0(%rbp), %xmm8
1454c61c4:     	movaps	0x1b0(%rbp), %xmm9
1454c61cc:     	movaps	0x1c0(%rbp), %xmm10
1454c61d4:     	movaps	0x1d0(%rbp), %xmm11
1454c61dc:     	movaps	0x1e0(%rbp), %xmm12
1454c61e4:     	movaps	0x1f0(%rbp), %xmm13
1454c61ec:     	movaps	0x200(%rbp), %xmm14
1454c61f4:     	movaps	0x210(%rbp), %xmm15
1454c61fc:     	addq	$0x2a8, %rsp            # imm = 0x2A8
1454c6203:     	popq	%rbx
1454c6204:     	popq	%rdi
1454c6205:     	popq	%rsi
1454c6206:     	popq	%r12
1454c6208:     	popq	%r13
1454c620a:     	popq	%r14
1454c620c:     	popq	%r15
1454c620e:     	popq	%rbp
1454c620f:     	retq
1454c6210:     	movl	-0x4(%r8,%rdx,4), %r10d
1454c6215:     	decq	%rdx
1454c6218:     	movl	%r10d, (%r8,%r9,4)
1454c621c:     	movq	%rdx, 0xf0(%rsi)
1454c6223:     	movb	$0x1, %r15b
1454c6226:     	jmp	0x1454c6055 <.text+0x54c5055>
1454c622b:     	mulss	%xmm7, %xmm8
1454c6230:     	movq	0x40(%rbp), %r8
1454c6234:     	movl	0xb0(%rbp), %r15d
1454c623b:     	cmpq	0xe8(%rbp), %r8
1454c6242:     	je	0x1454c639d <.text+0x54c539d>
1454c6248:     	movq	(%r8), %r13
1454c624b:     	addq	$0x8, %r8
1454c624f:     	movq	0x4c8(%rsi), %rcx
1454c6256:     	imulq	$0x160, 0x4d0(%rsi), %rax # imm = 0x160
1454c6261:     	testq	%rax, %rax
1454c6264:     	je	0x1454c623b <.text+0x54c523b>
1454c6266:     	movq	%rcx, %rdx
1454c6269:     	addq	$0x160, %rcx            # imm = 0x160
1454c6270:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454c6276:     	cmpq	%r13, 0x88(%rdx)
1454c627d:     	jne	0x1454c6261 <.text+0x54c5261>
1454c627f:     	testb	$0x1, 0x68(%rdx)
1454c6283:     	jne	0x1454c6261 <.text+0x54c5261>
1454c6285:     	movq	%r8, 0x70(%rbp)
1454c6289:     	movq	%r13, 0x158(%rbp)
1454c6290:     	movq	%r13, 0x90(%rbp)
1454c6297:     	movl	$0x0, 0x88(%rbp)
1454c62a1:     	movl	$0x0, 0x48(%rbp)
1454c62a8:     	leaq	0x48(%rbp), %rax
1454c62ac:     	movq	%rax, 0x30(%rsp)
1454c62b1:     	leaq	0x88(%rbp), %rax
1454c62b8:     	movq	%rax, 0x28(%rsp)
1454c62bd:     	movq	$0x1, 0x20(%rsp)
1454c62c6:     	leaq	0xb8(%rbp), %rcx
1454c62cd:     	movq	%rdi, %rdx
1454c62d0:     	movl	$0x22d9, %r8d           # imm = 0x22D9
1454c62d6:     	leaq	0x158(%rbp), %r9
1454c62dd:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c62e2:     	nop
1454c62e3:     	movq	0x548(%rsi), %r15
1454c62ea:     	cmpq	0x538(%rsi), %r15
1454c62f1:     	jne	0x1454c6300 <.text+0x54c5300>
1454c62f3:     	leaq	0x538(%rsi), %rcx
1454c62fa:     	callq	0x1457580b0 <.text+0x57570b0>
1454c62ff:     	nop
1454c6300:     	movq	0x540(%rsi), %rax
1454c6307:     	movq	%r15, %rcx
1454c630a:     	shlq	$0x5, %rcx
1454c630e:     	movups	0xb8(%rbp), %xmm0
1454c6315:     	movups	0xc8(%rbp), %xmm1
1454c631c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c6321:     	movups	%xmm0, (%rax,%rcx)
1454c6325:     	incq	%r15
1454c6328:     	movq	%r15, 0x548(%rsi)
1454c632f:     	movl	0x40(%r14), %r9d
1454c6333:     	movzbl	0x74(%r14), %eax
1454c6338:     	movb	0x111(%rsi), %r15b
1454c633f:     	movb	$0x3, 0x111(%rsi)
1454c6346:     	movups	0x20(%rsi), %xmm7
1454c634a:     	movups	0x40(%rsi), %xmm12
1454c634f:     	movq	$0x0, 0x20(%rsi)
1454c6357:     	movq	$0x0, 0x40(%rsi)
1454c635f:     	movb	%al, 0x20(%rsp)
1454c6363:     	movb	$0x0, 0x30(%rsp)
1454c6368:     	movb	$0x0, 0x28(%rsp)
1454c636d:     	movq	%rsi, %rcx
1454c6370:     	movq	%r13, %rdx
1454c6373:     	movaps	%xmm8, %xmm2
1454c6377:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454c637c:     	nop
1454c637d:     	movb	%r15b, 0x111(%rsi)
1454c6384:     	movups	%xmm7, 0x20(%rsi)
1454c6388:     	movups	%xmm12, 0x40(%rsi)
1454c638d:     	movl	0xb0(%rbp), %r15d
1454c6394:     	movq	0x70(%rbp), %r8
1454c6398:     	jmp	0x1454c623b <.text+0x54c523b>
1454c639d:     	movq	0x78(%rbp), %rdx
1454c63a1:     	testq	%rdx, %rdx
1454c63a4:     	jne	0x1454c5971 <.text+0x54c4971>
1454c63aa:     	jmp	0x1454c5984 <.text+0x54c4984>
1454c63af:     	cmpq	%rdi, 0x28(%rdx,%r8,8)
1454c63b4:     	movl	%r9d, %r15d
1454c63b7:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c63bd:     	cmpl	$0x30, %ecx
1454c63c0:     	je	0x1454c516c <.text+0x54c416c>
1454c63c6:     	cmpq	%rdi, 0x30(%rdx,%r8,8)
1454c63cb:     	setne	%dl
1454c63ce:     	cmpq	$0x38, %rcx
1454c63d2:     	sete	%cl
1454c63d5:     	testb	%cl, %dl
1454c63d7:     	movl	%r9d, %r15d
1454c63da:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c63e0:     	jmp	0x1454c4fd6 <.text+0x54c3fd6>
