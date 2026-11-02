140203a30 55 push rbp
140203a31 4157 push r15
140203a33 4156 push r14
140203a35 4155 push r13
140203a37 4154 push r12
140203a39 56 push rsi
140203a3a 57 push rdi
140203a3b 53 push rbx
140203a3c 4881ecc8080000 sub rsp, 0x8c8
140203a43 488dac2480000000 lea rbp, [rsp + 0x80]
140203a4b 440f29bd30080000 movaps xmmword ptr [rbp + 0x830], xmm15
140203a53 440f29b520080000 movaps xmmword ptr [rbp + 0x820], xmm14
140203a5b 440f29ad10080000 movaps xmmword ptr [rbp + 0x810], xmm13
140203a63 440f29a500080000 movaps xmmword ptr [rbp + 0x800], xmm12
140203a6b 440f299df0070000 movaps xmmword ptr [rbp + 0x7f0], xmm11
140203a73 440f2995e0070000 movaps xmmword ptr [rbp + 0x7e0], xmm10
140203a7b 440f298dd0070000 movaps xmmword ptr [rbp + 0x7d0], xmm9
140203a83 440f2985c0070000 movaps xmmword ptr [rbp + 0x7c0], xmm8
140203a8b 0f29bdb0070000 movaps xmmword ptr [rbp + 0x7b0], xmm7
140203a92 0f29b5a0070000 movaps xmmword ptr [rbp + 0x7a0], xmm6
140203a99 48c78598070000feffffff mov qword ptr [rbp + 0x798], 0xfffffffffffffffe
140203aa4 488b31 mov rsi, qword ptr [rcx]
140203aa7 488b4128 mov rax, qword ptr [rcx + 0x28]
140203aab 48897568 mov qword ptr [rbp + 0x68], rsi
140203aaf 488d7d70 lea rdi, [rbp + 0x70]
140203ab3 0f104108 movups xmm0, xmmword ptr [rcx + 8]
140203ab7 0f114570 movups xmmword ptr [rbp + 0x70], xmm0
140203abb 48898db0030000 mov qword ptr [rbp + 0x3b0], rcx
140203ac2 0f104118 movups xmm0, xmmword ptr [rcx + 0x18]
140203ac6 0f118580000000 movups xmmword ptr [rbp + 0x80], xmm0
140203acd 48898590000000 mov qword ptr [rbp + 0x90], rax
140203ad4 488995f8040000 mov qword ptr [rbp + 0x4f8], rdx
140203adb 488b4218 mov rax, qword ptr [rdx + 0x18]
140203adf 488d8d08050000 lea rcx, [rbp + 0x508]
140203ae6 f2440f1038 movsd xmm15, qword ptr [rax]
140203aeb 0f10350e7ebe05 movups xmm6, xmmword ptr [rip + 0x5be7e0e]
140203af2 0f29b590040000 movaps xmmword ptr [rbp + 0x490], xmm6
140203af9 48c785a004000000000000 mov qword ptr [rbp + 0x4a0], 0
140203b04 0f103d0d7ebe05 movups xmm7, xmmword ptr [rip + 0x5be7e0d]
140203b0b 0f11bda8040000 movups xmmword ptr [rbp + 0x4a8], xmm7
140203b12 48c785b804000000000000 mov qword ptr [rbp + 0x4b8], 0
140203b1d 440f10050b7ebe05 movups xmm8, xmmword ptr [rip + 0x5be7e0b]
140203b25 440f2985c0040000 movaps xmmword ptr [rbp + 0x4c0], xmm8
140203b2d 48c785d004000000000000 mov qword ptr [rbp + 0x4d0], 0
140203b38 440f100d087ebe05 movups xmm9, xmmword ptr [rip + 0x5be7e08]
140203b40 440f118dd8040000 movups xmmword ptr [rbp + 0x4d8], xmm9
140203b48 48c785e804000000000000 mov qword ptr [rbp + 0x4e8], 0
140203b53 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
140203b5a 488b85a0040000 mov rax, qword ptr [rbp + 0x4a0]
140203b61 488985b0010000 mov qword ptr [rbp + 0x1b0], rax
140203b68 488b85a8040000 mov rax, qword ptr [rbp + 0x4a8]
140203b6f 488985b8010000 mov qword ptr [rbp + 0x1b8], rax
140203b76 488b85b0040000 mov rax, qword ptr [rbp + 0x4b0]
140203b7d 488985c0010000 mov qword ptr [rbp + 0x1c0], rax
140203b84 488b85b8040000 mov rax, qword ptr [rbp + 0x4b8]
140203b8b 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
140203b92 440f2985d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm8
140203b9a 488b85d0040000 mov rax, qword ptr [rbp + 0x4d0]
140203ba1 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
140203ba8 488b85d8040000 mov rax, qword ptr [rbp + 0x4d8]
140203baf 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
140203bb6 0f2885e0040000 movaps xmm0, xmmword ptr [rbp + 0x4e0]
140203bbd 0f2985f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm0
140203bc4 450f57ed xorps xmm13, xmm13
140203bc8 440f29ad10020000 movaps xmmword ptr [rbp + 0x210], xmm13
140203bd0 440f29ad00020000 movaps xmmword ptr [rbp + 0x200], xmm13
140203bd8 48c7852002000000000000 mov qword ptr [rbp + 0x220], 0
140203be3 440f11adb0050000 movups xmmword ptr [rbp + 0x5b0], xmm13
140203beb 440f11ada0050000 movups xmmword ptr [rbp + 0x5a0], xmm13
140203bf3 c7857c06000000000000 mov dword ptr [rbp + 0x67c], 0
140203bfd 66c785800600000000 mov word ptr [rbp + 0x680], 0
140203c06 488d95a0010000 lea rdx, [rbp + 0x1a0]
140203c0d 41b888000000 mov r8d, 0x88
140203c13 e8cf649f05 call 0x145bfa0e7
140203c18 c7859005000001000000 mov dword ptr [rbp + 0x590], 1
140203c22 f3440f11bd94050000 movss dword ptr [rbp + 0x594], xmm15
140203c2b c7859805000001000000 mov dword ptr [rbp + 0x598], 1
140203c35 f3410f16c7 movshdup xmm0, xmm15
140203c3a f30f11859c050000 movss dword ptr [rbp + 0x59c], xmm0
140203c42 440f10156e7dbe05 movups xmm10, xmmword ptr [rip + 0x5be7d6e]
140203c4a 440f1195c0050000 movups xmmword ptr [rbp + 0x5c0], xmm10
140203c52 440f101d6e7dbe05 movups xmm11, xmmword ptr [rip + 0x5be7d6e]
140203c5a 440f119dd0050000 movups xmmword ptr [rbp + 0x5d0], xmm11
140203c62 0f10056f7dbe05 movups xmm0, xmmword ptr [rip + 0x5be7d6f]
140203c69 0f1185e0050000 movups xmmword ptr [rbp + 0x5e0], xmm0
140203c70 0f1005717dbe05 movups xmm0, xmmword ptr [rip + 0x5be7d71]
140203c77 0f1185f0050000 movups xmmword ptr [rbp + 0x5f0], xmm0
140203c7e 0f1005737dbe05 movups xmm0, xmmword ptr [rip + 0x5be7d73]
140203c85 0f118500060000 movups xmmword ptr [rbp + 0x600], xmm0
140203c8c 0f1005757dbe05 movups xmm0, xmmword ptr [rip + 0x5be7d75]
140203c93 0f118510060000 movups xmmword ptr [rbp + 0x610], xmm0
140203c9a 440f1035867dbe05 movups xmm14, xmmword ptr [rip + 0x5be7d86]
140203ca2 440f11b530060000 movups xmmword ptr [rbp + 0x630], xmm14
140203caa 440f1025667dbe05 movups xmm12, xmmword ptr [rip + 0x5be7d66]
140203cb2 440f11a520060000 movups xmmword ptr [rbp + 0x620], xmm12
140203cba 0f2805af95b905 movaps xmm0, xmmword ptr [rip + 0x5b995af]
140203cc1 0f118540060000 movups xmmword ptr [rbp + 0x640], xmm0
140203cc8 c7855006000001000000 mov dword ptr [rbp + 0x650], 1
140203cd2 48c7855406000000000000 mov qword ptr [rbp + 0x654], 0
140203cdd c6855c06000001 mov byte ptr [rbp + 0x65c], 1
140203ce4 48c7856006000000000000 mov qword ptr [rbp + 0x660], 0
140203cef c785680600000000803f mov dword ptr [rbp + 0x668], 0x3f800000
140203cf9 66c7856c0600000000 mov word ptr [rbp + 0x66c], 0
140203d02 c7856e06000000000100 mov dword ptr [rbp + 0x66e], 0x10000
140203d0c 66c785720600000000 mov word ptr [rbp + 0x672], 0
140203d15 48b80000010000000001 movabs rax, 0x100000000010000
140203d1f 48898574060000 mov qword ptr [rbp + 0x674], rax
140203d26 c7858206000005000005 mov dword ptr [rbp + 0x682], 0x5000005
140203d30 f2440f11bd88060000 movsd qword ptr [rbp + 0x688], xmm15
140203d39 c785900600006666a63f mov dword ptr [rbp + 0x690], 0x3fa66666
140203d43 0f1005b67fbe05 movups xmm0, xmmword ptr [rip + 0x5be7fb6]
140203d4a 0f118594060000 movups xmmword ptr [rbp + 0x694], xmm0
140203d51 0f1005b87fbe05 movups xmm0, xmmword ptr [rip + 0x5be7fb8]
140203d58 0f1185a4060000 movups xmmword ptr [rbp + 0x6a4], xmm0
140203d5f 4889b500050000 mov qword ptr [rbp + 0x500], rsi
140203d66 c6859207000001 mov byte ptr [rbp + 0x792], 1
140203d6d 488d4d38 lea rcx, [rbp + 0x38]
140203d71 4c8d8500050000 lea r8, [rbp + 0x500]
140203d78 4889fa mov rdx, rdi
140203d7b e840aafdff call 0x1401de7c0
140203d80 90 nop
140203d81 488b85f8040000 mov rax, qword ptr [rbp + 0x4f8]
140203d88 4c8b7820 mov r15, qword ptr [rax + 0x20]
140203d8c 4c8b6828 mov r13, qword ptr [rax + 0x28]
140203d90 488b5830 mov rbx, qword ptr [rax + 0x30]
140203d94 488b7038 mov rsi, qword ptr [rax + 0x38]
140203d98 4c8b4040 mov r8, qword ptr [rax + 0x40]
140203d9c 488b5048 mov rdx, qword ptr [rax + 0x48]
140203da0 488b4850 mov rcx, qword ptr [rax + 0x50]
140203da4 4c8b6058 mov r12, qword ptr [rax + 0x58]
140203da8 4c89bdc8000000 mov qword ptr [rbp + 0xc8], r15
140203daf 4c89add0000000 mov qword ptr [rbp + 0xd0], r13
140203db6 48899dd8000000 mov qword ptr [rbp + 0xd8], rbx
140203dbd 4889b5e0000000 mov qword ptr [rbp + 0xe0], rsi
140203dc4 4c898570070000 mov qword ptr [rbp + 0x770], r8
140203dcb 4c8985e8000000 mov qword ptr [rbp + 0xe8], r8
140203dd2 48899580070000 mov qword ptr [rbp + 0x780], rdx
140203dd9 488995f0000000 mov qword ptr [rbp + 0xf0], rdx
140203de0 48898d78070000 mov qword ptr [rbp + 0x778], rcx
140203de7 48898df8000000 mov qword ptr [rbp + 0xf8], rcx
140203dee 0f1000 movups xmm0, xmmword ptr [rax]
140203df1 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
140203df8 488b4010 mov rax, qword ptr [rax + 0x10]
140203dfc 488985c0000000 mov qword ptr [rbp + 0xc0], rax
140203e03 4c89a500010000 mov qword ptr [rbp + 0x100], r12
140203e0a 4c8b7538 mov r14, qword ptr [rbp + 0x38]
140203e0e 488b4560 mov rax, qword ptr [rbp + 0x60]
140203e12 4c897508 mov qword ptr [rbp + 8], r14
140203e16 0f104540 movups xmm0, xmmword ptr [rbp + 0x40]
140203e1a 0f114510 movups xmmword ptr [rbp + 0x10], xmm0
140203e1e 0f104550 movups xmm0, xmmword ptr [rbp + 0x50]
140203e22 0f114520 movups xmmword ptr [rbp + 0x20], xmm0
140203e26 48894530 mov qword ptr [rbp + 0x30], rax
140203e2a 66c785640600000000 mov word ptr [rbp + 0x664], 0
140203e33 c6855406000001 mov byte ptr [rbp + 0x654], 1
140203e3a 440f29ad60050000 movaps xmmword ptr [rbp + 0x560], xmm13
140203e42 440f29ad70050000 movaps xmmword ptr [rbp + 0x570], xmm13
140203e4a 440f29ad80050000 movaps xmmword ptr [rbp + 0x580], xmm13
140203e52 440f29ad90050000 movaps xmmword ptr [rbp + 0x590], xmm13
140203e5a 440f29ada0050000 movaps xmmword ptr [rbp + 0x5a0], xmm13
140203e62 48c785b005000000000000 mov qword ptr [rbp + 0x5b0], 0
140203e6d c7857a06000005000000 mov dword ptr [rbp + 0x67a], 5
140203e77 440f1195b8050000 movups xmmword ptr [rbp + 0x5b8], xmm10
140203e7f 440f119dc8050000 movups xmmword ptr [rbp + 0x5c8], xmm11
140203e87 0f2805926dbe05 movaps xmm0, xmmword ptr [rip + 0x5be6d92]
140203e8e 0f1185d8050000 movups xmmword ptr [rbp + 0x5d8], xmm0
140203e95 0f28051497b905 movaps xmm0, xmmword ptr [rip + 0x5b99714]
140203e9c 0f1185e8050000 movups xmmword ptr [rbp + 0x5e8], xmm0
140203ea3 0f2805a693b905 movaps xmm0, xmmword ptr [rip + 0x5b993a6]
140203eaa 0f1185f8050000 movups xmmword ptr [rbp + 0x5f8], xmm0
140203eb1 0f118508060000 movups xmmword ptr [rbp + 0x608], xmm0
140203eb8 440f11a518060000 movups xmmword ptr [rbp + 0x618], xmm12
140203ec0 440f11b528060000 movups xmmword ptr [rbp + 0x628], xmm14
140203ec8 48c7855806000000000000 mov qword ptr [rbp + 0x658], 0
140203ed3 c785600600000000803f mov dword ptr [rbp + 0x660], 0x3f800000
140203edd 0f2805cc95b905 movaps xmm0, xmmword ptr [rip + 0x5b995cc]
140203ee4 0f118538060000 movups xmmword ptr [rbp + 0x638], xmm0
140203eeb c7854806000001000000 mov dword ptr [rbp + 0x648], 1
140203ef5 48c7854c06000000000000 mov qword ptr [rbp + 0x64c], 0
140203f00 48b80000000001000000 movabs rax, 0x100000000
140203f0a 48898572060000 mov qword ptr [rbp + 0x672], rax
140203f11 0f29b500050000 movaps xmmword ptr [rbp + 0x500], xmm6
140203f18 48c7851005000000000000 mov qword ptr [rbp + 0x510], 0
140203f23 0f11bd18050000 movups xmmword ptr [rbp + 0x518], xmm7
140203f2a 48c7852805000000000000 mov qword ptr [rbp + 0x528], 0
140203f35 440f298530050000 movaps xmmword ptr [rbp + 0x530], xmm8
140203f3d 48c7854005000000000000 mov qword ptr [rbp + 0x540], 0
140203f48 440f118d48050000 movups xmmword ptr [rbp + 0x548], xmm9
140203f50 48c7855805000000000000 mov qword ptr [rbp + 0x558], 0
140203f5b 66c7856a0600000000 mov word ptr [rbp + 0x66a], 0
140203f64 c7856606000000000100 mov dword ptr [rbp + 0x666], 0x10000
140203f6e 66c785700600000000 mov word ptr [rbp + 0x670], 0
140203f77 c7856c06000000000100 mov dword ptr [rbp + 0x66c], 0x10000
140203f81 c6859507000001 mov byte ptr [rbp + 0x795], 1
140203f88 488d8da0010000 lea rcx, [rbp + 0x1a0]
140203f8f 488d9500050000 lea rdx, [rbp + 0x500]
140203f96 e8d5d1efff call 0x140101170
140203f9b 90 nop
140203f9c 488d7d10 lea rdi, [rbp + 0x10]
140203fa0 488d8d08050000 lea rcx, [rbp + 0x508]
140203fa7 488d95a0010000 lea rdx, [rbp + 0x1a0]
140203fae 41b800020000 mov r8d, 0x200
140203fb4 e82e619f05 call 0x145bfa0e7
140203fb9 4c89b500050000 mov qword ptr [rbp + 0x500], r14
140203fc0 c6859507000001 mov byte ptr [rbp + 0x795], 1
140203fc7 488d4dd8 lea rcx, [rbp - 0x28]
140203fcb 4c8d8500050000 lea r8, [rbp + 0x500]
140203fd2 4889fa mov rdx, rdi
140203fd5 e88617feff call 0x1401e5760
140203fda 90 nop
140203fdb 4c89bd58010000 mov qword ptr [rbp + 0x158], r15
140203fe2 4c89ad60010000 mov qword ptr [rbp + 0x160], r13
140203fe9 48899d68010000 mov qword ptr [rbp + 0x168], rbx
140203ff0 4889b570010000 mov qword ptr [rbp + 0x170], rsi
140203ff7 488b8570070000 mov rax, qword ptr [rbp + 0x770]
140203ffe 48898578010000 mov qword ptr [rbp + 0x178], rax
140204005 488b8580070000 mov rax, qword ptr [rbp + 0x780]
14020400c 48898580010000 mov qword ptr [rbp + 0x180], rax
140204013 488b8578070000 mov rax, qword ptr [rbp + 0x778]
14020401a 48898588010000 mov qword ptr [rbp + 0x188], rax
140204021 488b85f8040000 mov rax, qword ptr [rbp + 0x4f8]
140204028 0f1000 movups xmm0, xmmword ptr [rax]
14020402b 0f298540010000 movaps xmmword ptr [rbp + 0x140], xmm0
140204032 488b4010 mov rax, qword ptr [rax + 0x10]
140204036 48898550010000 mov qword ptr [rbp + 0x150], rax
14020403d 4c89a540070000 mov qword ptr [rbp + 0x740], r12
140204044 4c89a590010000 mov qword ptr [rbp + 0x190], r12
14020404b 488b45d8 mov rax, qword ptr [rbp - 0x28]
14020404f 488b4d00 mov rcx, qword ptr [rbp]
140204053 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
14020405a 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
14020405e 0f1185f8030000 movups xmmword ptr [rbp + 0x3f8], xmm0
140204065 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140204069 0f118508040000 movups xmmword ptr [rbp + 0x408], xmm0
140204070 48898d18040000 mov qword ptr [rbp + 0x418], rcx
140204077 4c89e8 mov rax, r13
14020407a 4d8b2f mov r13, qword ptr [r15]
14020407d 48898548070000 mov qword ptr [rbp + 0x748], rax
140204084 803800 cmp byte ptr [rax], 0
140204087 7451 je 0x1402040da
140204089 c6859707000001 mov byte ptr [rbp + 0x797], 1
140204090 488d0d117dbe05 lea rcx, [rip + 0x5be7d11]
140204097 ba0b000000 mov edx, 0xb
14020409c e8af836e05 call 0x1458ec450
1402040a1 90 nop
1402040a2 4989d6 mov r14, rdx
1402040a5 f2440f103d3209bd05 movsd xmm15, qword ptr [rip + 0x5bd0932]
1402040ae f3440f102d4d09bd05 movss xmm13, dword ptr [rip + 0x5bd094d]
1402040b7 4d85f6 test r14, r14
1402040ba 0f899f000000 jns 0x14020415f
1402040c0 31ff xor edi, edi
1402040c2 c6859707000001 mov byte ptr [rbp + 0x797], 1
1402040c9 4889f9 mov rcx, rdi
1402040cc 4c89f2 mov rdx, r14
1402040cf e8e751b905 call 0x145d992bb
1402040d4 90 nop
1402040d5 e96e1b0000 jmp 0x140205c48
1402040da c6859707000001 mov byte ptr [rbp + 0x797], 1
1402040e1 488d0daa7cbe05 lea rcx, [rip + 0x5be7caa]
1402040e8 ba04000000 mov edx, 4
1402040ed 4989d8 mov r8, rbx
1402040f0 e8eb6b8e02 call 0x142aeace0
1402040f5 90 nop
1402040f6 4885c0 test rax, rax
1402040f9 7507 jne 0x140204102
1402040fb 488b058ec1e507 mov rax, qword ptr [rip + 0x7e5c18e]
140204102 803801 cmp byte ptr [rax], 1
140204105 7521 jne 0x140204128
140204107 80780100 cmp byte ptr [rax + 1], 0
14020410b 741b je 0x140204128
14020410d c6859707000001 mov byte ptr [rbp + 0x797], 1
140204114 488d0d7b7cbe05 lea rcx, [rip + 0x5be7c7b]
14020411b ba08000000 mov edx, 8
140204120 e82b836e05 call 0x1458ec450
140204125 90 nop
140204126 eb19 jmp 0x140204141
140204128 c6859707000001 mov byte ptr [rbp + 0x797], 1
14020412f 488d0d687cbe05 lea rcx, [rip + 0x5be7c68]
140204136 ba0a000000 mov edx, 0xa
14020413b e810836e05 call 0x1458ec450
140204140 90 nop
140204141 4989d6 mov r14, rdx
140204144 f2440f103de36bbe05 movsd xmm15, qword ptr [rip + 0x5be6be3]
14020414d f3440f102dea6bbe05 movss xmm13, dword ptr [rip + 0x5be6bea]
140204156 4d85f6 test r14, r14
140204159 0f8861ffffff js 0x1402040c0
14020415f 4c89bd68070000 mov qword ptr [rbp + 0x768], r15
140204166 745c je 0x1402041c4
140204168 4989c4 mov r12, rax
14020416b e890e0dfff call 0x140002200
140204170 bf01000000 mov edi, 1
140204175 ba01000000 mov edx, 1
14020417a 4c89f1 mov rcx, r14
14020417d e83ee0dfff call 0x1400021c0
140204182 4885c0 test rax, rax
140204185 0f8437ffffff je 0x1402040c2
14020418b 4989c7 mov r15, rax
14020418e 4889c1 mov rcx, rax
140204191 4c89e2 mov rdx, r12
140204194 4d89f0 mov r8, r14
140204197 e84b5f9f05 call 0x145bfa0e7
14020419c 41807d1801 cmp byte ptr [r13 + 0x18], 1
1402041a1 752e jne 0x1402041d1
1402041a3 418b4519 mov eax, dword ptr [r13 + 0x19]
1402041a7 418b4d1c mov ecx, dword ptr [r13 + 0x1c]
1402041ab 898da3010000 mov dword ptr [rbp + 0x1a3], ecx
1402041b1 8985a0010000 mov dword ptr [rbp + 0x1a0], eax
1402041b7 498b4520 mov rax, qword ptr [r13 + 0x20]
1402041bb 450fb65528 movzx r10d, byte ptr [r13 + 0x28]
1402041c0 b101 mov cl, 1
1402041c2 eb1d jmp 0x1402041e1
1402041c4 41bf01000000 mov r15d, 1
1402041ca 41807d1801 cmp byte ptr [r13 + 0x18], 1
1402041cf 74d2 je 0x1402041a3
1402041d1 498b4520 mov rax, qword ptr [r13 + 0x20]
1402041d5 f048ff00 lock inc qword ptr [rax]
1402041d9 0f8e691a0000 jle 0x140205c48
1402041df 31c9 xor ecx, ecx
1402041e1 488d95f8030000 lea rdx, [rbp + 0x3f8]
1402041e8 448b85a0010000 mov r8d, dword ptr [rbp + 0x1a0]
1402041ef 448b8da3010000 mov r9d, dword ptr [rbp + 0x1a3]
1402041f6 44898d3c050000 mov dword ptr [rbp + 0x53c], r9d
1402041fd 44898539050000 mov dword ptr [rbp + 0x539], r8d
140204204 4c8b85f0030000 mov r8, qword ptr [rbp + 0x3f0]
14020420b 4c89b508050000 mov qword ptr [rbp + 0x508], r14
140204212 4c89bd10050000 mov qword ptr [rbp + 0x510], r15
140204219 4c89b518050000 mov qword ptr [rbp + 0x518], r14
140204220 48c7852005000000000000 mov qword ptr [rbp + 0x520], 0
14020422b 48c7852805000004000000 mov qword ptr [rbp + 0x528], 4
140204236 48c7853005000000000000 mov qword ptr [rbp + 0x530], 0
140204241 888d38050000 mov byte ptr [rbp + 0x538], cl
140204247 48898540050000 mov qword ptr [rbp + 0x540], rax
14020424e 4c899548050000 mov qword ptr [rbp + 0x548], r10
140204255 c7855005000000003842 mov dword ptr [rbp + 0x550], 0x42380000
14020425f 66c785540500009001 mov word ptr [rbp + 0x554], 0x190
140204268 c6855605000001 mov byte ptr [rbp + 0x556], 1
14020426f c7855805000000000000 mov dword ptr [rbp + 0x558], 0
140204279 440f13bd5c050000 movlps qword ptr [rbp + 0x55c], xmm15
140204281 f3440f11ad64050000 movss dword ptr [rbp + 0x564], xmm13
14020428a c785680500000000803f mov dword ptr [rbp + 0x568], 0x3f800000
140204294 8b050618bd05 mov eax, dword ptr [rip + 0x5bd1806]
14020429a 89857c050000 mov dword ptr [rbp + 0x57c], eax
1402042a0 440f103de817bd05 movups xmm15, xmmword ptr [rip + 0x5bd17e8]
1402042a8 440f11bd6c050000 movups xmmword ptr [rbp + 0x56c], xmm15
1402042b0 f2440f102de791b905 movsd xmm13, qword ptr [rip + 0x5b991e7]
1402042b9 f2440f11ad80050000 movsd qword ptr [rbp + 0x580], xmm13
1402042c2 4c898500050000 mov qword ptr [rbp + 0x500], r8
1402042c9 c6859707000001 mov byte ptr [rbp + 0x797], 1
1402042d0 4c8db5a0010000 lea r14, [rbp + 0x1a0]
1402042d7 4c8d8500050000 lea r8, [rbp + 0x500]
1402042de 4c89f1 mov rcx, r14
1402042e1 e80ae9feff call 0x1401f2bf0
1402042e6 90 nop
1402042e7 488b8568070000 mov rax, qword ptr [rbp + 0x768]
1402042ee 4c8b20 mov r12, qword ptr [rax]
1402042f1 4c8b06 mov r8, qword ptr [rsi]
1402042f4 c6859707000001 mov byte ptr [rbp + 0x797], 1
1402042fb 488d0db17abe05 lea rcx, [rip + 0x5be7ab1]
140204302 ba04000000 mov edx, 4
140204307 e8d4698e02 call 0x142aeace0
14020430c 90 nop
14020430d 4885c0 test rax, rax
140204310 7507 jne 0x140204319
140204312 488b0577bfe507 mov rax, qword ptr [rip + 0x7e5bf77]
140204319 41bf01000000 mov r15d, 1
14020431f 803803 cmp byte ptr [rax], 3
140204322 7573 jne 0x140204397
140204324 488b5018 mov rdx, qword ptr [rax + 0x18]
140204328 4885d2 test rdx, rdx
14020432b 7918 jns 0x140204345
14020432d 4531ed xor r13d, r13d
140204330 c6859707000001 mov byte ptr [rbp + 0x797], 1
140204337 4c89e9 mov rcx, r13
14020433a e87c4fb905 call 0x145d992bb
14020433f 90 nop
140204340 e903190000 jmp 0x140205c48
140204345 48899588070000 mov qword ptr [rbp + 0x788], rdx
14020434c 7449 je 0x140204397
14020434e 488b7810 mov rdi, qword ptr [rax + 0x10]
140204352 e8a9dedfff call 0x140002200
140204357 41bd01000000 mov r13d, 1
14020435d ba01000000 mov edx, 1
140204362 4c8bbd88070000 mov r15, qword ptr [rbp + 0x788]
140204369 4c89f9 mov rcx, r15
14020436c e84fdedfff call 0x1400021c0
140204371 4c89fa mov rdx, r15
140204374 4885c0 test rax, rax
140204377 74b7 je 0x140204330
140204379 4989c7 mov r15, rax
14020437c 4889c1 mov rcx, rax
14020437f 4889fa mov rdx, rdi
140204382 4c8b8588070000 mov r8, qword ptr [rbp + 0x788]
140204389 e8595d9f05 call 0x145bfa0e7
14020438e 488b8588070000 mov rax, qword ptr [rbp + 0x788]
140204395 eb02 jmp 0x140204399
140204397 31c0 xor eax, eax
140204399 48898560040000 mov qword ptr [rbp + 0x460], rax
1402043a0 4c89bd68040000 mov qword ptr [rbp + 0x468], r15
1402043a7 48898570040000 mov qword ptr [rbp + 0x470], rax
1402043ae 4c8b06 mov r8, qword ptr [rsi]
1402043b1 488d0dff79be05 lea rcx, [rip + 0x5be79ff]
1402043b8 ba04000000 mov edx, 4
1402043bd e81e698e02 call 0x142aeace0
1402043c2 90 nop
1402043c3 4885c0 test rax, rax
1402043c6 7507 jne 0x1402043cf
1402043c8 488b05c1bee507 mov rax, qword ptr [rip + 0x7e5bec1]
1402043cf 41bf01000000 mov r15d, 1
1402043d5 803803 cmp byte ptr [rax], 3
1402043d8 756c jne 0x140204446
1402043da 488b5018 mov rdx, qword ptr [rax + 0x18]
1402043de 4885d2 test rdx, rdx
1402043e1 7911 jns 0x1402043f4
1402043e3 4531ed xor r13d, r13d
1402043e6 4c89e9 mov rcx, r13
1402043e9 e8cd4eb905 call 0x145d992bb
1402043ee 90 nop
1402043ef e954180000 jmp 0x140205c48
1402043f4 48899588070000 mov qword ptr [rbp + 0x788], rdx
1402043fb 7449 je 0x140204446
1402043fd 488b7810 mov rdi, qword ptr [rax + 0x10]
140204401 e8fadddfff call 0x140002200
140204406 41bd01000000 mov r13d, 1
14020440c ba01000000 mov edx, 1
140204411 4c8bbd88070000 mov r15, qword ptr [rbp + 0x788]
140204418 4c89f9 mov rcx, r15
14020441b e8a0dddfff call 0x1400021c0
140204420 4c89fa mov rdx, r15
140204423 4885c0 test rax, rax
140204426 74be je 0x1402043e6
140204428 4989c7 mov r15, rax
14020442b 4889c1 mov rcx, rax
14020442e 4889fa mov rdx, rdi
140204431 4c8b8588070000 mov r8, qword ptr [rbp + 0x788]
140204438 e8aa5c9f05 call 0x145bfa0e7
14020443d 488b8588070000 mov rax, qword ptr [rbp + 0x788]
140204444 eb02 jmp 0x140204448
140204446 31c0 xor eax, eax
140204448 48898510070000 mov qword ptr [rbp + 0x710], rax
14020444f 4c89bd18070000 mov qword ptr [rbp + 0x718], r15
140204456 48898520070000 mov qword ptr [rbp + 0x720], rax
14020445d 4c8b06 mov r8, qword ptr [rsi]
140204460 488d0d5479be05 lea rcx, [rip + 0x5be7954]
140204467 ba05000000 mov edx, 5
14020446c e86f688e02 call 0x142aeace0
140204471 90 nop
140204472 4885c0 test rax, rax
140204475 7507 jne 0x14020447e
140204477 488b0512bee507 mov rax, qword ptr [rip + 0x7e5be12]
14020447e 41bf01000000 mov r15d, 1
140204484 803803 cmp byte ptr [rax], 3
140204487 756c jne 0x1402044f5
140204489 488b5018 mov rdx, qword ptr [rax + 0x18]
14020448d 4885d2 test rdx, rdx
140204490 7911 jns 0x1402044a3
140204492 4531ed xor r13d, r13d
140204495 4c89e9 mov rcx, r13
140204498 e81e4eb905 call 0x145d992bb
14020449d 90 nop
14020449e e9a5170000 jmp 0x140205c48
1402044a3 48899588070000 mov qword ptr [rbp + 0x788], rdx
1402044aa 7449 je 0x1402044f5
1402044ac 488b7810 mov rdi, qword ptr [rax + 0x10]
1402044b0 e84bdddfff call 0x140002200
1402044b5 41bd01000000 mov r13d, 1
1402044bb ba01000000 mov edx, 1
1402044c0 4c8bbd88070000 mov r15, qword ptr [rbp + 0x788]
1402044c7 4c89f9 mov rcx, r15
1402044ca e8f1dcdfff call 0x1400021c0
1402044cf 4c89fa mov rdx, r15
1402044d2 4885c0 test rax, rax
1402044d5 74be je 0x140204495
1402044d7 4989c7 mov r15, rax
1402044da 4889c1 mov rcx, rax
1402044dd 4889fa mov rdx, rdi
1402044e0 4c8b8588070000 mov r8, qword ptr [rbp + 0x788]
1402044e7 e8fb5b9f05 call 0x145bfa0e7
1402044ec 488b8588070000 mov rax, qword ptr [rbp + 0x788]
1402044f3 eb02 jmp 0x1402044f7
1402044f5 31c0 xor eax, eax
1402044f7 48898590040000 mov qword ptr [rbp + 0x490], rax
1402044fe 4c89bd98040000 mov qword ptr [rbp + 0x498], r15
140204505 488985a0040000 mov qword ptr [rbp + 0x4a0], rax
14020450c 4c8b06 mov r8, qword ptr [rsi]
14020450f 488d0daa78be05 lea rcx, [rip + 0x5be78aa]
140204516 ba02000000 mov edx, 2
14020451b e8c0678e02 call 0x142aeace0
140204520 90 nop
140204521 4885c0 test rax, rax
140204524 7507 jne 0x14020452d
140204526 488b0563bde507 mov rax, qword ptr [rip + 0x7e5bd63]
14020452d 41bf01000000 mov r15d, 1
140204533 803803 cmp byte ptr [rax], 3
140204536 756c jne 0x1402045a4
140204538 488b5018 mov rdx, qword ptr [rax + 0x18]
14020453c 4885d2 test rdx, rdx
14020453f 7911 jns 0x140204552
140204541 4531ed xor r13d, r13d
140204544 4c89e9 mov rcx, r13
140204547 e86f4db905 call 0x145d992bb
14020454c 90 nop
14020454d e9f6160000 jmp 0x140205c48
140204552 48899588070000 mov qword ptr [rbp + 0x788], rdx
140204559 7449 je 0x1402045a4
14020455b 488b7810 mov rdi, qword ptr [rax + 0x10]
14020455f e89cdcdfff call 0x140002200
140204564 41bd01000000 mov r13d, 1
14020456a ba01000000 mov edx, 1
14020456f 4c8bbd88070000 mov r15, qword ptr [rbp + 0x788]
140204576 4c89f9 mov rcx, r15
140204579 e842dcdfff call 0x1400021c0
14020457e 4c89fa mov rdx, r15
140204581 4885c0 test rax, rax
140204584 74be je 0x140204544
140204586 4989c7 mov r15, rax
140204589 4889c1 mov rcx, rax
14020458c 4889fa mov rdx, rdi
14020458f 4c8b8588070000 mov r8, qword ptr [rbp + 0x788]
140204596 e84c5b9f05 call 0x145bfa0e7
14020459b 488b8588070000 mov rax, qword ptr [rbp + 0x788]
1402045a2 eb02 jmp 0x1402045a6
1402045a4 31c0 xor eax, eax
1402045a6 488985a0010000 mov qword ptr [rbp + 0x1a0], rax
1402045ad 4c89bda8010000 mov qword ptr [rbp + 0x1a8], r15
1402045b4 488985b0010000 mov qword ptr [rbp + 0x1b0], rax
1402045bb 488d8560040000 lea rax, [rbp + 0x460]
1402045c2 48898500050000 mov qword ptr [rbp + 0x500], rax
1402045c9 488d0510dbdfff lea rax, [rip - 0x2024f0]
1402045d0 48898508050000 mov qword ptr [rbp + 0x508], rax
1402045d7 4c8dad10070000 lea r13, [rbp + 0x710]
1402045de 4c89ad10050000 mov qword ptr [rbp + 0x510], r13
1402045e5 48898518050000 mov qword ptr [rbp + 0x518], rax
1402045ec 488d8d90040000 lea rcx, [rbp + 0x490]
1402045f3 48898d20050000 mov qword ptr [rbp + 0x520], rcx
1402045fa 48898528050000 mov qword ptr [rbp + 0x528], rax
140204601 4c89b530050000 mov qword ptr [rbp + 0x530], r14
140204608 48898538050000 mov qword ptr [rbp + 0x538], rax
14020460f 488d15ac77be05 lea rdx, [rip + 0x5be77ac]
140204616 488d8d98000000 lea rcx, [rbp + 0x98]
14020461d 4c8d8500050000 lea r8, [rbp + 0x500]
140204624 e807889c05 call 0x145bcce30
140204629 90 nop
14020462a 488b95a0010000 mov rdx, qword ptr [rbp + 0x1a0]
140204631 4885d2 test rdx, rdx
140204634 4c8bbd68070000 mov r15, qword ptr [rbp + 0x768]
14020463b 7412 je 0x14020464f
14020463d 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
140204644 41b801000000 mov r8d, 1
14020464a e881dbdfff call 0x1400021d0
14020464f 488b9590040000 mov rdx, qword ptr [rbp + 0x490]
140204656 4885d2 test rdx, rdx
140204659 7412 je 0x14020466d
14020465b 488b8d98040000 mov rcx, qword ptr [rbp + 0x498]
140204662 41b801000000 mov r8d, 1
140204668 e863dbdfff call 0x1400021d0
14020466d 488b9510070000 mov rdx, qword ptr [rbp + 0x710]
140204674 4885d2 test rdx, rdx
140204677 7412 je 0x14020468b
140204679 488b8d18070000 mov rcx, qword ptr [rbp + 0x718]
140204680 41b801000000 mov r8d, 1
140204686 e845dbdfff call 0x1400021d0
14020468b 488b9560040000 mov rdx, qword ptr [rbp + 0x460]
140204692 4885d2 test rdx, rdx
140204695 7412 je 0x1402046a9
140204697 488b8d68040000 mov rcx, qword ptr [rbp + 0x468]
14020469e 41b801000000 mov r8d, 1
1402046a4 e827dbdfff call 0x1400021d0
1402046a9 41803c2401 cmp byte ptr [r12], 1
1402046ae 7525 jne 0x1402046d5
1402046b0 418b442401 mov eax, dword ptr [r12 + 1]
1402046b5 418b4c2404 mov ecx, dword ptr [r12 + 4]
1402046ba 898da3010000 mov dword ptr [rbp + 0x1a3], ecx
1402046c0 8985a0010000 mov dword ptr [rbp + 0x1a0], eax
1402046c6 498b442408 mov rax, qword ptr [r12 + 8]
1402046cb 410fb6542410 movzx edx, byte ptr [r12 + 0x10]
1402046d1 b101 mov cl, 1
1402046d3 eb11 jmp 0x1402046e6
1402046d5 498b442408 mov rax, qword ptr [r12 + 8]
1402046da f048ff00 lock inc qword ptr [rax]
1402046de 0f8e64150000 jle 0x140205c48
1402046e4 31c9 xor ecx, ecx
1402046e6 4c8b85a8000000 mov r8, qword ptr [rbp + 0xa8]
1402046ed 4c898518050000 mov qword ptr [rbp + 0x518], r8
1402046f4 0f108598000000 movups xmm0, xmmword ptr [rbp + 0x98]
1402046fb 0f118508050000 movups xmmword ptr [rbp + 0x508], xmm0
140204702 448b85a0010000 mov r8d, dword ptr [rbp + 0x1a0]
140204709 448b8da3010000 mov r9d, dword ptr [rbp + 0x1a3]
140204710 44898539050000 mov dword ptr [rbp + 0x539], r8d
140204717 44898d3c050000 mov dword ptr [rbp + 0x53c], r9d
14020471e 0f1005af76be05 movups xmm0, xmmword ptr [rip + 0x5be76af]
140204725 0f118591040000 movups xmmword ptr [rbp + 0x491], xmm0
14020472c c785a10400000000803f mov dword ptr [rbp + 0x4a1], 0x3f800000
140204736 4c8b85f0030000 mov r8, qword ptr [rbp + 0x3f0]
14020473d 48c7852005000000000000 mov qword ptr [rbp + 0x520], 0
140204748 48c7852805000004000000 mov qword ptr [rbp + 0x528], 4
140204753 48c7853005000000000000 mov qword ptr [rbp + 0x530], 0
14020475e 888d38050000 mov byte ptr [rbp + 0x538], cl
140204764 48898540050000 mov qword ptr [rbp + 0x540], rax
14020476b 48899548050000 mov qword ptr [rbp + 0x548], rdx
140204772 c7855005000000007041 mov dword ptr [rbp + 0x550], 0x41700000
14020477c 66c785540500009001 mov word ptr [rbp + 0x554], 0x190
140204785 c6855605000001 mov byte ptr [rbp + 0x556], 1
14020478c 488b859d040000 mov rax, qword ptr [rbp + 0x49d]
140204793 48898564050000 mov qword ptr [rbp + 0x564], rax
14020479a 0f108590040000 movups xmm0, xmmword ptr [rbp + 0x490]
1402047a1 0f118557050000 movups xmmword ptr [rbp + 0x557], xmm0
1402047a8 8b05f212bd05 mov eax, dword ptr [rip + 0x5bd12f2]
1402047ae 89857c050000 mov dword ptr [rbp + 0x57c], eax
1402047b4 440f11bd6c050000 movups xmmword ptr [rbp + 0x56c], xmm15
1402047bc f2440f11ad80050000 movsd qword ptr [rbp + 0x580], xmm13
1402047c5 4c898500050000 mov qword ptr [rbp + 0x500], r8
1402047cc c6859707000001 mov byte ptr [rbp + 0x797], 1
1402047d3 488d8da0010000 lea rcx, [rbp + 0x1a0]
1402047da 4c8d8500050000 lea r8, [rbp + 0x500]
1402047e1 488d95f8030000 lea rdx, [rbp + 0x3f8]
1402047e8 e803e4feff call 0x1401f2bf0
1402047ed 90 nop
1402047ee 4c8b06 mov r8, qword ptr [rsi]
1402047f1 c6859707000001 mov byte ptr [rbp + 0x797], 1
1402047f8 488d0de975be05 lea rcx, [rip + 0x5be75e9]
1402047ff ba08000000 mov edx, 8
140204804 e8d7648e02 call 0x142aeace0
140204809 90 nop
14020480a 4885c0 test rax, rax
14020480d 7507 jne 0x140204816
14020480f 488b057abae507 mov rax, qword ptr [rip + 0x7e5ba7a]
140204816 803803 cmp byte ptr [rax], 3
140204819 0f857d020000 jne 0x140204a9c
14020481f 4883781800 cmp qword ptr [rax + 0x18], 0
140204824 7914 jns 0x14020483a
140204826 c6859707000001 mov byte ptr [rbp + 0x797], 1
14020482d 31c9 xor ecx, ecx
14020482f e8874ab905 call 0x145d992bb
140204834 90 nop
140204835 e90e140000 jmp 0x140205c48
14020483a 0f845c020000 je 0x140204a9c
140204840 e8bbd9dfff call 0x140002200
140204845 498b3f mov rdi, qword ptr [r15]
140204848 4c8b06 mov r8, qword ptr [rsi]
14020484b c6859707000001 mov byte ptr [rbp + 0x797], 1
140204852 488d0d8f75be05 lea rcx, [rip + 0x5be758f]
140204859 ba08000000 mov edx, 8
14020485e e87d648e02 call 0x142aeace0
140204863 90 nop
140204864 4885c0 test rax, rax
140204867 7507 jne 0x140204870
140204869 488b0520bae507 mov rax, qword ptr [rip + 0x7e5ba20]
140204870 41bf01000000 mov r15d, 1
140204876 803803 cmp byte ptr [rax], 3
140204879 7558 jne 0x1402048d3
14020487b 4c8b7018 mov r14, qword ptr [rax + 0x18]
14020487f 4d85f6 test r14, r14
140204882 791a jns 0x14020489e
140204884 31f6 xor esi, esi
140204886 c6859707000001 mov byte ptr [rbp + 0x797], 1
14020488d 4889f1 mov rcx, rsi
140204890 4c89f2 mov rdx, r14
140204893 e8234ab905 call 0x145d992bb
140204898 90 nop
140204899 e9aa130000 jmp 0x140205c48
14020489e 7433 je 0x1402048d3
1402048a0 4c8b6010 mov r12, qword ptr [rax + 0x10]
1402048a4 e857d9dfff call 0x140002200
1402048a9 be01000000 mov esi, 1
1402048ae ba01000000 mov edx, 1
1402048b3 4c89f1 mov rcx, r14
1402048b6 e805d9dfff call 0x1400021c0
1402048bb 4885c0 test rax, rax
1402048be 74c6 je 0x140204886
1402048c0 4989c7 mov r15, rax
1402048c3 4889c1 mov rcx, rax
1402048c6 4c89e2 mov rdx, r12
1402048c9 4d89f0 mov r8, r14
1402048cc e816589f05 call 0x145bfa0e7
1402048d1 eb03 jmp 0x1402048d6
1402048d3 4531f6 xor r14d, r14d
1402048d6 4c89b510070000 mov qword ptr [rbp + 0x710], r14
1402048dd 4c89bd18070000 mov qword ptr [rbp + 0x718], r15
1402048e4 4c89b520070000 mov qword ptr [rbp + 0x720], r14
1402048eb 488d051e75be05 lea rax, [rip + 0x5be751e]
1402048f2 48898590040000 mov qword ptr [rbp + 0x490], rax
1402048f9 48c7859804000004000000 mov qword ptr [rbp + 0x498], 4
140204904 4c89ada0040000 mov qword ptr [rbp + 0x4a0], r13
14020490b 488d05de74be05 lea rax, [rip + 0x5be74de]
140204912 488985a8040000 mov qword ptr [rbp + 0x4a8], rax
140204919 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140204922 488d15eb74be05 lea rdx, [rip + 0x5be74eb]
140204929 488d8da0010000 lea rcx, [rbp + 0x1a0]
140204930 4c8d8d90040000 lea r9, [rbp + 0x490]
140204937 41b811000000 mov r8d, 0x11
14020493d e86e7b6e05 call 0x1458ec4b0
140204942 90 nop
140204943 803f01 cmp byte ptr [rdi], 1
140204946 751e jne 0x140204966
140204948 8b4701 mov eax, dword ptr [rdi + 1]
14020494b 8b4f04 mov ecx, dword ptr [rdi + 4]
14020494e 898d43040000 mov dword ptr [rbp + 0x443], ecx
140204954 898540040000 mov dword ptr [rbp + 0x440], eax
14020495a 488b4708 mov rax, qword ptr [rdi + 8]
14020495e 0fb65710 movzx edx, byte ptr [rdi + 0x10]
140204962 b101 mov cl, 1
140204964 eb10 jmp 0x140204976
140204966 488b4708 mov rax, qword ptr [rdi + 8]
14020496a f048ff00 lock inc qword ptr [rax]
14020496e 0f8ed4120000 jle 0x140205c48
140204974 31c9 xor ecx, ecx
140204976 4c8b85b0010000 mov r8, qword ptr [rbp + 0x1b0]
14020497d 4c898518050000 mov qword ptr [rbp + 0x518], r8
140204984 0f1085a0010000 movups xmm0, xmmword ptr [rbp + 0x1a0]
14020498b 0f118508050000 movups xmmword ptr [rbp + 0x508], xmm0
140204992 448b8540040000 mov r8d, dword ptr [rbp + 0x440]
140204999 448b8d43040000 mov r9d, dword ptr [rbp + 0x443]
1402049a0 44898539050000 mov dword ptr [rbp + 0x539], r8d
1402049a7 44898d3c050000 mov dword ptr [rbp + 0x53c], r9d
1402049ae 0f10050b71be05 movups xmm0, xmmword ptr [rip + 0x5be710b]
1402049b5 0f118561040000 movups xmmword ptr [rbp + 0x461], xmm0
1402049bc c785710400000000803f mov dword ptr [rbp + 0x471], 0x3f800000
1402049c6 4c8b85f0030000 mov r8, qword ptr [rbp + 0x3f0]
1402049cd 48c7852005000000000000 mov qword ptr [rbp + 0x520], 0
1402049d8 48c7852805000004000000 mov qword ptr [rbp + 0x528], 4
1402049e3 48c7853005000000000000 mov qword ptr [rbp + 0x530], 0
1402049ee 888d38050000 mov byte ptr [rbp + 0x538], cl
1402049f4 48898540050000 mov qword ptr [rbp + 0x540], rax
1402049fb 48899548050000 mov qword ptr [rbp + 0x548], rdx
140204a02 c7855005000000008041 mov dword ptr [rbp + 0x550], 0x41800000
140204a0c 66c785540500009001 mov word ptr [rbp + 0x554], 0x190
140204a15 c6855605000001 mov byte ptr [rbp + 0x556], 1
140204a1c 488b856d040000 mov rax, qword ptr [rbp + 0x46d]
140204a23 48898564050000 mov qword ptr [rbp + 0x564], rax
140204a2a 0f108560040000 movups xmm0, xmmword ptr [rbp + 0x460]
140204a31 0f118557050000 movups xmmword ptr [rbp + 0x557], xmm0
140204a38 8b056210bd05 mov eax, dword ptr [rip + 0x5bd1062]
140204a3e 89857c050000 mov dword ptr [rbp + 0x57c], eax
140204a44 440f11bd6c050000 movups xmmword ptr [rbp + 0x56c], xmm15
140204a4c f2440f11ad80050000 movsd qword ptr [rbp + 0x580], xmm13
140204a55 4c898500050000 mov qword ptr [rbp + 0x500], r8
140204a5c 488d8da0010000 lea rcx, [rbp + 0x1a0]
140204a63 4c8d8500050000 lea r8, [rbp + 0x500]
140204a6a 488d95f8030000 lea rdx, [rbp + 0x3f8]
140204a71 e87ae1feff call 0x1401f2bf0
140204a76 90 nop
140204a77 488b9510070000 mov rdx, qword ptr [rbp + 0x710]
140204a7e 4885d2 test rdx, rdx
140204a81 7412 je 0x140204a95
140204a83 488b8d18070000 mov rcx, qword ptr [rbp + 0x718]
140204a8a 41b801000000 mov r8d, 1
140204a90 e83bd7dfff call 0x1400021d0
140204a95 4c8bbd68070000 mov r15, qword ptr [rbp + 0x768]
140204a9c c6859707000001 mov byte ptr [rbp + 0x797], 1
140204aa3 488d0d7b73be05 lea rcx, [rip + 0x5be737b]
140204aaa ba06000000 mov edx, 6
140204aaf 4989d8 mov r8, rbx
140204ab2 e829628e02 call 0x142aeace0
140204ab7 90 nop
140204ab8 4885c0 test rax, rax
140204abb 7507 jne 0x140204ac4
140204abd 488b05ccb7e507 mov rax, qword ptr [rip + 0x7e5b7cc]
140204ac4 803805 cmp byte ptr [rax], 5
140204ac7 7554 jne 0x140204b1d
140204ac9 4d8b37 mov r14, qword ptr [r15]
140204acc c6859707000001 mov byte ptr [rbp + 0x797], 1
140204ad3 488d0d4b73be05 lea rcx, [rip + 0x5be734b]
140204ada ba06000000 mov edx, 6
140204adf 4989d8 mov r8, rbx
140204ae2 e8f9618e02 call 0x142aeace0
140204ae7 90 nop
140204ae8 4885c0 test rax, rax
140204aeb 7507 jne 0x140204af4
140204aed 488b059cb7e507 mov rax, qword ptr [rip + 0x7e5b79c]
140204af4 488b8d70070000 mov rcx, qword ptr [rbp + 0x770]
140204afb 488b09 mov rcx, qword ptr [rcx]
140204afe f30f10595c movss xmm3, dword ptr [rcx + 0x5c]
140204b03 c6859707000001 mov byte ptr [rbp + 0x797], 1
140204b0a 488d8df0030000 lea rcx, [rbp + 0x3f0]
140204b11 4c89f2 mov rdx, r14
140204b14 4989c0 mov r8, rax
140204b17 e854f5ebff call 0x1400c4070
140204b1c 90 nop
140204b1d 488b8580070000 mov rax, qword ptr [rbp + 0x780]
140204b24 488b08 mov rcx, qword ptr [rax]
140204b27 488b4128 mov rax, qword ptr [rcx + 0x28]
140204b2b 4885c0 test rax, rax
140204b2e 742a je 0x140204b5a
140204b30 498b17 mov rdx, qword ptr [r15]
140204b33 4c8b8578070000 mov r8, qword ptr [rbp + 0x778]
140204b3a 4d8b00 mov r8, qword ptr [r8]
140204b3d 4c8b4920 mov r9, qword ptr [rcx + 0x20]
140204b41 c6859707000001 mov byte ptr [rbp + 0x797], 1
140204b48 4889442420 mov qword ptr [rsp + 0x20], rax
140204b4d 488d8df0030000 lea rcx, [rbp + 0x3f0]
140204b54 e8070c0800 call 0x140285760
140204b59 90 nop
140204b5a e8a1d6dfff call 0x140002200
140204b5f b940000000 mov ecx, 0x40
140204b64 ba08000000 mov edx, 8
140204b69 e852d6dfff call 0x1400021c0
140204b6e 48898580070000 mov qword ptr [rbp + 0x780], rax
140204b75 4885c0 test rax, rax
140204b78 0f849a100000 je 0x140205c18
140204b7e c785a003000004000000 mov dword ptr [rbp + 0x3a0], 4
140204b88 c785a803000006000000 mov dword ptr [rbp + 0x3a8], 6
140204b92 488d8da0010000 lea rcx, [rbp + 0x1a0]
140204b99 488d95a0030000 lea rdx, [rbp + 0x3a0]
140204ba0 e84b9f4702 call 0x14267eaf0
140204ba5 90 nop
140204ba6 488d8d00050000 lea rcx, [rbp + 0x500]
140204bad 488d95a0030000 lea rdx, [rbp + 0x3a0]
140204bb4 e8379f4702 call 0x14267eaf0
140204bb9 90 nop
140204bba 0f1085a0010000 movups xmm0, xmmword ptr [rbp + 0x1a0]
140204bc1 0f108db0010000 movups xmm1, xmmword ptr [rbp + 0x1b0]
140204bc8 488b8d80070000 mov rcx, qword ptr [rbp + 0x780]
140204bcf 0f114910 movups xmmword ptr [rcx + 0x10], xmm1
140204bd3 0f1101 movups xmmword ptr [rcx], xmm0
140204bd6 0f108500050000 movups xmm0, xmmword ptr [rbp + 0x500]
140204bdd 0f108d10050000 movups xmm1, xmmword ptr [rbp + 0x510]
140204be4 0f114930 movups xmmword ptr [rcx + 0x30], xmm1
140204be8 0f114120 movups xmmword ptr [rcx + 0x20], xmm0
140204bec 0f57c0 xorps xmm0, xmm0
140204bef 0f1185a8050000 movups xmmword ptr [rbp + 0x5a8], xmm0
140204bf6 0f118598050000 movups xmmword ptr [rbp + 0x598], xmm0
140204bfd 0f118588050000 movups xmmword ptr [rbp + 0x588], xmm0
140204c04 0f118578050000 movups xmmword ptr [rbp + 0x578], xmm0
140204c0b 0f118568050000 movups xmmword ptr [rbp + 0x568], xmm0
140204c12 48c785b805000000000000 mov qword ptr [rbp + 0x5b8], 0
140204c1d c7858006000000000000 mov dword ptr [rbp + 0x680], 0
140204c27 66c785840600000000 mov word ptr [rbp + 0x684], 0
140204c30 488b85f0030000 mov rax, qword ptr [rbp + 0x3f0]
140204c37 0f11b508050000 movups xmmword ptr [rbp + 0x508], xmm6
140204c3e 48c7851805000000000000 mov qword ptr [rbp + 0x518], 0
140204c49 48c7852005000002000000 mov qword ptr [rbp + 0x520], 2
140204c54 48898d28050000 mov qword ptr [rbp + 0x528], rcx
140204c5b 48c7853005000002000000 mov qword ptr [rbp + 0x530], 2
140204c66 440f118538050000 movups xmmword ptr [rbp + 0x538], xmm8
140204c6e 48c7854805000000000000 mov qword ptr [rbp + 0x548], 0
140204c79 440f118d50050000 movups xmmword ptr [rbp + 0x550], xmm9
140204c81 48c7856005000000000000 mov qword ptr [rbp + 0x560], 0
140204c8c 0f2805cd87b905 movaps xmm0, xmmword ptr [rip + 0x5b987cd]
140204c93 0f1185c0050000 movups xmmword ptr [rbp + 0x5c0], xmm0
140204c9a 0f2805bf86b905 movaps xmm0, xmmword ptr [rip + 0x5b986bf]
140204ca1 0f1185d0050000 movups xmmword ptr [rbp + 0x5d0], xmm0
140204ca8 0f1005396dbe05 movups xmm0, xmmword ptr [rip + 0x5be6d39]
140204caf 0f1185f0050000 movups xmmword ptr [rbp + 0x5f0], xmm0
140204cb6 0f10051b6dbe05 movups xmm0, xmmword ptr [rip + 0x5be6d1b]
140204cbd 0f1185e0050000 movups xmmword ptr [rbp + 0x5e0], xmm0
140204cc4 0f10053d6dbe05 movups xmm0, xmmword ptr [rip + 0x5be6d3d]
140204ccb 0f118510060000 movups xmmword ptr [rbp + 0x610], xmm0
140204cd2 0f10051f6dbe05 movups xmm0, xmmword ptr [rip + 0x5be6d1f]
140204cd9 0f118500060000 movups xmmword ptr [rbp + 0x600], xmm0
140204ce0 440f11b530060000 movups xmmword ptr [rbp + 0x630], xmm14
140204ce8 440f11a520060000 movups xmmword ptr [rbp + 0x620], xmm12
140204cf0 0f28053982bc05 movaps xmm0, xmmword ptr [rip + 0x5bc8239]
140204cf7 0f118540060000 movups xmmword ptr [rbp + 0x640], xmm0
140204cfe c7855006000001000000 mov dword ptr [rbp + 0x650], 1
140204d08 f30f10053460be05 movss xmm0, dword ptr [rip + 0x5be6034]
140204d10 0f138554060000 movlps qword ptr [rbp + 0x654], xmm0
140204d17 c6855c06000001 mov byte ptr [rbp + 0x65c], 1
140204d1e 48c7856006000000000000 mov qword ptr [rbp + 0x660], 0
140204d29 c785680600000000803f mov dword ptr [rbp + 0x668], 0x3f800000
140204d33 66c7856c0600000000 mov word ptr [rbp + 0x66c], 0
140204d3c 66c785720600000000 mov word ptr [rbp + 0x672], 0
140204d45 c7856e06000000000100 mov dword ptr [rbp + 0x66e], 0x10000
140204d4f 66c785780600000000 mov word ptr [rbp + 0x678], 0
140204d58 c7857406000000000100 mov dword ptr [rbp + 0x674], 0x10000
140204d62 c7857a06000000000001 mov dword ptr [rbp + 0x67a], 0x1000000
140204d6c 66c7857e0600000000 mov word ptr [rbp + 0x67e], 0
140204d75 48898500050000 mov qword ptr [rbp + 0x500], rax
140204d7c c6859407000001 mov byte ptr [rbp + 0x794], 1
140204d83 488d8d10070000 lea rcx, [rbp + 0x710]
140204d8a 4c8d8500050000 lea r8, [rbp + 0x500]
140204d91 488d95f8030000 lea rdx, [rbp + 0x3f8]
140204d98 e87397fdff call 0x1401de510
140204d9d 90 nop
140204d9e 4c8b8540010000 mov r8, qword ptr [rbp + 0x140]
140204da5 488b9548010000 mov rdx, qword ptr [rbp + 0x148]
140204dac 488b8550010000 mov rax, qword ptr [rbp + 0x150]
140204db3 488bbd10070000 mov rdi, qword ptr [rbp + 0x710]
140204dba 488b8d38070000 mov rcx, qword ptr [rbp + 0x738]
140204dc1 4889bd90040000 mov qword ptr [rbp + 0x490], rdi
140204dc8 0f108518070000 movups xmm0, xmmword ptr [rbp + 0x718]
140204dcf 0f118598040000 movups xmmword ptr [rbp + 0x498], xmm0
140204dd6 0f108528070000 movups xmm0, xmmword ptr [rbp + 0x728]
140204ddd 0f1185a8040000 movups xmmword ptr [rbp + 0x4a8], xmm0
140204de4 48898db8040000 mov qword ptr [rbp + 0x4b8], rcx
140204deb 48c1e003 shl rax, 3
140204def 488d0c80 lea rcx, [rax + rax*4]
140204df3 4801d1 add rcx, rdx
140204df6 48899560040000 mov qword ptr [rbp + 0x460], rdx
140204dfd 4c8985e0030000 mov qword ptr [rbp + 0x3e0], r8
140204e04 4c898570040000 mov qword ptr [rbp + 0x470], r8
140204e0b 48898d78040000 mov qword ptr [rbp + 0x478], rcx
140204e12 4c8da500020000 lea r12, [rbp + 0x200]
140204e19 488d4480d8 lea rax, [rax + rax*4 - 0x28]
140204e1e 488d5a40 lea rbx, [rdx + 0x40]
140204e22 49b90000000000000002 movabs r9, 0x200000000000000
140204e2c 488db500050000 lea rsi, [rbp + 0x500]
140204e33 488995e8030000 mov qword ptr [rbp + 0x3e8], rdx
140204e3a 4989d0 mov r8, rdx
140204e3d 4939c8 cmp r8, rcx
140204e40 0f8419050000 je 0x14020535f
140204e46 4d8d5028 lea r10, [r8 + 0x28]
140204e4a 4c899568040000 mov qword ptr [rbp + 0x468], r10
140204e51 498b5010 mov rdx, qword ptr [r8 + 0x10]
140204e55 4883faff cmp rdx, -1
140204e59 0f84c3040000 je 0x140205322
140204e5f 48899580070000 mov qword ptr [rbp + 0x780], rdx
140204e66 4d8b38 mov r15, qword ptr [r8]
140204e69 4d8b7008 mov r14, qword ptr [r8 + 8]
140204e6d 498b5018 mov rdx, qword ptr [r8 + 0x18]
140204e71 48899578070000 mov qword ptr [rbp + 0x778], rdx
140204e78 498b5020 mov rdx, qword ptr [r8 + 0x20]
140204e7c 66c785040300000000 mov word ptr [rbp + 0x304], 0
140204e85 c685f402000001 mov byte ptr [rbp + 0x2f4], 1
140204e8c 0f57c0 xorps xmm0, xmm0
140204e8f 410f11442440 movups xmmword ptr [r12 + 0x40], xmm0
140204e95 410f11442430 movups xmmword ptr [r12 + 0x30], xmm0
140204e9b 410f11442420 movups xmmword ptr [r12 + 0x20], xmm0
140204ea1 410f11442410 movups xmmword ptr [r12 + 0x10], xmm0
140204ea7 410f110424 movups xmmword ptr [r12], xmm0
140204eac 49c744245000000000 mov qword ptr [r12 + 0x50], 0
140204eb5 c7851a03000000000000 mov dword ptr [rbp + 0x31a], 0
140204ebf 450f115c2468 movups xmmword ptr [r12 + 0x68], xmm11
140204ec5 450f11542458 movups xmmword ptr [r12 + 0x58], xmm10
140204ecb 0f1005166bbe05 movups xmm0, xmmword ptr [rip + 0x5be6b16]
140204ed2 410f11842488000000 movups xmmword ptr [r12 + 0x88], xmm0
140204edb 0f1005f66abe05 movups xmm0, xmmword ptr [rip + 0x5be6af6]
140204ee2 410f11442478 movups xmmword ptr [r12 + 0x78], xmm0
140204ee8 0f1005196bbe05 movups xmm0, xmmword ptr [rip + 0x5be6b19]
140204eef 410f118424a8000000 movups xmmword ptr [r12 + 0xa8], xmm0
140204ef8 0f1005f96abe05 movups xmm0, xmmword ptr [rip + 0x5be6af9]
140204eff 410f11842498000000 movups xmmword ptr [r12 + 0x98], xmm0
140204f08 450f11b424c8000000 movups xmmword ptr [r12 + 0xc8], xmm14
140204f11 450f11a424b8000000 movups xmmword ptr [r12 + 0xb8], xmm12
140204f1a 48c785f802000000000000 mov qword ptr [rbp + 0x2f8], 0
140204f25 c785000300000000803f mov dword ptr [rbp + 0x300], 0x3f800000
140204f2f 0f28053a83b905 movaps xmm0, xmmword ptr [rip + 0x5b9833a]
140204f36 0f1185d8020000 movups xmmword ptr [rbp + 0x2d8], xmm0
140204f3d c785e802000001000000 mov dword ptr [rbp + 0x2e8], 1
140204f47 48c785ec02000000000000 mov qword ptr [rbp + 0x2ec], 0
140204f52 4c898d12030000 mov qword ptr [rbp + 0x312], r9
140204f59 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
140204f60 48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
140204f6b 410f117c24b8 movups xmmword ptr [r12 - 0x48], xmm7
140204f71 49c74424c800000000 mov qword ptr [r12 - 0x38], 0
140204f7a 450f114424d0 movups xmmword ptr [r12 - 0x30], xmm8
140204f80 49c74424e000000000 mov qword ptr [r12 - 0x20], 0
140204f89 450f114c24e8 movups xmmword ptr [r12 - 0x18], xmm9
140204f8f 49c74424f800000000 mov qword ptr [r12 - 8], 0
140204f98 41c784240601000000000100 mov dword ptr [r12 + 0x106], 0x10000
140204fa4 6641c784240a0100000000 mov word ptr [r12 + 0x10a], 0
140204faf 6641c78424100100000000 mov word ptr [r12 + 0x110], 0
140204fba 41c784240c01000000000100 mov dword ptr [r12 + 0x10c], 0x10000
140204fc6 4d85f6 test r14, r14
140204fc9 0f8840030000 js 0x14020530f
140204fcf 48899588070000 mov qword ptr [rbp + 0x788], rdx
140204fd6 4c8995d0030000 mov qword ptr [rbp + 0x3d0], r10
140204fdd 48899dc8030000 mov qword ptr [rbp + 0x3c8], rbx
140204fe4 488985c0030000 mov qword ptr [rbp + 0x3c0], rax
140204feb 48898db8030000 mov qword ptr [rbp + 0x3b8], rcx
140204ff2 4889bd70070000 mov qword ptr [rbp + 0x770], rdi
140204ff9 488b8568070000 mov rax, qword ptr [rbp + 0x768]
140205000 488b38 mov rdi, qword ptr [rax]
140205003 7433 je 0x140205038
140205005 e8f6d1dfff call 0x140002200
14020500a bb01000000 mov ebx, 1
14020500f ba01000000 mov edx, 1
140205014 4c89f1 mov rcx, r14
140205017 e8a4d1dfff call 0x1400021c0
14020501c 4885c0 test rax, rax
14020501f 0f84ec020000 je 0x140205311
140205025 4989c5 mov r13, rax
140205028 4889c1 mov rcx, rax
14020502b 4c89fa mov rdx, r15
14020502e 4d89f0 mov r8, r14
140205031 e8b1509f05 call 0x145bfa0e7
140205036 eb06 jmp 0x14020503e
140205038 41bd01000000 mov r13d, 1
14020503e 803f01 cmp byte ptr [rdi], 1
140205041 7526 jne 0x140205069
140205043 8b4701 mov eax, dword ptr [rdi + 1]
140205046 8b4f04 mov ecx, dword ptr [rdi + 4]
140205049 898d23040000 mov dword ptr [rbp + 0x423], ecx
14020504f 898520040000 mov dword ptr [rbp + 0x420], eax
140205055 488b5f08 mov rbx, qword ptr [rdi + 8]
140205059 0fb64710 movzx eax, byte ptr [rdi + 0x10]
14020505d 488985d8030000 mov qword ptr [rbp + 0x3d8], rax
140205064 40b701 mov dil, 1
140205067 eb10 jmp 0x140205079
140205069 488b5f08 mov rbx, qword ptr [rdi + 8]
14020506d f048ff03 lock inc qword ptr [rbx]
140205071 0f8ed10b0000 jle 0x140205c48
140205077 31ff xor edi, edi
140205079 8b8520040000 mov eax, dword ptr [rbp + 0x420]
14020507f 8b8d23040000 mov ecx, dword ptr [rbp + 0x423]
140205085 4c8dbd08050000 lea r15, [rbp + 0x508]
14020508c 41898fb4010000 mov dword ptr [r15 + 0x1b4], ecx
140205093 418987b1010000 mov dword ptr [r15 + 0x1b1], eax
14020509a 0f10051b68be05 movups xmm0, xmmword ptr [rip + 0x5be681b]
1402050a1 488d8541040000 lea rax, [rbp + 0x441]
1402050a8 0f1100 movups xmmword ptr [rax], xmm0
1402050ab c740100000803f mov dword ptr [rax + 0x10], 0x3f800000
1402050b2 41b880010000 mov r8d, 0x180
1402050b8 4c89f9 mov rcx, r15
1402050bb 488d95a0010000 lea rdx, [rbp + 0x1a0]
1402050c2 e820509f05 call 0x145bfa0e7
1402050c7 488b854d040000 mov rax, qword ptr [rbp + 0x44d]
1402050ce 498987dc010000 mov qword ptr [r15 + 0x1dc], rax
1402050d5 0f108540040000 movups xmm0, xmmword ptr [rbp + 0x440]
1402050dc 410f1187cf010000 movups xmmword ptr [r15 + 0x1cf], xmm0
1402050e4 4c89b588060000 mov qword ptr [rbp + 0x688], r14
1402050eb 4c89ad90060000 mov qword ptr [rbp + 0x690], r13
1402050f2 4d89fd mov r13, r15
1402050f5 4c89b598060000 mov qword ptr [rbp + 0x698], r14
1402050fc 48c785a006000000000000 mov qword ptr [rbp + 0x6a0], 0
140205107 48c785a806000004000000 mov qword ptr [rbp + 0x6a8], 4
140205112 48c785b006000000000000 mov qword ptr [rbp + 0x6b0], 0
14020511d 4088bdb8060000 mov byte ptr [rbp + 0x6b8], dil
140205124 48899dc0060000 mov qword ptr [rbp + 0x6c0], rbx
14020512b 488b85d8030000 mov rax, qword ptr [rbp + 0x3d8]
140205132 488985c8060000 mov qword ptr [rbp + 0x6c8], rax
140205139 c785d006000000007041 mov dword ptr [rbp + 0x6d0], 0x41700000
140205143 66c785d40600009001 mov word ptr [rbp + 0x6d4], 0x190
14020514c c685d606000001 mov byte ptr [rbp + 0x6d6], 1
140205153 8b054709bd05 mov eax, dword ptr [rip + 0x5bd0947]
140205159 418987f4010000 mov dword ptr [r15 + 0x1f4], eax
140205160 450f11bfe4010000 movups xmmword ptr [r15 + 0x1e4], xmm15
140205168 f2440f11ad00070000 movsd qword ptr [rbp + 0x700], xmm13
140205171 488bbd70070000 mov rdi, qword ptr [rbp + 0x770]
140205178 4889bd00050000 mov qword ptr [rbp + 0x500], rdi
14020517f c6859307000001 mov byte ptr [rbp + 0x793], 1
140205186 488d8da0010000 lea rcx, [rbp + 0x1a0]
14020518d 488d9d98040000 lea rbx, [rbp + 0x498]
140205194 4889da mov rdx, rbx
140205197 4989f0 mov r8, rsi
14020519a e871dafdff call 0x1401e2c10
14020519f 90 nop
1402051a0 4c8bbd68070000 mov r15, qword ptr [rbp + 0x768]
1402051a7 498b0f mov rcx, qword ptr [r15]
1402051aa 803901 cmp byte ptr [rcx], 1
1402051ad 751e jne 0x1402051cd
1402051af 8b4101 mov eax, dword ptr [rcx + 1]
1402051b2 8b5104 mov edx, dword ptr [rcx + 4]
1402051b5 8995a3010000 mov dword ptr [rbp + 0x1a3], edx
1402051bb 8985a0010000 mov dword ptr [rbp + 0x1a0], eax
1402051c1 488b4108 mov rax, qword ptr [rcx + 8]
1402051c5 0fb65110 movzx edx, byte ptr [rcx + 0x10]
1402051c9 b101 mov cl, 1
1402051cb eb10 jmp 0x1402051dd
1402051cd 488b4108 mov rax, qword ptr [rcx + 8]
1402051d1 f048ff00 lock inc qword ptr [rax]
1402051d5 0f8e6d0a0000 jle 0x140205c48
1402051db 31c9 xor ecx, ecx
1402051dd 4c8b9580070000 mov r10, qword ptr [rbp + 0x780]
1402051e4 448b85a0010000 mov r8d, dword ptr [rbp + 0x1a0]
1402051eb 448b8da3010000 mov r9d, dword ptr [rbp + 0x1a3]
1402051f2 45894d34 mov dword ptr [r13 + 0x34], r9d
1402051f6 45894531 mov dword ptr [r13 + 0x31], r8d
1402051fa 0f10057766be05 movups xmm0, xmmword ptr [rip + 0x5be6677]
140205201 4c8d8541040000 lea r8, [rbp + 0x441]
140205208 410f1100 movups xmmword ptr [r8], xmm0
14020520c 41c740100000803f mov dword ptr [r8 + 0x10], 0x3f800000
140205214 4c899508050000 mov qword ptr [rbp + 0x508], r10
14020521b 4c8b8578070000 mov r8, qword ptr [rbp + 0x778]
140205222 4c898510050000 mov qword ptr [rbp + 0x510], r8
140205229 4c8b8588070000 mov r8, qword ptr [rbp + 0x788]
140205230 4c898518050000 mov qword ptr [rbp + 0x518], r8
140205237 48c7852005000000000000 mov qword ptr [rbp + 0x520], 0
140205242 48c7852805000004000000 mov qword ptr [rbp + 0x528], 4
14020524d 48c7853005000000000000 mov qword ptr [rbp + 0x530], 0
140205258 888d38050000 mov byte ptr [rbp + 0x538], cl
14020525e 48898540050000 mov qword ptr [rbp + 0x540], rax
140205265 48899548050000 mov qword ptr [rbp + 0x548], rdx
14020526c c7855005000000007041 mov dword ptr [rbp + 0x550], 0x41700000
140205276 66c785540500009001 mov word ptr [rbp + 0x554], 0x190
14020527f c6855605000001 mov byte ptr [rbp + 0x556], 1
140205286 488b854d040000 mov rax, qword ptr [rbp + 0x44d]
14020528d 4989455c mov qword ptr [r13 + 0x5c], rax
140205291 0f108540040000 movups xmm0, xmmword ptr [rbp + 0x440]
140205298 410f11454f movups xmmword ptr [r13 + 0x4f], xmm0
14020529d 8b05fd07bd05 mov eax, dword ptr [rip + 0x5bd07fd]
1402052a3 41894574 mov dword ptr [r13 + 0x74], eax
1402052a7 450f117d64 movups xmmword ptr [r13 + 0x64], xmm15
1402052ac f2440f11ad80050000 movsd qword ptr [rbp + 0x580], xmm13
1402052b5 4889bd00050000 mov qword ptr [rbp + 0x500], rdi
1402052bc c6859307000000 mov byte ptr [rbp + 0x793], 0
1402052c3 488d8da0010000 lea rcx, [rbp + 0x1a0]
1402052ca 4889da mov rdx, rbx
1402052cd 4989f0 mov r8, rsi
1402052d0 e81bd9feff call 0x1401f2bf0
1402052d5 90 nop
1402052d6 488b85c0030000 mov rax, qword ptr [rbp + 0x3c0]
1402052dd 4883c0d8 add rax, -0x28
1402052e1 488b9dc8030000 mov rbx, qword ptr [rbp + 0x3c8]
1402052e8 4883c328 add rbx, 0x28
1402052ec 4c8b85d0030000 mov r8, qword ptr [rbp + 0x3d0]
1402052f3 488b8db8030000 mov rcx, qword ptr [rbp + 0x3b8]
1402052fa 49b90000000000000002 movabs r9, 0x200000000000000
140205304 4939c8 cmp r8, rcx
140205307 0f8539fbffff jne 0x140204e46
14020530d eb50 jmp 0x14020535f
14020530f 31db xor ebx, ebx
140205311 4889d9 mov rcx, rbx
140205314 4c89f2 mov rdx, r14
140205317 e89f3fb905 call 0x145d992bb
14020531c 90 nop
14020531d e926090000 jmp 0x140205c48
140205322 4c39d1 cmp rcx, r10
140205325 7438 je 0x14020535f
140205327 48b9cdcccccccccccccc movabs rcx, 0xcccccccccccccccd
140205331 48f7e1 mul rcx
140205334 4989d6 mov r14, rdx
140205337 49c1ee05 shr r14, 5
14020533b eb09 jmp 0x140205346
14020533d 4883c328 add rbx, 0x28
140205341 49ffce dec r14
140205344 7419 je 0x14020535f
140205346 488b53f8 mov rdx, qword ptr [rbx - 8]
14020534a 4885d2 test rdx, rdx
14020534d 74ee je 0x14020533d
14020534f 488b0b mov rcx, qword ptr [rbx]
140205352 41b801000000 mov r8d, 1
140205358 e873cedfff call 0x1400021d0
14020535d ebde jmp 0x14020533d
14020535f 488b85e0030000 mov rax, qword ptr [rbp + 0x3e0]
140205366 4885c0 test rax, rax
140205369 741a je 0x140205385
14020536b 48c1e003 shl rax, 3
14020536f 488d1480 lea rdx, [rax + rax*4]
140205373 41b808000000 mov r8d, 8
140205379 488b8de8030000 mov rcx, qword ptr [rbp + 0x3e8]
140205380 e84bcedfff call 0x1400021d0
140205385 0f57c0 xorps xmm0, xmm0
140205388 0f298540020000 movaps xmmword ptr [rbp + 0x240], xmm0
14020538f 0f298530020000 movaps xmmword ptr [rbp + 0x230], xmm0
140205396 0f298520020000 movaps xmmword ptr [rbp + 0x220], xmm0
14020539d 0f298510020000 movaps xmmword ptr [rbp + 0x210], xmm0
1402053a4 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
1402053ab 48c7855002000000000000 mov qword ptr [rbp + 0x250], 0
1402053b6 66c785840600000000 mov word ptr [rbp + 0x684], 0
1402053bf c7858006000000000000 mov dword ptr [rbp + 0x680], 0
1402053c9 440f119558020000 movups xmmword ptr [rbp + 0x258], xmm10
1402053d1 440f119d68020000 movups xmmword ptr [rbp + 0x268], xmm11
1402053d9 0f1005f865be05 movups xmm0, xmmword ptr [rip + 0x5be65f8]
1402053e0 0f118578020000 movups xmmword ptr [rbp + 0x278], xmm0
1402053e7 0f1005fa65be05 movups xmm0, xmmword ptr [rip + 0x5be65fa]
1402053ee 0f118588020000 movups xmmword ptr [rbp + 0x288], xmm0
1402053f5 0f10050c66be05 movups xmm0, xmmword ptr [rip + 0x5be660c]
1402053fc 0f1185a8020000 movups xmmword ptr [rbp + 0x2a8], xmm0
140205403 0f1005ee65be05 movups xmm0, xmmword ptr [rip + 0x5be65ee]
14020540a 0f118598020000 movups xmmword ptr [rbp + 0x298], xmm0
140205411 440f11b5c8020000 movups xmmword ptr [rbp + 0x2c8], xmm14
140205419 440f11a5b8020000 movups xmmword ptr [rbp + 0x2b8], xmm12
140205421 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
140205428 48c785b001000000000000 mov qword ptr [rbp + 0x1b0], 0
140205433 0f11bdb8010000 movups xmmword ptr [rbp + 0x1b8], xmm7
14020543a 48c785c801000000000000 mov qword ptr [rbp + 0x1c8], 0
140205445 440f2985d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm8
14020544d 48c785e001000000000000 mov qword ptr [rbp + 0x1e0], 0
140205458 440f118de8010000 movups xmmword ptr [rbp + 0x1e8], xmm9
140205460 48c785f801000000000000 mov qword ptr [rbp + 0x1f8], 0
14020546b 488bb5f0030000 mov rsi, qword ptr [rbp + 0x3f0]
140205472 488d8d08050000 lea rcx, [rbp + 0x508]
140205479 488d95a0010000 lea rdx, [rbp + 0x1a0]
140205480 41b838010000 mov r8d, 0x138
140205486 e85c4c9f05 call 0x145bfa0e7
14020548b 0f2805de7db905 movaps xmm0, xmmword ptr [rip + 0x5b97dde]
140205492 0f118540060000 movups xmmword ptr [rbp + 0x640], xmm0
140205499 c7855006000001000000 mov dword ptr [rbp + 0x650], 1
1402054a3 f30f1005d57eb905 movss xmm0, dword ptr [rip + 0x5b97ed5]
1402054ab 0f138554060000 movlps qword ptr [rbp + 0x654], xmm0
1402054b2 c6855c06000001 mov byte ptr [rbp + 0x65c], 1
1402054b9 48c7856006000000000000 mov qword ptr [rbp + 0x660], 0
1402054c4 c785680600000000803f mov dword ptr [rbp + 0x668], 0x3f800000
1402054ce 66c7856c0600000000 mov word ptr [rbp + 0x66c], 0
1402054d7 c7856e06000000000100 mov dword ptr [rbp + 0x66e], 0x10000
1402054e1 66c785720600000000 mov word ptr [rbp + 0x672], 0
1402054ea c7857406000000000100 mov dword ptr [rbp + 0x674], 0x10000
1402054f4 66c785780600000000 mov word ptr [rbp + 0x678], 0
1402054fd c7857a06000000000000 mov dword ptr [rbp + 0x67a], 0
140205507 66c7857e0600000000 mov word ptr [rbp + 0x67e], 0
140205510 4889b500050000 mov qword ptr [rbp + 0x500], rsi
140205517 c6859707000000 mov byte ptr [rbp + 0x797], 0
14020551e 488d8d60040000 lea rcx, [rbp + 0x460]
140205525 4c8d8500050000 lea r8, [rbp + 0x500]
14020552c 488d95f8030000 lea rdx, [rbp + 0x3f8]
140205533 e8d88ffdff call 0x1401de510
140205538 90 nop
140205539 488b8d60040000 mov rcx, qword ptr [rbp + 0x460]
140205540 488b8588040000 mov rax, qword ptr [rbp + 0x488]
140205547 48898d80070000 mov qword ptr [rbp + 0x780], rcx
14020554e 48898d10070000 mov qword ptr [rbp + 0x710], rcx
140205555 0f108568040000 movups xmm0, xmmword ptr [rbp + 0x468]
14020555c 0f118518070000 movups xmmword ptr [rbp + 0x718], xmm0
140205563 0f108578040000 movups xmm0, xmmword ptr [rbp + 0x478]
14020556a 0f118528070000 movups xmmword ptr [rbp + 0x728], xmm0
140205571 48898538070000 mov qword ptr [rbp + 0x738], rax
140205578 e883ccdfff call 0x140002200
14020557d b918000000 mov ecx, 0x18
140205582 ba08000000 mov edx, 8
140205587 e834ccdfff call 0x1400021c0
14020558c 48898578070000 mov qword ptr [rbp + 0x778], rax
140205593 4885c0 test rax, rax
140205596 0f8495060000 je 0x140205c31
14020559c 488d0dd465be05 lea rcx, [rip + 0x5be65d4]
1402055a3 ba09000000 mov edx, 9
1402055a8 e8a36e6e05 call 0x1458ec450
1402055ad 90 nop
1402055ae 4c8bb540070000 mov r14, qword ptr [rbp + 0x740]
1402055b5 488b8d48070000 mov rcx, qword ptr [rbp + 0x748]
1402055bc 4c8b8578070000 mov r8, qword ptr [rbp + 0x778]
1402055c3 41c60000 mov byte ptr [r8], 0
1402055c7 49894008 mov qword ptr [r8 + 8], rax
1402055cb 49895010 mov qword ptr [r8 + 0x10], rdx
1402055cf 48c7855007000001000000 mov qword ptr [rbp + 0x750], 1
1402055da 4c898558070000 mov qword ptr [rbp + 0x758], r8
1402055e1 48c7856007000001000000 mov qword ptr [rbp + 0x760], 1
1402055ec 803900 cmp byte ptr [rcx], 0
1402055ef 7466 je 0x140205657
1402055f1 c6859607000001 mov byte ptr [rbp + 0x796], 1
1402055f8 488d0d8165be05 lea rcx, [rip + 0x5be6581]
1402055ff ba0b000000 mov edx, 0xb
140205604 e8476e6e05 call 0x1458ec450
140205609 90 nop
14020560a 4889c7 mov rdi, rax
14020560d 4889d3 mov rbx, rdx
140205610 488bb560070000 mov rsi, qword ptr [rbp + 0x760]
140205617 483bb550070000 cmp rsi, qword ptr [rbp + 0x750]
14020561e 7514 jne 0x140205634
140205620 c6859607000001 mov byte ptr [rbp + 0x796], 1
140205627 488d8d50070000 lea rcx, [rbp + 0x750]
14020562e e8ad559f05 call 0x145bfabe0
140205633 90 nop
140205634 488b8558070000 mov rax, qword ptr [rbp + 0x758]
14020563b 488d0c76 lea rcx, [rsi + rsi*2]
14020563f c604c801 mov byte ptr [rax + rcx*8], 1
140205643 48897cc808 mov qword ptr [rax + rcx*8 + 8], rdi
140205648 48895cc810 mov qword ptr [rax + rcx*8 + 0x10], rbx
14020564d 48ffc6 inc rsi
140205650 4889b560070000 mov qword ptr [rbp + 0x760], rsi
140205657 498b06 mov rax, qword ptr [r14]
14020565a 80780c00 cmp byte ptr [rax + 0xc], 0
14020565e 741b je 0x14020567b
140205660 c6859607000001 mov byte ptr [rbp + 0x796], 1
140205667 488d0d3265be05 lea rcx, [rip + 0x5be6532]
14020566e ba0e000000 mov edx, 0xe
140205673 e8d86d6e05 call 0x1458ec450
140205678 90 nop
140205679 eb19 jmp 0x140205694
14020567b c6859607000001 mov byte ptr [rbp + 0x796], 1
140205682 488d0d0265be05 lea rcx, [rip + 0x5be6502]
140205689 ba15000000 mov edx, 0x15
14020568e e8bd6d6e05 call 0x1458ec450
140205693 90 nop
140205694 4889c7 mov rdi, rax
140205697 4889d3 mov rbx, rdx
14020569a 488bb560070000 mov rsi, qword ptr [rbp + 0x760]
1402056a1 483bb550070000 cmp rsi, qword ptr [rbp + 0x750]
1402056a8 7514 jne 0x1402056be
1402056aa c6859607000001 mov byte ptr [rbp + 0x796], 1
1402056b1 488d8d50070000 lea rcx, [rbp + 0x750]
1402056b8 e823559f05 call 0x145bfabe0
1402056bd 90 nop
1402056be 488b8558070000 mov rax, qword ptr [rbp + 0x758]
1402056c5 488d0cf500000000 lea rcx, [rsi*8]
1402056cd 488d0c49 lea rcx, [rcx + rcx*2]
1402056d1 c6040802 mov byte ptr [rax + rcx], 2
1402056d5 48897c0808 mov qword ptr [rax + rcx + 8], rdi
1402056da 48895c0810 mov qword ptr [rax + rcx + 0x10], rbx
1402056df 48ffc6 inc rsi
1402056e2 4889b560070000 mov qword ptr [rbp + 0x760], rsi
1402056e9 488b8550070000 mov rax, qword ptr [rbp + 0x750]
1402056f0 48898570070000 mov qword ptr [rbp + 0x770], rax
1402056f7 488b9d58070000 mov rbx, qword ptr [rbp + 0x758]
1402056fe 488d740b18 lea rsi, [rbx + rcx + 0x18]
140205703 4c8db560050000 lea r14, [rbp + 0x560]
14020570a 450f57e4 xorps xmm12, xmm12
14020570e 440f282d9a7bb905 movaps xmm13, xmmword ptr [rip + 0x5b97b9a]
140205716 440f2835b27eb905 movaps xmm14, xmmword ptr [rip + 0x5b97eb2]
14020571e 48899d48070000 mov qword ptr [rbp + 0x748], rbx
140205725 4839f3 cmp rbx, rsi
140205728 0f845b040000 je 0x140205b89
14020572e 440fb63b movzx r15d, byte ptr [rbx]
140205732 4180ffff cmp r15b, 0xff
140205736 0f844d040000 je 0x140205b89
14020573c 4c8b6308 mov r12, qword ptr [rbx + 8]
140205740 488b7b10 mov rdi, qword ptr [rbx + 0x10]
140205744 66c785640600000000 mov word ptr [rbp + 0x664], 0
14020574d c6855406000001 mov byte ptr [rbp + 0x654], 1
140205754 450f116640 movups xmmword ptr [r14 + 0x40], xmm12
140205759 450f116630 movups xmmword ptr [r14 + 0x30], xmm12
14020575e 450f116620 movups xmmword ptr [r14 + 0x20], xmm12
140205763 450f116610 movups xmmword ptr [r14 + 0x10], xmm12
140205768 450f1126 movups xmmword ptr [r14], xmm12
14020576c 49c7465000000000 mov qword ptr [r14 + 0x50], 0
140205774 6641c7861c0100000000 mov word ptr [r14 + 0x11c], 0
14020577e 41c7861801000000000000 mov dword ptr [r14 + 0x118], 0
140205789 450f115e68 movups xmmword ptr [r14 + 0x68], xmm11
14020578e 450f115658 movups xmmword ptr [r14 + 0x58], xmm10
140205793 0f2805167eb905 movaps xmm0, xmmword ptr [rip + 0x5b97e16]
14020579a 0f1185d8050000 movups xmmword ptr [rbp + 0x5d8], xmm0
1402057a1 0f2805b87bb905 movaps xmm0, xmmword ptr [rip + 0x5b97bb8]
1402057a8 0f1185e8050000 movups xmmword ptr [rbp + 0x5e8], xmm0
1402057af 440f11adf8050000 movups xmmword ptr [rbp + 0x5f8], xmm13
1402057b7 440f11ad08060000 movups xmmword ptr [rbp + 0x608], xmm13
1402057bf 440f11b518060000 movups xmmword ptr [rbp + 0x618], xmm14
1402057c7 440f11b528060000 movups xmmword ptr [rbp + 0x628], xmm14
1402057cf 66c785760600000000 mov word ptr [rbp + 0x676], 0
1402057d8 c7857206000000000000 mov dword ptr [rbp + 0x672], 0
1402057e2 48c7855806000000000000 mov qword ptr [rbp + 0x658], 0
1402057ed c785600600000000803f mov dword ptr [rbp + 0x660], 0x3f800000
1402057f7 0f2805727ab905 movaps xmm0, xmmword ptr [rip + 0x5b97a72]
1402057fe 0f118538060000 movups xmmword ptr [rbp + 0x638], xmm0
140205805 c7854806000001000000 mov dword ptr [rbp + 0x648], 1
14020580f 48c7854c06000000000000 mov qword ptr [rbp + 0x64c], 0
14020581a 0f29b500050000 movaps xmmword ptr [rbp + 0x500], xmm6
140205821 48c7851005000000000000 mov qword ptr [rbp + 0x510], 0
14020582c 410f117eb8 movups xmmword ptr [r14 - 0x48], xmm7
140205831 49c746c800000000 mov qword ptr [r14 - 0x38], 0
140205839 450f1146d0 movups xmmword ptr [r14 - 0x30], xmm8
14020583e 49c746e000000000 mov qword ptr [r14 - 0x20], 0
140205846 450f114ee8 movups xmmword ptr [r14 - 0x18], xmm9
14020584b 49c746f800000000 mov qword ptr [r14 - 8], 0
140205853 41c7860601000000000100 mov dword ptr [r14 + 0x106], 0x10000
14020585e 6641c7860a0100000000 mov word ptr [r14 + 0x10a], 0
140205868 6641c786100100000000 mov word ptr [r14 + 0x110], 0
140205872 41c7860c01000000000100 mov dword ptr [r14 + 0x10c], 0x10000
14020587d 488d8d90040000 lea rcx, [rbp + 0x490]
140205884 e807aeefff call 0x140100690
140205889 90 nop
14020588a 4c89a578070000 mov qword ptr [rbp + 0x778], r12
140205891 4989f4 mov r12, rsi
140205894 0f10051563be05 movups xmm0, xmmword ptr [rip + 0x5be6315]
14020589b 0f298520010000 movaps xmmword ptr [rbp + 0x120], xmm0
1402058a2 c785300100009a99593f mov dword ptr [rbp + 0x130], 0x3f59999a
1402058ac 488db520040000 lea rsi, [rbp + 0x420]
1402058b3 4889f1 mov rcx, rsi
1402058b6 488d9520010000 lea rdx, [rbp + 0x120]
1402058bd e82e84a704 call 0x144c7dcf0
1402058c2 90 nop
1402058c3 0f288520040000 movaps xmm0, xmmword ptr [rbp + 0x420]
1402058ca 0f118510010000 movups xmmword ptr [rbp + 0x110], xmm0
1402058d1 c7850c01000001000000 mov dword ptr [rbp + 0x10c], 1
1402058db c74424480000c040 mov dword ptr [rsp + 0x48], 0x40c00000
1402058e3 c744244001000000 mov dword ptr [rsp + 0x40], 1
1402058eb c744243800000000 mov dword ptr [rsp + 0x38], 0
1402058f3 c744243001000000 mov dword ptr [rsp + 0x30], 1
1402058fb c744242800000040 mov dword ptr [rsp + 0x28], 0x40000000
140205903 c744242001000000 mov dword ptr [rsp + 0x20], 1
14020590b 0f57db xorps xmm3, xmm3
14020590e 4889f1 mov rcx, rsi
140205911 488d950c010000 lea rdx, [rbp + 0x10c]
140205918 41b801000000 mov r8d, 1
14020591e e85d424402 call 0x142649b80
140205923 90 nop
140205924 41b880010000 mov r8d, 0x180
14020592a 488db5a0010000 lea rsi, [rbp + 0x1a0]
140205931 4889f1 mov rcx, rsi
140205934 4c8dad00050000 lea r13, [rbp + 0x500]
14020593b 4c89ea mov rdx, r13
14020593e e8a4479f05 call 0x145bfa0e7
140205943 488b85f0040000 mov rax, qword ptr [rbp + 0x4f0]
14020594a 488d8d20030000 lea rcx, [rbp + 0x320]
140205951 48894160 mov qword ptr [rcx + 0x60], rax
140205955 0f1085e0040000 movups xmm0, xmmword ptr [rbp + 0x4e0]
14020595c 0f114150 movups xmmword ptr [rcx + 0x50], xmm0
140205960 0f1085d0040000 movups xmm0, xmmword ptr [rbp + 0x4d0]
140205967 0f114140 movups xmmword ptr [rcx + 0x40], xmm0
14020596b 0f108590040000 movups xmm0, xmmword ptr [rbp + 0x490]
140205972 0f108da0040000 movups xmm1, xmmword ptr [rbp + 0x4a0]
140205979 0f1095b0040000 movups xmm2, xmmword ptr [rbp + 0x4b0]
140205980 0f109dc0040000 movups xmm3, xmmword ptr [rbp + 0x4c0]
140205987 0f115930 movups xmmword ptr [rcx + 0x30], xmm3
14020598b 0f115120 movups xmmword ptr [rcx + 0x20], xmm2
14020598f 0f114910 movups xmmword ptr [rcx + 0x10], xmm1
140205993 0f1101 movups xmmword ptr [rcx], xmm0
140205996 488b8530040000 mov rax, qword ptr [rbp + 0x430]
14020599d 488d8d46040000 lea rcx, [rbp + 0x446]
1402059a4 48894110 mov qword ptr [rcx + 0x10], rax
1402059a8 0f108520040000 movups xmm0, xmmword ptr [rbp + 0x420]
1402059af 0f1101 movups xmmword ptr [rcx], xmm0
1402059b2 41b8e8010000 mov r8d, 0x1e8
1402059b8 488d8d08050000 lea rcx, [rbp + 0x508]
1402059bf 4889f2 mov rdx, rsi
1402059c2 e820479f05 call 0x145bfa0e7
1402059c7 4488bdf0060000 mov byte ptr [rbp + 0x6f0], r15b
1402059ce c685f106000002 mov byte ptr [rbp + 0x6f1], 2
1402059d5 0f108540040000 movups xmm0, xmmword ptr [rbp + 0x440]
1402059dc 0f108d4e040000 movups xmm1, xmmword ptr [rbp + 0x44e]
1402059e3 410f118692010000 movups xmmword ptr [r14 + 0x192], xmm0
1402059eb 410f118ea0010000 movups xmmword ptr [r14 + 0x1a0], xmm1
1402059f3 488b8580070000 mov rax, qword ptr [rbp + 0x780]
1402059fa 48898500050000 mov qword ptr [rbp + 0x500], rax
140205a01 488d8d90040000 lea rcx, [rbp + 0x490]
140205a08 488d9518070000 lea rdx, [rbp + 0x718]
140205a0f 4d89e8 mov r8, r13
140205a12 e8e907feff call 0x1401e6200
140205a17 90 nop
140205a18 488b8568070000 mov rax, qword ptr [rbp + 0x768]
140205a1f 4883c318 add rbx, 0x18
140205a23 4989fd mov r13, rdi
140205a26 4885ff test rdi, rdi
140205a29 0f8847010000 js 0x140205b76
140205a2f 4c89a540070000 mov qword ptr [rbp + 0x740], r12
140205a36 488b30 mov rsi, qword ptr [rax]
140205a39 7437 je 0x140205a72
140205a3b e8c0c7dfff call 0x140002200
140205a40 bf01000000 mov edi, 1
140205a45 ba01000000 mov edx, 1
140205a4a 4c89e9 mov rcx, r13
140205a4d e86ec7dfff call 0x1400021c0
140205a52 4885c0 test rax, rax
140205a55 0f841d010000 je 0x140205b78
140205a5b 4989c7 mov r15, rax
140205a5e 4889c1 mov rcx, rax
140205a61 488b9578070000 mov rdx, qword ptr [rbp + 0x778]
140205a68 4d89e8 mov r8, r13
140205a6b e877469f05 call 0x145bfa0e7
140205a70 eb06 jmp 0x140205a78
140205a72 41bf01000000 mov r15d, 1
140205a78 803e01 cmp byte ptr [rsi], 1
140205a7b 751e jne 0x140205a9b
140205a7d 8b4601 mov eax, dword ptr [rsi + 1]
140205a80 8b4e04 mov ecx, dword ptr [rsi + 4]
140205a83 898da3010000 mov dword ptr [rbp + 0x1a3], ecx
140205a89 8985a0010000 mov dword ptr [rbp + 0x1a0], eax
140205a8f 488b4608 mov rax, qword ptr [rsi + 8]
140205a93 0fb64e10 movzx ecx, byte ptr [rsi + 0x10]
140205a97 b201 mov dl, 1
140205a99 eb10 jmp 0x140205aab
140205a9b 488b4608 mov rax, qword ptr [rsi + 8]
140205a9f f048ff00 lock inc qword ptr [rax]
140205aa3 0f8e9f010000 jle 0x140205c48
140205aa9 31d2 xor edx, edx
140205aab 488bb540070000 mov rsi, qword ptr [rbp + 0x740]
140205ab2 4c89ad00050000 mov qword ptr [rbp + 0x500], r13
140205ab9 4c89bd08050000 mov qword ptr [rbp + 0x508], r15
140205ac0 4c89ad10050000 mov qword ptr [rbp + 0x510], r13
140205ac7 48c7851805000000000000 mov qword ptr [rbp + 0x518], 0
140205ad2 48c7852005000004000000 mov qword ptr [rbp + 0x520], 4
140205add 48c7852805000000000000 mov qword ptr [rbp + 0x528], 0
140205ae8 889530050000 mov byte ptr [rbp + 0x530], dl
140205aee 8b95a0010000 mov edx, dword ptr [rbp + 0x1a0]
140205af4 448b85a3010000 mov r8d, dword ptr [rbp + 0x1a3]
140205afb 458946d4 mov dword ptr [r14 - 0x2c], r8d
140205aff 418956d1 mov dword ptr [r14 - 0x2f], edx
140205b03 48898538050000 mov qword ptr [rbp + 0x538], rax
140205b0a 48898d40050000 mov qword ptr [rbp + 0x540], rcx
140205b11 c7854805000000008841 mov dword ptr [rbp + 0x548], 0x41880000
140205b1b 66c7854c0500009001 mov word ptr [rbp + 0x54c], 0x190
140205b24 c6854e05000001 mov byte ptr [rbp + 0x54e], 1
140205b2b 0f1005465dbe05 movups xmm0, xmmword ptr [rip + 0x5be5d46]
140205b32 410f1146f0 movups xmmword ptr [r14 - 0x10], xmm0
140205b37 41c7060000803f mov dword ptr [r14], 0x3f800000
140205b3e 450f117e04 movups xmmword ptr [r14 + 4], xmm15
140205b43 8b0557ffbc05 mov eax, dword ptr [rip + 0x5bcff57]
140205b49 41894614 mov dword ptr [r14 + 0x14], eax
140205b4d f20f10054b79b905 movsd xmm0, qword ptr [rip + 0x5b9794b]
140205b55 f20f118578050000 movsd qword ptr [rbp + 0x578], xmm0
140205b5d 488d8d90040000 lea rcx, [rbp + 0x490]
140205b64 488d9500050000 lea rdx, [rbp + 0x500]
140205b6b e8e03affff call 0x1401f9650
140205b70 90 nop
140205b71 e9affbffff jmp 0x140205725
140205b76 31ff xor edi, edi
140205b78 4889f9 mov rcx, rdi
140205b7b 4c89ea mov rdx, r13
140205b7e e83837b905 call 0x145d992bb
140205b83 90 nop
140205b84 e9bf000000 jmp 0x140205c48
140205b89 488b8570070000 mov rax, qword ptr [rbp + 0x770]
140205b90 4885c0 test rax, rax
140205b93 741a je 0x140205baf
140205b95 48c1e003 shl rax, 3
140205b99 488d1440 lea rdx, [rax + rax*2]
140205b9d 41b808000000 mov r8d, 8
140205ba3 488b8d48070000 mov rcx, qword ptr [rbp + 0x748]
140205baa e821c6dfff call 0x1400021d0
140205baf 488b85b0030000 mov rax, qword ptr [rbp + 0x3b0]
140205bb6 0f28b5a0070000 movaps xmm6, xmmword ptr [rbp + 0x7a0]
140205bbd 0f28bdb0070000 movaps xmm7, xmmword ptr [rbp + 0x7b0]
140205bc4 440f2885c0070000 movaps xmm8, xmmword ptr [rbp + 0x7c0]
140205bcc 440f288dd0070000 movaps xmm9, xmmword ptr [rbp + 0x7d0]
140205bd4 440f2895e0070000 movaps xmm10, xmmword ptr [rbp + 0x7e0]
140205bdc 440f289df0070000 movaps xmm11, xmmword ptr [rbp + 0x7f0]
140205be4 440f28a500080000 movaps xmm12, xmmword ptr [rbp + 0x800]
140205bec 440f28ad10080000 movaps xmm13, xmmword ptr [rbp + 0x810]
140205bf4 440f28b520080000 movaps xmm14, xmmword ptr [rbp + 0x820]
140205bfc 440f28bd30080000 movaps xmm15, xmmword ptr [rbp + 0x830]
140205c04 4881c4c8080000 add rsp, 0x8c8
140205c0b 5b pop rbx
140205c0c 5f pop rdi
140205c0d 5e pop rsi
140205c0e 415c pop r12
140205c10 415d pop r13
140205c12 415e pop r14
140205c14 415f pop r15
140205c16 5d pop rbp
140205c17 c3 ret
140205c18 c6859707000001 mov byte ptr [rbp + 0x797], 1
140205c1f b908000000 mov ecx, 8
140205c24 ba40000000 mov edx, 0x40
140205c29 e87336b905 call 0x145d992a1
140205c2e 90 nop
140205c2f eb17 jmp 0x140205c48
140205c31 c6859707000000 mov byte ptr [rbp + 0x797], 0
140205c38 b908000000 mov ecx, 8
140205c3d ba18000000 mov edx, 0x18
140205c42 e85a36b905 call 0x145d992a1
140205c47 90 nop
140205c48 0f0b ud2
