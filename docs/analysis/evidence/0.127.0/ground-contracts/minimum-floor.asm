145ba16b0: push r15
145ba16b2: push r14
145ba16b4: push r13
145ba16b6: push r12
145ba16b8: push rsi
145ba16b9: push rdi
145ba16ba: push rbp
145ba16bb: push rbx
145ba16bc: sub rsp, 0x38
145ba16c0: movaps xmmword ptr [rsp + 0x20], xmm6
145ba16c5: movaps xmm0, xmm2
145ba16c8: movaps xmm6, xmm1
145ba16cb: mov rsi, rcx
145ba16ce: subss xmm0, dword ptr [rcx + 0x3c]
145ba16d3: addss xmm0, xmm0
145ba16d7: call 0x14606179f
145ba16dc: cvttss2si edi, xmm0
145ba16e0: ucomiss xmm0, dword ptr [rip + 0x714929]
145ba16e7: mov ebp, 0x7fffffff
145ba16ec: cmova edi, ebp
145ba16ef: xor eax, eax
145ba16f1: ucomiss xmm0, xmm0
145ba16f4: cmovp edi, eax
145ba16f7: mov r14d, dword ptr [rsi + 0x30]
145ba16fb: lea ebx, [rdi - 2]
145ba16fe: test ebx, ebx
145ba1700: cmovle ebx, eax
145ba1703: add edi, 2
145ba1706: lea r15d, [r14 - 1]
145ba170a: cmp r15d, edi
145ba170d: cmovl edi, r15d
145ba1711: cmp ebx, edi
145ba1713: jle 0x145ba172b
145ba1715: movaps xmm6, xmmword ptr [rsp + 0x20]
145ba171a: add rsp, 0x38
145ba171e: pop rbx
145ba171f: pop rbp
145ba1720: pop rdi
145ba1721: pop rsi
145ba1722: pop r12
145ba1724: pop r13
145ba1726: pop r14
145ba1728: pop r15
145ba172a: ret
145ba172b: subss xmm6, dword ptr [rsi + 0x38]
145ba1730: addss xmm6, xmm6
145ba1734: movaps xmm0, xmm6
145ba1737: call 0x14606179f
145ba173c: cvttss2si r8d, xmm0
145ba1741: ucomiss xmm0, dword ptr [rip + 0x7148c8]
145ba1748: cmova r8d, ebp
145ba174c: xor eax, eax
145ba174e: ucomiss xmm0, xmm0
145ba1751: cmovp r8d, eax
145ba1755: lea r9d, [r8 - 2]
145ba1759: test r9d, r9d
145ba175c: cmovle r9d, eax
145ba1760: add r8d, 2
145ba1764: cmp r15d, r8d
145ba1767: cmovl r8d, r15d
145ba176b: cmp r9d, r8d
145ba176e: jle 0x145ba179a
145ba1770: xor eax, eax
145ba1772: nop word ptr cs:[rax + rax]
145ba1780: xor ecx, ecx
145ba1782: cmp ebx, edi
145ba1784: setl dl
145ba1787: jge 0x145ba1822
145ba178d: mov cl, dl
145ba178f: add ebx, ecx
145ba1791: cmp ebx, edi
145ba1793: jle 0x145ba1780
145ba1795: jmp 0x145ba1715
145ba179a: mov r10, qword ptr [rsi + 8]
145ba179e: mov rdx, qword ptr [rsi + 0x10]
145ba17a2: mov r11d, 1
145ba17a8: nop dword ptr [rax + rax]
145ba17b0: mov esi, ebx
145ba17b2: xor ebx, ebx
145ba17b4: cmp esi, edi
145ba17b6: setl bl
145ba17b9: add ebx, esi
145ba17bb: mov r15d, esi
145ba17be: imul r15d, r14d
145ba17c2: mov r12d, r9d
145ba17c5: nop word ptr cs:[rax + rax]
145ba17d0: xor ebp, ebp
145ba17d2: cmp r12d, r8d
145ba17d5: setl r13b
145ba17d9: lea ecx, [r12 + r15]
145ba17dd: movsxd rcx, ecx
145ba17e0: cmp rdx, rcx
145ba17e3: jbe 0x145ba1827
145ba17e5: movss xmm1, dword ptr [r10 + rcx*4]
145ba17eb: ucomiss xmm1, xmm1
145ba17ee: jp 0x145ba1801
145ba17f0: ucomiss xmm0, xmm1
145ba17f3: setbe cl
145ba17f6: test al, cl
145ba17f8: jne 0x145ba17fd
145ba17fa: movaps xmm0, xmm1
145ba17fd: cmove eax, r11d
145ba1801: cmp r12d, r8d
145ba1804: jge 0x145ba1811
145ba1806: mov bpl, r13b
145ba1809: add r12d, ebp
145ba180c: cmp r12d, r8d
145ba180f: jle 0x145ba17d0
145ba1811: cmp esi, edi
145ba1813: jge 0x145ba1715
145ba1819: cmp ebx, edi
145ba181b: jle 0x145ba17b0
145ba181d: jmp 0x145ba1715
145ba1822: jmp 0x145ba1715
145ba1827: lea r8, [rip + 0x14ddc7a]
145ba182e: call 0x146208d03
145ba1833: ud2
