14006cfcf	f3410f6f64f8e8	movdqu	xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
14006cfd6	660f74e2	pcmpeqb	xmm4, xmm2
14006cfda	660fd7dc	pmovmskb	ebx, xmm4
14006cfde	81fbffff0000	cmp	ebx, 0xffff
14006cfe4	0f84e3000000	je	0x14006d0cd
