1458ae35c 0f84100d0000 je 0x1458af072
1458ae362 488b8d28050000 mov rcx, qword ptr [rbp + 0x528]
1458ae369 488b9188060000 mov rdx, qword ptr [rcx + 0x688]
1458ae370 488b8190060000 mov rax, qword ptr [rcx + 0x690]
1458ae377 48898520050000 mov qword ptr [rbp + 0x520], rax
1458ae37e 488b8198060000 mov rax, qword ptr [rcx + 0x698]
1458ae385 48c7818806000000000000 mov qword ptr [rcx + 0x688], 0
1458ae390 48c7819006000004000000 mov qword ptr [rcx + 0x690], 4
1458ae39b 48c7819806000000000000 mov qword ptr [rcx + 0x698], 0
1458ae3a6 4883faff cmp rdx, -1
1458ae3aa 0f84680a0000 je 0x1458aee18
1458ae3b0 48899500050000 mov qword ptr [rbp + 0x500], rdx
1458ae3b7 4885c0 test rax, rax
1458ae3ba 0f84360a0000 je 0x1458aedf6
1458ae3c0 488b8d28050000 mov rcx, qword ptr [rbp + 0x528]
1458ae3c7 488b91a0100000 mov rdx, qword ptr [rcx + 0x10a0]
1458ae3ce 488995f0040000 mov qword ptr [rbp + 0x4f0], rdx
1458ae3d5 440fb6a915030000 movzx r13d, byte ptr [rcx + 0x315]
1458ae3dd 488bbd20050000 mov rdi, qword ptr [rbp + 0x520]
1458ae3e4 4c8d2487 lea r12, [rdi + rax*4]
1458ae3e8 488d81200b0000 lea rax, [rcx + 0xb20]
1458ae3ef 48898578040000 mov qword ptr [rbp + 0x478], rax
1458ae3f6 488d8128060000 lea rax, [rcx + 0x628]
1458ae3fd 48898580040000 mov qword ptr [rbp + 0x480], rax
1458ae404 488d81500b0000 lea rax, [rcx + 0xb50]
1458ae40b 48898590040000 mov qword ptr [rbp + 0x490], rax
1458ae412 488d8140060000 lea rax, [rcx + 0x640]
1458ae419 48898588040000 mov qword ptr [rbp + 0x488], rax
1458ae420 48c7851005000000000000 mov qword ptr [rbp + 0x510], 0
1458ae42b 4c8dbda0000000 lea r15, [rbp + 0xa0]
1458ae432 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458ae440 4c39e7 cmp rdi, r12
1458ae443 0f84a2080000 je 0x1458aeceb
1458ae449 8b1f mov ebx, dword ptr [rdi]
1458ae44b 89da mov edx, ebx
1458ae44d 4183fd08 cmp r13d, 8
1458ae451 771b ja 0x1458ae46e
1458ae453 b864010000 mov eax, 0x164
1458ae458 440fa3e8 bt eax, r13d
1458ae45c 89da mov edx, ebx
1458ae45e 730e jae 0x1458ae46e
1458ae460 89da mov edx, ebx
1458ae462 81fba0860100 cmp ebx, 0x186a0
1458ae468 0f83c2000000 jae 0x1458ae530
1458ae46e 4c89f9 mov rcx, r15
1458ae471 e82a670f00 call 0x1459a4ba0
1458ae476 90 nop
1458ae477 4883c704 add rdi, 4
1458ae47b 4883bda0000000ff cmp qword ptr [rbp + 0xa0], -1
1458ae483 74bb je 0x1458ae440
1458ae485 0f108500010000 movups xmm0, xmmword ptr [rbp + 0x100]
1458ae48c 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
1458ae493 0f1085f0000000 movups xmm0, xmmword ptr [rbp + 0xf0]
1458ae49a 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
1458ae4a1 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
1458ae4a8 0f2985c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm0
1458ae4af 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
1458ae4b6 0f108db0000000 movups xmm1, xmmword ptr [rbp + 0xb0]
1458ae4bd 0f1095c0000000 movups xmm2, xmmword ptr [rbp + 0xc0]
1458ae4c4 0f109dd0000000 movups xmm3, xmmword ptr [rbp + 0xd0]
1458ae4cb 0f299db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm3
1458ae4d2 0f2995a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm2
1458ae4d9 0f298d90030000 movaps xmmword ptr [rbp + 0x390], xmm1
1458ae4e0 0f298580030000 movaps xmmword ptr [rbp + 0x380], xmm0
1458ae4e7 4881bdf0040000ffffff00 cmp qword ptr [rbp + 0x4f0], 0xffffff
1458ae4f2 0f849b000000 je 0x1458ae593
1458ae4f8 488b8d28050000 mov rcx, qword ptr [rbp + 0x528]
1458ae4ff 488b81580b0000 mov rax, qword ptr [rcx + 0xb58]
1458ae506 488bb1600b0000 mov rsi, qword ptr [rcx + 0xb60]
1458ae50d 4989f6 mov r14, rsi
1458ae510 4885f6 test rsi, rsi
1458ae513 0f8403010000 je 0x1458ae61c
1458ae519 4883fe01 cmp rsi, 1
1458ae51d 0f85c5000000 jne 0x1458ae5e8
1458ae523 4531f6 xor r14d, r14d
1458ae526 e9e2000000 jmp 0x1458ae60d
1458ae52b 0f1f440000 nop dword ptr [rax + rax]
1458ae530 8d836079feff lea eax, [rbx - 0x186a0]
1458ae536 89da mov edx, ebx
1458ae538 3ddf2e0000 cmp eax, 0x2edf
1458ae53d 0f872bffffff ja 0x1458ae46e
1458ae543 4889c1 mov rcx, rax
1458ae546 bacdcccccc mov edx, 0xcccccccd
1458ae54b 480fafca imul rcx, rdx
1458ae54f 48c1e923 shr rcx, 0x23
1458ae553 01c9 add ecx, ecx
1458ae555 8d0c89 lea ecx, [rcx + rcx*4]
1458ae558 4189c0 mov r8d, eax
1458ae55b 89da mov edx, ebx
1458ae55d 4129c8 sub r8d, ecx
1458ae560 0f8508ffffff jne 0x1458ae46e
1458ae566 69c0cdcc0000 imul eax, eax, 0xcccd
1458ae56c c1e813 shr eax, 0x13
1458ae56f 69c0cdccffff imul eax, eax, 0xffffcccd
1458ae575 ffc8 dec eax
1458ae577 66d1c8 ror ax, 1
1458ae57a 0fb7c0 movzx eax, ax
1458ae57d 3d9a190000 cmp eax, 0x199a
1458ae582 7207 jb 0x1458ae58b
1458ae584 89da mov edx, ebx
1458ae586 e9e3feffff jmp 0x1458ae46e
1458ae58b 8d530a lea edx, [rbx + 0xa]
1458ae58e e9dbfeffff jmp 0x1458ae46e
1458ae593 488b8528050000 mov rax, qword ptr [rbp + 0x528]
1458ae59a 488b88600b0000 mov rcx, qword ptr [rax + 0xb60]
1458ae5a1 4885c9 test rcx, rcx
1458ae5a4 0f84ce000000 je 0x1458ae678
1458ae5aa 488b80580b0000 mov rax, qword ptr [rax + 0xb58]
1458ae5b1 31d2 xor edx, edx
1458ae5b3 4883f901 cmp rcx, 1
1458ae5b7 7423 je 0x1458ae5dc
1458ae5b9 0f1f8000000000 nop dword ptr [rax]
1458ae5c0 4989d0 mov r8, rdx
1458ae5c3 4989c9 mov r9, rcx
1458ae5c6 49d1e9 shr r9, 1
1458ae5c9 4c01ca add rdx, r9
1458ae5cc 391c90 cmp dword ptr [rax + rdx*4], ebx
1458ae5cf 490f47d0 cmova rdx, r8
1458ae5d3 4c29c9 sub rcx, r9
1458ae5d6 4883f901 cmp rcx, 1
1458ae5da 77e4 ja 0x1458ae5c0
1458ae5dc 391c90 cmp dword ptr [rax + rdx*4], ebx
1458ae5df 410f95c6 setne r14b
1458ae5e3 e993000000 jmp 0x1458ae67b
1458ae5e8 4889f1 mov rcx, rsi
1458ae5eb 4531f6 xor r14d, r14d
1458ae5ee 6690 nop
1458ae5f0 4c89f2 mov rdx, r14
1458ae5f3 4989c8 mov r8, rcx
1458ae5f6 49d1e8 shr r8, 1
1458ae5f9 4d01c6 add r14, r8
1458ae5fc 42391cb0 cmp dword ptr [rax + r14*4], ebx
1458ae600 4c0f47f2 cmova r14, rdx
1458ae604 4c29c1 sub rcx, r8
1458ae607 4883f901 cmp rcx, 1
1458ae60b 77e3 ja 0x1458ae5f0
1458ae60d 42391cb0 cmp dword ptr [rax + r14*4], ebx
1458ae611 7505 jne 0x1458ae618
1458ae613 4531f6 xor r14d, r14d
1458ae616 eb63 jmp 0x1458ae67b
1458ae618 4983d600 adc r14, 0
1458ae61c 488b8d90040000 mov rcx, qword ptr [rbp + 0x490]
1458ae623 483b31 cmp rsi, qword ptr [rcx]
1458ae626 751b jne 0x1458ae643
1458ae628 488b8d90040000 mov rcx, qword ptr [rbp + 0x490]
1458ae62f e88c0b3500 call 0x145bff1c0
1458ae634 90 nop
1458ae635 488b8528050000 mov rax, qword ptr [rbp + 0x528]
1458ae63c 488b80580b0000 mov rax, qword ptr [rax + 0xb58]
1458ae643 4a8d04b0 lea rax, [rax + r14*4]
1458ae647 4989f0 mov r8, rsi
1458ae64a 4d29f0 sub r8, r14
1458ae64d 7616 jbe 0x1458ae665
1458ae64f 488d4804 lea rcx, [rax + 4]
1458ae653 49c1e002 shl r8, 2
1458ae657 4989c6 mov r14, rax
1458ae65a 4889c2 mov rdx, rax
1458ae65d e88bba3400 call 0x145bfa0ed
1458ae662 4c89f0 mov rax, r14
1458ae665 8918 mov dword ptr [rax], ebx
1458ae667 48ffc6 inc rsi
1458ae66a 488b8528050000 mov rax, qword ptr [rbp + 0x528]
1458ae671 4889b0600b0000 mov qword ptr [rax + 0xb60], rsi
1458ae678 41b601 mov r14b, 1
