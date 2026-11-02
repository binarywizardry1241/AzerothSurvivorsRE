; talent-metadata
1458dde70 55 push rbp
1458dde71 4157 push r15
1458dde73 4156 push r14
1458dde75 4155 push r13
1458dde77 4154 push r12
1458dde79 56 push rsi
1458dde7a 57 push rdi
1458dde7b 53 push rbx
1458dde7c 4881ec08010000 sub rsp, 0x108
1458dde83 488dac2480000000 lea rbp, [rsp + 0x80]
1458dde8b 48c78580000000feffffff mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
1458dde96 48894d68 mov qword ptr [rbp + 0x68], rcx
1458dde9a 48c7450800000000 mov qword ptr [rbp + 8], 0
1458ddea2 48c7451004000000 mov qword ptr [rbp + 0x10], 4
1458ddeaa 0f57c0 xorps xmm0, xmm0
1458ddead 0f114518 movups xmmword ptr [rbp + 0x18], xmm0
1458ddeb1 48c7452808000000 mov qword ptr [rbp + 0x28], 8
1458ddeb9 0f114530 movups xmmword ptr [rbp + 0x30], xmm0
1458ddebd 48c7454008000000 mov qword ptr [rbp + 0x40], 8
1458ddec5 0f114548 movups xmmword ptr [rbp + 0x48], xmm0
1458ddec9 48c7455808000000 mov qword ptr [rbp + 0x58], 8
1458dded1 48c7456000000000 mov qword ptr [rbp + 0x60], 0
1458dded9 488d4da0 lea rcx, [rbp - 0x60]
1458ddedd e88e82f7ff call 0x145856170
1458ddee2 90 nop
1458ddee3 488b45a0 mov rax, qword ptr [rbp - 0x60]
1458ddee7 48894578 mov qword ptr [rbp + 0x78], rax
1458ddeeb 488b45a8 mov rax, qword ptr [rbp - 0x58]
1458ddeef 48894570 mov qword ptr [rbp + 0x70], rax
1458ddef3 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458ddef7 4885c0 test rax, rax
1458ddefa 0f849e000000 je 0x1458ddf9e
1458ddf00 488d04c0 lea rax, [rax + rax*8]
1458ddf04 488b7d70 mov rdi, qword ptr [rbp + 0x70]
1458ddf08 4c8d2cc7 lea r13, [rdi + rax*8]
1458ddf0c 488d75a1 lea rsi, [rbp - 0x5f]
1458ddf10 4c8d75e0 lea r14, [rbp - 0x20]
1458ddf14 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458ddf20 0fb64708 movzx eax, byte ptr [rdi + 8]
1458ddf24 3cff cmp al, 0xff
1458ddf26 7476 je 0x1458ddf9e
1458ddf28 488b1f mov rbx, qword ptr [rdi]
1458ddf2b 8845a0 mov byte ptr [rbp - 0x60], al
1458ddf2e 0f104709 movups xmm0, xmmword ptr [rdi + 9]
1458ddf32 0f104f19 movups xmm1, xmmword ptr [rdi + 0x19]
1458ddf36 0f105729 movups xmm2, xmmword ptr [rdi + 0x29]
1458ddf3a 0f105f38 movups xmm3, xmmword ptr [rdi + 0x38]
1458ddf3e 0f115e2f movups xmmword ptr [rsi + 0x2f], xmm3
1458ddf42 0f115620 movups xmmword ptr [rsi + 0x20], xmm2
1458ddf46 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
1458ddf4a 0f1106 movups xmmword ptr [rsi], xmm0
1458ddf4d 4c8b7b40 mov r15, qword ptr [rbx + 0x40]
1458ddf51 4c8b6348 mov r12, qword ptr [rbx + 0x48]
1458ddf55 4c89f9 mov rcx, r15
1458ddf58 4c89e2 mov rdx, r12
1458ddf5b e830200000 call 0x1458dff90
1458ddf60 90 nop
1458ddf61 4885c0 test rax, rax
1458ddf64 4c0f45f8 cmovne r15, rax
1458ddf68 490f44d4 cmove rdx, r12
1458ddf6c 0f104350 movups xmm0, xmmword ptr [rbx + 0x50]
1458ddf70 48c745e0ffffffff mov qword ptr [rbp - 0x20], 0xffffffffffffffff
1458ddf78 4c897de8 mov qword ptr [rbp - 0x18], r15
1458ddf7c 488955f0 mov qword ptr [rbp - 0x10], rdx
1458ddf80 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
1458ddf84 488d4d08 lea rcx, [rbp + 8]
1458ddf88 488d55a0 lea rdx, [rbp - 0x60]
1458ddf8c 4d89f0 mov r8, r14
1458ddf8f e81cfcffff call 0x1458ddbb0
1458ddf94 90 nop
1458ddf95 4883c748 add rdi, 0x48
1458ddf99 4c39ef cmp rdi, r13
1458ddf9c 7582 jne 0x1458ddf20
1458ddf9e 488b4578 mov rax, qword ptr [rbp + 0x78]
1458ddfa2 4885c0 test rax, rax
1458ddfa5 7417 je 0x1458ddfbe
1458ddfa7 48c1e003 shl rax, 3
1458ddfab 488d14c0 lea rdx, [rax + rax*8]
1458ddfaf 41b808000000 mov r8d, 8
1458ddfb5 488b4d70 mov rcx, qword ptr [rbp + 0x70]
1458ddfb9 e8124272fa call 0x1400021d0
1458ddfbe 0f104558 movups xmm0, xmmword ptr [rbp + 0x58]
1458ddfc2 488b4568 mov rax, qword ptr [rbp + 0x68]
1458ddfc6 0f114050 movups xmmword ptr [rax + 0x50], xmm0
1458ddfca 0f104548 movups xmm0, xmmword ptr [rbp + 0x48]
1458ddfce 0f114040 movups xmmword ptr [rax + 0x40], xmm0
1458ddfd2 0f104508 movups xmm0, xmmword ptr [rbp + 8]
1458ddfd6 0f104d18 movups xmm1, xmmword ptr [rbp + 0x18]
1458ddfda 0f105528 movups xmm2, xmmword ptr [rbp + 0x28]
1458ddfde 0f105d38 movups xmm3, xmmword ptr [rbp + 0x38]
1458ddfe2 0f115830 movups xmmword ptr [rax + 0x30], xmm3
1458ddfe6 0f115020 movups xmmword ptr [rax + 0x20], xmm2
1458ddfea 0f114810 movups xmmword ptr [rax + 0x10], xmm1
1458ddfee 0f1100 movups xmmword ptr [rax], xmm0
1458ddff1 4881c408010000 add rsp, 0x108
1458ddff8 5b pop rbx
1458ddff9 5f pop rdi
1458ddffa 5e pop rsi
1458ddffb 415c pop r12
1458ddffd 415d pop r13
1458ddfff 415e pop r14
1458de001 415f pop r15
1458de003 5d pop rbp
1458de004 c3 ret

; effect-metadata-append
1458ddbb0 55 push rbp
1458ddbb1 4156 push r14
1458ddbb3 56 push rsi
1458ddbb4 57 push rdi
1458ddbb5 53 push rbx
1458ddbb6 4883ec60 sub rsp, 0x60
1458ddbba 488d6c2460 lea rbp, [rsp + 0x60]
1458ddbbf 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1458ddbc3 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1458ddbcb 4889ce mov rsi, rcx
1458ddbce 0fb602 movzx eax, byte ptr [rdx]
1458ddbd1 2c24 sub al, 0x24
1458ddbd3 0fb6c8 movzx ecx, al
1458ddbd6 b802000000 mov eax, 2
1458ddbdb 0f43c1 cmovae eax, ecx
1458ddbde 84c0 test al, al
1458ddbe0 747c je 0x1458ddc5e
1458ddbe2 4c8945d8 mov qword ptr [rbp - 0x28], r8
1458ddbe6 0fb6c0 movzx eax, al
1458ddbe9 83f801 cmp eax, 1
1458ddbec 0f85c3000000 jne 0x1458ddcb5
1458ddbf2 0fb65a24 movzx ebx, byte ptr [rdx + 0x24]
1458ddbf6 f30f107220 movss xmm6, dword ptr [rdx + 0x20]
1458ddbfb 488b7e28 mov rdi, qword ptr [rsi + 0x28]
1458ddbff 483b7e18 cmp rdi, qword ptr [rsi + 0x18]
1458ddc03 7513 jne 0x1458ddc18
1458ddc05 488d4e18 lea rcx, [rsi + 0x18]
1458ddc09 c645e701 mov byte ptr [rbp - 0x19], 1
1458ddc0d 4989d6 mov r14, rdx
1458ddc10 e8db744300 call 0x145d150f0
1458ddc15 4c89f2 mov rdx, r14
1458ddc18 4883c208 add rdx, 8
1458ddc1c 488b4620 mov rax, qword ptr [rsi + 0x20]
1458ddc20 4889f9 mov rcx, rdi
1458ddc23 48c1e105 shl rcx, 5
1458ddc27 4c8b4210 mov r8, qword ptr [rdx + 0x10]
1458ddc2b 4c89440810 mov qword ptr [rax + rcx + 0x10], r8
1458ddc30 0f1002 movups xmm0, xmmword ptr [rdx]
1458ddc33 0f110408 movups xmmword ptr [rax + rcx], xmm0
1458ddc37 885c0818 mov byte ptr [rax + rcx + 0x18], bl
1458ddc3b f30f1174081c movss dword ptr [rax + rcx + 0x1c], xmm6
1458ddc41 48ffc7 inc rdi
1458ddc44 48897e28 mov qword ptr [rsi + 0x28], rdi
1458ddc48 4c8b45d8 mov r8, qword ptr [rbp - 0x28]
1458ddc4c 498b10 mov rdx, qword ptr [r8]
1458ddc4f 4883faff cmp rdx, -1
1458ddc53 0f8546010000 jne 0x1458ddd9f
1458ddc59 e963010000 jmp 0x1458dddc1
1458ddc5e 0fb65a08 movzx ebx, byte ptr [rdx + 8]
1458ddc62 f30f107204 movss xmm6, dword ptr [rdx + 4]
1458ddc67 488b4608 mov rax, qword ptr [rsi + 8]
1458ddc6b 488b7e10 mov rdi, qword ptr [rsi + 0x10]
1458ddc6f 488d0cfd00000000 lea rcx, [rdi*8]
1458ddc77 31d2 xor edx, edx
1458ddc79 0f1f8000000000 nop dword ptr [rax]
1458ddc80 4839d1 cmp rcx, rdx
1458ddc83 0f84df000000 je 0x1458ddd68
1458ddc89 4c8d4a08 lea r9, [rdx + 8]
1458ddc8d 381c10 cmp byte ptr [rax + rdx], bl
1458ddc90 4c89ca mov rdx, r9
1458ddc93 75eb jne 0x1458ddc80
1458ddc95 f3420f587408fc addss xmm6, dword ptr [rax + r9 - 4]
1458ddc9c f3420f117408fc movss dword ptr [rax + r9 - 4], xmm6
1458ddca3 498b10 mov rdx, qword ptr [r8]
1458ddca6 4883faff cmp rdx, -1
1458ddcaa 0f85ef000000 jne 0x1458ddd9f
1458ddcb0 e90c010000 jmp 0x1458dddc1
1458ddcb5 488b7e40 mov rdi, qword ptr [rsi + 0x40]
1458ddcb9 483b7e30 cmp rdi, qword ptr [rsi + 0x30]
1458ddcbd 7513 jne 0x1458ddcd2
1458ddcbf 488d4e30 lea rcx, [rsi + 0x30]
1458ddcc3 c645e701 mov byte ptr [rbp - 0x19], 1
1458ddcc7 4889d3 mov rbx, rdx
1458ddcca e861294600 call 0x145d40630
1458ddccf 4889da mov rdx, rbx
1458ddcd2 488b4638 mov rax, qword ptr [rsi + 0x38]
1458ddcd6 4889f9 mov rcx, rdi
1458ddcd9 48c1e106 shl rcx, 6
1458ddcdd 0f1002 movups xmm0, xmmword ptr [rdx]
1458ddce0 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
1458ddce4 0f105220 movups xmm2, xmmword ptr [rdx + 0x20]
1458ddce8 0f105a30 movups xmm3, xmmword ptr [rdx + 0x30]
1458ddcec 0f115c0830 movups xmmword ptr [rax + rcx + 0x30], xmm3
1458ddcf1 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
1458ddcf6 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1458ddcfb 0f110408 movups xmmword ptr [rax + rcx], xmm0
1458ddcff 48ffc7 inc rdi
1458ddd02 48897e40 mov qword ptr [rsi + 0x40], rdi
1458ddd06 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458ddd0a 488b08 mov rcx, qword ptr [rax]
1458ddd0d 48894dd0 mov qword ptr [rbp - 0x30], rcx
1458ddd11 488b4008 mov rax, qword ptr [rax + 8]
1458ddd15 488945c8 mov qword ptr [rbp - 0x38], rax
1458ddd19 488b7e58 mov rdi, qword ptr [rsi + 0x58]
1458ddd1d 483b7e48 cmp rdi, qword ptr [rsi + 0x48]
1458ddd21 750a jne 0x1458ddd2d
1458ddd23 488d4e48 lea rcx, [rsi + 0x48]
1458ddd27 e834744300 call 0x145d15160
1458ddd2c 90 nop
1458ddd2d 488b55d8 mov rdx, qword ptr [rbp - 0x28]
1458ddd31 4883c210 add rdx, 0x10
1458ddd35 488b4650 mov rax, qword ptr [rsi + 0x50]
1458ddd39 488d0cbf lea rcx, [rdi + rdi*4]
1458ddd3d 4c8b45d0 mov r8, qword ptr [rbp - 0x30]
1458ddd41 4c8904c8 mov qword ptr [rax + rcx*8], r8
1458ddd45 4c8b45c8 mov r8, qword ptr [rbp - 0x38]
1458ddd49 4c8944c808 mov qword ptr [rax + rcx*8 + 8], r8
1458ddd4e 0f1002 movups xmm0, xmmword ptr [rdx]
1458ddd51 0f1144c810 movups xmmword ptr [rax + rcx*8 + 0x10], xmm0
1458ddd56 488b5210 mov rdx, qword ptr [rdx + 0x10]
1458ddd5a 488954c820 mov qword ptr [rax + rcx*8 + 0x20], rdx
1458ddd5f 48ffc7 inc rdi
1458ddd62 48897e58 mov qword ptr [rsi + 0x58], rdi
1458ddd66 eb59 jmp 0x1458dddc1
1458ddd68 483b3e cmp rdi, qword ptr [rsi]
1458ddd6b 7519 jne 0x1458ddd86
1458ddd6d 4c8945d8 mov qword ptr [rbp - 0x28], r8
1458ddd71 c645e701 mov byte ptr [rbp - 0x19], 1
1458ddd75 4889f1 mov rcx, rsi
1458ddd78 e843284600 call 0x145d405c0
1458ddd7d 90 nop
1458ddd7e 488b4608 mov rax, qword ptr [rsi + 8]
1458ddd82 4c8b45d8 mov r8, qword ptr [rbp - 0x28]
1458ddd86 881cf8 mov byte ptr [rax + rdi*8], bl
1458ddd89 f30f1174f804 movss dword ptr [rax + rdi*8 + 4], xmm6
1458ddd8f 48ffc7 inc rdi
1458ddd92 48897e10 mov qword ptr [rsi + 0x10], rdi
1458ddd96 498b10 mov rdx, qword ptr [r8]
1458ddd99 4883faff cmp rdx, -1
1458ddd9d 7422 je 0x1458dddc1
1458ddd9f 4885d2 test rdx, rdx
1458ddda2 741d je 0x1458dddc1
1458ddda4 498b4808 mov rcx, qword ptr [r8 + 8]
1458ddda8 41b801000000 mov r8d, 1
1458dddae 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1458dddb2 4883c460 add rsp, 0x60
1458dddb6 5b pop rbx
1458dddb7 5f pop rdi
1458dddb8 5e pop rsi
1458dddb9 415e pop r14
1458dddbb 5d pop rbp
1458dddbc e90f4472fa jmp 0x1400021d0
1458dddc1 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1458dddc5 4883c460 add rsp, 0x60
1458dddc9 5b pop rbx
1458dddca 5f pop rdi
1458dddcb 5e pop rsi
1458dddcc 415e pop r14
1458dddce 5d pop rbp
1458dddcf c3 ret

