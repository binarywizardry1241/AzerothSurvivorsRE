1459c9650 55 push rbp
1459c9651 4157 push r15
1459c9653 4156 push r14
1459c9655 4155 push r13
1459c9657 4154 push r12
1459c9659 56 push rsi
1459c965a 57 push rdi
1459c965b 53 push rbx
1459c965c 4881ec98000000 sub rsp, 0x98
1459c9663 488dac2480000000 lea rbp, [rsp + 0x80]
1459c966b 48c74510feffffff mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
1459c9673 4889d3 mov rbx, rdx
1459c9676 4c8b2a mov r13, qword ptr [rdx]
1459c9679 488b7a10 mov rdi, qword ptr [rdx + 0x10]
1459c967d 4983fd01 cmp r13, 1
1459c9681 756e jne 0x1459c96f1
1459c9683 31f6 xor esi, esi
1459c9685 48837b0800 cmp qword ptr [rbx + 8], 0
1459c968a 400f95c6 setne sil
1459c968e 4885ff test rdi, rdi
1459c9691 0f849d000000 je 0x1459c9734
1459c9697 488b4318 mov rax, qword ptr [rbx + 0x18]
1459c969b 4829f8 sub rax, rdi
1459c969e 48c1e803 shr rax, 3
1459c96a2 48bab76ddbb66ddbb66d movabs rdx, 0x6db6db6db6db6db7
1459c96ac 480fafd0 imul rdx, rax
1459c96b0 4801d6 add rsi, rdx
1459c96b3 4c6bfe38 imul r15, rsi, 0x38
1459c96b7 48b84992244992244902 movabs rax, 0x249249249249249
1459c96c1 4839c6 cmp rsi, rax
1459c96c4 775c ja 0x1459c9722
1459c96c6 48894de8 mov qword ptr [rbp - 0x18], rcx
1459c96ca 4d85ff test r15, r15
1459c96cd 7472 je 0x1459c9741
1459c96cf e82c8b63fa call 0x140002200
1459c96d4 41bc08000000 mov r12d, 8
1459c96da ba08000000 mov edx, 8
1459c96df 4c89f9 mov rcx, r15
1459c96e2 e8d98a63fa call 0x1400021c0
1459c96e7 4885c0 test rax, rax
1459c96ea 7439 je 0x1459c9725
1459c96ec 4989c6 mov r14, rax
1459c96ef eb58 jmp 0x1459c9749
1459c96f1 4885ff test rdi, rdi
1459c96f4 743c je 0x1459c9732
1459c96f6 488b4318 mov rax, qword ptr [rbx + 0x18]
1459c96fa 4829f8 sub rax, rdi
1459c96fd 48c1e803 shr rax, 3
1459c9701 48beb76ddbb66ddbb66d movabs rsi, 0x6db6db6db6db6db7
1459c970b 480faff0 imul rsi, rax
1459c970f 4c6bfe38 imul r15, rsi, 0x38
1459c9713 48b84992244992244902 movabs rax, 0x249249249249249
1459c971d 4839c6 cmp rsi, rax
1459c9720 76a4 jbe 0x1459c96c6
1459c9722 4531e4 xor r12d, r12d
1459c9725 4c89e1 mov rcx, r12
1459c9728 4c89fa mov rdx, r15
1459c972b e88bfb3c00 call 0x145d992bb
1459c9730 0f0b ud2
1459c9732 31f6 xor esi, esi
1459c9734 4c6bfe38 imul r15, rsi, 0x38
1459c9738 48894de8 mov qword ptr [rbp - 0x18], rcx
1459c973c 4d85ff test r15, r15
1459c973f 758e jne 0x1459c96cf
1459c9741 41be08000000 mov r14d, 8
1459c9747 31f6 xor esi, esi
1459c9749 488975f0 mov qword ptr [rbp - 0x10], rsi
1459c974d 4c8975f8 mov qword ptr [rbp - 8], r14
1459c9751 48c7450000000000 mov qword ptr [rbp], 0
1459c9759 4584ed test r13b, r13b
1459c975c 742f je 0x1459c978d
1459c975e 4531c0 xor r8d, r8d
1459c9761 48837b0800 cmp qword ptr [rbx + 8], 0
1459c9766 410f95c0 setne r8b
1459c976a 4885ff test rdi, rdi
1459c976d 7440 je 0x1459c97af
1459c976f 488b4318 mov rax, qword ptr [rbx + 0x18]
1459c9773 4829f8 sub rax, rdi
1459c9776 48c1e803 shr rax, 3
1459c977a 48b9b76ddbb66ddbb66d movabs rcx, 0x6db6db6db6db6db7
1459c9784 480fafc8 imul rcx, rax
1459c9788 4901c8 add r8, rcx
1459c978b eb22 jmp 0x1459c97af
1459c978d 4885ff test rdi, rdi
1459c9790 0f84d5000000 je 0x1459c986b
1459c9796 488b4318 mov rax, qword ptr [rbx + 0x18]
1459c979a 4829f8 sub rax, rdi
1459c979d 48c1e803 shr rax, 3
1459c97a1 49b8b76ddbb66ddbb66d movabs r8, 0x6db6db6db6db6db7
1459c97ab 4c0fafc0 imul r8, rax
1459c97af 4939f0 cmp r8, rsi
1459c97b2 0f87e0000000 ja 0x1459c9898
1459c97b8 31f6 xor esi, esi
1459c97ba 4584ed test r13b, r13b
1459c97bd 747c je 0x1459c983b
1459c97bf 4c8b7b08 mov r15, qword ptr [rbx + 8]
1459c97c3 4d85ff test r15, r15
1459c97c6 7473 je 0x1459c983b
1459c97c8 4d8b6718 mov r12, qword ptr [r15 + 0x18]
1459c97cc 488975e0 mov qword ptr [rbp - 0x20], rsi
1459c97d0 c6450f01 mov byte ptr [rbp + 0xf], 1
1459c97d4 488d4da8 lea rcx, [rbp - 0x58]
1459c97d8 4c89fa mov rdx, r15
1459c97db e8103b2000 call 0x145bcd2f0
1459c97e0 90 nop
1459c97e1 410fb74730 movzx eax, word ptr [r15 + 0x30]
1459c97e6 410fb64f32 movzx ecx, byte ptr [r15 + 0x32]
1459c97eb 410fb65737 movzx edx, byte ptr [r15 + 0x37]
1459c97f0 8855df mov byte ptr [rbp - 0x21], dl
1459c97f3 418b5733 mov edx, dword ptr [r15 + 0x33]
1459c97f7 8955db mov dword ptr [rbp - 0x25], edx
1459c97fa 4c8965c0 mov qword ptr [rbp - 0x40], r12
1459c97fe 668945d8 mov word ptr [rbp - 0x28], ax
1459c9802 884dda mov byte ptr [rbp - 0x26], cl
1459c9805 410f104720 movups xmm0, xmmword ptr [r15 + 0x20]
1459c980a 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
1459c980e 486bc638 imul rax, rsi, 0x38
1459c9812 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1459c9816 49894c0630 mov qword ptr [r14 + rax + 0x30], rcx
1459c981b 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
1459c981f 410f11440610 movups xmmword ptr [r14 + rax + 0x10], xmm0
1459c9825 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
1459c9829 410f110406 movups xmmword ptr [r14 + rax], xmm0
1459c982e 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
1459c9832 410f11440620 movups xmmword ptr [r14 + rax + 0x20], xmm0
1459c9838 48ffc6 inc rsi
1459c983b 4885ff test rdi, rdi
1459c983e 742d je 0x1459c986d
1459c9840 488d4500 lea rax, [rbp]
1459c9844 488b5318 mov rdx, qword ptr [rbx + 0x18]
1459c9848 488945a8 mov qword ptr [rbp - 0x58], rax
1459c984c 488975b0 mov qword ptr [rbp - 0x50], rsi
1459c9850 4c8975b8 mov qword ptr [rbp - 0x48], r14
1459c9854 488975e0 mov qword ptr [rbp - 0x20], rsi
1459c9858 c6450f00 mov byte ptr [rbp + 0xf], 0
1459c985c 4c8d45a8 lea r8, [rbp - 0x58]
1459c9860 4889f9 mov rcx, rdi
1459c9863 e878eef1ff call 0x1458e86e0
1459c9868 90 nop
1459c9869 eb06 jmp 0x1459c9871
1459c986b 31f6 xor esi, esi
1459c986d 48897500 mov qword ptr [rbp], rsi
1459c9871 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459c9875 488b4d00 mov rcx, qword ptr [rbp]
1459c9879 48894810 mov qword ptr [rax + 0x10], rcx
1459c987d 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
1459c9881 0f1100 movups xmmword ptr [rax], xmm0
1459c9884 4881c498000000 add rsp, 0x98
1459c988b 5b pop rbx
1459c988c 5f pop rdi
1459c988d 5e pop rsi
1459c988e 415c pop r12
1459c9890 415d pop r13
1459c9892 415e pop r14
1459c9894 415f pop r15
1459c9896 5d pop rbp
1459c9897 c3 ret
1459c9898 48c744242038000000 mov qword ptr [rsp + 0x20], 0x38
1459c98a1 488d4df0 lea rcx, [rbp - 0x10]
1459c98a5 41b908000000 mov r9d, 8
1459c98ab 31d2 xor edx, edx
1459c98ad e8be102300 call 0x145bfa970
1459c98b2 90 nop
1459c98b3 4c8b75f8 mov r14, qword ptr [rbp - 8]
1459c98b7 488b7500 mov rsi, qword ptr [rbp]
1459c98bb 4584ed test r13b, r13b
1459c98be 0f85fbfeffff jne 0x1459c97bf
1459c98c4 e972ffffff jmp 0x1459c983b
