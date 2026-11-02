0000000140241544: mov rdx, qword ptr [rbx + 0x20]
0000000140241548: lea rcx, [rbp + 0x520]
000000014024154f: call 0x145bc5b50
0000000140241554: nop
0000000140241555: cmp byte ptr [rdi], 1
0000000140241558: jne 0x14024157a
000000014024155a: mov eax, dword ptr [rdi + 1]
000000014024155d: mov ecx, dword ptr [rdi + 4]
0000000140241560: mov dword ptr [rbp + 0x4f3], ecx
0000000140241566: mov dword ptr [rbp + 0x4f0], eax
000000014024156c: mov rsi, qword ptr [rdi + 8]
0000000140241570: movzx r12d, byte ptr [rdi + 0x10]
0000000140241575: mov r15b, 1
0000000140241578: jmp 0x14024158b
000000014024157a: mov rsi, qword ptr [rdi + 8]
000000014024157e: lock inc qword ptr [rsi]
0000000140241582: jle 0x140242583
0000000140241588: xor r15d, r15d
000000014024158b: mov eax, dword ptr [rbp + 0x330]
0000000140241591: mov dword ptr [rbp + 0x851], eax
0000000140241597: movaps xmm0, xmmword ptr [rbp + 0x320]
000000014024159e: movups xmmword ptr [rbp + 0x841], xmm0
00000001402415a5: movups xmm0, xmmword ptr [rbp + 0x520]
00000001402415ac: movups xmmword ptr [rbp + 0x210], xmm0
00000001402415b3: mov rax, qword ptr [rbp + 0x530]
00000001402415ba: mov qword ptr [rbp + 0x220], rax
00000001402415c1: mov eax, dword ptr [rbp + 0x4f0]
00000001402415c7: mov ecx, dword ptr [rbp + 0x4f3]
00000001402415cd: mov dword ptr [rbp + 0x76c], ecx
00000001402415d3: mov dword ptr [rbp + 0x769], eax
00000001402415d9: movups xmm0, xmmword ptr [rbp + 0x840]
00000001402415e0: movups xmmword ptr [rbp + 0x787], xmm0
00000001402415e7: mov rax, qword ptr [rbp + 0x84d]
00000001402415ee: mov qword ptr [rbp + 0x794], rax
00000001402415f5: lea rdx, [rbp + 0x340]
00000001402415fc: mov r8d, 0x180
0000000140241602: mov rcx, r14
0000000140241605: call 0x145bf293b
000000014024160a: lea rcx, [rbp + 0x5b8]
0000000140241611: mov r8d, 0x198
0000000140241617: mov rdx, r14
000000014024161a: call 0x145bf293b
000000014024161f: mov qword ptr [rbp + 0x750], 0
000000014024162a: mov qword ptr [rbp + 0x758], 4
0000000140241635: mov qword ptr [rbp + 0x760], 0
0000000140241640: mov byte ptr [rbp + 0x768], r15b
0000000140241647: mov qword ptr [rbp + 0x770], rsi
000000014024164e: mov qword ptr [rbp + 0x778], r12
0000000140241655: mov dword ptr [rbp + 0x780], 0x41a80000
000000014024165f: mov word ptr [rbp + 0x784], 0x190
0000000140241668: mov byte ptr [rbp + 0x786], 1
000000014024166f: movdqu xmm0, xmmword ptr [rip + 0x5b926dd]
0000000140241677: movdqu xmmword ptr [rbp + 0x79c], xmm0
000000014024167f: mov dword ptr [rbp + 0x7ac], r13d
0000000140241686: movq qword ptr [rbp + 0x7b0], xmm13
000000014024168f: mov word ptr [rbp + 0x7b8], 1
0000000140241698: mov r14, qword ptr [rbp + 0x5a8]
000000014024169f: mov qword ptr [rbp + 0x5b0], r14
00000001402416a6: lea rcx, [rbp + 0x340]
00000001402416ad: lea r8, [rbp + 0x5b0]
00000001402416b4: lea rsi, [rbp + 0x68]
00000001402416b8: mov rdx, rsi
00000001402416bb: call 0x1402114d0
