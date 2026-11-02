140364250: 55 push rbp
140364251: 4157 push r15
140364253: 4156 push r14
140364255: 4155 push r13
140364257: 4154 push r12
140364259: 56 push rsi
14036425a: 57 push rdi
14036425b: 53 push rbx
14036425c: 4883ec48 sub rsp, 0x48
140364260: 488d6c2440 lea rbp, [rsp + 0x40]
140364265: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
140364269: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
140364271: 4489c7 mov edi, r8d
140364274: 89d3 mov ebx, edx
140364276: 4889ce mov rsi, rcx
140364279: 664539c8 cmp r8w, r9w
14036427d: 750c jne 0x14036428b
14036427f: 488b06 mov rax, qword ptr [rsi]
140364282: 833800 cmp dword ptr [rax], 0
140364285: 0f85e7000000 jne 0x140364372
14036428b: 488b4608 mov rax, qword ptr [rsi + 8]
14036428f: 4c8b7610 mov r14, qword ptr [rsi + 0x10]
140364293: 498b0e mov rcx, qword ptr [r14]
140364296: 48894de0 mov qword ptr [rbp - 0x20], rcx
14036429a: 8b481c mov ecx, dword ptr [rax + 0x1c]
14036429d: 488b5010 mov rdx, qword ptr [rax + 0x10]
1403642a1: 890a mov dword ptr [rdx], ecx
1403642a3: 4c8b38 mov r15, qword ptr [rax]
1403642a6: 4d8b6730 mov r12, qword ptr [r15 + 0x30]
1403642aa: 4d8b6f40 mov r13, qword ptr [r15 + 0x40]
1403642ae: 4d3b6720 cmp r12, qword ptr [r15 + 0x20]
1403642b2: 750a jne 0x1403642be
1403642b4: 498d4f20 lea rcx, [r15 + 0x20]
1403642b8: e8036a8905 call 0x145bfacc0
1403642bd: 90 nop
1403642be: 0fbfc7 movsx eax, di
1403642c1: f30f2ac0 cvtsi2ss xmm0, eax
1403642c5: f30f5e0563fea805 divss xmm0, dword ptr [rip + 0x5a8fe63]
1403642cd: f30f100def8da605 movss xmm1, dword ptr [rip + 0x5a68def]
1403642d5: f30f5fc8 maxss xmm1, xmm0
1403642d9: f30f1035bf8fa305 movss xmm6, dword ptr [rip + 0x5a38fbf]
1403642e1: f30f5df1 minss xmm6, xmm1
1403642e5: 498b4728 mov rax, qword ptr [r15 + 0x28]
1403642e9: 4b8d0c64 lea rcx, [r12 + r12*2]
1403642ed: 48c1e104 shl rcx, 4
1403642f1: 48ba0100000000000080 movabs rdx, 0x8000000000000001
1403642fb: 48891408 mov qword ptr [rax + rcx], rdx
1403642ff: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
140364303: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140364308: f30f11740810 movss dword ptr [rax + rcx + 0x10], xmm6
14036430e: 885c0814 mov byte ptr [rax + rcx + 0x14], bl
140364312: 4c896c0828 mov qword ptr [rax + rcx + 0x28], r13
140364317: 49ffc4 inc r12
14036431a: 4d896730 mov qword ptr [r15 + 0x30], r12
14036431e: 49ff4740 inc qword ptr [r15 + 0x40]
140364322: 488b4618 mov rax, qword ptr [rsi + 0x18]
140364326: 498b3e mov rdi, qword ptr [r14]
140364329: 8b481c mov ecx, dword ptr [rax + 0x1c]
14036432c: 488b5010 mov rdx, qword ptr [rax + 0x10]
140364330: 890a mov dword ptr [rdx], ecx
140364332: 488b30 mov rsi, qword ptr [rax]
140364335: 4c8b7630 mov r14, qword ptr [rsi + 0x30]
140364339: 4c8b7e40 mov r15, qword ptr [rsi + 0x40]
14036433d: 4c3b7620 cmp r14, qword ptr [rsi + 0x20]
140364341: 7509 jne 0x14036434c
140364343: 488d4e20 lea rcx, [rsi + 0x20]
140364347: e894688905 call 0x145bfabe0
14036434c: 488b4628 mov rax, qword ptr [rsi + 0x28]
140364350: 4b8d0c76 lea rcx, [r14 + r14*2]
140364354: 4c893cc8 mov qword ptr [rax + rcx*8], r15
140364358: 48897cc808 mov qword ptr [rax + rcx*8 + 8], rdi
14036435d: f30f1174c810 movss dword ptr [rax + rcx*8 + 0x10], xmm6
140364363: 885cc814 mov byte ptr [rax + rcx*8 + 0x14], bl
140364367: 49ffc6 inc r14
14036436a: 4c897630 mov qword ptr [rsi + 0x30], r14
14036436e: 48ff4640 inc qword ptr [rsi + 0x40]
140364372: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
140364376: 4883c448 add rsp, 0x48
14036437a: 5b pop rbx
14036437b: 5f pop rdi
14036437c: 5e pop rsi
14036437d: 415c pop r12
14036437f: 415d pop r13
140364381: 415e pop r14
140364383: 415f pop r15
140364385: 5d pop rbp
140364386: c3 ret
