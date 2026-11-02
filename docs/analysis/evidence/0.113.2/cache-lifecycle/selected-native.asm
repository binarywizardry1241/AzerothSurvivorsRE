; create-go
145954610 55 push rbp
145954611 4157 push r15
145954613 4156 push r14
145954615 4155 push r13
145954617 4154 push r12
145954619 56 push rsi
14595461a 57 push rdi
14595461b 53 push rbx
14595461c 4881ece8000000 sub rsp, 0xe8
145954623 488dac2480000000 lea rbp, [rsp + 0x80]
14595462b 0f297d50 movaps xmmword ptr [rbp + 0x50], xmm7
14595462f 0f297540 movaps xmmword ptr [rbp + 0x40], xmm6
145954633 48c74538feffffff mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
14595463b 4589ce mov r14d, r9d
14595463e 4c89c3 mov rbx, r8
145954641 4889cf mov rdi, rcx
145954644 448b3a mov r15d, dword ptr [rdx]
145954647 448b6204 mov r12d, dword ptr [rdx + 4]
14595464b 448b6a08 mov r13d, dword ptr [rdx + 8]
14595464f 8bb1980b0000 mov esi, dword ptr [rcx + 0xb98]
145954655 ffc6 inc esi
145954657 89b1980b0000 mov dword ptr [rcx + 0xb98], esi
14595465d 488b91c00a0000 mov rdx, qword ptr [rcx + 0xac0]
145954664 488b81c80a0000 mov rax, qword ptr [rcx + 0xac8]
14595466b 4c8b81d80a0000 mov r8, qword ptr [rcx + 0xad8]
145954672 488b89d00a0000 mov rcx, qword ptr [rcx + 0xad0]
145954679 f30f1005f7de5400 movss xmm0, dword ptr [rip + 0x54def7]
145954681 f30f100d2f5f5700 movss xmm1, dword ptr [rip + 0x575f2f]
145954689 0f1f8000000000 nop dword ptr [rax]
145954690 4e8d0c02 lea r9, [rdx + r8]
145954694 49c1c117 rol r9, 0x17
145954698 4901d1 add r9, rdx
14595469b 4989c2 mov r10, rax
14595469e 49c1e211 shl r10, 0x11
1459546a2 4831d1 xor rcx, rdx
1459546a5 4931c0 xor r8, rax
1459546a8 4831c8 xor rax, rcx
1459546ab 4c31c2 xor rdx, r8
1459546ae 49c1c02d rol r8, 0x2d
1459546b2 4c31d1 xor rcx, r10
1459546b5 49c1e929 shr r9, 0x29
1459546b9 4181c90000803f or r9d, 0x3f800000
1459546c0 66410f6ef9 movd xmm7, r9d
1459546c5 f30f58f8 addss xmm7, xmm0
1459546c9 f30f59f9 mulss xmm7, xmm1
1459546cd 0f2ecf ucomiss xmm1, xmm7
1459546d0 76be jbe 0x145954690
1459546d2 4589f9 mov r9d, r15d
1459546d5 4181e1ffffff00 and r9d, 0xffffff
1459546dc 49c1e118 shl r9, 0x18
1459546e0 81e6ffffff00 and esi, 0xffffff
1459546e6 4c09ce or rsi, r9
1459546e9 488997c00a0000 mov qword ptr [rdi + 0xac0], rdx
1459546f0 4c8987d80a0000 mov qword ptr [rdi + 0xad8], r8
1459546f7 488987c80a0000 mov qword ptr [rdi + 0xac8], rax
1459546fe 48898fd00a0000 mov qword ptr [rdi + 0xad0], rcx
145954705 48c7451800000000 mov qword ptr [rbp + 0x18], 0
14595470d 48c7452800000000 mov qword ptr [rbp + 0x28], 0
145954715 488d4d18 lea rcx, [rbp + 0x18]
145954719 31d2 xor edx, edx
14595471b 4189f0 mov r8d, esi
14595471e e89dd10400 call 0x1459a18c0
145954723 90 nop
145954724 48b800000000000010f1 movabs rax, 0xf110000000000000
14595472e 4809c6 or rsi, rax
145954731 4989f0 mov r8, rsi
145954734 49c1e820 shr r8, 0x20
145954738 488d4d18 lea rcx, [rbp + 0x18]
14595473c 66ba0100 mov dx, 1
145954740 e87bd10400 call 0x1459a18c0
145954745 90 nop
145954746 488d4d18 lea rcx, [rbp + 0x18]
14595474a 66ba0200 mov dx, 2
14595474e 41b821000000 mov r8d, 0x21
145954754 e867d10400 call 0x1459a18c0
145954759 90 nop
14595475a 488d4d18 lea rcx, [rbp + 0x18]
14595475e 66ba0300 mov dx, 3
145954762 4589f8 mov r8d, r15d
145954765 e856d10400 call 0x1459a18c0
14595476a 90 nop
14595476b 488d4d18 lea rcx, [rbp + 0x18]
14595476f 66ba0400 mov dx, 4
145954773 4589e8 mov r8d, r13d
145954776 e845d10400 call 0x1459a18c0
14595477b 90 nop
14595477c 488d4d18 lea rcx, [rbp + 0x18]
145954780 66ba0800 mov dx, 8
145954784 4589e0 mov r8d, r12d
145954787 e834d10400 call 0x1459a18c0
14595478c 90 nop
14595478d 488d4d18 lea rcx, [rbp + 0x18]
145954791 66ba0900 mov dx, 9
145954795 448b85d0000000 mov r8d, dword ptr [rbp + 0xd0]
14595479c e81fd10400 call 0x1459a18c0
1459547a1 90 nop
1459547a2 0f57c0 xorps xmm0, xmm0
1459547a5 f30f58f8 addss xmm7, xmm0
1459547a9 f30f103557dd5400 movss xmm6, dword ptr [rip + 0x54dd57]
1459547b1 f30f59f7 mulss xmm6, xmm7
1459547b5 0f28c6 movaps xmm0, xmm6
1459547b8 e8fe513a00 call 0x145cf99bb
1459547bd 66410f7ec0 movd r8d, xmm0
1459547c2 488d4d18 lea rcx, [rbp + 0x18]
1459547c6 66ba0c00 mov dx, 0xc
1459547ca e8f1d00400 call 0x1459a18c0
1459547cf 90 nop
1459547d0 0f28c6 movaps xmm0, xmm6
1459547d3 e801523a00 call 0x145cf99d9
1459547d8 66410f7ec0 movd r8d, xmm0
1459547dd 488d4d18 lea rcx, [rbp + 0x18]
1459547e1 66ba0d00 mov dx, 0xd
1459547e5 e8d6d00400 call 0x1459a18c0
1459547ea 90 nop
1459547eb 488d4d18 lea rcx, [rbp + 0x18]
1459547ef 66ba0e00 mov dx, 0xe
1459547f3 41b801000000 mov r8d, 1
1459547f9 e8c2d00400 call 0x1459a18c0
1459547fe 90 nop
1459547ff 448b03 mov r8d, dword ptr [rbx]
145954802 488d4d18 lea rcx, [rbp + 0x18]
145954806 66ba0f00 mov dx, 0xf
14595480a e8b1d00400 call 0x1459a18c0
14595480f 90 nop
145954810 448b4304 mov r8d, dword ptr [rbx + 4]
145954814 488d4d18 lea rcx, [rbp + 0x18]
145954818 66ba1000 mov dx, 0x10
14595481c e89fd00400 call 0x1459a18c0
145954821 90 nop
145954822 448b4308 mov r8d, dword ptr [rbx + 8]
145954826 488d4d18 lea rcx, [rbp + 0x18]
14595482a 66ba1100 mov dx, 0x11
14595482e e88dd00400 call 0x1459a18c0
145954833 90 nop
145954834 66410f7ef8 movd r8d, xmm7
145954839 488d4d18 lea rcx, [rbp + 0x18]
14595483d 66ba1200 mov dx, 0x12
145954841 e87ad00400 call 0x1459a18c0
145954846 90 nop
145954847 488d4d18 lea rcx, [rbp + 0x18]
14595484b 66ba1400 mov dx, 0x14
14595484f 41b823000000 mov r8d, 0x23
145954855 e866d00400 call 0x1459a18c0
14595485a 90 nop
14595485b 4c8d7d18 lea r15, [rbp + 0x18]
14595485f 4c89f9 mov rcx, r15
145954862 66ba1500 mov dx, 0x15
145954866 4589f0 mov r8d, r14d
145954869 e852d00400 call 0x1459a18c0
14595486e 90 nop
14595486f c7451000000000 mov dword ptr [rbp + 0x10], 0
145954876 48c745f800000000 mov qword ptr [rbp - 8], 0
14595487e 48c7450001000000 mov qword ptr [rbp], 1
145954886 48c7450800000000 mov qword ptr [rbp + 8], 0
14595488e c6453701 mov byte ptr [rbp + 0x37], 1
145954892 4c897c2428 mov qword ptr [rsp + 0x28], r15
145954897 f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14595489d 488d4df8 lea rcx, [rbp - 8]
1459548a1 4889f2 mov rdx, rsi
1459548a4 41b005 mov r8b, 5
1459548a7 4989d9 mov r9, rbx
1459548aa e88129f5ff call 0x1458a7230
1459548af 90 nop
1459548b0 0f1045f8 movups xmm0, xmmword ptr [rbp - 8]
1459548b4 0f104d08 movups xmm1, xmmword ptr [rbp + 8]
1459548b8 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1459548bc 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1459548c0 c6453700 mov byte ptr [rbp + 0x37], 0
1459548c4 488d4dd8 lea rcx, [rbp - 0x28]
1459548c8 488d55b0 lea rdx, [rbp - 0x50]
1459548cc e8bf2bf5ff call 0x1458a7490
1459548d1 90 nop
1459548d2 488b9f30060000 mov rbx, qword ptr [rdi + 0x630]
1459548d9 483b9f20060000 cmp rbx, qword ptr [rdi + 0x620]
1459548e0 750d jne 0x1459548ef
1459548e2 488d8f20060000 lea rcx, [rdi + 0x620]
1459548e9 e8f2573a00 call 0x145cfa0e0
1459548ee 90 nop
1459548ef 488b8728060000 mov rax, qword ptr [rdi + 0x628]
1459548f6 4889d9 mov rcx, rbx
1459548f9 48c1e105 shl rcx, 5
1459548fd 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
145954901 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
145954905 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14595490a 0f110408 movups xmmword ptr [rax + rcx], xmm0
14595490e 48ffc3 inc rbx
145954911 48899f30060000 mov qword ptr [rdi + 0x630], rbx
145954918 488d4d18 lea rcx, [rbp + 0x18]
14595491c e8ffd70400 call 0x1459a2120
145954921 4889f0 mov rax, rsi
145954924 0f287540 movaps xmm6, xmmword ptr [rbp + 0x40]
145954928 0f287d50 movaps xmm7, xmmword ptr [rbp + 0x50]
14595492c 4881c4e8000000 add rsp, 0xe8
145954933 5b pop rbx
145954934 5f pop rdi
145954935 5e pop rsi
145954936 415c pop r12
145954938 415d pop r13
14595493a 415e pop r14
14595493c 415f pop r15
14595493e 5d pop rbp
14595493f c3 ret
; purchase
145954a70 55 push rbp
145954a71 4157 push r15
145954a73 4156 push r14
145954a75 4154 push r12
145954a77 56 push rsi
145954a78 57 push rdi
145954a79 53 push rbx
145954a7a 4881ecb0000000 sub rsp, 0xb0
145954a81 488dac2480000000 lea rbp, [rsp + 0x80]
145954a89 48c74528feffffff mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
145954a91 4889ce mov rsi, rcx
145954a94 448bb1f0040000 mov r14d, dword ptr [rcx + 0x4f0]
145954a9b 448bb9c40b0000 mov r15d, dword ptr [rcx + 0xbc4]
145954aa2 4489f0 mov eax, r14d
145954aa5 4429f8 sub eax, r15d
145954aa8 726b jb 0x145954b15
145954aaa 4489f9 mov ecx, r15d
145954aad f3480f2ac1 cvtsi2ss xmm0, rcx
145954ab2 f30f5905d6d55800 mulss xmm0, dword ptr [rip + 0x58d5d6]
145954aba f30f58055eda5400 addss xmm0, dword ptr [rip + 0x54da5e]
145954ac2 f3480f2cc8 cvttss2si rcx, xmm0
145954ac7 31d2 xor edx, edx
145954ac9 0f57c9 xorps xmm1, xmm1
145954acc 0f2ec1 ucomiss xmm0, xmm1
145954acf 0f43d1 cmovae edx, ecx
145954ad2 0f2e05fb1e5800 ucomiss xmm0, dword ptr [rip + 0x581efb]
145954ad9 b9ffffffff mov ecx, 0xffffffff
145954ade 0f46ca cmovbe ecx, edx
145954ae1 8986f0040000 mov dword ptr [rsi + 0x4f0], eax
145954ae7 898ec40b0000 mov dword ptr [rsi + 0xbc4], ecx
145954aed 488d8ef80a0000 lea rcx, [rsi + 0xaf8]
145954af4 4469c010270000 imul r8d, eax, 0x2710
145954afb 66ba9804 mov dx, 0x498
145954aff e8bccd0400 call 0x1459a18c0
145954b04 ff86a0070000 inc dword ptr [rsi + 0x7a0]
145954b0a ff86840b0000 inc dword ptr [rsi + 0xb84]
145954b10 e941010000 jmp 0x145954c56
145954b15 f30f10866c0b0000 movss xmm0, dword ptr [rsi + 0xb6c]
145954b1d 0f28c8 movaps xmm1, xmm0
145954b20 f30f5c8ed00b0000 subss xmm1, dword ptr [rsi + 0xbd0]
145954b28 0f2e0d491e5800 ucomiss xmm1, dword ptr [rip + 0x581e49]
145954b2f 0f8621010000 jbe 0x145954c56
145954b35 4c8da6c40b0000 lea r12, [rsi + 0xbc4]
145954b3c f30f1186d00b0000 movss dword ptr [rsi + 0xbd0], xmm0
145954b44 488d3ddd859b01 lea rdi, [rip + 0x19b85dd]
145954b4b bb1a000000 mov ebx, 0x1a
145954b50 ba1a000000 mov edx, 0x1a
145954b55 4889f9 mov rcx, rdi
145954b58 e8c30bf4ff call 0x145895720
145954b5d 4885c0 test rax, rax
145954b60 480f45f8 cmovne rdi, rax
145954b64 480f45da cmovne rbx, rdx
145954b68 488d05516f9b01 lea rax, [rip + 0x19b6f51]
145954b6f 488945d0 mov qword ptr [rbp - 0x30], rax
145954b73 48c745d801000000 mov qword ptr [rbp - 0x28], 1
145954b7b 4c8965e0 mov qword ptr [rbp - 0x20], r12
145954b7f 488d051a6f9b01 lea rax, [rip + 0x19b6f1a]
145954b86 488945e8 mov qword ptr [rbp - 0x18], rax
145954b8a 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145954b93 488d4db0 lea rcx, [rbp - 0x50]
145954b97 4c8d4dd0 lea r9, [rbp - 0x30]
145954b9b 4889fa mov rdx, rdi
145954b9e 4989d8 mov r8, rbx
145954ba1 e82a0ff4ff call 0x145895ad0
145954ba6 488b55b8 mov rdx, qword ptr [rbp - 0x48]
145954baa 4c8b45c0 mov r8, qword ptr [rbp - 0x40]
145954bae c6452701 mov byte ptr [rbp + 0x27], 1
145954bb2 488d4dd0 lea rcx, [rbp - 0x30]
145954bb6 488955c8 mov qword ptr [rbp - 0x38], rdx
145954bba e8b171f7ff call 0x1458cbd70
145954bbf 90 nop
145954bc0 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
145954bc7 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
145954bce 750d jne 0x145954bdd
145954bd0 488d8e20060000 lea rcx, [rsi + 0x620]
145954bd7 e804553a00 call 0x145cfa0e0
145954bdc 90 nop
145954bdd 488b8628060000 mov rax, qword ptr [rsi + 0x628]
145954be4 4889f9 mov rcx, rdi
145954be7 48c1e105 shl rcx, 5
145954beb 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
145954bef 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
145954bf3 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145954bf8 0f110408 movups xmmword ptr [rax + rcx], xmm0
145954bfc 48ffc7 inc rdi
145954bff 4889be30060000 mov qword ptr [rsi + 0x630], rdi
145954c06 488b45c0 mov rax, qword ptr [rbp - 0x40]
145954c0a 488945e0 mov qword ptr [rbp - 0x20], rax
145954c0e 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
145954c12 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
145954c16 488d055e456c01 lea rax, [rip + 0x16c455e]
145954c1d 48894500 mov qword ptr [rbp], rax
145954c21 48c7450805000000 mov qword ptr [rbp + 8], 5
145954c29 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145954c31 48c745f001000000 mov qword ptr [rbp - 0x10], 1
145954c39 48c745f800000000 mov qword ptr [rbp - 8], 0
145954c41 c6451000 mov byte ptr [rbp + 0x10], 0
145954c45 c6452700 mov byte ptr [rbp + 0x27], 0
145954c49 488d55d0 lea rdx, [rbp - 0x30]
145954c4d 4889f1 mov rcx, rsi
145954c50 e87bacfbff call 0x14590f8d0
145954c55 90 nop
145954c56 4539fe cmp r14d, r15d
145954c59 0f93c0 setae al
145954c5c 4881c4b0000000 add rsp, 0xb0
145954c63 5b pop rbx
145954c64 5f pop rdi
145954c65 5e pop rsi
145954c66 415c pop r12
145954c68 415e pop r14
145954c6a 415f pop r15
145954c6c 5d pop rbp
145954c6d c3 ret
; interaction
14593dc90 55 push rbp
14593dc91 56 push rsi
14593dc92 57 push rdi
14593dc93 4883ec30 sub rsp, 0x30
14593dc97 488d6c2430 lea rbp, [rsp + 0x30]
14593dc9c 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14593dca4 80b9120c000001 cmp byte ptr [rcx + 0xc12], 1
14593dcab 0f853d010000 jne 0x14593ddee
14593dcb1 4c8b8118060000 mov r8, qword ptr [rcx + 0x618]
14593dcb8 4d85c0 test r8, r8
14593dcbb 0f842d010000 je 0x14593ddee
14593dcc1 f20f1081d0040000 movsd xmm0, qword ptr [rcx + 0x4d0]
14593dcc9 488b8110060000 mov rax, qword ptr [rcx + 0x610]
14593dcd0 49c1e003 shl r8, 3
14593dcd4 4f8d04c0 lea r8, [r8 + r8*8]
14593dcd8 31f6 xor esi, esi
14593dcda 4531c9 xor r9d, r9d
14593dcdd eb11 jmp 0x14593dcf0
14593dcdf 90 nop
14593dce0 48ffc6 inc rsi
14593dce3 4983c148 add r9, 0x48
14593dce7 4d39c8 cmp r8, r9
14593dcea 0f84fe000000 je 0x14593ddee
14593dcf0 4a39540828 cmp qword ptr [rax + r9 + 0x28], rdx
14593dcf5 75e9 jne 0x14593dce0
14593dcf7 42837c082002 cmp dword ptr [rax + r9 + 0x20], 2
14593dcfd 75e1 jne 0x14593dce0
14593dcff f2420f104c0834 movsd xmm1, qword ptr [rax + r9 + 0x34]
14593dd06 0f5cc8 subps xmm1, xmm0
14593dd09 0f59c9 mulps xmm1, xmm1
14593dd0c f30f16c1 movshdup xmm0, xmm1
14593dd10 f30f58c1 addss xmm0, xmm1
14593dd14 f30f51c0 sqrtss xmm0, xmm0
14593dd18 0f2e05c1485600 ucomiss xmm0, dword ptr [rip + 0x5648c1]
14593dd1f 0f87c9000000 ja 0x14593ddee
14593dd25 4889cf mov rdi, rcx
14593dd28 e8436d0100 call 0x145954a70
14593dd2d 84c0 test al, al
14593dd2f 0f84b9000000 je 0x14593ddee
14593dd35 4889f9 mov rcx, rdi
14593dd38 4889f2 mov rdx, rsi
14593dd3b e830200100 call 0x14594fd70
14593dd40 e8bb446cfa call 0x140002200
14593dd45 b920000000 mov ecx, 0x20
14593dd4a ba01000000 mov edx, 1
14593dd4f e86c446cfa call 0x1400021c0
14593dd54 4885c0 test rax, rax
14593dd57 0f8499000000 je 0x14593ddf6
14593dd5d 488945f0 mov qword ptr [rbp - 0x10], rax
14593dd61 c700b4040000 mov dword ptr [rax], 0x4b4
14593dd67 4889f9 mov rcx, rdi
14593dd6a 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
14593dd71 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
14593dd78 750f jne 0x14593dd89
14593dd7a 4881c120060000 add rcx, 0x620
14593dd81 e85ac33b00 call 0x145cfa0e0
14593dd86 4889f9 mov rcx, rdi
14593dd89 488b8128060000 mov rax, qword ptr [rcx + 0x628]
14593dd90 4889f2 mov rdx, rsi
14593dd93 48c1e205 shl rdx, 5
14593dd97 48c7041020000000 mov qword ptr [rax + rdx], 0x20
14593dd9f 4c8b45f0 mov r8, qword ptr [rbp - 0x10]
14593dda3 4c89441008 mov qword ptr [rax + rdx + 8], r8
14593dda8 48c744101004000000 mov qword ptr [rax + rdx + 0x10], 4
14593ddb1 66c7441018d202 mov word ptr [rax + rdx + 0x18], 0x2d2
14593ddb8 48ffc6 inc rsi
14593ddbb 4889b130060000 mov qword ptr [rcx + 0x630], rsi
14593ddc2 80b9120c000001 cmp byte ptr [rcx + 0xc12], 1
14593ddc9 7523 jne 0x14593ddee
14593ddcb 83b9840b000000 cmp dword ptr [rcx + 0xb84], 0
14593ddd2 741a je 0x14593ddee
14593ddd4 80b9080c000000 cmp byte ptr [rcx + 0xc08], 0
14593dddb 7511 jne 0x14593ddee
14593dddd b201 mov dl, 1
14593dddf 41b001 mov r8b, 1
14593dde2 4883c430 add rsp, 0x30
14593dde6 5f pop rdi
14593dde7 5e pop rsi
14593dde8 5d pop rbp
14593dde9 e9a2730200 jmp 0x145965190
14593ddee 4883c430 add rsp, 0x30
14593ddf2 5f pop rdi
14593ddf3 5e pop rsi
14593ddf4 5d pop rbp
14593ddf5 c3 ret
14593ddf6 b901000000 mov ecx, 1
14593ddfb ba20000000 mov edx, 0x20
14593de00 e886df5500 call 0x145e9bd8b
14593de05 0f0b ud2
; remove
14594fd70 55 push rbp
14594fd71 4157 push r15
14594fd73 4156 push r14
14594fd75 4154 push r12
14594fd77 56 push rsi
14594fd78 57 push rdi
14594fd79 53 push rbx
14594fd7a 4883ec50 sub rsp, 0x50
14594fd7e 488d6c2450 lea rbp, [rsp + 0x50]
14594fd83 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
14594fd8b 4889d7 mov rdi, rdx
14594fd8e 488b9918060000 mov rbx, qword ptr [rcx + 0x618]
14594fd95 4839da cmp rdx, rbx
14594fd98 0f83c5010000 jae 0x14594ff63
14594fd9e 4889ce mov rsi, rcx
14594fda1 488b8110060000 mov rax, qword ptr [rcx + 0x610]
14594fda8 488d14ff lea rdx, [rdi + rdi*8]
14594fdac 488d0cd0 lea rcx, [rax + rdx*8]
14594fdb0 4c8b24d0 mov r12, qword ptr [rax + rdx*8]
14594fdb4 4c8b44d008 mov r8, qword ptr [rax + rdx*8 + 8]
14594fdb9 4c8945d8 mov qword ptr [rbp - 0x28], r8
14594fdbd 4c8b74d010 mov r14, qword ptr [rax + rdx*8 + 0x10]
14594fdc2 4c8b7cd028 mov r15, qword ptr [rax + rdx*8 + 0x28]
14594fdc7 488d14d0 lea rdx, [rax + rdx*8]
14594fdcb 4883c248 add rdx, 0x48
14594fdcf 4889f8 mov rax, rdi
14594fdd2 48f7d0 not rax
14594fdd5 4801d8 add rax, rbx
14594fdd8 48c1e003 shl rax, 3
14594fddc 4c8d04c0 lea r8, [rax + rax*8]
14594fde0 e8b89b3a00 call 0x145cf999d
14594fde5 48ffcb dec rbx
14594fde8 48899e18060000 mov qword ptr [rsi + 0x618], rbx
14594fdef 4983fcff cmp r12, -1
14594fdf3 0f846a010000 je 0x14594ff63
14594fdf9 4c8965e8 mov qword ptr [rbp - 0x18], r12
14594fdfd e8fe236bfa call 0x140002200
14594fe02 b920000000 mov ecx, 0x20
14594fe07 ba01000000 mov edx, 1
14594fe0c e8af236bfa call 0x1400021c0
14594fe11 4885c0 test rax, rax
14594fe14 0f845d010000 je 0x14594ff77
14594fe1a 488dbe20060000 lea rdi, [rsi + 0x620]
14594fe21 488945e0 mov qword ptr [rbp - 0x20], rax
14594fe25 4c8938 mov qword ptr [rax], r15
14594fe28 488b9e30060000 mov rbx, qword ptr [rsi + 0x630]
14594fe2f 483b9e20060000 cmp rbx, qword ptr [rsi + 0x620]
14594fe36 7509 jne 0x14594fe41
14594fe38 4889f9 mov rcx, rdi
14594fe3b e8a0a23a00 call 0x145cfa0e0
14594fe40 90 nop
14594fe41 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594fe48 4889d9 mov rcx, rbx
14594fe4b 48c1e105 shl rcx, 5
14594fe4f 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14594fe57 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594fe5b 4889540808 mov qword ptr [rax + rcx + 8], rdx
14594fe60 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14594fe69 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14594fe70 48ffc3 inc rbx
14594fe73 48899e30060000 mov qword ptr [rsi + 0x630], rbx
14594fe7a 4d85f6 test r14, r14
14594fe7d 0f8495000000 je 0x14594ff18
14594fe83 49c1e603 shl r14, 3
14594fe87 31db xor ebx, ebx
14594fe89 eb47 jmp 0x14594fed2
14594fe8b 0f1f440000 nop dword ptr [rax + rax]
14594fe90 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594fe97 4c89f9 mov rcx, r15
14594fe9a 48c1e105 shl rcx, 5
14594fe9e 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14594fea6 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14594feaa 4889540808 mov qword ptr [rax + rcx + 8], rdx
14594feaf 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14594feb8 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14594febf 49ffc7 inc r15
14594fec2 4c89be30060000 mov qword ptr [rsi + 0x630], r15
14594fec9 4883c308 add rbx, 8
14594fecd 4939de cmp r14, rbx
14594fed0 7446 je 0x14594ff18
14594fed2 488b45d8 mov rax, qword ptr [rbp - 0x28]
14594fed6 4c8b3c18 mov r15, qword ptr [rax + rbx]
14594feda e821236bfa call 0x140002200
14594fedf b920000000 mov ecx, 0x20
14594fee4 ba01000000 mov edx, 1
14594fee9 e8d2226bfa call 0x1400021c0
14594feee 4885c0 test rax, rax
14594fef1 745e je 0x14594ff51
14594fef3 488945e0 mov qword ptr [rbp - 0x20], rax
14594fef7 4c8938 mov qword ptr [rax], r15
14594fefa 4c8bbe30060000 mov r15, qword ptr [rsi + 0x630]
14594ff01 4c3bbe20060000 cmp r15, qword ptr [rsi + 0x620]
14594ff08 7586 jne 0x14594fe90
14594ff0a 4889f9 mov rcx, rdi
14594ff0d e8cea13a00 call 0x145cfa0e0
14594ff12 90 nop
14594ff13 e978ffffff jmp 0x14594fe90
14594ff18 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14594ff1c 4885d2 test rdx, rdx
14594ff1f 7421 je 0x14594ff42
14594ff21 48c1e203 shl rdx, 3
14594ff25 41b808000000 mov r8d, 8
14594ff2b 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
14594ff2f 4883c450 add rsp, 0x50
14594ff33 5b pop rbx
14594ff34 5f pop rdi
14594ff35 5e pop rsi
14594ff36 415c pop r12
14594ff38 415e pop r14
14594ff3a 415f pop r15
14594ff3c 5d pop rbp
14594ff3d e98e226bfa jmp 0x1400021d0
14594ff42 4883c450 add rsp, 0x50
14594ff46 5b pop rbx
14594ff47 5f pop rdi
14594ff48 5e pop rsi
14594ff49 415c pop r12
14594ff4b 415e pop r14
14594ff4d 415f pop r15
14594ff4f 5d pop rbp
14594ff50 c3 ret
14594ff51 b901000000 mov ecx, 1
14594ff56 ba20000000 mov edx, 0x20
14594ff5b e82bbe5400 call 0x145e9bd8b
14594ff60 90 nop
14594ff61 eb28 jmp 0x14594ff8b
14594ff63 4c8d051ed19b01 lea r8, [rip + 0x19bd11e]
14594ff6a 4889f9 mov rcx, rdi
14594ff6d 4889da mov rdx, rbx
14594ff70 e8e6be5400 call 0x145e9be5b
14594ff75 0f0b ud2
14594ff77 c645f700 mov byte ptr [rbp - 9], 0
14594ff7b b901000000 mov ecx, 1
14594ff80 ba20000000 mov edx, 0x20
14594ff85 e801be5400 call 0x145e9bd8b
14594ff8a 90 nop
14594ff8b 0f0b ud2
; go-drive
1409da522 c7421000000000 mov dword ptr [rdx + 0x10], 0
1409da529 488b4c2470 mov rcx, qword ptr [rsp + 0x70]
1409da52e 8929 mov dword ptr [rcx], ebp
1409da530 c7421c00000000 mov dword ptr [rdx + 0x1c], 0
1409da537 4084ff test dil, dil
1409da53a 742d je 0x1409da569
1409da53c 85f6 test esi, esi
1409da53e 7479 je 0x1409da5b9
1409da540 83fe01 cmp esi, 1
1409da543 744c je 0x1409da591
1409da545 83fe02 cmp esi, 2
1409da548 751f jne 0x1409da569
1409da54a 4183f803 cmp r8d, 3
1409da54e 0f831c050000 jae 0x1409daa70
1409da554 4489442450 mov dword ptr [rsp + 0x50], r8d
1409da559 41c1e004 shl r8d, 4
1409da55d 48be9500980097000000 movabs rsi, 0x9700980095
1409da567 eb6d jmp 0x1409da5d6
1409da569 4183f803 cmp r8d, 3
1409da56d 0f83fd040000 jae 0x1409daa70
1409da573 41c1e004 shl r8d, 4
1409da577 48be9500930097000000 movabs rsi, 0x9700930095
1409da581 4489c1 mov ecx, r8d
1409da584 48d3ee shr rsi, cl
1409da587 c744245000000000 mov dword ptr [rsp + 0x50], 0
1409da58f eb4b jmp 0x1409da5dc
1409da591 4183f803 cmp r8d, 3
1409da595 0f83d5040000 jae 0x1409daa70
1409da59b 4489c1 mov ecx, r8d
1409da59e c1e104 shl ecx, 4
1409da5a1 48be9400930096000000 movabs rsi, 0x9600930094
1409da5ab 48d3ee shr rsi, cl
1409da5ae 4180f001 xor r8b, 1
1409da5b2 4489442450 mov dword ptr [rsp + 0x50], r8d
1409da5b7 eb23 jmp 0x1409da5dc
1409da5b9 4183f803 cmp r8d, 3
1409da5bd 0f83ad040000 jae 0x1409daa70
1409da5c3 4489442450 mov dword ptr [rsp + 0x50], r8d
1409da5c8 41c1e004 shl r8d, 4
1409da5cc 48be9500920097000000 movabs rsi, 0x9700920095
1409da5d6 4489c1 mov ecx, r8d
1409da5d9 48d3ee shr rsi, cl
1409da5dc 488b942490000000 mov rdx, qword ptr [rsp + 0x90]
1409da5e4 488b4a48 mov rcx, qword ptr [rdx + 0x48]
1409da5e8 4c8b4250 mov r8, qword ptr [rdx + 0x50]
1409da5ec 0fb7d6 movzx edx, si
1409da5ef 4939d0 cmp r8, rdx
1409da5f2 7610 jbe 0x1409da604
1409da5f4 66833c51ff cmp word ptr [rcx + rdx*2], -1
1409da5f9 7409 je 0x1409da604
1409da5fb 31ff xor edi, edi
1409da5fd 89f5 mov ebp, esi
1409da5ff e983010000 jmp 0x1409da787
1409da604 4189d1 mov r9d, edx
1409da607 4181c16effffff add r9d, 0xffffff6e
1409da60e 4183f903 cmp r9d, 3
1409da612 0f87d6000000 ja 0x1409da6ee
1409da618 4c89d7 mov rdi, r10
1409da61b 4c8d15125f6305 lea r10, [rip + 0x5635f12]
1409da622 4f630c8a movsxd r9, dword ptr [r10 + r9*4]
1409da626 4d01d1 add r9, r10
1409da629 41ffe1 jmp r9
1409da62c 4981f894000000 cmp r8, 0x94
1409da633 4989fa mov r10, rdi
1409da636 0f869e000000 jbe 0x1409da6da
1409da63c 31ed xor ebp, ebp
1409da63e 6683b928010000ff cmp word ptr [rcx + 0x128], -1
1409da646 400f94c5 sete bpl
1409da64a 81cd92000000 or ebp, 0x92
1409da650 31ff xor edi, edi
1409da652 4939d0 cmp r8, rdx
1409da655 0f870f010000 ja 0x1409da76a
1409da65b e911010000 jmp 0x1409da771
1409da660 66bd9500 mov bp, 0x95
1409da664 4981f892000000 cmp r8, 0x92
1409da66b 4989fa mov r10, rdi
1409da66e 0f86ef000000 jbe 0x1409da763
1409da674 6683b924010000ff cmp word ptr [rcx + 0x124], -1
1409da67c 0f84bb000000 je 0x1409da73d
1409da682 66bd9400 mov bp, 0x94
1409da686 31ff xor edi, edi
1409da688 4939d0 cmp r8, rdx
1409da68b 0f87d9000000 ja 0x1409da76a
1409da691 e9db000000 jmp 0x1409da771
1409da696 4981f894000000 cmp r8, 0x94
1409da69d 4989fa mov r10, rdi
1409da6a0 7657 jbe 0x1409da6f9
1409da6a2 6683b928010000ff cmp word ptr [rcx + 0x128], -1
1409da6aa 7456 je 0x1409da702
1409da6ac 66bd9500 mov bp, 0x95
1409da6b0 31ff xor edi, edi
1409da6b2 4939d0 cmp r8, rdx
1409da6b5 0f87af000000 ja 0x1409da76a
1409da6bb e9b1000000 jmp 0x1409da771
1409da6c0 4981f892000000 cmp r8, 0x92
1409da6c7 4989fa mov r10, rdi
1409da6ca 765a jbe 0x1409da726
1409da6cc 6683b924010000ff cmp word ptr [rcx + 0x124], -1
1409da6d4 0f8420060000 je 0x1409dacfa
1409da6da 66bd9300 mov bp, 0x93
1409da6de 31ff xor edi, edi
1409da6e0 4939d0 cmp r8, rdx
1409da6e3 0f8781000000 ja 0x1409da76a
1409da6e9 e983000000 jmp 0x1409da771
1409da6ee 31ff xor edi, edi
1409da6f0 89f5 mov ebp, esi
1409da6f2 4939d0 cmp r8, rdx
1409da6f5 7773 ja 0x1409da76a
1409da6f7 eb78 jmp 0x1409da771
1409da6f9 4981f893000000 cmp r8, 0x93
1409da700 722e jb 0x1409da730
1409da702 4531c9 xor r9d, r9d
1409da705 6683b924010000ff cmp word ptr [rcx + 0x124], -1
1409da70d 400f95c7 setne dil
1409da711 410f94c1 sete r9b
1409da715 438d2c89 lea ebp, [r9 + r9*4]
1409da719 81c592000000 add ebp, 0x92
1409da71f 4939d0 cmp r8, rdx
1409da722 7746 ja 0x1409da76a
1409da724 eb4b jmp 0x1409da771
1409da726 66be9300 mov si, 0x93
1409da72a 31ed xor ebp, ebp
1409da72c 31ff xor edi, edi
1409da72e eb57 jmp 0x1409da787
1409da730 66bd9700 mov bp, 0x97
1409da734 31ff xor edi, edi
1409da736 4939d0 cmp r8, rdx
1409da739 772f ja 0x1409da76a
1409da73b eb34 jmp 0x1409da771
1409da73d 4981f897000000 cmp r8, 0x97
1409da744 721d jb 0x1409da763
1409da746 31ed xor ebp, ebp
1409da748 6683b92c010000ff cmp word ptr [rcx + 0x12c], -1
1409da750 400f95c5 setne bpl
1409da754 81c595000000 add ebp, 0x95
1409da75a 31ff xor edi, edi
1409da75c 4939d0 cmp r8, rdx
1409da75f 7709 ja 0x1409da76a
1409da761 eb0e jmp 0x1409da771
1409da763 31ff xor edi, edi
1409da765 4939d0 cmp r8, rdx
1409da768 7607 jbe 0x1409da771
1409da76a 66833c51ff cmp word ptr [rcx + rdx*2], -1
1409da76f 7516 jne 0x1409da787
1409da771 488b542448 mov rdx, qword ptr [rsp + 0x48]
1409da776 66837a3001 cmp word ptr [rdx + 0x30], 1
1409da77b 750a jne 0x1409da787
1409da77d 66396a32 cmp word ptr [rdx + 0x32], bp
1409da781 0f84a9f7ffff je 0x1409d9f30
; walk-proximity
14594eea0 488b8580000000 mov rax, qword ptr [rbp + 0x80]
14594eea7 f20f104034 movsd xmm0, qword ptr [rax + 0x34]
14594eeac 0f5cc7 subps xmm0, xmm7
14594eeaf 0f59c0 mulps xmm0, xmm0
14594eeb2 f30f16c8 movshdup xmm1, xmm0
14594eeb6 f30f58c8 addss xmm1, xmm0
14594eeba 0f57c0 xorps xmm0, xmm0
14594eebd f30f51c1 sqrtss xmm0, xmm1
14594eec1 440f2ed0 ucomiss xmm10, xmm0
14594eec5 736d jae 0x14594ef34
; walk-click-policy
14594efed 4183fe02 cmp r14d, 2
14594eff1 0f85b9000000 jne 0x14594f0b0
14594eff7 80be030c000000 cmp byte ptr [rsi + 0xc03], 0
14594effe 0f848c000000 je 0x14594f090
14594f004 80be060c000000 cmp byte ptr [rsi + 0xc06], 0
14594f00b c686060c000001 mov byte ptr [rsi + 0xc06], 1
14594f012 759c jne 0x14594efb0
