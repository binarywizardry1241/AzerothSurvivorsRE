14589e720: 4157 push r15
14589e722: 4156 push r14
14589e724: 4155 push r13
14589e726: 4154 push r12
14589e728: 56 push rsi
14589e729: 57 push rdi
14589e72a: 55 push rbp
14589e72b: 53 push rbx
14589e72c: 4883ec38 sub rsp, 0x38
14589e730: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
14589e735: 0f28c2 movaps xmm0, xmm2
14589e738: 0f28f1 movaps xmm6, xmm1
14589e73b: 4889ce mov rsi, rcx
14589e73e: f30f5c4124 subss xmm0, dword ptr [rcx + 0x24]
14589e743: f30f58c0 addss xmm0, xmm0
14589e747: e8cd6a3600 call 0x145c05219
14589e74c: f30f2cf8 cvttss2si edi, xmm0
14589e750: 0f2e0549b05e00 ucomiss xmm0, dword ptr [rip + 0x5eb049]
14589e757: bdffffff7f mov ebp, 0x7fffffff
14589e75c: 0f47fd cmova edi, ebp
14589e75f: 31c0 xor eax, eax
14589e761: 0f2ec0 ucomiss xmm0, xmm0
14589e764: 0f4af8 cmovp edi, eax
14589e767: 448b7618 mov r14d, dword ptr [rsi + 0x18]
14589e76b: 8d5ffe lea ebx, [rdi - 2]
14589e76e: 85db test ebx, ebx
14589e770: 0f4ed8 cmovle ebx, eax
14589e773: 83c702 add edi, 2
14589e776: 458d7eff lea r15d, [r14 - 1]
14589e77a: 4139ff cmp r15d, edi
14589e77d: 410f4cff cmovl edi, r15d
14589e781: 39fb cmp ebx, edi
14589e783: 7e16 jle 0x14589e79b
14589e785: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14589e78a: 4883c438 add rsp, 0x38
14589e78e: 5b pop rbx
14589e78f: 5d pop rbp
14589e790: 5f pop rdi
14589e791: 5e pop rsi
14589e792: 415c pop r12
14589e794: 415d pop r13
14589e796: 415e pop r14
14589e798: 415f pop r15
14589e79a: c3 ret
14589e79b: f30f5c7620 subss xmm6, dword ptr [rsi + 0x20]
14589e7a0: f30f58f6 addss xmm6, xmm6
14589e7a4: 0f28c6 movaps xmm0, xmm6
14589e7a7: e86d6a3600 call 0x145c05219
14589e7ac: f3440f2cc0 cvttss2si r8d, xmm0
14589e7b1: 0f2e05e8af5e00 ucomiss xmm0, dword ptr [rip + 0x5eafe8]
14589e7b8: 440f47c5 cmova r8d, ebp
14589e7bc: 31c0 xor eax, eax
14589e7be: 0f2ec0 ucomiss xmm0, xmm0
14589e7c1: 440f4ac0 cmovp r8d, eax
14589e7c5: 458d48fe lea r9d, [r8 - 2]
14589e7c9: 4585c9 test r9d, r9d
14589e7cc: 440f4ec8 cmovle r9d, eax
14589e7d0: 4183c002 add r8d, 2
14589e7d4: 4539c7 cmp r15d, r8d
14589e7d7: 450f4cc7 cmovl r8d, r15d
14589e7db: 4539c1 cmp r9d, r8d
14589e7de: 7e2a jle 0x14589e80a
14589e7e0: 31c0 xor eax, eax
14589e7e2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589e7f0: 31c9 xor ecx, ecx
14589e7f2: 39fb cmp ebx, edi
14589e7f4: 0f9cc2 setl dl
14589e7f7: 0f8d95000000 jge 0x14589e892
14589e7fd: 88d1 mov cl, dl
14589e7ff: 01cb add ebx, ecx
14589e801: 39fb cmp ebx, edi
14589e803: 7eeb jle 0x14589e7f0
14589e805: e97bffffff jmp 0x14589e785
14589e80a: 4c8b5608 mov r10, qword ptr [rsi + 8]
14589e80e: 488b5610 mov rdx, qword ptr [rsi + 0x10]
14589e812: 41bb01000000 mov r11d, 1
14589e818: 0f1f840000000000 nop dword ptr [rax + rax]
14589e820: 89de mov esi, ebx
14589e822: 31db xor ebx, ebx
14589e824: 39fe cmp esi, edi
14589e826: 0f9cc3 setl bl
14589e829: 01f3 add ebx, esi
14589e82b: 4189f7 mov r15d, esi
14589e82e: 450faffe imul r15d, r14d
14589e832: 4589cc mov r12d, r9d
14589e835: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589e840: 31ed xor ebp, ebp
14589e842: 4539c4 cmp r12d, r8d
14589e845: 410f9cc5 setl r13b
14589e849: 438d0c3c lea ecx, [r12 + r15]
14589e84d: 4863c9 movsxd rcx, ecx
14589e850: 4839ca cmp rdx, rcx
14589e853: 7642 jbe 0x14589e897
14589e855: f3410f100c8a movss xmm1, dword ptr [r10 + rcx*4]
14589e85b: 0f2ec9 ucomiss xmm1, xmm1
14589e85e: 7a11 jp 0x14589e871
14589e860: 0f2ec1 ucomiss xmm0, xmm1
14589e863: 0f96c1 setbe cl
14589e866: 84c8 test al, cl
14589e868: 7503 jne 0x14589e86d
14589e86a: 0f28c1 movaps xmm0, xmm1
14589e86d: 410f44c3 cmove eax, r11d
14589e871: 4539c4 cmp r12d, r8d
14589e874: 7d0b jge 0x14589e881
14589e876: 4488ed mov bpl, r13b
14589e879: 4101ec add r12d, ebp
14589e87c: 4539c4 cmp r12d, r8d
14589e87f: 7ebf jle 0x14589e840
14589e881: 39fe cmp esi, edi
14589e883: 0f8dfcfeffff jge 0x14589e785
14589e889: 39fb cmp ebx, edi
14589e88b: 7e93 jle 0x14589e820
14589e88d: e9f3feffff jmp 0x14589e785
14589e892: e9eefeffff jmp 0x14589e785
14589e897: 4c8d05d2bb3501 lea r8, [rip + 0x135bbd2]
14589e89e: e8a05d5000 call 0x145da4643
14589e8a3: 0f0b ud2
