140397df0 55 push rbp
140397df1 56 push rsi
140397df2 57 push rdi
140397df3 53 push rbx
140397df4 4881ecc8000000 sub rsp, 0xc8
140397dfb 488dac2480000000 lea rbp, [rsp + 0x80]
140397e03 0f297530 movaps xmmword ptr [rbp + 0x30], xmm6
140397e07 48c74528feffffff mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
140397e0f 4889ce mov rsi, rcx
140397e12 488b4918 mov rcx, qword ptr [rcx + 0x18]
140397e16 4883793000 cmp qword ptr [rcx + 0x30], 0
140397e1b 0f849a000000 je 0x140397ebb
140397e21 48ba58501e3a717a5faa movabs rdx, 0xaa5f7a713a1e5058
140397e2b 488b4118 mov rax, qword ptr [rcx + 0x18]
140397e2f 4c8b4120 mov r8, qword ptr [rcx + 0x20]
140397e33 4531c9 xor r9d, r9d
140397e36 660f6f0542a5a005 movdqa xmm0, xmmword ptr [rip + 0x5a0a542]
140397e3e 660f76c9 pcmpeqd xmm1, xmm1
140397e42 660f6f15d6f39f05 movdqa xmm2, xmmword ptr [rip + 0x59ff3d6]
140397e4a 4c21c2 and rdx, r8
140397e4d f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
140397e52 660f6fe3 movdqa xmm4, xmm3
140397e56 660f74e0 pcmpeqb xmm4, xmm0
140397e5a 66440fd7d4 pmovmskb r10d, xmm4
140397e5f 4585d2 test r10d, r10d
140397e62 743c je 0x140397ea0
140397e64 f3450fbcda tzcnt r11d, r10d
140397e69 4901d3 add r11, rdx
140397e6c 4d21c3 and r11, r8
140397e6f 49f7db neg r11
140397e72 4f8d1c5b lea r11, [r11 + r11*2]
140397e76 f3420f6f64d8e8 movdqu xmm4, xmmword ptr [rax + r11*8 - 0x18]
140397e7d 660f74e2 pcmpeqb xmm4, xmm2
140397e81 660fd7fc pmovmskb edi, xmm4
140397e85 81ffffff0000 cmp edi, 0xffff
140397e8b 0f84e1000000 je 0x140397f72
140397e91 458d5aff lea r11d, [r10 - 1]
140397e95 664521d3 and r11w, r10w
140397e99 4589da mov r10d, r11d
140397e9c 75c6 jne 0x140397e64
140397e9e 6690 nop
140397ea0 660f74d9 pcmpeqb xmm3, xmm1
140397ea4 66440fd7d3 pmovmskb r10d, xmm3
140397ea9 4585d2 test r10d, r10d
140397eac 750d jne 0x140397ebb
140397eae 4c01ca add rdx, r9
140397eb1 4883c210 add rdx, 0x10
140397eb5 4983c110 add r9, 0x10
140397eb9 eb8f jmp 0x140397e4a
140397ebb 0fb64160 movzx eax, byte ptr [rcx + 0x60]
140397ebf 488b8180000000 mov rax, qword ptr [rcx + 0x80]
140397ec6 488b9188000000 mov rdx, qword ptr [rcx + 0x88]
140397ecd 49b858501e3a717a5faa movabs r8, 0xaa5f7a713a1e5058
140397ed7 4531c9 xor r9d, r9d
140397eda 660f6f059ea4a005 movdqa xmm0, xmmword ptr [rip + 0x5a0a49e]
140397ee2 660f76c9 pcmpeqd xmm1, xmm1
140397ee6 660f6f1532f39f05 movdqa xmm2, xmmword ptr [rip + 0x59ff332]
140397eee 4921d0 and r8, rdx
140397ef1 f3420f6f1c00 movdqu xmm3, xmmword ptr [rax + r8]
140397ef7 660f6fe3 movdqa xmm4, xmm3
140397efb 660f74e0 pcmpeqb xmm4, xmm0
140397eff 660fd7fc pmovmskb edi, xmm4
140397f03 85ff test edi, edi
140397f05 7449 je 0x140397f50
140397f07 f3440fbcdf tzcnt r11d, edi
140397f0c 4d01c3 add r11, r8
140397f0f 4921d3 and r11, rdx
140397f12 4c89db mov rbx, r11
140397f15 48c1e307 shl rbx, 7
140397f19 4989c2 mov r10, rax
140397f1c 4929da sub r10, rbx
140397f1f f3410f6f6280 movdqu xmm4, xmmword ptr [r10 - 0x80]
140397f25 660f74e2 pcmpeqb xmm4, xmm2
140397f29 660fd7dc pmovmskb ebx, xmm4
140397f2d 81fbffff0000 cmp ebx, 0xffff
140397f33 745a je 0x140397f8f
140397f35 448d57ff lea r10d, [rdi - 1]
140397f39 664121fa and r10w, di
140397f3d 4489d7 mov edi, r10d
140397f40 75c5 jne 0x140397f07
140397f42 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140397f50 660f74d9 pcmpeqb xmm3, xmm1
140397f54 66440fd7d3 pmovmskb r10d, xmm3
140397f59 4585d2 test r10d, r10d
140397f5c 0f859f000000 jne 0x140398001
140397f62 4d01c8 add r8, r9
140397f65 4983c010 add r8, 0x10
140397f69 4983c110 add r9, 0x10
140397f6d e97cffffff jmp 0x140397eee
140397f72 4a8d04d8 lea rax, [rax + r11*8]
140397f76 488b78f8 mov rdi, qword ptr [rax - 8]
140397f7a 488b5608 mov rdx, qword ptr [rsi + 8]
140397f7e 4c8b4610 mov r8, qword ptr [rsi + 0x10]
140397f82 4989f9 mov r9, rdi
140397f85 e866b3ac04 call 0x144e632f0
140397f8a e944020000 jmp 0x1403981d3
140397f8f 4d8d43f0 lea r8, [r11 - 0x10]
140397f93 4921d0 and r8, rdx
140397f96 f3420f6f0400 movdqu xmm0, xmmword ptr [rax + r8]
140397f9c 660f76c9 pcmpeqd xmm1, xmm1
140397fa0 660f74c1 pcmpeqb xmm0, xmm1
140397fa4 660fd7d0 pmovmskb edx, xmm0
140397fa8 f3420f6f0418 movdqu xmm0, xmmword ptr [rax + r11]
140397fae 660f74c1 pcmpeqb xmm0, xmm1
140397fb2 66440fd7c8 pmovmskb r9d, xmm0
140397fb7 66bf1f00 mov di, 0x1f
140397fbb 660fbdfa bsr di, dx
140397fbf 83f70f xor edi, 0xf
140397fc2 4181c900000100 or r9d, 0x10000
140397fc9 f3450fbcc9 tzcnt r9d, r9d
140397fce 4101f9 add r9d, edi
140397fd1 b280 mov dl, 0x80
140397fd3 664183f90f cmp r9w, 0xf
140397fd8 7709 ja 0x140397fe3
140397fda 48ff8190000000 inc qword ptr [rcx + 0x90]
140397fe1 b2ff mov dl, 0xff
140397fe3 42881418 mov byte ptr [rax + r11], dl
140397fe7 4288540010 mov byte ptr [rax + r8 + 0x10], dl
140397fec 48ff8998000000 dec qword ptr [rcx + 0x98]
140397ff3 498b4290 mov rax, qword ptr [r10 - 0x70]
140397ff7 4883f802 cmp rax, 2
140397ffb 0f8579010000 jne 0x14039817a
140398001 488b4620 mov rax, qword ptr [rsi + 0x20]
140398005 488b38 mov rdi, qword ptr [rax]
140398008 488d5701 lea rdx, [rdi + 1]
14039800c 488910 mov qword ptr [rax], rdx
14039800f 66c745000001 mov word ptr [rbp], 0x100
140398015 48c745b001000000 mov qword ptr [rbp - 0x50], 1
14039801d 0f1005e4e6a005 movups xmm0, xmmword ptr [rip + 0x5a0e6e4]
140398024 0f1145b8 movups xmmword ptr [rbp - 0x48], xmm0
140398028 48c745d801000000 mov qword ptr [rbp - 0x28], 1
140398030 48c745e001000000 mov qword ptr [rbp - 0x20], 1
140398038 48c745f800000000 mov qword ptr [rbp - 8], 0
140398040 c6450201 mov byte ptr [rbp + 2], 1
140398044 48c745c802000000 mov qword ptr [rbp - 0x38], 2
14039804c 488d05cd8ac7ff lea rax, [rip - 0x387533]
140398053 488945d0 mov qword ptr [rbp - 0x30], rax
140398057 c645e802 mov byte ptr [rbp - 0x18], 2
14039805b 4c8d45b0 lea r8, [rbp - 0x50]
14039805f 4889cb mov rbx, rcx
140398062 4889fa mov rdx, rdi
140398065 e87606c8ff call 0x1400186e0
14039806a 4883c318 add rbx, 0x18
14039806e 488d15bbe5a505 lea rdx, [rip + 0x5a5e5bb]
140398075 4889d9 mov rcx, rbx
140398078 4989f8 mov r8, rdi
14039807b e8b004c8ff call 0x140018530
140398080 488b5e10 mov rbx, qword ptr [rsi + 0x10]
140398084 483b1e cmp rbx, qword ptr [rsi]
140398087 7508 jne 0x140398091
140398089 4889f1 mov rcx, rsi
14039808c e8afcb8505 call 0x145bf4c40
140398091 488b4608 mov rax, qword ptr [rsi + 8]
140398095 48893cd8 mov qword ptr [rax + rbx*8], rdi
140398099 48ffc3 inc rbx
14039809c 48895e10 mov qword ptr [rsi + 0x10], rbx
1403980a0 48c745b000000000 mov qword ptr [rbp - 0x50], 0
1403980a8 48c745b808000000 mov qword ptr [rbp - 0x48], 8
1403980b0 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1403980b8 0f10050173a605 movups xmm0, xmmword ptr [rip + 0x5a67301]
1403980bf 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
1403980c3 0f100d0673a605 movups xmm1, xmmword ptr [rip + 0x5a67306]
1403980ca 0f114dd8 movups xmmword ptr [rbp - 0x28], xmm1
1403980ce 48c745e800000000 mov qword ptr [rbp - 0x18], 0
1403980d6 48c745f008000000 mov qword ptr [rbp - 0x10], 8
1403980de 48c745f800000000 mov qword ptr [rbp - 8], 0
1403980e6 0f114500 movups xmmword ptr [rbp], xmm0
1403980ea 0f114d10 movups xmmword ptr [rbp + 0x10], xmm1
1403980ee 488b4e18 mov rcx, qword ptr [rsi + 0x18]
1403980f2 c6452701 mov byte ptr [rbp + 0x27], 1
1403980f6 4c8d45b0 lea r8, [rbp - 0x50]
1403980fa 4889fa mov rdx, rdi
1403980fd e82e63aa04 call 0x144e3e430
140398102 90 nop
140398103 488b4610 mov rax, qword ptr [rsi + 0x10]
140398107 4885c0 test rax, rax
14039810a 7407 je 0x140398113
14039810c 48ffc8 dec rax
14039810f 48894610 mov qword ptr [rsi + 0x10], rax
140398113 488b4618 mov rax, qword ptr [rsi + 0x18]
140398117 488b4008 mov rax, qword ptr [rax + 8]
14039811b 4869cf30010000 imul rcx, rdi, 0x130
140398122 4801c1 add rcx, rax
140398125 4883c158 add rcx, 0x58
140398129 48894da8 mov qword ptr [rbp - 0x58], rcx
14039812d e80e7fc7ff call 0x140010040
140398132 90 nop
140398133 f30f6f45b0 movdqu xmm0, xmmword ptr [rbp - 0x50]
140398138 f30f6f4dc0 movdqu xmm1, xmmword ptr [rbp - 0x40]
14039813d f30f6f55d0 movdqu xmm2, xmmword ptr [rbp - 0x30]
140398142 f30f6f5de0 movdqu xmm3, xmmword ptr [rbp - 0x20]
140398147 f30f6f65f0 movdqu xmm4, xmmword ptr [rbp - 0x10]
14039814c 0f106d00 movups xmm5, xmmword ptr [rbp]
140398150 0f107510 movups xmm6, xmmword ptr [rbp + 0x10]
140398154 488b45a8 mov rax, qword ptr [rbp - 0x58]
140398158 0f117060 movups xmmword ptr [rax + 0x60], xmm6
14039815c 0f116850 movups xmmword ptr [rax + 0x50], xmm5
140398160 f30f7f6040 movdqu xmmword ptr [rax + 0x40], xmm4
140398165 f30f7f5830 movdqu xmmword ptr [rax + 0x30], xmm3
14039816a f30f7f5020 movdqu xmmword ptr [rax + 0x20], xmm2
14039816f f30f7f4810 movdqu xmmword ptr [rax + 0x10], xmm1
140398174 f30f7f00 movdqu xmmword ptr [rax], xmm0
140398178 eb59 jmp 0x1403981d3
14039817a 498b4af8 mov rcx, qword ptr [r10 - 8]
14039817e 48894d18 mov qword ptr [rbp + 0x18], rcx
140398182 410f1042e8 movups xmm0, xmmword ptr [r10 - 0x18]
140398187 0f114508 movups xmmword ptr [rbp + 8], xmm0
14039818b 410f1042d8 movups xmm0, xmmword ptr [r10 - 0x28]
140398190 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
140398194 f3410f6f4298 movdqu xmm0, xmmword ptr [r10 - 0x68]
14039819a f3410f6f4aa8 movdqu xmm1, xmmword ptr [r10 - 0x58]
1403981a0 f3410f6f52b8 movdqu xmm2, xmmword ptr [r10 - 0x48]
1403981a6 f3410f6f5ac8 movdqu xmm3, xmmword ptr [r10 - 0x38]
1403981ac f30f7f5de8 movdqu xmmword ptr [rbp - 0x18], xmm3
1403981b1 f30f7f55d8 movdqu xmmword ptr [rbp - 0x28], xmm2
1403981b6 f30f7f4dc8 movdqu xmmword ptr [rbp - 0x38], xmm1
1403981bb f30f7f45b8 movdqu xmmword ptr [rbp - 0x48], xmm0
1403981c0 488945b0 mov qword ptr [rbp - 0x50], rax
1403981c4 488d4db0 lea rcx, [rbp - 0x50]
1403981c8 4889f2 mov rdx, rsi
1403981cb e810aaa604 call 0x144e02be0
1403981d0 4889c7 mov rdi, rax
1403981d3 b801000000 mov eax, 1
1403981d8 4889fa mov rdx, rdi
1403981db 0f287530 movaps xmm6, xmmword ptr [rbp + 0x30]
1403981df 4881c4c8000000 add rsp, 0xc8
1403981e6 5b pop rbx
1403981e7 5f pop rdi
1403981e8 5e pop rsi
1403981e9 5d pop rbp
1403981ea c3 ret
