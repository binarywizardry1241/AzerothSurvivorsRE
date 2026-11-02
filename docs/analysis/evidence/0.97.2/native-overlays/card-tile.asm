
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c1d40:     	pushq	%rbp
1400c1d41:     	pushq	%r15
1400c1d43:     	pushq	%r14
1400c1d45:     	pushq	%r13
1400c1d47:     	pushq	%r12
1400c1d49:     	pushq	%rsi
1400c1d4a:     	pushq	%rdi
1400c1d4b:     	pushq	%rbx
1400c1d4c:     	subq	$0x888, %rsp            # imm = 0x888
1400c1d53:     	leaq	0x80(%rsp), %rbp
1400c1d5b:     	movaps	%xmm10, 0x7f0(%rbp)
1400c1d63:     	movaps	%xmm9, 0x7e0(%rbp)
1400c1d6b:     	movaps	%xmm8, 0x7d0(%rbp)
1400c1d73:     	movaps	%xmm7, 0x7c0(%rbp)
1400c1d7a:     	movaps	%xmm6, 0x7b0(%rbp)
1400c1d81:     	movq	$-0x2, 0x7a8(%rbp)
1400c1d8c:     	movq	%r9, %r15
1400c1d8f:     	movq	%r8, %rsi
1400c1d92:     	movq	%rdx, %r13
1400c1d95:     	movq	%rcx, %r14
1400c1d98:     	movq	0x878(%rbp), %rdi
1400c1d9f:     	leaq	0x583c29a(%rip), %rcx   # 0x1458fe040
1400c1da6:     	movl	$0x6, %edx
1400c1dab:     	movq	%rdi, %r8
1400c1dae:     	callq	0x142aed730 <.text+0x2aec730>
1400c1db3:     	testq	%rax, %rax
1400c1db6:     	jne	0x1400c1dbf <.text+0xc0dbf>
1400c1db8:     	movq	0x78fa9f9(%rip), %rax   # 0x1479bc7b8
1400c1dbf:     	movsd	0x583aae9(%rip), %xmm0  # 0x1458fc8b0
1400c1dc7:     	movaps	0x583aaf2(%rip), %xmm1  # 0x1458fc8c0
1400c1dce:     	movaps	0x583aafb(%rip), %xmm6  # 0x1458fc8d0
1400c1dd5:     	movss	0x583ab03(%rip), %xmm2  # 0x1458fc8e0
1400c1ddd:     	movss	0x583488f(%rip), %xmm7  # 0x1458f6674
1400c1de5:     	movss	0x583aab3(%rip), %xmm3  # 0x1458fc8a0
1400c1ded:     	cmpb	$0x2, (%rax)
1400c1df0:     	jne	0x1400c1dfd <.text+0xc0dfd>
1400c1df2:     	cmpq	$0x0, 0x8(%rax)
1400c1df7:     	je	0x1400c1ef2 <.text+0xc0ef2>
1400c1dfd:     	xorl	%ebx, %ebx
1400c1dff:     	movl	$0x0, 0x45c(%rbp)
1400c1e09:     	movlps	%xmm1, 0x460(%rbp)
1400c1e10:     	movss	%xmm3, 0x468(%rbp)
1400c1e18:     	movl	$0x3f800000, 0x46c(%rbp) # imm = 0x3F800000
1400c1e22:     	movl	$0x0, 0x274(%rbp)
1400c1e2c:     	movlps	%xmm0, 0x278(%rbp)
1400c1e33:     	movss	%xmm2, 0x280(%rbp)
1400c1e3b:     	movl	$0x3f800000, 0x284(%rbp) # imm = 0x3F800000
1400c1e45:     	leaq	0x583c21c(%rip), %rcx   # 0x1458fe068
1400c1e4c:     	movl	$0x4, %edx
1400c1e51:     	movq	%rdi, %r8
1400c1e54:     	callq	0x142aed730 <.text+0x2aec730>
1400c1e59:     	testq	%rax, %rax
1400c1e5c:     	jne	0x1400c1e65 <.text+0xc0e65>
1400c1e5e:     	movq	0x78fa953(%rip), %rax   # 0x1479bc7b8
1400c1e65:     	cmpb	$0x3, (%rax)
1400c1e68:     	jne	0x1400c1e80 <.text+0xc0e80>
1400c1e6a:     	movq	0x18(%rax), %rdx
1400c1e6e:     	testq	%rdx, %rdx
1400c1e71:     	jns	0x1400c1fde <.text+0xc0fde>
1400c1e77:     	xorl	%ecx, %ecx
1400c1e79:     	callq	0x1458e721b <.text+0x58e621b>
1400c1e7e:     	ud2
1400c1e80:     	movl	$0x1, %eax
1400c1e85:     	movq	%rax, 0x758(%rbp)
1400c1e8c:     	movq	$0x0, 0x778(%rbp)
1400c1e97:     	movb	$0x1, 0x7a5(%rbp)
1400c1e9e:     	leaq	0x583c1c7(%rip), %rcx   # 0x1458fe06c
1400c1ea5:     	movl	$0x5, %edx
1400c1eaa:     	movq	%rdi, %r8
1400c1ead:     	callq	0x142aed730 <.text+0x2aec730>
1400c1eb2:     	nop
1400c1eb3:     	testq	%rax, %rax
1400c1eb6:     	jne	0x1400c1ebf <.text+0xc0ebf>
1400c1eb8:     	movq	0x78fa8f9(%rip), %rax   # 0x1479bc7b8
1400c1ebf:     	movl	$0x1, %r12d
1400c1ec5:     	cmpb	$0x3, (%rax)
1400c1ec8:     	jne	0x1400c20a7 <.text+0xc10a7>
1400c1ece:     	movq	0x18(%rax), %r8
1400c1ed2:     	testq	%r8, %r8
1400c1ed5:     	jns	0x1400c204e <.text+0xc104e>
1400c1edb:     	xorl	%ecx, %ecx
1400c1edd:     	movb	$0x1, 0x7a5(%rbp)
1400c1ee4:     	movq	%r8, %rdx
1400c1ee7:     	callq	0x1458e721b <.text+0x58e621b>
1400c1eec:     	nop
1400c1eed:     	jmp	0x1400c4971 <.text+0xc3971>
1400c1ef2:     	movq	0x10(%rax), %rcx
1400c1ef6:     	cmpq	$0x4, %rcx
1400c1efa:     	movl	$0x4, %eax
1400c1eff:     	cmovbq	%rcx, %rax
1400c1f03:     	decq	%rax
1400c1f06:     	cmpq	$0x3, %rax
1400c1f0a:     	ja	0x1400c1dfd <.text+0xc0dfd>
1400c1f10:     	leaq	0x583e115(%rip), %rcx   # 0x14590002c
1400c1f17:     	movslq	(%rcx,%rax,4), %rax
1400c1f1b:     	addq	%rcx, %rax
1400c1f1e:     	jmpq	*%rax
1400c1f20:     	movsd	0x583aa88(%rip), %xmm0  # 0x1458fc9b0
1400c1f28:     	movsd	0x583aa90(%rip), %xmm1  # 0x1458fc9c0
1400c1f30:     	movsd	0x583aa98(%rip), %xmm6  # 0x1458fc9d0
1400c1f38:     	movss	0x583aaa0(%rip), %xmm2  # 0x1458fc9e0
1400c1f40:     	xorps	%xmm3, %xmm3
1400c1f43:     	xorl	%ebx, %ebx
1400c1f45:     	xorps	%xmm7, %xmm7
1400c1f48:     	jmp	0x1400c1dff <.text+0xc0dff>
1400c1f4d:     	movsd	0x583a9db(%rip), %xmm0  # 0x1458fc930
1400c1f55:     	movsd	0x583a9e3(%rip), %xmm1  # 0x1458fc940
1400c1f5d:     	movsd	0x583a9eb(%rip), %xmm6  # 0x1458fc950
1400c1f65:     	movss	0x5834703(%rip), %xmm2  # 0x1458f6670
1400c1f6d:     	movss	0x583a9eb(%rip), %xmm7  # 0x1458fc960
1400c1f75:     	jmp	0x1400c1fd1 <.text+0xc0fd1>
1400c1f77:     	movsd	0x583a971(%rip), %xmm0  # 0x1458fc8f0
1400c1f7f:     	movsd	0x583a979(%rip), %xmm1  # 0x1458fc900
1400c1f87:     	movsd	0x583a981(%rip), %xmm6  # 0x1458fc910
1400c1f8f:     	movss	0x583a989(%rip), %xmm2  # 0x1458fc920
1400c1f97:     	xorps	%xmm7, %xmm7
1400c1f9a:     	movss	0x583a982(%rip), %xmm3  # 0x1458fc924
1400c1fa2:     	movb	$0x1, %bl
1400c1fa4:     	jmp	0x1400c1dff <.text+0xc0dff>
1400c1fa9:     	movsd	0x583a9bf(%rip), %xmm0  # 0x1458fc970
1400c1fb1:     	movsd	0x583a9c7(%rip), %xmm1  # 0x1458fc980
1400c1fb9:     	movsd	0x583a9cf(%rip), %xmm6  # 0x1458fc990
1400c1fc1:     	movss	0x5829543(%rip), %xmm2  # 0x1458eb50c
1400c1fc9:     	movss	0x583a9cf(%rip), %xmm7  # 0x1458fc9a0
1400c1fd1:     	movss	0x58294a7(%rip), %xmm3  # 0x1458eb480
1400c1fd9:     	jmp	0x1400c1dfd <.text+0xc0dfd>
1400c1fde:     	movl	$0x1, %ecx
1400c1fe3:     	movq	%rcx, 0x758(%rbp)
1400c1fea:     	movq	%rdx, 0x778(%rbp)
1400c1ff1:     	je	0x1400c1e8c <.text+0xc0e8c>
1400c1ff7:     	movq	0x10(%rax), %rax
1400c1ffb:     	movq	%rax, 0x790(%rbp)
1400c2002:     	callq	0x140002200 <.text+0x1200>
1400c2007:     	movl	$0x1, %edx
1400c200c:     	movq	0x778(%rbp), %r12
1400c2013:     	movq	%r12, %rcx
1400c2016:     	callq	0x1400021c0 <.text+0x11c0>
1400c201b:     	movq	%r12, %rdx
1400c201e:     	movl	$0x1, %ecx
1400c2023:     	movq	%rax, 0x758(%rbp)
1400c202a:     	testq	%rax, %rax
1400c202d:     	je	0x1400c1e79 <.text+0xc0e79>
1400c2033:     	movq	0x758(%rbp), %rcx
1400c203a:     	movq	%rdx, %r8
1400c203d:     	movq	0x790(%rbp), %rdx
1400c2044:     	callq	0x145756ddd <.text+0x5755ddd>
1400c2049:     	jmp	0x1400c1e97 <.text+0xc0e97>
1400c204e:     	movq	%r8, 0x790(%rbp)
1400c2055:     	je	0x1400c20a7 <.text+0xc10a7>
1400c2057:     	movq	0x10(%rax), %rax
1400c205b:     	movq	%rax, 0x768(%rbp)
1400c2062:     	callq	0x140002200 <.text+0x1200>
1400c2067:     	movl	$0x1, %edx
1400c206c:     	movq	0x790(%rbp), %r12
1400c2073:     	movq	%r12, %rcx
1400c2076:     	callq	0x1400021c0 <.text+0x11c0>
1400c207b:     	movq	%r12, %r8
1400c207e:     	movl	$0x1, %ecx
1400c2083:     	testq	%rax, %rax
1400c2086:     	je	0x1400c1edd <.text+0xc0edd>
1400c208c:     	movq	%rax, %r12
1400c208f:     	movq	%rax, %rcx
1400c2092:     	movq	0x768(%rbp), %rdx
1400c2099:     	callq	0x145756ddd <.text+0x5755ddd>
1400c209e:     	movq	0x790(%rbp), %rax
1400c20a5:     	jmp	0x1400c20a9 <.text+0xc10a9>
1400c20a7:     	xorl	%eax, %eax
1400c20a9:     	movq	%rax, 0x790(%rbp)
1400c20b0:     	movq	$0x0, 0x490(%rbp)
1400c20bb:     	movq	%rax, 0x498(%rbp)
1400c20c2:     	movq	%r12, 0x768(%rbp)
1400c20c9:     	movq	%r12, 0x4a0(%rbp)
1400c20d0:     	movq	%rax, 0x4a8(%rbp)
1400c20d7:     	movq	$0x0, 0x4b0(%rbp)
1400c20e2:     	movq	%rax, 0x4b8(%rbp)
1400c20e9:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1400c20f3:     	movq	%rax, 0x4c0(%rbp)
1400c20fa:     	movb	$0x1, 0x4c8(%rbp)
1400c2101:     	movw	$0x1, 0x4d0(%rbp)
1400c210a:     	leaq	0x720(%rbp), %rcx
1400c2111:     	leaq	0x490(%rbp), %rdx
1400c2118:     	callq	0x140103710 <.text+0x102710>
1400c211d:     	nop
1400c211e:     	movq	0x790(%rbp), %rdx
1400c2125:     	testq	%rdx, %rdx
1400c2128:     	je	0x1400c213c <.text+0xc113c>
1400c212a:     	movl	$0x1, %r8d
1400c2130:     	movq	0x768(%rbp), %rcx
1400c2137:     	callq	0x1400021d0 <.text+0x11d0>
1400c213c:     	movb	$0x1, 0x7a4(%rbp)
1400c2143:     	movb	$0x1, 0x7a3(%rbp)
1400c214a:     	leaq	0x583bf20(%rip), %r12   # 0x1458fe071
1400c2151:     	movl	$0x4, %edx
1400c2156:     	movq	%r12, %rcx
1400c2159:     	movq	%rdi, %r8
1400c215c:     	callq	0x142aed730 <.text+0x2aec730>
1400c2161:     	nop
1400c2162:     	testq	%rax, %rax
1400c2165:     	jne	0x1400c216e <.text+0xc116e>
1400c2167:     	movq	0x78fa64a(%rip), %rax   # 0x1479bc7b8
1400c216e:     	cmpb	$0x3, (%rax)
1400c2171:     	jne	0x1400c221f <.text+0xc121f>
1400c2177:     	movq	0x18(%rax), %r8
1400c217b:     	testq	%r8, %r8
1400c217e:     	jns	0x1400c219e <.text+0xc119e>
1400c2180:     	xorl	%ecx, %ecx
1400c2182:     	movb	$0x1, 0x7a4(%rbp)
1400c2189:     	movb	$0x1, 0x7a3(%rbp)
1400c2190:     	movq	%r8, %rdx
1400c2193:     	callq	0x1458e721b <.text+0x58e621b>
1400c2198:     	nop
1400c2199:     	jmp	0x1400c4971 <.text+0xc3971>
1400c219e:     	movq	%r8, 0x790(%rbp)
1400c21a5:     	je	0x1400c221f <.text+0xc121f>
1400c21a7:     	movq	%r13, 0x780(%rbp)
1400c21ae:     	movq	%rsi, 0x748(%rbp)
1400c21b5:     	movq	0x10(%rax), %rsi
1400c21b9:     	callq	0x140002200 <.text+0x1200>
1400c21be:     	movl	$0x1, %edx
1400c21c3:     	movq	0x790(%rbp), %r13
1400c21ca:     	movq	%r13, %rcx
1400c21cd:     	callq	0x1400021c0 <.text+0x11c0>
1400c21d2:     	movq	%r13, %r8
1400c21d5:     	movl	$0x1, %ecx
1400c21da:     	movq	%rax, 0x750(%rbp)
1400c21e1:     	testq	%rax, %rax
1400c21e4:     	je	0x1400c2182 <.text+0xc1182>
1400c21e6:     	movq	0x750(%rbp), %r13
1400c21ed:     	movq	%r13, %rcx
1400c21f0:     	movq	%rsi, %rdx
1400c21f3:     	movq	%r8, %rsi
1400c21f6:     	callq	0x145756ddd <.text+0x5755ddd>
1400c21fb:     	movl	$0x0, 0x768(%rbp)
1400c2205:     	movq	%rsi, 0x798(%rbp)
1400c220c:     	movq	%r13, 0x788(%rbp)
1400c2213:     	movq	0x748(%rbp), %rsi
1400c221a:     	jmp	0x1400c4a99 <.text+0xc3a99>
1400c221f:     	movq	$0x1, 0x740(%rbp)
1400c222a:     	movq	$0x0, 0x738(%rbp)
1400c2235:     	movb	$0x1, 0x7a2(%rbp)
1400c223c:     	movb	$0x1, 0x7a1(%rbp)
1400c2243:     	movb	$0x1, 0x7a0(%rbp)
1400c224a:     	leaq	0x583be24(%rip), %rcx   # 0x1458fe075
1400c2251:     	movl	$0x5, %edx
1400c2256:     	movq	%rdi, %r8
1400c2259:     	callq	0x142aed730 <.text+0x2aec730>
1400c225e:     	nop
1400c225f:     	testq	%rax, %rax
1400c2262:     	jne	0x1400c226b <.text+0xc126b>
1400c2264:     	movq	0x78fa54d(%rip), %rax   # 0x1479bc7b8
1400c226b:     	cmpb	$0x3, (%rax)
1400c226e:     	jne	0x1400c22b5 <.text+0xc12b5>
1400c2270:     	movq	0x18(%rax), %rdx
1400c2274:     	testq	%rdx, %rdx
1400c2277:     	jns	0x1400c4973 <.text+0xc3973>
1400c227d:     	xorl	%ecx, %ecx
1400c227f:     	movq	$0x1, 0x740(%rbp)
1400c228a:     	movq	$0x0, 0x738(%rbp)
1400c2295:     	movb	$0x1, 0x7a2(%rbp)
1400c229c:     	movb	$0x1, 0x7a1(%rbp)
1400c22a3:     	movb	$0x1, 0x7a0(%rbp)
1400c22aa:     	callq	0x1458e721b <.text+0x58e621b>
1400c22af:     	nop
1400c22b0:     	jmp	0x1400c4971 <.text+0xc3971>
1400c22b5:     	movl	$0x1, %eax
1400c22ba:     	movq	%rax, 0x750(%rbp)
1400c22c1:     	movb	$0x1, %al
1400c22c3:     	movl	%eax, 0x768(%rbp)
1400c22c9:     	movq	$0x0, 0x790(%rbp)
1400c22d4:     	movq	$0x0, 0x798(%rbp)
1400c22df:     	movl	$0x1, %eax
1400c22e4:     	movq	%rax, 0x788(%rbp)
1400c22eb:     	movq	$0x0, 0x290(%rbp)
1400c22f6:     	movq	$0x8, 0x298(%rbp)
1400c2301:     	movq	$0x0, 0x2a0(%rbp)
1400c230c:     	leaq	0x583bd67(%rip), %rcx   # 0x1458fe07a
1400c2313:     	movl	$0x4, %edx
1400c2318:     	movq	%rdi, %r8
1400c231b:     	callq	0x142aed730 <.text+0x2aec730>
1400c2320:     	nop
1400c2321:     	movq	%r13, 0x780(%rbp)
1400c2328:     	testq	%rax, %rax
1400c232b:     	jne	0x1400c2334 <.text+0xc1334>
1400c232d:     	movq	0x78fa484(%rip), %rax   # 0x1479bc7b8
1400c2334:     	movl	$0x1, %r13d
1400c233a:     	cmpb	$0x3, (%rax)
1400c233d:     	jne	0x1400c235c <.text+0xc135c>
1400c233f:     	movq	0x18(%rax), %rdx
1400c2343:     	testq	%rdx, %rdx
1400c2346:     	jns	0x1400c4a09 <.text+0xc3a09>
1400c234c:     	xorl	%esi, %esi
1400c234e:     	movq	%rsi, %rcx
1400c2351:     	callq	0x1458e721b <.text+0x58e621b>
1400c2356:     	nop
1400c2357:     	jmp	0x1400c4971 <.text+0xc3971>
1400c235c:     	movq	%rsi, 0x748(%rbp)
1400c2363:     	xorl	%eax, %eax
1400c2365:     	movq	0x798(%rbp), %rcx
1400c236c:     	movq	$0x0, 0x490(%rbp)
1400c2377:     	movq	$0x1, 0x498(%rbp)
1400c2382:     	movq	$0x0, 0x4a0(%rbp)
1400c238d:     	movb	$0x0, 0x590(%rbp)
1400c2394:     	movq	%rcx, 0x4a8(%rbp)
1400c239b:     	movq	0x788(%rbp), %rdx
1400c23a2:     	movq	%rdx, 0x4b0(%rbp)
1400c23a9:     	movq	%rcx, 0x4b8(%rbp)
1400c23b0:     	movq	$0x0, 0x4c0(%rbp)
1400c23bb:     	movq	$0x1, 0x4c8(%rbp)
1400c23c6:     	xorps	%xmm0, %xmm0
1400c23c9:     	movups	%xmm0, 0x4d0(%rbp)
1400c23d0:     	movq	$0x1, 0x4e0(%rbp)
1400c23db:     	movq	$0x0, 0x4e8(%rbp)
1400c23e6:     	movups	0x290(%rbp), %xmm0
1400c23ed:     	movups	%xmm0, 0x4f0(%rbp)
1400c23f4:     	movq	0x2a0(%rbp), %rcx
1400c23fb:     	movq	%rcx, 0x500(%rbp)
1400c2402:     	movq	$0x0, 0x508(%rbp)
1400c240d:     	movq	$0x1, 0x510(%rbp)
1400c2418:     	movq	$0x0, 0x518(%rbp)
1400c2423:     	movq	%rax, 0x520(%rbp)
1400c242a:     	movq	%r13, 0x528(%rbp)
1400c2431:     	movq	%rax, 0x530(%rbp)
1400c2438:     	movq	$-0x1, 0x538(%rbp)
1400c2443:     	movb	$0x1, 0x7a7(%rbp)
1400c244a:     	movb	$0x1, 0x7a6(%rbp)
1400c2451:     	leaq	0x583bc26(%rip), %rcx   # 0x1458fe07e
1400c2458:     	movl	$0x4, %edx
1400c245d:     	movq	%rdi, %r8
1400c2460:     	callq	0x142aed730 <.text+0x2aec730>
1400c2465:     	nop
1400c2466:     	movq	0x780(%rbp), %r13
1400c246d:     	testq	%rax, %rax
1400c2470:     	jne	0x1400c2479 <.text+0xc1479>
1400c2472:     	movq	0x78fa33f(%rip), %rax   # 0x1479bc7b8
1400c2479:     	cmpb	$0x3, (%rax)
1400c247c:     	jne	0x1400c2605 <.text+0xc1605>
1400c2482:     	movq	0x18(%rax), %rcx
1400c2486:     	addq	$-0x3, %rcx
1400c248a:     	cmpq	$0x4, %rcx
1400c248e:     	ja	0x1400c2605 <.text+0xc1605>
1400c2494:     	movq	0x10(%rax), %rax
1400c2498:     	leaq	0x583db9d(%rip), %rdx   # 0x14590003c
1400c249f:     	movslq	(%rdx,%rcx,4), %rcx
1400c24a3:     	addq	%rdx, %rcx
1400c24a6:     	jmpq	*%rcx
1400c24a8:     	movzwl	(%rax), %ecx
1400c24ab:     	xorl	$0x656e, %ecx           # imm = 0x656E
1400c24b1:     	movzbl	0x2(%rax), %eax
1400c24b5:     	xorl	$0x77, %eax
1400c24b8:     	orw	%cx, %ax
1400c24bb:     	jne	0x1400c2605 <.text+0xc1605>
1400c24c1:     	movb	$0x1, 0x7a7(%rbp)
1400c24c8:     	movb	$0x1, 0x7a6(%rbp)
1400c24cf:     	leaq	0x583bd46(%rip), %rcx   # 0x1458fe21c
1400c24d6:     	movl	$0x3, %edx
1400c24db:     	callq	0x145452350 <.text+0x5451350>
1400c24e0:     	nop
1400c24e1:     	movq	%rdx, %r12
1400c24e4:     	testq	%rdx, %rdx
1400c24e7:     	jns	0x1400c3291 <.text+0xc2291>
1400c24ed:     	xorl	%r13d, %r13d
1400c24f0:     	movb	$0x1, 0x7a7(%rbp)
1400c24f7:     	movb	$0x1, 0x7a6(%rbp)
1400c24fe:     	movq	%r13, %rcx
1400c2501:     	movq	%r12, %rdx
1400c2504:     	callq	0x1458e721b <.text+0x58e621b>
1400c2509:     	nop
1400c250a:     	jmp	0x1400c4971 <.text+0xc3971>
1400c250f:     	movl	$0x6c756d61, %ecx       # imm = 0x6C756D61
1400c2514:     	xorl	(%rax), %ecx
1400c2516:     	movzwl	0x4(%rax), %eax
1400c251a:     	xorl	$0x7465, %eax           # imm = 0x7465
1400c251f:     	orl	%ecx, %eax
1400c2521:     	jne	0x1400c2605 <.text+0xc1605>
1400c2527:     	movb	$0x1, 0x7a7(%rbp)
1400c252e:     	movb	$0x1, 0x7a6(%rbp)
1400c2535:     	leaq	0x583bb6e(%rip), %rcx   # 0x1458fe0aa
1400c253c:     	movl	$0x6, %edx
1400c2541:     	callq	0x145452350 <.text+0x5451350>
1400c2546:     	nop
1400c2547:     	movq	%rdx, %r15
1400c254a:     	testq	%rdx, %rdx
1400c254d:     	jns	0x1400c3246 <.text+0xc2246>
1400c2553:     	xorl	%r13d, %r13d
1400c2556:     	movb	$0x1, 0x7a7(%rbp)
1400c255d:     	movb	$0x1, 0x7a6(%rbp)
1400c2564:     	movq	%r13, %rcx
1400c2567:     	movq	%r15, %rdx
1400c256a:     	callq	0x1458e721b <.text+0x58e621b>
1400c256f:     	nop
1400c2570:     	jmp	0x1400c4971 <.text+0xc3971>
1400c2575:     	cmpl	$0x676e6972, (%rax)     # imm = 0x676E6972
1400c257b:     	je	0x1400c2eb3 <.text+0xc1eb3>
1400c2581:     	cmpl	$0x646c6f67, (%rax)     # imm = 0x646C6F67
1400c2587:     	jne	0x1400c2605 <.text+0xc1605>
1400c2589:     	movb	$0x1, 0x7a7(%rbp)
1400c2590:     	movb	$0x1, 0x7a6(%rbp)
1400c2597:     	leaq	0x583baf3(%rip), %rcx   # 0x1458fe091
1400c259e:     	movl	$0x4, %edx
1400c25a3:     	callq	0x145452350 <.text+0x5451350>
1400c25a8:     	nop
1400c25a9:     	movq	%rdx, %r15
1400c25ac:     	testq	%rdx, %rdx
1400c25af:     	jns	0x1400c332e <.text+0xc232e>
1400c25b5:     	xorl	%r13d, %r13d
1400c25b8:     	movb	$0x1, 0x7a7(%rbp)
1400c25bf:     	movb	$0x1, 0x7a6(%rbp)
1400c25c6:     	movq	%r13, %rcx
1400c25c9:     	movq	%r15, %rdx
1400c25cc:     	callq	0x1458e721b <.text+0x58e621b>
1400c25d1:     	nop
1400c25d2:     	jmp	0x1400c4971 <.text+0xc3971>
1400c25d7:     	movl	$0x72677075, %ecx       # imm = 0x72677075
1400c25dc:     	xorl	(%rax), %ecx
1400c25de:     	movl	$0x65646172, %edx       # imm = 0x65646172
1400c25e3:     	xorl	0x3(%rax), %edx
1400c25e6:     	orl	%ecx, %edx
1400c25e8:     	je	0x1400c2f4e <.text+0xc1f4e>
1400c25ee:     	movl	$0x6e697274, %ecx       # imm = 0x6E697274
1400c25f3:     	xorl	(%rax), %ecx
1400c25f5:     	movl	$0x74656b6e, %edx       # imm = 0x74656B6E
1400c25fa:     	xorl	0x3(%rax), %edx
1400c25fd:     	orl	%ecx, %edx
1400c25ff:     	je	0x1400c2eb3 <.text+0xc1eb3>
1400c2605:     	movq	0x4d8(%rbp), %rdx
1400c260c:     	testq	%rdx, %rdx
1400c260f:     	je	0x1400c2623 <.text+0xc1623>
1400c2611:     	movq	0x4e0(%rbp), %rcx
1400c2618:     	movl	$0x1, %r8d
1400c261e:     	callq	0x1400021d0 <.text+0x11d0>
1400c2623:     	movq	0x778(%rbp), %rax
1400c262a:     	movq	%rax, 0x4d8(%rbp)
1400c2631:     	movq	0x758(%rbp), %rcx
1400c2638:     	movq	%rcx, 0x4e0(%rbp)
1400c263f:     	movq	%rax, 0x4e8(%rbp)
1400c2646:     	leaq	-0x30(%rbp), %rcx
1400c264a:     	leaq	0x490(%rbp), %rdx
1400c2651:     	movl	$0x108, %r8d            # imm = 0x108
1400c2657:     	callq	0x145756ddd <.text+0x5755ddd>
1400c265c:     	movq	0x790(%rbp), %rdx
1400c2663:     	testq	%rdx, %rdx
1400c2666:     	setne	%al
1400c2669:     	testb	%al, 0x768(%rbp)
1400c266f:     	je	0x1400c2683 <.text+0xc1683>
1400c2671:     	movl	$0x1, %r8d
1400c2677:     	movq	0x750(%rbp), %rcx
1400c267e:     	callq	0x1400021d0 <.text+0x11d0>
1400c2683:     	movq	0x728(%rbp), %r15
1400c268a:     	movq	0x730(%rbp), %rsi
1400c2691:     	testq	%rsi, %rsi
1400c2694:     	je	0x1400c26c4 <.text+0xc16c4>
1400c2696:     	leaq	0x8(%r15), %r12
1400c269a:     	jmp	0x1400c26a9 <.text+0xc16a9>
1400c269c:     	nopl	(%rax)
1400c26a0:     	addq	$0x18, %r12
1400c26a4:     	decq	%rsi
1400c26a7:     	je	0x1400c26c4 <.text+0xc16c4>
1400c26a9:     	movq	-0x8(%r12), %rdx
1400c26ae:     	testq	%rdx, %rdx
1400c26b1:     	je	0x1400c26a0 <.text+0xc16a0>
1400c26b3:     	movq	(%r12), %rcx
1400c26b7:     	movl	$0x1, %r8d
1400c26bd:     	callq	0x1400021d0 <.text+0x11d0>
1400c26c2:     	jmp	0x1400c26a0 <.text+0xc16a0>
1400c26c4:     	movq	0x720(%rbp), %rax
1400c26cb:     	testq	%rax, %rax
1400c26ce:     	je	0x1400c26e6 <.text+0xc16e6>
1400c26d0:     	shlq	$0x3, %rax
1400c26d4:     	leaq	(%rax,%rax,2), %rdx
1400c26d8:     	movl	$0x8, %r8d
1400c26de:     	movq	%r15, %rcx
1400c26e1:     	callq	0x1400021d0 <.text+0x11d0>
1400c26e6:     	movq	0x870(%rbp), %r15
1400c26ed:     	testq	%r15, %r15
1400c26f0:     	js	0x1400c26f9 <.text+0xc16f9>
1400c26f2:     	cvtsi2ss	%r15, %xmm8
1400c26f7:     	jmp	0x1400c2712 <.text+0xc1712>
1400c26f9:     	movq	%r15, %rax
1400c26fc:     	shrq	%rax
1400c26ff:     	movl	%r15d, %ecx
1400c2702:     	andl	$0x1, %ecx
1400c2705:     	orq	%rax, %rcx
1400c2708:     	cvtsi2ss	%rcx, %xmm8
1400c270d:     	addss	%xmm8, %xmm8
1400c2712:     	movups	0x45c(%rbp), %xmm0
1400c2719:     	movaps	%xmm0, 0x470(%rbp)
1400c2720:     	movl	0x46c(%rbp), %eax
1400c2726:     	movl	%eax, 0x480(%rbp)
1400c272c:     	movw	$0x0, 0x254(%rbp)
1400c2735:     	movb	$0x1, 0x244(%rbp)
1400c273c:     	xorps	%xmm0, %xmm0
1400c273f:     	movups	%xmm0, 0x158(%rbp)
1400c2746:     	movups	%xmm0, 0x168(%rbp)
1400c274d:     	movabsq	$0x437c000000000001, %rax # imm = 0x437C000000000001
1400c2757:     	movq	%rax, 0x178(%rbp)
1400c275e:     	movaps	%xmm0, 0x180(%rbp)
1400c2765:     	movabsq	$0x43c2000000000001, %rax # imm = 0x43C2000000000001
1400c276f:     	movq	%rax, 0x190(%rbp)
1400c2776:     	movq	$0x0, 0x150(%rbp)
1400c2781:     	movups	%xmm0, 0x198(%rbp)
1400c2788:     	movl	$0x5, 0x26a(%rbp)
1400c2792:     	movups	0x583b3cf(%rip), %xmm0  # 0x1458fdb68
1400c2799:     	movups	%xmm0, 0x1a8(%rbp)
1400c27a0:     	movups	0x583b3d1(%rip), %xmm0  # 0x1458fdb78
1400c27a7:     	movups	%xmm0, 0x1b8(%rbp)
1400c27ae:     	movups	0x583b3d3(%rip), %xmm0  # 0x1458fdb88
1400c27b5:     	movups	%xmm0, 0x1c8(%rbp)
1400c27bc:     	movups	0x583b3d5(%rip), %xmm0  # 0x1458fdb98
1400c27c3:     	movups	%xmm0, 0x1d8(%rbp)
1400c27ca:     	movaps	0x583a21f(%rip), %xmm0  # 0x1458fc9f0
1400c27d1:     	movups	%xmm0, 0x1e8(%rbp)
1400c27d8:     	movups	%xmm0, 0x1f8(%rbp)
1400c27df:     	movaps	0x5828aea(%rip), %xmm0  # 0x1458eb2d0
1400c27e6:     	movups	%xmm0, 0x208(%rbp)
1400c27ed:     	movups	%xmm0, 0x218(%rbp)
1400c27f4:     	movsd	0x5836574(%rip), %xmm0  # 0x1458f8d70
1400c27fc:     	movsd	%xmm0, 0x248(%rbp)
1400c2804:     	movl	$0x3f800000, 0x250(%rbp) # imm = 0x3F800000
1400c280e:     	movaps	0x5828c9b(%rip), %xmm0  # 0x1458eb4b0
1400c2815:     	movups	%xmm0, 0x228(%rbp)
1400c281c:     	movl	$0x1, 0x238(%rbp)
1400c2826:     	movq	$0x0, 0x23c(%rbp)
1400c2831:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
1400c283b:     	movq	%rax, 0x262(%rbp)
1400c2842:     	movups	0x583b267(%rip), %xmm0  # 0x1458fdab0
1400c2849:     	movaps	%xmm0, 0xf0(%rbp)
1400c2850:     	movq	$0x0, 0x100(%rbp)
1400c285b:     	movups	0x583b266(%rip), %xmm0  # 0x1458fdac8
1400c2862:     	movups	%xmm0, 0x108(%rbp)
1400c2869:     	movq	$0x0, 0x118(%rbp)
1400c2874:     	movups	0x583b265(%rip), %xmm0  # 0x1458fdae0
1400c287b:     	movaps	%xmm0, 0x120(%rbp)
1400c2882:     	movq	$0x0, 0x130(%rbp)
1400c288d:     	movups	0x583b264(%rip), %xmm0  # 0x1458fdaf8
1400c2894:     	movups	%xmm0, 0x138(%rbp)
1400c289b:     	movq	$0x0, 0x148(%rbp)
1400c28a6:     	movw	$0x0, 0x25a(%rbp)
1400c28af:     	movl	$0x10000, 0x256(%rbp)   # imm = 0x10000
1400c28b9:     	movw	$0x0, 0x260(%rbp)
1400c28c2:     	movl	$0x10000, 0x25c(%rbp)   # imm = 0x10000
1400c28cc:     	callq	0x140002200 <.text+0x1200>
1400c28d1:     	movl	$0x60, %ecx
1400c28d6:     	movl	$0x4, %edx
1400c28db:     	callq	0x1400021c0 <.text+0x11c0>
1400c28e0:     	movq	%rax, 0x778(%rbp)
1400c28e7:     	testq	%rax, %rax
1400c28ea:     	je	0x1400c4849 <.text+0xc3849>
1400c28f0:     	leaq	0x490(%rbp), %rcx
1400c28f7:     	leaq	0x274(%rbp), %rdx
1400c28fe:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c2903:     	nop
1400c2904:     	movaps	0x490(%rbp), %xmm9
1400c290c:     	movaps	0x583a0ed(%rip), %xmm0  # 0x1458fca00
1400c2913:     	movups	%xmm0, 0x494(%rbp)
1400c291a:     	movl	$0x0, 0x490(%rbp)
1400c2924:     	leaq	0x290(%rbp), %rcx
1400c292b:     	leaq	0x490(%rbp), %rdx
1400c2932:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c2937:     	nop
1400c2938:     	movaps	0x290(%rbp), %xmm10
1400c2940:     	movaps	0x5836599(%rip), %xmm0  # 0x1458f8ee0
1400c2947:     	movups	%xmm0, 0x494(%rbp)
1400c294e:     	movl	$0x0, 0x490(%rbp)
1400c2958:     	leaq	0x290(%rbp), %rcx
1400c295f:     	leaq	0x490(%rbp), %rdx
1400c2966:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c296b:     	nop
1400c296c:     	movaps	0x290(%rbp), %xmm0
1400c2973:     	movq	0x778(%rbp), %rsi
1400c297a:     	movq	$0x2, (%rsi)
1400c2981:     	movl	$0x1, 0x8(%rsi)
1400c2988:     	movups	%xmm9, 0xc(%rsi)
1400c298d:     	movaps	0x583a07c(%rip), %xmm1  # 0x1458fca10
1400c2994:     	movups	%xmm1, 0x1c(%rsi)
1400c2998:     	movups	%xmm10, 0x2c(%rsi)
1400c299d:     	movaps	0x583a07c(%rip), %xmm1  # 0x1458fca20
1400c29a4:     	movups	%xmm1, 0x3c(%rsi)
1400c29a8:     	movups	%xmm0, 0x4c(%rsi)
1400c29ac:     	movl	$0x3f000000, 0x5c(%rsi) # imm = 0x3F000000
1400c29b3:     	callq	0x140002200 <.text+0x1200>
1400c29b8:     	movl	$0x48, %ecx
1400c29bd:     	movl	$0x8, %edx
1400c29c2:     	callq	0x1400021c0 <.text+0x11c0>
1400c29c7:     	testq	%rax, %rax
1400c29ca:     	je	0x1400c485e <.text+0xc385e>
1400c29d0:     	movq	$0x3, 0x8(%rax)
1400c29d8:     	movq	%rsi, 0x10(%rax)
1400c29dc:     	movq	$0x3, 0x18(%rax)
1400c29e4:     	movl	$0x403e2e93, 0x20(%rax) # imm = 0x403E2E93
1400c29eb:     	movb	$0x0, 0x24(%rax)
1400c29ef:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
1400c29f9:     	movq	%rcx, (%rax)
1400c29fc:     	movq	$0x1, 0x440(%rbp)
1400c2a07:     	movq	%rax, 0x448(%rbp)
1400c2a0e:     	movq	$0x1, 0x450(%rbp)
1400c2a19:     	movaps	0x583a010(%rip), %xmm0  # 0x1458fca30
1400c2a20:     	movups	%xmm0, 0x294(%rbp)
1400c2a27:     	movl	$0x0, 0x290(%rbp)
1400c2a31:     	leaq	0x700(%rbp), %rcx
1400c2a38:     	leaq	0x290(%rbp), %rdx
1400c2a3f:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400c2a44:     	nop
1400c2a45:     	movaps	0x700(%rbp), %xmm0
1400c2a4c:     	movups	%xmm0, 0x494(%rbp)
1400c2a53:     	movl	$0x1, 0x490(%rbp)
1400c2a5d:     	movl	$0x42200000, 0x48(%rsp) # imm = 0x42200000
1400c2a65:     	movl	$0x1, 0x40(%rsp)
1400c2a6d:     	movl	$0x0, 0x38(%rsp)
1400c2a75:     	movl	$0x1, 0x30(%rsp)
1400c2a7d:     	movl	$0x41900000, 0x28(%rsp) # imm = 0x41900000
1400c2a85:     	movl	$0x1, 0x20(%rsp)
1400c2a8d:     	leaq	0x700(%rbp), %rcx
1400c2a94:     	leaq	0x490(%rbp), %rdx
1400c2a9b:     	xorps	%xmm3, %xmm3
1400c2a9e:     	movl	$0x1, %r8d
1400c2aa4:     	callq	0x14264cf40 <.text+0x264bf40>
1400c2aa9:     	nop
1400c2aaa:     	mulss	0x5839f31(%rip), %xmm8  # 0x1458fc9e4
1400c2ab3:     	addss	0x5833b74(%rip), %xmm8  # 0x1458f6630
1400c2abc:     	movl	0x480(%rbp), %eax
1400c2ac2:     	movl	%eax, 0x6b0(%rbp)
1400c2ac8:     	movaps	0x470(%rbp), %xmm0
1400c2acf:     	movups	%xmm0, 0x6a0(%rbp)
1400c2ad6:     	leaq	0x290(%rbp), %rsi
1400c2add:     	leaq	0xf0(%rbp), %rdx
1400c2ae4:     	movl	$0x180, %r8d            # imm = 0x180
1400c2aea:     	movq	%rsi, %rcx
1400c2aed:     	callq	0x145756ddd <.text+0x5755ddd>
1400c2af2:     	movups	0x440(%rbp), %xmm0
1400c2af9:     	movups	%xmm0, 0x410(%rbp)
1400c2b00:     	movq	0x450(%rbp), %rax
1400c2b07:     	movq	%rax, 0x420(%rbp)
1400c2b0e:     	movups	0x700(%rbp), %xmm0
1400c2b15:     	movups	%xmm0, 0x428(%rbp)
1400c2b1c:     	movq	0x710(%rbp), %rax
1400c2b23:     	movq	%rax, 0x438(%rbp)
1400c2b2a:     	movups	0x583b517(%rip), %xmm0  # 0x1458fe048
1400c2b31:     	movups	%xmm0, 0xe0(%rbp)
1400c2b38:     	movq	(%r14), %r12
1400c2b3b:     	addq	$0x8, %r14
1400c2b3f:     	leaq	0x498(%rbp), %rcx
1400c2b46:     	movl	$0x1b0, %r8d            # imm = 0x1B0
1400c2b4c:     	movq	%rsi, %rdx
1400c2b4f:     	callq	0x145756ddd <.text+0x5755ddd>
1400c2b54:     	movl	$0x0, 0x648(%rbp)
1400c2b5e:     	movlps	%xmm6, 0x64c(%rbp)
1400c2b65:     	movss	%xmm7, 0x654(%rbp)
1400c2b6d:     	movq	$0x3f800000, 0x658(%rbp) # imm = 0x3F800000
1400c2b78:     	movlps	%xmm6, 0x660(%rbp)
1400c2b7f:     	movss	%xmm7, 0x668(%rbp)
1400c2b87:     	movq	$0x3f800000, 0x66c(%rbp) # imm = 0x3F800000
1400c2b92:     	movlps	%xmm6, 0x674(%rbp)
1400c2b99:     	movss	%xmm7, 0x67c(%rbp)
1400c2ba1:     	movq	$0x3f800000, 0x680(%rbp) # imm = 0x3F800000
1400c2bac:     	movlps	%xmm6, 0x688(%rbp)
1400c2bb3:     	movss	%xmm7, 0x690(%rbp)
1400c2bbb:     	movl	$0x3f800000, 0x694(%rbp) # imm = 0x3F800000
1400c2bc5:     	movq	%r15, 0x698(%rbp)
1400c2bcc:     	movl	$0x0, 0x6b4(%rbp)
1400c2bd6:     	movlps	%xmm6, 0x6b8(%rbp)
1400c2bdd:     	movss	%xmm7, 0x6c0(%rbp)
1400c2be5:     	movl	$0x3f800000, 0x6c4(%rbp) # imm = 0x3F800000
1400c2bef:     	movss	%xmm8, 0x6c8(%rbp)
1400c2bf8:     	movl	$0x0, 0x6cc(%rbp)
1400c2c02:     	movb	$0x2, 0x6d0(%rbp)
1400c2c09:     	movl	0xec(%rbp), %eax
1400c2c0f:     	movl	%eax, 0x6e0(%rbp)
1400c2c15:     	movups	0xdd(%rbp), %xmm0
1400c2c1c:     	movups	%xmm0, 0x6d1(%rbp)
1400c2c23:     	movaps	0x5839e16(%rip), %xmm0  # 0x1458fca40
1400c2c2a:     	movups	%xmm0, 0x6e4(%rbp)
1400c2c31:     	movq	%r12, 0x490(%rbp)
1400c2c38:     	leaq	0x583a7d1(%rip), %r9    # 0x1458fd410
1400c2c3f:     	leaq	0xf0(%rbp), %rcx
1400c2c46:     	leaq	0x490(%rbp), %r15
1400c2c4d:     	movq	%r14, %rdx
1400c2c50:     	movq	%r15, %r8
1400c2c53:     	callq	0x1401ebe00 <.text+0x1eae00>
1400c2c58:     	nop
1400c2c59:     	testb	%bl, %bl
1400c2c5b:     	je	0x1400c2dbe <.text+0xc1dbe>
1400c2c61:     	movl	$0x0, 0x490(%rbp)
1400c2c6b:     	movaps	0x5839dde(%rip), %xmm0  # 0x1458fca50
1400c2c72:     	movups	%xmm0, 0x494(%rbp)
1400c2c79:     	movl	$0x0, 0x4a4(%rbp)
1400c2c83:     	movaps	0x5839dd6(%rip), %xmm1  # 0x1458fca60
1400c2c8a:     	movups	%xmm1, 0x4a8(%rbp)
1400c2c91:     	movl	$0x0, 0x4b8(%rbp)
1400c2c9b:     	movaps	0x5839dce(%rip), %xmm1  # 0x1458fca70
1400c2ca2:     	movups	%xmm1, 0x4bc(%rbp)
1400c2ca9:     	movl	$0x0, 0x4cc(%rbp)
1400c2cb3:     	movaps	0x5839dc6(%rip), %xmm1  # 0x1458fca80
1400c2cba:     	movups	%xmm1, 0x4d0(%rbp)
1400c2cc1:     	movl	$0x0, 0x4e0(%rbp)
1400c2ccb:     	movups	%xmm0, 0x4e4(%rbp)
1400c2cd2:     	leaq	0x4f4(%rbp), %rax
1400c2cd9:     	movq	%r15, 0x700(%rbp)
1400c2ce0:     	movq	%rax, 0x708(%rbp)
1400c2ce7:     	movq	$0x0, 0x710(%rbp)
1400c2cf2:     	leaq	0x290(%rbp), %rcx
1400c2cf9:     	leaq	0x700(%rbp), %rdx
1400c2d00:     	callq	0x14010a9f0 <.text+0x1099f0>
1400c2d05:     	nop
1400c2d06:     	movb	$0x0, 0x2c4(%rbp)
1400c2d0d:     	movups	0x583b2e0(%rip), %xmm0  # 0x1458fdff4
1400c2d14:     	movups	%xmm0, 0x2a8(%rbp)
1400c2d1b:     	movq	$0x0, 0x2b8(%rbp)
1400c2d26:     	movl	$0x0, 0x2c0(%rbp)
1400c2d30:     	callq	0x140002200 <.text+0x1200>
1400c2d35:     	movl	$0x48, %ecx
1400c2d3a:     	movl	$0x8, %edx
1400c2d3f:     	callq	0x1400021c0 <.text+0x11c0>
1400c2d44:     	testq	%rax, %rax
1400c2d47:     	je	0x1400c4873 <.text+0xc3873>
1400c2d4d:     	movq	0x2c0(%rbp), %rcx
1400c2d54:     	movq	%rcx, 0x38(%rax)
1400c2d58:     	movups	0x290(%rbp), %xmm0
1400c2d5f:     	movups	0x2a0(%rbp), %xmm1
1400c2d66:     	movups	0x2b0(%rbp), %xmm2
1400c2d6d:     	movups	%xmm2, 0x28(%rax)
1400c2d71:     	movups	%xmm1, 0x18(%rax)
1400c2d75:     	movups	%xmm0, 0x8(%rax)
1400c2d79:     	movabsq	$-0x7ffffffffffffffe, %rcx # imm = 0x8000000000000002
1400c2d83:     	movq	%rcx, (%rax)
1400c2d86:     	movq	$0x1, 0x490(%rbp)
1400c2d91:     	movq	%rax, 0x498(%rbp)
1400c2d98:     	movq	$0x1, 0x4a0(%rbp)
1400c2da3:     	movb	$0x0, 0x4a8(%rbp)
1400c2daa:     	leaq	0xf0(%rbp), %rcx
1400c2db1:     	leaq	0x490(%rbp), %rdx
1400c2db8:     	callq	0x1401fd1f0 <.text+0x1fc1f0>
1400c2dbd:     	nop
1400c2dbe:     	leaq	0xd0(%rbp), %rax
1400c2dc5:     	leaq	-0x18(%rbp), %rcx
1400c2dc9:     	leaq	(%rbp), %rdx
1400c2dcd:     	leaq	0x18(%rbp), %r8
1400c2dd1:     	leaq	0x30(%rbp), %r9
1400c2dd5:     	leaq	0x48(%rbp), %r10
1400c2dd9:     	leaq	0x60(%rbp), %r11
1400c2ddd:     	leaq	0x78(%rbp), %rsi
1400c2de1:     	movq	%r13, 0x490(%rbp)
1400c2de8:     	leaq	0x870(%rbp), %rbx
1400c2def:     	movq	%rbx, 0x498(%rbp)
1400c2df6:     	leaq	-0x30(%rbp), %rbx
1400c2dfa:     	movq	%rbx, 0x4a0(%rbp)
1400c2e01:     	movq	%rax, 0x4a8(%rbp)
1400c2e08:     	movq	%rcx, 0x4b0(%rbp)
1400c2e0f:     	movq	%rdx, 0x4b8(%rbp)
1400c2e16:     	movq	%r8, 0x4c0(%rbp)
1400c2e1d:     	movq	%r9, 0x4c8(%rbp)
1400c2e24:     	movq	%r10, 0x4d0(%rbp)
1400c2e2b:     	movq	%r11, 0x4d8(%rbp)
1400c2e32:     	movq	%rsi, 0x4e0(%rbp)
1400c2e39:     	leaq	0x45c(%rbp), %rax
1400c2e40:     	movq	%rax, 0x4e8(%rbp)
1400c2e47:     	movq	0x748(%rbp), %rax
1400c2e4e:     	movq	%rax, 0x4f0(%rbp)
1400c2e55:     	movq	%rdi, 0x4f8(%rbp)
1400c2e5c:     	leaq	0xf0(%rbp), %rcx
1400c2e63:     	leaq	0x490(%rbp), %rdx
1400c2e6a:     	callq	0x140214080 <.text+0x213080>
1400c2e6f:     	nop
1400c2e70:     	leaq	-0x30(%rbp), %rcx
1400c2e74:     	callq	0x1400b4bd0 <.text+0xb3bd0>
1400c2e79:     	movaps	0x7b0(%rbp), %xmm6
1400c2e80:     	movaps	0x7c0(%rbp), %xmm7
1400c2e87:     	movaps	0x7d0(%rbp), %xmm8
1400c2e8f:     	movaps	0x7e0(%rbp), %xmm9
1400c2e97:     	movaps	0x7f0(%rbp), %xmm10
1400c2e9f:     	addq	$0x888, %rsp            # imm = 0x888
1400c2ea6:     	popq	%rbx
1400c2ea7:     	popq	%rdi
1400c2ea8:     	popq	%rsi
1400c2ea9:     	popq	%r12
1400c2eab:     	popq	%r13
1400c2ead:     	popq	%r14
1400c2eaf:     	popq	%r15
1400c2eb1:     	popq	%rbp
1400c2eb2:     	retq
1400c2eb3:     	movb	$0x1, 0x7a7(%rbp)
1400c2eba:     	movb	$0x1, 0x7a6(%rbp)
1400c2ec1:     	leaq	0x583b1b6(%rip), %rcx   # 0x1458fe07e
1400c2ec8:     	movl	$0x4, %edx
1400c2ecd:     	movq	%rdi, %r8
1400c2ed0:     	callq	0x142aed730 <.text+0x2aec730>
1400c2ed5:     	nop
1400c2ed6:     	testq	%rax, %rax
1400c2ed9:     	jne	0x1400c2ee2 <.text+0xc1ee2>
1400c2edb:     	movq	0x78f98d6(%rip), %rax   # 0x1479bc7b8
1400c2ee2:     	cmpb	$0x3, (%rax)
1400c2ee5:     	jne	0x1400c2efe <.text+0xc1efe>
1400c2ee7:     	cmpq	$0x4, 0x18(%rax)
1400c2eec:     	jne	0x1400c2efe <.text+0xc1efe>
1400c2eee:     	movq	0x10(%rax), %rax
1400c2ef2:     	cmpl	$0x676e6972, (%rax)     # imm = 0x676E6972
1400c2ef8:     	je	0x1400c3924 <.text+0xc2924>
1400c2efe:     	movb	$0x1, 0x7a7(%rbp)
1400c2f05:     	movb	$0x1, 0x7a6(%rbp)
1400c2f0c:     	leaq	0x583b248(%rip), %rcx   # 0x1458fe15b
1400c2f13:     	movl	$0x7, %edx
1400c2f18:     	callq	0x145452350 <.text+0x5451350>
1400c2f1d:     	nop
1400c2f1e:     	movq	%rdx, %r15
1400c2f21:     	xorl	%ecx, %ecx
1400c2f23:     	testq	%r15, %r15
1400c2f26:     	jns	0x1400c3952 <.text+0xc2952>
1400c2f2c:     	xorl	%r13d, %r13d
1400c2f2f:     	movb	$0x1, 0x7a7(%rbp)
1400c2f36:     	movb	$0x1, 0x7a6(%rbp)
1400c2f3d:     	movq	%r13, %rcx
1400c2f40:     	movq	%r15, %rdx
1400c2f43:     	callq	0x1458e721b <.text+0x58e621b>
1400c2f48:     	nop
1400c2f49:     	jmp	0x1400c4971 <.text+0xc3971>
1400c2f4e:     	movb	$0x1, 0x7a7(%rbp)
1400c2f55:     	movb	$0x1, 0x7a6(%rbp)
1400c2f5c:     	leaq	0x583b14d(%rip), %rcx   # 0x1458fe0b0
1400c2f63:     	movl	$0x4, %edx
1400c2f68:     	movq	%rdi, %r8
1400c2f6b:     	callq	0x142aed730 <.text+0x2aec730>
1400c2f70:     	nop
1400c2f71:     	testq	%rax, %rax
1400c2f74:     	jne	0x1400c2f7d <.text+0xc1f7d>
1400c2f76:     	movq	0x78f983b(%rip), %rax   # 0x1479bc7b8
1400c2f7d:     	cmpb	$0x2, (%rax)
1400c2f80:     	jne	0x1400c2f8d <.text+0xc1f8d>
1400c2f82:     	cmpq	$0x0, 0x8(%rax)
1400c2f87:     	je	0x1400c3380 <.text+0xc2380>
1400c2f8d:     	xorl	%eax, %eax
1400c2f8f:     	movq	%rax, 0x470(%rbp)
1400c2f96:     	movb	$0x1, 0x7a7(%rbp)
1400c2f9d:     	movb	$0x1, 0x7a6(%rbp)
1400c2fa4:     	leaq	0x583b194(%rip), %rcx   # 0x1458fe13f
1400c2fab:     	movl	$0x8, %edx
1400c2fb0:     	callq	0x145452350 <.text+0x5451350>
1400c2fb5:     	nop
1400c2fb6:     	movq	%rdx, %r8
1400c2fb9:     	leaq	0x583b008(%rip), %rsi   # 0x1458fdfc8
1400c2fc0:     	movq	%rsi, 0x290(%rbp)
1400c2fc7:     	movq	$0x1, 0x298(%rbp)
1400c2fd2:     	leaq	0x470(%rbp), %r15
1400c2fd9:     	movq	%r15, 0x2a0(%rbp)
1400c2fe0:     	leaq	0x583afc1(%rip), %r12   # 0x1458fdfa8
1400c2fe7:     	movq	%r12, 0x2a8(%rbp)
1400c2fee:     	movb	$0x1, 0x7a7(%rbp)
1400c2ff5:     	movb	$0x1, 0x7a6(%rbp)
1400c2ffc:     	movq	$0x1, 0x20(%rsp)
1400c3005:     	leaq	0xf0(%rbp), %rcx
1400c300c:     	leaq	0x290(%rbp), %r9
1400c3013:     	movq	%rax, %rdx
1400c3016:     	callq	0x145452790 <.text+0x5451790>
1400c301b:     	nop
1400c301c:     	movq	0x490(%rbp), %rdx
1400c3023:     	testq	%rdx, %rdx
1400c3026:     	je	0x1400c303a <.text+0xc203a>
1400c3028:     	movq	0x498(%rbp), %rcx
1400c302f:     	movl	$0x1, %r8d
1400c3035:     	callq	0x1400021d0 <.text+0x11d0>
1400c303a:     	movq	0x100(%rbp), %rax
1400c3041:     	movq	%rax, 0x4a0(%rbp)
1400c3048:     	movups	0xf0(%rbp), %xmm0
1400c304f:     	movaps	%xmm0, 0x490(%rbp)
1400c3056:     	movb	$0x1, 0x7a7(%rbp)
1400c305d:     	movb	$0x1, 0x7a6(%rbp)
1400c3064:     	leaq	0x583af35(%rip), %rcx   # 0x1458fdfa0
1400c306b:     	movl	$0x8, %edx
1400c3070:     	callq	0x145452350 <.text+0x5451350>
1400c3075:     	nop
1400c3076:     	movq	%rdx, %r8
1400c3079:     	movq	0x470(%rbp), %rcx
1400c3080:     	cmpq	$0x1, %rcx
1400c3084:     	adcq	$-0x1, %rcx
1400c3088:     	movq	%rcx, 0x440(%rbp)
1400c308f:     	movq	%rsi, 0xf0(%rbp)
1400c3096:     	movq	$0x1, 0xf8(%rbp)
1400c30a1:     	leaq	0x440(%rbp), %rcx
1400c30a8:     	movq	%rcx, 0x100(%rbp)
1400c30af:     	movq	%r12, 0x108(%rbp)
1400c30b6:     	movb	$0x1, 0x7a7(%rbp)
1400c30bd:     	movb	$0x1, 0x7a6(%rbp)
1400c30c4:     	movq	$0x1, 0x20(%rsp)
1400c30cd:     	leaq	-0x30(%rbp), %rsi
1400c30d1:     	leaq	0xf0(%rbp), %r9
1400c30d8:     	movq	%rsi, %rcx
1400c30db:     	movq	%rax, %rdx
1400c30de:     	callq	0x145452790 <.text+0x5451790>
1400c30e3:     	nop
1400c30e4:     	movq	%rsi, 0x290(%rbp)
1400c30eb:     	leaq	-0xc1012(%rip), %rax    # 0x1400020e0 <.text+0x10e0>
1400c30f2:     	movq	%rax, 0x298(%rbp)
1400c30f9:     	movq	%r15, 0x2a0(%rbp)
1400c3100:     	leaq	0x565be29(%rip), %rax   # 0x14571ef30 <.text+0x571df30>
1400c3107:     	movq	%rax, 0x2a8(%rbp)
1400c310e:     	leaq	0x583b0e4(%rip), %rdx   # 0x1458fe1f9
1400c3115:     	leaq	0x700(%rbp), %rcx
1400c311c:     	leaq	0x290(%rbp), %r8
1400c3123:     	callq	0x14570bf80 <.text+0x570af80>
1400c3128:     	nop
1400c3129:     	movq	-0x30(%rbp), %rdx
1400c312d:     	testq	%rdx, %rdx
1400c3130:     	je	0x1400c3141 <.text+0xc2141>
1400c3132:     	movq	-0x28(%rbp), %rcx
1400c3136:     	movl	$0x1, %r8d
1400c313c:     	callq	0x1400021d0 <.text+0x11d0>
1400c3141:     	leaq	0x4c0(%rbp), %rsi
1400c3148:     	movq	0x4c0(%rbp), %rdx
1400c314f:     	testq	%rdx, %rdx
1400c3152:     	je	0x1400c3166 <.text+0xc2166>
1400c3154:     	movq	0x4c8(%rbp), %rcx
1400c315b:     	movl	$0x1, %r8d
1400c3161:     	callq	0x1400021d0 <.text+0x11d0>
1400c3166:     	movq	0x710(%rbp), %rax
1400c316d:     	movq	%rax, 0x10(%rsi)
1400c3171:     	movups	0x700(%rbp), %xmm0
1400c3178:     	movups	%xmm0, (%rsi)
1400c317b:     	movq	0x500(%rbp), %rsi
1400c3182:     	testq	%rsi, %rsi
1400c3185:     	je	0x1400c31b6 <.text+0xc21b6>
1400c3187:     	movq	0x4f8(%rbp), %r15
1400c318e:     	addq	$0x8, %r15
1400c3192:     	jmp	0x1400c319d <.text+0xc219d>
1400c3194:     	addq	$0x18, %r15
1400c3198:     	decq	%rsi
1400c319b:     	je	0x1400c31b6 <.text+0xc21b6>
1400c319d:     	movq	-0x8(%r15), %rdx
1400c31a1:     	testq	%rdx, %rdx
1400c31a4:     	je	0x1400c3194 <.text+0xc2194>
1400c31a6:     	movq	(%r15), %rcx
1400c31a9:     	movl	$0x1, %r8d
1400c31af:     	callq	0x1400021d0 <.text+0x11d0>
1400c31b4:     	jmp	0x1400c3194 <.text+0xc2194>
1400c31b6:     	movq	0x4f0(%rbp), %rax
1400c31bd:     	testq	%rax, %rax
1400c31c0:     	je	0x1400c31dc <.text+0xc21dc>
1400c31c2:     	movq	0x4f8(%rbp), %rcx
1400c31c9:     	shlq	$0x3, %rax
1400c31cd:     	leaq	(%rax,%rax,2), %rdx
1400c31d1:     	movl	$0x8, %r8d
1400c31d7:     	callq	0x1400021d0 <.text+0x11d0>
1400c31dc:     	movq	0x730(%rbp), %rax
1400c31e3:     	leaq	0x4f0(%rbp), %rcx
1400c31ea:     	movq	%rax, 0x10(%rcx)
1400c31ee:     	movups	0x720(%rbp), %xmm0
1400c31f5:     	movups	%xmm0, (%rcx)
1400c31f8:     	movb	$0x0, 0x7a7(%rbp)
1400c31ff:     	movb	$0x1, 0x7a6(%rbp)
1400c3206:     	leaq	0x583aff6(%rip), %rcx   # 0x1458fe203
1400c320d:     	movl	$0x19, %edx
1400c3212:     	callq	0x145452350 <.text+0x5451350>
1400c3217:     	nop
1400c3218:     	movq	%rdx, %r15
1400c321b:     	testq	%rdx, %rdx
1400c321e:     	jns	0x1400c32dc <.text+0xc22dc>
1400c3224:     	xorl	%r13d, %r13d
1400c3227:     	movb	$0x0, 0x7a7(%rbp)
1400c322e:     	movb	$0x1, 0x7a6(%rbp)
1400c3235:     	movq	%r13, %rcx
1400c3238:     	movq	%r15, %rdx
1400c323b:     	callq	0x1458e721b <.text+0x58e621b>
1400c3240:     	nop
1400c3241:     	jmp	0x1400c4971 <.text+0xc3971>
1400c3246:     	testq	%r15, %r15
1400c3249:     	je	0x1400c3389 <.text+0xc2389>
1400c324f:     	movq	%rax, 0x798(%rbp)
1400c3256:     	callq	0x140002200 <.text+0x1200>
1400c325b:     	movl	$0x1, %r13d
1400c3261:     	movl	$0x1, %edx
1400c3266:     	movq	%r15, %rcx
1400c3269:     	callq	0x1400021c0 <.text+0x11c0>
1400c326e:     	testq	%rax, %rax
1400c3271:     	je	0x1400c2556 <.text+0xc1556>
1400c3277:     	movq	%rax, %rsi
1400c327a:     	movq	%rax, %rcx
1400c327d:     	movq	0x798(%rbp), %rdx
1400c3284:     	movq	%r15, %r8
1400c3287:     	callq	0x145756ddd <.text+0x5755ddd>
1400c328c:     	jmp	0x1400c338e <.text+0xc238e>
1400c3291:     	testq	%r12, %r12
1400c3294:     	je	0x1400c3816 <.text+0xc2816>
1400c329a:     	movq	%rax, 0x798(%rbp)
1400c32a1:     	callq	0x140002200 <.text+0x1200>
1400c32a6:     	movl	$0x1, %r13d
1400c32ac:     	movl	$0x1, %edx
1400c32b1:     	movq	%r12, %rcx
1400c32b4:     	callq	0x1400021c0 <.text+0x11c0>
1400c32b9:     	testq	%rax, %rax
1400c32bc:     	je	0x1400c24f0 <.text+0xc14f0>
1400c32c2:     	movq	%rax, %rsi
1400c32c5:     	movq	%rax, %rcx
1400c32c8:     	movq	0x798(%rbp), %rdx
1400c32cf:     	movq	%r12, %r8
1400c32d2:     	callq	0x145756ddd <.text+0x5755ddd>
1400c32d7:     	jmp	0x1400c381b <.text+0xc281b>
1400c32dc:     	testq	%r15, %r15
1400c32df:     	je	0x1400c38e6 <.text+0xc28e6>
1400c32e5:     	movq	%rax, 0x798(%rbp)
1400c32ec:     	callq	0x140002200 <.text+0x1200>
1400c32f1:     	movl	$0x1, %r13d
1400c32f7:     	movl	$0x1, %edx
1400c32fc:     	movq	%r15, %rcx
1400c32ff:     	callq	0x1400021c0 <.text+0x11c0>
1400c3304:     	testq	%rax, %rax
1400c3307:     	je	0x1400c3227 <.text+0xc2227>
1400c330d:     	movq	%rax, %r12
1400c3310:     	movq	%rax, %rcx
1400c3313:     	movq	0x798(%rbp), %rdx
1400c331a:     	movq	%r15, %r8
1400c331d:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3322:     	movq	0x780(%rbp), %r13
1400c3329:     	jmp	0x1400c38ec <.text+0xc28ec>
1400c332e:     	testq	%r15, %r15
1400c3331:     	je	0x1400c3fe8 <.text+0xc2fe8>
1400c3337:     	movq	%rax, 0x798(%rbp)
1400c333e:     	callq	0x140002200 <.text+0x1200>
1400c3343:     	movl	$0x1, %r13d
1400c3349:     	movl	$0x1, %edx
1400c334e:     	movq	%r15, %rcx
1400c3351:     	callq	0x1400021c0 <.text+0x11c0>
1400c3356:     	testq	%rax, %rax
1400c3359:     	je	0x1400c25b8 <.text+0xc15b8>
1400c335f:     	movq	%rax, %r12
1400c3362:     	movq	%rax, %rcx
1400c3365:     	movq	0x798(%rbp), %rdx
1400c336c:     	movq	%r15, %r8
1400c336f:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3374:     	movq	0x780(%rbp), %r13
1400c337b:     	jmp	0x1400c3fee <.text+0xc2fee>
1400c3380:     	movq	0x10(%rax), %rax
1400c3384:     	jmp	0x1400c2f8f <.text+0xc1f8f>
1400c3389:     	movl	$0x1, %esi
1400c338e:     	movq	0x4c0(%rbp), %rdx
1400c3395:     	testq	%rdx, %rdx
1400c3398:     	je	0x1400c33ac <.text+0xc23ac>
1400c339a:     	movq	0x4c8(%rbp), %rcx
1400c33a1:     	movl	$0x1, %r8d
1400c33a7:     	callq	0x1400021d0 <.text+0x11d0>
1400c33ac:     	movq	%r15, 0x4c0(%rbp)
1400c33b3:     	movq	%rsi, 0x4c8(%rbp)
1400c33ba:     	movq	%r15, 0x4d0(%rbp)
1400c33c1:     	movq	0x500(%rbp), %rsi
1400c33c8:     	testq	%rsi, %rsi
1400c33cb:     	je	0x1400c33fc <.text+0xc23fc>
1400c33cd:     	movq	0x4f8(%rbp), %r15
1400c33d4:     	addq	$0x8, %r15
1400c33d8:     	jmp	0x1400c33e3 <.text+0xc23e3>
1400c33da:     	addq	$0x18, %r15
1400c33de:     	decq	%rsi
1400c33e1:     	je	0x1400c33fc <.text+0xc23fc>
1400c33e3:     	movq	-0x8(%r15), %rdx
1400c33e7:     	testq	%rdx, %rdx
1400c33ea:     	je	0x1400c33da <.text+0xc23da>
1400c33ec:     	movq	(%r15), %rcx
1400c33ef:     	movl	$0x1, %r8d
1400c33f5:     	callq	0x1400021d0 <.text+0x11d0>
1400c33fa:     	jmp	0x1400c33da <.text+0xc23da>
1400c33fc:     	movq	0x4f0(%rbp), %rax
1400c3403:     	testq	%rax, %rax
1400c3406:     	je	0x1400c3422 <.text+0xc2422>
1400c3408:     	movq	0x4f8(%rbp), %rcx
1400c340f:     	shlq	$0x3, %rax
1400c3413:     	leaq	(%rax,%rax,2), %rdx
1400c3417:     	movl	$0x8, %r8d
1400c341d:     	callq	0x1400021d0 <.text+0x11d0>
1400c3422:     	movq	0x730(%rbp), %rax
1400c3429:     	leaq	0x4f0(%rbp), %rcx
1400c3430:     	movq	%rax, 0x10(%rcx)
1400c3434:     	movups	0x720(%rbp), %xmm0
1400c343b:     	movups	%xmm0, (%rcx)
1400c343e:     	movb	$0x0, 0x7a7(%rbp)
1400c3445:     	movb	$0x1, 0x7a6(%rbp)
1400c344c:     	leaq	0x583ac5d(%rip), %rcx   # 0x1458fe0b0
1400c3453:     	movl	$0x4, %edx
1400c3458:     	movq	%rdi, %r8
1400c345b:     	callq	0x142aed730 <.text+0x2aec730>
1400c3460:     	nop
1400c3461:     	testq	%rax, %rax
1400c3464:     	jne	0x1400c346d <.text+0xc246d>
1400c3466:     	movq	0x78f934b(%rip), %rax   # 0x1479bc7b8
1400c346d:     	cmpb	$0x2, (%rax)
1400c3470:     	jne	0x1400c347d <.text+0xc247d>
1400c3472:     	cmpq	$0x0, 0x8(%rax)
1400c3477:     	je	0x1400c40b1 <.text+0xc30b1>
1400c347d:     	xorl	%r15d, %r15d
1400c3480:     	movb	$0x0, 0x7a7(%rbp)
1400c3487:     	movb	$0x1, 0x7a6(%rbp)
1400c348e:     	leaq	0x583ac1f(%rip), %rcx   # 0x1458fe0b4
1400c3495:     	movl	$0x8, %edx
1400c349a:     	movq	%rdi, %r8
1400c349d:     	callq	0x142aed730 <.text+0x2aec730>
1400c34a2:     	nop
1400c34a3:     	testq	%rax, %rax
1400c34a6:     	jne	0x1400c34af <.text+0xc24af>
1400c34a8:     	movq	0x78f9309(%rip), %rax   # 0x1479bc7b8
1400c34af:     	cmpb	$0x3, (%rax)
1400c34b2:     	jne	0x1400c36d1 <.text+0xc26d1>
1400c34b8:     	testb	%r15b, %r15b
1400c34bb:     	jne	0x1400c36da <.text+0xc26da>
1400c34c1:     	movups	0x10(%rax), %xmm0
1400c34c5:     	movups	%xmm0, -0x30(%rbp)
1400c34c9:     	movb	$0x0, 0x7a7(%rbp)
1400c34d0:     	movb	$0x1, 0x7a6(%rbp)
1400c34d7:     	leaq	0x583abde(%rip), %rcx   # 0x1458fe0bc
1400c34de:     	movl	$0x6, %edx
1400c34e3:     	callq	0x145452350 <.text+0x5451350>
1400c34e8:     	nop
1400c34e9:     	movq	%rdx, %r15
1400c34ec:     	movq	%rax, 0x798(%rbp)
1400c34f3:     	movq	$0x1, 0x20(%rsp)
1400c34fc:     	leaq	0x290(%rbp), %rcx
1400c3503:     	movl	$0x1, %r9d
1400c3509:     	xorl	%r8d, %r8d
1400c350c:     	callq	0x14003bf90 <.text+0x3af90>
1400c3511:     	movq	0x298(%rbp), %rsi
1400c3518:     	cmpl	$0x1, 0x290(%rbp)
1400c351f:     	je	0x1400c48ce <.text+0xc38ce>
1400c3525:     	movq	0x2a0(%rbp), %r13
1400c352c:     	testq	%r15, %r15
1400c352f:     	je	0x1400c3543 <.text+0xc2543>
1400c3531:     	movq	%r13, %rcx
1400c3534:     	movq	0x798(%rbp), %rdx
1400c353b:     	movq	%r15, %r8
1400c353e:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3543:     	movq	0x490(%rbp), %rdx
1400c354a:     	testq	%rdx, %rdx
1400c354d:     	je	0x1400c3561 <.text+0xc2561>
1400c354f:     	movq	0x498(%rbp), %rcx
1400c3556:     	movl	$0x1, %r8d
1400c355c:     	callq	0x1400021d0 <.text+0x11d0>
1400c3561:     	movq	%rsi, 0x490(%rbp)
1400c3568:     	movq	%r13, 0x498(%rbp)
1400c356f:     	movq	%r15, 0x4a0(%rbp)
1400c3576:     	movb	$0x0, 0x7a7(%rbp)
1400c357d:     	movb	$0x1, 0x7a6(%rbp)
1400c3584:     	leaq	0x583ab37(%rip), %rcx   # 0x1458fe0c2
1400c358b:     	movl	$0xf, %edx
1400c3590:     	callq	0x145452350 <.text+0x5451350>
1400c3595:     	nop
1400c3596:     	movq	%rdx, %r8
1400c3599:     	movq	%r12, 0x290(%rbp)
1400c35a0:     	movq	$0x4, 0x298(%rbp)
1400c35ab:     	leaq	-0x30(%rbp), %rcx
1400c35af:     	movq	%rcx, 0x2a0(%rbp)
1400c35b6:     	leaq	0x583ab1b(%rip), %rcx   # 0x1458fe0d8
1400c35bd:     	movq	%rcx, 0x2a8(%rbp)
1400c35c4:     	movb	$0x0, 0x7a7(%rbp)
1400c35cb:     	movb	$0x1, 0x7a6(%rbp)
1400c35d2:     	movq	$0x1, 0x20(%rsp)
1400c35db:     	leaq	0xf0(%rbp), %rcx
1400c35e2:     	leaq	0x290(%rbp), %r9
1400c35e9:     	movq	%rax, %rdx
1400c35ec:     	callq	0x145452790 <.text+0x5451790>
1400c35f1:     	nop
1400c35f2:     	movq	0x508(%rbp), %rdx
1400c35f9:     	testq	%rdx, %rdx
1400c35fc:     	je	0x1400c3610 <.text+0xc2610>
1400c35fe:     	movq	0x510(%rbp), %rcx
1400c3605:     	movl	$0x1, %r8d
1400c360b:     	callq	0x1400021d0 <.text+0x11d0>
1400c3610:     	movq	0x100(%rbp), %rax
1400c3617:     	leaq	0x4f0(%rbp), %rcx
1400c361e:     	movq	%rax, 0x28(%rcx)
1400c3622:     	movups	0xf0(%rbp), %xmm0
1400c3629:     	movups	%xmm0, 0x18(%rcx)
1400c362d:     	movq	-0x30(%rbp), %r15
1400c3631:     	movq	-0x28(%rbp), %r12
1400c3635:     	movq	$0x1, 0x20(%rsp)
1400c363e:     	leaq	0x290(%rbp), %rcx
1400c3645:     	movl	$0x1, %r9d
1400c364b:     	movq	%r12, %rdx
1400c364e:     	xorl	%r8d, %r8d
1400c3651:     	callq	0x14003bf90 <.text+0x3af90>
1400c3656:     	movq	0x298(%rbp), %rax
1400c365d:     	movq	%rax, 0x788(%rbp)
1400c3664:     	cmpl	$0x1, 0x290(%rbp)
1400c366b:     	je	0x1400c4931 <.text+0xc3931>
1400c3671:     	movq	0x2a0(%rbp), %rsi
1400c3678:     	testq	%r12, %r12
1400c367b:     	je	0x1400c368c <.text+0xc268c>
1400c367d:     	movq	%rsi, %rcx
1400c3680:     	movq	%r15, %rdx
1400c3683:     	movq	%r12, %r8
1400c3686:     	callq	0x145756ddd <.text+0x5755ddd>
1400c368b:     	nop
1400c368c:     	movq	%rsi, 0x770(%rbp)
1400c3693:     	leaq	0x583aa5e(%rip), %rcx   # 0x1458fe0f8
1400c369a:     	movl	$0xc, %edx
1400c369f:     	movq	%rdi, %r8
1400c36a2:     	callq	0x142aed730 <.text+0x2aec730>
1400c36a7:     	nop
1400c36a8:     	testq	%rax, %rax
1400c36ab:     	jne	0x1400c36b4 <.text+0xc26b4>
1400c36ad:     	movq	0x78f9104(%rip), %rax   # 0x1479bc7b8
1400c36b4:     	movq	%r12, 0x288(%rbp)
1400c36bb:     	cmpb	$0x3, (%rax)
1400c36be:     	jne	0x1400c4252 <.text+0xc3252>
1400c36c4:     	movq	0x10(%rax), %r13
1400c36c8:     	movq	0x18(%rax), %r12
1400c36cc:     	jmp	0x1400c425b <.text+0xc325b>
1400c36d1:     	testb	%r15b, %r15b
1400c36d4:     	je	0x1400c3c9f <.text+0xc2c9f>
1400c36da:     	movq	%rsi, -0x30(%rbp)
1400c36de:     	movb	$0x0, 0x7a7(%rbp)
1400c36e5:     	movb	$0x1, 0x7a6(%rbp)
1400c36ec:     	leaq	0x583aa4c(%rip), %rcx   # 0x1458fe13f
1400c36f3:     	movl	$0x8, %edx
1400c36f8:     	callq	0x145452350 <.text+0x5451350>
1400c36fd:     	nop
1400c36fe:     	movq	%rdx, %r8
1400c3701:     	leaq	0x583a8c0(%rip), %rcx   # 0x1458fdfc8
1400c3708:     	movq	%rcx, 0x290(%rbp)
1400c370f:     	movq	$0x1, 0x298(%rbp)
1400c371a:     	leaq	-0x30(%rbp), %rcx
1400c371e:     	movq	%rcx, 0x2a0(%rbp)
1400c3725:     	leaq	0x583a87c(%rip), %rcx   # 0x1458fdfa8
1400c372c:     	movq	%rcx, 0x2a8(%rbp)
1400c3733:     	movb	$0x0, 0x7a7(%rbp)
1400c373a:     	movb	$0x1, 0x7a6(%rbp)
1400c3741:     	movq	$0x1, 0x20(%rsp)
1400c374a:     	leaq	0xf0(%rbp), %rcx
1400c3751:     	leaq	0x290(%rbp), %r9
1400c3758:     	movq	%rax, %rdx
1400c375b:     	callq	0x145452790 <.text+0x5451790>
1400c3760:     	nop
1400c3761:     	movq	0x490(%rbp), %rdx
1400c3768:     	testq	%rdx, %rdx
1400c376b:     	je	0x1400c377f <.text+0xc277f>
1400c376d:     	movq	0x498(%rbp), %rcx
1400c3774:     	movl	$0x1, %r8d
1400c377a:     	callq	0x1400021d0 <.text+0x11d0>
1400c377f:     	movq	0x100(%rbp), %rax
1400c3786:     	movq	%rax, 0x4a0(%rbp)
1400c378d:     	movups	0xf0(%rbp), %xmm0
1400c3794:     	movaps	%xmm0, 0x490(%rbp)
1400c379b:     	movb	$0x0, 0x7a7(%rbp)
1400c37a2:     	movb	$0x1, 0x7a6(%rbp)
1400c37a9:     	leaq	0x583a997(%rip), %rcx   # 0x1458fe147
1400c37b0:     	movl	$0x14, %edx
1400c37b5:     	callq	0x145452350 <.text+0x5451350>
1400c37ba:     	nop
1400c37bb:     	movq	%rax, %rsi
1400c37be:     	movq	%rdx, %r15
1400c37c1:     	movq	$0x1, 0x20(%rsp)
1400c37ca:     	leaq	0x290(%rbp), %rcx
1400c37d1:     	movl	$0x1, %r9d
1400c37d7:     	xorl	%r8d, %r8d
1400c37da:     	callq	0x14003bf90 <.text+0x3af90>
1400c37df:     	movq	0x298(%rbp), %r12
1400c37e6:     	cmpl	$0x1, 0x290(%rbp)
1400c37ed:     	jne	0x1400c3da3 <.text+0xc2da3>
1400c37f3:     	movq	0x2a0(%rbp), %rdx
1400c37fa:     	movb	$0x0, 0x7a7(%rbp)
1400c3801:     	movb	$0x1, 0x7a6(%rbp)
1400c3808:     	movq	%r12, %rcx
1400c380b:     	callq	0x1458e721b <.text+0x58e621b>
1400c3810:     	nop
1400c3811:     	jmp	0x1400c4971 <.text+0xc3971>
1400c3816:     	movl	$0x1, %esi
1400c381b:     	movq	0x490(%rbp), %rdx
1400c3822:     	testq	%rdx, %rdx
1400c3825:     	je	0x1400c3839 <.text+0xc2839>
1400c3827:     	movq	0x498(%rbp), %rcx
1400c382e:     	movl	$0x1, %r8d
1400c3834:     	callq	0x1400021d0 <.text+0x11d0>
1400c3839:     	movq	%r12, 0x490(%rbp)
1400c3840:     	movq	%rsi, 0x498(%rbp)
1400c3847:     	movq	%r12, 0x4a0(%rbp)
1400c384e:     	movb	$0x1, 0x590(%rbp)
1400c3855:     	movb	$0x1, 0x7a7(%rbp)
1400c385c:     	movb	$0x1, 0x7a6(%rbp)
1400c3863:     	leaq	0x583a9b5(%rip), %rcx   # 0x1458fe21f
1400c386a:     	movl	$0x9, %edx
1400c386f:     	callq	0x145452350 <.text+0x5451350>
1400c3874:     	nop
1400c3875:     	movq	%rdx, %r12
1400c3878:     	testq	%rdx, %rdx
1400c387b:     	jns	0x1400c389f <.text+0xc289f>
1400c387d:     	xorl	%r13d, %r13d
1400c3880:     	movb	$0x1, 0x7a7(%rbp)
1400c3887:     	movb	$0x1, 0x7a6(%rbp)
1400c388e:     	movq	%r13, %rcx
1400c3891:     	movq	%r12, %rdx
1400c3894:     	callq	0x1458e721b <.text+0x58e621b>
1400c3899:     	nop
1400c389a:     	jmp	0x1400c4971 <.text+0xc3971>
1400c389f:     	movq	%rax, 0x798(%rbp)
1400c38a6:     	testq	%r12, %r12
1400c38a9:     	je	0x1400c40bd <.text+0xc30bd>
1400c38af:     	callq	0x140002200 <.text+0x1200>
1400c38b4:     	movl	$0x1, %r13d
1400c38ba:     	movl	$0x1, %edx
1400c38bf:     	movq	%r12, %rcx
1400c38c2:     	callq	0x1400021c0 <.text+0x11c0>
1400c38c7:     	testq	%rax, %rax
1400c38ca:     	je	0x1400c3880 <.text+0xc2880>
1400c38cc:     	movq	%rax, %rsi
1400c38cf:     	movq	%rax, %rcx
1400c38d2:     	movq	0x798(%rbp), %rdx
1400c38d9:     	movq	%r12, %r8
1400c38dc:     	callq	0x145756ddd <.text+0x5755ddd>
1400c38e1:     	jmp	0x1400c40c2 <.text+0xc30c2>
1400c38e6:     	movl	$0x1, %r12d
1400c38ec:     	movq	0x508(%rbp), %rdx
1400c38f3:     	testq	%rdx, %rdx
1400c38f6:     	je	0x1400c390a <.text+0xc290a>
1400c38f8:     	movq	0x510(%rbp), %rcx
1400c38ff:     	movl	$0x1, %r8d
1400c3905:     	callq	0x1400021d0 <.text+0x11d0>
1400c390a:     	movq	%r15, 0x508(%rbp)
1400c3911:     	movq	%r12, 0x510(%rbp)
1400c3918:     	movq	%r15, 0x518(%rbp)
1400c391f:     	jmp	0x1400c3fe1 <.text+0xc2fe1>
1400c3924:     	movb	$0x1, 0x7a7(%rbp)
1400c392b:     	movb	$0x1, 0x7a6(%rbp)
1400c3932:     	leaq	0x583a829(%rip), %rcx   # 0x1458fe162
1400c3939:     	movl	$0x4, %edx
1400c393e:     	callq	0x145452350 <.text+0x5451350>
1400c3943:     	nop
1400c3944:     	movq	%rdx, %r15
1400c3947:     	movb	$0x1, %cl
1400c3949:     	testq	%r15, %r15
1400c394c:     	js	0x1400c2f2c <.text+0xc1f2c>
1400c3952:     	movl	%ecx, 0x798(%rbp)
1400c3958:     	je	0x1400c39a0 <.text+0xc29a0>
1400c395a:     	movq	%rax, 0x788(%rbp)
1400c3961:     	callq	0x140002200 <.text+0x1200>
1400c3966:     	movl	$0x1, %r13d
1400c396c:     	movl	$0x1, %edx
1400c3971:     	movq	%r15, %rcx
1400c3974:     	callq	0x1400021c0 <.text+0x11c0>
1400c3979:     	testq	%rax, %rax
1400c397c:     	je	0x1400c2f2f <.text+0xc1f2f>
1400c3982:     	movq	%rax, %r12
1400c3985:     	movq	%rax, %rcx
1400c3988:     	movq	0x788(%rbp), %rdx
1400c398f:     	movq	%r15, %r8
1400c3992:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3997:     	movq	0x780(%rbp), %r13
1400c399e:     	jmp	0x1400c39a6 <.text+0xc29a6>
1400c39a0:     	movl	$0x1, %r12d
1400c39a6:     	movq	0x4c0(%rbp), %rdx
1400c39ad:     	testq	%rdx, %rdx
1400c39b0:     	je	0x1400c39c4 <.text+0xc29c4>
1400c39b2:     	movq	0x4c8(%rbp), %rcx
1400c39b9:     	movl	$0x1, %r8d
1400c39bf:     	callq	0x1400021d0 <.text+0x11d0>
1400c39c4:     	movq	%r15, 0x4c0(%rbp)
1400c39cb:     	movq	%r12, 0x4c8(%rbp)
1400c39d2:     	movq	%r15, 0x4d0(%rbp)
1400c39d9:     	movq	0x500(%rbp), %rsi
1400c39e0:     	testq	%rsi, %rsi
1400c39e3:     	movl	0x798(%rbp), %r12d
1400c39ea:     	je	0x1400c3a1b <.text+0xc2a1b>
1400c39ec:     	movq	0x4f8(%rbp), %r15
1400c39f3:     	addq	$0x8, %r15
1400c39f7:     	jmp	0x1400c3a02 <.text+0xc2a02>
1400c39f9:     	addq	$0x18, %r15
1400c39fd:     	decq	%rsi
1400c3a00:     	je	0x1400c3a1b <.text+0xc2a1b>
1400c3a02:     	movq	-0x8(%r15), %rdx
1400c3a06:     	testq	%rdx, %rdx
1400c3a09:     	je	0x1400c39f9 <.text+0xc29f9>
1400c3a0b:     	movq	(%r15), %rcx
1400c3a0e:     	movl	$0x1, %r8d
1400c3a14:     	callq	0x1400021d0 <.text+0x11d0>
1400c3a19:     	jmp	0x1400c39f9 <.text+0xc29f9>
1400c3a1b:     	movq	0x4f0(%rbp), %rax
1400c3a22:     	testq	%rax, %rax
1400c3a25:     	je	0x1400c3a41 <.text+0xc2a41>
1400c3a27:     	movq	0x4f8(%rbp), %rcx
1400c3a2e:     	shlq	$0x3, %rax
1400c3a32:     	leaq	(%rax,%rax,2), %rdx
1400c3a36:     	movl	$0x8, %r8d
1400c3a3c:     	callq	0x1400021d0 <.text+0x11d0>
1400c3a41:     	movq	0x730(%rbp), %rax
1400c3a48:     	leaq	0x4f0(%rbp), %rcx
1400c3a4f:     	movq	%rax, 0x10(%rcx)
1400c3a53:     	movups	0x720(%rbp), %xmm0
1400c3a5a:     	movups	%xmm0, (%rcx)
1400c3a5d:     	movb	$0x0, 0x7a7(%rbp)
1400c3a64:     	movb	$0x1, 0x7a6(%rbp)
1400c3a6b:     	leaq	0x583a63e(%rip), %rcx   # 0x1458fe0b0
1400c3a72:     	movl	$0x4, %edx
1400c3a77:     	movq	%rdi, %r8
1400c3a7a:     	callq	0x142aed730 <.text+0x2aec730>
1400c3a7f:     	nop
1400c3a80:     	testq	%rax, %rax
1400c3a83:     	jne	0x1400c3a8c <.text+0xc2a8c>
1400c3a85:     	movq	0x78f8d2c(%rip), %rax   # 0x1479bc7b8
1400c3a8c:     	cmpb	$0x2, (%rax)
1400c3a8f:     	jne	0x1400c3a9c <.text+0xc2a9c>
1400c3a91:     	cmpq	$0x0, 0x8(%rax)
1400c3a96:     	je	0x1400c3bac <.text+0xc2bac>
1400c3a9c:     	movb	$0x0, 0x7a7(%rbp)
1400c3aa3:     	movb	$0x1, 0x7a6(%rbp)
1400c3aaa:     	leaq	0x583a6e8(%rip), %rcx   # 0x1458fe199
1400c3ab1:     	movl	$0x4, %edx
1400c3ab6:     	movq	%rdi, %r8
1400c3ab9:     	callq	0x142aed730 <.text+0x2aec730>
1400c3abe:     	nop
1400c3abf:     	testq	%rax, %rax
1400c3ac2:     	jne	0x1400c3acb <.text+0xc2acb>
1400c3ac4:     	movq	0x78f8ced(%rip), %rax   # 0x1479bc7b8
1400c3acb:     	movl	$0x1, %esi
1400c3ad0:     	cmpb	$0x2, (%rax)
1400c3ad3:     	jne	0x1400c3af0 <.text+0xc2af0>
1400c3ad5:     	cmpq	$0x0, 0x8(%rax)
1400c3ada:     	jne	0x1400c3af0 <.text+0xc2af0>
1400c3adc:     	movq	0x10(%rax), %rax
1400c3ae0:     	incq	%rax
1400c3ae3:     	cmpq	$0x2, %rax
1400c3ae7:     	movl	$0x2, %esi
1400c3aec:     	cmovbq	%rax, %rsi
1400c3af0:     	testb	%r12b, %r12b
1400c3af3:     	je	0x1400c3b17 <.text+0xc2b17>
1400c3af5:     	movb	$0x0, 0x7a7(%rbp)
1400c3afc:     	movb	$0x1, 0x7a6(%rbp)
1400c3b03:     	leaq	0x583a69a(%rip), %rcx   # 0x1458fe1a4
1400c3b0a:     	movl	$0x4, %edx
1400c3b0f:     	callq	0x145452350 <.text+0x5451350>
1400c3b14:     	nop
1400c3b15:     	jmp	0x1400c3b37 <.text+0xc2b37>
1400c3b17:     	movb	$0x0, 0x7a7(%rbp)
1400c3b1e:     	movb	$0x1, 0x7a6(%rbp)
1400c3b25:     	leaq	0x583a671(%rip), %rcx   # 0x1458fe19d
1400c3b2c:     	movl	$0x7, %edx
1400c3b31:     	callq	0x145452350 <.text+0x5451350>
1400c3b36:     	nop
1400c3b37:     	movq	%rdx, %r15
1400c3b3a:     	testq	%rdx, %rdx
1400c3b3d:     	jns	0x1400c3b61 <.text+0xc2b61>
1400c3b3f:     	xorl	%r13d, %r13d
1400c3b42:     	movb	$0x0, 0x7a7(%rbp)
1400c3b49:     	movb	$0x1, 0x7a6(%rbp)
1400c3b50:     	movq	%r13, %rcx
1400c3b53:     	movq	%r15, %rdx
1400c3b56:     	callq	0x1458e721b <.text+0x58e621b>
1400c3b5b:     	nop
1400c3b5c:     	jmp	0x1400c4971 <.text+0xc3971>
1400c3b61:     	je	0x1400c3dee <.text+0xc2dee>
1400c3b67:     	movq	%rax, 0x788(%rbp)
1400c3b6e:     	callq	0x140002200 <.text+0x1200>
1400c3b73:     	movl	$0x1, %r13d
1400c3b79:     	movl	$0x1, %edx
1400c3b7e:     	movq	%r15, %rcx
1400c3b81:     	callq	0x1400021c0 <.text+0x11c0>
1400c3b86:     	testq	%rax, %rax
1400c3b89:     	je	0x1400c3b42 <.text+0xc2b42>
1400c3b8b:     	movq	%rax, %r12
1400c3b8e:     	movq	%rax, %rcx
1400c3b91:     	movq	0x788(%rbp), %rdx
1400c3b98:     	movq	%r15, %r8
1400c3b9b:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3ba0:     	movq	0x780(%rbp), %r13
1400c3ba7:     	jmp	0x1400c3df4 <.text+0xc2df4>
1400c3bac:     	movq	0x10(%rax), %rax
1400c3bb0:     	movq	%rax, -0x30(%rbp)
1400c3bb4:     	movb	$0x0, 0x7a7(%rbp)
1400c3bbb:     	movb	$0x1, 0x7a6(%rbp)
1400c3bc2:     	leaq	0x583a576(%rip), %rcx   # 0x1458fe13f
1400c3bc9:     	movl	$0x8, %edx
1400c3bce:     	callq	0x145452350 <.text+0x5451350>
1400c3bd3:     	nop
1400c3bd4:     	movq	%rdx, %r8
1400c3bd7:     	leaq	0x583a3ea(%rip), %rcx   # 0x1458fdfc8
1400c3bde:     	movq	%rcx, 0x290(%rbp)
1400c3be5:     	movq	$0x1, 0x298(%rbp)
1400c3bf0:     	leaq	-0x30(%rbp), %rcx
1400c3bf4:     	movq	%rcx, 0x2a0(%rbp)
1400c3bfb:     	leaq	0x583a3a6(%rip), %rcx   # 0x1458fdfa8
1400c3c02:     	movq	%rcx, 0x2a8(%rbp)
1400c3c09:     	movb	$0x0, 0x7a7(%rbp)
1400c3c10:     	movb	$0x1, 0x7a6(%rbp)
1400c3c17:     	movq	$0x1, 0x20(%rsp)
1400c3c20:     	leaq	0xf0(%rbp), %rcx
1400c3c27:     	leaq	0x290(%rbp), %r9
1400c3c2e:     	movq	%rax, %rdx
1400c3c31:     	callq	0x145452790 <.text+0x5451790>
1400c3c36:     	nop
1400c3c37:     	movq	0x490(%rbp), %rdx
1400c3c3e:     	testq	%rdx, %rdx
1400c3c41:     	je	0x1400c3c55 <.text+0xc2c55>
1400c3c43:     	movq	0x498(%rbp), %rcx
1400c3c4a:     	movl	$0x1, %r8d
1400c3c50:     	callq	0x1400021d0 <.text+0x11d0>
1400c3c55:     	movq	0x100(%rbp), %rax
1400c3c5c:     	movq	%rax, 0x4a0(%rbp)
1400c3c63:     	movups	0xf0(%rbp), %xmm0
1400c3c6a:     	movaps	%xmm0, 0x490(%rbp)
1400c3c71:     	testb	%r12b, %r12b
1400c3c74:     	je	0x1400c419f <.text+0xc319f>
1400c3c7a:     	movb	$0x0, 0x7a7(%rbp)
1400c3c81:     	movb	$0x1, 0x7a6(%rbp)
1400c3c88:     	leaq	0x583a4f2(%rip), %rcx   # 0x1458fe181
1400c3c8f:     	movl	$0x18, %edx
1400c3c94:     	callq	0x145452350 <.text+0x5451350>
1400c3c99:     	nop
1400c3c9a:     	jmp	0x1400c41bf <.text+0xc31bf>
1400c3c9f:     	movb	$0x0, 0x7a7(%rbp)
1400c3ca6:     	movb	$0x1, 0x7a6(%rbp)
1400c3cad:     	leaq	0x583a408(%rip), %rcx   # 0x1458fe0bc
1400c3cb4:     	movl	$0x6, %edx
1400c3cb9:     	callq	0x145452350 <.text+0x5451350>
1400c3cbe:     	nop
1400c3cbf:     	movq	%rax, %rsi
1400c3cc2:     	movq	%rdx, %r15
1400c3cc5:     	movq	$0x1, 0x20(%rsp)
1400c3cce:     	leaq	0x290(%rbp), %rcx
1400c3cd5:     	movl	$0x1, %r9d
1400c3cdb:     	xorl	%r8d, %r8d
1400c3cde:     	callq	0x14003bf90 <.text+0x3af90>
1400c3ce3:     	movq	0x298(%rbp), %r12
1400c3cea:     	cmpl	$0x1, 0x290(%rbp)
1400c3cf1:     	je	0x1400c48f1 <.text+0xc38f1>
1400c3cf7:     	movq	0x2a0(%rbp), %r13
1400c3cfe:     	testq	%r15, %r15
1400c3d01:     	je	0x1400c3d11 <.text+0xc2d11>
1400c3d03:     	movq	%r13, %rcx
1400c3d06:     	movq	%rsi, %rdx
1400c3d09:     	movq	%r15, %r8
1400c3d0c:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3d11:     	movq	0x490(%rbp), %rdx
1400c3d18:     	testq	%rdx, %rdx
1400c3d1b:     	je	0x1400c3d2f <.text+0xc2d2f>
1400c3d1d:     	movq	0x498(%rbp), %rcx
1400c3d24:     	movl	$0x1, %r8d
1400c3d2a:     	callq	0x1400021d0 <.text+0x11d0>
1400c3d2f:     	movq	%r12, 0x490(%rbp)
1400c3d36:     	movq	%r13, 0x498(%rbp)
1400c3d3d:     	movq	%r15, 0x4a0(%rbp)
1400c3d44:     	movb	$0x1, 0x590(%rbp)
1400c3d4b:     	movb	$0x0, 0x7a7(%rbp)
1400c3d52:     	movb	$0x1, 0x7a6(%rbp)
1400c3d59:     	leaq	0x583a3ca(%rip), %rcx   # 0x1458fe12a
1400c3d60:     	movl	$0x15, %edx
1400c3d65:     	callq	0x145452350 <.text+0x5451350>
1400c3d6a:     	nop
1400c3d6b:     	movq	%rax, %rsi
1400c3d6e:     	movq	%rdx, %r15
1400c3d71:     	movq	$0x1, 0x20(%rsp)
1400c3d7a:     	leaq	0x290(%rbp), %rcx
1400c3d81:     	movl	$0x1, %r9d
1400c3d87:     	xorl	%r8d, %r8d
1400c3d8a:     	callq	0x14003bf90 <.text+0x3af90>
1400c3d8f:     	movq	0x298(%rbp), %r12
1400c3d96:     	cmpl	$0x1, 0x290(%rbp)
1400c3d9d:     	je	0x1400c4911 <.text+0xc3911>
1400c3da3:     	movq	0x2a0(%rbp), %r13
1400c3daa:     	testq	%r15, %r15
1400c3dad:     	je	0x1400c3dbd <.text+0xc2dbd>
1400c3daf:     	movq	%r13, %rcx
1400c3db2:     	movq	%rsi, %rdx
1400c3db5:     	movq	%r15, %r8
1400c3db8:     	callq	0x145756ddd <.text+0x5755ddd>
1400c3dbd:     	movq	0x508(%rbp), %rdx
1400c3dc4:     	testq	%rdx, %rdx
1400c3dc7:     	je	0x1400c3ddb <.text+0xc2ddb>
1400c3dc9:     	movq	0x510(%rbp), %rcx
1400c3dd0:     	movl	$0x1, %r8d
1400c3dd6:     	callq	0x1400021d0 <.text+0x11d0>
1400c3ddb:     	movq	%r12, 0x508(%rbp)
1400c3de2:     	movq	%r13, 0x510(%rbp)
1400c3de9:     	jmp	0x1400c423d <.text+0xc323d>
1400c3dee:     	movl	$0x1, %r12d
1400c3df4:     	movq	0x490(%rbp), %rdx
1400c3dfb:     	testq	%rdx, %rdx
1400c3dfe:     	je	0x1400c3e12 <.text+0xc2e12>
1400c3e00:     	movq	0x498(%rbp), %rcx
1400c3e07:     	movl	$0x1, %r8d
1400c3e0d:     	callq	0x1400021d0 <.text+0x11d0>
1400c3e12:     	movq	%r15, 0x490(%rbp)
1400c3e19:     	movq	%r12, 0x498(%rbp)
1400c3e20:     	movq	%r15, 0x4a0(%rbp)
1400c3e27:     	movb	$0x1, 0x590(%rbp)
1400c3e2e:     	movq	%rsi, -0x30(%rbp)
1400c3e32:     	cmpb	$0x0, 0x798(%rbp)
1400c3e39:     	je	0x1400c3ef5 <.text+0xc2ef5>
1400c3e3f:     	movb	$0x0, 0x7a7(%rbp)
1400c3e46:     	movb	$0x1, 0x7a6(%rbp)
1400c3e4d:     	leaq	0x583a387(%rip), %rcx   # 0x1458fe1db
1400c3e54:     	movl	$0x1e, %edx
1400c3e59:     	callq	0x145452350 <.text+0x5451350>
1400c3e5e:     	nop
1400c3e5f:     	movq	%rdx, %r8
1400c3e62:     	leaq	0x583a15f(%rip), %rcx   # 0x1458fdfc8
1400c3e69:     	movq	%rcx, 0x290(%rbp)
1400c3e70:     	movq	$0x1, 0x298(%rbp)
1400c3e7b:     	leaq	-0x30(%rbp), %rcx
1400c3e7f:     	movq	%rcx, 0x2a0(%rbp)
1400c3e86:     	leaq	0x583a11b(%rip), %rcx   # 0x1458fdfa8
1400c3e8d:     	movq	%rcx, 0x2a8(%rbp)
1400c3e94:     	leaq	0x583a33d(%rip), %rdx   # 0x1458fe1d8
1400c3e9b:     	movq	%rdx, 0x2b0(%rbp)
1400c3ea2:     	movq	$0x3, 0x2b8(%rbp)
1400c3ead:     	leaq	0x583a31c(%rip), %rdx   # 0x1458fe1d0
1400c3eb4:     	movq	%rdx, 0x2c0(%rbp)
1400c3ebb:     	movq	%rcx, 0x2c8(%rbp)
1400c3ec2:     	movb	$0x0, 0x7a7(%rbp)
1400c3ec9:     	movb	$0x1, 0x7a6(%rbp)
1400c3ed0:     	movq	$0x2, 0x20(%rsp)
1400c3ed9:     	leaq	0xf0(%rbp), %rcx
1400c3ee0:     	leaq	0x290(%rbp), %r9
1400c3ee7:     	movq	%rax, %rdx
1400c3eea:     	callq	0x145452790 <.text+0x5451790>
1400c3eef:     	nop
1400c3ef0:     	jmp	0x1400c3fa6 <.text+0xc2fa6>
1400c3ef5:     	movb	$0x0, 0x7a7(%rbp)
1400c3efc:     	movb	$0x1, 0x7a6(%rbp)
1400c3f03:     	leaq	0x583a29e(%rip), %rcx   # 0x1458fe1a8
1400c3f0a:     	movl	$0x21, %edx
1400c3f0f:     	callq	0x145452350 <.text+0x5451350>
1400c3f14:     	nop
1400c3f15:     	movq	%rdx, %r8
1400c3f18:     	leaq	0x583a0a9(%rip), %rcx   # 0x1458fdfc8
1400c3f1f:     	movq	%rcx, 0x290(%rbp)
1400c3f26:     	movq	$0x1, 0x298(%rbp)
1400c3f31:     	leaq	-0x30(%rbp), %rcx
1400c3f35:     	movq	%rcx, 0x2a0(%rbp)
1400c3f3c:     	leaq	0x583a065(%rip), %rcx   # 0x1458fdfa8
1400c3f43:     	movq	%rcx, 0x2a8(%rbp)
1400c3f4a:     	leaq	0x583a287(%rip), %rdx   # 0x1458fe1d8
1400c3f51:     	movq	%rdx, 0x2b0(%rbp)
1400c3f58:     	movq	$0x3, 0x2b8(%rbp)
1400c3f63:     	leaq	0x583a266(%rip), %rdx   # 0x1458fe1d0
1400c3f6a:     	movq	%rdx, 0x2c0(%rbp)
1400c3f71:     	movq	%rcx, 0x2c8(%rbp)
1400c3f78:     	movb	$0x0, 0x7a7(%rbp)
1400c3f7f:     	movb	$0x1, 0x7a6(%rbp)
1400c3f86:     	movq	$0x2, 0x20(%rsp)
1400c3f8f:     	leaq	0xf0(%rbp), %rcx
1400c3f96:     	leaq	0x290(%rbp), %r9
1400c3f9d:     	movq	%rax, %rdx
1400c3fa0:     	callq	0x145452790 <.text+0x5451790>
1400c3fa5:     	nop
1400c3fa6:     	movq	0x508(%rbp), %rdx
1400c3fad:     	testq	%rdx, %rdx
1400c3fb0:     	leaq	0x4f0(%rbp), %rsi
1400c3fb7:     	je	0x1400c3fcb <.text+0xc2fcb>
1400c3fb9:     	movq	0x510(%rbp), %rcx
1400c3fc0:     	movl	$0x1, %r8d
1400c3fc6:     	callq	0x1400021d0 <.text+0x11d0>
1400c3fcb:     	movq	0x100(%rbp), %rax
1400c3fd2:     	movq	%rax, 0x28(%rsi)
1400c3fd6:     	movups	0xf0(%rbp), %xmm0
1400c3fdd:     	movups	%xmm0, 0x18(%rsi)
1400c3fe1:     	xorl	%esi, %esi
1400c3fe3:     	jmp	0x1400c47ce <.text+0xc37ce>
1400c3fe8:     	movl	$0x1, %r12d
1400c3fee:     	movq	0x490(%rbp), %rdx
1400c3ff5:     	testq	%rdx, %rdx
1400c3ff8:     	je	0x1400c400c <.text+0xc300c>
1400c3ffa:     	movq	0x498(%rbp), %rcx
1400c4001:     	movl	$0x1, %r8d
1400c4007:     	callq	0x1400021d0 <.text+0x11d0>
1400c400c:     	movq	%r15, 0x490(%rbp)
1400c4013:     	movq	%r12, 0x498(%rbp)
1400c401a:     	movq	%r15, 0x4a0(%rbp)
1400c4021:     	movb	$0x1, 0x7a7(%rbp)
1400c4028:     	movb	$0x1, 0x7a6(%rbp)
1400c402f:     	leaq	0x583a05f(%rip), %rcx   # 0x1458fe095
1400c4036:     	movl	$0x15, %edx
1400c403b:     	callq	0x145452350 <.text+0x5451350>
1400c4040:     	nop
1400c4041:     	movq	%rdx, %r15
1400c4044:     	testq	%rdx, %rdx
1400c4047:     	jns	0x1400c406b <.text+0xc306b>
1400c4049:     	xorl	%r13d, %r13d
1400c404c:     	movb	$0x1, 0x7a7(%rbp)
1400c4053:     	movb	$0x1, 0x7a6(%rbp)
1400c405a:     	movq	%r13, %rcx
1400c405d:     	movq	%r15, %rdx
1400c4060:     	callq	0x1458e721b <.text+0x58e621b>
1400c4065:     	nop
1400c4066:     	jmp	0x1400c4971 <.text+0xc3971>
1400c406b:     	testq	%r15, %r15
1400c406e:     	je	0x1400c444d <.text+0xc344d>
1400c4074:     	movq	%rax, %rsi
1400c4077:     	callq	0x140002200 <.text+0x1200>
1400c407c:     	movl	$0x1, %r13d
1400c4082:     	movl	$0x1, %edx
1400c4087:     	movq	%r15, %rcx
1400c408a:     	callq	0x1400021c0 <.text+0x11c0>
1400c408f:     	testq	%rax, %rax
1400c4092:     	je	0x1400c404c <.text+0xc304c>
1400c4094:     	movq	%rax, %r12
1400c4097:     	movq	%rax, %rcx
1400c409a:     	movq	%rsi, %rdx
1400c409d:     	movq	%r15, %r8
1400c40a0:     	callq	0x145756ddd <.text+0x5755ddd>
1400c40a5:     	movq	0x780(%rbp), %r13
1400c40ac:     	jmp	0x1400c4453 <.text+0xc3453>
1400c40b1:     	movq	0x10(%rax), %rsi
1400c40b5:     	movb	$0x1, %r15b
1400c40b8:     	jmp	0x1400c3480 <.text+0xc2480>
1400c40bd:     	movl	$0x1, %esi
1400c40c2:     	movq	0x4c0(%rbp), %rdx
1400c40c9:     	testq	%rdx, %rdx
1400c40cc:     	je	0x1400c40e0 <.text+0xc30e0>
1400c40ce:     	movq	0x4c8(%rbp), %rcx
1400c40d5:     	movl	$0x1, %r8d
1400c40db:     	callq	0x1400021d0 <.text+0x11d0>
1400c40e0:     	movq	%r12, 0x4c0(%rbp)
1400c40e7:     	movq	%rsi, 0x4c8(%rbp)
1400c40ee:     	movq	%r12, 0x4d0(%rbp)
1400c40f5:     	movq	0x720(%rbp), %rax
1400c40fc:     	movq	%rax, 0x788(%rbp)
1400c4103:     	movq	0x728(%rbp), %r12
1400c410a:     	movq	0x730(%rbp), %rax
1400c4111:     	leaq	(%rax,%rax,2), %rdx
1400c4115:     	movq	%r12, %rsi
1400c4118:     	movq	0x758(%rbp), %r8
1400c411f:     	movq	0x778(%rbp), %rcx
1400c4126:     	movq	%rcx, %r9
1400c4129:     	movq	%rcx, %r13
1400c412c:     	testq	%rax, %rax
1400c412f:     	je	0x1400c4551 <.text+0xc3551>
1400c4135:     	leaq	0x18(%r12), %rsi
1400c413a:     	movq	(%r12), %r13
1400c413e:     	cmpq	$-0x1, %r13
1400c4142:     	je	0x1400c4544 <.text+0xc3544>
1400c4148:     	movq	%rdx, 0x760(%rbp)
1400c414f:     	movq	0x8(%r12), %rax
1400c4154:     	movq	%rax, 0x798(%rbp)
1400c415b:     	movq	0x10(%r12), %rax
1400c4160:     	movq	%rax, 0x770(%rbp)
1400c4167:     	testq	%rcx, %rcx
1400c416a:     	je	0x1400c4185 <.text+0xc3185>
1400c416c:     	movl	$0x1, %r8d
1400c4172:     	movq	0x758(%rbp), %rcx
1400c4179:     	movq	0x778(%rbp), %rdx
1400c4180:     	callq	0x1400021d0 <.text+0x11d0>
1400c4185:     	movq	0x798(%rbp), %r8
1400c418c:     	movq	0x770(%rbp), %r9
1400c4193:     	movq	0x760(%rbp), %rdx
1400c419a:     	jmp	0x1400c4551 <.text+0xc3551>
1400c419f:     	movb	$0x0, 0x7a7(%rbp)
1400c41a6:     	movb	$0x1, 0x7a6(%rbp)
1400c41ad:     	leaq	0x5839fb2(%rip), %rcx   # 0x1458fe166
1400c41b4:     	movl	$0x1b, %edx
1400c41b9:     	callq	0x145452350 <.text+0x5451350>
1400c41be:     	nop
1400c41bf:     	movq	%rax, %rsi
1400c41c2:     	movq	%rdx, %r15
1400c41c5:     	movq	$0x1, 0x20(%rsp)
1400c41ce:     	leaq	0x290(%rbp), %rcx
1400c41d5:     	movl	$0x1, %r9d
1400c41db:     	xorl	%r8d, %r8d
1400c41de:     	callq	0x14003bf90 <.text+0x3af90>
1400c41e3:     	movq	0x298(%rbp), %r13
1400c41ea:     	cmpl	$0x1, 0x290(%rbp)
1400c41f1:     	je	0x1400c48ab <.text+0xc38ab>
1400c41f7:     	movq	0x2a0(%rbp), %r12
1400c41fe:     	testq	%r15, %r15
1400c4201:     	je	0x1400c4211 <.text+0xc3211>
1400c4203:     	movq	%r12, %rcx
1400c4206:     	movq	%rsi, %rdx
1400c4209:     	movq	%r15, %r8
1400c420c:     	callq	0x145756ddd <.text+0x5755ddd>
1400c4211:     	movq	0x508(%rbp), %rdx
1400c4218:     	testq	%rdx, %rdx
1400c421b:     	je	0x1400c422f <.text+0xc322f>
1400c421d:     	movq	0x510(%rbp), %rcx
1400c4224:     	movl	$0x1, %r8d
1400c422a:     	callq	0x1400021d0 <.text+0x11d0>
1400c422f:     	movq	%r13, 0x508(%rbp)
1400c4236:     	movq	%r12, 0x510(%rbp)
1400c423d:     	movq	%r15, 0x518(%rbp)
1400c4244:     	xorl	%esi, %esi
1400c4246:     	movq	0x780(%rbp), %r13
1400c424d:     	jmp	0x1400c47ce <.text+0xc37ce>
1400c4252:     	movl	$0x1, %r13d
1400c4258:     	xorl	%r12d, %r12d
1400c425b:     	movq	$0x1, 0x20(%rsp)
1400c4264:     	leaq	0x290(%rbp), %rcx
1400c426b:     	movl	$0x1, %r9d
1400c4271:     	movq	%r12, %rdx
1400c4274:     	xorl	%r8d, %r8d
1400c4277:     	callq	0x14003bf90 <.text+0x3af90>
1400c427c:     	movq	0x298(%rbp), %rcx
1400c4283:     	cmpl	$0x1, 0x290(%rbp)
1400c428a:     	je	0x1400c4955 <.text+0xc3955>
1400c4290:     	movq	%rcx, 0x760(%rbp)
1400c4297:     	movq	0x2a0(%rbp), %rsi
1400c429e:     	testq	%r12, %r12
1400c42a1:     	je	0x1400c42b2 <.text+0xc32b2>
1400c42a3:     	movq	%rsi, %rcx
1400c42a6:     	movq	%r13, %rdx
1400c42a9:     	movq	%r12, %r8
1400c42ac:     	callq	0x145756ddd <.text+0x5755ddd>
1400c42b1:     	nop
1400c42b2:     	movq	%rsi, 0x488(%rbp)
1400c42b9:     	leaq	0x5839e44(%rip), %rcx   # 0x1458fe104
1400c42c0:     	movl	$0xc, %edx
1400c42c5:     	movq	%rdi, %r8
1400c42c8:     	callq	0x142aed730 <.text+0x2aec730>
1400c42cd:     	nop
1400c42ce:     	testq	%rax, %rax
1400c42d1:     	jne	0x1400c42da <.text+0xc32da>
1400c42d3:     	movq	0x78f84de(%rip), %rax   # 0x1479bc7b8
1400c42da:     	cmpb	$0x3, (%rax)
1400c42dd:     	jne	0x1400c42e9 <.text+0xc32e9>
1400c42df:     	movq	0x10(%rax), %r15
1400c42e3:     	movq	0x18(%rax), %r13
1400c42e7:     	jmp	0x1400c42f2 <.text+0xc32f2>
1400c42e9:     	movl	$0x1, %r15d
1400c42ef:     	xorl	%r13d, %r13d
1400c42f2:     	movq	$0x1, 0x20(%rsp)
1400c42fb:     	leaq	0x290(%rbp), %rcx
1400c4302:     	movl	$0x1, %r9d
1400c4308:     	movq	%r13, %rdx
1400c430b:     	xorl	%r8d, %r8d
1400c430e:     	callq	0x14003bf90 <.text+0x3af90>
1400c4313:     	movq	0x298(%rbp), %rcx
1400c431a:     	cmpl	$0x1, 0x290(%rbp)
1400c4321:     	je	0x1400c4964 <.text+0xc3964>
1400c4327:     	movq	%rcx, 0x6f8(%rbp)
1400c432e:     	movq	0x2a0(%rbp), %rax
1400c4335:     	movq	%rax, 0x798(%rbp)
1400c433c:     	testq	%r13, %r13
1400c433f:     	je	0x1400c4354 <.text+0xc3354>
1400c4341:     	movq	0x798(%rbp), %rcx
1400c4348:     	movq	%r15, %rdx
1400c434b:     	movq	%r13, %r8
1400c434e:     	callq	0x145756ddd <.text+0x5755ddd>
1400c4353:     	nop
1400c4354:     	leaq	0x5839db5(%rip), %rcx   # 0x1458fe110
1400c435b:     	movl	$0xe, %edx
1400c4360:     	movq	%rdi, %r8
1400c4363:     	callq	0x142aed730 <.text+0x2aec730>
1400c4368:     	nop
1400c4369:     	testq	%rax, %rax
1400c436c:     	jne	0x1400c4375 <.text+0xc3375>
1400c436e:     	movq	0x78f8443(%rip), %rax   # 0x1479bc7b8
1400c4375:     	cmpb	$0x2, (%rax)
1400c4378:     	jne	0x1400c4385 <.text+0xc3385>
1400c437a:     	cmpq	$0x0, 0x8(%rax)
1400c437f:     	je	0x1400c4833 <.text+0xc3833>
1400c4385:     	xorl	%esi, %esi
1400c4387:     	leaq	0x5839d90(%rip), %rcx   # 0x1458fe11e
1400c438e:     	movl	$0xc, %edx
1400c4393:     	movq	%rdi, %r8
1400c4396:     	callq	0x142aed730 <.text+0x2aec730>
1400c439b:     	nop
1400c439c:     	testq	%rax, %rax
1400c439f:     	jne	0x1400c43a8 <.text+0xc33a8>
1400c43a1:     	movq	0x78f8410(%rip), %rax   # 0x1479bc7b8
1400c43a8:     	leaq	0x538(%rbp), %rcx
1400c43af:     	movl	$0x1, %r15d
1400c43b5:     	cmpb	$0x2, (%rax)
1400c43b8:     	jne	0x1400c43c5 <.text+0xc33c5>
1400c43ba:     	cmpq	$0x0, 0x8(%rax)
1400c43bf:     	jne	0x1400c43c5 <.text+0xc33c5>
1400c43c1:     	movq	0x10(%rax), %r15
1400c43c5:     	callq	0x1400b38e0 <.text+0xb28e0>
1400c43ca:     	movq	0x788(%rbp), %rax
1400c43d1:     	movq	%rax, 0x538(%rbp)
1400c43d8:     	movq	0x770(%rbp), %rax
1400c43df:     	movq	%rax, 0x540(%rbp)
1400c43e6:     	movq	0x288(%rbp), %rax
1400c43ed:     	movq	%rax, 0x548(%rbp)
1400c43f4:     	movq	0x760(%rbp), %rax
1400c43fb:     	movq	%rax, 0x550(%rbp)
1400c4402:     	movq	0x488(%rbp), %rax
1400c4409:     	movq	%rax, 0x558(%rbp)
1400c4410:     	movq	%r12, 0x560(%rbp)
1400c4417:     	movq	0x6f8(%rbp), %rax
1400c441e:     	movq	%rax, 0x568(%rbp)
1400c4425:     	movq	0x798(%rbp), %rax
1400c442c:     	movq	%rax, 0x570(%rbp)
1400c4433:     	movq	%r13, 0x578(%rbp)
1400c443a:     	movq	%rsi, 0x580(%rbp)
1400c4441:     	movq	%r15, 0x588(%rbp)
1400c4448:     	jmp	0x1400c4244 <.text+0xc3244>
1400c444d:     	movl	$0x1, %r12d
1400c4453:     	movq	0x4c0(%rbp), %rdx
1400c445a:     	testq	%rdx, %rdx
1400c445d:     	je	0x1400c4471 <.text+0xc3471>
1400c445f:     	movq	0x4c8(%rbp), %rcx
1400c4466:     	movl	$0x1, %r8d
1400c446c:     	callq	0x1400021d0 <.text+0x11d0>
1400c4471:     	movq	%r15, 0x4c0(%rbp)
1400c4478:     	movq	%r12, 0x4c8(%rbp)
1400c447f:     	movq	%r15, 0x4d0(%rbp)
1400c4486:     	callq	0x140002200 <.text+0x1200>
1400c448b:     	movl	$0x18, %ecx
1400c4490:     	movl	$0x8, %edx
1400c4495:     	callq	0x1400021c0 <.text+0x11c0>
1400c449a:     	testq	%rax, %rax
1400c449d:     	je	0x1400c4888 <.text+0xc3888>
1400c44a3:     	movq	%rax, %r15
1400c44a6:     	movq	0x778(%rbp), %rax
1400c44ad:     	movq	%rax, (%r15)
1400c44b0:     	movq	0x758(%rbp), %rcx
1400c44b7:     	movq	%rcx, 0x8(%r15)
1400c44bb:     	movq	%rax, 0x10(%r15)
1400c44bf:     	movq	0x500(%rbp), %rsi
1400c44c6:     	testq	%rsi, %rsi
1400c44c9:     	je	0x1400c44fc <.text+0xc34fc>
1400c44cb:     	movq	0x4f8(%rbp), %r12
1400c44d2:     	addq	$0x8, %r12
1400c44d6:     	jmp	0x1400c44e1 <.text+0xc34e1>
1400c44d8:     	addq	$0x18, %r12
1400c44dc:     	decq	%rsi
1400c44df:     	je	0x1400c44fc <.text+0xc34fc>
1400c44e1:     	movq	-0x8(%r12), %rdx
1400c44e6:     	testq	%rdx, %rdx
1400c44e9:     	je	0x1400c44d8 <.text+0xc34d8>
1400c44eb:     	movq	(%r12), %rcx
1400c44ef:     	movl	$0x1, %r8d
1400c44f5:     	callq	0x1400021d0 <.text+0x11d0>
1400c44fa:     	jmp	0x1400c44d8 <.text+0xc34d8>
1400c44fc:     	movq	0x4f0(%rbp), %rax
1400c4503:     	testq	%rax, %rax
1400c4506:     	je	0x1400c4522 <.text+0xc3522>
1400c4508:     	movq	0x4f8(%rbp), %rcx
1400c450f:     	shlq	$0x3, %rax
1400c4513:     	leaq	(%rax,%rax,2), %rdx
1400c4517:     	movl	$0x8, %r8d
1400c451d:     	callq	0x1400021d0 <.text+0x11d0>
1400c4522:     	movq	$0x1, 0x4f0(%rbp)
1400c452d:     	movq	%r15, 0x4f8(%rbp)
1400c4534:     	movq	$0x1, 0x500(%rbp)
1400c453f:     	jmp	0x1400c2646 <.text+0xc1646>
1400c4544:     	movq	0x758(%rbp), %r8
1400c454b:     	movq	%rcx, %r9
1400c454e:     	movq	%rcx, %r13
1400c4551:     	movq	%rsi, 0x770(%rbp)
1400c4558:     	leaq	(%r12,%rdx,8), %rcx
1400c455c:     	movq	0x4d8(%rbp), %rdx
1400c4563:     	testq	%rdx, %rdx
1400c4566:     	je	0x1400c459c <.text+0xc359c>
1400c4568:     	movq	%rcx, 0x760(%rbp)
1400c456f:     	movq	0x4e0(%rbp), %rcx
1400c4576:     	movq	%r8, 0x798(%rbp)
1400c457d:     	movl	$0x1, %r8d
1400c4583:     	movq	%r9, %rsi
1400c4586:     	callq	0x1400021d0 <.text+0x11d0>
1400c458b:     	movq	0x760(%rbp), %rcx
1400c4592:     	movq	%rsi, %r9
1400c4595:     	movq	0x798(%rbp), %r8
1400c459c:     	movq	%r13, 0x4d8(%rbp)
1400c45a3:     	movq	%r8, 0x4e0(%rbp)
1400c45aa:     	movq	%r9, 0x4e8(%rbp)
1400c45b1:     	movq	%r12, 0x290(%rbp)
1400c45b8:     	movq	0x770(%rbp), %rax
1400c45bf:     	movq	%rax, 0x298(%rbp)
1400c45c6:     	movq	0x788(%rbp), %rax
1400c45cd:     	movq	%rax, 0x2a0(%rbp)
1400c45d4:     	movq	%rcx, 0x2a8(%rbp)
1400c45db:     	movb	$0x0, 0x7a7(%rbp)
1400c45e2:     	movb	$0x0, 0x7a6(%rbp)
1400c45e9:     	leaq	0xf0(%rbp), %rcx
1400c45f0:     	leaq	0x290(%rbp), %rdx
1400c45f7:     	callq	0x1401097d0 <.text+0x1087d0>
1400c45fc:     	nop
1400c45fd:     	movq	0x780(%rbp), %r13
1400c4604:     	movq	0x500(%rbp), %rsi
1400c460b:     	testq	%rsi, %rsi
1400c460e:     	je	0x1400c4641 <.text+0xc3641>
1400c4610:     	movq	0x4f8(%rbp), %r12
1400c4617:     	addq	$0x8, %r12
1400c461b:     	jmp	0x1400c4626 <.text+0xc3626>
1400c461d:     	addq	$0x18, %r12
1400c4621:     	decq	%rsi
1400c4624:     	je	0x1400c4641 <.text+0xc3641>
1400c4626:     	movq	-0x8(%r12), %rdx
1400c462b:     	testq	%rdx, %rdx
1400c462e:     	je	0x1400c461d <.text+0xc361d>
1400c4630:     	movq	(%r12), %rcx
1400c4634:     	movl	$0x1, %r8d
1400c463a:     	callq	0x1400021d0 <.text+0x11d0>
1400c463f:     	jmp	0x1400c461d <.text+0xc361d>
1400c4641:     	movq	0x4f0(%rbp), %rax
1400c4648:     	testq	%rax, %rax
1400c464b:     	je	0x1400c4667 <.text+0xc3667>
1400c464d:     	movq	0x4f8(%rbp), %rcx
1400c4654:     	shlq	$0x3, %rax
1400c4658:     	leaq	(%rax,%rax,2), %rdx
1400c465c:     	movl	$0x8, %r8d
1400c4662:     	callq	0x1400021d0 <.text+0x11d0>
1400c4667:     	movq	0x100(%rbp), %rax
1400c466e:     	leaq	0x4f0(%rbp), %rcx
1400c4675:     	movq	%rax, 0x10(%rcx)
1400c4679:     	movups	0xf0(%rbp), %xmm0
1400c4680:     	movups	%xmm0, (%rcx)
1400c4683:     	movl	$0x1, %esi
1400c4688:     	cmpb	$-0x1, 0x60(%r15)
1400c468d:     	je	0x1400c46db <.text+0xc36db>
1400c468f:     	addq	$0x60, %r15
1400c4693:     	movb	$0x0, 0x7a7(%rbp)
1400c469a:     	movb	$0x0, 0x7a6(%rbp)
1400c46a1:     	leaq	0x5839b80(%rip), %rcx   # 0x1458fe228
1400c46a8:     	movl	$0x9, %edx
1400c46ad:     	movq	%r15, %r8
1400c46b0:     	callq	0x142aed730 <.text+0x2aec730>
1400c46b5:     	nop
1400c46b6:     	testq	%rax, %rax
1400c46b9:     	jne	0x1400c46c2 <.text+0xc36c2>
1400c46bb:     	movq	0x78f80f6(%rip), %rax   # 0x1479bc7b8
1400c46c2:     	cmpb	$0x4, (%rax)
1400c46c5:     	jne	0x1400c46db <.text+0xc36db>
1400c46c7:     	movq	0x18(%rax), %rax
1400c46cb:     	cmpq	$0x5, %rax
1400c46cf:     	movl	$0x5, %esi
1400c46d4:     	cmovbq	%rax, %rsi
1400c46d8:     	incq	%rsi
1400c46db:     	movb	$0x0, 0x7a7(%rbp)
1400c46e2:     	movb	$0x0, 0x7a6(%rbp)
1400c46e9:     	leaq	0x5839b41(%rip), %rcx   # 0x1458fe231
1400c46f0:     	movl	$0x1f, %edx
1400c46f5:     	callq	0x145452350 <.text+0x5451350>
1400c46fa:     	nop
1400c46fb:     	movq	%rdx, %r8
1400c46fe:     	movq	%rsi, -0x30(%rbp)
1400c4702:     	leaq	0x58398bf(%rip), %rcx   # 0x1458fdfc8
1400c4709:     	movq	%rcx, 0x290(%rbp)
1400c4710:     	movq	$0x1, 0x298(%rbp)
1400c471b:     	leaq	-0x30(%rbp), %rcx
1400c471f:     	movq	%rcx, 0x2a0(%rbp)
1400c4726:     	leaq	0x5839b23(%rip), %rcx   # 0x1458fe250
1400c472d:     	movq	%rcx, 0x2a8(%rbp)
1400c4734:     	leaq	0x5839a9d(%rip), %rdx   # 0x1458fe1d8
1400c473b:     	movq	%rdx, 0x2b0(%rbp)
1400c4742:     	movq	$0x3, 0x2b8(%rbp)
1400c474d:     	leaq	0x5839b1c(%rip), %rdx   # 0x1458fe270
1400c4754:     	movq	%rdx, 0x2c0(%rbp)
1400c475b:     	movq	%rcx, 0x2c8(%rbp)
1400c4762:     	movb	$0x0, 0x7a7(%rbp)
1400c4769:     	movb	$0x0, 0x7a6(%rbp)
1400c4770:     	movq	$0x2, 0x20(%rsp)
1400c4779:     	leaq	0xf0(%rbp), %rcx
1400c4780:     	leaq	0x290(%rbp), %r9
1400c4787:     	movq	%rax, %rdx
1400c478a:     	callq	0x145452790 <.text+0x5451790>
1400c478f:     	nop
1400c4790:     	movq	0x508(%rbp), %rdx
1400c4797:     	testq	%rdx, %rdx
1400c479a:     	je	0x1400c47ae <.text+0xc37ae>
1400c479c:     	movq	0x510(%rbp), %rcx
1400c47a3:     	movl	$0x1, %r8d
1400c47a9:     	callq	0x1400021d0 <.text+0x11d0>
1400c47ae:     	movq	0x100(%rbp), %rax
1400c47b5:     	leaq	0x4f0(%rbp), %rcx
1400c47bc:     	movq	%rax, 0x28(%rcx)
1400c47c0:     	movups	0xf0(%rbp), %xmm0
1400c47c7:     	movups	%xmm0, 0x18(%rcx)
1400c47cb:     	movb	$0x1, %sil
1400c47ce:     	leaq	-0x30(%rbp), %rcx
1400c47d2:     	leaq	0x490(%rbp), %rdx
1400c47d9:     	movl	$0x108, %r8d            # imm = 0x108
1400c47df:     	callq	0x145756ddd <.text+0x5755ddd>
1400c47e4:     	movq	0x790(%rbp), %rdx
1400c47eb:     	testq	%rdx, %rdx
1400c47ee:     	setne	%al
1400c47f1:     	testb	%al, 0x768(%rbp)
1400c47f7:     	je	0x1400c480b <.text+0xc380b>
1400c47f9:     	movl	$0x1, %r8d
1400c47ff:     	movq	0x750(%rbp), %rcx
1400c4806:     	callq	0x1400021d0 <.text+0x11d0>
1400c480b:     	movq	0x778(%rbp), %rdx
1400c4812:     	testq	%rdx, %rdx
1400c4815:     	sete	%al
1400c4818:     	orb	%al, %sil
1400c481b:     	jne	0x1400c26e6 <.text+0xc16e6>
1400c4821:     	movl	$0x1, %r8d
1400c4827:     	movq	0x758(%rbp), %rcx
1400c482e:     	jmp	0x1400c26e1 <.text+0xc16e1>
1400c4833:     	movq	0x10(%rax), %rax
1400c4837:     	cmpq	$0x4, %rax
1400c483b:     	movl	$0x4, %esi
1400c4840:     	cmovbq	%rax, %rsi
1400c4844:     	jmp	0x1400c4387 <.text+0xc3387>
1400c4849:     	movl	$0x4, %ecx
1400c484e:     	movl	$0x60, %edx
1400c4853:     	callq	0x1458e7201 <.text+0x58e6201>
1400c4858:     	nop
1400c4859:     	jmp	0x1400c4971 <.text+0xc3971>
1400c485e:     	movl	$0x8, %ecx
1400c4863:     	movl	$0x48, %edx
1400c4868:     	callq	0x1458e7201 <.text+0x58e6201>
1400c486d:     	nop
1400c486e:     	jmp	0x1400c4971 <.text+0xc3971>
1400c4873:     	movl	$0x8, %ecx
1400c4878:     	movl	$0x48, %edx
1400c487d:     	callq	0x1458e7201 <.text+0x58e6201>
1400c4882:     	nop
1400c4883:     	jmp	0x1400c4971 <.text+0xc3971>
1400c4888:     	movb	$0x1, 0x7a7(%rbp)
1400c488f:     	movb	$0x1, 0x7a6(%rbp)
1400c4896:     	movl	$0x8, %ecx
1400c489b:     	movl	$0x18, %edx
1400c48a0:     	callq	0x1458e7201 <.text+0x58e6201>
1400c48a5:     	nop
1400c48a6:     	jmp	0x1400c4971 <.text+0xc3971>
1400c48ab:     	movq	0x2a0(%rbp), %rdx
1400c48b2:     	movb	$0x0, 0x7a7(%rbp)
1400c48b9:     	movb	$0x1, 0x7a6(%rbp)
1400c48c0:     	movq	%r13, %rcx
1400c48c3:     	callq	0x1458e721b <.text+0x58e621b>
1400c48c8:     	nop
1400c48c9:     	jmp	0x1400c4971 <.text+0xc3971>
1400c48ce:     	movq	0x2a0(%rbp), %rdx
1400c48d5:     	movb	$0x0, 0x7a7(%rbp)
1400c48dc:     	movb	$0x1, 0x7a6(%rbp)
1400c48e3:     	movq	%rsi, %rcx
1400c48e6:     	callq	0x1458e721b <.text+0x58e621b>
1400c48eb:     	nop
1400c48ec:     	jmp	0x1400c4971 <.text+0xc3971>
1400c48f1:     	movq	0x2a0(%rbp), %rdx
1400c48f8:     	movb	$0x0, 0x7a7(%rbp)
1400c48ff:     	movb	$0x1, 0x7a6(%rbp)
1400c4906:     	movq	%r12, %rcx
1400c4909:     	callq	0x1458e721b <.text+0x58e621b>
1400c490e:     	nop
1400c490f:     	jmp	0x1400c4971 <.text+0xc3971>
1400c4911:     	movq	0x2a0(%rbp), %rdx
1400c4918:     	movb	$0x0, 0x7a7(%rbp)
1400c491f:     	movb	$0x1, 0x7a6(%rbp)
1400c4926:     	movq	%r12, %rcx
1400c4929:     	callq	0x1458e721b <.text+0x58e621b>
1400c492e:     	nop
1400c492f:     	jmp	0x1400c4971 <.text+0xc3971>
1400c4931:     	movq	0x2a0(%rbp), %rdx
1400c4938:     	movb	$0x0, 0x7a7(%rbp)
1400c493f:     	movb	$0x1, 0x7a6(%rbp)
1400c4946:     	movq	0x788(%rbp), %rcx
1400c494d:     	callq	0x1458e721b <.text+0x58e621b>
1400c4952:     	nop
1400c4953:     	jmp	0x1400c4971 <.text+0xc3971>
1400c4955:     	movq	0x2a0(%rbp), %rdx
1400c495c:     	callq	0x1458e721b <.text+0x58e621b>
1400c4961:     	nop
1400c4962:     	jmp	0x1400c4971 <.text+0xc3971>
1400c4964:     	movq	0x2a0(%rbp), %rdx
1400c496b:     	callq	0x1458e721b <.text+0x58e621b>
1400c4970:     	nop
1400c4971:     	ud2
1400c4973:     	movq	%rdx, 0x798(%rbp)
1400c497a:     	movl	$0x1, %ecx
1400c497f:     	movq	%rcx, 0x750(%rbp)
1400c4986:     	movb	$0x1, %cl
1400c4988:     	movl	%ecx, 0x768(%rbp)
1400c498e:     	movq	%r13, 0x780(%rbp)
1400c4995:     	je	0x1400c4a77 <.text+0xc3a77>
1400c499b:     	movq	0x10(%rax), %rax
1400c499f:     	movq	%rax, 0x790(%rbp)
1400c49a6:     	callq	0x140002200 <.text+0x1200>
1400c49ab:     	movl	$0x1, %edx
1400c49b0:     	movq	0x798(%rbp), %r13
1400c49b7:     	movq	%r13, %rcx
1400c49ba:     	callq	0x1400021c0 <.text+0x11c0>
1400c49bf:     	movq	%r13, %rdx
1400c49c2:     	movl	$0x1, %ecx
1400c49c7:     	movq	%rax, 0x788(%rbp)
1400c49ce:     	testq	%rax, %rax
1400c49d1:     	je	0x1400c227f <.text+0xc127f>
1400c49d7:     	movq	0x788(%rbp), %rcx
1400c49de:     	movq	%rdx, %r8
1400c49e1:     	movq	0x790(%rbp), %rdx
1400c49e8:     	callq	0x145756ddd <.text+0x5755ddd>
1400c49ed:     	movl	$0x1, %eax
1400c49f2:     	movq	%rax, 0x750(%rbp)
1400c49f9:     	movq	$0x0, 0x790(%rbp)
1400c4a04:     	jmp	0x1400c4a99 <.text+0xc3a99>
1400c4a09:     	movq	%rsi, 0x748(%rbp)
1400c4a10:     	movq	%rdx, 0x770(%rbp)
1400c4a17:     	je	0x1400c2363 <.text+0xc1363>
1400c4a1d:     	movq	0x10(%rax), %rax
1400c4a21:     	movq	%rax, 0x760(%rbp)
1400c4a28:     	callq	0x140002200 <.text+0x1200>
1400c4a2d:     	movl	$0x1, %esi
1400c4a32:     	movl	$0x1, %edx
1400c4a37:     	movq	0x770(%rbp), %r13
1400c4a3e:     	movq	%r13, %rcx
1400c4a41:     	callq	0x1400021c0 <.text+0x11c0>
1400c4a46:     	movq	%r13, %rdx
1400c4a49:     	testq	%rax, %rax
1400c4a4c:     	je	0x1400c234e <.text+0xc134e>
1400c4a52:     	movq	%rax, %r13
1400c4a55:     	movq	%rax, %rcx
1400c4a58:     	movq	0x760(%rbp), %rdx
1400c4a5f:     	movq	0x770(%rbp), %r8
1400c4a66:     	callq	0x145756ddd <.text+0x5755ddd>
1400c4a6b:     	movq	0x770(%rbp), %rax
1400c4a72:     	jmp	0x1400c2365 <.text+0xc1365>
1400c4a77:     	movq	$0x0, 0x790(%rbp)
1400c4a82:     	movq	$0x0, 0x798(%rbp)
1400c4a8d:     	movl	$0x1, %eax
1400c4a92:     	movq	%rax, 0x788(%rbp)
1400c4a99:     	movq	0x780(%rbp), %r13
1400c4aa0:     	jmp	0x1400c22eb <.text+0xc12eb>
