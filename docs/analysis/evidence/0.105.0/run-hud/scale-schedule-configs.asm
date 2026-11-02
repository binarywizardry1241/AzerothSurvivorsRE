
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14006cdd0:     	pushq	%rbp
14006cdd1:     	pushq	%rsi
14006cdd2:     	pushq	%rdi
14006cdd3:     	subq	$0x3a0, %rsp            # imm = 0x3A0
14006cdda:     	leaq	0x80(%rsp), %rbp
14006cde2:     	movq	$-0x2, 0x318(%rbp)
14006cded:     	movq	%rcx, %rsi
14006cdf0:     	callq	0x140002200 <.text+0x1200>
14006cdf5:     	movl	$0x2a0, %ecx            # imm = 0x2A0
14006cdfa:     	movl	$0x8, %edx
14006cdff:     	callq	0x1400021c0 <.text+0x11c0>
14006ce04:     	testq	%rax, %rax
14006ce07:     	je	0x14006d220 <.text+0x6c220>
14006ce0d:     	movq	%rax, 0x310(%rbp)
14006ce14:     	movq	$-0x1, 0xb0(%rbp)
14006ce1f:     	movl	$0x0, -0x60(%rbp)
14006ce26:     	movb	$0x0, -0x5c(%rbp)
14006ce2a:     	callq	0x140002200 <.text+0x1200>
14006ce2f:     	movl	$0x140, %ecx            # imm = 0x140
14006ce34:     	movl	$0x8, %edx
14006ce39:     	callq	0x1400021c0 <.text+0x11c0>
14006ce3e:     	testq	%rax, %rax
14006ce41:     	je	0x14006d231 <.text+0x6c231>
14006ce47:     	movq	%rax, %rdi
14006ce4a:     	leaq	-0x60(%rbp), %rdx
14006ce4e:     	movl	$0x140, %r8d            # imm = 0x140
14006ce54:     	movq	%rax, %rcx
14006ce57:     	callq	0x145bc977b <.text+0x5bc877b>
14006ce5c:     	nop
14006ce5d:     	leaq	0x5d05b9c(%rip), %r8    # 0x145d72a00
14006ce64:     	leaq	0x2a0(%rbp), %rcx
14006ce6b:     	movq	%rdi, %rdx
14006ce6e:     	callq	0x144e09040 <.text+0x4e08040>
14006ce73:     	nop
14006ce74:     	callq	0x140002200 <.text+0x1200>
14006ce79:     	movl	$0xc, %ecx
14006ce7e:     	movl	$0x4, %edx
14006ce83:     	callq	0x1400021c0 <.text+0x11c0>
14006ce88:     	testq	%rax, %rax
14006ce8b:     	je	0x14006d243 <.text+0x6c243>
14006ce91:     	movl	$0x0, (%rax)
14006ce97:     	movb	$0x0, 0x4(%rax)
14006ce9b:     	movb	$-0x1, 0x8(%rax)
14006ce9f:     	leaq	0x5d05d52(%rip), %r8    # 0x145d72bf8
14006cea6:     	leaq	0x230(%rbp), %rcx
14006cead:     	movq	%rax, %rdx
14006ceb0:     	callq	0x144e09040 <.text+0x4e08040>
14006ceb5:     	nop
14006ceb6:     	callq	0x140002200 <.text+0x1200>
14006cebb:     	movl	$0xc, %ecx
14006cec0:     	movl	$0x4, %edx
14006cec5:     	callq	0x1400021c0 <.text+0x11c0>
14006ceca:     	testq	%rax, %rax
14006cecd:     	je	0x14006d255 <.text+0x6c255>
14006ced3:     	movl	$0x0, (%rax)
14006ced9:     	movb	$0x0, 0x4(%rax)
14006cedd:     	movb	$-0x1, 0x8(%rax)
14006cee1:     	leaq	0x5d06100(%rip), %r8    # 0x145d72fe8
14006cee8:     	leaq	0x1c0(%rbp), %rcx
14006ceef:     	movq	%rax, %rdx
14006cef2:     	callq	0x144e09040 <.text+0x4e08040>
14006cef7:     	nop
14006cef8:     	callq	0x140002200 <.text+0x1200>
14006cefd:     	movl	$0xc, %ecx
14006cf02:     	movl	$0x4, %edx
14006cf07:     	callq	0x1400021c0 <.text+0x11c0>
14006cf0c:     	testq	%rax, %rax
14006cf0f:     	je	0x14006d267 <.text+0x6c267>
14006cf15:     	movl	$0x0, (%rax)
14006cf1b:     	movb	$0x0, 0x4(%rax)
14006cf1f:     	movb	$0x2, 0x8(%rax)
14006cf23:     	leaq	0x5d05f6e(%rip), %r8    # 0x145d72e98
14006cf2a:     	leaq	0x150(%rbp), %rcx
14006cf31:     	movq	%rax, %rdx
14006cf34:     	callq	0x144e09040 <.text+0x4e08040>
14006cf39:     	nop
14006cf3a:     	callq	0x140002200 <.text+0x1200>
14006cf3f:     	movl	$0xc, %ecx
14006cf44:     	movl	$0x4, %edx
14006cf49:     	callq	0x1400021c0 <.text+0x11c0>
14006cf4e:     	testq	%rax, %rax
14006cf51:     	je	0x14006d279 <.text+0x6c279>
14006cf57:     	movl	$0x0, (%rax)
14006cf5d:     	movb	$0x0, 0x4(%rax)
14006cf61:     	movb	$0x2, 0x8(%rax)
14006cf65:     	leaq	0x5d06124(%rip), %r8    # 0x145d73090
14006cf6c:     	leaq	0xe0(%rbp), %rcx
14006cf73:     	movq	%rax, %rdx
14006cf76:     	callq	0x144e09040 <.text+0x4e08040>
14006cf7b:     	nop
14006cf7c:     	callq	0x140002200 <.text+0x1200>
14006cf81:     	movl	$0xc, %ecx
14006cf86:     	movl	$0x4, %edx
14006cf8b:     	callq	0x1400021c0 <.text+0x11c0>
14006cf90:     	testq	%rax, %rax
14006cf93:     	je	0x14006d28b <.text+0x6c28b>
14006cf99:     	movl	$0x0, (%rax)
14006cf9f:     	movb	$0x0, 0x4(%rax)
14006cfa3:     	movb	$0x0, 0x8(%rax)
14006cfa7:     	leaq	0x5d0618a(%rip), %r8    # 0x145d73138
14006cfae:     	leaq	-0x60(%rbp), %rcx
14006cfb2:     	movq	%rax, %rdx
14006cfb5:     	callq	0x144e09040 <.text+0x4e08040>
14006cfba:     	nop
14006cfbb:     	movups	0x300(%rbp), %xmm0
14006cfc2:     	movq	0x310(%rbp), %rax
14006cfc9:     	movups	%xmm0, 0x60(%rax)
14006cfcd:     	movups	0x2f0(%rbp), %xmm0
14006cfd4:     	movups	%xmm0, 0x50(%rax)
14006cfd8:     	movups	0x2e0(%rbp), %xmm0
14006cfdf:     	movups	%xmm0, 0x40(%rax)
14006cfe3:     	movups	0x2a0(%rbp), %xmm0
14006cfea:     	movups	0x2b0(%rbp), %xmm1
14006cff1:     	movups	0x2c0(%rbp), %xmm2
14006cff8:     	movups	0x2d0(%rbp), %xmm3
14006cfff:     	movups	%xmm3, 0x30(%rax)
14006d003:     	movups	%xmm2, 0x20(%rax)
14006d007:     	movups	%xmm1, 0x10(%rax)
14006d00b:     	movups	%xmm0, (%rax)
14006d00e:     	movups	0x230(%rbp), %xmm0
14006d015:     	movups	0x240(%rbp), %xmm1
14006d01c:     	movups	0x250(%rbp), %xmm2
14006d023:     	movups	0x260(%rbp), %xmm3
14006d02a:     	movups	%xmm0, 0x70(%rax)
14006d02e:     	movups	%xmm1, 0x80(%rax)
14006d035:     	movups	%xmm2, 0x90(%rax)
14006d03c:     	movups	%xmm3, 0xa0(%rax)
14006d043:     	movups	0x270(%rbp), %xmm0
14006d04a:     	movups	%xmm0, 0xb0(%rax)
14006d051:     	movups	0x280(%rbp), %xmm0
14006d058:     	movups	%xmm0, 0xc0(%rax)
14006d05f:     	movups	0x290(%rbp), %xmm0
14006d066:     	movups	%xmm0, 0xd0(%rax)
14006d06d:     	movups	0x220(%rbp), %xmm0
14006d074:     	movups	%xmm0, 0x140(%rax)
14006d07b:     	movups	0x210(%rbp), %xmm0
14006d082:     	movups	%xmm0, 0x130(%rax)
14006d089:     	movups	0x200(%rbp), %xmm0
14006d090:     	movups	%xmm0, 0x120(%rax)
14006d097:     	movups	0x1c0(%rbp), %xmm0
14006d09e:     	movups	0x1d0(%rbp), %xmm1
14006d0a5:     	movups	0x1e0(%rbp), %xmm2
14006d0ac:     	movups	0x1f0(%rbp), %xmm3
14006d0b3:     	movups	%xmm3, 0x110(%rax)
14006d0ba:     	movups	%xmm2, 0x100(%rax)
14006d0c1:     	movups	%xmm1, 0xf0(%rax)
14006d0c8:     	movups	%xmm0, 0xe0(%rax)
14006d0cf:     	movups	0x150(%rbp), %xmm0
14006d0d6:     	movups	0x160(%rbp), %xmm1
14006d0dd:     	movups	0x170(%rbp), %xmm2
14006d0e4:     	movups	0x180(%rbp), %xmm3
14006d0eb:     	movups	%xmm0, 0x150(%rax)
14006d0f2:     	movups	%xmm1, 0x160(%rax)
14006d0f9:     	movups	%xmm2, 0x170(%rax)
14006d100:     	movups	%xmm3, 0x180(%rax)
14006d107:     	movups	0x190(%rbp), %xmm0
14006d10e:     	movups	%xmm0, 0x190(%rax)
14006d115:     	movups	0x1a0(%rbp), %xmm0
14006d11c:     	movups	%xmm0, 0x1a0(%rax)
14006d123:     	movups	0x1b0(%rbp), %xmm0
14006d12a:     	movups	%xmm0, 0x1b0(%rax)
14006d131:     	movups	0xe0(%rbp), %xmm0
14006d138:     	movups	0xf0(%rbp), %xmm1
14006d13f:     	movups	0x100(%rbp), %xmm2
14006d146:     	movups	0x110(%rbp), %xmm3
14006d14d:     	movups	%xmm0, 0x1c0(%rax)
14006d154:     	movups	%xmm1, 0x1d0(%rax)
14006d15b:     	movups	%xmm2, 0x1e0(%rax)
14006d162:     	movups	%xmm3, 0x1f0(%rax)
14006d169:     	movups	0x120(%rbp), %xmm0
14006d170:     	movups	%xmm0, 0x200(%rax)
14006d177:     	movups	0x140(%rbp), %xmm0
14006d17e:     	movups	%xmm0, 0x220(%rax)
14006d185:     	movups	0x130(%rbp), %xmm0
14006d18c:     	movups	%xmm0, 0x210(%rax)
14006d193:     	movups	(%rbp), %xmm0
14006d197:     	movups	%xmm0, 0x290(%rax)
14006d19e:     	movups	-0x10(%rbp), %xmm0
14006d1a2:     	movups	%xmm0, 0x280(%rax)
14006d1a9:     	movups	-0x20(%rbp), %xmm0
14006d1ad:     	movups	%xmm0, 0x270(%rax)
14006d1b4:     	movups	-0x60(%rbp), %xmm0
14006d1b8:     	movups	-0x50(%rbp), %xmm1
14006d1bc:     	movups	-0x40(%rbp), %xmm2
14006d1c0:     	movups	-0x30(%rbp), %xmm3
14006d1c4:     	movups	%xmm3, 0x260(%rax)
14006d1cb:     	movups	%xmm2, 0x250(%rax)
14006d1d2:     	movups	%xmm0, 0x230(%rax)
14006d1d9:     	movups	%xmm1, 0x240(%rax)
14006d1e0:     	movq	$0x6, 0x8(%rsi)
14006d1e8:     	movq	%rax, 0x10(%rsi)
14006d1ec:     	movq	$0x6, 0x18(%rsi)
14006d1f4:     	movq	$0x0, 0x20(%rsi)
14006d1fc:     	movq	$0x8, 0x28(%rsi)
14006d204:     	xorps	%xmm0, %xmm0
14006d207:     	movups	%xmm0, 0x30(%rsi)
14006d20b:     	movq	$-0x1, (%rsi)
14006d212:     	movq	%rsi, %rax
14006d215:     	addq	$0x3a0, %rsp            # imm = 0x3A0
14006d21c:     	popq	%rdi
14006d21d:     	popq	%rsi
14006d21e:     	popq	%rbp
14006d21f:     	retq
14006d220:     	movl	$0x8, %ecx
14006d225:     	movl	$0x2a0, %edx            # imm = 0x2A0
14006d22a:     	callq	0x145d69431 <.text+0x5d68431>
14006d22f:     	ud2
14006d231:     	movl	$0x8, %ecx
14006d236:     	movl	$0x140, %edx            # imm = 0x140
14006d23b:     	callq	0x145d69431 <.text+0x5d68431>
14006d240:     	nop
14006d241:     	jmp	0x14006d29b <.text+0x6c29b>
14006d243:     	movl	$0x4, %ecx
14006d248:     	movl	$0xc, %edx
14006d24d:     	callq	0x145d69431 <.text+0x5d68431>
14006d252:     	nop
14006d253:     	jmp	0x14006d29b <.text+0x6c29b>
14006d255:     	movl	$0x4, %ecx
14006d25a:     	movl	$0xc, %edx
14006d25f:     	callq	0x145d69431 <.text+0x5d68431>
14006d264:     	nop
14006d265:     	jmp	0x14006d29b <.text+0x6c29b>
14006d267:     	movl	$0x4, %ecx
14006d26c:     	movl	$0xc, %edx
14006d271:     	callq	0x145d69431 <.text+0x5d68431>
14006d276:     	nop
14006d277:     	jmp	0x14006d29b <.text+0x6c29b>
14006d279:     	movl	$0x4, %ecx
14006d27e:     	movl	$0xc, %edx
14006d283:     	callq	0x145d69431 <.text+0x5d68431>
14006d288:     	nop
14006d289:     	jmp	0x14006d29b <.text+0x6c29b>
14006d28b:     	movl	$0x4, %ecx
14006d290:     	movl	$0xc, %edx
14006d295:     	callq	0x145d69431 <.text+0x5d68431>
14006d29a:     	nop
14006d29b:     	ud2
