141898ff0: push rbp
141898ff1: push r15
141898ff3: push r14
141898ff5: push rsi
141898ff6: push rdi
141898ff7: push rbx
141898ff8: sub rsp, 0x148
141898fff: lea rbp, [rsp + 0x80]
141899007: movaps xmmword ptr [rbp + 0xb0], xmm8
14189900f: movaps xmmword ptr [rbp + 0xa0], xmm7
141899016: movaps xmmword ptr [rbp + 0x90], xmm6
14189901d: mov qword ptr [rbp + 0x88], 0xfffffffffffffffe
141899028: mov r14b, r9b
14189902b: mov rbx, r8
14189902e: mov rsi, rdx
141899031: mov rdi, rcx
141899034: lea r15, [rbp + 0x58]
141899038: movss xmm1, dword ptr [rip + 0x44d4708]
141899040: mov rcx, r15
141899043: call 0x141c73aa0
141899048: mov dword ptr [rbp + 0x30], 5
14189904f: movups xmm7, xmmword ptr [rip + 0x47fb0d2]
141899056: movaps xmmword ptr [rbp + 0x10], xmm7
14189905a: movups xmm8, xmmword ptr [rip + 0x47fb0d6]
141899062: movaps xmmword ptr [rbp + 0x20], xmm8
141899067: mov eax, dword ptr [rsi + 8]
14189906a: mov dword ptr [rbp + 0x50], eax
14189906d: mov rax, qword ptr [rsi]
141899070: mov qword ptr [rbp + 0x48], rax
141899074: movaps xmm0, xmmword ptr [rip + 0x45b3c75]
14189907b: movaps xmmword ptr [rbp - 0x40], xmm0
14189907f: mov eax, dword ptr [rbx + 8]
141899082: mov dword ptr [rbp + 0x40], eax
141899085: mov rax, qword ptr [rbx]
141899088: mov qword ptr [rbp + 0x38], rax
14189908c: lea rax, [rbp + 0x10]
141899090: mov qword ptr [rsp + 0x38], rax
141899095: lea rax, [rbp + 0x38]
141899099: mov qword ptr [rsp + 0x28], rax
14189909e: lea rax, [rbp - 0x40]
1418990a2: mov qword ptr [rsp + 0x20], rax
1418990a7: mov dword ptr [rsp + 0x30], 0
1418990af: lea rcx, [rbp - 0x30]
1418990b3: lea r9, [rbp + 0x48]
1418990b7: mov rdx, rdi
1418990ba: mov r8, r15
1418990bd: call 0x141dbbce0
1418990c2: nop
1418990c3: mov r15d, dword ptr [rbp - 0x30]
1418990c7: movss xmm6, dword ptr [rbp - 0x28]
1418990cc: mov rax, qword ptr [rbp + 0x58]
1418990d0: lock dec qword ptr [rax]
1418990d4: jne 0x1418990e0
1418990d6: lea rcx, [rbp + 0x58]
1418990da: call 0x1403d5ea0
1418990df: nop
1418990e0: mov rax, qword ptr [rbp + 0x68]
1418990e4: lock dec qword ptr [rax]
1418990e8: jne 0x1418990f3
1418990ea: lea rcx, [rbp + 0x68]
1418990ee: call 0x1403d5ea0
1418990f3: test r14b, r14b
1418990f6: je 0x14189912b
1418990f8: mov eax, dword ptr [rbx + 8]
1418990fb: mov dword ptr [rbp + 0x60], eax
1418990fe: mov rax, qword ptr [rbx]
141899101: mov qword ptr [rbp + 0x58], rax
141899105: lea r14, [rbp - 0x30]
141899109: lea rdx, [rbp + 0x58]
14189910d: mov rcx, r14
141899110: call 0x144cde750
141899115: cmp byte ptr [rbp - 0x30], 1
141899119: jne 0x14189913b
14189911b: xor eax, eax
14189911d: test r15d, r15d
141899120: jne 0x1418991b3
141899126: jmp 0x1418991d7
14189912b: test r15d, r15d
14189912e: jne 0x1418991dc
141899134: xor eax, eax
141899136: jmp 0x1418991e1
14189913b: mov eax, dword ptr [rbp - 0x24]
14189913e: mov dword ptr [rbp + 0x18], eax
141899141: mov rax, qword ptr [rbp - 0x2c]
141899145: mov qword ptr [rbp + 0x10], rax
141899149: movss xmm0, dword ptr [rbx]
14189914d: mulss xmm0, xmm0
141899151: movsd xmm1, qword ptr [rbx + 4]
141899156: mulps xmm1, xmm1
141899159: addss xmm0, xmm1
14189915d: movshdup xmm1, xmm1
141899161: addss xmm1, xmm0
141899165: xorps xmm0, xmm0
141899168: sqrtss xmm0, xmm1
14189916c: mov dword ptr [rbp - 0x10], 8
141899173: movaps xmmword ptr [rbp - 0x30], xmm7
141899177: movaps xmmword ptr [rbp - 0x20], xmm8
14189917c: mov qword ptr [rsp + 0x30], r14
141899181: movss dword ptr [rsp + 0x20], xmm0
141899187: mov byte ptr [rsp + 0x28], 1
14189918c: lea rcx, [rbp + 0x58]
141899190: lea r9, [rbp + 0x10]
141899194: mov rdx, rdi
141899197: mov r8, rsi
14189919a: call 0x141dba680
14189919f: nop
1418991a0: movss xmm0, dword ptr [rbp + 0x60]
1418991a5: xor eax, eax
1418991a7: cmp dword ptr [rbp + 0x58], 0
1418991ab: setne al
1418991ae: test r15d, r15d
1418991b1: je 0x1418991d7
1418991b3: test eax, eax
1418991b5: je 0x1418991dc
1418991b7: movaps xmm1, xmm6
1418991ba: minss xmm1, xmm0
1418991be: movaps xmm0, xmm1
1418991c1: cmpunordss xmm0, xmm1
1418991c6: movaps xmm2, xmm0
1418991c9: andnps xmm2, xmm1
1418991cc: andps xmm0, xmm6
1418991cf: orps xmm0, xmm2
1418991d2: mov eax, 1
1418991d7: movaps xmm6, xmm0
1418991da: jmp 0x1418991e1
1418991dc: mov eax, 1
1418991e1: movaps xmm0, xmm6
1418991e4: movaps xmm6, xmmword ptr [rbp + 0x90]
1418991eb: movaps xmm7, xmmword ptr [rbp + 0xa0]
1418991f2: movaps xmm8, xmmword ptr [rbp + 0xb0]
1418991fa: add rsp, 0x148
141899201: pop rbx
141899202: pop rdi
141899203: pop rsi
141899204: pop r14
141899206: pop r15
141899208: pop rbp
141899209: ret