; effect-rebuild
14593c720 55 push rbp
14593c721 4157 push r15
14593c723 4156 push r14
14593c725 4155 push r13
14593c727 4154 push r12
14593c729 56 push rsi
14593c72a 57 push rdi
14593c72b 53 push rbx
14593c72c 4881ec78020000 sub rsp, 0x278
14593c733 488dac2480000000 lea rbp, [rsp + 0x80]
14593c73b 440f2995e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm10
14593c743 440f298dd0010000 movaps xmmword ptr [rbp + 0x1d0], xmm9
14593c74b 440f2985c0010000 movaps xmmword ptr [rbp + 0x1c0], xmm8
14593c753 0f29bdb0010000 movaps xmmword ptr [rbp + 0x1b0], xmm7
14593c75a 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
14593c761 48c78598010000feffffff mov qword ptr [rbp + 0x198], 0xfffffffffffffffe
14593c76c 4889ce mov rsi, rcx
14593c76f 488d91c8010000 lea rdx, [rcx + 0x1c8]
14593c776 488d4db0 lea rcx, [rbp - 0x50]
14593c77a e8f116faff call 0x1458dde70
14593c77f 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14593c783 4c8b7df0 mov r15, qword ptr [rbp - 0x10]
14593c787 4d89f8 mov r8, r15
14593c78a 49c1e006 shl r8, 6
14593c78e 4901d0 add r8, rdx
14593c791 c6859601000001 mov byte ptr [rbp + 0x196], 1
14593c798 488d8d10010000 lea rcx, [rbp + 0x110]
14593c79f e80caf0800 call 0x1459c76b0
14593c7a4 90 nop
14593c7a5 488b8510010000 mov rax, qword ptr [rbp + 0x110]
14593c7ac 4c8ba520010000 mov r12, qword ptr [rbp + 0x120]
14593c7b3 4885c0 test rax, rax
14593c7b6 741a je 0x14593c7d2
14593c7b8 488b8d18010000 mov rcx, qword ptr [rbp + 0x118]
14593c7bf 48c1e003 shl rax, 3
14593c7c3 488d1440 lea rdx, [rax + rax*2]
14593c7c7 41b808000000 mov r8d, 8
14593c7cd e8fe596cfa call 0x1400021d0
14593c7d2 0f104500 movups xmm0, xmmword ptr [rbp]
14593c7d6 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
14593c7da 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
14593c7de 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
14593c7e2 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
14593c7e6 0f104dc0 movups xmm1, xmmword ptr [rbp - 0x40]
14593c7ea 0f1055d0 movups xmm2, xmmword ptr [rbp - 0x30]
14593c7ee 0f105de0 movups xmm3, xmmword ptr [rbp - 0x20]
14593c7f2 0f295d40 movaps xmmword ptr [rbp + 0x40], xmm3
14593c7f6 0f295530 movaps xmmword ptr [rbp + 0x30], xmm2
14593c7fa 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
14593c7fe 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
14593c802 4883beb0030000ff cmp qword ptr [rsi + 0x3b0], -1
14593c80a 4c89bd88010000 mov qword ptr [rbp + 0x188], r15
14593c811 4c89a578010000 mov qword ptr [rbp + 0x178], r12
14593c818 0f84c1010000 je 0x14593c9df
14593c81e 488b8610040000 mov rax, qword ptr [rsi + 0x410]
14593c825 4883f804 cmp rax, 4
14593c829 b904000000 mov ecx, 4
14593c82e 480f42c8 cmovb rcx, rax
14593c832 89c8 mov eax, ecx
14593c834 488d0da9ad6c01 lea rcx, [rip + 0x16cada9]
14593c83b f30f100481 movss xmm0, dword ptr [rcx + rax*4]
14593c840 f30f5905cc8f5a00 mulss xmm0, dword ptr [rip + 0x5a8fcc]
14593c848 f30f580560365a00 addss xmm0, dword ptr [rip + 0x5a3660]
14593c850 8b8618040000 mov eax, dword ptr [rsi + 0x418]
14593c856 83f801 cmp eax, 1
14593c859 83d0ff adc eax, -1
14593c85c 0f57c9 xorps xmm1, xmm1
14593c85f f30f2ac8 cvtsi2ss xmm1, eax
14593c863 e81d7e3d00 call 0x145d14685
14593c868 f30f58c0 addss xmm0, xmm0
14593c86c f30f100de8245b00 movss xmm1, dword ptr [rip + 0x5b24e8]
14593c874 f30f5cc8 subss xmm1, xmm0
14593c878 f30f118dc8000000 movss dword ptr [rbp + 0xc8], xmm1
14593c880 488b86e8030000 mov rax, qword ptr [rsi + 0x3e8]
14593c887 488b8ef0030000 mov rcx, qword ptr [rsi + 0x3f0]
14593c88e 48c1e106 shl rcx, 6
14593c892 4801c1 add rcx, rax
14593c895 48898510010000 mov qword ptr [rbp + 0x110], rax
14593c89c 48898d18010000 mov qword ptr [rbp + 0x118], rcx
14593c8a3 488d85c8000000 lea rax, [rbp + 0xc8]
14593c8aa 48898520010000 mov qword ptr [rbp + 0x120], rax
14593c8b1 c6859701000001 mov byte ptr [rbp + 0x197], 1
14593c8b8 488d8de0000000 lea rcx, [rbp + 0xe0]
14593c8bf 488d9510010000 lea rdx, [rbp + 0x110]
14593c8c6 e865890900 call 0x1459d5230
14593c8cb 90 nop
14593c8cc 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
14593c8d3 48898570010000 mov qword ptr [rbp + 0x170], rax
14593c8da 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
14593c8e1 48898580010000 mov qword ptr [rbp + 0x180], rax
14593c8e8 488bbdf0000000 mov rdi, qword ptr [rbp + 0xf0]
14593c8ef 4885ff test rdi, rdi
14593c8f2 0f84b7000000 je 0x14593c9af
14593c8f8 48c1e706 shl rdi, 6
14593c8fc 488b9d80010000 mov rbx, qword ptr [rbp + 0x180]
14593c903 4801df add rdi, rbx
14593c906 4c8dad11010000 lea r13, [rbp + 0x111]
14593c90d 4c8d7510 lea r14, [rbp + 0x10]
14593c911 4c8dbd10010000 lea r15, [rbp + 0x110]
14593c918 4c8da5e0000000 lea r12, [rbp + 0xe0]
14593c91f 90 nop
14593c920 0fb603 movzx eax, byte ptr [rbx]
14593c923 3cff cmp al, 0xff
14593c925 0f8484000000 je 0x14593c9af
14593c92b 888510010000 mov byte ptr [rbp + 0x110], al
14593c931 0f104301 movups xmm0, xmmword ptr [rbx + 1]
14593c935 0f104b11 movups xmm1, xmmword ptr [rbx + 0x11]
14593c939 0f105321 movups xmm2, xmmword ptr [rbx + 0x21]
14593c93d 0f105b30 movups xmm3, xmmword ptr [rbx + 0x30]
14593c941 410f115d2f movups xmmword ptr [r13 + 0x2f], xmm3
14593c946 410f115520 movups xmmword ptr [r13 + 0x20], xmm2
14593c94b 410f114d10 movups xmmword ptr [r13 + 0x10], xmm1
14593c950 410f114500 movups xmmword ptr [r13], xmm0
14593c955 488d8dc8000000 lea rcx, [rbp + 0xc8]
14593c95c 488d96c8030000 lea rdx, [rsi + 0x3c8]
14593c963 e8a8ae3a00 call 0x145ce7810
14593c968 90 nop
14593c969 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
14593c970 488985f0000000 mov qword ptr [rbp + 0xf0], rax
14593c977 0f1085c8000000 movups xmm0, xmmword ptr [rbp + 0xc8]
14593c97e 0f2985e0000000 movaps xmmword ptr [rbp + 0xe0], xmm0
14593c985 0f1086f8030000 movups xmm0, xmmword ptr [rsi + 0x3f8]
14593c98c 0f1185f8000000 movups xmmword ptr [rbp + 0xf8], xmm0
14593c993 4c89f1 mov rcx, r14
14593c996 4c89fa mov rdx, r15
14593c999 4d89e0 mov r8, r12
14593c99c e80f12faff call 0x1458ddbb0
14593c9a1 90 nop
14593c9a2 4883c340 add rbx, 0x40
14593c9a6 4839fb cmp rbx, rdi
14593c9a9 0f8571ffffff jne 0x14593c920
14593c9af 488b9570010000 mov rdx, qword ptr [rbp + 0x170]
14593c9b6 4885d2 test rdx, rdx
14593c9b9 4c8ba578010000 mov r12, qword ptr [rbp + 0x178]
14593c9c0 4c8bbd88010000 mov r15, qword ptr [rbp + 0x188]
14593c9c7 7416 je 0x14593c9df
14593c9c9 48c1e206 shl rdx, 6
14593c9cd 41b808000000 mov r8d, 8
14593c9d3 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
14593c9da e8f1576cfa call 0x1400021d0
14593c9df 0f284560 movaps xmm0, xmmword ptr [rbp + 0x60]
14593c9e3 0f298560010000 movaps xmmword ptr [rbp + 0x160], xmm0
14593c9ea 0f284550 movaps xmm0, xmmword ptr [rbp + 0x50]
14593c9ee 0f298550010000 movaps xmmword ptr [rbp + 0x150], xmm0
14593c9f5 0f284510 movaps xmm0, xmmword ptr [rbp + 0x10]
14593c9f9 0f284d20 movaps xmm1, xmmword ptr [rbp + 0x20]
14593c9fd 0f285530 movaps xmm2, xmmword ptr [rbp + 0x30]
14593ca01 0f285d40 movaps xmm3, xmmword ptr [rbp + 0x40]
14593ca05 0f299d40010000 movaps xmmword ptr [rbp + 0x140], xmm3
14593ca0c 0f299530010000 movaps xmmword ptr [rbp + 0x130], xmm2
14593ca13 0f298d20010000 movaps xmmword ptr [rbp + 0x120], xmm1
14593ca1a 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
14593ca21 4c8dae00080000 lea r13, [rsi + 0x800]
14593ca28 4c89e9 mov rcx, r13
14593ca2b e8306cedff call 0x145813660
14593ca30 0f288560010000 movaps xmm0, xmmword ptr [rbp + 0x160]
14593ca37 0f118650080000 movups xmmword ptr [rsi + 0x850], xmm0
14593ca3e 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
14593ca45 0f118640080000 movups xmmword ptr [rsi + 0x840], xmm0
14593ca4c 0f288510010000 movaps xmm0, xmmword ptr [rbp + 0x110]
14593ca53 0f288d20010000 movaps xmm1, xmmword ptr [rbp + 0x120]
14593ca5a 0f289530010000 movaps xmm2, xmmword ptr [rbp + 0x130]
14593ca61 0f289d40010000 movaps xmm3, xmmword ptr [rbp + 0x140]
14593ca68 0f119e30080000 movups xmmword ptr [rsi + 0x830], xmm3
14593ca6f 0f119620080000 movups xmmword ptr [rsi + 0x820], xmm2
14593ca76 0f118e10080000 movups xmmword ptr [rsi + 0x810], xmm1
14593ca7d 0f118600080000 movups xmmword ptr [rsi + 0x800], xmm0
14593ca84 488b5e78 mov rbx, qword ptr [rsi + 0x78]
14593ca88 4939df cmp r15, rbx
14593ca8b 7707 ja 0x14593ca94
14593ca8d 4c897e78 mov qword ptr [rsi + 0x78], r15
14593ca91 4c89fb mov rbx, r15
14593ca94 488bbe40080000 mov rdi, qword ptr [rsi + 0x840]
14593ca9b 4989fe mov r14, rdi
14593ca9e 4929de sub r14, rbx
14593caa1 766a jbe 0x14593cb0d
14593caa3 488d4e68 lea rcx, [rsi + 0x68]
14593caa7 488b01 mov rax, qword ptr [rcx]
14593caaa 4829d8 sub rax, rbx
14593caad 4989df mov r15, rbx
14593cab0 4939c6 cmp r14, rax
14593cab3 0f87ab070000 ja 0x14593d264
14593cab9 4c8b6670 mov r12, qword ptr [rsi + 0x70]
14593cabd 4b8d0cbc lea rcx, [r12 + r15*4]
14593cac1 4983fe02 cmp r14, 2
14593cac5 722c jb 0x14593caf3
14593cac7 4989d8 mov r8, rbx
14593caca 49f7d0 not r8
14593cacd 4901f8 add r8, rdi
14593cad0 49c1e002 shl r8, 2
14593cad4 31d2 xor edx, edx
14593cad6 e8327b3d00 call 0x145d1460d
14593cadb 4c01ff add rdi, r15
14593cade 48c1e302 shl rbx, 2
14593cae2 498d0cbc lea rcx, [r12 + rdi*4]
14593cae6 4829d9 sub rcx, rbx
14593cae9 4883c1fc add rcx, -4
14593caed 4d01f7 add r15, r14
14593caf0 49ffcf dec r15
14593caf3 c70100000000 mov dword ptr [rcx], 0
14593caf9 49ffc7 inc r15
14593cafc 4c89ff mov rdi, r15
14593caff 4c8ba578010000 mov r12, qword ptr [rbp + 0x178]
14593cb06 4c8bbd88010000 mov r15, qword ptr [rbp + 0x188]
14593cb0d 48897e78 mov qword ptr [rsi + 0x78], rdi
14593cb11 488b9e90000000 mov rbx, qword ptr [rsi + 0x90]
14593cb18 4939df cmp r15, rbx
14593cb1b 770a ja 0x14593cb27
14593cb1d 4c89be90000000 mov qword ptr [rsi + 0x90], r15
14593cb24 4c89fb mov rbx, r15
14593cb27 488bbe40080000 mov rdi, qword ptr [rsi + 0x840]
14593cb2e 4989fe mov r14, rdi
14593cb31 4929de sub r14, rbx
14593cb34 7670 jbe 0x14593cba6
14593cb36 488d8e80000000 lea rcx, [rsi + 0x80]
14593cb3d 488b01 mov rax, qword ptr [rcx]
14593cb40 4829d8 sub rax, rbx
14593cb43 4989df mov r15, rbx
14593cb46 4939c6 cmp r14, rax
14593cb49 0f8752070000 ja 0x14593d2a1
14593cb4f 4c8ba688000000 mov r12, qword ptr [rsi + 0x88]
14593cb56 4b8d0cbc lea rcx, [r12 + r15*4]
14593cb5a 4983fe02 cmp r14, 2
14593cb5e 722c jb 0x14593cb8c
14593cb60 4989d8 mov r8, rbx
14593cb63 49f7d0 not r8
14593cb66 4901f8 add r8, rdi
14593cb69 49c1e002 shl r8, 2
14593cb6d 31d2 xor edx, edx
14593cb6f e8997a3d00 call 0x145d1460d
14593cb74 4c01ff add rdi, r15
14593cb77 48c1e302 shl rbx, 2
14593cb7b 498d0cbc lea rcx, [r12 + rdi*4]
14593cb7f 4829d9 sub rcx, rbx
14593cb82 4883c1fc add rcx, -4
14593cb86 4d01f7 add r15, r14
14593cb89 49ffcf dec r15
14593cb8c c70100000000 mov dword ptr [rcx], 0
14593cb92 49ffc7 inc r15
14593cb95 4c89ff mov rdi, r15
14593cb98 4c8ba578010000 mov r12, qword ptr [rbp + 0x178]
14593cb9f 4c8bbd88010000 mov r15, qword ptr [rbp + 0x188]
14593cba6 4889be90000000 mov qword ptr [rsi + 0x90], rdi
14593cbad 488bbea8000000 mov rdi, qword ptr [rsi + 0xa8]
14593cbb4 4889fb mov rbx, rdi
14593cbb7 4c29fb sub rbx, r15
14593cbba 7251 jb 0x14593cc0d
14593cbbc 488b86a0000000 mov rax, qword ptr [rsi + 0xa0]
14593cbc3 4c89bea8000000 mov qword ptr [rsi + 0xa8], r15
14593cbca 4c89ff mov rdi, r15
14593cbcd 743e je 0x14593cc0d
14593cbcf 4b8d0c7f lea rcx, [r15 + r15*2]
14593cbd3 488d3cc8 lea rdi, [rax + rcx*8]
14593cbd7 4883c708 add rdi, 8
14593cbdb eb0c jmp 0x14593cbe9
14593cbdd 0f1f00 nop dword ptr [rax]
14593cbe0 4883c718 add rdi, 0x18
14593cbe4 48ffcb dec rbx
14593cbe7 741d je 0x14593cc06
14593cbe9 488b57f8 mov rdx, qword ptr [rdi - 8]
14593cbed 4885d2 test rdx, rdx
14593cbf0 74ee je 0x14593cbe0
14593cbf2 488b0f mov rcx, qword ptr [rdi]
14593cbf5 48c1e202 shl rdx, 2
14593cbf9 41b804000000 mov r8d, 4
14593cbff e8cc556cfa call 0x1400021d0
14593cc04 ebda jmp 0x14593cbe0
14593cc06 488bbea8000000 mov rdi, qword ptr [rsi + 0xa8]
14593cc0d 488b8640080000 mov rax, qword ptr [rsi + 0x840]
14593cc14 4889c2 mov rdx, rax
14593cc17 4829fa sub rdx, rdi
14593cc1a 763e jbe 0x14593cc5a
14593cc1c 488d8e98000000 lea rcx, [rsi + 0x98]
14593cc23 48c7851001000000000000 mov qword ptr [rbp + 0x110], 0
14593cc2e 48c7851801000004000000 mov qword ptr [rbp + 0x118], 4
14593cc39 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
14593cc44 c6859701000000 mov byte ptr [rbp + 0x197], 0
14593cc4b 4c8d8510010000 lea r8, [rbp + 0x110]
14593cc52 e839260800 call 0x1459bf290
14593cc57 90 nop
14593cc58 eb17 jmp 0x14593cc71
14593cc5a 488b8ea0000000 mov rcx, qword ptr [rsi + 0xa0]
14593cc61 488986a8000000 mov qword ptr [rsi + 0xa8], rax
14593cc68 4829c7 sub rdi, rax
14593cc6b 0f85c5000000 jne 0x14593cd36
14593cc71 488b4660 mov rax, qword ptr [rsi + 0x60]
14593cc75 4885c0 test rax, rax
14593cc78 742f je 0x14593cca9
14593cc7a 488b4e58 mov rcx, qword ptr [rsi + 0x58]
14593cc7e 4c8d4910 lea r9, [rcx + 0x10]
14593cc82 4889c2 mov rdx, rax
14593cc85 48f7da neg rdx
14593cc88 4531c0 xor r8d, r8d
14593cc8b 0f1f440000 nop dword ptr [rax + rax]
14593cc90 4d3979f0 cmp qword ptr [r9 - 0x10], r15
14593cc94 0f83e5040000 jae 0x14593d17f
14593cc9a 49ffc0 inc r8
14593cc9d 4983c110 add r9, 0x10
14593cca1 4989d2 mov r10, rdx
14593cca4 4d01c2 add r10, r8
14593cca7 75e7 jne 0x14593cc90
14593cca9 4c3ba6c0000000 cmp r12, qword ptr [rsi + 0xc0]
14593ccb0 7707 ja 0x14593ccb9
14593ccb2 4c89a6c0000000 mov qword ptr [rsi + 0xc0], r12
14593ccb9 488b9638080000 mov rdx, qword ptr [rsi + 0x838]
14593ccc0 4c8b8640080000 mov r8, qword ptr [rsi + 0x840]
14593ccc7 49c1e006 shl r8, 6
14593cccb 4901d0 add r8, rdx
14593ccce c6859701000000 mov byte ptr [rbp + 0x197], 0
14593ccd5 488d8d10010000 lea rcx, [rbp + 0x110]
14593ccdc e8cfa90800 call 0x1459c76b0
14593cce1 90 nop
14593cce2 488b8510010000 mov rax, qword ptr [rbp + 0x110]
14593cce9 48898580010000 mov qword ptr [rbp + 0x180], rax
14593ccf0 488b8518010000 mov rax, qword ptr [rbp + 0x118]
14593ccf7 48898588010000 mov qword ptr [rbp + 0x188], rax
14593ccfe 488b8d20010000 mov rcx, qword ptr [rbp + 0x120]
14593cd05 31c0 xor eax, eax
14593cd07 4889ca mov rdx, rcx
14593cd0a 4c29e2 sub rdx, r12
14593cd0d 480f43c2 cmovae rax, rdx
14593cd11 4c89e2 mov rdx, r12
14593cd14 4829ca sub rdx, rcx
14593cd17 0f83c4020000 jae 0x14593cfe1
14593cd1d 89c1 mov ecx, eax
14593cd1f 83e103 and ecx, 3
14593cd22 4883fafc cmp rdx, -4
14593cd26 7652 jbe 0x14593cd7a
14593cd28 31d2 xor edx, edx
14593cd2a 488bbd88010000 mov rdi, qword ptr [rbp + 0x188]
14593cd31 e9ca000000 jmp 0x14593ce00
14593cd36 488d0440 lea rax, [rax + rax*2]
14593cd3a 488d1cc1 lea rbx, [rcx + rax*8]
14593cd3e 4883c308 add rbx, 8
14593cd42 eb19 jmp 0x14593cd5d
14593cd44 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593cd50 4883c318 add rbx, 0x18
14593cd54 48ffcf dec rdi
14593cd57 0f8414ffffff je 0x14593cc71
14593cd5d 488b53f8 mov rdx, qword ptr [rbx - 8]
14593cd61 4885d2 test rdx, rdx
14593cd64 74ea je 0x14593cd50
14593cd66 488b0b mov rcx, qword ptr [rbx]
14593cd69 48c1e202 shl rdx, 2
14593cd6d 41b804000000 mov r8d, 4
14593cd73 e858546cfa call 0x1400021d0
14593cd78 ebd6 jmp 0x14593cd50
14593cd7a 49b8fcffffffffffff07 movabs r8, 0x7fffffffffffffc
14593cd84 4921c0 and r8, rax
14593cd87 4a8d14e500000000 lea rdx, [r12*8]
14593cd8f 4c8d0c52 lea r9, [rdx + rdx*2]
14593cd93 31d2 xor edx, edx
14593cd95 488bbd88010000 mov rdi, qword ptr [rbp + 0x188]
14593cd9c 4989fa mov r10, rdi
14593cd9f 90 nop
14593cda0 430f10040a movups xmm0, xmmword ptr [r10 + r9]
14593cda5 4f8b5c0a10 mov r11, qword ptr [r10 + r9 + 0x10]
14593cdaa 4d895a10 mov qword ptr [r10 + 0x10], r11
14593cdae 410f1102 movups xmmword ptr [r10], xmm0
14593cdb2 430f10440a18 movups xmm0, xmmword ptr [r10 + r9 + 0x18]
14593cdb8 4f8b5c0a28 mov r11, qword ptr [r10 + r9 + 0x28]
14593cdbd 4d895a28 mov qword ptr [r10 + 0x28], r11
14593cdc1 410f114218 movups xmmword ptr [r10 + 0x18], xmm0
14593cdc6 430f10440a30 movups xmm0, xmmword ptr [r10 + r9 + 0x30]
14593cdcc 4f8b5c0a40 mov r11, qword ptr [r10 + r9 + 0x40]
14593cdd1 4d895a40 mov qword ptr [r10 + 0x40], r11
14593cdd5 410f114230 movups xmmword ptr [r10 + 0x30], xmm0
14593cdda 4883c204 add rdx, 4
14593cdde 430f10440a48 movups xmm0, xmmword ptr [r10 + r9 + 0x48]
14593cde4 4f8b5c0a58 mov r11, qword ptr [r10 + r9 + 0x58]
14593cde9 4d895a58 mov qword ptr [r10 + 0x58], r11
14593cded 410f114248 movups xmmword ptr [r10 + 0x48], xmm0
14593cdf2 4983c260 add r10, 0x60
14593cdf6 4939d0 cmp r8, rdx
14593cdf9 75a5 jne 0x14593cda0
14593cdfb 4885c9 test rcx, rcx
14593cdfe 742a je 0x14593ce2a
14593ce00 488d1452 lea rdx, [rdx + rdx*2]
14593ce04 488d14d7 lea rdx, [rdi + rdx*8]
14593ce08 49c1e403 shl r12, 3
14593ce0c 4f8d0464 lea r8, [r12 + r12*2]
14593ce10 420f100402 movups xmm0, xmmword ptr [rdx + r8]
14593ce15 4e8b4c0210 mov r9, qword ptr [rdx + r8 + 0x10]
14593ce1a 4c894a10 mov qword ptr [rdx + 0x10], r9
14593ce1e 0f1102 movups xmmword ptr [rdx], xmm0
14593ce21 4883c218 add rdx, 0x18
14593ce25 48ffc9 dec rcx
14593ce28 75e6 jne 0x14593ce10
14593ce2a 488d0440 lea rax, [rax + rax*2]
14593ce2e 488d04c7 lea rax, [rdi + rax*8]
14593ce32 48898578010000 mov qword ptr [rbp + 0x178], rax
14593ce39 4c8d3540773801 lea r14, [rip + 0x1387740]
14593ce40 0f57f6 xorps xmm6, xmm6
14593ce43 f20f103d05375b00 movsd xmm7, qword ptr [rip + 0x5b3705]
14593ce4b f2440f10056c305a00 movsd xmm8, qword ptr [rip + 0x5a306c]
14593ce54 440f280d04375b00 movaps xmm9, xmmword ptr [rip + 0x5b3704]
14593ce5c 4889f8 mov rax, rdi
14593ce5f e980000000 jmp 0x14593cee4
14593ce64 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593ce70 488b86b8000000 mov rax, qword ptr [rsi + 0xb8]
14593ce77 4b8d0c7f lea rcx, [r15 + r15*2]
14593ce7b 48c1e105 shl rcx, 5
14593ce7f 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14593ce86 4889540850 mov qword ptr [rax + rcx + 0x50], rdx
14593ce8b 0f1085b0000000 movups xmm0, xmmword ptr [rbp + 0xb0]
14593ce92 0f11440840 movups xmmword ptr [rax + rcx + 0x40], xmm0
14593ce97 0f104570 movups xmm0, xmmword ptr [rbp + 0x70]
14593ce9b 0f108d80000000 movups xmm1, xmmword ptr [rbp + 0x80]
14593cea2 0f109590000000 movups xmm2, xmmword ptr [rbp + 0x90]
14593cea9 0f109da0000000 movups xmm3, xmmword ptr [rbp + 0xa0]
14593ceb0 0f115c0830 movups xmmword ptr [rax + rcx + 0x30], xmm3
14593ceb5 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
14593ceba 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14593cebf 0f110408 movups xmmword ptr [rax + rcx], xmm0
14593cec3 f3440f11540858 movss dword ptr [rax + rcx + 0x58], xmm10
14593ceca 49ffc7 inc r15
14593cecd 4c89bec0000000 mov qword ptr [rsi + 0xc0], r15
14593ced4 4889f8 mov rax, rdi
14593ced7 483bbd78010000 cmp rdi, qword ptr [rbp + 0x178]
14593cede 0f84fd000000 je 0x14593cfe1
14593cee4 4c8b20 mov r12, qword ptr [rax]
14593cee7 4d85e4 test r12, r12
14593ceea 0f84f1000000 je 0x14593cfe1
14593cef0 4c89eb mov rbx, r13
14593cef3 488d7818 lea rdi, [rax + 0x18]
14593cef7 f3440f105010 movss xmm10, dword ptr [rax + 0x10]
14593cefd 4c8b6808 mov r13, qword ptr [rax + 8]
14593cf01 4c89a5e0000000 mov qword ptr [rbp + 0xe0], r12
14593cf08 4c89ade8000000 mov qword ptr [rbp + 0xe8], r13
14593cf0f 4531ff xor r15d, r15d
14593cf12 eb1d jmp 0x14593cf31
14593cf14 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593cf20 4983c778 add r15, 0x78
14593cf24 4981fff8340000 cmp r15, 0x34f8
14593cf2b 0f84fa020000 je 0x14593d22b
14593cf31 4f396c3708 cmp qword ptr [r15 + r14 + 8], r13
14593cf36 75e8 jne 0x14593cf20
14593cf38 4b8b0c37 mov rcx, qword ptr [r15 + r14]
14593cf3c 4c89e2 mov rdx, r12
14593cf3f 4d89e8 mov r8, r13
14593cf42 e8ba763d00 call 0x145d14601
14593cf47 85c0 test eax, eax
14593cf49 75d5 jne 0x14593cf20
14593cf4b 488d8594000000 lea rax, [rbp + 0x94]
14593cf52 0f1130 movups xmmword ptr [rax], xmm6
14593cf55 c7401000000000 mov dword ptr [rax + 0x10], 0
14593cf5c 4d01f7 add r15, r14
14593cf5f 4c897d70 mov qword ptr [rbp + 0x70], r15
14593cf63 c7457801000000 mov dword ptr [rbp + 0x78], 1
14593cf6a f20f117d7c movsd qword ptr [rbp + 0x7c], xmm7
14593cf6f 48c785840000000000803f mov qword ptr [rbp + 0x84], 0x3f800000
14593cf7a f2440f11858c000000 movsd qword ptr [rbp + 0x8c], xmm8
14593cf83 f2440f1185a8000000 movsd qword ptr [rbp + 0xa8], xmm8
14593cf8c c785b000000000000000 mov dword ptr [rbp + 0xb0], 0
14593cf96 440f118db4000000 movups xmmword ptr [rbp + 0xb4], xmm9
14593cf9e 488d8da8000000 lea rcx, [rbp + 0xa8]
14593cfa5 4989dd mov r13, rbx
14593cfa8 4889da mov rdx, rbx
14593cfab 4d89f8 mov r8, r15
14593cfae e8ed10faff call 0x1458de0a0
14593cfb3 90 nop
14593cfb4 c7457c0000803f mov dword ptr [rbp + 0x7c], 0x3f800000
14593cfbb 4c8bbec0000000 mov r15, qword ptr [rsi + 0xc0]
14593cfc2 4c3bbeb0000000 cmp r15, qword ptr [rsi + 0xb0]
14593cfc9 0f85a1feffff jne 0x14593ce70
14593cfcf 488d8eb0000000 lea rcx, [rsi + 0xb0]
14593cfd6 e875354000 call 0x145d40550
14593cfdb 90 nop
14593cfdc e98ffeffff jmp 0x14593ce70
14593cfe1 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14593cfe8 4885c0 test rax, rax
14593cfeb 741a je 0x14593d007
14593cfed 48c1e003 shl rax, 3
14593cff1 488d1440 lea rdx, [rax + rax*2]
14593cff5 41b808000000 mov r8d, 8
14593cffb 488b8d88010000 mov rcx, qword ptr [rbp + 0x188]
14593d002 e8c9516cfa call 0x1400021d0
14593d007 488b8640030000 mov rax, qword ptr [rsi + 0x340]
14593d00e 486b8e4803000058 imul rcx, qword ptr [rsi + 0x348], 0x58
14593d016 4801c1 add rcx, rax
14593d019 48898510010000 mov qword ptr [rbp + 0x110], rax
14593d020 48898d18010000 mov qword ptr [rbp + 0x118], rcx
14593d027 4c89ad20010000 mov qword ptr [rbp + 0x120], r13
14593d02e c6859701000000 mov byte ptr [rbp + 0x197], 0
14593d035 488d8de0000000 lea rcx, [rbp + 0xe0]
14593d03c 488d9510010000 lea rdx, [rbp + 0x110]
14593d043 e8f8820900 call 0x1459d5340
14593d048 90 nop
14593d049 4c8b8648030000 mov r8, qword ptr [rsi + 0x348]
14593d050 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
14593d057 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
14593d05e 4d85c0 test r8, r8
14593d061 745c je 0x14593d0bf
14593d063 488b9640030000 mov rdx, qword ptr [rsi + 0x340]
14593d06a 4d6bc058 imul r8, r8, 0x58
14593d06e 4c8b95f0000000 mov r10, qword ptr [rbp + 0xf0]
14593d075 4883c238 add rdx, 0x38
14593d079 4f8d0cd2 lea r9, [r10 + r10*8]
14593d07d 4f8d0c49 lea r9, [r9 + r9*2]
14593d081 4d01d1 add r9, r10
14593d084 4531d2 xor r10d, r10d
14593d087 4531db xor r11d, r11d
14593d08a 660f1f440000 nop word ptr [rax + rax]
14593d090 4d39d1 cmp r9, r10
14593d093 742a je 0x14593d0bf
14593d095 4a8d3c11 lea rdi, [rcx + r10]
14593d099 0f1007 movups xmm0, xmmword ptr [rdi]
14593d09c 488b5f10 mov rbx, qword ptr [rdi + 0x10]
14593d0a0 8b7f18 mov edi, dword ptr [rdi + 0x18]
14593d0a3 42897c1a18 mov dword ptr [rdx + r11 + 0x18], edi
14593d0a8 4a895c1a10 mov qword ptr [rdx + r11 + 0x10], rbx
14593d0ad 420f11041a movups xmmword ptr [rdx + r11], xmm0
14593d0b2 4983c358 add r11, 0x58
14593d0b6 4983c21c add r10, 0x1c
14593d0ba 4d39d8 cmp r8, r11
14593d0bd 75d1 jne 0x14593d090
14593d0bf 4885c0 test rax, rax
14593d0c2 7416 je 0x14593d0da
14593d0c4 488d14c0 lea rdx, [rax + rax*8]
14593d0c8 488d1452 lea rdx, [rdx + rdx*2]
14593d0cc 4801c2 add rdx, rax
14593d0cf 41b804000000 mov r8d, 4
14593d0d5 e8f6506cfa call 0x1400021d0
14593d0da 488bbeb8000000 mov rdi, qword ptr [rsi + 0xb8]
14593d0e1 488b86c0000000 mov rax, qword ptr [rsi + 0xc0]
14593d0e8 4c8d3440 lea r14, [rax + rax*2]
14593d0ec 49c1e605 shl r14, 5
14593d0f0 4901fe add r14, rdi
14593d0f3 488d9d10010000 lea rbx, [rbp + 0x110]
14593d0fa 4c39f7 cmp rdi, r14
14593d0fd 7436 je 0x14593d135
14593d0ff 90 nop
14593d100 4c8b07 mov r8, qword ptr [rdi]
14593d103 c6859701000000 mov byte ptr [rbp + 0x197], 0
14593d10a 4889d9 mov rcx, rbx
14593d10d 4c89ea mov rdx, r13
14593d110 e88b0ffaff call 0x1458de0a0
14593d115 90 nop
14593d116 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
14593d11d 0f108d1c010000 movups xmm1, xmmword ptr [rbp + 0x11c]
14593d124 0f114f44 movups xmmword ptr [rdi + 0x44], xmm1
14593d128 0f114738 movups xmmword ptr [rdi + 0x38], xmm0
14593d12c 4883c760 add rdi, 0x60
14593d130 4c39f7 cmp rdi, r14
14593d133 75cb jne 0x14593d100
14593d135 c6859701000000 mov byte ptr [rbp + 0x197], 0
14593d13c 4889f1 mov rcx, rsi
14593d13f e8ecfefcff call 0x14590d030
14593d144 90 nop
14593d145 0f28b5a0010000 movaps xmm6, xmmword ptr [rbp + 0x1a0]
14593d14c 0f28bdb0010000 movaps xmm7, xmmword ptr [rbp + 0x1b0]
14593d153 440f2885c0010000 movaps xmm8, xmmword ptr [rbp + 0x1c0]
14593d15b 440f288dd0010000 movaps xmm9, xmmword ptr [rbp + 0x1d0]
14593d163 440f2895e0010000 movaps xmm10, xmmword ptr [rbp + 0x1e0]
14593d16b 4881c478020000 add rsp, 0x278
14593d172 5b pop rbx
14593d173 5f pop rdi
14593d174 5e pop rsi
14593d175 415c pop r12
14593d177 415d pop r13
14593d179 415e pop r14
14593d17b 415f pop r15
14593d17d 5d pop rbp
14593d17e c3 ret
14593d17f 4d8d5801 lea r11, [r8 + 1]
14593d183 4939c3 cmp r11, rax
14593d186 7330 jae 0x14593d1b8
14593d188 4c89c2 mov rdx, r8
14593d18b 4829c2 sub rdx, rax
14593d18e 4c8d5202 lea r10, [rdx + 2]
14593d192 f6c201 test dl, 1
14593d195 752a jne 0x14593d1c1
14593d197 4c89c2 mov rdx, r8
14593d19a 4d3939 cmp qword ptr [r9], r15
14593d19d 730d jae 0x14593d1ac
14593d19f 410f1001 movups xmm0, xmmword ptr [r9]
14593d1a3 410f1141f0 movups xmmword ptr [r9 - 0x10], xmm0
14593d1a8 498d5001 lea rdx, [r8 + 1]
14593d1ac 4983c002 add r8, 2
14593d1b0 4d89c3 mov r11, r8
14593d1b3 4989d0 mov r8, rdx
14593d1b6 eb09 jmp 0x14593d1c1
14593d1b8 4c894660 mov qword ptr [rsi + 0x60], r8
14593d1bc e9e8faffff jmp 0x14593cca9
14593d1c1 4d85d2 test r10, r10
14593d1c4 745c je 0x14593d222
14593d1c6 4c29d8 sub rax, r11
14593d1c9 49c1e304 shl r11, 4
14593d1cd 4d8d0c0b lea r9, [r11 + rcx]
14593d1d1 4983c110 add r9, 0x10
14593d1d5 4c89c2 mov rdx, r8
14593d1d8 eb0a jmp 0x14593d1e4
14593d1da 4983c120 add r9, 0x20
14593d1de 4883c0fe add rax, -2
14593d1e2 743e je 0x14593d222
14593d1e4 4d3979f0 cmp qword ptr [r9 - 0x10], r15
14593d1e8 7207 jb 0x14593d1f1
14593d1ea 4d3939 cmp qword ptr [r9], r15
14593d1ed 73eb jae 0x14593d1da
14593d1ef eb1c jmp 0x14593d20d
14593d1f1 4d8d41f0 lea r8, [r9 - 0x10]
14593d1f5 4989d2 mov r10, rdx
14593d1f8 49c1e204 shl r10, 4
14593d1fc 410f1000 movups xmm0, xmmword ptr [r8]
14593d200 420f110411 movups xmmword ptr [rcx + r10], xmm0
14593d205 48ffc2 inc rdx
14593d208 4d3939 cmp qword ptr [r9], r15
14593d20b 73cd jae 0x14593d1da
14593d20d 4989d0 mov r8, rdx
14593d210 49c1e004 shl r8, 4
14593d214 410f1001 movups xmm0, xmmword ptr [r9]
14593d218 420f110401 movups xmmword ptr [rcx + r8], xmm0
14593d21d 48ffc2 inc rdx
14593d220 ebb8 jmp 0x14593d1da
14593d222 48895660 mov qword ptr [rsi + 0x60], rdx
14593d226 e97efaffff jmp 0x14593cca9
14593d22b 488d85e0000000 lea rax, [rbp + 0xe0]
14593d232 48898510010000 mov qword ptr [rbp + 0x110], rax
14593d239 488d05804e6cfa lea rax, [rip - 0x593b180]
14593d240 48898518010000 mov qword ptr [rbp + 0x118], rax
14593d247 488d0d1a653801 lea rcx, [rip + 0x138651a]
14593d24e 4c8d0523653801 lea r8, [rip + 0x1386523]
14593d255 488d9510010000 lea rdx, [rbp + 0x110]
14593d25c e8dfa25700 call 0x145eb7540
14593d261 90 nop
14593d262 0f0b ud2
14593d264 c6859701000000 mov byte ptr [rbp + 0x197], 0
14593d26b 48c744242004000000 mov qword ptr [rsp + 0x20], 4
14593d274 41b904000000 mov r9d, 4
14593d27a 4889da mov rdx, rbx
14593d27d 4d89f0 mov r8, r14
14593d280 e88b773d00 call 0x145d14a10
14593d285 90 nop
14593d286 4c8b7e78 mov r15, qword ptr [rsi + 0x78]
14593d28a 4c8b6670 mov r12, qword ptr [rsi + 0x70]
14593d28e 4b8d0cbc lea rcx, [r12 + r15*4]
14593d292 4983fe02 cmp r14, 2
14593d296 0f832bf8ffff jae 0x14593cac7
14593d29c e952f8ffff jmp 0x14593caf3
14593d2a1 c6859701000000 mov byte ptr [rbp + 0x197], 0
14593d2a8 48c744242004000000 mov qword ptr [rsp + 0x20], 4
14593d2b1 41b904000000 mov r9d, 4
14593d2b7 4889da mov rdx, rbx
14593d2ba 4d89f0 mov r8, r14
14593d2bd e84e773d00 call 0x145d14a10
14593d2c2 90 nop
14593d2c3 4c8bbe90000000 mov r15, qword ptr [rsi + 0x90]
14593d2ca 4c8ba688000000 mov r12, qword ptr [rsi + 0x88]
14593d2d1 4b8d0cbc lea rcx, [r12 + r15*4]
14593d2d5 4983fe02 cmp r14, 2
14593d2d9 0f8381f8ffff jae 0x14593cb60
14593d2df e9a8f8ffff jmp 0x14593cb8c

