14028781e 4885c9 test rcx, rcx
140287821 743f je 0x140287862
140287823 458921 mov dword ptr [r9], r12d
140287826 4c8b8590000000 mov r8, qword ptr [rbp + 0x90]
14028782d f3410f10808c000000 movss xmm0, dword ptr [r8 + 0x8c]
140287836 83791801 cmp dword ptr [rcx + 0x18], 1
14028783a 0f85a7000000 jne 0x1402878e7
140287840 0f28c8 movaps xmm1, xmm0
140287843 f30f5c491c subss xmm1, dword ptr [rcx + 0x1c]
140287848 0f2ef1 ucomiss xmm6, xmm1
14028784b 440fb68517010000 movzx r8d, byte ptr [rbp + 0x117]
140287853 0f87c8faffff ja 0x140287321
140287859 0f2ef9 ucomiss xmm7, xmm1
14028785c 0f8685000000 jbe 0x1402878e7
140287862 4489a5f4000000 mov dword ptr [rbp + 0xf4], r12d
140287869 488985e8000000 mov qword ptr [rbp + 0xe8], rax
140287870 0fb602 movzx eax, byte ptr [rdx]
140287873 488d0d86afb605 lea rcx, [rip + 0x5b6af86]
14028787a 8b0481 mov eax, dword ptr [rcx + rax*4]
14028787d 8945a8 mov dword ptr [rbp - 0x58], eax
140287880 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
140287887 488d55a8 lea rdx, [rbp - 0x58]
14028788b 4d89d4 mov r12, r10
14028788e e80dc0efff call 0x1401838a0
140287893 8b8de4000000 mov ecx, dword ptr [rbp + 0xe4]
140287899 41890c24 mov dword ptr [r12], ecx
14028789d 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
1402878a4 e8a7aedbff call 0x140042750
1402878a9 90 nop
1402878aa 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
1402878b1 c680a0000000ff mov byte ptr [rax + 0xa0], 0xff
1402878b8 4d89e2 mov r10, r12
1402878bb 448b9de4000000 mov r11d, dword ptr [rbp + 0xe4]
1402878c2 45891c24 mov dword ptr [r12], r11d
1402878c6 ff80e4000000 inc dword ptr [rax + 0xe4]
1402878cc 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
1402878d3 448ba5f4000000 mov r12d, dword ptr [rbp + 0xf4]
1402878da 440fb68517010000 movzx r8d, byte ptr [rbp + 0x117]
1402878e2 e93afaffff jmp 0x140287321
1402878e7 c7411801000000 mov dword ptr [rcx + 0x18], 1
1402878ee f30f11411c movss dword ptr [rcx + 0x1c], xmm0
1402878f3 440fb68517010000 movzx r8d, byte ptr [rbp + 0x117]
1402878fb e921faffff jmp 0x140287321
