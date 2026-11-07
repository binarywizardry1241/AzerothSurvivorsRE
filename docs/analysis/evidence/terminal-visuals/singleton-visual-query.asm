1403d2090 55 push rbp
1403d2091 4157 push r15
1403d2093 4156 push r14
1403d2095 4155 push r13
1403d2097 4154 push r12
1403d2099 56 push rsi
1403d209a 57 push rdi
1403d209b 53 push rbx
1403d209c 4881ec08030000 sub rsp, 0x308
1403d20a3 488dac2480000000 lea rbp, [rsp + 0x80]
1403d20ab 48c78580020000feffffff mov qword ptr [rbp + 0x280], 0xfffffffffffffffe
1403d20b6 4889d7 mov rdi, rdx
1403d20b9 4889ce mov rsi, rcx
1403d20bc 4889d1 mov rcx, rdx
1403d20bf e8fc01f1ff call 0x1402e22c0
1403d20c4 4889c3 mov rbx, rax
1403d20c7 4889f9 mov rcx, rdi
1403d20ca e8c14bf0ff call 0x1402d6c90
1403d20cf 4989c6 mov r14, rax
1403d20d2 4889f9 mov rcx, rdi
1403d20d5 e80682f0ff call 0x1402da2e0
1403d20da 4989c7 mov r15, rax
1403d20dd 4889f9 mov rcx, rdi
1403d20e0 e88b56f0ff call 0x1402d7770
1403d20e5 4989c4 mov r12, rax
1403d20e8 4889f9 mov rcx, rdi
1403d20eb e8f087f0ff call 0x1402da8e0
1403d20f0 4989c5 mov r13, rax
1403d20f3 4889f9 mov rcx, rdi
1403d20f6 e8b53af0ff call 0x1402d5bb0
1403d20fb 48899d48020000 mov qword ptr [rbp + 0x248], rbx
1403d2102 4c89b550020000 mov qword ptr [rbp + 0x250], r14
1403d2109 4c89bd58020000 mov qword ptr [rbp + 0x258], r15
1403d2110 4c89a560020000 mov qword ptr [rbp + 0x260], r12
1403d2117 4c89ad68020000 mov qword ptr [rbp + 0x268], r13
1403d211e 48898570020000 mov qword ptr [rbp + 0x270], rax
1403d2125 488d5d58 lea rbx, [rbp + 0x58]
1403d2129 4889d9 mov rcx, rbx
1403d212c e81f77aa04 call 0x144e79850
1403d2131 c6857f02000001 mov byte ptr [rbp + 0x27f], 1
1403d2138 488d8d48020000 lea rcx, [rbp + 0x248]
1403d213f 4889da mov rdx, rbx
1403d2142 e85905efff call 0x1402c26a0
1403d2147 90 nop
1403d2148 c6857f02000001 mov byte ptr [rbp + 0x27f], 1
1403d214f 488d4da8 lea rcx, [rbp - 0x58]
1403d2153 e8f876aa04 call 0x144e79850
1403d2158 90 nop
1403d2159 488d4d58 lea rcx, [rbp + 0x58]
1403d215d 488d55a8 lea rdx, [rbp - 0x58]
1403d2161 e82a11aa04 call 0x144e73290
1403d2166 90 nop
1403d2167 b301 mov bl, 1
1403d2169 4883bf9000000000 cmp qword ptr [rdi + 0x90], 0
1403d2171 0f84fd000000 je 0x1403d2274
1403d2177 488b4778 mov rax, qword ptr [rdi + 0x78]
1403d217b 488b8f80000000 mov rcx, qword ptr [rdi + 0x80]
1403d2182 48ba1942cea89620590e movabs rdx, 0xe592096a8ce4219
1403d218c 4531c0 xor r8d, r8d
1403d218f 660f6f0579b09f05 movdqa xmm0, xmmword ptr [rip + 0x59fb079]
1403d2197 660f76c9 pcmpeqd xmm1, xmm1
1403d219b 660f6f155de5a205 movdqa xmm2, xmmword ptr [rip + 0x5a2e55d]
1403d21a3 4821ca and rdx, rcx
1403d21a6 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1403d21ab 660f6fe3 movdqa xmm4, xmm3
1403d21af 660f74e0 pcmpeqb xmm4, xmm0
1403d21b3 66440fd7cc pmovmskb r9d, xmm4
1403d21b8 4585c9 test r9d, r9d
1403d21bb 7443 je 0x1403d2200
1403d21bd f3450fbcd1 tzcnt r10d, r9d
1403d21c2 4901d2 add r10, rdx
1403d21c5 4921ca and r10, rcx
1403d21c8 49f7da neg r10
1403d21cb 4f8d1452 lea r10, [r10 + r10*2]
1403d21cf f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403d21d6 660f74e2 pcmpeqb xmm4, xmm2
1403d21da 66440fd7dc pmovmskb r11d, xmm4
1403d21df 4181fbffff0000 cmp r11d, 0xffff
1403d21e6 7433 je 0x1403d221b
1403d21e8 458d51ff lea r10d, [r9 - 1]
1403d21ec 664521ca and r10w, r9w
1403d21f0 4589d1 mov r9d, r10d
1403d21f3 75c8 jne 0x1403d21bd
1403d21f5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1403d2200 660f74d9 pcmpeqb xmm3, xmm1
1403d2204 66440fd7cb pmovmskb r9d, xmm3
1403d2209 4585c9 test r9d, r9d
1403d220c 7566 jne 0x1403d2274
1403d220e 4c01c2 add rdx, r8
1403d2211 4883c210 add rdx, 0x10
1403d2215 4983c010 add r8, 0x10
1403d2219 eb88 jmp 0x1403d21a3
1403d221b 4a8d04d0 lea rax, [rax + r10*8]
1403d221f 488b40f8 mov rax, qword ptr [rax - 8]
1403d2223 483b8718020000 cmp rax, qword ptr [rdi + 0x218]
1403d222a 7348 jae 0x1403d2274
1403d222c 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403d2233 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1403d2237 4885c9 test rcx, rcx
1403d223a 7438 je 0x1403d2274
1403d223c 488b87e0010000 mov rax, qword ptr [rdi + 0x1e0]
1403d2243 48f7d1 not rcx
1403d2246 486bc938 imul rcx, rcx, 0x38
1403d224a 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
1403d224f 7523 jne 0x1403d2274
1403d2251 4801c8 add rax, rcx
1403d2254 488b5810 mov rbx, qword ptr [rax + 0x10]
1403d2258 488d5558 lea rdx, [rbp + 0x58]
1403d225c 4889d9 mov rcx, rbx
1403d225f e85c0aa304 call 0x144e02cc0
1403d2264 90 nop
1403d2265 488d5740 lea rdx, [rdi + 0x40]
1403d2269 4889d9 mov rcx, rbx
1403d226c e8af0ba304 call 0x144e02e20
1403d2271 90 nop
1403d2272 89c3 mov ebx, eax
1403d2274 4c8bb7a0050000 mov r14, qword ptr [rdi + 0x5a0]
1403d227b 488d8d48010000 lea rcx, [rbp + 0x148]
1403d2282 488d5558 lea rdx, [rbp + 0x58]
1403d2286 41b8b0000000 mov r8d, 0xb0
1403d228c e8aa068205 call 0x145bf293b
1403d2291 4c89b508010000 mov qword ptr [rbp + 0x108], r14
1403d2298 c7851001000000000000 mov dword ptr [rbp + 0x110], 0
1403d22a2 48c7851801000010000000 mov qword ptr [rbp + 0x118], 0x10
1403d22ad 660fefc0 pxor xmm0, xmm0
1403d22b1 f30f7f8520010000 movdqu xmmword ptr [rbp + 0x120], xmm0
1403d22b9 48c7853001000010000000 mov qword ptr [rbp + 0x130], 0x10
1403d22c4 f30f7f8538010000 movdqu xmmword ptr [rbp + 0x138], xmm0
1403d22cc 48c785f801000000000000 mov qword ptr [rbp + 0x1f8], 0
1403d22d7 48c7850002000004000000 mov qword ptr [rbp + 0x200], 4
1403d22e2 48c7850802000000000000 mov qword ptr [rbp + 0x208], 0
1403d22ed 889d10020000 mov byte ptr [rbp + 0x210], bl
1403d22f3 f30f6f8548020000 movdqu xmm0, xmmword ptr [rbp + 0x248]
1403d22fb f30f6f8d58020000 movdqu xmm1, xmmword ptr [rbp + 0x258]
1403d2303 f30f6f9568020000 movdqu xmm2, xmmword ptr [rbp + 0x268]
1403d230b f30f7f8518020000 movdqu xmmword ptr [rbp + 0x218], xmm0
1403d2313 f30f7f8d28020000 movdqu xmmword ptr [rbp + 0x228], xmm1
1403d231b f30f7f9538020000 movdqu xmmword ptr [rbp + 0x238], xmm2
1403d2323 c6857f02000000 mov byte ptr [rbp + 0x27f], 0
1403d232a 488d4da8 lea rcx, [rbp - 0x58]
1403d232e e85df5fdff call 0x1403b1890
1403d2333 90 nop
1403d2334 488d8d08010000 lea rcx, [rbp + 0x108]
1403d233b 4889fa mov rdx, rdi
1403d233e e82df9ffff call 0x1403d1c70
1403d2343 90 nop
1403d2344 488d9508010000 lea rdx, [rbp + 0x108]
1403d234b 41b840010000 mov r8d, 0x140
1403d2351 4889f1 mov rcx, rsi
1403d2354 e8e2058205 call 0x145bf293b
1403d2359 4889f0 mov rax, rsi
1403d235c 4881c408030000 add rsp, 0x308
1403d2363 5b pop rbx
1403d2364 5f pop rdi
1403d2365 5e pop rsi
1403d2366 415c pop r12
1403d2368 415d pop r13
1403d236a 415e pop r14
1403d236c 415f pop r15
1403d236e 5d pop rbp
1403d236f c3 ret