; literal-name-lookup
1458dff90 4157 push r15
1458dff92 4156 push r14
1458dff94 4155 push r13
1458dff96 4154 push r12
1458dff98 56 push rsi
1458dff99 57 push rdi
1458dff9a 55 push rbp
1458dff9b 53 push rbx
1458dff9c 4883ec68 sub rsp, 0x68
1458dffa0 66440f7f442450 movdqa xmmword ptr [rsp + 0x50], xmm8
1458dffa7 660f7f7c2440 movdqa xmmword ptr [rsp + 0x40], xmm7
1458dffad 660f7f742430 movdqa xmmword ptr [rsp + 0x30], xmm6
1458dffb3 4889d6 mov rsi, rdx
1458dffb6 4889cf mov rdi, rcx
1458dffb9 8b05c9479302 mov eax, dword ptr [rip + 0x29347c9]
1458dffbf 85c0 test eax, eax
1458dffc1 0f8524020000 jne 0x1458e01eb
1458dffc7 488b1daa479302 mov rbx, qword ptr [rip + 0x29347aa]
1458dffce 488b15ab479302 mov rdx, qword ptr [rip + 0x29347ab]
1458dffd5 8b0515739302 mov eax, dword ptr [rip + 0x2937315]
1458dffdb 65488b0c2558000000 mov rcx, qword ptr gs:[0x58]
1458dffe4 488b04c1 mov rax, qword ptr [rcx + rax*8]
1458dffe8 80b83003000000 cmp byte ptr [rax + 0x330], 0
1458dffef 7409 je 0x1458dfffa
1458dfff1 488b8038030000 mov rax, qword ptr [rax + 0x338]
1458dfff8 eb07 jmp 0x1458e0001
1458dfffa 488b055f719302 mov rax, qword ptr [rip + 0x293715f]
1458e0001 4c8d42ff lea r8, [rdx - 1]
1458e0005 4c39c0 cmp rax, r8
1458e0008 4c0f42c0 cmovb r8, rax
1458e000c 4983f80d cmp r8, 0xd
1458e0010 b90d000000 mov ecx, 0xd
1458e0015 490f42c8 cmovb rcx, r8
1458e0019 4839d1 cmp rcx, rdx
1458e001c 0f83da010000 jae 0x1458e01fc
1458e0022 4c8d3c49 lea r15, [rcx + rcx*2]
1458e0026 49c1e704 shl r15, 4
1458e002a 4a837c3b1800 cmp qword ptr [rbx + r15 + 0x18], 0
1458e0030 0f84c8000000 je 0x1458e00fe
1458e0036 4901df add r15, rbx
1458e0039 498d4f20 lea rcx, [r15 + 0x20]
1458e003d 4889fa mov rdx, rdi
1458e0040 4989f0 mov r8, rsi
1458e0043 e8486774fa call 0x140026790
1458e0048 4889c1 mov rcx, rax
1458e004b 48c1e939 shr rcx, 0x39
1458e004f 4d8b37 mov r14, qword ptr [r15]
1458e0052 4d8b7f08 mov r15, qword ptr [r15 + 8]
1458e0056 660f6ec1 movd xmm0, ecx
1458e005a 660f60c0 punpcklbw xmm0, xmm0
1458e005e f20f70c000 pshuflw xmm0, xmm0, 0
1458e0063 660f70f044 pshufd xmm6, xmm0, 0x44
1458e0068 31d2 xor edx, edx
1458e006a 660f76ff pcmpeqd xmm7, xmm7
1458e006e 4c21f8 and rax, r15
1458e0071 f3450f6f0406 movdqu xmm8, xmmword ptr [r14 + rax]
1458e0077 66410f6fc0 movdqa xmm0, xmm8
1458e007c 660f74c6 pcmpeqb xmm0, xmm6
1458e0080 66440fd7e8 pmovmskb r13d, xmm0
1458e0085 4585ed test r13d, r13d
1458e0088 7456 je 0x1458e00e0
1458e008a 4889542428 mov qword ptr [rsp + 0x28], rdx
1458e008f f3410fbccd tzcnt ecx, r13d
1458e0094 4989c4 mov r12, rax
1458e0097 4801c1 add rcx, rax
1458e009a 4c21f9 and rcx, r15
1458e009d 48f7d9 neg rcx
1458e00a0 488d0489 lea rax, [rcx + rcx*4]
1458e00a4 493b74c6e8 cmp rsi, qword ptr [r14 + rax*8 - 0x18]
1458e00a9 751b jne 0x1458e00c6
1458e00ab 498d2cc6 lea rbp, [r14 + rax*8]
1458e00af 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458e00b3 4889f9 mov rcx, rdi
1458e00b6 4989f0 mov r8, rsi
1458e00b9 e843454300 call 0x145d14601
1458e00be 85c0 test eax, eax
1458e00c0 0f84f4000000 je 0x1458e01ba
1458e00c6 418d45ff lea eax, [r13 - 1]
1458e00ca 664421e8 and ax, r13w
1458e00ce 4189c5 mov r13d, eax
1458e00d1 4c89e0 mov rax, r12
1458e00d4 488b542428 mov rdx, qword ptr [rsp + 0x28]
1458e00d9 75b4 jne 0x1458e008f
1458e00db 0f1f440000 nop dword ptr [rax + rax]
1458e00e0 66440f74c7 pcmpeqb xmm8, xmm7
1458e00e5 66410fd7c8 pmovmskb ecx, xmm8
1458e00ea 85c9 test ecx, ecx
1458e00ec 7510 jne 0x1458e00fe
1458e00ee 4801d0 add rax, rdx
1458e00f1 4883c010 add rax, 0x10
1458e00f5 4883c210 add rdx, 0x10
1458e00f9 e970ffffff jmp 0x1458e006e
1458e00fe 48837b1800 cmp qword ptr [rbx + 0x18], 0
1458e0103 0f84bb000000 je 0x1458e01c4
1458e0109 488d4b20 lea rcx, [rbx + 0x20]
1458e010d 4889fa mov rdx, rdi
1458e0110 4989f0 mov r8, rsi
1458e0113 e8786674fa call 0x140026790
1458e0118 4889c1 mov rcx, rax
1458e011b 48c1e939 shr rcx, 0x39
1458e011f 4c8b33 mov r14, qword ptr [rbx]
1458e0122 488b5b08 mov rbx, qword ptr [rbx + 8]
1458e0126 660f6ec1 movd xmm0, ecx
1458e012a 660f60c0 punpcklbw xmm0, xmm0
1458e012e f20f70c000 pshuflw xmm0, xmm0, 0
1458e0133 660f70f044 pshufd xmm6, xmm0, 0x44
1458e0138 660f76ff pcmpeqd xmm7, xmm7
1458e013c 4531ff xor r15d, r15d
1458e013f 4821d8 and rax, rbx
1458e0142 f3450f6f0406 movdqu xmm8, xmmword ptr [r14 + rax]
1458e0148 66410f6fc0 movdqa xmm0, xmm8
1458e014d 660f74c6 pcmpeqb xmm0, xmm6
1458e0151 66440fd7e0 pmovmskb r12d, xmm0
1458e0156 4585e4 test r12d, r12d
1458e0159 7444 je 0x1458e019f
1458e015b f3410fbccc tzcnt ecx, r12d
1458e0160 4989c5 mov r13, rax
1458e0163 4801c1 add rcx, rax
1458e0166 4821d9 and rcx, rbx
1458e0169 48f7d9 neg rcx
1458e016c 488d0489 lea rax, [rcx + rcx*4]
1458e0170 493b74c6e8 cmp rsi, qword ptr [r14 + rax*8 - 0x18]
1458e0175 7517 jne 0x1458e018e
1458e0177 498d2cc6 lea rbp, [r14 + rax*8]
1458e017b 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458e017f 4889f9 mov rcx, rdi
1458e0182 4989f0 mov r8, rsi
1458e0185 e877444300 call 0x145d14601
1458e018a 85c0 test eax, eax
1458e018c 742c je 0x1458e01ba
1458e018e 418d4424ff lea eax, [r12 - 1]
1458e0193 664421e0 and ax, r12w
1458e0197 4189c4 mov r12d, eax
1458e019a 4c89e8 mov rax, r13
1458e019d 75bc jne 0x1458e015b
1458e019f 66440f74c7 pcmpeqb xmm8, xmm7
1458e01a4 66410fd7c8 pmovmskb ecx, xmm8
1458e01a9 85c9 test ecx, ecx
1458e01ab 751b jne 0x1458e01c8
1458e01ad 4c01f8 add rax, r15
1458e01b0 4883c010 add rax, 0x10
1458e01b4 4983c710 add r15, 0x10
1458e01b8 eb85 jmp 0x1458e013f
1458e01ba 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458e01be 488b55f8 mov rdx, qword ptr [rbp - 8]
1458e01c2 eb06 jmp 0x1458e01ca
1458e01c4 31c0 xor eax, eax
1458e01c6 eb02 jmp 0x1458e01ca
1458e01c8 31c0 xor eax, eax
1458e01ca 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
1458e01cf 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
1458e01d4 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
1458e01da 4883c468 add rsp, 0x68
1458e01de 5b pop rbx
1458e01df 5d pop rbp
1458e01e0 5f pop rdi
1458e01e1 5e pop rsi
1458e01e2 415c pop r12
1458e01e4 415d pop r13
1458e01e6 415e pop r14
1458e01e8 415f pop r15
1458e01ea c3 ret
1458e01eb 488d0d7e459302 lea rcx, [rip + 0x293457e]
1458e01f2 e8547f5b00 call 0x145e9814b
1458e01f7 e9cbfdffff jmp 0x1458dffc7
1458e01fc 4c8d056dcb7501 lea r8, [rip + 0x175cb6d]
1458e0203 e85b715d00 call 0x145eb7363
1458e0208 0f0b ud2

