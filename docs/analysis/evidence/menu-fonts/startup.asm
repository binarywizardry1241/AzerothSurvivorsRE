0x145891530: push rbp
0x145891531: push rsi
0x145891532: sub rsp, 0x88
0x145891539: lea rbp, [rsp + 0x80]
0x145891541: mov qword ptr [rbp], 0xfffffffffffffffe
0x145891549: mov rsi, r9
0x14589154c: mov qword ptr [rbp - 0x10], r8
0x145891550: mov qword ptr [rbp - 0x20], rdx
0x145891554: mov qword ptr [rbp - 0x18], rcx
0x145891558: mov byte ptr [rbp - 1], 1
0x14589155c: call 0x1458ecea0
0x145891561: nop
0x145891562: mov byte ptr [rbp - 1], 1
0x145891566: call 0x1458fc5c0
0x14589156b: nop
0x14589156c: mov rax, qword ptr [rip + 0x27fbb5d]
0x145891573: cmp rax, 0xd
0x145891577: mov ecx, 0xd
0x14589157c: cmovb rcx, rax
0x145891580: imul rax, rcx, 0x38
0x145891584: lea rcx, [rip + 0x163e1cd]
0x14589158b: mov rcx, qword ptr [rax + rcx]
0x14589158f: mov byte ptr [rbp - 1], 1
0x145891593: mov edx, 2
0x145891598: call 0x1458f8a60
0x14589159d: nop
0x14589159e: mov byte ptr [rbp - 1], 1
0x1458915a2: call 0x1459127d0
0x1458915a7: nop
0x1458915a8: mov byte ptr [rbp - 1], 1
0x1458915ac: call 0x1458eec90
0x1458915b1: nop
0x1458915b2: mov byte ptr [rbp - 1], 1
0x1458915b6: call 0x1458ee5d0
0x1458915bb: nop
0x1458915bc: mov byte ptr [rbp - 1], 1
0x1458915c0: call 0x1459a7290
0x1458915c5: nop
0x1458915c6: mov byte ptr [rbp - 1], 1
0x1458915ca: call 0x145913db0
0x1458915cf: nop
0x1458915d0: mov byte ptr [rbp - 1], 1
0x1458915d4: call 0x1458fd2e0
0x1458915d9: nop
0x1458915da: mov rcx, qword ptr [rbp - 0x10]
0x1458915de: mov rax, qword ptr [rcx + 0x30]
0x1458915e2: mov qword ptr [rbp - 0x30], rax
0x1458915e6: movups xmm0, xmmword ptr [rcx]
0x1458915e9: movups xmm1, xmmword ptr [rcx + 0x10]
0x1458915ed: movups xmm2, xmmword ptr [rcx + 0x20]
0x1458915f1: movaps xmmword ptr [rbp - 0x40], xmm2
0x1458915f5: movaps xmmword ptr [rbp - 0x50], xmm1
0x1458915f9: movaps xmmword ptr [rbp - 0x60], xmm0
0x1458915fd: mov byte ptr [rbp - 1], 0
0x145891601: lea r8, [rbp - 0x60]
0x145891605: mov rcx, qword ptr [rbp - 0x18]
0x145891609: mov rdx, qword ptr [rbp - 0x20]
0x14589160d: mov r9, rsi
0x145891610: call 0x1458d05c0
0x145891615: nop
0x145891616: mov byte ptr [rbp - 1], 0
0x14589161a: mov rcx, rax
0x14589161d: call 0x1458eea30
0x145891622: nop
0x145891623: add rsp, 0x88
0x14589162a: pop rsi
0x14589162b: pop rbp
0x14589162c: ret
