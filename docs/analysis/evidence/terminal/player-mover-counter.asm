; fresh-counter-store
1459009a9: 48 b8 00 00 00 00 01 00 00 00       	movabsq	$0x100000000, %rax # imm = 0x100000000
1459009b3: 48 89 85 74 05 00 00        	movq	%rax, 0x574(%rbp)

; fresh-game-output-copy
14590157b: 48 8d 55 30                 	leaq	0x30(%rbp), %rdx
14590157f: 41 b8 78 0a 00 00           	movl	$0xa78, %r8d            # imm = 0xA78
145901585: 48 8b b5 e8 0b 00 00        	movq	0xbe8(%rbp), %rsi
14590158c: 48 89 f1                    	movq	%rsi, %rcx
14590158f: e8 e7 81 2c 00              	callq	0x145bc977b <.text+0x5bc877b>

; player-knockback-counter
1458f9368: 66 44 0f 6f ef              	movdqa	%xmm7, %xmm13
1458f936d: f3 44 0f 58 2d de 43 47 00  	addss	0x4743de(%rip), %xmm13  # 0x145d6d754
1458f9376: 44 8b 86 48 05 00 00        	movl	0x548(%rsi), %r8d
1458f937d: 41 8d 40 01                 	leal	0x1(%r8), %eax
1458f9381: 89 86 48 05 00 00           	movl	%eax, 0x548(%rsi)
1458f9387: 48 8d be d0 05 00 00        	leaq	0x5d0(%rsi), %rdi
1458f938e: 48 8b 96 60 04 00 00        	movq	0x460(%rsi), %rdx
1458f9395: 66 44 0f 13 5d 20           	movlpd	%xmm11, 0x20(%rbp)
1458f939b: f3 44 0f 11 6d 28           	movss	%xmm13, 0x28(%rbp)
1458f93a1: f3 0f 11 74 24 20           	movss	%xmm6, 0x20(%rsp)
1458f93a7: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
1458f93ab: 4c 8d 4d 20                 	leaq	0x20(%rbp), %r9
1458f93af: e8 1c c4 fb ff              	callq	0x1458b57d0 <.text+0x58b47d0>

; player-speed-counter
1458fa0fb: f3 41 0f 11 9c 24 4c 05 00 00       	movss	%xmm3, 0x54c(%r12)
1458fa105: 45 8b 84 24 48 05 00 00     	movl	0x548(%r12), %r8d
1458fa10d: 41 8d 40 01                 	leal	0x1(%r8), %eax
1458fa111: 41 89 84 24 48 05 00 00     	movl	%eax, 0x548(%r12)
1458fa119: 49 8b 94 24 60 04 00 00     	movq	0x460(%r12), %rdx
1458fa121: 48 8d 4d 60                 	leaq	0x60(%rbp), %rcx
1458fa125: e8 e6 31 fb ff              	callq	0x1458ad310 <.text+0x58ac310>
1458fa12a: 90                          	nop

; tick-player-relocation-counter
145902402: 45 8b 85 48 05 00 00        	movl	0x548(%r13), %r8d
145902409: 41 8d 40 01                 	leal	0x1(%r8), %eax
14590240d: 41 89 85 48 05 00 00        	movl	%eax, 0x548(%r13)
145902414: 49 8b 95 60 04 00 00        	movq	0x460(%r13), %rdx
14590241b: f3 41 0f 10 85 d4 04 00 00  	movss	0x4d4(%r13), %xmm0
145902424: 8b 85 c8 02 00 00           	movl	0x2c8(%rbp), %eax
14590242a: 89 85 e8 02 00 00           	movl	%eax, 0x2e8(%rbp)
145902430: 48 8b 85 c0 02 00 00        	movq	0x2c0(%rbp), %rax
145902437: 48 89 85 e0 02 00 00        	movq	%rax, 0x2e0(%rbp)
14590243e: f3 0f 11 44 24 20           	movss	%xmm0, 0x20(%rsp)
145902444: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14590244b: 4c 8d 8d e0 02 00 00        	leaq	0x2e0(%rbp), %r9
145902452: e8 79 33 fb ff              	callq	0x1458b57d0 <.text+0x58b47d0>

; victory-root-counter
14590fea9: 49 8b 95 60 04 00 00        	movq	0x460(%r13), %rdx
14590feb0: 45 8b 85 48 05 00 00        	movl	0x548(%r13), %r8d
14590feb7: 48 8d 8d a0 00 00 00        	leaq	0xa0(%rbp), %rcx
14590febe: e8 ad 9a f9 ff              	callq	0x1458a9970 <.text+0x58a8970>
14590fec3: 49 8b b5 e0 05 00 00        	movq	0x5e0(%r13), %rsi
14590feca: 49 3b b5 d0 05 00 00        	cmpq	0x5d0(%r13), %rsi
14590fed1: 75 0d                       	jne	0x14590fee0 <.text+0x590eee0>
14590fed3: 48 8b 8d 50 03 00 00        	movq	0x350(%rbp), %rcx
14590feda: e8 51 b6 2b 00              	callq	0x145bcb530 <.text+0x5bca530>
14590fedf: 90                          	nop
14590fee0: 49 8b 85 d8 05 00 00        	movq	0x5d8(%r13), %rax
14590fee7: 48 89 f1                    	movq	%rsi, %rcx
14590feea: 48 c1 e1 05                 	shlq	$0x5, %rcx
14590feee: 0f 10 85 a0 00 00 00        	movups	0xa0(%rbp), %xmm0
14590fef5: 0f 10 8d b0 00 00 00        	movups	0xb0(%rbp), %xmm1
14590fefc: 0f 11 4c 08 10              	movups	%xmm1, 0x10(%rax,%rcx)
14590ff01: 0f 11 04 08                 	movups	%xmm0, (%rax,%rcx)
14590ff05: 48 ff c6                    	incq	%rsi
14590ff08: 49 89 b5 e0 05 00 00        	movq	%rsi, 0x5e0(%r13)
14590ff0f: 41 ff 85 48 05 00 00        	incl	0x548(%r13)
