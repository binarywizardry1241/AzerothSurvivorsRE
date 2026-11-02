140300240: 55 push rbp
140300241: 4157 push r15
140300243: 4156 push r14
140300245: 4155 push r13
140300247: 4154 push r12
140300249: 56 push rsi
14030024a: 57 push rdi
14030024b: 53 push rbx
14030024c: 4883ec48 sub rsp, 0x48
140300250: 488d6c2440 lea rbp, [rsp + 0x40]
140300255: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
140300259: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
140300261: 4489c7 mov edi, r8d
140300264: 89d3 mov ebx, edx
140300266: 4889ce mov rsi, rcx
140300269: 664539c8 cmp r8w, r9w
14030026d: 750c jne 0x14030027b
14030026f: 488b06 mov rax, qword ptr [rsi]
140300272: 833800 cmp dword ptr [rax], 0
140300275: 0f85e7000000 jne 0x140300362
14030027b: 488b4608 mov rax, qword ptr [rsi + 8]
14030027f: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
140300283: 498b0e mov rcx, qword ptr [r14]
140300286: 48894de0 mov qword ptr [rbp - 0x20], rcx
14030028a: 8b481c mov ecx, dword ptr [rax + 0x1c]
14030028d: 488b5010 mov rdx, qword ptr [rax + 0x10]
140300291: 890a mov dword ptr [rdx], ecx
140300293: 4c8b38 mov r15, qword ptr [rax]
140300296: 4d8b6730 mov r12, qword ptr [r15 + 0x30]
14030029a: 4d8b6f40 mov r13, qword ptr [r15 + 0x40]
14030029e: 4d3b6720 cmp r12, qword ptr [r15 + 0x20]
1403002a2: 750a jne 0x1403002ae
1403002a4: 498d4f20 lea rcx, [r15 + 0x20]
1403002a8: e8d3d79005 call 0x145c0da80
1403002ad: 90 nop
1403002ae: 0fbfc7 movsx eax, di
1403002b1: f30f2ac0 cvtsi2ss xmm0, eax
1403002b5: f30f5e0563cab005 divss xmm0, dword ptr [rip + 0x5b0ca63]
1403002bd: f30f100da310ab05 movss xmm1, dword ptr [rip + 0x5ab10a3]
1403002c5: f30f5fc8 maxss xmm1, xmm0
1403002c9: f30f10358fcfaa05 movss xmm6, dword ptr [rip + 0x5aacf8f]
1403002d1: f30f5df1 minss xmm6, xmm1
1403002d5: 498b4728 mov rax, qword ptr [r15 + 0x28]
1403002d9: 4b8d0c64 lea rcx, [r12 + r12*2]
1403002dd: 48c1e104 shl rcx, 4
1403002e1: 48ba0100000000000080 movabs rdx, 0x8000000000000001
1403002eb: 48891408 mov qword ptr [rax + rcx], rdx
1403002ef: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1403002f3: 4889540808 mov qword ptr [rax + rcx + 8], rdx
1403002f8: f30f11740810 movss dword ptr [rax + rcx + 0x10], xmm6
1403002fe: 885c0814 mov byte ptr [rax + rcx + 0x14], bl
140300302: 4c896c0828 mov qword ptr [rax + rcx + 0x28], r13
140300307: 49ffc4 inc r12
14030030a: 4d896730 mov qword ptr [r15 + 0x30], r12
14030030e: 49ff4740 inc qword ptr [r15 + 0x40]
140300312: 488b4618 mov rax, qword ptr [rsi + 0x18]
140300316: 498b3e mov rdi, qword ptr [r14]
140300319: 8b481c mov ecx, dword ptr [rax + 0x1c]
14030031c: 488b5010 mov rdx, qword ptr [rax + 0x10]
140300320: 890a mov dword ptr [rdx], ecx
140300322: 488b30 mov rsi, qword ptr [rax]
140300325: 4c8b7630 mov r14, qword ptr [rsi + 0x30]
140300329: 4c8b7e40 mov r15, qword ptr [rsi + 0x40]
14030032d: 4c3b7620 cmp r14, qword ptr [rsi + 0x20]
140300331: 7509 jne 0x14030033c
140300333: 488d4e20 lea rcx, [rsi + 0x20]
140300337: e864d69005 call 0x145c0d9a0
14030033c: 488b4628 mov rax, qword ptr [rsi + 0x28]
140300340: 4b8d0c76 lea rcx, [r14 + r14*2]
140300344: 4c893cc8 mov qword ptr [rax + rcx*8], r15
140300348: 48897cc808 mov qword ptr [rax + rcx*8 + 8], rdi
14030034d: f30f1174c810 movss dword ptr [rax + rcx*8 + 0x10], xmm6
140300353: 885cc814 mov byte ptr [rax + rcx*8 + 0x14], bl
140300357: 49ffc6 inc r14
14030035a: 4c897630 mov qword ptr [rsi + 0x30], r14
14030035e: 48ff4640 inc qword ptr [rsi + 0x40]
140300362: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
140300366: 4883c448 add rsp, 0x48
14030036a: 5b pop rbx
14030036b: 5f pop rdi
14030036c: 5e pop rsi
14030036d: 415c pop r12
14030036f: 415d pop r13
140300371: 415e pop r14
140300373: 415f pop r15
140300375: 5d pop rbp
140300376: c3 ret
