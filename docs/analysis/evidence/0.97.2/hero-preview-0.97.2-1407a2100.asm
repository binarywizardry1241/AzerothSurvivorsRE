
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407a2100:     	pushq	%rsi
1407a2101:     	pushq	%rdi
1407a2102:     	subq	$0x28, %rsp
1407a2106:     	movl	0x71fda3c(%rip), %eax   # 0x14799fb48
1407a210c:     	testl	%eax, %eax
1407a210e:     	jne	0x1407a2155 <.text+0x7a1155>
1407a2110:     	movb	$0x1, %dl
1407a2112:     	xorl	%eax, %eax
1407a2114:     	lock
1407a2115:     	cmpxchgb	%dl, 0x71fd94c(%rip)    # 0x14799fa68
1407a211c:     	jne	0x1407a2178 <.text+0x7a1178>
1407a211e:     	movq	0x7244c83(%rip), %rsi   # 0x1479e6da8
1407a2125:     	movq	(%rsi), %rax
1407a2128:     	shlq	%rax
1407a212b:     	testq	%rax, %rax
1407a212e:     	jne	0x1407a218f <.text+0x7a118f>
1407a2130:     	xorl	%eax, %eax
1407a2132:     	movzbl	0x71fd930(%rip), %edx   # 0x14799fa69
1407a2139:     	movzbl	0x71fd930(%rip), %edx   # 0x14799fa70
1407a2140:     	cmpb	$0x2, %dl
1407a2143:     	jne	0x1407a21af <.text+0x7a11af>
1407a2145:     	movb	$0x2, (%rcx)
1407a2148:     	testb	%al, %al
1407a214a:     	je	0x1407a2210 <.text+0x7a1210>
1407a2150:     	jmp	0x1407a221b <.text+0x7a121b>
1407a2155:     	leaq	0x71fd90c(%rip), %rax   # 0x14799fa68
1407a215c:     	movq	%rcx, %rsi
1407a215f:     	movq	%rax, %rcx
1407a2162:     	callq	0x145762bfa <.text+0x5761bfa>
1407a2167:     	movq	%rsi, %rcx
1407a216a:     	movb	$0x1, %dl
1407a216c:     	xorl	%eax, %eax
1407a216e:     	lock
1407a216f:     	cmpxchgb	%dl, 0x71fd8f2(%rip)    # 0x14799fa68
1407a2176:     	je	0x1407a211e <.text+0x7a111e>
1407a2178:     	leaq	0x71fd8e9(%rip), %rax   # 0x14799fa68
1407a217f:     	movq	%rcx, %rsi
1407a2182:     	movq	%rax, %rcx
1407a2185:     	callq	0x1458e58c0 <.text+0x58e48c0>
1407a218a:     	movq	%rsi, %rcx
1407a218d:     	jmp	0x1407a211e <.text+0x7a111e>
1407a218f:     	movq	%rcx, %rdi
1407a2192:     	callq	0x1458e6650 <.text+0x58e5650>
1407a2197:     	movq	%rdi, %rcx
1407a219a:     	xorb	$0x1, %al
1407a219c:     	movzbl	0x71fd8c6(%rip), %edx   # 0x14799fa69
1407a21a3:     	movzbl	0x71fd8c6(%rip), %edx   # 0x14799fa70
1407a21aa:     	cmpb	$0x2, %dl
1407a21ad:     	je	0x1407a2145 <.text+0x7a1145>
1407a21af:     	testb	$0x1, %dl
1407a21b2:     	je	0x1407a21d4 <.text+0x7a11d4>
1407a21b4:     	movl	0x71fd8ba(%rip), %edx   # 0x14799fa74
1407a21ba:     	movl	%edx, 0x23(%rsp)
1407a21be:     	movl	0x71fd8ad(%rip), %edx   # 0x14799fa71
1407a21c4:     	movl	%edx, 0x20(%rsp)
1407a21c8:     	movzbl	0x71fd8b1(%rip), %edx   # 0x14799fa80
1407a21cf:     	movb	$0x1, %r8b
1407a21d2:     	jmp	0x1407a21e8 <.text+0x7a11e8>
1407a21d4:     	movq	0x71fd89d(%rip), %rdx   # 0x14799fa78
1407a21db:     	lock
1407a21dc:     	incq	(%rdx)
1407a21df:     	jle	0x1407a2265 <.text+0x7a1265>
1407a21e5:     	xorl	%r8d, %r8d
1407a21e8:     	movq	0x71fd889(%rip), %r9    # 0x14799fa78
1407a21ef:     	movb	%r8b, (%rcx)
1407a21f2:     	movl	0x20(%rsp), %r8d
1407a21f7:     	movl	0x23(%rsp), %r10d
1407a21fc:     	movl	%r8d, 0x1(%rcx)
1407a2200:     	movl	%r10d, 0x4(%rcx)
1407a2204:     	movq	%r9, 0x8(%rcx)
1407a2208:     	movq	%rdx, 0x10(%rcx)
1407a220c:     	testb	%al, %al
1407a220e:     	jne	0x1407a221b <.text+0x7a121b>
1407a2210:     	movq	(%rsi), %rax
1407a2213:     	shlq	%rax
1407a2216:     	testq	%rax, %rax
1407a2219:     	jne	0x1407a224d <.text+0x7a124d>
1407a221b:     	xorl	%eax, %eax
1407a221d:     	xchgb	%al, 0x71fd845(%rip)    # 0x14799fa68
1407a2223:     	cmpb	$0x2, %al
1407a2225:     	je	0x1407a2231 <.text+0x7a1231>
1407a2227:     	movq	%rcx, %rax
1407a222a:     	addq	$0x28, %rsp
1407a222e:     	popq	%rdi
1407a222f:     	popq	%rsi
1407a2230:     	retq
1407a2231:     	leaq	0x71fd830(%rip), %rax   # 0x14799fa68
1407a2238:     	movq	%rcx, %rsi
1407a223b:     	movq	%rax, %rcx
1407a223e:     	callq	0x1458e5980 <.text+0x58e4980>
1407a2243:     	movq	%rsi, %rax
1407a2246:     	addq	$0x28, %rsp
1407a224a:     	popq	%rdi
1407a224b:     	popq	%rsi
1407a224c:     	retq
1407a224d:     	movq	%rcx, %rsi
1407a2250:     	callq	0x1458e6650 <.text+0x58e5650>
1407a2255:     	movq	%rsi, %rcx
1407a2258:     	testb	%al, %al
1407a225a:     	jne	0x1407a221b <.text+0x7a121b>
1407a225c:     	movb	$0x1, 0x71fd806(%rip)   # 0x14799fa69
1407a2263:     	jmp	0x1407a221b <.text+0x7a121b>
1407a2265:     	ud2
