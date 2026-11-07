1401160d0	push	rbp
1401160d1	push	r15
1401160d3	push	r14
1401160d5	push	r13
1401160d7	push	r12
1401160d9	push	rsi
1401160da	push	rdi
1401160db	push	rbx
1401160dc	sub	rsp, 0x2f8
1401160e3	lea	rbp, [rsp + 0x80]
1401160eb	mov	qword ptr [rbp + 0x270], 0xfffffffffffffffe
1401160f6	mov	rax, qword ptr [rbp + 0x2e8]
1401160fd	mov	rcx, qword ptr [rbp + 0x2e0]
140116104	mov	r15, qword ptr [rdx]
140116107	mov	rdi, qword ptr [rdx + 8]
14011610b	mov	esi, dword ptr [rdx + 0x14]
14011610e	mov	r10, qword ptr [r8]
140116111	mov	r11, qword ptr [r8 + 0x10]
140116115	mov	qword ptr [rbp + 0x238], r11
14011611c	mov	r8d, dword ptr [r8 + 0x1c]
140116120	mov	dword ptr [rbp + 0x264], r8d
140116127	mov	r8, qword ptr [r9]
14011612a	mov	qword ptr [rbp + 0x178], r8
140116131	mov	r8, qword ptr [rcx]
140116134	mov	r9, qword ptr [rcx + 0x10]
140116138	mov	qword ptr [rbp + 0x1a8], r9
14011613f	mov	ecx, dword ptr [rcx + 0x1c]
140116142	mov	dword ptr [rbp + 0x224], ecx
140116148	mov	ecx, esi
14011614a	mov	r9d, esi
14011614d	sub	ecx, dword ptr [rdx + 0x10]
140116150	cmp	ecx, 0xc233b000
140116156	mov	r14d, 0xc233b000
14011615c	cmovb	r14d, ecx
140116160	mov	rax, qword ptr [rax]
140116163	mov	qword ptr [rbp + 0x1b0], rax
14011616a	mov	r12, qword ptr [r15 + 0xf8]
140116171	mov	rax, qword ptr [r15 + 0x100]
140116178	lea	rsi, [r12 + rax*4]
14011617c	movzx	eax, byte ptr [r15 + 0x108]
140116184	mov	byte ptr [rbp + 0x237], al
14011618a	mov	qword ptr [rbp + 0x248], r10
140116191	lea	rax, [r10 + 0x18]
140116195	mov	qword ptr [rbp + 0x228], rax
14011619c	mov	qword ptr [rbp + 0x218], r8
1401161a3	lea	rax, [r8 + 0x120]
1401161aa	mov	qword ptr [rbp + 0x188], rax
1401161b1	xor	r13d, r13d
1401161b4	mov	eax, 8
1401161b9	mov	qword ptr [rbp + 0x180], rax
1401161c0	xor	edx, edx
1401161c2	xor	ebx, ebx
1401161c4	mov	qword ptr [rbp + 0x210], 0
1401161cf	mov	qword ptr [rbp + 0x208], 0
1401161da	mov	qword ptr [rbp + 0x1f8], r15
1401161e1	mov	dword ptr [rbp + 0x1a4], r9d
1401161e8	mov	dword ptr [rbp + 0x26c], r14d
1401161ef	jmp	0x140116213
1401161f1	mov	rax, qword ptr [rbp + 0x238]
1401161f8	mov	ecx, dword ptr [rbp + 0x264]
1401161fe	mov	dword ptr [rax], ecx
140116200	mov	byte ptr [r14 + 0x73], 1
140116205	mov	r14d, dword ptr [rbp + 0x26c]
14011620c	mov	rdx, qword ptr [rbp + 0x240]
140116213	cmp	byte ptr [rbp + 0x237], 0
14011621a	je	0x1401163dd
140116220	jmp	0x14011624e
140116222	nop	word ptr cs:[rax + rax]
140116230	mov	rax, r13
140116233	mov	r10d, ebx
140116236	inc	ebx
140116238	mov	ecx, dword ptr [rbp + 0x1a4]
14011623e	mov	r13, rax
140116241	sub	ecx, dword ptr [rax + r10*4]
140116245	cmp	ecx, r14d
140116248	jb	0x140116540
14011624e	cmp	ebx, edx
140116250	jne	0x140116230
140116252	cmp	r12, rsi
140116255	je	0x140116530
14011625b	mov	r8, rdx
14011625e	mov	ecx, dword ptr [r12]
140116262	add	r12, 4
140116266	mov	rax, qword ptr [rdi + 0x1a8]
14011626d	lea	rdx, [rcx + rcx*8]
140116271	cmp	qword ptr [rax + rdx*8 + 0x10], 0
140116277	je	0x14011629b
140116279	lea	rcx, [rax + rdx*8]
14011627d	lea	rbx, [rax + rdx*8]
140116281	add	rbx, 0x10
140116285	mov	rdx, qword ptr [r15 + 0x110]
14011628c	mov	rax, qword ptr [rcx + 0x40]
140116290	cmp	rdx, rax
140116293	jae	0x140116320
140116299	jmp	0x1401162dc
14011629b	mov	rdx, r8
14011629e	nop
1401162a0	cmp	r12, rsi
1401162a3	je	0x140116530
1401162a9	mov	ecx, dword ptr [r12]
1401162ad	add	r12, 4
1401162b1	mov	rax, qword ptr [rdi + 0x1a8]
1401162b8	lea	rcx, [rcx + rcx*8]
1401162bc	cmp	qword ptr [rax + rcx*8 + 0x10], 0
1401162c2	je	0x1401162a0
1401162c4	lea	rcx, [rax + rcx*8]
1401162c8	lea	rbx, [rcx + 0x10]
1401162cc	mov	rdx, qword ptr [r15 + 0x110]
1401162d3	mov	rax, qword ptr [rcx + 0x40]
1401162d7	cmp	rdx, rax
1401162da	jae	0x140116320
1401162dc	mov	r8, qword ptr [rcx + 0x38]
1401162e0	mov	rdx, qword ptr [r8 + rdx*8]
1401162e4	test	rdx, rdx
1401162e7	je	0x140116320
1401162e9	mov	r8, qword ptr [rcx + 0x18]
1401162ed	not	rdx
1401162f0	lea	rdx, [rdx + rdx*2]
1401162f4	shl	rdx, 4
1401162f8	mov	rdx, qword ptr [r8 + rdx + 0x10]
1401162fd	mov	qword ptr [rbp + 0x208], rdx
140116304	mov	rdx, qword ptr [r15 + 0x118]
14011630b	cmp	rdx, rax
14011630e	jb	0x140116337
140116310	jmp	0x140116370
140116312	nop	word ptr cs:[rax + rax]
140116320	mov	qword ptr [rbp + 0x208], 0
14011632b	mov	rdx, qword ptr [r15 + 0x118]
140116332	cmp	rdx, rax
140116335	jae	0x140116370
140116337	mov	rax, qword ptr [rcx + 0x38]
14011633b	mov	rax, qword ptr [rax + rdx*8]
14011633f	test	rax, rax
140116342	je	0x140116370
140116344	mov	rdx, qword ptr [rcx + 0x18]
140116348	not	rax
14011634b	lea	rax, [rax + rax*2]
14011634f	shl	rax, 4
140116353	mov	rax, qword ptr [rdx + rax + 0x10]
140116358	mov	qword ptr [rbp + 0x210], rax
14011635f	jmp	0x14011637b
140116361	nop	word ptr cs:[rax + rax]
140116370	mov	qword ptr [rbp + 0x210], 0
14011637b	mov	rdx, qword ptr [r15 + 0x120]
140116382	call	0x144e4f270
140116387	mov	rdx, qword ptr [rbx]
14011638a	xor	ebx, ebx
14011638c	jmp	0x140116233
140116391	nop	word ptr cs:[rax + rax]
1401163a0	mov	r8, rdx
1401163a3	mov	rcx, qword ptr [rbp + 0x180]
1401163aa	mov	rax, r13
1401163ad	mov	edx, ebx
1401163af	shl	rdx, 4
1401163b3	inc	ebx
1401163b5	mov	qword ptr [rbp + 0x180], rcx
1401163bc	mov	r10d, dword ptr [rcx + rdx + 8]
1401163c1	not	r10d
1401163c4	mov	ecx, dword ptr [rbp + 0x1a4]
1401163ca	mov	r13, rax
1401163cd	sub	ecx, dword ptr [rax + r10*4]
1401163d1	cmp	ecx, r14d
1401163d4	mov	rdx, r8
1401163d7	jb	0x140116540
1401163dd	cmp	ebx, edx
1401163df	jne	0x1401163a0
1401163e1	cmp	r12, rsi
1401163e4	je	0x140116530
1401163ea	mov	ecx, dword ptr [r12]
1401163ee	add	r12, 4
1401163f2	mov	rax, qword ptr [rdi + 0x108]
1401163f9	lea	rcx, [rcx + rcx*4]
1401163fd	shl	rcx, 5
140116401	cmp	qword ptr [rax + rcx + 0x58], 0
140116407	je	0x140116420
140116409	lea	rbx, [rax + rcx]
14011640d	lea	r13, [rax + rcx]
140116411	add	r13, 0x58
140116415	jmp	0x14011644f
140116417	nop	word ptr [rax + rax]
140116420	cmp	r12, rsi
140116423	je	0x140116530
140116429	mov	eax, dword ptr [r12]
14011642d	add	r12, 4
140116431	mov	rbx, qword ptr [rdi + 0x108]
140116438	lea	rax, [rax + rax*4]
14011643c	shl	rax, 5
140116440	cmp	qword ptr [rbx + rax + 0x58], 0
140116446	je	0x140116420
140116448	add	rbx, rax
14011644b	lea	r13, [rbx + 0x58]
14011644f	mov	eax, dword ptr [rbx + 0x94]
140116455	mov	r8, qword ptr [rdi + 0x1a8]
14011645c	lea	rax, [rax + rax*8]
140116460	lea	rcx, [r8 + rax*8]
140116464	mov	rdx, qword ptr [r15 + 0x110]
14011646b	mov	rax, qword ptr [r8 + rax*8 + 0x40]
140116470	cmp	rdx, rax
140116473	jae	0x1401164b0
140116475	mov	r8, qword ptr [rcx + 0x38]
140116479	mov	rdx, qword ptr [r8 + rdx*8]
14011647d	test	rdx, rdx
140116480	je	0x1401164b0
140116482	mov	r8, qword ptr [rcx + 0x18]
140116486	not	rdx
140116489	lea	rdx, [rdx + rdx*2]
14011648d	shl	rdx, 4
140116491	mov	rdx, qword ptr [r8 + rdx + 0x10]
140116496	mov	qword ptr [rbp + 0x208], rdx
14011649d	mov	rdx, qword ptr [r15 + 0x118]
1401164a4	cmp	rdx, rax
1401164a7	jb	0x1401164c7
1401164a9	jmp	0x140116500
1401164ab	nop	dword ptr [rax + rax]
1401164b0	mov	qword ptr [rbp + 0x208], 0
1401164bb	mov	rdx, qword ptr [r15 + 0x118]
1401164c2	cmp	rdx, rax
1401164c5	jae	0x140116500
1401164c7	mov	rax, qword ptr [rcx + 0x38]
1401164cb	mov	rax, qword ptr [rax + rdx*8]
1401164cf	test	rax, rax
1401164d2	je	0x140116500
1401164d4	mov	rdx, qword ptr [rcx + 0x18]
1401164d8	not	rax
1401164db	lea	rax, [rax + rax*2]
1401164df	shl	rax, 4
1401164e3	mov	rax, qword ptr [rdx + rax + 0x10]
1401164e8	mov	qword ptr [rbp + 0x210], rax
1401164ef	jmp	0x14011650b
1401164f1	nop	word ptr cs:[rax + rax]
140116500	mov	qword ptr [rbp + 0x210], 0
14011650b	mov	rdx, qword ptr [r15 + 0x120]
140116512	call	0x144e4f270
140116517	mov	rcx, qword ptr [rbx + 0x50]
14011651b	mov	r8, qword ptr [r13]
14011651f	xor	ebx, ebx
140116521	jmp	0x1401163ad
140116526	nop	word ptr cs:[rax + rax]
140116530	mov	ebx, edx
140116532	xor	ecx, ecx
140116534	test	rcx, rcx
140116537	jne	0x14011655e
140116539	jmp	0x1401174bb
14011653e	nop
140116540	mov	rcx, qword ptr [rbp + 0x208]
140116547	add	rcx, r10
14011654a	shl	r10, 5
14011654e	add	r10, qword ptr [rbp + 0x210]
140116555	test	rcx, rcx
140116558	je	0x1401174bb
14011655e	cmp	byte ptr [rcx], 0
140116561	jne	0x140116213
140116567	mov	qword ptr [rbp + 0x240], rdx
14011656e	cmp	byte ptr [r10], 5
140116572	jne	0x140116666
140116578	mov	r14, qword ptr [rbp + 0x248]
14011657f	cmp	byte ptr [r14 + 0x73], 0
140116584	je	0x1401161f1
14011658a	mov	rax, qword ptr [rbp + 0x238]
140116591	mov	ecx, dword ptr [rbp + 0x264]
140116597	mov	dword ptr [rax], ecx
140116599	mov	byte ptr [r14 + 0x73], 0
14011659e	mov	rax, qword ptr [rbp + 0x1a8]
1401165a5	mov	ecx, dword ptr [rbp + 0x224]
1401165ab	mov	dword ptr [rax], ecx
1401165ad	mov	rcx, qword ptr [rbp + 0x218]
1401165b4	call	0x1458e5690
1401165b9	test	al, al
1401165bb	je	0x1401165da
1401165bd	mov	dword ptr [rbp + 0x90], 0x12
1401165c7	mov	rcx, qword ptr [rbp + 0x1b0]
1401165ce	lea	rdx, [rbp + 0x90]
1401165d5	call	0x1401838a0
1401165da	mov	rax, qword ptr [rbp + 0x238]
1401165e1	mov	ecx, dword ptr [rbp + 0x264]
1401165e7	mov	dword ptr [rax], ecx
1401165e9	mov	rax, qword ptr [rbp + 0x228]
1401165f0	mov	rax, qword ptr [rax]
1401165f3	cmp	rax, -1
1401165f7	mov	r14d, dword ptr [rbp + 0x26c]
1401165fe	je	0x14011682e
140116604	mov	qword ptr [rbp + 0x258], rax
14011660b	mov	rax, qword ptr [rbp + 0x248]
140116612	mov	rcx, qword ptr [rax + 0x20]
140116616	mov	qword ptr [rbp + 0x250], rcx
14011661d	mov	r14, qword ptr [rax + 0x28]
140116621	test	r14, r14
140116624	je	0x1401167d4
14011662a	mov	rax, qword ptr [rbp + 0x250]
140116631	lea	r15, [rax + 8]
140116635	jmp	0x14011664d
140116637	nop	word ptr [rax + rax]
140116640	add	r15, 0x20
140116644	dec	r14
140116647	je	0x1401167d4
14011664d	mov	rdx, qword ptr [r15 - 8]
140116651	test	rdx, rdx
140116654	je	0x140116640
140116656	mov	rcx, qword ptr [r15]
140116659	mov	r8d, 1
14011665f	call	0x1400021d0
140116664	jmp	0x140116640
140116666	mov	rcx, qword ptr [rbp + 0x238]
14011666d	mov	edx, dword ptr [rbp + 0x264]
140116673	mov	dword ptr [rcx], edx
140116675	mov	r14, qword ptr [rbp + 0x248]
14011667c	mov	byte ptr [r14 + 0x73], 0
140116681	movzx	ecx, byte ptr [r10]
140116685	lea	rdx, [rip + 0x5cc1c64]
14011668c	movsxd	rcx, dword ptr [rdx + rcx*4]
140116690	add	rcx, rdx
140116693	jmp	rcx
140116695	mov	r14, qword ptr [r10 + 8]
140116699	mov	rax, qword ptr [r10 + 0x10]
14011669d	mov	qword ptr [rbp + 0x250], rax
1401166a4	movzx	eax, byte ptr [r10 + 1]
1401166a9	mov	byte ptr [rbp + 0x190], al
1401166af	mov	rdx, qword ptr [rbp + 0x228]
1401166b6	cmp	qword ptr [rdx], -1
1401166ba	je	0x140116f58
1401166c0	lea	rcx, [rbp + 0x90]
1401166c7	call	0x1400af1a0
1401166cc	mov	rdx, qword ptr [rbp + 0x248]
1401166d3	mov	r9, qword ptr [rdx + 0x40]
1401166d7	lea	r10, [r9*4]
1401166df	mov	rax, r9
1401166e2	shr	rax, 0x3e
1401166e6	setne	al
1401166e9	movabs	rcx, 0x7ffffffffffffffc
1401166f3	cmp	r10, rcx
1401166f6	seta	cl
1401166f9	or	cl, al
1401166fb	jne	0x1401174ea
140116701	mov	rdx, qword ptr [rdx + 0x38]
140116705	test	r10, r10
140116708	mov	qword ptr [rbp + 0x258], r14
14011670f	mov	qword ptr [rbp + 0x200], r9
140116716	je	0x14011746b
14011671c	mov	qword ptr [rbp + 0x198], rdx
140116723	mov	r14, r10
140116726	call	0x140002200
14011672b	mov	edx, 4
140116730	mov	rcx, r14
140116733	call	0x1400021c0
140116738	mov	ecx, 4
14011673d	mov	r10, r14
140116740	test	rax, rax
140116743	je	0x1401174ec
140116749	mov	r14, rax
14011674c	mov	r9, qword ptr [rbp + 0x200]
140116753	mov	r11, r9
140116756	mov	r8, qword ptr [rbp + 0x250]
14011675d	mov	rdx, qword ptr [rbp + 0x198]
140116764	test	r9, r9
140116767	je	0x140116790
140116769	mov	rcx, r14
14011676c	mov	r8, r10
14011676f	mov	qword ptr [rbp + 0x198], r11
140116776	call	0x145bfa0e7
14011677b	mov	r11, qword ptr [rbp + 0x198]
140116782	mov	r9, qword ptr [rbp + 0x200]
140116789	mov	r8, qword ptr [rbp + 0x250]
140116790	mov	rcx, qword ptr [rbp + 0xa0]
140116797	mov	qword ptr [rbp + 0x1d0], rcx
14011679e	movups	xmm0, xmmword ptr [rbp + 0x90]
1401167a5	movaps	xmmword ptr [rbp + 0x1c0], xmm0
1401167ac	mov	qword ptr [rbp + 0x1d8], r11
1401167b3	mov	qword ptr [rbp + 0x1e0], r14
1401167ba	mov	qword ptr [rbp + 0x1e8], r9
1401167c1	mov	r14d, dword ptr [rbp + 0x26c]
1401167c8	lea	rcx, [rbp + 0x1c0]
1401167cf	jmp	0x140116f86
1401167d4	mov	rdx, qword ptr [rbp + 0x258]
1401167db	test	rdx, rdx
1401167de	je	0x1401167f6
1401167e0	shl	rdx, 5
1401167e4	mov	r8d, 8
1401167ea	mov	rcx, qword ptr [rbp + 0x250]
1401167f1	call	0x1400021d0
1401167f6	mov	rax, qword ptr [rbp + 0x248]
1401167fd	mov	rdx, qword ptr [rax + 0x30]
140116801	test	rdx, rdx
140116804	mov	r15, qword ptr [rbp + 0x1f8]
14011680b	mov	r14d, dword ptr [rbp + 0x26c]
140116812	je	0x14011682e
140116814	mov	rax, qword ptr [rbp + 0x248]
14011681b	mov	rcx, qword ptr [rax + 0x38]
14011681f	shl	rdx, 2
140116823	mov	r8d, 4
140116829	call	0x1400021d0
14011682e	mov	rax, qword ptr [rbp + 0x228]
140116835	mov	qword ptr [rax], 0xffffffffffffffff
14011683c	mov	rdx, qword ptr [rbp + 0x240]
140116843	jmp	0x140116213
140116848	mov	rax, qword ptr [rbp + 0x238]
14011684f	mov	ecx, dword ptr [rbp + 0x264]
140116855	mov	dword ptr [rax], ecx
140116857	mov	byte ptr [r14 + 0x77], 0xfe
14011685c	jmp	0x140116205
140116861	mov	rax, qword ptr [rbp + 0x238]
140116868	mov	ecx, dword ptr [rbp + 0x264]
14011686e	mov	dword ptr [rax], ecx
140116870	mov	rax, qword ptr [rbp + 0x1a8]
140116877	mov	ecx, dword ptr [rbp + 0x224]
14011687d	mov	dword ptr [rax], ecx
14011687f	mov	rcx, r14
140116882	mov	rdx, qword ptr [rbp + 0x218]
140116889	mov	r8, qword ptr [rbp + 0x1b0]
140116890	call	0x140105ab0
140116895	jmp	0x140116205
14011689a	mov	rax, qword ptr [rbp + 0x238]
1401168a1	mov	ecx, dword ptr [rbp + 0x264]
1401168a7	mov	dword ptr [rax], ecx
1401168a9	mov	rax, qword ptr [rbp + 0x1a8]
1401168b0	mov	ecx, dword ptr [rbp + 0x224]
1401168b6	mov	dword ptr [rax], ecx
1401168b8	mov	rcx, r14
1401168bb	mov	rdx, qword ptr [rbp + 0x218]
1401168c2	mov	r8, qword ptr [rbp + 0x1b0]
1401168c9	call	0x140105ab0
1401168ce	movzx	eax, byte ptr [r14 + 0x77]
1401168d3	cmp	al, 0xfe
1401168d5	mov	r14d, dword ptr [rbp + 0x26c]
1401168dc	mov	rdx, qword ptr [rbp + 0x240]
1401168e3	je	0x140116213
1401168e9	mov	rcx, qword ptr [rbp + 0x238]
1401168f0	mov	edx, dword ptr [rbp + 0x264]
1401168f6	mov	dword ptr [rcx], edx
1401168f8	mov	rcx, qword ptr [rbp + 0x248]
1401168ff	mov	byte ptr [rcx + 0x77], 0xfe
140116903	cmp	al, 0xff
140116905	je	0x140116f48
14011690b	mov	byte ptr [rcx + 0x72], 1
14011690f	mov	byte ptr [rcx + 0x76], al
140116912	cmp	al, 2
140116914	mov	rdx, qword ptr [rbp + 0x240]
14011691b	jne	0x140116213
140116921	mov	rax, qword ptr [rbp + 0x248]
140116928	cmp	byte ptr [rax + 0x48], 0
14011692c	je	0x140116213
140116932	mov	rax, qword ptr [rbp + 0x248]
140116939	mov	edx, dword ptr [rax + 0x4c]
14011693c	lea	rcx, [rbp + 0x90]
140116943	call	0x1459a6c50
140116948	cmp	qword ptr [rbp + 0xa0], 0
140116950	jne	0x140116e71
140116956	mov	rax, qword ptr [rbp + 0x90]
14011695d	test	rax, rax
140116960	je	0x14011697c
140116962	mov	rcx, qword ptr [rbp + 0x98]
140116969	shl	rax, 3
14011696d	lea	rdx, [rax + rax*2]
140116971	mov	r8d, 8
140116977	call	0x1400021d0
14011697c	mov	rdx, qword ptr [rbp + 0x240]
140116983	jmp	0x140116213
140116988	mov	eax, dword ptr [r10 + 4]
14011698c	mov	dword ptr [rbp + 0x250], eax
140116992	mov	rdx, qword ptr [rbp + 0x228]
140116999	cmp	qword ptr [rdx], -1
14011699d	je	0x140116eaa
1401169a3	lea	rcx, [rbp + 0x90]
1401169aa	call	0x1400af1a0
1401169af	mov	rdx, qword ptr [rbp + 0x248]
1401169b6	mov	r14, qword ptr [rdx + 0x40]
1401169ba	lea	r8, [r14*4]
1401169c2	mov	rax, r14
1401169c5	shr	rax, 0x3e
1401169c9	setne	al
1401169cc	movabs	rcx, 0x7ffffffffffffffc
1401169d6	cmp	r8, rcx
1401169d9	seta	cl
1401169dc	or	cl, al
1401169de	jne	0x1401174f7
1401169e4	mov	rdx, qword ptr [rdx + 0x38]
1401169e8	test	r8, r8
1401169eb	je	0x14011744b
1401169f1	mov	qword ptr [rbp + 0x258], rdx
1401169f8	call	0x140002200
1401169fd	mov	edx, 4
140116a02	lea	rcx, [r14*4]
140116a0a	call	0x1400021c0
140116a0f	mov	ecx, 4
140116a14	lea	r8, [r14*4]
140116a1c	test	rax, rax
140116a1f	je	0x1401174f9
140116a25	mov	r9, rax
140116a28	mov	rax, r14
140116a2b	mov	rcx, r14
140116a2e	mov	rdx, qword ptr [rbp + 0x258]
140116a35	mov	qword ptr [rbp + 0x258], rax
140116a3c	test	rax, rax
140116a3f	je	0x140116a6b
140116a41	mov	qword ptr [rbp + 0x200], rcx
140116a48	mov	rcx, r9
140116a4b	mov	r14, r8
140116a4e	mov	qword ptr [rbp + 0x190], r9
140116a55	call	0x145bfa0e7
140116a5a	mov	rcx, qword ptr [rbp + 0x200]
140116a61	mov	r9, qword ptr [rbp + 0x190]
140116a68	mov	r8, r14
140116a6b	mov	rax, qword ptr [rbp + 0xa0]
140116a72	mov	qword ptr [rbp + 0x1d0], rax
140116a79	movups	xmm0, xmmword ptr [rbp + 0x90]
140116a80	movaps	xmmword ptr [rbp + 0x1c0], xmm0
140116a87	mov	qword ptr [rbp + 0x1d8], rcx
140116a8e	mov	qword ptr [rbp + 0x1e0], r9
140116a95	mov	rax, qword ptr [rbp + 0x258]
140116a9c	mov	qword ptr [rbp + 0x1e8], rax
140116aa3	mov	r14d, dword ptr [rbp + 0x26c]
140116aaa	mov	qword ptr [rbp + 0x258], rax
140116ab1	test	rax, rax
140116ab4	jne	0x140116ee6
140116aba	jmp	0x140116f09
140116abf	mov	rcx, qword ptr [rbp + 0x178]
140116ac6	movzx	r8d, byte ptr [rcx + 0x38]
140116acb	movzx	r9d, byte ptr [rcx + 0x39]
140116ad0	mov	rax, qword ptr [r10 + 4]
140116ad4	mov	qword ptr [rbp + 0x250], rax
140116adb	lea	rcx, [rbp - 0x58]
140116adf	mov	r14, qword ptr [rbp + 0x218]
140116ae6	mov	rdx, r14
140116ae9	call	0x1458a3e40
140116aee	mov	rax, qword ptr [rbp + 0x250]
140116af5	mov	qword ptr [rbp + 0x38], rax
140116af9	mov	rax, qword ptr [rbp + 0x1a8]
140116b00	mov	ecx, dword ptr [rbp + 0x224]
140116b06	mov	dword ptr [rax], ecx
140116b08	mov	r8d, 0xe8
140116b0e	lea	rcx, [rbp + 0x90]
140116b15	lea	rdx, [rbp - 0x58]
140116b19	call	0x145bfa0e7
140116b1e	mov	rcx, r14
140116b21	lea	rdx, [rbp + 0x90]
140116b28	call	0x14589c590
140116b2d	mov	r8d, 0xe8
140116b33	lea	rcx, [rbp + 0x90]
140116b3a	mov	r14, rcx
140116b3d	lea	rdx, [rbp - 0x58]
140116b41	call	0x145bfa0e7
140116b46	mov	rcx, qword ptr [rbp + 0x1b0]
140116b4d	mov	rdx, r14
140116b50	call	0x1401838a0
140116b55	jmp	0x140116205
140116b5a	mov	rax, qword ptr [r10 + 8]
140116b5e	mov	rcx, qword ptr [rbp + 0x238]
140116b65	mov	edx, dword ptr [rbp + 0x264]
140116b6b	mov	dword ptr [rcx], edx
140116b6d	mov	qword ptr [r14 + 0x68], rax
140116b71	jmp	0x140116205
140116b76	mov	rax, qword ptr [rbp + 0x238]
140116b7d	mov	ecx, dword ptr [rbp + 0x264]
140116b83	mov	dword ptr [rax], ecx
140116b85	mov	r14, qword ptr [rbp + 0x228]
140116b8c	mov	rax, qword ptr [r14]
140116b8f	cmp	rax, -1
140116b93	je	0x140116d89
140116b99	mov	qword ptr [rbp + 0x258], rax
140116ba0	mov	rax, qword ptr [rbp + 0x248]
140116ba7	mov	rcx, qword ptr [rax + 0x20]
140116bab	mov	qword ptr [rbp + 0x250], rcx
140116bb2	mov	r14, qword ptr [rax + 0x28]
140116bb6	test	r14, r14
140116bb9	je	0x140116d2f
140116bbf	mov	rax, qword ptr [rbp + 0x250]
140116bc6	lea	r15, [rax + 8]
140116bca	jmp	0x140116bdd
140116bcc	nop	dword ptr [rax]
140116bd0	add	r15, 0x20
140116bd4	dec	r14
140116bd7	je	0x140116d2f
140116bdd	mov	rdx, qword ptr [r15 - 8]
140116be1	test	rdx, rdx
140116be4	je	0x140116bd0
140116be6	mov	rcx, qword ptr [r15]
140116be9	mov	r8d, 1
140116bef	call	0x1400021d0
140116bf4	jmp	0x140116bd0
140116bf6	movzx	eax, byte ptr [r10 + 1]
140116bfb	mov	rcx, qword ptr [rbp + 0x238]
140116c02	mov	edx, dword ptr [rbp + 0x264]
140116c08	mov	dword ptr [rcx], edx
140116c0a	mov	byte ptr [r14 + 0x74], al
140116c0e	jmp	0x140116205
140116c13	mov	rax, qword ptr [rbp + 0x238]
140116c1a	mov	ecx, dword ptr [rbp + 0x264]
140116c20	mov	dword ptr [rax], ecx
140116c22	mov	rax, qword ptr [rbp + 0x228]
140116c29	mov	rax, qword ptr [rax]
140116c2c	cmp	rax, -1
140116c30	je	0x140116de1
140116c36	mov	qword ptr [rbp + 0x258], rax
140116c3d	mov	rax, qword ptr [r14 + 0x20]
140116c41	mov	qword ptr [rbp + 0x250], rax
140116c48	mov	r14, qword ptr [r14 + 0x28]
140116c4c	test	r14, r14
140116c4f	je	0x140116d95
140116c55	mov	rax, qword ptr [rbp + 0x250]
140116c5c	lea	r15, [rax + 8]
140116c60	jmp	0x140116c7d
140116c62	nop	word ptr cs:[rax + rax]
140116c70	add	r15, 0x20
140116c74	dec	r14
140116c77	je	0x140116d95
140116c7d	mov	rdx, qword ptr [r15 - 8]
140116c81	test	rdx, rdx
140116c84	je	0x140116c70
140116c86	mov	rcx, qword ptr [r15]
140116c89	mov	r8d, 1
140116c8f	call	0x1400021d0
140116c94	jmp	0x140116c70
140116c96	mov	rax, qword ptr [r10 + 8]
140116c9a	mov	qword ptr [rbp + 0x250], rax
140116ca1	mov	rax, qword ptr [r10 + 0x10]
140116ca5	mov	qword ptr [rbp + 0x258], rax
140116cac	mov	r14, qword ptr [r10 + 0x18]
140116cb0	mov	qword ptr [rbp + 0x98], 0
140116cbb	mov	qword ptr [rbp + 0xa0], 2
140116cc6	mov	rax, qword ptr [rbp + 0x218]
140116ccd	mov	qword ptr [rbp + 0x90], rax
140116cd4	lea	rcx, [rbp + 0x1c0]
140116cdb	lea	rdx, [rbp + 0x90]
140116ce2	call	0x1400a8190
140116ce7	test	r14, r14
140116cea	js	0x1401174cf
140116cf0	je	0x1401172ca
140116cf6	call	0x140002200
140116cfb	mov	edx, 1
140116d00	mov	rcx, r14
140116d03	call	0x1400021c0
140116d08	test	rax, rax
140116d0b	je	0x14011756e
140116d11	mov	qword ptr [rbp + 0x1b8], rax
140116d18	mov	rcx, rax
140116d1b	mov	rdx, qword ptr [rbp + 0x258]
140116d22	mov	r8, r14
140116d25	call	0x145bfa0e7
140116d2a	jmp	0x1401172d6
140116d2f	mov	rdx, qword ptr [rbp + 0x258]
140116d36	test	rdx, rdx
140116d39	je	0x140116d51
140116d3b	shl	rdx, 5
140116d3f	mov	r8d, 8
140116d45	mov	rcx, qword ptr [rbp + 0x250]
140116d4c	call	0x1400021d0
140116d51	mov	rax, qword ptr [rbp + 0x248]
140116d58	mov	rdx, qword ptr [rax + 0x30]
140116d5c	test	rdx, rdx
140116d5f	mov	r15, qword ptr [rbp + 0x1f8]
140116d66	mov	r14, qword ptr [rbp + 0x228]
140116d6d	je	0x140116d89
140116d6f	mov	rax, qword ptr [rbp + 0x248]
140116d76	mov	rcx, qword ptr [rax + 0x38]
140116d7a	shl	rdx, 2
140116d7e	mov	r8d, 4
140116d84	call	0x1400021d0
140116d89	mov	qword ptr [r14], 0xffffffffffffffff
140116d90	jmp	0x140116205
140116d95	mov	rdx, qword ptr [rbp + 0x258]
140116d9c	test	rdx, rdx
140116d9f	je	0x140116db7
140116da1	shl	rdx, 5
140116da5	mov	r8d, 8
140116dab	mov	rcx, qword ptr [rbp + 0x250]
140116db2	call	0x1400021d0
140116db7	mov	r14, qword ptr [rbp + 0x248]
140116dbe	mov	rdx, qword ptr [r14 + 0x30]
140116dc2	test	rdx, rdx
140116dc5	mov	r15, qword ptr [rbp + 0x1f8]
140116dcc	je	0x140116de1
140116dce	mov	rcx, qword ptr [r14 + 0x38]
140116dd2	shl	rdx, 2
140116dd6	mov	r8d, 4
140116ddc	call	0x1400021d0
140116de1	mov	qword ptr [r14 + 0x18], 0xffffffffffffffff
140116de9	movzx	eax, byte ptr [r14 + 0x77]
140116dee	cmp	al, 0xfe
140116df0	mov	r14d, dword ptr [rbp + 0x26c]
140116df7	mov	rdx, qword ptr [rbp + 0x240]
140116dfe	je	0x140116213
140116e04	mov	rcx, qword ptr [rbp + 0x238]
140116e0b	mov	edx, dword ptr [rbp + 0x264]
140116e11	mov	dword ptr [rcx], edx
140116e13	mov	rcx, qword ptr [rbp + 0x248]
140116e1a	mov	byte ptr [rcx + 0x77], 0xfe
140116e1e	cmp	al, 0xff
140116e20	je	0x140116f48
140116e26	mov	byte ptr [rcx + 0x72], 1
140116e2a	mov	byte ptr [rcx + 0x76], al
140116e2d	cmp	al, 2
140116e2f	mov	rdx, qword ptr [rbp + 0x240]
140116e36	jne	0x140116213
140116e3c	mov	rax, qword ptr [rbp + 0x248]
140116e43	cmp	byte ptr [rax + 0x48], 0
140116e47	je	0x140116213
140116e4d	mov	rax, qword ptr [rbp + 0x248]
140116e54	mov	edx, dword ptr [rax + 0x4c]
140116e57	lea	rcx, [rbp + 0x90]
140116e5e	call	0x1459a6c50
140116e63	cmp	qword ptr [rbp + 0xa0], 0
140116e6b	je	0x140117489
140116e71	mov	rax, qword ptr [rbp + 0x90]
140116e78	mov	rcx, qword ptr [rbp + 0x98]
140116e7f	mov	r14, qword ptr [rcx]
140116e82	test	rax, rax
140116e85	je	0x140116e9a
140116e87	shl	rax, 3
140116e8b	lea	rdx, [rax + rax*2]
140116e8f	mov	r8d, 8
140116e95	call	0x1400021d0
140116e9a	mov	rax, qword ptr [rbp + 0x248]
140116ea1	mov	qword ptr [rax + 0x50], r14
140116ea5	jmp	0x140116205
140116eaa	lea	rcx, [rbp + 0x1c0]
140116eb1	mov	rdx, qword ptr [rbp + 0x218]
140116eb8	call	0x1458d7400
140116ebd	mov	r9, qword ptr [rbp + 0x1e0]
140116ec4	mov	rax, qword ptr [rbp + 0x1e8]
140116ecb	lea	r8, [rax*4]
140116ed3	mov	r14d, dword ptr [rbp + 0x26c]
140116eda	mov	qword ptr [rbp + 0x258], rax
140116ee1	test	rax, rax
140116ee4	je	0x140116f09
140116ee6	xor	eax, eax
140116ee8	nop	dword ptr [rax + rax]
140116ef0	mov	ecx, dword ptr [rbp + 0x250]
140116ef6	cmp	dword ptr [r9 + rax], ecx
140116efa	je	0x14011713f
140116f00	add	rax, 4
140116f04	cmp	r8, rax
140116f07	jne	0x140116ef0
140116f09	mov	rax, qword ptr [rbp + 0x258]
140116f10	cmp	rax, qword ptr [rbp + 0x1d8]
140116f17	jne	0x140116f2d
140116f19	lea	rcx, [rbp + 0x1d8]
140116f20	call	0x145c2e940
140116f25	nop
140116f26	mov	r9, qword ptr [rbp + 0x1e0]
140116f2d	mov	rcx, qword ptr [rbp + 0x258]
140116f34	mov	eax, dword ptr [rbp + 0x250]
140116f3a	mov	dword ptr [r9 + rcx*4], eax
140116f3e	mov	eax, 1
140116f43	jmp	0x140117176
140116f48	mov	byte ptr [rcx + 0x72], 0
140116f4c	mov	rdx, qword ptr [rbp + 0x240]
140116f53	jmp	0x140116213
140116f58	mov	qword ptr [rbp + 0x258], r14
140116f5f	lea	r14, [rbp + 0x1c0]
140116f66	mov	rcx, r14
140116f69	mov	rdx, qword ptr [rbp + 0x218]
140116f70	call	0x1458d7400
140116f75	mov	rcx, r14
140116f78	mov	r14d, dword ptr [rbp + 0x26c]
140116f7f	mov	r8, qword ptr [rbp + 0x250]
140116f86	mov	rdx, qword ptr [rbp + 0x258]
140116f8d	call	0x1458d7520
140116f92	mov	byte ptr [rbp + 0x200], al
140116f98	mov	rcx, qword ptr [rbp + 0x258]
140116f9f	mov	rdx, qword ptr [rbp + 0x250]
140116fa6	call	0x1458e54e0
140116fab	nop
140116fac	mov	rdx, qword ptr [rbp + 0x258]
140116fb3	test	rax, rax
140116fb6	je	0x140116fe3
140116fb8	movzx	eax, byte ptr [rax + 0x38]
140116fbc	test	al, al
140116fbe	js	0x140117504
140116fc4	movzx	ecx, byte ptr [rbp + 0x200]
140116fcb	add	cl, byte ptr [rbp + 0x190]
140116fd1	js	0x140116ff4
140116fd3	movzx	ecx, cl
140116fd6	movzx	r9d, al
140116fda	cmp	cl, r9b
140116fdd	cmovb	r9d, ecx
140116fe1	jmp	0x140116ff7
140116fe3	xor	eax, eax
140116fe5	movzx	ecx, byte ptr [rbp + 0x200]
140116fec	add	cl, byte ptr [rbp + 0x190]
140116ff2	jns	0x140116fd3
140116ff4	xor	r9d, r9d
140116ff7	lea	rcx, [rbp + 0x1c0]
140116ffe	mov	r8, qword ptr [rbp + 0x250]
140117005	call	0x1458d8500
14011700a	nop
14011700b	movaps	xmm0, xmmword ptr [rbp + 0x1c0]
140117012	movaps	xmm1, xmmword ptr [rbp + 0x1d0]
140117019	movaps	xmm2, xmmword ptr [rbp + 0x1e0]
140117020	movaps	xmmword ptr [rbp + 0xb0], xmm2
140117027	movaps	xmmword ptr [rbp + 0xa0], xmm1
14011702e	movaps	xmmword ptr [rbp + 0x90], xmm0
140117035	mov	rax, qword ptr [rbp + 0x238]
14011703c	mov	ecx, dword ptr [rbp + 0x264]
140117042	mov	dword ptr [rax], ecx
140117044	mov	rax, qword ptr [rbp + 0x228]
14011704b	mov	rax, qword ptr [rax]
14011704e	cmp	rax, -1
140117052	je	0x14011710c
140117058	mov	qword ptr [rbp + 0x258], rax
14011705f	mov	rax, qword ptr [rbp + 0x248]
140117066	mov	rcx, qword ptr [rax + 0x20]
14011706a	mov	qword ptr [rbp + 0x250], rcx
140117071	mov	r14, qword ptr [rax + 0x28]
140117075	test	r14, r14
140117078	je	0x1401170b2
14011707a	mov	rax, qword ptr [rbp + 0x250]
140117081	lea	r15, [rax + 8]
140117085	jmp	0x140117099
140117087	nop	word ptr [rax + rax]
140117090	add	r15, 0x20
140117094	dec	r14
140117097	je	0x1401170b2
140117099	mov	rdx, qword ptr [r15 - 8]
14011709d	test	rdx, rdx
1401170a0	je	0x140117090
1401170a2	mov	rcx, qword ptr [r15]
1401170a5	mov	r8d, 1
1401170ab	call	0x1400021d0
1401170b0	jmp	0x140117090
1401170b2	mov	rdx, qword ptr [rbp + 0x258]
1401170b9	test	rdx, rdx
1401170bc	je	0x1401170d4
1401170be	shl	rdx, 5
1401170c2	mov	r8d, 8
1401170c8	mov	rcx, qword ptr [rbp + 0x250]
1401170cf	call	0x1400021d0
1401170d4	mov	rax, qword ptr [rbp + 0x248]
1401170db	mov	rdx, qword ptr [rax + 0x30]
1401170df	test	rdx, rdx
1401170e2	mov	r15, qword ptr [rbp + 0x1f8]
1401170e9	mov	r14d, dword ptr [rbp + 0x26c]
1401170f0	je	0x14011710c
1401170f2	mov	rax, qword ptr [rbp + 0x248]
1401170f9	mov	rcx, qword ptr [rax + 0x38]
1401170fd	shl	rdx, 2
140117101	mov	r8d, 4
140117107	call	0x1400021d0
14011710c	movaps	xmm0, xmmword ptr [rbp + 0x90]
140117113	movaps	xmm1, xmmword ptr [rbp + 0xa0]
14011711a	movaps	xmm2, xmmword ptr [rbp + 0xb0]
140117121	mov	rax, qword ptr [rbp + 0x228]
140117128	movups	xmmword ptr [rax + 0x20], xmm2
14011712c	movups	xmmword ptr [rax + 0x10], xmm1
140117130	movups	xmmword ptr [rax], xmm0
140117133	mov	rdx, qword ptr [rbp + 0x240]
14011713a	jmp	0x140116213
14011713f	lea	rdx, [r9 + rax]
140117143	add	rdx, 4
140117147	add	r9, rax
14011714a	mov	rcx, qword ptr [rbp + 0x258]
140117151	lea	r8, [rcx*4]
140117159	sub	r8, rax
14011715c	add	r8, -4
140117160	mov	rcx, r9
140117163	call	0x145bfa0ed
140117168	mov	rcx, qword ptr [rbp + 0x258]
14011716f	mov	rax, 0xffffffffffffffff
140117176	add	rcx, rax
140117179	mov	qword ptr [rbp + 0x1e8], rcx
140117180	mov	rax, qword ptr [rbp + 0x1e0]
140117187	mov	qword ptr [rbp + 0xb0], rax
14011718e	mov	rax, qword ptr [rbp + 0x1e8]
140117195	mov	qword ptr [rbp + 0xb8], rax
14011719c	movaps	xmm0, xmmword ptr [rbp + 0x1c0]
1401171a3	movaps	xmm1, xmmword ptr [rbp + 0x1d0]
1401171aa	movaps	xmmword ptr [rbp + 0xa0], xmm1
1401171b1	movaps	xmmword ptr [rbp + 0x90], xmm0
1401171b8	mov	rax, qword ptr [rbp + 0x238]
1401171bf	mov	ecx, dword ptr [rbp + 0x264]
1401171c5	mov	dword ptr [rax], ecx
1401171c7	mov	rax, qword ptr [rbp + 0x228]
1401171ce	mov	rax, qword ptr [rax]
1401171d1	cmp	rax, -1
1401171d5	je	0x14011728c
1401171db	mov	qword ptr [rbp + 0x258], rax
1401171e2	mov	rax, qword ptr [rbp + 0x248]
1401171e9	mov	rcx, qword ptr [rax + 0x20]
1401171ed	mov	qword ptr [rbp + 0x250], rcx
1401171f4	mov	r14, qword ptr [rax + 0x28]
1401171f8	test	r14, r14
1401171fb	je	0x140117232
1401171fd	mov	rax, qword ptr [rbp + 0x250]
140117204	lea	r15, [rax + 8]
140117208	jmp	0x140117219
14011720a	nop	word ptr [rax + rax]
140117210	add	r15, 0x20
140117214	dec	r14
140117217	je	0x140117232
140117219	mov	rdx, qword ptr [r15 - 8]
14011721d	test	rdx, rdx
140117220	je	0x140117210
140117222	mov	rcx, qword ptr [r15]
140117225	mov	r8d, 1
14011722b	call	0x1400021d0
140117230	jmp	0x140117210
140117232	mov	rdx, qword ptr [rbp + 0x258]
140117239	test	rdx, rdx
14011723c	je	0x140117254
14011723e	shl	rdx, 5
140117242	mov	r8d, 8
140117248	mov	rcx, qword ptr [rbp + 0x250]
14011724f	call	0x1400021d0
140117254	mov	rax, qword ptr [rbp + 0x248]
14011725b	mov	rdx, qword ptr [rax + 0x30]
14011725f	test	rdx, rdx
140117262	mov	r15, qword ptr [rbp + 0x1f8]
140117269	mov	r14d, dword ptr [rbp + 0x26c]
140117270	je	0x14011728c
140117272	mov	rax, qword ptr [rbp + 0x248]
140117279	mov	rcx, qword ptr [rax + 0x38]
14011727d	shl	rdx, 2
140117281	mov	r8d, 4
140117287	call	0x1400021d0
14011728c	movaps	xmm0, xmmword ptr [rbp + 0x90]
140117293	movaps	xmm1, xmmword ptr [rbp + 0xa0]
14011729a	mov	rax, qword ptr [rbp + 0xb0]
1401172a1	mov	rcx, qword ptr [rbp + 0x228]
1401172a8	mov	qword ptr [rcx + 0x20], rax
1401172ac	mov	rax, qword ptr [rbp + 0xb8]
1401172b3	mov	qword ptr [rcx + 0x28], rax
1401172b7	movups	xmmword ptr [rcx + 0x10], xmm1
1401172bb	movups	xmmword ptr [rcx], xmm0
1401172be	mov	rdx, qword ptr [rbp + 0x240]
1401172c5	jmp	0x140116213
1401172ca	mov	eax, 1
1401172cf	mov	qword ptr [rbp + 0x1b8], rax
1401172d6	lea	r15, [rbp + 0x90]
1401172dd	mov	qword ptr [rbp + 0x258], r14
1401172e4	xor	ecx, ecx
1401172e6	cmp	qword ptr [rbp + 0x250], 0
1401172ee	setne	cl
1401172f1	mov	rdx, qword ptr [rbp + 0x1d0]
1401172f8	cmp	rdx, rcx
1401172fb	jbe	0x14011755f
140117301	mov	rax, qword ptr [rbp + 0x1c8]
140117308	lea	rcx, [rcx + rcx*2]
14011730c	lea	r14, [rax + rcx*8]
140117310	mov	rdx, qword ptr [rax + rcx*8]
140117314	test	rdx, rdx
140117317	je	0x140117328
140117319	mov	rcx, qword ptr [r14 + 8]
14011731d	mov	r8d, 1
140117323	call	0x1400021d0
140117328	mov	rcx, qword ptr [rbp + 0x258]
14011732f	mov	qword ptr [r14], rcx
140117332	mov	rax, qword ptr [rbp + 0x1b8]
140117339	mov	qword ptr [r14 + 8], rax
14011733d	mov	qword ptr [r14 + 0x10], rcx
140117341	mov	byte ptr [rbp + 0x26b], 1
140117348	mov	rcx, r15
14011734b	lea	rdx, [rbp + 0x1c0]
140117352	call	0x1400ad9d0
140117357	nop
140117358	mov	rax, qword ptr [rbp + 0x1a8]
14011735f	mov	ecx, dword ptr [rbp + 0x224]
140117365	mov	dword ptr [rax], ecx
140117367	mov	rax, qword ptr [rbp + 0x218]
14011736e	mov	r14, qword ptr [rax + 0x130]
140117375	test	r14, r14
140117378	je	0x1401173b2
14011737a	mov	rax, qword ptr [rbp + 0x218]
140117381	mov	r15, qword ptr [rax + 0x128]
140117388	add	r15, 8
14011738c	jmp	0x140117399
14011738e	nop
140117390	add	r15, 0x18
140117394	dec	r14
140117397	je	0x1401173b2
140117399	mov	rdx, qword ptr [r15 - 8]
14011739d	test	rdx, rdx
1401173a0	je	0x140117390
1401173a2	mov	rcx, qword ptr [r15]
1401173a5	mov	r8d, 1
1401173ab	call	0x1400021d0
1401173b0	jmp	0x140117390
1401173b2	mov	rax, qword ptr [rbp + 0x188]
1401173b9	mov	rax, qword ptr [rax]
1401173bc	test	rax, rax
1401173bf	je	0x1401173e2
1401173c1	mov	rcx, qword ptr [rbp + 0x218]
1401173c8	mov	rcx, qword ptr [rcx + 0x128]
1401173cf	shl	rax, 3
1401173d3	lea	rdx, [rax + rax*2]
1401173d7	mov	r8d, 8
1401173dd	call	0x1400021d0
1401173e2	mov	rax, qword ptr [rbp + 0xa0]
1401173e9	mov	rcx, qword ptr [rbp + 0x188]
1401173f0	mov	qword ptr [rcx + 0x10], rax
1401173f4	movups	xmm0, xmmword ptr [rbp + 0x90]
1401173fb	movups	xmmword ptr [rcx], xmm0
1401173fe	mov	rax, qword ptr [rbp + 0x1d0]
140117405	lea	rcx, [rbp + 0x98]
14011740c	mov	qword ptr [rcx + 0x10], rax
140117410	movups	xmm0, xmmword ptr [rbp + 0x1c0]
140117417	movups	xmmword ptr [rcx], xmm0
14011741a	mov	dword ptr [rbp + 0x90], 0x13
140117424	mov	byte ptr [rbp + 0x26b], 0
14011742b	mov	rcx, qword ptr [rbp + 0x1b0]
140117432	lea	rdx, [rbp + 0x90]
140117439	call	0x1401838a0
14011743e	nop
14011743f	mov	r15, qword ptr [rbp + 0x1f8]
140117446	jmp	0x140116205
14011744b	mov	r9d, 4
140117451	mov	rax, r14
140117454	xor	ecx, ecx
140117456	mov	qword ptr [rbp + 0x258], rax
14011745d	test	rax, rax
140117460	jne	0x140116a41
140117466	jmp	0x140116a6b
14011746b	mov	r14d, 4
140117471	xor	r11d, r11d
140117474	mov	r8, qword ptr [rbp + 0x250]
14011747b	test	r9, r9
14011747e	jne	0x140116769
140117484	jmp	0x140116790
140117489	mov	rax, qword ptr [rbp + 0x90]
140117490	test	rax, rax
140117493	je	0x1401174af
140117495	mov	rcx, qword ptr [rbp + 0x98]
14011749c	shl	rax, 3
1401174a0	lea	rdx, [rax + rax*2]
1401174a4	mov	r8d, 8
1401174aa	call	0x1400021d0
1401174af	mov	rdx, qword ptr [rbp + 0x240]
1401174b6	jmp	0x140116213
1401174bb	add	rsp, 0x2f8
1401174c2	pop	rbx
1401174c3	pop	rdi
1401174c4	pop	rsi
1401174c5	pop	r12
1401174c7	pop	r13
1401174c9	pop	r14
1401174cb	pop	r15
1401174cd	pop	rbp
1401174ce	ret
1401174cf	xor	ecx, ecx
1401174d1	mov	byte ptr [rbp + 0x26b], 1
1401174d8	mov	rdx, qword ptr [rbp + 0x1b8]
1401174df	call	0x145d992bb
1401174e4	nop
1401174e5	jmp	0x14011756c
1401174ea	xor	ecx, ecx
1401174ec	mov	rdx, r10
1401174ef	call	0x145d992bb
1401174f4	nop
1401174f5	jmp	0x14011756c
1401174f7	xor	ecx, ecx
1401174f9	mov	rdx, r8
1401174fc	call	0x145d992bb
140117501	nop
140117502	jmp	0x14011756c
140117504	mov	byte ptr [rbp + 0x236], 0
14011750b	mov	byte ptr [rbp + 0x235], al
140117511	lea	rax, [rbp + 0x236]
140117518	mov	qword ptr [rbp + 0x90], rax
14011751f	lea	rax, [rip + 0x2a0a]
140117526	mov	qword ptr [rbp + 0x98], rax
14011752d	lea	rcx, [rbp + 0x235]
140117534	mov	qword ptr [rbp + 0xa0], rcx
14011753b	mov	qword ptr [rbp + 0xa8], rax
140117542	lea	rcx, [rip + 0x5cbf61e]
140117549	lea	r8, [rip + 0x5cbf308]
140117550	lea	rdx, [rbp + 0x90]
140117557	call	0x145d99830
14011755c	nop
14011755d	jmp	0x14011756c
14011755f	lea	r8, [rip + 0x5cbf30a]
140117566	call	0x145d99653
14011756b	nop
14011756c	ud2
14011756e	mov	qword ptr [rbp + 0x1b8], r14
140117575	mov	ecx, 1
14011757a	jmp	0x1401174d1
