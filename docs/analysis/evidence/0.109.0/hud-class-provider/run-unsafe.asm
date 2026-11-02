1403db290 4157 push r15
1403db292 4156 push r14
1403db294 4155 push r13
1403db296 4154 push r12
1403db298 56 push rsi
1403db299 57 push rdi
1403db29a 55 push rbp
1403db29b 53 push rbx
1403db29c 4881ec88020000 sub rsp, 0x288
1403db2a3 48833aff cmp qword ptr [rdx], -1
1403db2a7 0f846c060000 je 0x1403db919
1403db2ad 4c89c7 mov rdi, r8
1403db2b0 498b80a0050000 mov rax, qword ptr [r8 + 0x5a0]
1403db2b7 4889842420010000 mov qword ptr [rsp + 0x120], rax
1403db2bf 483982c00b0000 cmp qword ptr [rdx + 0xbc0], rax
1403db2c6 0f8567060000 jne 0x1403db933
1403db2cc 4989ce mov r14, rcx
1403db2cf 4c8b82800b0000 mov r8, qword ptr [rdx + 0xb80]
1403db2d6 488b8718020000 mov rax, qword ptr [rdi + 0x218]
1403db2dd 4939c0 cmp r8, rax
1403db2e0 0f8345010000 jae 0x1403db42b
1403db2e6 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403db2ed 4e8b04c1 mov r8, qword ptr [rcx + r8*8]
1403db2f1 4d85c0 test r8, r8
1403db2f4 0f8431010000 je 0x1403db42b
1403db2fa 4c8ba7e0010000 mov r12, qword ptr [rdi + 0x1e0]
1403db301 49f7d0 not r8
1403db304 496bf038 imul rsi, r8, 0x38
1403db308 41807c343001 cmp byte ptr [r12 + rsi + 0x30], 1
1403db30e 0f8517010000 jne 0x1403db42b
1403db314 4c8b82900b0000 mov r8, qword ptr [rdx + 0xb90]
1403db31b 4939c0 cmp r8, rax
1403db31e 0f8307010000 jae 0x1403db42b
1403db324 4e8b04c1 mov r8, qword ptr [rcx + r8*8]
1403db328 4d85c0 test r8, r8
1403db32b 0f84fa000000 je 0x1403db42b
1403db331 49f7d0 not r8
1403db334 4d6bd038 imul r10, r8, 0x38
1403db338 43807c143001 cmp byte ptr [r12 + r10 + 0x30], 1
1403db33e 0f85e7000000 jne 0x1403db42b
1403db344 4c8b82980b0000 mov r8, qword ptr [rdx + 0xb98]
1403db34b 4939c0 cmp r8, rax
1403db34e 0f83d7000000 jae 0x1403db42b
1403db354 4e8b04c1 mov r8, qword ptr [rcx + r8*8]
1403db358 4d85c0 test r8, r8
1403db35b 0f84ca000000 je 0x1403db42b
1403db361 49f7d0 not r8
1403db364 4d6bd838 imul r11, r8, 0x38
1403db368 43807c1c3001 cmp byte ptr [r12 + r11 + 0x30], 1
1403db36e 0f85b7000000 jne 0x1403db42b
1403db374 4c8b82a00b0000 mov r8, qword ptr [rdx + 0xba0]
1403db37b 4939c0 cmp r8, rax
1403db37e 0f83a7000000 jae 0x1403db42b
1403db384 4e8b04c1 mov r8, qword ptr [rcx + r8*8]
1403db388 4d85c0 test r8, r8
1403db38b 0f849a000000 je 0x1403db42b
1403db391 49f7d0 not r8
1403db394 496bd838 imul rbx, r8, 0x38
1403db398 41807c1c3000 cmp byte ptr [r12 + rbx + 0x30], 0
1403db39e 0f8487000000 je 0x1403db42b
1403db3a4 4c89b42410010000 mov qword ptr [rsp + 0x110], r14
1403db3ac 4c01e6 add rsi, r12
1403db3af 4d01e2 add r10, r12
1403db3b2 4d01e3 add r11, r12
1403db3b5 4c01e3 add rbx, r12
1403db3b8 bd01000000 mov ebp, 1
1403db3bd f00fc1afb0050000 lock xadd dword ptr [rdi + 0x5b0], ebp
1403db3c5 4c8b4e10 mov r9, qword ptr [rsi + 0x10]
1403db3c9 448bb2c80b0000 mov r14d, dword ptr [rdx + 0xbc8]
1403db3d0 4c8b82880b0000 mov r8, qword ptr [rdx + 0xb88]
1403db3d7 4939c0 cmp r8, rax
1403db3da 4c898c24f8000000 mov qword ptr [rsp + 0xf8], r9
1403db3e2 0f83d8000000 jae 0x1403db4c0
1403db3e8 4a8b04c1 mov rax, qword ptr [rcx + r8*8]
1403db3ec 4885c0 test rax, rax
1403db3ef 0f84cb000000 je 0x1403db4c0
1403db3f5 48f7d0 not rax
1403db3f8 486bc038 imul rax, rax, 0x38
1403db3fc 41807c043001 cmp byte ptr [r12 + rax + 0x30], 1
1403db402 0f85b8000000 jne 0x1403db4c0
1403db408 4901c4 add r12, rax
1403db40b 498b442410 mov rax, qword ptr [r12 + 0x10]
1403db410 4889442478 mov qword ptr [rsp + 0x78], rax
1403db415 498d442428 lea rax, [r12 + 0x28]
1403db41a 4889842490000000 mov qword ptr [rsp + 0x90], rax
1403db422 4983c42c add r12, 0x2c
1403db426 e99e000000 jmp 0x1403db4c9
1403db42b 48c7842420010000ffffffff mov qword ptr [rsp + 0x120], 0xffffffffffffffff
1403db437 488d05ba3ca205 lea rax, [rip + 0x5a23cba]
1403db43e 4889842428010000 mov qword ptr [rsp + 0x128], rax
1403db446 48c784243001000017000000 mov qword ptr [rsp + 0x130], 0x17
1403db452 48c7842438010000ffffffff mov qword ptr [rsp + 0x138], 0xffffffffffffffff
1403db45e 48c784244001000001000000 mov qword ptr [rsp + 0x140], 1
1403db46a 48c784244801000000000000 mov qword ptr [rsp + 0x148], 0
1403db476 c684245001000000 mov byte ptr [rsp + 0x150], 0
1403db47e 488d8c2420010000 lea rcx, [rsp + 0x120]
1403db486 e855158205 call 0x145bfc9e0
1403db48b 49c706feffffff mov qword ptr [r14], 0xfffffffffffffffe
1403db492 49894608 mov qword ptr [r14 + 8], rax
1403db496 49c7461017000000 mov qword ptr [r14 + 0x10], 0x17
1403db49e 49c74618ffffffff mov qword ptr [r14 + 0x18], 0xffffffffffffffff
1403db4a6 49c7462001000000 mov qword ptr [r14 + 0x20], 1
1403db4ae 49c7462800000000 mov qword ptr [r14 + 0x28], 0
1403db4b6 41c6463000 mov byte ptr [r14 + 0x30], 0
1403db4bb e942040000 jmp 0x1403db902
1403db4c0 48c744247800000000 mov qword ptr [rsp + 0x78], 0
1403db4c9 498b4210 mov rax, qword ptr [r10 + 0x10]
1403db4cd 48898424d8000000 mov qword ptr [rsp + 0xd8], rax
1403db4d5 498b4310 mov rax, qword ptr [r11 + 0x10]
1403db4d9 48898424e0000000 mov qword ptr [rsp + 0xe0], rax
1403db4e1 498d432c lea rax, [r11 + 0x2c]
1403db4e5 48898424e8000000 mov qword ptr [rsp + 0xe8], rax
1403db4ed 4983c328 add r11, 0x28
1403db4f1 4c899c24a8000000 mov qword ptr [rsp + 0xa8], r11
1403db4f9 498d422c lea rax, [r10 + 0x2c]
1403db4fd 48898424d0000000 mov qword ptr [rsp + 0xd0], rax
1403db505 4983c228 add r10, 0x28
1403db509 4c899424a0000000 mov qword ptr [rsp + 0xa0], r10
1403db511 488d462c lea rax, [rsi + 0x2c]
1403db515 48898424b0000000 mov qword ptr [rsp + 0xb0], rax
1403db51d 4883c628 add rsi, 0x28
1403db521 4889b42498000000 mov qword ptr [rsp + 0x98], rsi
1403db529 488d4718 lea rax, [rdi + 0x18]
1403db52d 4889842400010000 mov qword ptr [rsp + 0x100], rax
1403db535 488d82a80b0000 lea rax, [rdx + 0xba8]
1403db53c 4889842408010000 mov qword ptr [rsp + 0x108], rax
1403db544 488d82680a0000 lea rax, [rdx + 0xa68]
1403db54b 4889842488000000 mov qword ptr [rsp + 0x88], rax
1403db553 488d8238090000 lea rax, [rdx + 0x938]
1403db55a 4889842480000000 mov qword ptr [rsp + 0x80], rax
1403db562 4c8daa10080000 lea r13, [rdx + 0x810]
1403db569 488db2f0060000 lea rsi, [rdx + 0x6f0]
1403db570 488d8250010000 lea rax, [rdx + 0x150]
1403db577 48898424f0000000 mov qword ptr [rsp + 0xf0], rax
1403db57f 488d4a38 lea rcx, [rdx + 0x38]
1403db583 48898c24c8000000 mov qword ptr [rsp + 0xc8], rcx
1403db58b 488b4310 mov rax, qword ptr [rbx + 0x10]
1403db58f 48898424c0000000 mov qword ptr [rsp + 0xc0], rax
1403db597 488d4328 lea rax, [rbx + 0x28]
1403db59b 48898424b8000000 mov qword ptr [rsp + 0xb8], rax
1403db5a3 4883c32c add rbx, 0x2c
1403db5a7 4989d7 mov r15, rdx
1403db5aa 4889fa mov rdx, rdi
1403db5ad e8fe75faff call 0x140382bb0
1403db5b2 410fb687cc0b0000 movzx eax, byte ptr [r15 + 0xbcc]
1403db5ba 88442477 mov byte ptr [rsp + 0x77], al
1403db5be 4889f1 mov rcx, rsi
1403db5c1 4889fa mov rdx, rdi
1403db5c4 e8f7b6fbff call 0x140396cc0
1403db5c9 4c89e9 mov rcx, r13
1403db5cc 4889fa mov rdx, rdi
1403db5cf e82cdefaff call 0x140389400
1403db5d4 488b8c2480000000 mov rcx, qword ptr [rsp + 0x80]
1403db5dc 4889fa mov rdx, rdi
1403db5df e85c35fcff call 0x14039eb40
1403db5e4 488b8c2488000000 mov rcx, qword ptr [rsp + 0x88]
1403db5ec 4889fa mov rdx, rdi
1403db5ef e8bc75faff call 0x140382bb0
1403db5f4 488b8424f8000000 mov rax, qword ptr [rsp + 0xf8]
1403db5fc 4889842448010000 mov qword ptr [rsp + 0x148], rax
1403db604 488b842498000000 mov rax, qword ptr [rsp + 0x98]
1403db60c 4889842450010000 mov qword ptr [rsp + 0x150], rax
1403db614 488b8424b0000000 mov rax, qword ptr [rsp + 0xb0]
1403db61c 4889842458010000 mov qword ptr [rsp + 0x158], rax
1403db624 4489b42460010000 mov dword ptr [rsp + 0x160], r14d
1403db62c 89ac2464010000 mov dword ptr [rsp + 0x164], ebp
1403db633 488b442478 mov rax, qword ptr [rsp + 0x78]
1403db638 4889842460020000 mov qword ptr [rsp + 0x260], rax
1403db640 488b842490000000 mov rax, qword ptr [rsp + 0x90]
1403db648 4889842468020000 mov qword ptr [rsp + 0x268], rax
1403db650 4c89a42470020000 mov qword ptr [rsp + 0x270], r12
1403db658 4489b42478020000 mov dword ptr [rsp + 0x278], r14d
1403db660 89ac247c020000 mov dword ptr [rsp + 0x27c], ebp
1403db667 488b8424d8000000 mov rax, qword ptr [rsp + 0xd8]
1403db66f 4889842468010000 mov qword ptr [rsp + 0x168], rax
1403db677 488b8424a0000000 mov rax, qword ptr [rsp + 0xa0]
1403db67f 4889842470010000 mov qword ptr [rsp + 0x170], rax
1403db687 488b8424d0000000 mov rax, qword ptr [rsp + 0xd0]
1403db68f 4889842478010000 mov qword ptr [rsp + 0x178], rax
1403db697 4489b42480010000 mov dword ptr [rsp + 0x180], r14d
1403db69f 89ac2484010000 mov dword ptr [rsp + 0x184], ebp
1403db6a6 488b8424e0000000 mov rax, qword ptr [rsp + 0xe0]
1403db6ae 4889842488010000 mov qword ptr [rsp + 0x188], rax
1403db6b6 488b8424a8000000 mov rax, qword ptr [rsp + 0xa8]
1403db6be 4889842490010000 mov qword ptr [rsp + 0x190], rax
1403db6c6 488b8424e8000000 mov rax, qword ptr [rsp + 0xe8]
1403db6ce 4889842498010000 mov qword ptr [rsp + 0x198], rax
1403db6d6 4489b424a0010000 mov dword ptr [rsp + 0x1a0], r14d
1403db6de 89ac24a4010000 mov dword ptr [rsp + 0x1a4], ebp
1403db6e5 488b8424c0000000 mov rax, qword ptr [rsp + 0xc0]
1403db6ed 48898424a8010000 mov qword ptr [rsp + 0x1a8], rax
1403db6f5 488b8424b8000000 mov rax, qword ptr [rsp + 0xb8]
1403db6fd 48898424b0010000 mov qword ptr [rsp + 0x1b0], rax
1403db705 48899c24b8010000 mov qword ptr [rsp + 0x1b8], rbx
1403db70d 498d97d00b0000 lea rdx, [r15 + 0xbd0]
1403db714 4489b424c0010000 mov dword ptr [rsp + 0x1c0], r14d
1403db71c 89ac24c4010000 mov dword ptr [rsp + 0x1c4], ebp
1403db723 488b8424c8000000 mov rax, qword ptr [rsp + 0xc8]
1403db72b 48898424c8010000 mov qword ptr [rsp + 0x1c8], rax
1403db733 4c8d842448010000 lea r8, [rsp + 0x148]
1403db73b 4889bc24d0010000 mov qword ptr [rsp + 0x1d0], rdi
1403db743 4489b424d8010000 mov dword ptr [rsp + 0x1d8], r14d
1403db74b 89ac24dc010000 mov dword ptr [rsp + 0x1dc], ebp
1403db752 488b8424f0000000 mov rax, qword ptr [rsp + 0xf0]
1403db75a 48898424e0010000 mov qword ptr [rsp + 0x1e0], rax
1403db762 4c8d8c2460020000 lea r9, [rsp + 0x260]
1403db76a 4889bc24e8010000 mov qword ptr [rsp + 0x1e8], rdi
1403db772 4489b424f0010000 mov dword ptr [rsp + 0x1f0], r14d
1403db77a 0fb6442477 movzx eax, byte ptr [rsp + 0x77]
1403db77f 888424f4010000 mov byte ptr [rsp + 0x1f4], al
1403db786 488d842468010000 lea rax, [rsp + 0x168]
1403db78e 89ac24f8010000 mov dword ptr [rsp + 0x1f8], ebp
1403db795 4889b42400020000 mov qword ptr [rsp + 0x200], rsi
1403db79d 488d8c2488010000 lea rcx, [rsp + 0x188]
1403db7a5 4889bc2408020000 mov qword ptr [rsp + 0x208], rdi
1403db7ad 4489b42410020000 mov dword ptr [rsp + 0x210], r14d
1403db7b5 89ac2414020000 mov dword ptr [rsp + 0x214], ebp
1403db7bc 4c89ac2418020000 mov qword ptr [rsp + 0x218], r13
1403db7c4 4c8d9424a8010000 lea r10, [rsp + 0x1a8]
1403db7cc 4889bc2420020000 mov qword ptr [rsp + 0x220], rdi
1403db7d4 4489b42428020000 mov dword ptr [rsp + 0x228], r14d
1403db7dc 89ac242c020000 mov dword ptr [rsp + 0x22c], ebp
1403db7e3 4c8b9c2480000000 mov r11, qword ptr [rsp + 0x80]
1403db7eb 4c899c2430020000 mov qword ptr [rsp + 0x230], r11
1403db7f3 4c8d9c24c8010000 lea r11, [rsp + 0x1c8]
1403db7fb 4889bc2438020000 mov qword ptr [rsp + 0x238], rdi
1403db803 4489b42440020000 mov dword ptr [rsp + 0x240], r14d
1403db80b 89ac2444020000 mov dword ptr [rsp + 0x244], ebp
1403db812 488bb42488000000 mov rsi, qword ptr [rsp + 0x88]
1403db81a 4889b42448020000 mov qword ptr [rsp + 0x248], rsi
1403db822 488db424e0010000 lea rsi, [rsp + 0x1e0]
1403db82a 4889bc2450020000 mov qword ptr [rsp + 0x250], rdi
1403db832 4489b42458020000 mov dword ptr [rsp + 0x258], r14d
1403db83a 488d9c2400020000 lea rbx, [rsp + 0x200]
1403db842 4889942418010000 mov qword ptr [rsp + 0x118], rdx
1403db84a 488d942418020000 lea rdx, [rsp + 0x218]
1403db852 89ac245c020000 mov dword ptr [rsp + 0x25c], ebp
1403db859 4889bc2420010000 mov qword ptr [rsp + 0x120], rdi
1403db861 488dbc2430020000 lea rdi, [rsp + 0x230]
1403db869 4c8bb42400010000 mov r14, qword ptr [rsp + 0x100]
1403db871 4c89b42428010000 mov qword ptr [rsp + 0x128], r14
1403db879 4c8db42448020000 lea r14, [rsp + 0x248]
1403db881 48c784243001000000000000 mov qword ptr [rsp + 0x130], 0
1403db88d 4c89bc2438010000 mov qword ptr [rsp + 0x138], r15
1403db895 4c8ba42408010000 mov r12, qword ptr [rsp + 0x108]
1403db89d 4c89a42480020000 mov qword ptr [rsp + 0x280], r12
1403db8a5 4c89642468 mov qword ptr [rsp + 0x68], r12
1403db8aa 4c89742460 mov qword ptr [rsp + 0x60], r14
1403db8af 48897c2458 mov qword ptr [rsp + 0x58], rdi
1403db8b4 4889542450 mov qword ptr [rsp + 0x50], rdx
1403db8b9 48895c2448 mov qword ptr [rsp + 0x48], rbx
1403db8be 4889742440 mov qword ptr [rsp + 0x40], rsi
1403db8c3 4c895c2438 mov qword ptr [rsp + 0x38], r11
1403db8c8 4c89542430 mov qword ptr [rsp + 0x30], r10
1403db8cd 48894c2428 mov qword ptr [rsp + 0x28], rcx
1403db8d2 4889442420 mov qword ptr [rsp + 0x20], rax
1403db8d7 488d8c2418010000 lea rcx, [rsp + 0x118]
1403db8df 488d942420010000 lea rdx, [rsp + 0x120]
1403db8e7 e8842debff call 0x14028e670
1403db8ec 4189afc80b0000 mov dword ptr [r15 + 0xbc8], ebp
1403db8f3 4c8bb42410010000 mov r14, qword ptr [rsp + 0x110]
1403db8fb 49c706fdffffff mov qword ptr [r14], 0xfffffffffffffffd
1403db902 4c89f0 mov rax, r14
1403db905 4881c488020000 add rsp, 0x288
1403db90c 5b pop rbx
1403db90d 5d pop rbp
1403db90e 5f pop rdi
1403db90f 5e pop rsi
1403db910 415c pop r12
1403db912 415d pop r13
1403db914 415e pop r14
1403db916 415f pop r15
1403db918 c3 ret
1403db919 488d0de442a205 lea rcx, [rip + 0x5a242e4]
1403db920 4c8d054145a205 lea r8, [rip + 0x5a24541]
1403db927 ba59000000 mov edx, 0x59
1403db92c e83fdc9b05 call 0x145d99570
1403db931 0f0b ud2
1403db933 4881c2c00b0000 add rdx, 0xbc0
1403db93a 488d053f45a205 lea rax, [rip + 0x5a2453f]
1403db941 4889442428 mov qword ptr [rsp + 0x28], rax
1403db946 48c7442420df000000 mov qword ptr [rsp + 0x20], 0xdf
1403db94f 4c8d0d9243a205 lea r9, [rip + 0x5a24392]
1403db956 4c8d842420010000 lea r8, [rsp + 0x120]
1403db95e 31c9 xor ecx, ecx
1403db960 e8b8cf9605 call 0x145d4891d
1403db965 0f0b ud2
