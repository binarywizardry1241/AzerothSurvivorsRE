14029c710 4157 push r15
14029c712 4156 push r14
14029c714 4155 push r13
14029c716 4154 push r12
14029c718 56 push rsi
14029c719 57 push rdi
14029c71a 55 push rbp
14029c71b 53 push rbx
14029c71c 4881ec48020000 sub rsp, 0x248
14029c723 bf01000000 mov edi, 1
14029c728 f0410fc1b8b0050000 lock xadd dword ptr [r8 + 0x5b0], edi
14029c731 48833aff cmp qword ptr [rdx], -1
14029c735 0f8423050000 je 0x14029cc5e
14029c73b 4c89c3 mov rbx, r8
14029c73e 4889d6 mov rsi, rdx
14029c741 498b80a0050000 mov rax, qword ptr [r8 + 0x5a0]
14029c748 48898424e0000000 mov qword ptr [rsp + 0xe0], rax
14029c750 483982c00b0000 cmp qword ptr [rdx + 0xbc0], rax
14029c757 0f851b050000 jne 0x14029cc78
14029c75d 488b86800b0000 mov rax, qword ptr [rsi + 0xb80]
14029c764 4c8b8b18020000 mov r9, qword ptr [rbx + 0x218]
14029c76b 4c39c8 cmp rax, r9
14029c76e 0f833b050000 jae 0x14029ccaf
14029c774 488b9310020000 mov rdx, qword ptr [rbx + 0x210]
14029c77b 4c8b04c2 mov r8, qword ptr [rdx + rax*8]
14029c77f 4d85c0 test r8, r8
14029c782 0f8427050000 je 0x14029ccaf
14029c788 488b83e0010000 mov rax, qword ptr [rbx + 0x1e0]
14029c78f 49f7d0 not r8
14029c792 4d6bf038 imul r14, r8, 0x38
14029c796 42807c303000 cmp byte ptr [rax + r14 + 0x30], 0
14029c79c 0f840d050000 je 0x14029ccaf
14029c7a2 4c8b86880b0000 mov r8, qword ptr [rsi + 0xb88]
14029c7a9 4d39c8 cmp r8, r9
14029c7ac 7339 jae 0x14029c7e7
14029c7ae 4e8b04c2 mov r8, qword ptr [rdx + r8*8]
14029c7b2 4d85c0 test r8, r8
14029c7b5 7430 je 0x14029c7e7
14029c7b7 49f7d0 not r8
14029c7ba 4d6bc038 imul r8, r8, 0x38
14029c7be 42807c003001 cmp byte ptr [rax + r8 + 0x30], 1
14029c7c4 7521 jne 0x14029c7e7
14029c7c6 4901c0 add r8, rax
14029c7c9 4d8b5010 mov r10, qword ptr [r8 + 0x10]
14029c7cd 4d8d5828 lea r11, [r8 + 0x28]
14029c7d1 4c899c2480000000 mov qword ptr [rsp + 0x80], r11
14029c7d9 4983c02c add r8, 0x2c
14029c7dd 4c89842488000000 mov qword ptr [rsp + 0x88], r8
14029c7e5 eb03 jmp 0x14029c7ea
14029c7e7 4531d2 xor r10d, r10d
14029c7ea 4c8b86900b0000 mov r8, qword ptr [rsi + 0xb90]
14029c7f1 4d39c8 cmp r8, r9
14029c7f4 0f83b5040000 jae 0x14029ccaf
14029c7fa 4e8b04c2 mov r8, qword ptr [rdx + r8*8]
14029c7fe 4d85c0 test r8, r8
14029c801 0f84a8040000 je 0x14029ccaf
14029c807 49f7d0 not r8
14029c80a 4d6be838 imul r13, r8, 0x38
14029c80e 42807c283000 cmp byte ptr [rax + r13 + 0x30], 0
14029c814 0f8495040000 je 0x14029ccaf
14029c81a 4c8b86980b0000 mov r8, qword ptr [rsi + 0xb98]
14029c821 4d39c8 cmp r8, r9
14029c824 0f8385040000 jae 0x14029ccaf
14029c82a 4e8b04c2 mov r8, qword ptr [rdx + r8*8]
14029c82e 4d85c0 test r8, r8
14029c831 0f8478040000 je 0x14029ccaf
14029c837 49f7d0 not r8
14029c83a 4d6bf838 imul r15, r8, 0x38
14029c83e 42807c383000 cmp byte ptr [rax + r15 + 0x30], 0
14029c844 0f8465040000 je 0x14029ccaf
14029c84a 4c899424d0000000 mov qword ptr [rsp + 0xd0], r10
14029c852 48898c24d8000000 mov qword ptr [rsp + 0xd8], rcx
14029c85a 4c8b86a00b0000 mov r8, qword ptr [rsi + 0xba0]
14029c861 4d39c8 cmp r8, r9
14029c864 0f8345040000 jae 0x14029ccaf
14029c86a 4a8b0cc2 mov rcx, qword ptr [rdx + r8*8]
14029c86e 4885c9 test rcx, rcx
14029c871 0f8438040000 je 0x14029ccaf
14029c877 48f7d1 not rcx
14029c87a 486be938 imul rbp, rcx, 0x38
14029c87e 807c283000 cmp byte ptr [rax + rbp + 0x30], 0
14029c883 0f8426040000 je 0x14029ccaf
14029c889 4901c6 add r14, rax
14029c88c 498b4e10 mov rcx, qword ptr [r14 + 0x10]
14029c890 48898c24a8000000 mov qword ptr [rsp + 0xa8], rcx
14029c898 448ba6c80b0000 mov r12d, dword ptr [rsi + 0xbc8]
14029c89f 4901c5 add r13, rax
14029c8a2 498b4d10 mov rcx, qword ptr [r13 + 0x10]
14029c8a6 48898c24b8000000 mov qword ptr [rsp + 0xb8], rcx
14029c8ae 4901c7 add r15, rax
14029c8b1 498b4f10 mov rcx, qword ptr [r15 + 0x10]
14029c8b5 48898c24c8000000 mov qword ptr [rsp + 0xc8], rcx
14029c8bd 4801c5 add rbp, rax
14029c8c0 498d472c lea rax, [r15 + 0x2c]
14029c8c4 48898424c0000000 mov qword ptr [rsp + 0xc0], rax
14029c8cc 4983c728 add r15, 0x28
14029c8d0 498d452c lea rax, [r13 + 0x2c]
14029c8d4 48898424b0000000 mov qword ptr [rsp + 0xb0], rax
14029c8dc 4983c528 add r13, 0x28
14029c8e0 498d462c lea rax, [r14 + 0x2c]
14029c8e4 4889842490000000 mov qword ptr [rsp + 0x90], rax
14029c8ec 4983c628 add r14, 0x28
14029c8f0 488b4510 mov rax, qword ptr [rbp + 0x10]
14029c8f4 48898424a0000000 mov qword ptr [rsp + 0xa0], rax
14029c8fc 488d4528 lea rax, [rbp + 0x28]
14029c900 4889842498000000 mov qword ptr [rsp + 0x98], rax
14029c908 4883c52c add rbp, 0x2c
14029c90c 488d4e38 lea rcx, [rsi + 0x38]
14029c910 4889da mov rdx, rbx
14029c913 e898620e00 call 0x140382bb0
14029c918 0fb686cc0b0000 movzx eax, byte ptr [rsi + 0xbcc]
14029c91f 8844247f mov byte ptr [rsp + 0x7f], al
14029c923 488d8ef0060000 lea rcx, [rsi + 0x6f0]
14029c92a 4889da mov rdx, rbx
14029c92d e88ea30f00 call 0x140396cc0
14029c932 488d8e10080000 lea rcx, [rsi + 0x810]
14029c939 4889da mov rdx, rbx
14029c93c e8bfca0e00 call 0x140389400
14029c941 488d8e38090000 lea rcx, [rsi + 0x938]
14029c948 4889da mov rdx, rbx
14029c94b e8f0211000 call 0x14039eb40
14029c950 488d8e680a0000 lea rcx, [rsi + 0xa68]
14029c957 4889da mov rdx, rbx
14029c95a e851620e00 call 0x140382bb0
14029c95f 48899c24e0000000 mov qword ptr [rsp + 0xe0], rbx
14029c967 488d4318 lea rax, [rbx + 0x18]
14029c96b 48898424e8000000 mov qword ptr [rsp + 0xe8], rax
14029c973 48c78424f000000000000000 mov qword ptr [rsp + 0xf0], 0
14029c97f 4889b424f8000000 mov qword ptr [rsp + 0xf8], rsi
14029c987 488b8424a8000000 mov rax, qword ptr [rsp + 0xa8]
14029c98f 4889842408010000 mov qword ptr [rsp + 0x108], rax
14029c997 4c89b42410010000 mov qword ptr [rsp + 0x110], r14
14029c99f 488b842490000000 mov rax, qword ptr [rsp + 0x90]
14029c9a7 4889842418010000 mov qword ptr [rsp + 0x118], rax
14029c9af 4489a42420010000 mov dword ptr [rsp + 0x120], r12d
14029c9b7 89bc2424010000 mov dword ptr [rsp + 0x124], edi
14029c9be 488b8424d0000000 mov rax, qword ptr [rsp + 0xd0]
14029c9c6 4889842420020000 mov qword ptr [rsp + 0x220], rax
14029c9ce 488b842480000000 mov rax, qword ptr [rsp + 0x80]
14029c9d6 4889842428020000 mov qword ptr [rsp + 0x228], rax
14029c9de 488b842488000000 mov rax, qword ptr [rsp + 0x88]
14029c9e6 4889842430020000 mov qword ptr [rsp + 0x230], rax
14029c9ee 4489a42438020000 mov dword ptr [rsp + 0x238], r12d
14029c9f6 89bc243c020000 mov dword ptr [rsp + 0x23c], edi
14029c9fd 488b8424b8000000 mov rax, qword ptr [rsp + 0xb8]
14029ca05 4889842428010000 mov qword ptr [rsp + 0x128], rax
14029ca0d 4c89ac2430010000 mov qword ptr [rsp + 0x130], r13
14029ca15 488b8424b0000000 mov rax, qword ptr [rsp + 0xb0]
14029ca1d 4889842438010000 mov qword ptr [rsp + 0x138], rax
14029ca25 4489a42440010000 mov dword ptr [rsp + 0x140], r12d
14029ca2d 89bc2444010000 mov dword ptr [rsp + 0x144], edi
14029ca34 488b8424c8000000 mov rax, qword ptr [rsp + 0xc8]
14029ca3c 4889842448010000 mov qword ptr [rsp + 0x148], rax
14029ca44 4c89bc2450010000 mov qword ptr [rsp + 0x150], r15
14029ca4c 488b8424c0000000 mov rax, qword ptr [rsp + 0xc0]
14029ca54 4889842458010000 mov qword ptr [rsp + 0x158], rax
14029ca5c 4489a42460010000 mov dword ptr [rsp + 0x160], r12d
14029ca64 89bc2464010000 mov dword ptr [rsp + 0x164], edi
14029ca6b 488b8424a0000000 mov rax, qword ptr [rsp + 0xa0]
14029ca73 4889842468010000 mov qword ptr [rsp + 0x168], rax
14029ca7b 488b842498000000 mov rax, qword ptr [rsp + 0x98]
14029ca83 4889842470010000 mov qword ptr [rsp + 0x170], rax
14029ca8b 4c8d842408010000 lea r8, [rsp + 0x108]
14029ca93 4889ac2478010000 mov qword ptr [rsp + 0x178], rbp
14029ca9b 4c8d8c2420020000 lea r9, [rsp + 0x220]
14029caa3 4489a42480010000 mov dword ptr [rsp + 0x180], r12d
14029caab 89bc2484010000 mov dword ptr [rsp + 0x184], edi
14029cab2 488d4638 lea rax, [rsi + 0x38]
14029cab6 4889842488010000 mov qword ptr [rsp + 0x188], rax
14029cabe 488d842428010000 lea rax, [rsp + 0x128]
14029cac6 48899c2490010000 mov qword ptr [rsp + 0x190], rbx
14029cace 4489a42498010000 mov dword ptr [rsp + 0x198], r12d
14029cad6 89bc249c010000 mov dword ptr [rsp + 0x19c], edi
14029cadd 488d8e50010000 lea rcx, [rsi + 0x150]
14029cae4 48898c24a0010000 mov qword ptr [rsp + 0x1a0], rcx
14029caec 488d8c2448010000 lea rcx, [rsp + 0x148]
14029caf4 48899c24a8010000 mov qword ptr [rsp + 0x1a8], rbx
14029cafc 4489a424b0010000 mov dword ptr [rsp + 0x1b0], r12d
14029cb04 0fb654247f movzx edx, byte ptr [rsp + 0x7f]
14029cb09 889424b4010000 mov byte ptr [rsp + 0x1b4], dl
14029cb10 488d942468010000 lea rdx, [rsp + 0x168]
14029cb18 89bc24b8010000 mov dword ptr [rsp + 0x1b8], edi
14029cb1f 4c8d96f0060000 lea r10, [rsi + 0x6f0]
14029cb26 4c899424c0010000 mov qword ptr [rsp + 0x1c0], r10
14029cb2e 4c8d942488010000 lea r10, [rsp + 0x188]
14029cb36 48899c24c8010000 mov qword ptr [rsp + 0x1c8], rbx
14029cb3e 4489a424d0010000 mov dword ptr [rsp + 0x1d0], r12d
14029cb46 89bc24d4010000 mov dword ptr [rsp + 0x1d4], edi
14029cb4d 4c8d9e10080000 lea r11, [rsi + 0x810]
14029cb54 4c899c24d8010000 mov qword ptr [rsp + 0x1d8], r11
14029cb5c 4c8d9c24a0010000 lea r11, [rsp + 0x1a0]
14029cb64 48899c24e0010000 mov qword ptr [rsp + 0x1e0], rbx
14029cb6c 4489a424e8010000 mov dword ptr [rsp + 0x1e8], r12d
14029cb74 89bc24ec010000 mov dword ptr [rsp + 0x1ec], edi
14029cb7b 4c8db638090000 lea r14, [rsi + 0x938]
14029cb82 4c89b424f0010000 mov qword ptr [rsp + 0x1f0], r14
14029cb8a 4c8db424c0010000 lea r14, [rsp + 0x1c0]
14029cb92 48899c24f8010000 mov qword ptr [rsp + 0x1f8], rbx
14029cb9a 4489a42400020000 mov dword ptr [rsp + 0x200], r12d
14029cba2 89bc2404020000 mov dword ptr [rsp + 0x204], edi
14029cba9 4c8dbe680a0000 lea r15, [rsi + 0xa68]
14029cbb0 4c89bc2408020000 mov qword ptr [rsp + 0x208], r15
14029cbb8 4c8dbc24d8010000 lea r15, [rsp + 0x1d8]
14029cbc0 48899c2410020000 mov qword ptr [rsp + 0x210], rbx
14029cbc8 488d9c24f0010000 lea rbx, [rsp + 0x1f0]
14029cbd0 4489a42418020000 mov dword ptr [rsp + 0x218], r12d
14029cbd8 4c8da42408020000 lea r12, [rsp + 0x208]
14029cbe0 89bc241c020000 mov dword ptr [rsp + 0x21c], edi
14029cbe7 4c8daea80b0000 lea r13, [rsi + 0xba8]
14029cbee 4c89ac2440020000 mov qword ptr [rsp + 0x240], r13
14029cbf6 4c896c2468 mov qword ptr [rsp + 0x68], r13
14029cbfb 4c89642460 mov qword ptr [rsp + 0x60], r12
14029cc00 48895c2458 mov qword ptr [rsp + 0x58], rbx
14029cc05 4c897c2450 mov qword ptr [rsp + 0x50], r15
14029cc0a 4c89742448 mov qword ptr [rsp + 0x48], r14
14029cc0f 4c895c2440 mov qword ptr [rsp + 0x40], r11
14029cc14 4c89542438 mov qword ptr [rsp + 0x38], r10
14029cc19 4889542430 mov qword ptr [rsp + 0x30], rdx
14029cc1e 48894c2428 mov qword ptr [rsp + 0x28], rcx
14029cc23 4889442420 mov qword ptr [rsp + 0x20], rax
14029cc28 488d9424e0000000 lea rdx, [rsp + 0xe0]
14029cc30 e83b1affff call 0x14028e670
14029cc35 89bec80b0000 mov dword ptr [rsi + 0xbc8], edi
14029cc3b 488b8424d8000000 mov rax, qword ptr [rsp + 0xd8]
14029cc43 48c700fdffffff mov qword ptr [rax], 0xfffffffffffffffd
14029cc4a 4881c448020000 add rsp, 0x248
14029cc51 5b pop rbx
14029cc52 5d pop rbp
14029cc53 5f pop rdi
14029cc54 5e pop rsi
14029cc55 415c pop r12
14029cc57 415d pop r13
14029cc59 415e pop r14
14029cc5b 415f pop r15
14029cc5d c3 ret
14029cc5e 488d0dd358b505 lea rcx, [rip + 0x5b558d3]
14029cc65 4c8d052c59b505 lea r8, [rip + 0x5b5592c]
14029cc6c ba59000000 mov edx, 0x59
14029cc71 e8fac8af05 call 0x145d99570
14029cc76 0f0b ud2
14029cc78 4881c6c00b0000 add rsi, 0xbc0
14029cc7f 488d059a59b505 lea rax, [rip + 0x5b5599a]
14029cc86 4889442428 mov qword ptr [rsp + 0x28], rax
14029cc8b 48c7442420df000000 mov qword ptr [rsp + 0x20], 0xdf
14029cc94 4c8d0d1559b505 lea r9, [rip + 0x5b55915]
14029cc9b 4c8d8424e0000000 lea r8, [rsp + 0xe0]
14029cca3 31c9 xor ecx, ecx
14029cca5 4889f2 mov rdx, rsi
14029cca8 e870bcaa05 call 0x145d4891d
14029ccad 0f0b ud2
14029ccaf 4881c6cc0b0000 add rsi, 0xbcc
14029ccb6 4889b424e0000000 mov qword ptr [rsp + 0xe0], rsi
14029ccbe 488d053b06d604 lea rax, [rip + 0x4d6063b]
14029ccc5 48898424e8000000 mov qword ptr [rsp + 0xe8], rax
14029cccd 488d4c247e lea rcx, [rsp + 0x7e]
14029ccd2 48898c24f0000000 mov qword ptr [rsp + 0xf0], rcx
14029ccda 48898424f8000000 mov qword ptr [rsp + 0xf8], rax
14029cce2 488d0d7f55b505 lea rcx, [rip + 0x5b5557f]
14029cce9 4c8d051856b505 lea r8, [rip + 0x5b55618]
14029ccf0 488d9424e0000000 lea rdx, [rsp + 0xe0]
14029ccf8 e833cbaf05 call 0x145d99830
14029ccfd 0f0b ud2
