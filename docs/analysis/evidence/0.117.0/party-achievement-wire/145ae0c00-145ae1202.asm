145ae0c00 55 push rbp
145ae0c01 4157 push r15
145ae0c03 4156 push r14
145ae0c05 4154 push r12
145ae0c07 56 push rsi
145ae0c08 57 push rdi
145ae0c09 53 push rbx
145ae0c0a 4881ec70010000 sub rsp, 0x170
145ae0c11 488dac2480000000 lea rbp, [rsp + 0x80]
145ae0c19 66440f298de0000000 movapd xmmword ptr [rbp + 0xe0], xmm9
145ae0c22 66440f2985d0000000 movapd xmmword ptr [rbp + 0xd0], xmm8
145ae0c2b 0f29bdc0000000 movaps xmmword ptr [rbp + 0xc0], xmm7
145ae0c32 0f29b5b0000000 movaps xmmword ptr [rbp + 0xb0], xmm6
145ae0c39 48c785a8000000feffffff mov qword ptr [rbp + 0xa8], 0xfffffffffffffffe
145ae0c44 4489c3 mov ebx, r8d
145ae0c47 4989d7 mov r15, rdx
145ae0c4a 4889ce mov rsi, rcx
145ae0c4d 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
145ae0c54 4c89c9 mov rcx, r9
145ae0c57 e8d49ef9ff call 0x145a7ab30
145ae0c5c 41389fc0000000 cmp byte ptr [r15 + 0xc0], bl
145ae0c63 7560 jne 0x145ae0cc5
145ae0c65 4869f8f0000000 imul rdi, rax, 0xf0
145ae0c6c 4c8d359da37b01 lea r14, [rip + 0x17ba39d]
145ae0c73 4c01f7 add rdi, r14
145ae0c76 4d8b6708 mov r12, qword ptr [r15 + 8]
145ae0c7a 498b5710 mov rdx, qword ptr [r15 + 0x10]
145ae0c7e 4c89e1 mov rcx, r12
145ae0c81 e8aa9ef9ff call 0x145a7ab30
145ae0c86 4869c0f0000000 imul rax, rax, 0xf0
145ae0c8d 4e8b443010 mov r8, qword ptr [rax + r14 + 0x10]
145ae0c92 4c3b4710 cmp r8, qword ptr [rdi + 0x10]
145ae0c96 752d jne 0x145ae0cc5
145ae0c98 4901c6 add r14, rax
145ae0c9b 488b5708 mov rdx, qword ptr [rdi + 8]
145ae0c9f 498b4e08 mov rcx, qword ptr [r14 + 8]
145ae0ca3 e83f304b00 call 0x145f93ce7
145ae0ca8 85c0 test eax, eax
145ae0caa 7519 jne 0x145ae0cc5
145ae0cac 66410f6ebf98000000 movd xmm7, dword ptr [r15 + 0x98]
145ae0cb5 660f7ef8 movd eax, xmm7
145ae0cb9 25ffffff7f and eax, 0x7fffffff
145ae0cbe 3dffff7f7f cmp eax, 0x7f7fffff
145ae0cc3 7e42 jle 0x145ae0d07
145ae0cc5 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
145ae0ccc 4c89f9 mov rcx, r15
145ae0ccf e84c5efcff call 0x145aa6b20
145ae0cd4 4889f0 mov rax, rsi
145ae0cd7 0f28b5b0000000 movaps xmm6, xmmword ptr [rbp + 0xb0]
145ae0cde 0f28bdc0000000 movaps xmm7, xmmword ptr [rbp + 0xc0]
145ae0ce5 440f2885d0000000 movaps xmm8, xmmword ptr [rbp + 0xd0]
145ae0ced 440f288de0000000 movaps xmm9, xmmword ptr [rbp + 0xe0]
145ae0cf5 4881c470010000 add rsp, 0x170
145ae0cfc 5b pop rbx
145ae0cfd 5f pop rdi
145ae0cfe 5e pop rsi
145ae0cff 415c pop r12
145ae0d01 415e pop r14
145ae0d03 415f pop r15
145ae0d05 5d pop rbp
145ae0d06 c3 ret
145ae0d07 f20f10b558010000 movsd xmm6, qword ptr [rbp + 0x158]
145ae0d0f f20f583529324201 addsd xmm6, qword ptr [rip + 0x1423229]
145ae0d17 66450f57c9 xorpd xmm9, xmm9
145ae0d1c 66410f2ef1 ucomisd xmm6, xmm9
145ae0d21 4c89bd98000000 mov qword ptr [rbp + 0x98], r15
145ae0d28 4c896570 mov qword ptr [rbp + 0x70], r12
145ae0d2c 0f8264040000 jb 0x145ae1196
145ae0d32 4c8bb788000000 mov r14, qword ptr [rdi + 0x88]
145ae0d39 4981fe60feffff cmp r14, -0x1a0
145ae0d40 7419 je 0x145ae0d5b
145ae0d42 f3410f1086f0010000 movss xmm0, dword ptr [r14 + 0x1f0]
145ae0d4b f3440f5ac0 cvtss2sd xmm8, xmm0
145ae0d50 f2440f590517df7200 mulsd xmm8, qword ptr [rip + 0x72df17]
145ae0d59 eb09 jmp 0x145ae0d64
145ae0d5b f2440f100564e37e01 movsd xmm8, qword ptr [rip + 0x17ee364]
145ae0d64 e8971452fa call 0x140002200
145ae0d69 b914000000 mov ecx, 0x14
145ae0d6e ba04000000 mov edx, 4
145ae0d73 e8481452fa call 0x1400021c0
145ae0d78 4885c0 test rax, rax
145ae0d7b 0f8468040000 je 0x145ae11e9
145ae0d81 0f57c0 xorps xmm0, xmm0
145ae0d84 f30f5ac7 cvtss2sd xmm0, xmm7
145ae0d88 f2440f5fc8 maxsd xmm9, xmm0
145ae0d8d f2410f5df1 minsd xmm6, xmm9
145ae0d92 f20f100d36e37e01 movsd xmm1, qword ptr [rip + 0x17ee336]
145ae0d9a f20f59ce mulsd xmm1, xmm6
145ae0d9e f20f580dcae36500 addsd xmm1, qword ptr [rip + 0x65e3ca]
145ae0da6 f20f103d1a876800 movsd xmm7, qword ptr [rip + 0x68871a]
145ae0dae f20f5dcf minsd xmm1, xmm7
145ae0db2 660f57c0 xorpd xmm0, xmm0
145ae0db6 660f57d2 xorpd xmm2, xmm2
145ae0dba f20f5fd1 maxsd xmm2, xmm1
145ae0dbe 660f28cf movapd xmm1, xmm7
145ae0dc2 f20f5dca minsd xmm1, xmm2
145ae0dc6 f2480f2cf9 cvttsd2si rdi, xmm1
145ae0dcb 83c705 add edi, 5
145ae0dce 418b4e40 mov ecx, dword ptr [r14 + 0x40]
145ae0dd2 8908 mov dword ptr [rax], ecx
145ae0dd4 418b8ea8000000 mov ecx, dword ptr [r14 + 0xa8]
145ae0ddb 894804 mov dword ptr [rax + 4], ecx
145ae0dde 418b8e10010000 mov ecx, dword ptr [r14 + 0x110]
145ae0de5 894808 mov dword ptr [rax + 8], ecx
145ae0de8 418b8e78010000 mov ecx, dword ptr [r14 + 0x178]
145ae0def 89480c mov dword ptr [rax + 0xc], ecx
145ae0df2 418b8ee0010000 mov ecx, dword ptr [r14 + 0x1e0]
145ae0df9 894810 mov dword ptr [rax + 0x10], ecx
145ae0dfc 48c7457805000000 mov qword ptr [rbp + 0x78], 5
145ae0e04 48898580000000 mov qword ptr [rbp + 0x80], rax
145ae0e0b 418b8f9c000000 mov ecx, dword ptr [r15 + 0x9c]
145ae0e12 83f963 cmp ecx, 0x63
145ae0e15 b863000000 mov eax, 0x63
145ae0e1a 0f42c1 cmovb eax, ecx
145ae0e1d f20f100d1b314201 movsd xmm1, qword ptr [rip + 0x142311b]
145ae0e25 f20f58ce addsd xmm1, xmm6
145ae0e29 66410f2ec8 ucomisd xmm1, xmm8
145ae0e2e f20f100d6a7c9000 movsd xmm1, qword ptr [rip + 0x907c6a]
145ae0e36 f20f59ce mulsd xmm1, xmm6
145ae0e3a f20f580dae494401 addsd xmm1, qword ptr [rip + 0x14449ae]
145ae0e42 48c7858800000005000000 mov qword ptr [rbp + 0x88], 5
145ae0e4d f20f5dcf minsd xmm1, xmm7
145ae0e51 660f57d2 xorpd xmm2, xmm2
145ae0e55 f20f5fd1 maxsd xmm2, xmm1
145ae0e59 660f28cf movapd xmm1, xmm7
145ae0e5d f20f5dca minsd xmm1, xmm2
145ae0e61 f2480f2cd1 cvttsd2si rdx, xmm1
145ae0e66 f20f100d8a358a00 movsd xmm1, qword ptr [rip + 0x8a358a]
145ae0e6e f20f59ce mulsd xmm1, xmm6
145ae0e72 f20f580d66866800 addsd xmm1, qword ptr [rip + 0x688666]
145ae0e7a 488d4d78 lea rcx, [rbp + 0x78]
145ae0e7e f20f5dcf minsd xmm1, xmm7
145ae0e82 660f57d2 xorpd xmm2, xmm2
145ae0e86 f20f5fd1 maxsd xmm2, xmm1
145ae0e8a 660f28cf movapd xmm1, xmm7
145ae0e8e f20f5dca minsd xmm1, xmm2
145ae0e92 f24c0f2cc1 cvttsd2si r8, xmm1
145ae0e97 f20f100dc1387500 movsd xmm1, qword ptr [rip + 0x7538c1]
145ae0e9f f20f59ce mulsd xmm1, xmm6
145ae0ea3 f20f580dc5e26500 addsd xmm1, qword ptr [rip + 0x65e2c5]
145ae0eab 48898d90000000 mov qword ptr [rbp + 0x90], rcx
145ae0eb2 f20f5dcf minsd xmm1, xmm7
145ae0eb6 660f57d2 xorpd xmm2, xmm2
145ae0eba f20f5fd1 maxsd xmm2, xmm1
145ae0ebe 660f28cf movapd xmm1, xmm7
145ae0ec2 f20f5dca minsd xmm1, xmm2
145ae0ec6 f24c0f2cc9 cvttsd2si r9, xmm1
145ae0ecb 0f93c1 setae cl
145ae0ece f3410f6f9fa0000000 movdqu xmm3, xmmword ptr [r15 + 0xa0]
145ae0ed7 66410f6ed0 movd xmm2, r8d
145ae0edc 660f6eca movd xmm1, edx
145ae0ee0 660f62ca punpckldq xmm1, xmm2
145ae0ee4 66410f6ed1 movd xmm2, r9d
145ae0ee9 660f6ee7 movd xmm4, edi
145ae0eed 660f62d4 punpckldq xmm2, xmm4
145ae0ef1 660f6cca punpcklqdq xmm1, xmm2
145ae0ef5 660f6f15233c6900 movdqa xmm2, xmmword ptr [rip + 0x693c23]
145ae0efd 660f6fe1 movdqa xmm4, xmm1
145ae0f01 660fefe2 pxor xmm4, xmm2
145ae0f05 660fefd3 pxor xmm2, xmm3
145ae0f09 660f66d4 pcmpgtd xmm2, xmm4
145ae0f0d 660fdbca pand xmm1, xmm2
145ae0f11 660fdfd3 pandn xmm2, xmm3
145ae0f15 f20f101d03fc7900 movsd xmm3, qword ptr [rip + 0x79fc03]
145ae0f1d f20f59de mulsd xmm3, xmm6
145ae0f21 f20f581de7517600 addsd xmm3, qword ptr [rip + 0x7651e7]
145ae0f29 418b97b0000000 mov edx, dword ptr [r15 + 0xb0]
145ae0f30 f20f5ddf minsd xmm3, xmm7
145ae0f34 f20f5fc3 maxsd xmm0, xmm3
145ae0f38 660f28df movapd xmm3, xmm7
145ae0f3c f20f5dd8 minsd xmm3, xmm0
145ae0f40 f24c0f2cc3 cvttsd2si r8, xmm3
145ae0f45 4139d0 cmp r8d, edx
145ae0f48 410f42d0 cmovb edx, r8d
145ae0f4c 66410f6ea7b4000000 movd xmm4, dword ptr [r15 + 0xb4]
145ae0f55 66410f7ee0 movd r8d, xmm4
145ae0f5a 4181e0ffffff7f and r8d, 0x7fffffff
145ae0f61 f30f10052b2c6800 movss xmm0, dword ptr [rip + 0x682c2b]
145ae0f69 0f28d8 movaps xmm3, xmm0
145ae0f6c 4181f8ffff7f7f cmp r8d, 0x7f7fffff
145ae0f73 7f18 jg 0x145ae0f8d
145ae0f75 f30f102d172c6800 movss xmm5, dword ptr [rip + 0x682c17]
145ae0f7d f30f5fec maxss xmm5, xmm4
145ae0f81 f30f101d57316800 movss xmm3, dword ptr [rip + 0x683157]
145ae0f89 f30f5ddd minss xmm3, xmm5
145ae0f8d 0f57e4 xorps xmm4, xmm4
145ae0f90 f20f5ae6 cvtsd2ss xmm4, xmm6
145ae0f94 41228fbd000000 and cl, byte ptr [r15 + 0xbd]
145ae0f9b 660febca por xmm1, xmm2
145ae0f9f 66410f6e97b8000000 movd xmm2, dword ptr [r15 + 0xb8]
145ae0fa8 66410f7ed0 movd r8d, xmm2
145ae0fad 4181e0ffffff7f and r8d, 0x7fffffff
145ae0fb4 4181f8ffff7f7f cmp r8d, 0x7f7fffff
145ae0fbb 7f18 jg 0x145ae0fd5
145ae0fbd f30f102dcf2b6800 movss xmm5, dword ptr [rip + 0x682bcf]
145ae0fc5 f30f5fea maxss xmm5, xmm2
145ae0fc9 f30f10054f2c6800 movss xmm0, dword ptr [rip + 0x682c4f]
145ae0fd1 f30f5dc5 minss xmm0, xmm5
145ae0fd5 f30f116538 movss dword ptr [rbp + 0x38], xmm4
145ae0fda 450fb687bf000000 movzx r8d, byte ptr [r15 + 0xbf]
145ae0fe2 4488455f mov byte ptr [rbp + 0x5f], r8b
145ae0fe6 450fb687bc000000 movzx r8d, byte ptr [r15 + 0xbc]
145ae0fee 4488455c mov byte ptr [rbp + 0x5c], r8b
145ae0ff2 89453c mov dword ptr [rbp + 0x3c], eax
145ae0ff5 884d5d mov byte ptr [rbp + 0x5d], cl
145ae0ff8 660f7f4d40 movdqa xmmword ptr [rbp + 0x40], xmm1
145ae0ffd 895550 mov dword ptr [rbp + 0x50], edx
145ae1000 f30f115d54 movss dword ptr [rbp + 0x54], xmm3
145ae1005 f30f114558 movss dword ptr [rbp + 0x58], xmm0
145ae100a 410fb687be000000 movzx eax, byte ptr [r15 + 0xbe]
145ae1012 88455e mov byte ptr [rbp + 0x5e], al
145ae1015 885d60 mov byte ptr [rbp + 0x60], bl
145ae1018 498b4710 mov rax, qword ptr [r15 + 0x10]
145ae101c 488945b0 mov qword ptr [rbp - 0x50], rax
145ae1020 410f1007 movups xmm0, xmmword ptr [r15]
145ae1024 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
145ae1028 488d4db8 lea rcx, [rbp - 0x48]
145ae102c 498b4728 mov rax, qword ptr [r15 + 0x28]
145ae1030 488945c8 mov qword ptr [rbp - 0x38], rax
145ae1034 410f104718 movups xmm0, xmmword ptr [r15 + 0x18]
145ae1039 0f1145b8 movups xmmword ptr [rbp - 0x48], xmm0
145ae103d 498b4740 mov rax, qword ptr [r15 + 0x40]
145ae1041 488945e0 mov qword ptr [rbp - 0x20], rax
145ae1045 410f104730 movups xmm0, xmmword ptr [r15 + 0x30]
145ae104a 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
145ae104e 410f104748 movups xmm0, xmmword ptr [r15 + 0x48]
145ae1053 0f1145e8 movups xmmword ptr [rbp - 0x18], xmm0
145ae1057 498b4758 mov rax, qword ptr [r15 + 0x58]
145ae105b 488945f8 mov qword ptr [rbp - 8], rax
145ae105f 66410f104760 movupd xmm0, xmmword ptr [r15 + 0x60]
145ae1065 410f104f70 movups xmm1, xmmword ptr [r15 + 0x70]
145ae106a 410f109780000000 movups xmm2, xmmword ptr [r15 + 0x80]
145ae1072 660f294500 movapd xmmword ptr [rbp], xmm0
145ae1077 0f294d10 movaps xmmword ptr [rbp + 0x10], xmm1
145ae107b 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
145ae107f 498b8790000000 mov rax, qword ptr [r15 + 0x90]
145ae1086 48894530 mov qword ptr [rbp + 0x30], rax
145ae108a 488d9590000000 lea rdx, [rbp + 0x90]
145ae1091 e87a091400 call 0x145c21a10
145ae1096 90 nop
145ae1097 488d4dd0 lea rcx, [rbp - 0x30]
145ae109b 89ff mov edi, edi
145ae109d 48397dc8 cmp qword ptr [rbp - 0x38], rdi
145ae10a1 7204 jb 0x145ae10a7
145ae10a3 48897dc8 mov qword ptr [rbp - 0x38], rdi
145ae10a7 488d9590000000 lea rdx, [rbp + 0x90]
145ae10ae e85df21300 call 0x145c20310
145ae10b3 90 nop
145ae10b4 488d4de8 lea rcx, [rbp - 0x18]
145ae10b8 48397de0 cmp qword ptr [rbp - 0x20], rdi
145ae10bc 7204 jb 0x145ae10c2
145ae10be 48897de0 mov qword ptr [rbp - 0x20], rdi
145ae10c2 488d5578 lea rdx, [rbp + 0x78]
145ae10c6 e8d50c1400 call 0x145c21da0
145ae10cb 90 nop
145ae10cc 488b8588000000 mov rax, qword ptr [rbp + 0x88]
145ae10d3 483b45f8 cmp rax, qword ptr [rbp - 8]
145ae10d7 7704 ja 0x145ae10dd
145ae10d9 488945f8 mov qword ptr [rbp - 8], rax
145ae10dd 48837d00ff cmp qword ptr [rbp], -1
145ae10e2 7440 je 0x145ae1124
145ae10e4 488d4d18 lea rcx, [rbp + 0x18]
145ae10e8 488d9590000000 lea rdx, [rbp + 0x90]
145ae10ef e8ecf31300 call 0x145c204e0
145ae10f4 90 nop
145ae10f5 488b5d28 mov rbx, qword ptr [rbp + 0x28]
145ae10f9 4829fb sub rbx, rdi
145ae10fc 720a jb 0x145ae1108
145ae10fe 488b4520 mov rax, qword ptr [rbp + 0x20]
145ae1102 48897d28 mov qword ptr [rbp + 0x28], rdi
145ae1106 7556 jne 0x145ae115e
145ae1108 8b4530 mov eax, dword ptr [rbp + 0x30]
145ae110b 660f57c0 xorpd xmm0, xmm0
145ae110f f20f5fc6 maxsd xmm0, xmm6
145ae1113 f20f5df8 minsd xmm7, xmm0
145ae1117 f2480f2ccf cvttsd2si rcx, xmm7
145ae111c 39c1 cmp ecx, eax
145ae111e 0f42c1 cmovb eax, ecx
145ae1121 894530 mov dword ptr [rbp + 0x30], eax
145ae1124 488d55a0 lea rdx, [rbp - 0x60]
145ae1128 41b8c8000000 mov r8d, 0xc8
145ae112e 4889f1 mov rcx, rsi
145ae1131 e8a52b4b00 call 0x145f93cdb
145ae1136 488b5578 mov rdx, qword ptr [rbp + 0x78]
145ae113a 4885d2 test rdx, rdx
145ae113d 0f8491fbffff je 0x145ae0cd4
145ae1143 488b8d80000000 mov rcx, qword ptr [rbp + 0x80]
145ae114a 48c1e202 shl rdx, 2
145ae114e 41b804000000 mov r8d, 4
145ae1154 e8771052fa call 0x1400021d0
145ae1159 e976fbffff jmp 0x145ae0cd4
145ae115e 488d0cbf lea rcx, [rdi + rdi*4]
145ae1162 488d3cc8 lea rdi, [rax + rcx*8]
145ae1166 4883c708 add rdi, 8
145ae116a eb0d jmp 0x145ae1179
145ae116c 0f1f4000 nop dword ptr [rax]
145ae1170 4883c728 add rdi, 0x28
145ae1174 48ffcb dec rbx
145ae1177 748f je 0x145ae1108
145ae1179 488b57f8 mov rdx, qword ptr [rdi - 8]
145ae117d 4885d2 test rdx, rdx
145ae1180 74ee je 0x145ae1170
145ae1182 488b0f mov rcx, qword ptr [rdi]
145ae1185 48c1e203 shl rdx, 3
145ae1189 41b804000000 mov r8d, 4
145ae118f e83c1052fa call 0x1400021d0
145ae1194 ebda jmp 0x145ae1170
145ae1196 48c7859000000000000000 mov qword ptr [rbp + 0x90], 0
145ae11a1 f20f117578 movsd qword ptr [rbp + 0x78], xmm6
145ae11a6 488d8590000000 lea rax, [rbp + 0x90]
145ae11ad 488945a0 mov qword ptr [rbp - 0x60], rax
145ae11b1 488d05486a4900 lea rax, [rip + 0x496a48]
145ae11b8 488945a8 mov qword ptr [rbp - 0x58], rax
145ae11bc 488d4d78 lea rcx, [rbp + 0x78]
145ae11c0 48894db0 mov qword ptr [rbp - 0x50], rcx
145ae11c4 488945b8 mov qword ptr [rbp - 0x48], rax
145ae11c8 c685a700000000 mov byte ptr [rbp + 0xa7], 0
145ae11cf 488d0d4ae27e01 lea rcx, [rip + 0x17ee24a]
145ae11d6 4c8d05c3e27e01 lea r8, [rip + 0x17ee2c3]
145ae11dd 488d55a0 lea rdx, [rbp - 0x60]
145ae11e1 e84aa06500 call 0x14613b230
145ae11e6 90 nop
145ae11e7 eb17 jmp 0x145ae1200
145ae11e9 c685a700000000 mov byte ptr [rbp + 0xa7], 0
145ae11f0 b904000000 mov ecx, 4
145ae11f5 ba14000000 mov edx, 0x14
145ae11fa e8bc9a6500 call 0x14613acbb
145ae11ff 90 nop
145ae1200 0f0b ud2
