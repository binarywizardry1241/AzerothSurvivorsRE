14599ddf0 55 push rbp
14599ddf1 4157 push r15
14599ddf3 4156 push r14
14599ddf5 4154 push r12
14599ddf7 56 push rsi
14599ddf8 57 push rdi
14599ddf9 53 push rbx
14599ddfa 4881ecf0000000 sub rsp, 0xf0
14599de01 488dac2480000000 lea rbp, [rsp + 0x80]
14599de09 0f297560 movaps xmmword ptr [rbp + 0x60], xmm6
14599de0d 48c74558feffffff mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
14599de15 4889ce mov rsi, rcx
14599de18 0fb68a9a000000 movzx ecx, byte ptr [rdx + 0x9a]
14599de1f 84c9 test cl, cl
14599de21 0f8479030000 je 0x14599e1a0
14599de27 4889d7 mov rdi, rdx
14599de2a 4584c0 test r8b, r8b
14599de2d 7435 je 0x14599de64
14599de2f 410fb6d0 movzx edx, r8b
14599de33 0fb6c1 movzx eax, cl
14599de36 4138c8 cmp r8b, cl
14599de39 0f42c2 cmovb eax, edx
14599de3c 884557 mov byte ptr [rbp + 0x57], al
14599de3f 4c8b4720 mov r8, qword ptr [rdi + 0x20]
14599de43 4d85c0 test r8, r8
14599de46 742a je 0x14599de72
14599de48 488b5728 mov rdx, qword ptr [rdi + 0x28]
14599de4c 3c01 cmp al, 1
14599de4e 14ff adc al, 0xff
14599de50 0fb6c8 movzx ecx, al
14599de53 4839ca cmp rdx, rcx
14599de56 0f8684030000 jbe 0x14599e1e0
14599de5c f3410f100488 movss xmm0, dword ptr [r8 + rcx*4]
14599de62 eb15 jmp 0x14599de79
14599de64 b001 mov al, 1
14599de66 884557 mov byte ptr [rbp + 0x57], al
14599de69 4c8b4720 mov r8, qword ptr [rdi + 0x20]
14599de6d 4d85c0 test r8, r8
14599de70 75d6 jne 0x14599de48
14599de72 0fb6c0 movzx eax, al
14599de75 f30f2ac0 cvtsi2ss xmm0, eax
14599de79 f30f11450c movss dword ptr [rbp + 0xc], xmm0
14599de7e 488b4760 mov rax, qword ptr [rdi + 0x60]
14599de82 488b4f68 mov rcx, qword ptr [rdi + 0x68]
14599de86 48c1e106 shl rcx, 6
14599de8a 4801c1 add rcx, rax
14599de8d 488945d0 mov qword ptr [rbp - 0x30], rax
14599de91 48894dd8 mov qword ptr [rbp - 0x28], rcx
14599de95 488d450c lea rax, [rbp + 0xc]
14599de99 488945e0 mov qword ptr [rbp - 0x20], rax
14599de9d 488d4557 lea rax, [rbp + 0x57]
14599dea1 488945e8 mov qword ptr [rbp - 0x18], rax
14599dea5 488b5f70 mov rbx, qword ptr [rdi + 0x70]
14599dea9 4c8b7778 mov r14, qword ptr [rdi + 0x78]
14599dead 4889d9 mov rcx, rbx
14599deb0 4c89f2 mov rdx, r14
14599deb3 e818fffeff call 0x14598ddd0
14599deb8 4885c0 test rax, rax
14599debb 480f44c3 cmove rax, rbx
14599debf 4889d3 mov rbx, rdx
14599dec2 490f44de cmove rbx, r14
14599dec6 4885db test rbx, rbx
14599dec9 7910 jns 0x14599dedb
14599decb 4531e4 xor r12d, r12d
14599dece 4c89e1 mov rcx, r12
14599ded1 4889da mov rdx, rbx
14599ded4 e812b64000 call 0x145da94eb
14599ded9 0f0b ud2
14599dedb 7433 je 0x14599df10
14599dedd 4989c7 mov r15, rax
14599dee0 e81b4366fa call 0x140002200
14599dee5 41bc01000000 mov r12d, 1
14599deeb ba01000000 mov edx, 1
14599def0 4889d9 mov rcx, rbx
14599def3 e8c84266fa call 0x1400021c0
14599def8 4885c0 test rax, rax
14599defb 74d1 je 0x14599dece
14599defd 4989c6 mov r14, rax
14599df00 4889c1 mov rcx, rax
14599df03 4c89fa mov rdx, r15
14599df06 4989d8 mov r8, rbx
14599df09 e8cdc42600 call 0x145c0a3db
14599df0e eb06 jmp 0x14599df16
14599df10 41be01000000 mov r14d, 1
14599df16 48895d30 mov qword ptr [rbp + 0x30], rbx
14599df1a 4c897538 mov qword ptr [rbp + 0x38], r14
14599df1e 48895d40 mov qword ptr [rbp + 0x40], rbx
14599df22 488d4dd0 lea rcx, [rbp - 0x30]
14599df26 488d550c lea rdx, [rbp + 0xc]
14599df2a 4c8d4557 lea r8, [rbp + 0x57]
14599df2e e8ede3ffff call 0x14599c320
14599df33 a801 test al, 1
14599df35 0f8481000000 je 0x14599dfbc
14599df3b 488d4d10 lea rcx, [rbp + 0x10]
14599df3f 0f28c8 movaps xmm1, xmm0
14599df42 e8c94c0000 call 0x1459a2c10
14599df47 90 nop
14599df48 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14599df4c 488b4520 mov rax, qword ptr [rbp + 0x20]
14599df50 4889442430 mov qword ptr [rsp + 0x30], rax
14599df55 48894d48 mov qword ptr [rbp + 0x48], rcx
14599df59 48894c2428 mov qword ptr [rsp + 0x28], rcx
14599df5e 48c744242003000000 mov qword ptr [rsp + 0x20], 3
14599df67 4c8d0df2358801 lea r9, [rip + 0x18835f2]
14599df6e 488d4df0 lea rcx, [rbp - 0x10]
14599df72 4c89f2 mov rdx, r14
14599df75 4989d8 mov r8, rbx
14599df78 e813d1ffff call 0x14599b090
14599df7d 90 nop
14599df7e 4885db test rbx, rbx
14599df81 7411 je 0x14599df94
14599df83 41b801000000 mov r8d, 1
14599df89 4c89f1 mov rcx, r14
14599df8c 4889da mov rdx, rbx
14599df8f e83c4266fa call 0x1400021d0
14599df94 488b4500 mov rax, qword ptr [rbp]
14599df98 48894540 mov qword ptr [rbp + 0x40], rax
14599df9c 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
14599dfa0 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14599dfa4 488b5510 mov rdx, qword ptr [rbp + 0x10]
14599dfa8 4885d2 test rdx, rdx
14599dfab 740f je 0x14599dfbc
14599dfad 41b801000000 mov r8d, 1
14599dfb3 488b4d48 mov rcx, qword ptr [rbp + 0x48]
14599dfb7 e8144266fa call 0x1400021d0
14599dfbc 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14599dfc0 4c8b45e8 mov r8, qword ptr [rbp - 0x18]
14599dfc4 488d4dd0 lea rcx, [rbp - 0x30]
14599dfc8 e853e3ffff call 0x14599c320
14599dfcd a801 test al, 1
14599dfcf 0f848a000000 je 0x14599e05f
14599dfd5 488b5d38 mov rbx, qword ptr [rbp + 0x38]
14599dfd9 4c8b7540 mov r14, qword ptr [rbp + 0x40]
14599dfdd 488d4d10 lea rcx, [rbp + 0x10]
14599dfe1 0f28c8 movaps xmm1, xmm0
14599dfe4 e8274c0000 call 0x1459a2c10
14599dfe9 90 nop
14599dfea 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14599dfee 488b4520 mov rax, qword ptr [rbp + 0x20]
14599dff2 4889442430 mov qword ptr [rsp + 0x30], rax
14599dff7 48894d48 mov qword ptr [rbp + 0x48], rcx
14599dffb 48894c2428 mov qword ptr [rsp + 0x28], rcx
14599e000 48c744242004000000 mov qword ptr [rsp + 0x20], 4
14599e009 4c8d0d53358801 lea r9, [rip + 0x1883553]
14599e010 488d4df0 lea rcx, [rbp - 0x10]
14599e014 4889da mov rdx, rbx
14599e017 4d89f0 mov r8, r14
14599e01a e871d0ffff call 0x14599b090
14599e01f 90 nop
14599e020 488b5530 mov rdx, qword ptr [rbp + 0x30]
14599e024 4885d2 test rdx, rdx
14599e027 740e je 0x14599e037
14599e029 41b801000000 mov r8d, 1
14599e02f 4889d9 mov rcx, rbx
14599e032 e8994166fa call 0x1400021d0
14599e037 488b4500 mov rax, qword ptr [rbp]
14599e03b 48894540 mov qword ptr [rbp + 0x40], rax
14599e03f 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
14599e043 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14599e047 488b5510 mov rdx, qword ptr [rbp + 0x10]
14599e04b 4885d2 test rdx, rdx
14599e04e 740f je 0x14599e05f
14599e050 41b801000000 mov r8d, 1
14599e056 488b4d48 mov rcx, qword ptr [rbp + 0x48]
14599e05a e8714166fa call 0x1400021d0
14599e05f 488b9f80000000 mov rbx, qword ptr [rdi + 0x80]
14599e066 4885db test rbx, rbx
14599e069 0f8409010000 je 0x14599e178
14599e06f 4c8bb788000000 mov r14, qword ptr [rdi + 0x88]
14599e076 f30f10b790000000 movss xmm6, dword ptr [rdi + 0x90]
14599e07e 4889d9 mov rcx, rbx
14599e081 4c89f2 mov rdx, r14
14599e084 e847fdfeff call 0x14598ddd0
14599e089 90 nop
14599e08a 4989c7 mov r15, rax
14599e08d 4889d7 mov rdi, rdx
14599e090 0fb64557 movzx eax, byte ptr [rbp + 0x57]
14599e094 0f57c0 xorps xmm0, xmm0
14599e097 f30f2ac0 cvtsi2ss xmm0, eax
14599e09b f30f59f0 mulss xmm6, xmm0
14599e09f 488d4d10 lea rcx, [rbp + 0x10]
14599e0a3 0f28ce movaps xmm1, xmm6
14599e0a6 e8654b0000 call 0x1459a2c10
14599e0ab 90 nop
14599e0ac 4d85ff test r15, r15
14599e0af 490f44fe cmove rdi, r14
14599e0b3 490f45df cmovne rbx, r15
14599e0b7 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14599e0bb 488b4520 mov rax, qword ptr [rbp + 0x20]
14599e0bf 4889442430 mov qword ptr [rsp + 0x30], rax
14599e0c4 48894d48 mov qword ptr [rbp + 0x48], rcx
14599e0c8 48894c2428 mov qword ptr [rsp + 0x28], rcx
14599e0cd 48c744242003000000 mov qword ptr [rsp + 0x20], 3
14599e0d6 4c8d0d83348801 lea r9, [rip + 0x1883483]
14599e0dd 4c8d75f0 lea r14, [rbp - 0x10]
14599e0e1 4c89f1 mov rcx, r14
14599e0e4 4889da mov rdx, rbx
14599e0e7 4989f8 mov r8, rdi
14599e0ea e8a1cfffff call 0x14599b090
14599e0ef 90 nop
14599e0f0 488b5510 mov rdx, qword ptr [rbp + 0x10]
14599e0f4 4885d2 test rdx, rdx
14599e0f7 740f je 0x14599e108
14599e0f9 41b801000000 mov r8d, 1
14599e0ff 488b4d48 mov rcx, qword ptr [rbp + 0x48]
14599e103 e8c84066fa call 0x1400021d0
14599e108 488d4530 lea rax, [rbp + 0x30]
14599e10c 48894510 mov qword ptr [rbp + 0x10], rax
14599e110 488d05c93f66fa lea rax, [rip - 0x599c037]
14599e117 48894518 mov qword ptr [rbp + 0x18], rax
14599e11b 4c897520 mov qword ptr [rbp + 0x20], r14
14599e11f 48894528 mov qword ptr [rbp + 0x28], rax
14599e123 488d153d348801 lea rdx, [rip + 0x188343d]
14599e12a 488d4db8 lea rcx, [rbp - 0x48]
14599e12e 4c8d4510 lea r8, [rbp + 0x10]
14599e132 e8f9ef2300 call 0x145bdd130
14599e137 90 nop
14599e138 488b5530 mov rdx, qword ptr [rbp + 0x30]
14599e13c 4885d2 test rdx, rdx
14599e13f 740f je 0x14599e150
14599e141 488b4d38 mov rcx, qword ptr [rbp + 0x38]
14599e145 41b801000000 mov r8d, 1
14599e14b e8804066fa call 0x1400021d0
14599e150 488b45c8 mov rax, qword ptr [rbp - 0x38]
14599e154 48894540 mov qword ptr [rbp + 0x40], rax
14599e158 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
14599e15c 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14599e160 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14599e164 4885d2 test rdx, rdx
14599e167 740f je 0x14599e178
14599e169 488b4df8 mov rcx, qword ptr [rbp - 8]
14599e16d 41b801000000 mov r8d, 1
14599e173 e8584066fa call 0x1400021d0
14599e178 488b4540 mov rax, qword ptr [rbp + 0x40]
14599e17c 48894610 mov qword ptr [rsi + 0x10], rax
14599e180 0f284530 movaps xmm0, xmmword ptr [rbp + 0x30]
14599e184 0f1106 movups xmmword ptr [rsi], xmm0
14599e187 4889f0 mov rax, rsi
14599e18a 0f287560 movaps xmm6, xmmword ptr [rbp + 0x60]
14599e18e 4881c4f0000000 add rsp, 0xf0
14599e195 5b pop rbx
14599e196 5f pop rdi
14599e197 5e pop rsi
14599e198 415c pop r12
14599e19a 415e pop r14
14599e19c 415f pop r15
14599e19e 5d pop rbp
14599e19f c3 ret
14599e1a0 c645f001 mov byte ptr [rbp - 0x10], 1
14599e1a4 c645d000 mov byte ptr [rbp - 0x30], 0
14599e1a8 488d45f0 lea rax, [rbp - 0x10]
14599e1ac 48894510 mov qword ptr [rbp + 0x10], rax
14599e1b0 488d05e918a5fa lea rax, [rip - 0x55ae717]
14599e1b7 48894518 mov qword ptr [rbp + 0x18], rax
14599e1bb 488d4dd0 lea rcx, [rbp - 0x30]
14599e1bf 48894d20 mov qword ptr [rbp + 0x20], rcx
14599e1c3 48894528 mov qword ptr [rbp + 0x28], rax
14599e1c7 488d0d1d0e8a01 lea rcx, [rip + 0x18a0e1d]
14599e1ce 4c8d0573338801 lea r8, [rip + 0x1883373]
14599e1d5 488d5510 lea rdx, [rbp + 0x10]
14599e1d9 e882b84000 call 0x145da9a60
14599e1de 0f0b ud2
14599e1e0 4c8d0549338801 lea r8, [rip + 0x1883349]
14599e1e7 e897b64000 call 0x145da9883
14599e1ec 0f0b ud2