; raw recovery/racial/aura finalization
14590d030 55 push rbp
14590d031 4157 push r15
14590d033 4156 push r14
14590d035 4155 push r13
14590d037 4154 push r12
14590d039 56 push rsi
14590d03a 57 push rdi
14590d03b 53 push rbx
14590d03c 4881ecc8010000 sub rsp, 0x1c8
14590d043 488dac2480000000 lea rbp, [rsp + 0x80]
14590d04b 440f29bd30010000 movaps xmmword ptr [rbp + 0x130], xmm15
14590d053 440f29b520010000 movaps xmmword ptr [rbp + 0x120], xmm14
14590d05b 440f29ad10010000 movaps xmmword ptr [rbp + 0x110], xmm13
14590d063 440f29a500010000 movaps xmmword ptr [rbp + 0x100], xmm12
14590d06b 440f299df0000000 movaps xmmword ptr [rbp + 0xf0], xmm11
14590d073 440f2995e0000000 movaps xmmword ptr [rbp + 0xe0], xmm10
14590d07b 440f298dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm9
14590d083 440f2985c0000000 movaps xmmword ptr [rbp + 0xc0], xmm8
14590d08b 0f29bdb0000000 movaps xmmword ptr [rbp + 0xb0], xmm7
14590d092 0f29b5a0000000 movaps xmmword ptr [rbp + 0xa0], xmm6
14590d099 48c78598000000feffffff mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
14590d0a4 4889ce mov rsi, rcx
14590d0a7 0fb6812c030000 movzx eax, byte ptr [rcx + 0x32c]
14590d0ae 04fe add al, 0xfe
14590d0b0 3c09 cmp al, 9
14590d0b2 7724 ja 0x14590d0d8
14590d0b4 0fb6c0 movzx eax, al
14590d0b7 488d0d3258a201 lea rcx, [rip + 0x1a25832]
14590d0be 488b14c1 mov rdx, qword ptr [rcx + rax*8]
14590d0c2 0fb6862d030000 movzx eax, byte ptr [rsi + 0x32d]
14590d0c9 04fe add al, 0xfe
14590d0cb 3c06 cmp al, 6
14590d0cd 761d jbe 0x14590d0ec
14590d0cf 4c8d05f24d3b01 lea r8, [rip + 0x13b4df2]
14590d0d6 eb22 jmp 0x14590d0fa
14590d0d8 488d15795f3b01 lea rdx, [rip + 0x13b5f79]
14590d0df 0fb6862d030000 movzx eax, byte ptr [rsi + 0x32d]
14590d0e6 04fe add al, 0xfe
14590d0e8 3c06 cmp al, 6
14590d0ea 77e3 ja 0x14590d0cf
14590d0ec 0fb6c0 movzx eax, al
14590d0ef 488d0d8257a201 lea rcx, [rip + 0x1a25782]
14590d0f6 4c8b04c1 mov r8, qword ptr [rcx + rax*8]
14590d0fa 4c8bae10080000 mov r13, qword ptr [rsi + 0x810]
14590d101 4a8d1ced00000000 lea rbx, [r13*8]
14590d109 4c89e8 mov rax, r13
14590d10c 48c1e83d shr rax, 0x3d
14590d110 0f95c0 setne al
14590d113 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
14590d11d 4839cb cmp rbx, rcx
14590d120 0f97c1 seta cl
14590d123 08c1 or cl, al
14590d125 7410 je 0x14590d137
14590d127 4531ff xor r15d, r15d
14590d12a 4c89f9 mov rcx, r15
14590d12d 4889da mov rdx, rbx
14590d130 e8969e5a00 call 0x145eb6fcb
14590d135 0f0b ud2
14590d137 4c894560 mov qword ptr [rbp + 0x60], r8
14590d13b 48895510 mov qword ptr [rbp + 0x10], rdx
14590d13f 4c8bb608080000 mov r14, qword ptr [rsi + 0x808]
14590d146 4885db test rbx, rbx
14590d149 7425 je 0x14590d170
14590d14b e8b0506ffa call 0x140002200
14590d150 41bf04000000 mov r15d, 4
14590d156 ba04000000 mov edx, 4
14590d15b 4889d9 mov rcx, rbx
14590d15e e85d506ffa call 0x1400021c0
14590d163 4885c0 test rax, rax
14590d166 74c2 je 0x14590d12a
14590d168 4889c7 mov rdi, rax
14590d16b 4d89ef mov r15, r13
14590d16e eb08 jmp 0x14590d178
14590d170 bf04000000 mov edi, 4
14590d175 4531ff xor r15d, r15d
14590d178 4c897d30 mov qword ptr [rbp + 0x30], r15
14590d17c 48897d38 mov qword ptr [rbp + 0x38], rdi
14590d180 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14590d188 4d85ed test r13, r13
14590d18b 7412 je 0x14590d19f
14590d18d 4889f9 mov rcx, rdi
14590d190 4c89f2 mov rdx, r14
14590d193 4989d8 mov r8, rbx
14590d196 e860744000 call 0x145d145fb
14590d19b 4c896d40 mov qword ptr [rbp + 0x40], r13
14590d19f f30f10b69c0b0000 movss xmm6, dword ptr [rsi + 0xb9c]
14590d1a7 488b9610080000 mov rdx, qword ptr [rsi + 0x810]
14590d1ae 4885d2 test rdx, rdx
14590d1b1 0f8426010000 je 0x14590d2dd
14590d1b7 488b8608080000 mov rax, qword ptr [rsi + 0x808]
14590d1be 4883fa01 cmp rdx, 1
14590d1c2 750c jne 0x14590d1d0
14590d1c4 f30f100564325d00 movss xmm0, dword ptr [rip + 0x5d3264]
14590d1cc 31c9 xor ecx, ecx
14590d1ce eb5a jmp 0x14590d22a
14590d1d0 4989d0 mov r8, rdx
14590d1d3 4983e0fe and r8, 0xfffffffffffffffe
14590d1d7 f30f100551325d00 movss xmm0, dword ptr [rip + 0x5d3251]
14590d1df 31c9 xor ecx, ecx
14590d1e1 eb16 jmp 0x14590d1f9
14590d1e3 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14590d1f0 4883c102 add rcx, 2
14590d1f4 4939c8 cmp r8, rcx
14590d1f7 742c je 0x14590d225
14590d1f9 803cc820 cmp byte ptr [rax + rcx*8], 0x20
14590d1fd 7411 je 0x14590d210
14590d1ff 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
14590d204 75ea jne 0x14590d1f0
14590d206 eb15 jmp 0x14590d21d
14590d208 0f1f840000000000 nop dword ptr [rax + rax]
14590d210 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14590d216 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
14590d21b 75d3 jne 0x14590d1f0
14590d21d f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14590d223 ebcb jmp 0x14590d1f0
14590d225 f6c201 test dl, 1
14590d228 740c je 0x14590d236
14590d22a 803cc820 cmp byte ptr [rax + rcx*8], 0x20
14590d22e 7506 jne 0x14590d236
14590d230 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14590d236 0f57c9 xorps xmm1, xmm1
14590d239 0f2ec1 ucomiss xmm0, xmm1
14590d23c 0f869b000000 jbe 0x14590d2dd
14590d242 488b86d8010000 mov rax, qword ptr [rsi + 0x1d8]
14590d249 4885c0 test rax, rax
14590d24c 0f848b000000 je 0x14590d2dd
14590d252 488b8ed0010000 mov rcx, qword ptr [rsi + 0x1d0]
14590d259 48c1e004 shl rax, 4
14590d25d 31d2 xor edx, edx
14590d25f 49b8736f756c5f6c696e movabs r8, 0x6e696c5f6c756f73
14590d269 eb0e jmp 0x14590d279
14590d26b 0f1f440000 nop dword ptr [rax + rax]
14590d270 4883c210 add rdx, 0x10
14590d274 4839d0 cmp rax, rdx
14590d277 7464 je 0x14590d2dd
14590d279 4c8b0c11 mov r9, qword ptr [rcx + rdx]
14590d27d 4983793809 cmp qword ptr [r9 + 0x38], 9
14590d282 75ec jne 0x14590d270
14590d284 4d8b4930 mov r9, qword ptr [r9 + 0x30]
14590d288 4d8b11 mov r10, qword ptr [r9]
14590d28b 4d31c2 xor r10, r8
14590d28e 450fb64908 movzx r9d, byte ptr [r9 + 8]
14590d293 4983f16b xor r9, 0x6b
14590d297 4d09d1 or r9, r10
14590d29a 75d4 jne 0x14590d270
14590d29c 0fb65c1108 movzx ebx, byte ptr [rcx + rdx + 8]
14590d2a1 84db test bl, bl
14590d2a3 7438 je 0x14590d2dd
14590d2a5 4d39fd cmp r13, r15
14590d2a8 750e jne 0x14590d2b8
14590d2aa 488d4d30 lea rcx, [rbp + 0x30]
14590d2ae e80d334300 call 0x145d405c0
14590d2b3 90 nop
14590d2b4 488b7d38 mov rdi, qword ptr [rbp + 0x38]
14590d2b8 0fb6c3 movzx eax, bl
14590d2bb 0f57c0 xorps xmm0, xmm0
14590d2be f30f2ac0 cvtsi2ss xmm0, eax
14590d2c2 f30f5905be345e00 mulss xmm0, dword ptr [rip + 0x5e34be]
14590d2ca 42c604ef05 mov byte ptr [rdi + r13*8], 5
14590d2cf f3420f1144ef04 movss dword ptr [rdi + r13*8 + 4], xmm0
14590d2d6 49ffc5 inc r13
14590d2d9 4c896d40 mov qword ptr [rbp + 0x40], r13
14590d2dd 4c8b7658 mov r14, qword ptr [rsi + 0x58]
14590d2e1 4c8b7e60 mov r15, qword ptr [rsi + 0x60]
14590d2e5 49c1e704 shl r15, 4
14590d2e9 4d01f7 add r15, r14
14590d2ec 4c8ba640080000 mov r12, qword ptr [rsi + 0x840]
14590d2f3 488bbe38080000 mov rdi, qword ptr [rsi + 0x838]
14590d2fa 4a8d1ced00000000 lea rbx, [r13*8]
14590d302 488d4d30 lea rcx, [rbp + 0x30]
14590d306 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14590d310 4983c610 add r14, 0x10
14590d314 498d46f0 lea rax, [r14 - 0x10]
14590d318 4c39f8 cmp rax, r15
14590d31b 746c je 0x14590d389
14590d31d 0f2e700c ucomiss xmm6, dword ptr [rax + 0xc]
14590d321 73ed jae 0x14590d310
14590d323 488b00 mov rax, qword ptr [rax]
14590d326 4c39e0 cmp rax, r12
14590d329 73e5 jae 0x14590d310
14590d32b 48c1e006 shl rax, 6
14590d32f 803c070f cmp byte ptr [rdi + rax], 0xf
14590d333 75db jne 0x14590d310
14590d335 48897570 mov qword ptr [rbp + 0x70], rsi
14590d339 4801f8 add rax, rdi
14590d33c 458b46f8 mov r8d, dword ptr [r14 - 8]
14590d340 4c89ea mov rdx, r13
14590d343 440fb66801 movzx r13d, byte ptr [rax + 1]
14590d348 0f57ff xorps xmm7, xmm7
14590d34b f3490f2af8 cvtsi2ss xmm7, r8
14590d350 f30f597804 mulss xmm7, dword ptr [rax + 4]
14590d355 4889d6 mov rsi, rdx
14590d358 483b5530 cmp rdx, qword ptr [rbp + 0x30]
14590d35c 7509 jne 0x14590d367
14590d35e e85d324300 call 0x145d405c0
14590d363 488d4d30 lea rcx, [rbp + 0x30]
14590d367 488b4538 mov rax, qword ptr [rbp + 0x38]
14590d36b 44882cf0 mov byte ptr [rax + rsi*8], r13b
14590d36f 4989f5 mov r13, rsi
14590d372 f30f117cf004 movss dword ptr [rax + rsi*8 + 4], xmm7
14590d378 49ffc5 inc r13
14590d37b 4c896d40 mov qword ptr [rbp + 0x40], r13
14590d37f 4883c308 add rbx, 8
14590d383 488b7570 mov rsi, qword ptr [rbp + 0x70]
14590d387 eb87 jmp 0x14590d310
14590d389 8b86f0040000 mov eax, dword ptr [rsi + 0x4f0]
14590d38f 0f57c0 xorps xmm0, xmm0
14590d392 f3480f2ac0 cvtsi2ss xmm0, rax
14590d397 f30f5805792b5d00 addss xmm0, dword ptr [rip + 0x5d2b79]
14590d39f f3440f102d14266000 movss xmm13, dword ptr [rip + 0x602614]
14590d3a8 f3440f10259f705f00 movss xmm12, dword ptr [rip + 0x5f709f]
14590d3b1 f3440f59e0 mulss xmm12, xmm0
14590d3b6 f30f100df22a5d00 movss xmm1, dword ptr [rip + 0x5d2af2]
14590d3be 0f294d70 movaps xmmword ptr [rbp + 0x70], xmm1
14590d3c2 f3440f58e1 addss xmm12, xmm1
14590d3c7 488b7d10 mov rdi, qword ptr [rbp + 0x10]
14590d3cb f30f109f84000000 movss xmm3, dword ptr [rdi + 0x84]
14590d3d3 f3440f10152c2d5d00 movss xmm10, dword ptr [rip + 0x5d2d2c]
14590d3dc f3480f2cc8 cvttss2si rcx, xmm0
14590d3e1 31c0 xor eax, eax
14590d3e3 450f57c0 xorps xmm8, xmm8
14590d3e7 410f2ec0 ucomiss xmm0, xmm8
14590d3eb 0f42c8 cmovb ecx, eax
14590d3ee f3440f59d0 mulss xmm10, xmm0
14590d3f3 440f28d8 movaps xmm11, xmm0
14590d3f7 0f2e05b6375f00 ucomiss xmm0, dword ptr [rip + 0x5f37b6]
14590d3fe baffffffff mov edx, 0xffffffff
14590d403 0f46d1 cmovbe edx, ecx
14590d406 f3440f5815316d5e00 addss xmm10, dword ptr [rip + 0x5e6d31]
14590d40f ffc2 inc edx
14590d411 41b889888888 mov r8d, 0x88888889
14590d417 4c0fafc2 imul r8, rdx
14590d41b 49c1e823 shr r8, 0x23
14590d41f 4183f803 cmp r8d, 3
14590d423 b903000000 mov ecx, 3
14590d428 410f42c8 cmovb ecx, r8d
14590d42c 488b5560 mov rdx, qword ptr [rbp + 0x60]
14590d430 4c8b4228 mov r8, qword ptr [rdx + 0x28]
14590d434 4d85c0 test r8, r8
14590d437 0f84d5000000 je 0x14590d512
14590d43d 450f28fd movaps xmm15, xmm13
14590d441 488b5220 mov rdx, qword ptr [rdx + 0x20]
14590d445 4e8d04c2 lea r8, [rdx + r8*8]
14590d449 f3440f102d6a256000 movss xmm13, dword ptr [rip + 0x60256a]
14590d452 f30f102d16315e00 movss xmm5, dword ptr [rip + 0x5e3116]
14590d45a 450f57c9 xorps xmm9, xmm9
14590d45e f30f103d4a2a5d00 movss xmm7, dword ptr [rip + 0x5d2a4a]
14590d466 4c8d0daf55a201 lea r9, [rip + 0x1a255af]
14590d46d 0f28e7 movaps xmm4, xmm7
14590d470 0f28cf movaps xmm1, xmm7
14590d473 0f28c7 movaps xmm0, xmm7
14590d476 0f57d2 xorps xmm2, xmm2
14590d479 0f295550 movaps xmmword ptr [rbp + 0x50], xmm2
14590d47d 440f28f7 movaps xmm14, xmm7
14590d481 0f295560 movaps xmmword ptr [rbp + 0x60], xmm2
14590d485 eb26 jmp 0x14590d4ad
14590d487 0f287560 movaps xmm6, xmmword ptr [rbp + 0x60]
14590d48b f30f58f2 addss xmm6, xmm2
14590d48f 0f297560 movaps xmmword ptr [rbp + 0x60], xmm6
14590d493 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14590d4a0 4883c208 add rdx, 8
14590d4a4 4c39c2 cmp rdx, r8
14590d4a7 0f8498000000 je 0x14590d545
14590d4ad 448b12 mov r10d, dword ptr [rdx]
14590d4b0 f30f105204 movss xmm2, dword ptr [rdx + 4]
14590d4b5 4f631491 movsxd r10, dword ptr [r9 + r10*4]
14590d4b9 4d01ca add r10, r9
14590d4bc 41ffe2 jmp r10
14590d4bf f30f58e2 addss xmm4, xmm2
14590d4c3 ebdb jmp 0x14590d4a0
14590d4c5 f30f58ea addss xmm5, xmm2
14590d4c9 ebd5 jmp 0x14590d4a0
14590d4cb f3440f58f2 addss xmm14, xmm2
14590d4d0 ebce jmp 0x14590d4a0
14590d4d2 f3440f58ca addss xmm9, xmm2
14590d4d7 ebc7 jmp 0x14590d4a0
14590d4d9 f30f58ca addss xmm1, xmm2
14590d4dd ebc1 jmp 0x14590d4a0
14590d4df f30f58d7 addss xmm2, xmm7
14590d4e3 f3440f59ea mulss xmm13, xmm2
14590d4e8 ebb6 jmp 0x14590d4a0
14590d4ea f3440f58e2 addss xmm12, xmm2
14590d4ef ebaf jmp 0x14590d4a0
14590d4f1 f30f58da addss xmm3, xmm2
14590d4f5 eba9 jmp 0x14590d4a0
14590d4f7 f3440f58d2 addss xmm10, xmm2
14590d4fc eba2 jmp 0x14590d4a0
14590d4fe 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
14590d502 f30f58f2 addss xmm6, xmm2
14590d506 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
14590d50a eb94 jmp 0x14590d4a0
14590d50c f30f58c2 addss xmm0, xmm2
14590d510 eb8e jmp 0x14590d4a0
14590d512 f30f102d56305e00 movss xmm5, dword ptr [rip + 0x5e3056]
14590d51a 0f57c0 xorps xmm0, xmm0
14590d51d 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
14590d521 f30f101587295d00 movss xmm2, dword ptr [rip + 0x5d2987]
14590d529 440f28f2 movaps xmm14, xmm2
14590d52d 0f57c9 xorps xmm1, xmm1
14590d530 0f294d50 movaps xmmword ptr [rbp + 0x50], xmm1
14590d534 0f28c2 movaps xmm0, xmm2
14590d537 450f28fd movaps xmm15, xmm13
14590d53b 0f28ca movaps xmm1, xmm2
14590d53e 450f57c9 xorps xmm9, xmm9
14590d542 0f28e2 movaps xmm4, xmm2
14590d545 410f28fb movaps xmm7, xmm11
14590d549 f3410f59ff mulss xmm7, xmm15
14590d54e 488b9690030000 mov rdx, qword ptr [rsi + 0x390]
14590d555 4885d2 test rdx, rdx
14590d558 7448 je 0x14590d5a2
14590d55a 4c8b8688030000 mov r8, qword ptr [rsi + 0x388]
14590d561 48c1e203 shl rdx, 3
14590d565 31c0 xor eax, eax
14590d567 f30f101541295d00 movss xmm2, dword ptr [rip + 0x5d2941]
14590d56f 0f295570 movaps xmmword ptr [rbp + 0x70], xmm2
14590d573 f30f1035352d5d00 movss xmm6, dword ptr [rip + 0x5d2d35]
14590d57b 450f57c0 xorps xmm8, xmm8
14590d57f 458b1400 mov r10d, dword ptr [r8 + rax]
14590d583 4c8d0dc254a201 lea r9, [rip + 0x1a254c2]
14590d58a 4f631c91 movsxd r11, dword ptr [r9 + r10*4]
14590d58e 4d01cb add r11, r9
14590d591 0f57d2 xorps xmm2, xmm2
14590d594 f30f119588000000 movss dword ptr [rbp + 0x88], xmm2
14590d59c 4531d2 xor r10d, r10d
14590d59f 41ffe3 jmp r11
14590d5a2 f30f1035062d5d00 movss xmm6, dword ptr [rip + 0x5d2d06]
14590d5aa 0f57d2 xorps xmm2, xmm2
14590d5ad f30f119588000000 movss dword ptr [rbp + 0x88], xmm2
14590d5b5 eb00 jmp 0x14590d5b7
14590d5b7 488b5530 mov rdx, qword ptr [rbp + 0x30]
14590d5bb 48895508 mov qword ptr [rbp + 8], rdx
14590d5bf f30f58bf80000000 addss xmm7, dword ptr [rdi + 0x80]
14590d5c7 4c8b7538 mov r14, qword ptr [rbp + 0x38]
14590d5cb 4c8b8660030000 mov r8, qword ptr [rsi + 0x360]
14590d5d2 0f57d2 xorps xmm2, xmm2
14590d5d5 f30f11958c000000 movss dword ptr [rbp + 0x8c], xmm2
14590d5dd 4d85c0 test r8, r8
14590d5e0 744b je 0x14590d62d
14590d5e2 0f297510 movaps xmmword ptr [rbp + 0x10], xmm6
14590d5e6 f30f11bd94000000 movss dword ptr [rbp + 0x94], xmm7
14590d5ee 440f294d20 movaps xmmword ptr [rbp + 0x20], xmm9
14590d5f3 488b9658030000 mov rdx, qword ptr [rsi + 0x358]
14590d5fa 49c1e003 shl r8, 3
14590d5fe 4f8d0440 lea r8, [r8 + r8*2]
14590d602 0f2955f0 movaps xmmword ptr [rbp - 0x10], xmm2
14590d606 4531c9 xor r9d, r9d
14590d609 f3460f104c0a10 movss xmm9, dword ptr [rdx + r9 + 0x10]
14590d610 4e8b1c0a mov r11, qword ptr [rdx + r9]
14590d614 410fb67b44 movzx edi, byte ptr [r11 + 0x44]
14590d619 4c8d156054a201 lea r10, [rip + 0x1a25460]
14590d620 49633cba movsxd rdi, dword ptr [r10 + rdi*4]
14590d624 4c01d7 add rdi, r10
14590d627 450f57ff xorps xmm15, xmm15
14590d62b ffe7 jmp rdi
14590d62d 450f57db xorps xmm11, xmm11
14590d631 0f2955c0 movaps xmmword ptr [rbp - 0x40], xmm2
14590d635 f30f10153b2d5d00 movss xmm2, dword ptr [rip + 0x5d2d3b]
14590d63d 4d85ed test r13, r13
14590d640 0f85cc010000 jne 0x14590d812
14590d646 0f297510 movaps xmmword ptr [rbp + 0x10], xmm6
14590d64a 0f295da0 movaps xmmword ptr [rbp - 0x60], xmm3
14590d64e 0f2965b0 movaps xmmword ptr [rbp - 0x50], xmm4
14590d652 410f28e1 movaps xmm4, xmm9
14590d656 0f294dd0 movaps xmmword ptr [rbp - 0x30], xmm1
14590d65a f30f115520 movss dword ptr [rbp + 0x20], xmm2
14590d65f 0f57c9 xorps xmm1, xmm1
14590d662 f30f118d94000000 movss dword ptr [rbp + 0x94], xmm1
14590d66a f30f118d90000000 movss dword ptr [rbp + 0x90], xmm1
14590d672 e9dd010000 jmp 0x14590d854
14590d677 f3470f58641004 addss xmm12, dword ptr [r8 + r10 + 4]
14590d67e 4983c208 add r10, 8
14590d682 4c39d2 cmp rdx, r10
14590d685 0f8544010000 jne 0x14590d7cf
14590d68b e927ffffff jmp 0x14590d5b7
14590d690 f3470f584c1004 addss xmm9, dword ptr [r8 + r10 + 4]
14590d697 4983c208 add r10, 8
14590d69b 4c39d2 cmp rdx, r10
14590d69e 0f852b010000 jne 0x14590d7cf
14590d6a4 e90effffff jmp 0x14590d5b7
14590d6a9 f30f109588000000 movss xmm2, dword ptr [rbp + 0x88]
14590d6b1 f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
14590d6b8 f30f119588000000 movss dword ptr [rbp + 0x88], xmm2
14590d6c0 4983c208 add r10, 8
14590d6c4 4c39d2 cmp rdx, r10
14590d6c7 0f8502010000 jne 0x14590d7cf
14590d6cd e9e5feffff jmp 0x14590d5b7
14590d6d2 f3430f586c1004 addss xmm5, dword ptr [r8 + r10 + 4]
14590d6d9 4983c208 add r10, 8
14590d6dd 4c39d2 cmp rdx, r10
14590d6e0 0f85e9000000 jne 0x14590d7cf
14590d6e6 e9ccfeffff jmp 0x14590d5b7
14590d6eb f3430f58741004 addss xmm6, dword ptr [r8 + r10 + 4]
14590d6f2 4983c208 add r10, 8
14590d6f6 4c39d2 cmp rdx, r10
14590d6f9 0f85d0000000 jne 0x14590d7cf
14590d6ff e9b3feffff jmp 0x14590d5b7
14590d704 f3430f584c1004 addss xmm1, dword ptr [r8 + r10 + 4]
14590d70b 4983c208 add r10, 8
14590d70f 4c39d2 cmp rdx, r10
14590d712 0f85b7000000 jne 0x14590d7cf
14590d718 e99afeffff jmp 0x14590d5b7
14590d71d f3430f585c1004 addss xmm3, dword ptr [r8 + r10 + 4]
14590d724 4983c208 add r10, 8
14590d728 4c39d2 cmp rdx, r10
14590d72b 0f859e000000 jne 0x14590d7cf
14590d731 e981feffff jmp 0x14590d5b7
14590d736 f3470f58541004 addss xmm10, dword ptr [r8 + r10 + 4]
14590d73d 4983c208 add r10, 8
14590d741 4c39d2 cmp rdx, r10
14590d744 0f8585000000 jne 0x14590d7cf
14590d74a e968feffff jmp 0x14590d5b7
14590d74f 410f28d5 movaps xmm2, xmm13
14590d753 f3470f106c1004 movss xmm13, dword ptr [r8 + r10 + 4]
14590d75a f3440f582d4d275d00 addss xmm13, dword ptr [rip + 0x5d274d]
14590d763 f3440f59ea mulss xmm13, xmm2
14590d768 4983c208 add r10, 8
14590d76c 4c39d2 cmp rdx, r10
14590d76f 755e jne 0x14590d7cf
14590d771 e941feffff jmp 0x14590d5b7
14590d776 f3470f58741004 addss xmm14, dword ptr [r8 + r10 + 4]
14590d77d 4983c208 add r10, 8
14590d781 4c39d2 cmp rdx, r10
14590d784 7549 jne 0x14590d7cf
14590d786 e92cfeffff jmp 0x14590d5b7
14590d78b 0f285570 movaps xmm2, xmmword ptr [rbp + 0x70]
14590d78f f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
14590d796 0f295570 movaps xmmword ptr [rbp + 0x70], xmm2
14590d79a 4983c208 add r10, 8
14590d79e 4c39d2 cmp rdx, r10
14590d7a1 752c jne 0x14590d7cf
14590d7a3 e90ffeffff jmp 0x14590d5b7
14590d7a8 4303441004 add eax, dword ptr [r8 + r10 + 4]
14590d7ad 4983c208 add r10, 8
14590d7b1 4c39d2 cmp rdx, r10
14590d7b4 7519 jne 0x14590d7cf
14590d7b6 e9fcfdffff jmp 0x14590d5b7
14590d7bb f3470f58441004 addss xmm8, dword ptr [r8 + r10 + 4]
14590d7c2 4983c208 add r10, 8
14590d7c6 4c39d2 cmp rdx, r10
14590d7c9 0f84e8fdffff je 0x14590d5b7
14590d7cf 478b1c10 mov r11d, dword ptr [r8 + r10]
14590d7d3 4f631c99 movsxd r11, dword ptr [r9 + r11*4]
14590d7d7 4d01cb add r11, r9
14590d7da 41ffe3 jmp r11
14590d7dd f3440f5d3d922c5e00 minss xmm15, dword ptr [rip + 0x5e2c92]
14590d7e6 440f297dc0 movaps xmmword ptr [rbp - 0x40], xmm15
14590d7eb 440f284d20 movaps xmm9, xmmword ptr [rbp + 0x20]
14590d7f0 f30f10bd94000000 movss xmm7, dword ptr [rbp + 0x94]
14590d7f8 0f287510 movaps xmm6, xmmword ptr [rbp + 0x10]
14590d7fc 440f285df0 movaps xmm11, xmmword ptr [rbp - 0x10]
14590d801 f30f10156f2b5d00 movss xmm2, dword ptr [rip + 0x5d2b6f]
14590d809 4d85ed test r13, r13
14590d80c 0f8434feffff je 0x14590d646
14590d812 498d5604 lea rdx, [r14 + 4]
14590d816 f30f10155a2b5d00 movss xmm2, dword ptr [rip + 0x5d2b5a]
14590d81e f30f115520 movss dword ptr [rbp + 0x20], xmm2
14590d823 0f57d2 xorps xmm2, xmm2
14590d826 f30f11958c000000 movss dword ptr [rbp + 0x8c], xmm2
14590d82e 440fb64afc movzx r9d, byte ptr [rdx - 4]
14590d833 4c8d059652a201 lea r8, [rip + 0x1a25296]
14590d83a 4f630c88 movsxd r9, dword ptr [r8 + r9*4]
14590d83e 4d01c1 add r9, r8
14590d841 f30f119594000000 movss dword ptr [rbp + 0x94], xmm2
14590d849 f30f119590000000 movss dword ptr [rbp + 0x90], xmm2
14590d851 41ffe1 jmp r9
14590d854 f30f10969c0b0000 movss xmm2, dword ptr [rsi + 0xb9c]
14590d85c 4c8b86a0030000 mov r8, qword ptr [rsi + 0x3a0]
14590d863 488b96a8030000 mov rdx, qword ptr [rsi + 0x3a8]
14590d86a 488d1452 lea rdx, [rdx + rdx*2]
14590d86e 498d14d0 lea rdx, [r8 + rdx*8]
14590d872 f3440f100d35265d00 movss xmm9, dword ptr [rip + 0x5d2635]
14590d87b 440f295df0 movaps xmmword ptr [rbp - 0x10], xmm11
14590d880 f3450f58cb addss xmm9, xmm11
14590d885 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
14590d889 440f28d8 movaps xmm11, xmm0
14590d88d 410f28c2 movaps xmm0, xmm10
14590d891 0f285d60 movaps xmm3, xmmword ptr [rbp + 0x60]
14590d895 4d89c1 mov r9, r8
14590d898 0f1f840000000000 nop dword ptr [rax + rax]
14590d8a0 4939d1 cmp r9, rdx
14590d8a3 0f84db000000 je 0x14590d984
14590d8a9 4d8d4118 lea r8, [r9 + 0x18]
14590d8ad 410f2e5110 ucomiss xmm2, dword ptr [r9 + 0x10]
14590d8b2 4d89c1 mov r9, r8
14590d8b5 73e9 jae 0x14590d8a0
14590d8b7 410f28dd movaps xmm3, xmm13
14590d8bb 0f28f5 movaps xmm6, xmm5
14590d8be 0f28e9 movaps xmm5, xmm1
14590d8c1 450f28f8 movaps xmm15, xmm8
14590d8c5 458b48e8 mov r9d, dword ptr [r8 - 0x18]
14590d8c9 4183f908 cmp r9d, 8
14590d8cd 746a je 0x14590d939
14590d8cf 440f284570 movaps xmm8, xmmword ptr [rbp + 0x70]
14590d8d4 4183f909 cmp r9d, 9
14590d8d8 750f jne 0x14590d8e9
14590d8da f3410f1048ec movss xmm1, dword ptr [r8 - 0x14]
14590d8e0 f3410f59c9 mulss xmm1, xmm9
14590d8e5 f30f58e1 addss xmm4, xmm1
14590d8e9 458b48f4 mov r9d, dword ptr [r8 - 0xc]
14590d8ed 4181f9d15b0000 cmp r9d, 0x5bd1
14590d8f4 440f294570 movaps xmmword ptr [rbp + 0x70], xmm8
14590d8f9 7465 je 0x14590d960
14590d8fb 4181f99b5b0000 cmp r9d, 0x5b9b
14590d902 450f28c7 movaps xmm8, xmm15
14590d906 0f28cd movaps xmm1, xmm5
14590d909 0f28ee movaps xmm5, xmm6
14590d90c 440f28d0 movaps xmm10, xmm0
14590d910 410f28c3 movaps xmm0, xmm11
14590d914 440f28eb movaps xmm13, xmm3
14590d918 0f856bffffff jne 0x14590d889
14590d91e 0f28f1 movaps xmm6, xmm1
14590d921 0f284dd0 movaps xmm1, xmmword ptr [rbp - 0x30]
14590d925 f30f580d4b2a5d00 addss xmm1, dword ptr [rip + 0x5d2a4b]
14590d92d 0f294dd0 movaps xmmword ptr [rbp - 0x30], xmm1
14590d931 0f28ce movaps xmm1, xmm6
14590d934 e950ffffff jmp 0x14590d889
14590d939 440f284570 movaps xmm8, xmmword ptr [rbp + 0x70]
14590d93e f3410f1048ec movss xmm1, dword ptr [r8 - 0x14]
14590d944 f3410f59c9 mulss xmm1, xmm9
14590d949 f3440f58e1 addss xmm12, xmm1
14590d94e 458b48f4 mov r9d, dword ptr [r8 - 0xc]
14590d952 4181f9d15b0000 cmp r9d, 0x5bd1
14590d959 440f294570 movaps xmmword ptr [rbp + 0x70], xmm8
14590d95e 759b jne 0x14590d8fb
14590d960 f3440f5825132a5d00 addss xmm12, dword ptr [rip + 0x5d2a13]
14590d969 450f28c7 movaps xmm8, xmm15
14590d96d 0f28cd movaps xmm1, xmm5
14590d970 0f28ee movaps xmm5, xmm6
14590d973 440f28d0 movaps xmm10, xmm0
14590d977 410f28c3 movaps xmm0, xmm11
14590d97b 440f28eb movaps xmm13, xmm3
14590d97f e905ffffff jmp 0x14590d889
14590d984 f3440f10bd88000000 movss xmm15, dword ptr [rbp + 0x88]
14590d98d f3440f58ff addss xmm15, xmm7
14590d992 f3440f597db0 mulss xmm15, dword ptr [rbp - 0x50]
14590d998 f3440f100d0f255d00 movss xmm9, dword ptr [rip + 0x5d250f]
14590d9a1 f3410f5ff9 maxss xmm7, xmm9
14590d9a6 440f297550 movaps xmmword ptr [rbp + 0x50], xmm14
14590d9ab 0f28f1 movaps xmm6, xmm1
14590d9ae 0f295d60 movaps xmmword ptr [rbp + 0x60], xmm3
14590d9b2 450f28f7 movaps xmm14, xmm15
14590d9b6 f3440f5ef7 divss xmm14, xmm7
14590d9bb f30f108d90000000 movss xmm1, dword ptr [rbp + 0x90]
14590d9c3 f3410f59cf mulss xmm1, xmm15
14590d9c8 f30f58c1 addss xmm0, xmm1
14590d9cc f3410f58e1 addss xmm4, xmm9
14590d9d1 31d2 xor edx, edx
14590d9d3 410f2ee9 ucomiss xmm5, xmm9
14590d9d7 f3440f5ecc divss xmm9, xmm4
14590d9dc 0f285da0 movaps xmm3, xmmword ptr [rbp - 0x60]
14590d9e0 0f28fb movaps xmm7, xmm3
14590d9e3 f30f104d20 movss xmm1, dword ptr [rbp + 0x20]
14590d9e8 f30f5cf9 subss xmm7, xmm1
14590d9ec 0f57d2 xorps xmm2, xmm2
14590d9ef f30f5ffa maxss xmm7, xmm2
14590d9f3 f30f10a58c000000 movss xmm4, dword ptr [rbp + 0x8c]
14590d9fb f30f59e7 mulss xmm4, xmm7
14590d9ff 0f28fb movaps xmm7, xmm3
14590da02 f30f5df9 minss xmm7, xmm1
14590da06 440f28d7 movaps xmm10, xmm7
14590da0a f3440fc2d703 cmpunordss xmm10, xmm7
14590da10 410f28cd movaps xmm1, xmm13
14590da14 450f28ea movaps xmm13, xmm10
14590da18 440f55ef andnps xmm13, xmm7
14590da1c 440f54d3 andps xmm10, xmm3
14590da20 450f56d5 orps xmm10, xmm13
14590da24 410f28fa movaps xmm7, xmm10
14590da28 f3440f599594000000 mulss xmm10, dword ptr [rbp + 0x94]
14590da31 f3440f5e1552295d00 divss xmm10, dword ptr [rip + 0x5d2952]
14590da3a f3440f58d4 addss xmm10, xmm4
14590da3f f3450f58d4 addss xmm10, xmm12
14590da44 410f28e7 movaps xmm4, xmm15
14590da48 f30f5ca690040000 subss xmm4, dword ptr [rsi + 0x490]
14590da50 f3440f11be90040000 movss dword ptr [rsi + 0x490], xmm15
14590da59 f3440f119694040000 movss dword ptr [rsi + 0x494], xmm10
14590da62 f3440f118e98040000 movss dword ptr [rsi + 0x498], xmm9
14590da6b f3440f100da4245d00 movss xmm9, dword ptr [rip + 0x5d24a4]
14590da74 f3450f58f1 addss xmm14, xmm9
14590da79 f3440f58cd addss xmm9, xmm5
14590da7e 0f285d10 movaps xmm3, xmmword ptr [rbp + 0x10]
14590da82 f3440f58cb addss xmm9, xmm3
14590da87 440f2815b1f17400 movaps xmm10, xmmword ptr [rip + 0x74f1b1]
14590da8f 450f14d1 unpcklps xmm10, xmm9
14590da93 0f14eb unpcklps xmm5, xmm3
14590da96 0f97c2 seta dl
14590da99 66440f6eca movd xmm9, edx
14590da9e 66450f70c900 pshufd xmm9, xmm9, 0
14590daa4 66410f72f11f pslld xmm9, 0x1f
14590daaa 66410f72e11f psrad xmm9, 0x1f
14590dab0 450f54d1 andps xmm10, xmm9
14590dab4 440f55cd andnps xmm9, xmm5
14590dab8 450f56ca orps xmm9, xmm10
14590dabc 440f138e9c040000 movlps qword ptr [rsi + 0x49c], xmm9
14590dac4 0f285dd0 movaps xmm3, xmmword ptr [rbp - 0x30]
14590dac8 f30f5d1df417a201 minss xmm3, dword ptr [rip + 0x1a217f4]
14590dad0 f30f119ea4040000 movss dword ptr [rsi + 0x4a4], xmm3
14590dad8 f30f118ea8040000 movss dword ptr [rsi + 0x4a8], xmm1
14590dae0 f3440f119eac040000 movss dword ptr [rsi + 0x4ac], xmm11
14590dae9 f30f11beb0040000 movss dword ptr [rsi + 0x4b0], xmm7
14590daf1 f30f1186b4040000 movss dword ptr [rsi + 0x4b4], xmm0
14590daf9 0f284570 movaps xmm0, xmmword ptr [rbp + 0x70]
14590dafd f30f1186b8040000 movss dword ptr [rsi + 0x4b8], xmm0
14590db05 f30f11b6bc040000 movss dword ptr [rsi + 0x4bc], xmm6
14590db0d 0f284550 movaps xmm0, xmmword ptr [rbp + 0x50]
14590db11 f30f1186c0040000 movss dword ptr [rsi + 0x4c0], xmm0
14590db19 8986c4040000 mov dword ptr [rsi + 0x4c4], eax
14590db1f f3440f1186c8040000 movss dword ptr [rsi + 0x4c8], xmm8
14590db28 0f284560 movaps xmm0, xmmword ptr [rbp + 0x60]
14590db2c f30f1186cc040000 movss dword ptr [rsi + 0x4cc], xmm0
14590db34 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
14590db38 f30f1186d0040000 movss dword ptr [rsi + 0x4d0], xmm0
14590db40 898ed4040000 mov dword ptr [rsi + 0x4d4], ecx
14590db46 0f2845c0 movaps xmm0, xmmword ptr [rbp - 0x40]
14590db4a f30f1186d8040000 movss dword ptr [rsi + 0x4d8], xmm0
14590db52 f3440f11b6dc040000 movss dword ptr [rsi + 0x4dc], xmm14
14590db5b 0f2ee2 ucomiss xmm4, xmm2
14590db5e f30f108ef8040000 movss xmm1, dword ptr [rsi + 0x4f8]
14590db66 4c8975e8 mov qword ptr [rbp - 0x18], r14
14590db6a 760c jbe 0x14590db78
14590db6c f30f58cc addss xmm1, xmm4
14590db70 f30f118ef8040000 movss dword ptr [rsi + 0x4f8], xmm1
14590db78 0f28d1 movaps xmm2, xmm1
14590db7b f3410f5dd7 minss xmm2, xmm15
14590db80 0f28c2 movaps xmm0, xmm2
14590db83 f30fc2c203 cmpunordss xmm0, xmm2
14590db88 0f28e0 movaps xmm4, xmm0
14590db8b 0f55e2 andnps xmm4, xmm2
14590db8e 0f54c1 andps xmm0, xmm1
14590db91 0f56c4 orps xmm0, xmm4
14590db94 f30f1186f8040000 movss dword ptr [rsi + 0x4f8], xmm0
14590db9c f30f591dbc115e00 mulss xmm3, dword ptr [rip + 0x5e11bc]
14590dba4 0f28cb movaps xmm1, xmm3
14590dba7 f30f5c8e64050000 subss xmm1, dword ptr [rsi + 0x564]
14590dbaf 0f540dca7b5d00 andps xmm1, xmmword ptr [rip + 0x5d7bca]
14590dbb6 0f2e0dcb2b5e00 ucomiss xmm1, dword ptr [rip + 0x5e2bcb]
14590dbbd 0f8681000000 jbe 0x14590dc44
14590dbc3 f30f119e64050000 movss dword ptr [rsi + 0x564], xmm3
14590dbcb 448b8660050000 mov r8d, dword ptr [rsi + 0x560]
14590dbd2 418d4001 lea eax, [r8 + 1]
14590dbd6 898660050000 mov dword ptr [rsi + 0x560], eax
14590dbdc 488b9678040000 mov rdx, qword ptr [rsi + 0x478]
14590dbe3 488d4d30 lea rcx, [rbp + 0x30]
14590dbe7 e8240f0a00 call 0x1459aeb10
14590dbec 90 nop
14590dbed 488bbe40060000 mov rdi, qword ptr [rsi + 0x640]
14590dbf4 483bbe30060000 cmp rdi, qword ptr [rsi + 0x630]
14590dbfb 750d jne 0x14590dc0a
14590dbfd 488d8e30060000 lea rcx, [rsi + 0x630]
14590dc04 e8e7744000 call 0x145d150f0
14590dc09 90 nop
14590dc0a 488b8638060000 mov rax, qword ptr [rsi + 0x638]
14590dc11 4889f9 mov rcx, rdi
14590dc14 48c1e105 shl rcx, 5
14590dc18 0f104530 movups xmm0, xmmword ptr [rbp + 0x30]
14590dc1c 0f104d40 movups xmm1, xmmword ptr [rbp + 0x40]
14590dc20 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14590dc25 0f110408 movups xmmword ptr [rax + rcx], xmm0
14590dc29 48ffc7 inc rdi
14590dc2c 4889be40060000 mov qword ptr [rsi + 0x640], rdi
14590dc33 f3440f10be90040000 movss xmm15, dword ptr [rsi + 0x490]
14590dc3c f30f1086f8040000 movss xmm0, dword ptr [rsi + 0x4f8]
14590dc44 0f57ff xorps xmm7, xmm7
14590dc47 f30f5fc7 maxss xmm0, xmm7
14590dc4b e80b6a4000 call 0x145d1465b
14590dc50 f34c0f2cc0 cvttss2si r8, xmm0
14590dc55 31db xor ebx, ebx
14590dc57 0f2ec7 ucomiss xmm0, xmm7
14590dc5a 440f42c3 cmovb r8d, ebx
14590dc5e 0f2e054f2f5f00 ucomiss xmm0, dword ptr [rip + 0x5f2f4f]
14590dc65 41beffffffff mov r14d, 0xffffffff
14590dc6b 450f47c6 cmova r8d, r14d
14590dc6f 488dbe200b0000 lea rdi, [rsi + 0xb20]
14590dc76 4889f9 mov rcx, rdi
14590dc79 66ba1600 mov dx, 0x16
14590dc7d e86eb6efff call 0x1458092f0
14590dc82 90 nop
14590dc83 410f28c7 movaps xmm0, xmm15
14590dc87 e8cf694000 call 0x145d1465b
14590dc8c f34c0f2cc0 cvttss2si r8, xmm0
14590dc91 0f2ec7 ucomiss xmm0, xmm7
14590dc94 440f42c3 cmovb r8d, ebx
14590dc98 0f2e05152f5f00 ucomiss xmm0, dword ptr [rip + 0x5f2f15]
14590dc9f 450f47c6 cmova r8d, r14d
14590dca3 4889f9 mov rcx, rdi
14590dca6 66ba1c00 mov dx, 0x1c
14590dcaa e841b6efff call 0x1458092f0
14590dcaf 90 nop
14590dcb0 f30f10869c040000 movss xmm0, dword ptr [rsi + 0x49c]
14590dcb8 f30f590500275d00 mulss xmm0, dword ptr [rip + 0x5d2700]
14590dcc0 66410f7ec0 movd r8d, xmm0
14590dcc5 4889f9 mov rcx, rdi
14590dcc8 66ba5504 mov dx, 0x455
14590dccc e81fb6efff call 0x1458092f0
14590dcd1 90 nop
14590dcd2 488b5508 mov rdx, qword ptr [rbp + 8]
14590dcd6 4885d2 test rdx, rdx
14590dcd9 7413 je 0x14590dcee
14590dcdb 48c1e203 shl rdx, 3
14590dcdf 41b804000000 mov r8d, 4
14590dce5 488b4de8 mov rcx, qword ptr [rbp - 0x18]
14590dce9 e8e2446ffa call 0x1400021d0
14590dcee 0f28b5a0000000 movaps xmm6, xmmword ptr [rbp + 0xa0]
14590dcf5 0f28bdb0000000 movaps xmm7, xmmword ptr [rbp + 0xb0]
14590dcfc 440f2885c0000000 movaps xmm8, xmmword ptr [rbp + 0xc0]
14590dd04 440f288dd0000000 movaps xmm9, xmmword ptr [rbp + 0xd0]
14590dd0c 440f2895e0000000 movaps xmm10, xmmword ptr [rbp + 0xe0]
14590dd14 440f289df0000000 movaps xmm11, xmmword ptr [rbp + 0xf0]
14590dd1c 440f28a500010000 movaps xmm12, xmmword ptr [rbp + 0x100]
14590dd24 440f28ad10010000 movaps xmm13, xmmword ptr [rbp + 0x110]
14590dd2c 440f28b520010000 movaps xmm14, xmmword ptr [rbp + 0x120]
14590dd34 440f28bd30010000 movaps xmm15, xmmword ptr [rbp + 0x130]
14590dd3c 4881c4c8010000 add rsp, 0x1c8
14590dd43 5b pop rbx
14590dd44 5f pop rdi
14590dd45 5e pop rsi
14590dd46 415c pop r12
14590dd48 415d pop r13
14590dd4a 415e pop r14
14590dd4c 415f pop r15
14590dd4e 5d pop rbp
14590dd4f c3 ret
14590dd50 f3450f58e1 addss xmm12, xmm9
14590dd55 e9b6000000 jmp 0x14590de10
14590dd5a 0f285520 movaps xmm2, xmmword ptr [rbp + 0x20]
14590dd5e f3410f58d1 addss xmm2, xmm9
14590dd63 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
14590dd67 e9a4000000 jmp 0x14590de10
14590dd6c f3410f58e1 addss xmm4, xmm9
14590dd71 e99a000000 jmp 0x14590de10
14590dd76 f3410f58e9 addss xmm5, xmm9
14590dd7b e990000000 jmp 0x14590de10
14590dd80 0f285510 movaps xmm2, xmmword ptr [rbp + 0x10]
14590dd84 f3410f58d1 addss xmm2, xmm9
14590dd89 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
14590dd8d e97e000000 jmp 0x14590de10
14590dd92 f3410f58e1 addss xmm4, xmm9
14590dd97 f3440f590d386d6000 mulss xmm9, dword ptr [rip + 0x606d38]
14590dda0 f3440f5d0de7295e00 minss xmm9, dword ptr [rip + 0x5e29e7]
14590dda9 f3410f58d9 addss xmm3, xmm9
14590ddae eb60 jmp 0x14590de10
14590ddb0 f3450f58d1 addss xmm10, xmm9
14590ddb5 eb59 jmp 0x14590de10
14590ddb7 0f285570 movaps xmm2, xmmword ptr [rbp + 0x70]
14590ddbb f3410f58d1 addss xmm2, xmm9
14590ddc0 0f295570 movaps xmmword ptr [rbp + 0x70], xmm2
14590ddc4 eb4a jmp 0x14590de10
14590ddc6 f3450f58c1 addss xmm8, xmm9
14590ddcb eb43 jmp 0x14590de10
14590ddcd f3410f58c9 addss xmm1, xmm9
14590ddd2 eb3c jmp 0x14590de10
14590ddd4 f3440f580dd3205d00 addss xmm9, dword ptr [rip + 0x5d20d3]
14590dddd f3450f59e9 mulss xmm13, xmm9
14590dde2 eb2c jmp 0x14590de10
14590dde4 f3410f58c1 addss xmm0, xmm9
14590dde9 eb25 jmp 0x14590de10
14590ddeb f3450f58f1 addss xmm14, xmm9
14590ddf0 eb1e jmp 0x14590de10
14590ddf2 0f285550 movaps xmm2, xmmword ptr [rbp + 0x50]
14590ddf6 f3410f58d1 addss xmm2, xmm9
14590ddfb 0f295550 movaps xmmword ptr [rbp + 0x50], xmm2
14590ddff eb0f jmp 0x14590de10
14590de01 0f285560 movaps xmm2, xmmword ptr [rbp + 0x60]
14590de05 f3410f58d1 addss xmm2, xmm9
14590de0a 0f295560 movaps xmmword ptr [rbp + 0x60], xmm2
14590de0e 6690 nop
14590de10 4983c118 add r9, 0x18
14590de14 4d39c8 cmp r8, r9
14590de17 0f84c0f9ffff je 0x14590d7dd
14590de1d f3460f104c0a10 movss xmm9, dword ptr [rdx + r9 + 0x10]
14590de24 4e8b1c0a mov r11, qword ptr [rdx + r9]
14590de28 410fb67b44 movzx edi, byte ptr [r11 + 0x44]
14590de2d 49633cba movsxd rdi, dword ptr [r10 + rdi*4]
14590de31 4c01d7 add rdi, r10
14590de34 ffe7 jmp rdi
14590de36 0f28d3 movaps xmm2, xmm3
14590de39 f3410f107b40 movss xmm7, dword ptr [r11 + 0x40]
14590de3f f30f593d150f5e00 mulss xmm7, dword ptr [rip + 0x5e0f15]
14590de47 440f28dd movaps xmm11, xmm5
14590de4b 410f28f2 movaps xmm6, xmm10
14590de4f 450f28d1 movaps xmm10, xmm9
14590de53 f3440f5dd7 minss xmm10, xmm7
14590de58 410f28da movaps xmm3, xmm10
14590de5c f3410fc2da03 cmpunordss xmm3, xmm10
14590de62 0f28fb movaps xmm7, xmm3
14590de65 410f55fa andnps xmm7, xmm10
14590de69 440f28d6 movaps xmm10, xmm6
14590de6d 410f28eb movaps xmm5, xmm11
14590de71 410f54d9 andps xmm3, xmm9
14590de75 0f56df orps xmm3, xmm7
14590de78 f30f58da addss xmm3, xmm2
14590de7c f3440f590d3b775d00 mulss xmm9, dword ptr [rip + 0x5d773b]
14590de85 f3410f58e1 addss xmm4, xmm9
14590de8a eb84 jmp 0x14590de10
14590de8c f3450f58f9 addss xmm15, xmm9
14590de91 e97affffff jmp 0x14590de10
14590de96 0f2855f0 movaps xmm2, xmmword ptr [rbp - 0x10]
14590de9a f3410f58d1 addss xmm2, xmm9
14590de9f 0f2955f0 movaps xmmword ptr [rbp - 0x10], xmm2
14590dea3 e968ffffff jmp 0x14590de10
14590dea8 0f1f840000000000 nop dword ptr [rax + rax]
14590deb0 4883c3f8 add rbx, -8
14590deb4 741a je 0x14590ded0
14590deb6 4883c208 add rdx, 8
14590deba 440fb64afc movzx r9d, byte ptr [rdx - 4]
14590debf 4f630c88 movsxd r9, dword ptr [r8 + r9*4]
14590dec3 4d01c1 add r9, r8
14590dec6 41ffe1 jmp r9
14590dec9 f3440f5822 addss xmm12, dword ptr [rdx]
14590dece ebe0 jmp 0x14590deb0
14590ded0 0f297510 movaps xmmword ptr [rbp + 0x10], xmm6
14590ded4 0f295da0 movaps xmmword ptr [rbp - 0x60], xmm3
14590ded8 0f2965b0 movaps xmmword ptr [rbp - 0x50], xmm4
14590dedc 410f28e1 movaps xmm4, xmm9
14590dee0 0f294dd0 movaps xmmword ptr [rbp - 0x30], xmm1
14590dee4 e96bf9ffff jmp 0x14590d854
14590dee9 f30f109594000000 movss xmm2, dword ptr [rbp + 0x94]
14590def1 f30f5812 addss xmm2, dword ptr [rdx]
14590def5 f30f119594000000 movss dword ptr [rbp + 0x94], xmm2
14590defd ebb1 jmp 0x14590deb0
14590deff f3440f581a addss xmm11, dword ptr [rdx]
14590df04 ebaa jmp 0x14590deb0
14590df06 0f285550 movaps xmm2, xmmword ptr [rbp + 0x50]
14590df0a f30f5812 addss xmm2, dword ptr [rdx]
14590df0e 0f295550 movaps xmmword ptr [rbp + 0x50], xmm2
14590df12 eb9c jmp 0x14590deb0
14590df14 f30f581a addss xmm3, dword ptr [rdx]
14590df18 eb96 jmp 0x14590deb0
14590df1a f3440f5802 addss xmm8, dword ptr [rdx]
14590df1f eb8f jmp 0x14590deb0
14590df21 f30f5802 addss xmm0, dword ptr [rdx]
14590df25 eb89 jmp 0x14590deb0
14590df27 f30f582a addss xmm5, dword ptr [rdx]
14590df2b eb83 jmp 0x14590deb0
14590df2d f30f109590000000 movss xmm2, dword ptr [rbp + 0x90]
14590df35 f30f5812 addss xmm2, dword ptr [rdx]
14590df39 f30f119590000000 movss dword ptr [rbp + 0x90], xmm2
14590df41 e96affffff jmp 0x14590deb0
14590df46 f30f5832 addss xmm6, dword ptr [rdx]
14590df4a e961ffffff jmp 0x14590deb0
14590df4f 0f285570 movaps xmm2, xmmword ptr [rbp + 0x70]
14590df53 f30f5812 addss xmm2, dword ptr [rdx]
14590df57 0f295570 movaps xmmword ptr [rbp + 0x70], xmm2
14590df5b e950ffffff jmp 0x14590deb0
14590df60 f3440f580a addss xmm9, dword ptr [rdx]
14590df65 e946ffffff jmp 0x14590deb0
14590df6a f30f5822 addss xmm4, dword ptr [rdx]
14590df6e e93dffffff jmp 0x14590deb0
14590df73 f30f10958c000000 movss xmm2, dword ptr [rbp + 0x8c]
14590df7b f30f5812 addss xmm2, dword ptr [rdx]
14590df7f f30f11958c000000 movss dword ptr [rbp + 0x8c], xmm2
14590df87 e924ffffff jmp 0x14590deb0
14590df8c f3440f5812 addss xmm10, dword ptr [rdx]
14590df91 e91affffff jmp 0x14590deb0
14590df96 0f285560 movaps xmm2, xmmword ptr [rbp + 0x60]
14590df9a f30f5812 addss xmm2, dword ptr [rdx]
14590df9e 0f295560 movaps xmmword ptr [rbp + 0x60], xmm2
14590dfa2 e909ffffff jmp 0x14590deb0
14590dfa7 f30f580a addss xmm1, dword ptr [rdx]
14590dfab e900ffffff jmp 0x14590deb0
14590dfb0 f30f105520 movss xmm2, dword ptr [rbp + 0x20]
14590dfb5 f30f5812 addss xmm2, dword ptr [rdx]
14590dfb9 f30f115520 movss dword ptr [rbp + 0x20], xmm2
14590dfbe e9edfeffff jmp 0x14590deb0
14590dfc3 f3440f5832 addss xmm14, dword ptr [rdx]
14590dfc8 e9e3feffff jmp 0x14590deb0
14590dfcd 410f28d5 movaps xmm2, xmm13
14590dfd1 f3440f102a movss xmm13, dword ptr [rdx]
14590dfd6 f3440f582dd11e5d00 addss xmm13, dword ptr [rip + 0x5d1ed1]
14590dfdf f3440f59ea mulss xmm13, xmm2
14590dfe4 e9c7feffff jmp 0x14590deb0
