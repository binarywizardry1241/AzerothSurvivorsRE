
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d1f51:     	movsd	0x5be3ed6(%rip), %xmm10 # 0x145db5e30
1401d1f5a:     	movq	0x610(%rbp), %rax
1401d1f61:     	movq	(%rax), %rdi
1401d1f64:     	movq	0x2e8(%rbp), %rax
1401d1f6b:     	movq	(%rax), %rbx
1401d1f6e:     	movq	0x8(%rax), %r14
1401d1f72:     	movapd	%xmm8, %xmm0
1401d1f77:     	maxsd	%xmm12, %xmm0
1401d1f7c:     	movsd	%xmm0, 0x5f8(%rbp)
1401d1f84:     	movsd	0x5bcbe34(%rip), %xmm1  # 0x145d9ddc0
1401d1f8c:     	ucomisd	%xmm0, %xmm1
1401d1f90:     	jbe	0x1401d1fd0 <.text+0x1d0fd0>
1401d1f92:     	leaq	0x5f8(%rbp), %rax
1401d1f99:     	movq	%rax, 0x300(%rbp)
1401d1fa0:     	leaq	0x59dbb69(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d1fa7:     	movq	%rax, 0x308(%rbp)
1401d1fae:     	leaq	0x250(%rbp), %rcx
1401d1fb5:     	leaq	0x5be4a22(%rip), %rdx   # 0x145db69de
1401d1fbc:     	jmp	0x1401d2057 <.text+0x1d1057>
1401d1fc1:     	nopw	%cs:(%rax,%rax)
1401d1fd0:     	ucomisd	%xmm0, %xmm10
1401d1fd5:     	jbe	0x1401d2020 <.text+0x1d1020>
1401d1fd7:     	divsd	0x5bcbde1(%rip), %xmm0  # 0x145d9ddc0
1401d1fdf:     	movsd	%xmm0, 0x520(%rbp)
1401d1fe7:     	leaq	0x520(%rbp), %rax
1401d1fee:     	movq	%rax, 0x300(%rbp)
1401d1ff5:     	leaq	0x59dbb14(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d1ffc:     	movq	%rax, 0x308(%rbp)
1401d2003:     	leaq	0x250(%rbp), %rcx
1401d200a:     	leaq	0x5be49c3(%rip), %rdx   # 0x145db69d4
1401d2011:     	jmp	0x1401d2057 <.text+0x1d1057>
1401d2013:     	nopw	%cs:(%rax,%rax)
1401d2020:     	divsd	%xmm10, %xmm0
1401d2025:     	movsd	%xmm0, 0x520(%rbp)
1401d202d:     	leaq	0x520(%rbp), %rax
1401d2034:     	movq	%rax, 0x300(%rbp)
1401d203b:     	leaq	0x59dbace(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d2042:     	movq	%rax, 0x308(%rbp)
1401d2049:     	leaq	0x250(%rbp), %rcx
1401d2050:     	leaq	0x5be4973(%rip), %rdx   # 0x145db69ca
1401d2057:     	leaq	0x300(%rbp), %r8
1401d205e:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401d2063:     	divsd	(%rbx), %xmm8
1401d2068:     	maxsd	%xmm12, %xmm8
1401d206d:     	movsd	%xmm8, 0x5e0(%rbp)
1401d2076:     	movsd	0x5bcbd42(%rip), %xmm0  # 0x145d9ddc0
1401d207e:     	ucomisd	%xmm8, %xmm0
1401d2083:     	jbe	0x1401d20d0 <.text+0x1d10d0>
1401d2085:     	leaq	0x5e0(%rbp), %rax
1401d208c:     	movq	%rax, 0x300(%rbp)
1401d2093:     	leaq	0x59dba76(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d209a:     	movq	%rax, 0x308(%rbp)
1401d20a1:     	leaq	0x520(%rbp), %rcx
1401d20a8:     	leaq	0x5be492f(%rip), %rdx   # 0x145db69de
1401d20af:     	leaq	0x300(%rbp), %r8
1401d20b6:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401d20bb:     	nop
1401d20bc:     	movups	0x5be6884(%rip), %xmm12 # 0x145db8948
1401d20c4:     	jmp	0x1401d2175 <.text+0x1d1175>
1401d20c9:     	nopl	(%rax)
1401d20d0:     	ucomisd	%xmm8, %xmm10
1401d20d5:     	movups	0x5be686b(%rip), %xmm12 # 0x145db8948
1401d20dd:     	jbe	0x1401d2130 <.text+0x1d1130>
1401d20df:     	divsd	0x5bcbcd8(%rip), %xmm8  # 0x145d9ddc0
1401d20e8:     	movsd	%xmm8, 0x5f8(%rbp)
1401d20f1:     	leaq	0x5f8(%rbp), %rax
1401d20f8:     	movq	%rax, 0x300(%rbp)
1401d20ff:     	leaq	0x59dba0a(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d2106:     	movq	%rax, 0x308(%rbp)
1401d210d:     	leaq	0x520(%rbp), %rcx
1401d2114:     	leaq	0x5be48b9(%rip), %rdx   # 0x145db69d4
1401d211b:     	leaq	0x300(%rbp), %r8
1401d2122:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401d2127:     	nop
1401d2128:     	jmp	0x1401d2175 <.text+0x1d1175>
1401d212a:     	nopw	(%rax,%rax)
1401d2130:     	divsd	%xmm10, %xmm8
1401d2135:     	movsd	%xmm8, 0x5f8(%rbp)
1401d213e:     	leaq	0x5f8(%rbp), %rax
1401d2145:     	movq	%rax, 0x300(%rbp)
1401d214c:     	leaq	0x59db9bd(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d2153:     	movq	%rax, 0x308(%rbp)
1401d215a:     	leaq	0x520(%rbp), %rcx
1401d2161:     	leaq	0x5be4862(%rip), %rdx   # 0x145db69ca
1401d2168:     	leaq	0x300(%rbp), %r8
1401d216f:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401d2174:     	nop
1401d2175:     	movups	0x5be67eb(%rip), %xmm8  # 0x145db8968
1401d217d:     	movsd	(%r14), %xmm0
1401d2182:     	maxsd	0x5bcbc26(%rip), %xmm0  # 0x145d9ddb0
1401d218a:     	divsd	%xmm0, %xmm11
1401d218f:     	movsd	%xmm11, 0x5e0(%rbp)
1401d2198:     	leaq	0x250(%rbp), %rax
1401d219f:     	movq	%rax, 0x300(%rbp)
1401d21a6:     	leaq	-0x1d00cd(%rip), %rcx   # 0x1400020e0 <.text+0x10e0>
1401d21ad:     	movq	%rcx, 0x308(%rbp)
1401d21b4:     	leaq	0x520(%rbp), %rax
1401d21bb:     	movq	%rax, 0x310(%rbp)
1401d21c2:     	movq	%rcx, 0x318(%rbp)
1401d21c9:     	leaq	0x5e0(%rbp), %rax
1401d21d0:     	movq	%rax, 0x320(%rbp)
1401d21d7:     	leaq	0x59db932(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d21de:     	movq	%rax, 0x328(%rbp)
1401d21e5:     	leaq	0x5f8(%rbp), %rcx
1401d21ec:     	leaq	0x5be90ef(%rip), %rdx   # 0x145dbb2e2
1401d21f3:     	leaq	0x300(%rbp), %r8
1401d21fa:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401d21ff:     	nop
1401d2200:     	movq	0x520(%rbp), %rdx
1401d2207:     	testq	%rdx, %rdx
1401d220a:     	movq	0x2c8(%rbp), %r14
1401d2211:     	je	0x1401d2225 <.text+0x1d1225>
