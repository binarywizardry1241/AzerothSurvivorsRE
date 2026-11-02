1400ce690 4157 push r15
1400ce692 4156 push r14
1400ce694 4155 push r13
1400ce696 4154 push r12
1400ce698 56 push rsi
1400ce699 57 push rdi
1400ce69a 55 push rbp
1400ce69b 53 push rbx
1400ce69c 4881ecd8010000 sub rsp, 0x1d8
1400ce6a3 440f29bc24c0010000 movaps xmmword ptr [rsp + 0x1c0], xmm15
1400ce6ac 440f29b424b0010000 movaps xmmword ptr [rsp + 0x1b0], xmm14
1400ce6b5 440f29ac24a0010000 movaps xmmword ptr [rsp + 0x1a0], xmm13
1400ce6be 440f29a42490010000 movaps xmmword ptr [rsp + 0x190], xmm12
1400ce6c7 440f299c2480010000 movaps xmmword ptr [rsp + 0x180], xmm11
1400ce6d0 440f29942470010000 movaps xmmword ptr [rsp + 0x170], xmm10
1400ce6d9 440f298c2460010000 movaps xmmword ptr [rsp + 0x160], xmm9
1400ce6e2 440f29842450010000 movaps xmmword ptr [rsp + 0x150], xmm8
1400ce6eb 0f29bc2440010000 movaps xmmword ptr [rsp + 0x140], xmm7
1400ce6f3 0f29b42430010000 movaps xmmword ptr [rsp + 0x130], xmm6
1400ce6fb 488b842450020000 mov rax, qword ptr [rsp + 0x250]
1400ce703 4c8b9c2448020000 mov r11, qword ptr [rsp + 0x248]
1400ce70b 488bb42440020000 mov rsi, qword ptr [rsp + 0x240]
1400ce713 488b12 mov rdx, qword ptr [rdx]
1400ce716 498b38 mov rdi, qword ptr [r8]
1400ce719 498b4808 mov rcx, qword ptr [r8 + 8]
1400ce71d 458b4014 mov r8d, dword ptr [r8 + 0x14]
1400ce721 4489842490000000 mov dword ptr [rsp + 0x90], r8d
1400ce729 4d8b01 mov r8, qword ptr [r9]
1400ce72c 4c89442458 mov qword ptr [rsp + 0x58], r8
1400ce731 4d8b5108 mov r10, qword ptr [r9 + 8]
1400ce735 458b4114 mov r8d, dword ptr [r9 + 0x14]
1400ce739 4489442478 mov dword ptr [rsp + 0x78], r8d
1400ce73e 4c8b0e mov r9, qword ptr [rsi]
1400ce741 4c898c2498000000 mov qword ptr [rsp + 0x98], r9
1400ce749 4c8b4e08 mov r9, qword ptr [rsi + 8]
1400ce74d 4c898c24a8000000 mov qword ptr [rsp + 0xa8], r9
1400ce755 448b4e14 mov r9d, dword ptr [rsi + 0x14]
1400ce759 44898c24c8000000 mov dword ptr [rsp + 0xc8], r9d
1400ce761 4d8b0b mov r9, qword ptr [r11]
1400ce764 4c898c24c0000000 mov qword ptr [rsp + 0xc0], r9
1400ce76c 4d8b4b08 mov r9, qword ptr [r11 + 8]
1400ce770 4c898c24f8000000 mov qword ptr [rsp + 0xf8], r9
1400ce778 458b4b14 mov r9d, dword ptr [r11 + 0x14]
1400ce77c 44898c24b4000000 mov dword ptr [rsp + 0xb4], r9d
1400ce784 4c8b08 mov r9, qword ptr [rax]
1400ce787 4c898c2400010000 mov qword ptr [rsp + 0x100], r9
1400ce78f f30f10725c movss xmm6, dword ptr [rdx + 0x5c]
1400ce794 488b5008 mov rdx, qword ptr [rax + 8]
1400ce798 48899424e8000000 mov qword ptr [rsp + 0xe8], rdx
1400ce7a0 8b4014 mov eax, dword ptr [rax + 0x14]
1400ce7a3 898424b0000000 mov dword ptr [rsp + 0xb0], eax
1400ce7aa 488b842458020000 mov rax, qword ptr [rsp + 0x258]
1400ce7b2 488b10 mov rdx, qword ptr [rax]
1400ce7b5 48899424a0000000 mov qword ptr [rsp + 0xa0], rdx
1400ce7bd 488b5008 mov rdx, qword ptr [rax + 8]
1400ce7c1 48899424f0000000 mov qword ptr [rsp + 0xf0], rdx
1400ce7c9 8b4014 mov eax, dword ptr [rax + 0x14]
1400ce7cc 898424cc000000 mov dword ptr [rsp + 0xcc], eax
1400ce7d3 4c8b9ff8000000 mov r11, qword ptr [rdi + 0xf8]
1400ce7da 488b8700010000 mov rax, qword ptr [rdi + 0x100]
1400ce7e1 4d8d2483 lea r12, [r11 + rax*4]
1400ce7e5 f30f1005c379cd05 movss xmm0, dword ptr [rip + 0x5cd79c3]
1400ce7ed f30f100d1b8ecc05 movss xmm1, dword ptr [rip + 0x5cc8e1b]
1400ce7f5 f30f1015a3e8cf05 movss xmm2, dword ptr [rip + 0x5cfe8a3]
1400ce7fd 0f57db xorps xmm3, xmm3
1400ce800 f30f1025b479cd05 movss xmm4, dword ptr [rip + 0x5cd79b4]
1400ce808 f30f102d94e8cf05 movss xmm5, dword ptr [rip + 0x5cfe894]
1400ce810 f30f103d90e8cf05 movss xmm7, dword ptr [rip + 0x5cfe890]
1400ce818 f3440f10058be8cf05 movss xmm8, dword ptr [rip + 0x5cfe88b]
1400ce821 f3440f100dce79cd05 movss xmm9, dword ptr [rip + 0x5cd79ce]
1400ce82a 4889bc24b8000000 mov qword ptr [rsp + 0xb8], rdi
1400ce832 0fb68708010000 movzx eax, byte ptr [rdi + 0x108]
1400ce839 88442468 mov byte ptr [rsp + 0x68], al
1400ce83d b808000000 mov eax, 8
1400ce842 4889842488000000 mov qword ptr [rsp + 0x88], rax
1400ce84a 48c744247000000000 mov qword ptr [rsp + 0x70], 0
1400ce853 48c744246000000000 mov qword ptr [rsp + 0x60], 0
1400ce85c 31c0 xor eax, eax
1400ce85e 31db xor ebx, ebx
1400ce860 807c246800 cmp byte ptr [rsp + 0x68], 0
1400ce865 0f8495000000 je 0x1400ce900
1400ce86b 39d8 cmp eax, ebx
1400ce86d 0f8561010000 jne 0x1400ce9d4
1400ce873 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ce880 4d39e3 cmp r11, r12
1400ce883 0f84d5030000 je 0x1400cec5e
1400ce889 418b33 mov esi, dword ptr [r11]
1400ce88c 4983c304 add r11, 4
1400ce890 488b81a8010000 mov rax, qword ptr [rcx + 0x1a8]
1400ce897 488d34f6 lea rsi, [rsi + rsi*8]
1400ce89b 488b5cf010 mov rbx, qword ptr [rax + rsi*8 + 0x10]
1400ce8a0 4885db test rbx, rbx
1400ce8a3 74db je 0x1400ce880
1400ce8a5 488d34f0 lea rsi, [rax + rsi*8]
1400ce8a9 488b8424b8000000 mov rax, qword ptr [rsp + 0xb8]
1400ce8b1 488bb810010000 mov rdi, qword ptr [rax + 0x110]
1400ce8b8 488b4638 mov rax, qword ptr [rsi + 0x38]
1400ce8bc 483b7e40 cmp rdi, qword ptr [rsi + 0x40]
1400ce8c0 0f83ca000000 jae 0x1400ce990
1400ce8c6 488b3cf8 mov rdi, qword ptr [rax + rdi*8]
1400ce8ca 488b7618 mov rsi, qword ptr [rsi + 0x18]
1400ce8ce 4885ff test rdi, rdi
1400ce8d1 0f84bd000000 je 0x1400ce994
1400ce8d7 48f7d7 not rdi
1400ce8da 488d3c7f lea rdi, [rdi + rdi*2]
1400ce8de 48c1e704 shl rdi, 4
1400ce8e2 4c8b443e10 mov r8, qword ptr [rsi + rdi + 0x10]
1400ce8e7 4c89442460 mov qword ptr [rsp + 0x60], r8
1400ce8ec e9ac000000 jmp 0x1400ce99d
1400ce8f1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ce900 39d8 cmp eax, ebx
1400ce902 0f8520010000 jne 0x1400cea28
1400ce908 0f1f840000000000 nop dword ptr [rax + rax]
1400ce910 4d39e3 cmp r11, r12
1400ce913 0f8445030000 je 0x1400cec5e
1400ce919 418b33 mov esi, dword ptr [r11]
1400ce91c 4983c304 add r11, 4
1400ce920 488b8108010000 mov rax, qword ptr [rcx + 0x108]
1400ce927 488d34b6 lea rsi, [rsi + rsi*4]
1400ce92b 48c1e605 shl rsi, 5
1400ce92f 488b5c3058 mov rbx, qword ptr [rax + rsi + 0x58]
1400ce934 4885db test rbx, rbx
1400ce937 74d7 je 0x1400ce910
1400ce939 4801f0 add rax, rsi
1400ce93c 8bb094000000 mov esi, dword ptr [rax + 0x94]
1400ce942 4c8bb9a8010000 mov r15, qword ptr [rcx + 0x1a8]
1400ce949 4c8d2cf6 lea r13, [rsi + rsi*8]
1400ce94d 4b8d3cef lea rdi, [r15 + r13*8]
1400ce951 4c8b8c24b8000000 mov r9, qword ptr [rsp + 0xb8]
1400ce959 4d8bb110010000 mov r14, qword ptr [r9 + 0x110]
1400ce960 4b8b74ef38 mov rsi, qword ptr [r15 + r13*8 + 0x38]
1400ce965 4f3b74ef40 cmp r14, qword ptr [r15 + r13*8 + 0x40]
1400ce96a 736c jae 0x1400ce9d8
1400ce96c 4e8b34f6 mov r14, qword ptr [rsi + r14*8]
1400ce970 488b7f18 mov rdi, qword ptr [rdi + 0x18]
1400ce974 4d85f6 test r14, r14
1400ce977 7463 je 0x1400ce9dc
1400ce979 49f7d6 not r14
1400ce97c 4f8d3476 lea r14, [r14 + r14*2]
1400ce980 49c1e604 shl r14, 4
1400ce984 4e8b443710 mov r8, qword ptr [rdi + r14 + 0x10]
1400ce989 4c89442460 mov qword ptr [rsp + 0x60], r8
1400ce98e eb55 jmp 0x1400ce9e5
1400ce990 488b7618 mov rsi, qword ptr [rsi + 0x18]
1400ce994 48c744246000000000 mov qword ptr [rsp + 0x60], 0
1400ce99d 4c8b8c24b8000000 mov r9, qword ptr [rsp + 0xb8]
1400ce9a5 498bb918010000 mov rdi, qword ptr [r9 + 0x118]
1400ce9ac 488b04f8 mov rax, qword ptr [rax + rdi*8]
1400ce9b0 48f7d0 not rax
1400ce9b3 488d0440 lea rax, [rax + rax*2]
1400ce9b7 48c1e004 shl rax, 4
1400ce9bb 4c8b440610 mov r8, qword ptr [rsi + rax + 0x10]
1400ce9c0 4c89442470 mov qword ptr [rsp + 0x70], r8
1400ce9c5 488b440628 mov rax, qword ptr [rsi + rax + 0x28]
1400ce9ca 4889842480000000 mov qword ptr [rsp + 0x80], rax
1400ce9d2 31c0 xor eax, eax
1400ce9d4 89c7 mov edi, eax
1400ce9d6 eb65 jmp 0x1400cea3d
1400ce9d8 488b7f18 mov rdi, qword ptr [rdi + 0x18]
1400ce9dc 48c744246000000000 mov qword ptr [rsp + 0x60], 0
1400ce9e5 4c8b8c24b8000000 mov r9, qword ptr [rsp + 0xb8]
1400ce9ed 4d8bb118010000 mov r14, qword ptr [r9 + 0x118]
1400ce9f4 4a8b34f6 mov rsi, qword ptr [rsi + r14*8]
1400ce9f8 48f7d6 not rsi
1400ce9fb 488d3476 lea rsi, [rsi + rsi*2]
1400ce9ff 48c1e604 shl rsi, 4
1400cea03 4c8b443710 mov r8, qword ptr [rdi + rsi + 0x10]
1400cea08 4c89442470 mov qword ptr [rsp + 0x70], r8
1400cea0d 4c8b443728 mov r8, qword ptr [rdi + rsi + 0x28]
1400cea12 4c89842480000000 mov qword ptr [rsp + 0x80], r8
1400cea1a 488b4050 mov rax, qword ptr [rax + 0x50]
1400cea1e 4889842488000000 mov qword ptr [rsp + 0x88], rax
1400cea26 31c0 xor eax, eax
1400cea28 89c6 mov esi, eax
1400cea2a 48c1e604 shl rsi, 4
1400cea2e 4c8b842488000000 mov r8, qword ptr [rsp + 0x88]
1400cea36 418b7c3008 mov edi, dword ptr [r8 + rsi + 8]
1400cea3b f7d7 not edi
1400cea3d 4c8b442460 mov r8, qword ptr [rsp + 0x60]
1400cea42 4d8d34b8 lea r14, [r8 + rdi*4]
1400cea46 488d34bf lea rsi, [rdi + rdi*4]
1400cea4a 4c8b442470 mov r8, qword ptr [rsp + 0x70]
1400cea4f 498d34b0 lea rsi, [r8 + rsi*4]
1400cea53 4c8b842480000000 mov r8, qword ptr [rsp + 0x80]
1400cea5b 498d3cb8 lea rdi, [r8 + rdi*4]
1400cea5f ffc0 inc eax
1400cea61 440f28d6 movaps xmm10, xmm6
1400cea65 f3450f5c16 subss xmm10, dword ptr [r14]
1400cea6a f3440f5ed0 divss xmm10, xmm0
1400cea6f 450f57db xorps xmm11, xmm11
1400cea73 f3450f5fda maxss xmm11, xmm10
1400cea78 440f28e1 movaps xmm12, xmm1
1400cea7c f3450f5de3 minss xmm12, xmm11
1400cea81 450f28d4 movaps xmm10, xmm12
1400cea85 f3440f59d2 mulss xmm10, xmm2
1400cea8a 448b8c2490000000 mov r9d, dword ptr [rsp + 0x90]
1400cea92 44890f mov dword ptr [rdi], r9d
1400cea95 0f111e movups xmmword ptr [rsi], xmm3
1400cea98 f3440f115610 movss dword ptr [rsi + 0x10], xmm10
1400cea9e f3440f58e4 addss xmm12, xmm4
1400ceaa3 450f28d4 movaps xmm10, xmm12
1400ceaa7 f3450f59d4 mulss xmm10, xmm12
1400ceaac f3450f59e2 mulss xmm12, xmm10
1400ceab1 f3440f59e5 mulss xmm12, xmm5
1400ceab6 f3440f58e1 addss xmm12, xmm1
1400ceabb f3440f59d7 mulss xmm10, xmm7
1400ceac0 f3450f58d4 addss xmm10, xmm12
1400ceac5 4c8b442458 mov r8, qword ptr [rsp + 0x58]
1400ceaca 4d8bb8f8000000 mov r15, qword ptr [r8 + 0xf8]
1400cead1 498bb000010000 mov rsi, qword ptr [r8 + 0x100]
1400cead8 498d34b7 lea rsi, [r15 + rsi*4]
1400ceadc f3450f59d0 mulss xmm10, xmm8
1400ceae1 f3450f58d1 addss xmm10, xmm9
1400ceae6 4180b80801000000 cmp byte ptr [r8 + 0x108], 0
1400ceaee 7410 je 0x1400ceb00
1400ceaf0 31ff xor edi, edi
1400ceaf2 4531f6 xor r14d, r14d
1400ceaf5 31ed xor ebp, ebp
1400ceaf7 eb7a jmp 0x1400ceb73
1400ceaf9 0f1f8000000000 nop dword ptr [rax]
1400ceb00 31ff xor edi, edi
1400ceb02 41be08000000 mov r14d, 8
1400ceb08 4531ed xor r13d, r13d
1400ceb0b 31ed xor ebp, ebp
1400ceb0d e914010000 jmp 0x1400cec26
1400ceb12 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ceb20 4b8d14ee lea rdx, [r14 + r13*8]
1400ceb24 4c8b442458 mov r8, qword ptr [rsp + 0x58]
1400ceb29 4d8bb010010000 mov r14, qword ptr [r8 + 0x110]
1400ceb30 4c8b6a18 mov r13, qword ptr [rdx + 0x18]
1400ceb34 488b5238 mov rdx, qword ptr [rdx + 0x38]
1400ceb38 4a8b14f2 mov rdx, qword ptr [rdx + r14*8]
1400ceb3c 48f7d2 not rdx
1400ceb3f 488d1452 lea rdx, [rdx + rdx*2]
1400ceb43 48c1e204 shl rdx, 4
1400ceb47 4d8b741510 mov r14, qword ptr [r13 + rdx + 0x10]
1400ceb4c 498b541528 mov rdx, qword ptr [r13 + rdx + 0x28]
1400ceb51 31ed xor ebp, ebp
1400ceb53 4189ed mov r13d, ebp
1400ceb56 ffc5 inc ebp
1400ceb58 448b442478 mov r8d, dword ptr [rsp + 0x78]
1400ceb5d 468904aa mov dword ptr [rdx + r13*4], r8d
1400ceb61 49c1e505 shl r13, 5
1400ceb65 f3470f11542e10 movss dword ptr [r14 + r13 + 0x10], xmm10
1400ceb6c f3470f11542e14 movss dword ptr [r14 + r13 + 0x14], xmm10
1400ceb73 39fd cmp ebp, edi
1400ceb75 75dc jne 0x1400ceb53
1400ceb77 660f1f840000000000 nop word ptr [rax + rax]
1400ceb80 4939f7 cmp r15, rsi
1400ceb83 0f84d7fcffff je 0x1400ce860
1400ceb89 418b3f mov edi, dword ptr [r15]
1400ceb8c 4983c704 add r15, 4
1400ceb90 4d8bb2a8010000 mov r14, qword ptr [r10 + 0x1a8]
1400ceb97 4c8d2cff lea r13, [rdi + rdi*8]
1400ceb9b 4b8b7cee10 mov rdi, qword ptr [r14 + r13*8 + 0x10]
1400ceba0 4885ff test rdi, rdi
1400ceba3 74db je 0x1400ceb80
1400ceba5 e976ffffff jmp 0x1400ceb20
1400cebaa 660f1f440000 nop word ptr [rax + rax]
1400cebb0 4d01ee add r14, r13
1400cebb3 418b9694000000 mov edx, dword ptr [r14 + 0x94]
1400cebba 4d8baaa8010000 mov r13, qword ptr [r10 + 0x1a8]
1400cebc1 488d14d2 lea rdx, [rdx + rdx*8]
1400cebc5 4c8b442458 mov r8, qword ptr [rsp + 0x58]
1400cebca 498ba810010000 mov rbp, qword ptr [r8 + 0x110]
1400cebd1 4d8b4cd518 mov r9, qword ptr [r13 + rdx*8 + 0x18]
1400cebd6 498b54d538 mov rdx, qword ptr [r13 + rdx*8 + 0x38]
1400cebdb 488b14ea mov rdx, qword ptr [rdx + rbp*8]
1400cebdf 48f7d2 not rdx
1400cebe2 488d1452 lea rdx, [rdx + rdx*2]
1400cebe6 48c1e204 shl rdx, 4
1400cebea 4d8b6c1110 mov r13, qword ptr [r9 + rdx + 0x10]
1400cebef 498b541128 mov rdx, qword ptr [r9 + rdx + 0x28]
1400cebf4 4d8b7650 mov r14, qword ptr [r14 + 0x50]
1400cebf8 31ed xor ebp, ebp
1400cebfa 4189e9 mov r9d, ebp
1400cebfd 49c1e104 shl r9, 4
1400cec01 ffc5 inc ebp
1400cec03 478b4c0e08 mov r9d, dword ptr [r14 + r9 + 8]
1400cec08 41f7d1 not r9d
1400cec0b 448b442478 mov r8d, dword ptr [rsp + 0x78]
1400cec10 4689048a mov dword ptr [rdx + r9*4], r8d
1400cec14 49c1e105 shl r9, 5
1400cec18 f3470f11540d10 movss dword ptr [r13 + r9 + 0x10], xmm10
1400cec1f f3470f11540d14 movss dword ptr [r13 + r9 + 0x14], xmm10
1400cec26 39fd cmp ebp, edi
1400cec28 75d0 jne 0x1400cebfa
1400cec2a 660f1f440000 nop word ptr [rax + rax]
1400cec30 4939f7 cmp r15, rsi
1400cec33 0f8427fcffff je 0x1400ce860
1400cec39 418b3f mov edi, dword ptr [r15]
1400cec3c 4983c704 add r15, 4
1400cec40 4d8bb208010000 mov r14, qword ptr [r10 + 0x108]
1400cec47 4c8d2cbf lea r13, [rdi + rdi*4]
1400cec4b 49c1e505 shl r13, 5
1400cec4f 4b8b7c2e58 mov rdi, qword ptr [r14 + r13 + 0x58]
1400cec54 4885ff test rdi, rdi
1400cec57 74d7 je 0x1400cec30
1400cec59 e952ffffff jmp 0x1400cebb0
1400cec5e 488b8c2498000000 mov rcx, qword ptr [rsp + 0x98]
1400cec66 488bb1f8000000 mov rsi, qword ptr [rcx + 0xf8]
1400cec6d 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400cec74 488d1c86 lea rbx, [rsi + rax*4]
1400cec78 0fb68108010000 movzx eax, byte ptr [rcx + 0x108]
1400cec7f 88442458 mov byte ptr [rsp + 0x58], al
1400cec83 b808000000 mov eax, 8
1400cec88 4889842488000000 mov qword ptr [rsp + 0x88], rax
1400cec90 31ed xor ebp, ebp
1400cec92 f3440f1015b9e3cf05 movss xmm10, dword ptr [rip + 0x5cfe3b9]
1400cec9b f3440f100da4e3cf05 movss xmm9, dword ptr [rip + 0x5cfe3a4]
1400ceca4 f3440f101d03e4cf05 movss xmm11, dword ptr [rip + 0x5cfe403]
1400cecad f3440f10258a89cc05 movss xmm12, dword ptr [rip + 0x5cc898a]
1400cecb6 f3440f102df5e3cf05 movss xmm13, dword ptr [rip + 0x5cfe3f5]
1400cecbf f3440f1035f0e3cf05 movss xmm14, dword ptr [rip + 0x5cfe3f0]
1400cecc8 f2440f103defe3cf05 movsd xmm15, qword ptr [rip + 0x5cfe3ef]
1400cecd1 4531e4 xor r12d, r12d
1400cecd4 48c744247000000000 mov qword ptr [rsp + 0x70], 0
1400cecdd 48c744246800000000 mov qword ptr [rsp + 0x68], 0
1400cece6 48c744246000000000 mov qword ptr [rsp + 0x60], 0
1400cecef e960010000 jmp 0x1400cee54
1400cecf4 488b4918 mov rcx, qword ptr [rcx + 0x18]
1400cecf8 48c744246800000000 mov qword ptr [rsp + 0x68], 0
1400ced01 4c8b842498000000 mov r8, qword ptr [rsp + 0x98]
1400ced09 498b9018010000 mov rdx, qword ptr [r8 + 0x118]
1400ced10 4d8b8020010000 mov r8, qword ptr [r8 + 0x120]
1400ced17 488b14d0 mov rdx, qword ptr [rax + rdx*8]
1400ced1b 48f7d2 not rdx
1400ced1e 488d1452 lea rdx, [rdx + rdx*2]
1400ced22 48c1e204 shl rdx, 4
1400ced26 4c8b4c1110 mov r9, qword ptr [rcx + rdx + 0x10]
1400ced2b 4c894c2460 mov qword ptr [rsp + 0x60], r9
1400ced30 488b541128 mov rdx, qword ptr [rcx + rdx + 0x28]
1400ced35 4889942490000000 mov qword ptr [rsp + 0x90], rdx
1400ced3d 4a8b04c0 mov rax, qword ptr [rax + r8*8]
1400ced41 48f7d0 not rax
1400ced44 488d0440 lea rax, [rax + rax*2]
1400ced48 48c1e004 shl rax, 4
1400ced4c 488b540110 mov rdx, qword ptr [rcx + rax + 0x10]
1400ced51 4889542470 mov qword ptr [rsp + 0x70], rdx
1400ced56 488b440128 mov rax, qword ptr [rcx + rax + 0x28]
1400ced5b 4889842480000000 mov qword ptr [rsp + 0x80], rax
1400ced63 31ed xor ebp, ebp
1400ced65 89e8 mov eax, ebp
1400ced67 4c8d3c40 lea r15, [rax + rax*2]
1400ced6b 488b4c2468 mov rcx, qword ptr [rsp + 0x68]
1400ced70 4a8d3cb9 lea rdi, [rcx + r15*4]
1400ced74 49c1e707 shl r15, 7
1400ced78 4c037c2460 add r15, qword ptr [rsp + 0x60]
1400ced7d 488b8c2490000000 mov rcx, qword ptr [rsp + 0x90]
1400ced85 4c8d3481 lea r14, [rcx + rax*4]
1400ced89 488d0c80 lea rcx, [rax + rax*4]
1400ced8d 488b542470 mov rdx, qword ptr [rsp + 0x70]
1400ced92 4c8d2c8a lea r13, [rdx + rcx*4]
1400ced96 488b8c2480000000 mov rcx, qword ptr [rsp + 0x80]
1400ced9e 488d0481 lea rax, [rcx + rax*4]
1400ceda2 4889442478 mov qword ptr [rsp + 0x78], rax
1400ceda7 ffc5 inc ebp
1400ceda9 f30f107f04 movss xmm7, dword ptr [rdi + 4]
1400cedae f30f59fe mulss xmm7, xmm6
1400cedb2 f3440f104708 movss xmm8, dword ptr [rdi + 8]
1400cedb8 f3410f58f8 addss xmm7, xmm8
1400cedbd 0f28c7 movaps xmm0, xmm7
1400cedc0 e8ac3bb205 call 0x145bf2971
1400cedc5 f30f5cf8 subss xmm7, xmm0
1400cedc9 0f28c7 movaps xmm0, xmm7
1400cedcc f3410f59c2 mulss xmm0, xmm10
1400cedd1 f3450f59c1 mulss xmm8, xmm9
1400cedd6 f3440f58c0 addss xmm8, xmm0
1400ceddb 410f28c0 movaps xmm0, xmm8
1400ceddf e8933bb205 call 0x145bf2977
1400cede4 f30f58c0 addss xmm0, xmm0
1400cede8 f30f5807 addss xmm0, dword ptr [rdi]
1400cedec 41c7476802000000 mov dword ptr [r15 + 0x68], 2
1400cedf4 f3410f11476c movss dword ptr [r15 + 0x6c], xmm0
1400cedfa 0f28c7 movaps xmm0, xmm7
1400cedfd f3410f59c3 mulss xmm0, xmm11
1400cee02 f3410f58c4 addss xmm0, xmm12
1400cee07 8bbc24c8000000 mov edi, dword ptr [rsp + 0xc8]
1400cee0e 41893e mov dword ptr [r14], edi
1400cee11 41c7477802000000 mov dword ptr [r15 + 0x78], 2
1400cee19 f3410f11477c movss dword ptr [r15 + 0x7c], xmm0
1400cee1f f3410f59fd mulss xmm7, xmm13
1400cee24 0f28c7 movaps xmm0, xmm7
1400cee27 e84b3bb205 call 0x145bf2977
1400cee2c f3410f59c6 mulss xmm0, xmm14
1400cee31 488b442478 mov rax, qword ptr [rsp + 0x78]
1400cee36 8938 mov dword ptr [rax], edi
1400cee38 41c7450000000000 mov dword ptr [r13], 0
1400cee40 f2450f117d04 movsd qword ptr [r13 + 4], xmm15
1400cee46 41c7450c3333b33e mov dword ptr [r13 + 0xc], 0x3eb33333
1400cee4e f3410f114510 movss dword ptr [r13 + 0x10], xmm0
1400cee54 807c245800 cmp byte ptr [rsp + 0x58], 0
1400cee59 488b9424a8000000 mov rdx, qword ptr [rsp + 0xa8]
1400cee61 747d je 0x1400ceee0
1400cee63 4439e5 cmp ebp, r12d
1400cee66 0f85f9feffff jne 0x1400ced65
1400cee6c 0f1f4000 nop dword ptr [rax]
1400cee70 4839de cmp rsi, rbx
1400cee73 0f848c010000 je 0x1400cf005
1400cee79 8b0e mov ecx, dword ptr [rsi]
1400cee7b 4883c604 add rsi, 4
1400cee7f 488b82a8010000 mov rax, qword ptr [rdx + 0x1a8]
1400cee86 488d0cc9 lea rcx, [rcx + rcx*8]
1400cee8a 4c8b64c810 mov r12, qword ptr [rax + rcx*8 + 0x10]
1400cee8f 4d85e4 test r12, r12
1400cee92 74dc je 0x1400cee70
1400cee94 488d0cc8 lea rcx, [rax + rcx*8]
1400cee98 488b842498000000 mov rax, qword ptr [rsp + 0x98]
1400ceea0 488b9010010000 mov rdx, qword ptr [rax + 0x110]
1400ceea7 488b4138 mov rax, qword ptr [rcx + 0x38]
1400ceeab 483b5140 cmp rdx, qword ptr [rcx + 0x40]
1400ceeaf 0f833ffeffff jae 0x1400cecf4
1400ceeb5 488b14d0 mov rdx, qword ptr [rax + rdx*8]
1400ceeb9 488b4918 mov rcx, qword ptr [rcx + 0x18]
1400ceebd 4885d2 test rdx, rdx
1400ceec0 0f8432feffff je 0x1400cecf8
1400ceec6 48f7d2 not rdx
1400ceec9 488d1452 lea rdx, [rdx + rdx*2]
1400ceecd 48c1e204 shl rdx, 4
1400ceed1 488b541110 mov rdx, qword ptr [rcx + rdx + 0x10]
1400ceed6 4889542468 mov qword ptr [rsp + 0x68], rdx
1400ceedb e921feffff jmp 0x1400ced01
1400ceee0 4439e5 cmp ebp, r12d
1400ceee3 0f8503010000 jne 0x1400cefec
1400ceee9 0f1f8000000000 nop dword ptr [rax]
1400ceef0 4839de cmp rsi, rbx
1400ceef3 0f840c010000 je 0x1400cf005
1400ceef9 8b0e mov ecx, dword ptr [rsi]
1400ceefb 4883c604 add rsi, 4
1400ceeff 488b8208010000 mov rax, qword ptr [rdx + 0x108]
1400cef06 488d0c89 lea rcx, [rcx + rcx*4]
1400cef0a 48c1e105 shl rcx, 5
1400cef0e 4c8b640858 mov r12, qword ptr [rax + rcx + 0x58]
1400cef13 4d85e4 test r12, r12
1400cef16 74d8 je 0x1400ceef0
1400cef18 4801c8 add rax, rcx
1400cef1b 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400cef21 4c8b8aa8010000 mov r9, qword ptr [rdx + 0x1a8]
1400cef28 4c8d14c9 lea r10, [rcx + rcx*8]
1400cef2c 4b8d14d1 lea rdx, [r9 + r10*8]
1400cef30 488b8c2498000000 mov rcx, qword ptr [rsp + 0x98]
1400cef38 4c8b8110010000 mov r8, qword ptr [rcx + 0x110]
1400cef3f 4b8b4cd138 mov rcx, qword ptr [r9 + r10*8 + 0x38]
1400cef44 4f3b44d140 cmp r8, qword ptr [r9 + r10*8 + 0x40]
1400cef49 7324 jae 0x1400cef6f
1400cef4b 4e8b04c1 mov r8, qword ptr [rcx + r8*8]
1400cef4f 488b5218 mov rdx, qword ptr [rdx + 0x18]
1400cef53 4d85c0 test r8, r8
1400cef56 741b je 0x1400cef73
1400cef58 49f7d0 not r8
1400cef5b 4f8d0440 lea r8, [r8 + r8*2]
1400cef5f 49c1e004 shl r8, 4
1400cef63 4e8b440210 mov r8, qword ptr [rdx + r8 + 0x10]
1400cef68 4c89442468 mov qword ptr [rsp + 0x68], r8
1400cef6d eb0d jmp 0x1400cef7c
1400cef6f 488b5218 mov rdx, qword ptr [rdx + 0x18]
1400cef73 48c744246800000000 mov qword ptr [rsp + 0x68], 0
1400cef7c 4c8b8c2498000000 mov r9, qword ptr [rsp + 0x98]
1400cef84 4d8b8118010000 mov r8, qword ptr [r9 + 0x118]
1400cef8b 4d8b8920010000 mov r9, qword ptr [r9 + 0x120]
1400cef92 4e8b04c1 mov r8, qword ptr [rcx + r8*8]
1400cef96 49f7d0 not r8
1400cef99 4f8d0440 lea r8, [r8 + r8*2]
1400cef9d 49c1e004 shl r8, 4
1400cefa1 4e8b540210 mov r10, qword ptr [rdx + r8 + 0x10]
1400cefa6 4c89542460 mov qword ptr [rsp + 0x60], r10
1400cefab 4e8b440228 mov r8, qword ptr [rdx + r8 + 0x28]
1400cefb0 4c89842490000000 mov qword ptr [rsp + 0x90], r8
1400cefb8 4a8b0cc9 mov rcx, qword ptr [rcx + r9*8]
1400cefbc 48f7d1 not rcx
1400cefbf 488d0c49 lea rcx, [rcx + rcx*2]
1400cefc3 48c1e104 shl rcx, 4
1400cefc7 4c8b440a10 mov r8, qword ptr [rdx + rcx + 0x10]
1400cefcc 4c89442470 mov qword ptr [rsp + 0x70], r8
1400cefd1 488b4c0a28 mov rcx, qword ptr [rdx + rcx + 0x28]
1400cefd6 48898c2480000000 mov qword ptr [rsp + 0x80], rcx
1400cefde 488b4050 mov rax, qword ptr [rax + 0x50]
1400cefe2 4889842488000000 mov qword ptr [rsp + 0x88], rax
1400cefea 31ed xor ebp, ebp
1400cefec 89e8 mov eax, ebp
1400cefee 48c1e004 shl rax, 4
1400ceff2 488b8c2488000000 mov rcx, qword ptr [rsp + 0x88]
1400ceffa 8b440108 mov eax, dword ptr [rcx + rax + 8]
1400ceffe f7d0 not eax
1400cf000 e962fdffff jmp 0x1400ced67
1400cf005 f30f1005c3e0cf05 movss xmm0, dword ptr [rip + 0x5cfe0c3]
1400cf00d f30f59c6 mulss xmm0, xmm6
1400cf011 e86139b205 call 0x145bf2977
1400cf016 0f28f8 movaps xmm7, xmm0
1400cf019 f3440f1005f285cc05 movss xmm8, dword ptr [rip + 0x5cc85f2]
1400cf022 f3410f59f8 mulss xmm7, xmm8
1400cf027 f3410f58f8 addss xmm7, xmm8
1400cf02c 488b8c24c0000000 mov rcx, qword ptr [rsp + 0xc0]
1400cf034 4c8bb9f8000000 mov r15, qword ptr [rcx + 0xf8]
1400cf03b 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400cf042 4d8d2487 lea r12, [r15 + rax*4]
1400cf046 80b90801000000 cmp byte ptr [rcx + 0x108], 0
1400cf04d 740c je 0x1400cf05b
1400cf04f 4531f6 xor r14d, r14d
1400cf052 31ed xor ebp, ebp
1400cf054 31f6 xor esi, esi
1400cf056 e995000000 jmp 0x1400cf0f0
1400cf05b 4531ed xor r13d, r13d
1400cf05e 41be08000000 mov r14d, 8
1400cf064 31f6 xor esi, esi
1400cf066 31ff xor edi, edi
1400cf068 e96b010000 jmp 0x1400cf1d8
1400cf06d 0f1f00 nop dword ptr [rax]
1400cf070 488d04c8 lea rax, [rax + rcx*8]
1400cf074 488b8c24c0000000 mov rcx, qword ptr [rsp + 0xc0]
1400cf07c 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400cf083 488b5018 mov rdx, qword ptr [rax + 0x18]
1400cf087 488b4038 mov rax, qword ptr [rax + 0x38]
1400cf08b 488b04c8 mov rax, qword ptr [rax + rcx*8]
1400cf08f 48f7d0 not rax
1400cf092 488d0440 lea rax, [rax + rax*2]
1400cf096 48c1e004 shl rax, 4
1400cf09a 488b6c0210 mov rbp, qword ptr [rdx + rax + 0x10]
1400cf09f 4c8b6c0228 mov r13, qword ptr [rdx + rax + 0x28]
1400cf0a4 31f6 xor esi, esi
1400cf0a6 89f7 mov edi, esi
1400cf0a8 ffc6 inc esi
1400cf0aa 488d1cbf lea rbx, [rdi + rdi*4]
1400cf0ae 488d8c24d0000000 lea rcx, [rsp + 0xd0]
1400cf0b6 488d1507f5cf05 lea rdx, [rip + 0x5cff507]
1400cf0bd 4c8d05ecf4cf05 lea r8, [rip + 0x5cff4ec]
1400cf0c4 0f28df movaps xmm3, xmm7
1400cf0c7 e894f8ba04 call 0x144c7e960
1400cf0cc 8b8424b4000000 mov eax, dword ptr [rsp + 0xb4]
1400cf0d3 418944bd00 mov dword ptr [r13 + rdi*4], eax
1400cf0d8 8b8424e0000000 mov eax, dword ptr [rsp + 0xe0]
1400cf0df 89449d10 mov dword ptr [rbp + rbx*4 + 0x10], eax
1400cf0e3 0f108424d0000000 movups xmm0, xmmword ptr [rsp + 0xd0]
1400cf0eb 0f11449d00 movups xmmword ptr [rbp + rbx*4], xmm0
1400cf0f0 4439f6 cmp esi, r14d
1400cf0f3 488b9424f8000000 mov rdx, qword ptr [rsp + 0xf8]
1400cf0fb 75a9 jne 0x1400cf0a6
1400cf0fd 0f1f00 nop dword ptr [rax]
1400cf100 4d39e7 cmp r15, r12
1400cf103 0f8411010000 je 0x1400cf21a
1400cf109 418b0f mov ecx, dword ptr [r15]
1400cf10c 4983c704 add r15, 4
1400cf110 488b82a8010000 mov rax, qword ptr [rdx + 0x1a8]
1400cf117 488d0cc9 lea rcx, [rcx + rcx*8]
1400cf11b 4c8b74c810 mov r14, qword ptr [rax + rcx*8 + 0x10]
1400cf120 4d85f6 test r14, r14
1400cf123 74db je 0x1400cf100
1400cf125 e946ffffff jmp 0x1400cf070
1400cf12a 660f1f440000 nop word ptr [rax + rax]
1400cf130 4801c8 add rax, rcx
1400cf133 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400cf139 488b92a8010000 mov rdx, qword ptr [rdx + 0x1a8]
1400cf140 488d0cc9 lea rcx, [rcx + rcx*8]
1400cf144 4c8b8424c0000000 mov r8, qword ptr [rsp + 0xc0]
1400cf14c 4d8b8010010000 mov r8, qword ptr [r8 + 0x110]
1400cf153 4c8b4cca18 mov r9, qword ptr [rdx + rcx*8 + 0x18]
1400cf158 488b4cca38 mov rcx, qword ptr [rdx + rcx*8 + 0x38]
1400cf15d 4a8b0cc1 mov rcx, qword ptr [rcx + r8*8]
1400cf161 48f7d1 not rcx
1400cf164 488d0c49 lea rcx, [rcx + rcx*2]
1400cf168 48c1e104 shl rcx, 4
1400cf16c 498b740910 mov rsi, qword ptr [r9 + rcx + 0x10]
1400cf171 498b4c0928 mov rcx, qword ptr [r9 + rcx + 0x28]
1400cf176 48894c2478 mov qword ptr [rsp + 0x78], rcx
1400cf17b 4c8b7050 mov r14, qword ptr [rax + 0x50]
1400cf17f 31ff xor edi, edi
1400cf181 89f8 mov eax, edi
1400cf183 48c1e004 shl rax, 4
1400cf187 ffc7 inc edi
1400cf189 418b5c0608 mov ebx, dword ptr [r14 + rax + 8]
1400cf18e f7d3 not ebx
1400cf190 488d2c9b lea rbp, [rbx + rbx*4]
1400cf194 488d8c24d0000000 lea rcx, [rsp + 0xd0]
1400cf19c 488d1521f4cf05 lea rdx, [rip + 0x5cff421]
1400cf1a3 4c8d0506f4cf05 lea r8, [rip + 0x5cff406]
1400cf1aa 0f28df movaps xmm3, xmm7
1400cf1ad e8aef7ba04 call 0x144c7e960
1400cf1b2 8b8424b4000000 mov eax, dword ptr [rsp + 0xb4]
1400cf1b9 488b4c2478 mov rcx, qword ptr [rsp + 0x78]
1400cf1be 890499 mov dword ptr [rcx + rbx*4], eax
1400cf1c1 8b8424e0000000 mov eax, dword ptr [rsp + 0xe0]
1400cf1c8 8944ae10 mov dword ptr [rsi + rbp*4 + 0x10], eax
1400cf1cc 0f108424d0000000 movups xmm0, xmmword ptr [rsp + 0xd0]
1400cf1d4 0f1104ae movups xmmword ptr [rsi + rbp*4], xmm0
1400cf1d8 4439ef cmp edi, r13d
1400cf1db 75a4 jne 0x1400cf181
1400cf1dd 488b9424f8000000 mov rdx, qword ptr [rsp + 0xf8]
1400cf1e5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf1f0 4d39e7 cmp r15, r12
1400cf1f3 7425 je 0x1400cf21a
1400cf1f5 418b0f mov ecx, dword ptr [r15]
1400cf1f8 4983c704 add r15, 4
1400cf1fc 488b8208010000 mov rax, qword ptr [rdx + 0x108]
1400cf203 488d0c89 lea rcx, [rcx + rcx*4]
1400cf207 48c1e105 shl rcx, 5
1400cf20b 4c8b6c0858 mov r13, qword ptr [rax + rcx + 0x58]
1400cf210 4d85ed test r13, r13
1400cf213 74db je 0x1400cf1f0
1400cf215 e916ffffff jmp 0x1400cf130
1400cf21a 488b9c2400010000 mov rbx, qword ptr [rsp + 0x100]
1400cf222 488bb3f8000000 mov rsi, qword ptr [rbx + 0xf8]
1400cf229 488b8300010000 mov rax, qword ptr [rbx + 0x100]
1400cf230 488d3c86 lea rdi, [rsi + rax*4]
1400cf234 0f28fe movaps xmm7, xmm6
1400cf237 f30f5e3de16dcd05 divss xmm7, dword ptr [rip + 0x5cd6de1]
1400cf23f 0f28c7 movaps xmm0, xmm7
1400cf242 e82a37b205 call 0x145bf2971
1400cf247 f30f5cf8 subss xmm7, xmm0
1400cf24b f30f593d81decf05 mulss xmm7, dword ptr [rip + 0x5cfde81]
1400cf253 f30f583d7ddecf05 addss xmm7, dword ptr [rip + 0x5cfde7d]
1400cf25b 80bb0801000000 cmp byte ptr [rbx + 0x108], 0
1400cf262 7418 je 0x1400cf27c
1400cf264 31c0 xor eax, eax
1400cf266 31d2 xor edx, edx
1400cf268 4531c0 xor r8d, r8d
1400cf26b 4c8b9c24e8000000 mov r11, qword ptr [rsp + 0xe8]
1400cf273 8bac24b0000000 mov ebp, dword ptr [rsp + 0xb0]
1400cf27a eb75 jmp 0x1400cf2f1
1400cf27c 31c0 xor eax, eax
1400cf27e b908000000 mov ecx, 8
1400cf283 4531c0 xor r8d, r8d
1400cf286 4531c9 xor r9d, r9d
1400cf289 4c8bb424e8000000 mov r14, qword ptr [rsp + 0xe8]
1400cf291 8bac24b0000000 mov ebp, dword ptr [rsp + 0xb0]
1400cf298 e906010000 jmp 0x1400cf3a3
1400cf29d 0f1f00 nop dword ptr [rax]
1400cf2a0 488d0cd1 lea rcx, [rcx + rdx*8]
1400cf2a4 488b9310010000 mov rdx, qword ptr [rbx + 0x110]
1400cf2ab 4c8b4118 mov r8, qword ptr [rcx + 0x18]
1400cf2af 488b4938 mov rcx, qword ptr [rcx + 0x38]
1400cf2b3 488b0cd1 mov rcx, qword ptr [rcx + rdx*8]
1400cf2b7 48f7d1 not rcx
1400cf2ba 488d0c49 lea rcx, [rcx + rcx*2]
1400cf2be 48c1e104 shl rcx, 4
1400cf2c2 498b540810 mov rdx, qword ptr [r8 + rcx + 0x10]
1400cf2c7 498b4c0828 mov rcx, qword ptr [r8 + rcx + 0x28]
1400cf2cc 4531c0 xor r8d, r8d
1400cf2cf 4589c1 mov r9d, r8d
1400cf2d2 41ffc0 inc r8d
1400cf2d5 4f8d1449 lea r10, [r9 + r9*2]
1400cf2d9 49c1e207 shl r10, 7
1400cf2dd 42892c89 mov dword ptr [rcx + r9*4], ebp
1400cf2e1 42c744126801000000 mov dword ptr [rdx + r10 + 0x68], 1
1400cf2ea f3420f117c126c movss dword ptr [rdx + r10 + 0x6c], xmm7
1400cf2f1 4139c0 cmp r8d, eax
1400cf2f4 75d9 jne 0x1400cf2cf
1400cf2f6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf300 4839fe cmp rsi, rdi
1400cf303 0f84d0000000 je 0x1400cf3d9
1400cf309 8b06 mov eax, dword ptr [rsi]
1400cf30b 4883c604 add rsi, 4
1400cf30f 498b8ba8010000 mov rcx, qword ptr [r11 + 0x1a8]
1400cf316 488d14c0 lea rdx, [rax + rax*8]
1400cf31a 488b44d110 mov rax, qword ptr [rcx + rdx*8 + 0x10]
1400cf31f 4885c0 test rax, rax
1400cf322 74dc je 0x1400cf300
1400cf324 e977ffffff jmp 0x1400cf2a0
1400cf329 0f1f8000000000 nop dword ptr [rax]
1400cf330 4801d1 add rcx, rdx
1400cf333 8b9194000000 mov edx, dword ptr [rcx + 0x94]
1400cf339 4d8b86a8010000 mov r8, qword ptr [r14 + 0x1a8]
1400cf340 488d14d2 lea rdx, [rdx + rdx*8]
1400cf344 4c8b8b10010000 mov r9, qword ptr [rbx + 0x110]
1400cf34b 4d8b54d018 mov r10, qword ptr [r8 + rdx*8 + 0x18]
1400cf350 498b54d038 mov rdx, qword ptr [r8 + rdx*8 + 0x38]
1400cf355 4a8b14ca mov rdx, qword ptr [rdx + r9*8]
1400cf359 48f7d2 not rdx
1400cf35c 488d1452 lea rdx, [rdx + rdx*2]
1400cf360 48c1e204 shl rdx, 4
1400cf364 4d8b441210 mov r8, qword ptr [r10 + rdx + 0x10]
1400cf369 498b541228 mov rdx, qword ptr [r10 + rdx + 0x28]
1400cf36e 488b4950 mov rcx, qword ptr [rcx + 0x50]
1400cf372 4531c9 xor r9d, r9d
1400cf375 4589ca mov r10d, r9d
1400cf378 49c1e204 shl r10, 4
1400cf37c 41ffc1 inc r9d
1400cf37f 468b541108 mov r10d, dword ptr [rcx + r10 + 8]
1400cf384 41f7d2 not r10d
1400cf387 4f8d1c52 lea r11, [r10 + r10*2]
1400cf38b 49c1e307 shl r11, 7
1400cf38f 42892c92 mov dword ptr [rdx + r10*4], ebp
1400cf393 43c744186801000000 mov dword ptr [r8 + r11 + 0x68], 1
1400cf39c f3430f117c186c movss dword ptr [r8 + r11 + 0x6c], xmm7
1400cf3a3 4139c1 cmp r9d, eax
1400cf3a6 75cd jne 0x1400cf375
1400cf3a8 0f1f840000000000 nop dword ptr [rax + rax]
1400cf3b0 4839fe cmp rsi, rdi
1400cf3b3 7424 je 0x1400cf3d9
1400cf3b5 8b06 mov eax, dword ptr [rsi]
1400cf3b7 4883c604 add rsi, 4
1400cf3bb 498b8e08010000 mov rcx, qword ptr [r14 + 0x108]
1400cf3c2 488d1480 lea rdx, [rax + rax*4]
1400cf3c6 48c1e205 shl rdx, 5
1400cf3ca 488b441158 mov rax, qword ptr [rcx + rdx + 0x58]
1400cf3cf 4885c0 test rax, rax
1400cf3d2 74dc je 0x1400cf3b0
1400cf3d4 e957ffffff jmp 0x1400cf330
1400cf3d9 488b8c24a0000000 mov rcx, qword ptr [rsp + 0xa0]
1400cf3e1 4c8bb1f8000000 mov r14, qword ptr [rcx + 0xf8]
1400cf3e8 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400cf3ef 4d8d2486 lea r12, [r14 + rax*4]
1400cf3f3 0fb68108010000 movzx eax, byte ptr [rcx + 0x108]
1400cf3fa 88442478 mov byte ptr [rsp + 0x78], al
1400cf3fe f30f59350a30cd05 mulss xmm6, dword ptr [rip + 0x5cd300a]
1400cf406 0f28c6 movaps xmm0, xmm6
1400cf409 e86935b205 call 0x145bf2977
1400cf40e 0f28f0 movaps xmm6, xmm0
1400cf411 f3410f59f0 mulss xmm6, xmm8
1400cf416 f3410f58f0 addss xmm6, xmm8
1400cf41b f30f59358d6dcd05 mulss xmm6, dword ptr [rip + 0x5cd6d8d]
1400cf423 f30f5835f96bcd05 addss xmm6, dword ptr [rip + 0x5cd6bf9]
1400cf42b 4531ed xor r13d, r13d
1400cf42e b808000000 mov eax, 8
1400cf433 4889442468 mov qword ptr [rsp + 0x68], rax
1400cf438 f30f103d906dcd05 movss xmm7, dword ptr [rip + 0x5cd6d90]
1400cf440 f2440f1005976dcd05 movsd xmm8, qword ptr [rip + 0x5cd6d97]
1400cf449 f3440f10152e82cc05 movss xmm10, dword ptr [rip + 0x5cc822e]
1400cf452 31db xor ebx, ebx
1400cf454 48c744245800000000 mov qword ptr [rsp + 0x58], 0
1400cf45d 31ff xor edi, edi
1400cf45f eb29 jmp 0x1400cf48a
1400cf461 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf470 ffc7 inc edi
1400cf472 488b8424e0000000 mov rax, qword ptr [rsp + 0xe0]
1400cf47a 48894510 mov qword ptr [rbp + 0x10], rax
1400cf47e 0f108424d0000000 movups xmm0, xmmword ptr [rsp + 0xd0]
1400cf486 0f114500 movups xmmword ptr [rbp], xmm0
1400cf48a 807c247800 cmp byte ptr [rsp + 0x78], 0
1400cf48f 0f849b000000 je 0x1400cf530
1400cf495 4439ef cmp edi, r13d
1400cf498 0f856a010000 jne 0x1400cf608
1400cf49e 488b9424f0000000 mov rdx, qword ptr [rsp + 0xf0]
1400cf4a6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf4b0 4d39e6 cmp r14, r12
1400cf4b3 0f84ab020000 je 0x1400cf764
1400cf4b9 418b0e mov ecx, dword ptr [r14]
1400cf4bc 4983c604 add r14, 4
1400cf4c0 488b82a8010000 mov rax, qword ptr [rdx + 0x1a8]
1400cf4c7 488d0cc9 lea rcx, [rcx + rcx*8]
1400cf4cb 4c8b6cc810 mov r13, qword ptr [rax + rcx*8 + 0x10]
1400cf4d0 4d85ed test r13, r13
1400cf4d3 74db je 0x1400cf4b0
1400cf4d5 4c8d04c8 lea r8, [rax + rcx*8]
1400cf4d9 488b8424a0000000 mov rax, qword ptr [rsp + 0xa0]
1400cf4e1 488b9018010000 mov rdx, qword ptr [rax + 0x118]
1400cf4e8 498b4018 mov rax, qword ptr [r8 + 0x18]
1400cf4ec 498b4838 mov rcx, qword ptr [r8 + 0x38]
1400cf4f0 493b5040 cmp rdx, qword ptr [r8 + 0x40]
1400cf4f4 0f83d3000000 jae 0x1400cf5cd
1400cf4fa 488b14d1 mov rdx, qword ptr [rcx + rdx*8]
1400cf4fe 4885d2 test rdx, rdx
1400cf501 0f84c6000000 je 0x1400cf5cd
1400cf507 48f7d2 not rdx
1400cf50a 488d1452 lea rdx, [rdx + rdx*2]
1400cf50e 48c1e204 shl rdx, 4
1400cf512 488b541010 mov rdx, qword ptr [rax + rdx + 0x10]
1400cf517 4889542458 mov qword ptr [rsp + 0x58], rdx
1400cf51c e9b5000000 jmp 0x1400cf5d6
1400cf521 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf530 4439ef cmp edi, r13d
1400cf533 0f8517010000 jne 0x1400cf650
1400cf539 488b9424f0000000 mov rdx, qword ptr [rsp + 0xf0]
1400cf541 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400cf550 4d39e6 cmp r14, r12
1400cf553 0f840b020000 je 0x1400cf764
1400cf559 418b0e mov ecx, dword ptr [r14]
1400cf55c 4983c604 add r14, 4
1400cf560 488b8208010000 mov rax, qword ptr [rdx + 0x108]
1400cf567 488d0c89 lea rcx, [rcx + rcx*4]
1400cf56b 48c1e105 shl rcx, 5
1400cf56f 4c8b6c0858 mov r13, qword ptr [rax + rcx + 0x58]
1400cf574 4d85ed test r13, r13
1400cf577 74d7 je 0x1400cf550
1400cf579 4801c8 add rax, rcx
1400cf57c 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400cf582 4c8b8aa8010000 mov r9, qword ptr [rdx + 0x1a8]
1400cf589 4c8d14c9 lea r10, [rcx + rcx*8]
1400cf58d 488b8c24a0000000 mov rcx, qword ptr [rsp + 0xa0]
1400cf595 4c8b8118010000 mov r8, qword ptr [rcx + 0x118]
1400cf59c 4b8b4cd118 mov rcx, qword ptr [r9 + r10*8 + 0x18]
1400cf5a1 4b8b54d138 mov rdx, qword ptr [r9 + r10*8 + 0x38]
1400cf5a6 4f3b44d140 cmp r8, qword ptr [r9 + r10*8 + 0x40]
1400cf5ab 735f jae 0x1400cf60c
1400cf5ad 4e8b04c2 mov r8, qword ptr [rdx + r8*8]
1400cf5b1 4d85c0 test r8, r8
1400cf5b4 7456 je 0x1400cf60c
1400cf5b6 49f7d0 not r8
1400cf5b9 4f8d0440 lea r8, [r8 + r8*2]
1400cf5bd 49c1e004 shl r8, 4
1400cf5c1 4e8b440110 mov r8, qword ptr [rcx + r8 + 0x10]
1400cf5c6 4c89442458 mov qword ptr [rsp + 0x58], r8
1400cf5cb eb48 jmp 0x1400cf615
1400cf5cd 48c744245800000000 mov qword ptr [rsp + 0x58], 0
1400cf5d6 488b9424a0000000 mov rdx, qword ptr [rsp + 0xa0]
1400cf5de 488b9210010000 mov rdx, qword ptr [rdx + 0x110]
1400cf5e5 488b0cd1 mov rcx, qword ptr [rcx + rdx*8]
1400cf5e9 48f7d1 not rcx
1400cf5ec 488d0c49 lea rcx, [rcx + rcx*2]
1400cf5f0 48c1e104 shl rcx, 4
1400cf5f4 488b5c0810 mov rbx, qword ptr [rax + rcx + 0x10]
1400cf5f9 488b440828 mov rax, qword ptr [rax + rcx + 0x28]
1400cf5fe 48898424a8000000 mov qword ptr [rsp + 0xa8], rax
1400cf606 31ff xor edi, edi
1400cf608 89f8 mov eax, edi
1400cf60a eb55 jmp 0x1400cf661
1400cf60c 48c744245800000000 mov qword ptr [rsp + 0x58], 0
1400cf615 4c8b8424a0000000 mov r8, qword ptr [rsp + 0xa0]
1400cf61d 4d8b8010010000 mov r8, qword ptr [r8 + 0x110]
1400cf624 4a8b14c2 mov rdx, qword ptr [rdx + r8*8]
1400cf628 48f7d2 not rdx
1400cf62b 488d1452 lea rdx, [rdx + rdx*2]
1400cf62f 48c1e204 shl rdx, 4
1400cf633 488b5c1110 mov rbx, qword ptr [rcx + rdx + 0x10]
1400cf638 488b4c1128 mov rcx, qword ptr [rcx + rdx + 0x28]
1400cf63d 48898c24a8000000 mov qword ptr [rsp + 0xa8], rcx
1400cf645 488b4050 mov rax, qword ptr [rax + 0x50]
1400cf649 4889442468 mov qword ptr [rsp + 0x68], rax
1400cf64e 31ff xor edi, edi
1400cf650 89f8 mov eax, edi
1400cf652 48c1e004 shl rax, 4
1400cf656 488b4c2468 mov rcx, qword ptr [rsp + 0x68]
1400cf65b 8b440108 mov eax, dword ptr [rcx + rax + 8]
1400cf65f f7d0 not eax
1400cf661 488d0c40 lea rcx, [rax + rax*2]
1400cf665 488d2ccb lea rbp, [rbx + rcx*8]
1400cf669 488b8c24a8000000 mov rcx, qword ptr [rsp + 0xa8]
1400cf671 488d3481 lea rsi, [rcx + rax*4]
1400cf675 4803442458 add rax, qword ptr [rsp + 0x58]
1400cf67a 803802 cmp byte ptr [rax], 2
1400cf67d 440f28de movaps xmm11, xmm6
1400cf681 7404 je 0x1400cf687
1400cf683 440f28df movaps xmm11, xmm7
1400cf687 f2440f1184240c010000 movsd qword ptr [rsp + 0x10c], xmm8
1400cf691 c78424140100000000803e mov dword ptr [rsp + 0x114], 0x3e800000
1400cf69c f3440f119c2418010000 movss dword ptr [rsp + 0x118], xmm11
1400cf6a6 c784240801000000000000 mov dword ptr [rsp + 0x108], 0
1400cf6b1 f3450f59d9 mulss xmm11, xmm9
1400cf6b6 f3450f58da addss xmm11, xmm10
1400cf6bb 4c8dbc24d0000000 lea r15, [rsp + 0xd0]
1400cf6c3 4c89f9 mov rcx, r15
1400cf6c6 488d942408010000 lea rdx, [rsp + 0x108]
1400cf6ce e8dd82ba04 call 0x144c779b0
1400cf6d3 0f288424d0000000 movaps xmm0, xmmword ptr [rsp + 0xd0]
1400cf6db 0f11842420010000 movups xmmword ptr [rsp + 0x120], xmm0
1400cf6e3 c784241c01000001000000 mov dword ptr [rsp + 0x11c], 1
1400cf6ee f3440f115c2448 movss dword ptr [rsp + 0x48], xmm11
1400cf6f5 c744244001000000 mov dword ptr [rsp + 0x40], 1
1400cf6fd c74424380000803f mov dword ptr [rsp + 0x38], 0x3f800000
1400cf705 c744243001000000 mov dword ptr [rsp + 0x30], 1
1400cf70d c744242800000000 mov dword ptr [rsp + 0x28], 0
1400cf715 c744242001000000 mov dword ptr [rsp + 0x20], 1
1400cf71d 0f57db xorps xmm3, xmm3
1400cf720 4c89f9 mov rcx, r15
1400cf723 488d94241c010000 lea rdx, [rsp + 0x11c]
1400cf72b 41b801000000 mov r8d, 1
1400cf731 e82a445702 call 0x142643b60
1400cf736 8b8424cc000000 mov eax, dword ptr [rsp + 0xcc]
1400cf73d 8906 mov dword ptr [rsi], eax
1400cf73f 488b4500 mov rax, qword ptr [rbp]
1400cf743 4885c0 test rax, rax
1400cf746 0f8424fdffff je 0x1400cf470
1400cf74c 488b4d08 mov rcx, qword ptr [rbp + 8]
1400cf750 486bd034 imul rdx, rax, 0x34
1400cf754 41b804000000 mov r8d, 4
1400cf75a e8712af3ff call 0x1400021d0
1400cf75f e90cfdffff jmp 0x1400cf470
1400cf764 0f28b42430010000 movaps xmm6, xmmword ptr [rsp + 0x130]
1400cf76c 0f28bc2440010000 movaps xmm7, xmmword ptr [rsp + 0x140]
1400cf774 440f28842450010000 movaps xmm8, xmmword ptr [rsp + 0x150]
1400cf77d 440f288c2460010000 movaps xmm9, xmmword ptr [rsp + 0x160]
1400cf786 440f28942470010000 movaps xmm10, xmmword ptr [rsp + 0x170]
1400cf78f 440f289c2480010000 movaps xmm11, xmmword ptr [rsp + 0x180]
1400cf798 440f28a42490010000 movaps xmm12, xmmword ptr [rsp + 0x190]
1400cf7a1 440f28ac24a0010000 movaps xmm13, xmmword ptr [rsp + 0x1a0]
1400cf7aa 440f28b424b0010000 movaps xmm14, xmmword ptr [rsp + 0x1b0]
1400cf7b3 440f28bc24c0010000 movaps xmm15, xmmword ptr [rsp + 0x1c0]
1400cf7bc 4881c4d8010000 add rsp, 0x1d8
1400cf7c3 5b pop rbx
1400cf7c4 5d pop rbp
1400cf7c5 5f pop rdi
1400cf7c6 5e pop rsi
1400cf7c7 415c pop r12
1400cf7c9 415d pop r13
1400cf7cb 415e pop r14
1400cf7cd 415f pop r15
1400cf7cf c3 ret
