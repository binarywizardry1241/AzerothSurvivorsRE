1403058d0: 55 push rbp
1403058d1: 4157 push r15
1403058d3: 4156 push r14
1403058d5: 56 push rsi
1403058d6: 57 push rdi
1403058d7: 53 push rbx
1403058d8: 4881ec28010000 sub rsp, 0x128
1403058df: 488dac2480000000 lea rbp, [rsp + 0x80]
1403058e7: 48c785a0000000feffffff mov qword ptr [rbp + 0xa0], 0xfffffffffffffffe
1403058f2: 4889ce mov rsi, rcx
1403058f5: 488d0db410b105 lea rcx, [rip + 0x5b110b4]
1403058fc: ff159e4faa05 call qword ptr [rip + 0x5aa4f9e]
140305902: 4885c0 test rax, rax
140305905: 7415 je 0x14030591c
140305907: 488d15ce10b105 lea rdx, [rip + 0x5b110ce]
14030590e: 4889c1 mov rcx, rax
140305911: ff15e94faa05 call qword ptr [rip + 0x5aa4fe9]
140305917: 4885c0 test rax, rax
14030591a: 7556 jne 0x140305972
14030591c: 488d0d9b10b105 lea rcx, [rip + 0x5b1109b]
140305923: ff15774faa05 call qword ptr [rip + 0x5aa4f77]
140305929: 4885c0 test rax, rax
14030592c: 7415 je 0x140305943
14030592e: 488d15a710b105 lea rdx, [rip + 0x5b110a7]
140305935: 4889c1 mov rcx, rax
140305938: ff15c24faa05 call qword ptr [rip + 0x5aa4fc2]
14030593e: 4885c0 test rax, rax
140305941: 752f jne 0x140305972
140305943: 488d0d8210b105 lea rcx, [rip + 0x5b11082]
14030594a: ff15504faa05 call qword ptr [rip + 0x5aa4f50]
140305950: 4885c0 test rax, rax
140305953: 0f8497020000 je 0x140305bf0
140305959: 488d157c10b105 lea rdx, [rip + 0x5b1107c]
140305960: 4889c1 mov rcx, rax
140305963: ff15974faa05 call qword ptr [rip + 0x5aa4f97]
140305969: 4885c0 test rax, rax
14030596c: 0f847e020000 je 0x140305bf0
140305972: 4889c7 mov rdi, rax
140305975: 488d5e40 lea rbx, [rsi + 0x40]
140305979: 488d86a8050000 lea rax, [rsi + 0x5a8]
140305980: 48895dc8 mov qword ptr [rbp - 0x38], rbx
140305984: 488945d0 mov qword ptr [rbp - 0x30], rax
140305988: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
140305990: 48c745b808000000 mov qword ptr [rbp - 0x48], 8
140305998: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1403059a0: 4883be9000000000 cmp qword ptr [rsi + 0x90], 0
1403059a8: 0f849d000000 je 0x140305a4b
1403059ae: 48ba288d3d736737b884 movabs rdx, 0x84b83767733d8d28
1403059b8: 488b4e78 mov rcx, qword ptr [rsi + 0x78]
1403059bc: 4c8b8680000000 mov r8, qword ptr [rsi + 0x80]
1403059c3: 4531c9 xor r9d, r9d
1403059c6: 660f6f05628cab05 movdqa xmm0, xmmword ptr [rip + 0x5ab8c62]
1403059ce: 660f76c9 pcmpeqd xmm1, xmm1
1403059d2: 660f6f15668cab05 movdqa xmm2, xmmword ptr [rip + 0x5ab8c66]
1403059da: 4c21c2 and rdx, r8
1403059dd: f30f6f1c11 movdqu xmm3, xmmword ptr [rcx + rdx]
1403059e2: 660f6fe3 movdqa xmm4, xmm3
1403059e6: 660f74e0 pcmpeqb xmm4, xmm0
1403059ea: 66440fd7d4 pmovmskb r10d, xmm4
1403059ef: 4585d2 test r10d, r10d
1403059f2: 743c je 0x140305a30
1403059f4: f3450fbcda tzcnt r11d, r10d
1403059f9: 4901d3 add r11, rdx
1403059fc: 4d21c3 and r11, r8
1403059ff: 49f7db neg r11
140305a02: 4f8d1c5b lea r11, [r11 + r11*2]
140305a06: f3420f6f64d9e8 movdqu xmm4, xmmword ptr [rcx + r11*8 - 0x18]
140305a0d: 660f74e2 pcmpeqb xmm4, xmm2
140305a11: 66440fd7f4 pmovmskb r14d, xmm4
140305a16: 4181feffff0000 cmp r14d, 0xffff
140305a1d: 0f84d5000000 je 0x140305af8
140305a23: 458d5aff lea r11d, [r10 - 1]
140305a27: 664521d3 and r11w, r10w
140305a2b: 4589da mov r10d, r11d
140305a2e: 75c4 jne 0x1403059f4
140305a30: 660f74d9 pcmpeqb xmm3, xmm1
140305a34: 66440fd7d3 pmovmskb r10d, xmm3
140305a39: 4585d2 test r10d, r10d
140305a3c: 750d jne 0x140305a4b
140305a3e: 4c01ca add rdx, r9
140305a41: 4883c210 add rdx, 0x10
140305a45: 4983c110 add r9, 0x10
140305a49: eb8f jmp 0x1403059da
140305a4b: 0fb68ea0000000 movzx ecx, byte ptr [rsi + 0xa0]
140305a52: 488b8ee0000000 mov rcx, qword ptr [rsi + 0xe0]
140305a59: 488b96e8000000 mov rdx, qword ptr [rsi + 0xe8]
140305a60: 49b8288d3d736737b884 movabs r8, 0x84b83767733d8d28
140305a6a: 4531c9 xor r9d, r9d
140305a6d: 660f6f05bb8bab05 movdqa xmm0, xmmword ptr [rip + 0x5ab8bbb]
140305a75: 660f76c9 pcmpeqd xmm1, xmm1
140305a79: 660f6f15bf8bab05 movdqa xmm2, xmmword ptr [rip + 0x5ab8bbf]
140305a81: 4921d0 and r8, rdx
140305a84: f3420f6f1c01 movdqu xmm3, xmmword ptr [rcx + r8]
140305a8a: 660f6fe3 movdqa xmm4, xmm3
140305a8e: 660f74e0 pcmpeqb xmm4, xmm0
140305a92: 66440fd7f4 pmovmskb r14d, xmm4
140305a97: 4585f6 test r14d, r14d
140305a9a: 743d je 0x140305ad9
140305a9c: f3450fbcde tzcnt r11d, r14d
140305aa1: 4d01c3 add r11, r8
140305aa4: 4921d3 and r11, rdx
140305aa7: 4d89df mov r15, r11
140305aaa: 49c1e707 shl r15, 7
140305aae: 4989ca mov r10, rcx
140305ab1: 4d29fa sub r10, r15
140305ab4: f3410f6f6280 movdqu xmm4, xmmword ptr [r10 - 0x80]
140305aba: 660f74e2 pcmpeqb xmm4, xmm2
140305abe: 66440fd7fc pmovmskb r15d, xmm4
140305ac3: 4181ffffff0000 cmp r15d, 0xffff
140305aca: 7439 je 0x140305b05
140305acc: 458d56ff lea r10d, [r14 - 1]
140305ad0: 664521f2 and r10w, r14w
140305ad4: 4589d6 mov r14d, r10d
140305ad7: 75c3 jne 0x140305a9c
140305ad9: 660f74d9 pcmpeqb xmm3, xmm1
140305add: 66440fd7d3 pmovmskb r10d, xmm3
140305ae2: 4585d2 test r10d, r10d
140305ae5: 0f858f000000 jne 0x140305b7a
140305aeb: 4d01c8 add r8, r9
140305aee: 4983c010 add r8, 0x10
140305af2: 4983c110 add r9, 0x10
140305af6: eb89 jmp 0x140305a81
140305af8: 4a8d04d9 lea rax, [rcx + r11*8]
140305afc: 4c8b70f8 mov r14, qword ptr [rax - 8]
140305b00: e901020000 jmp 0x140305d06
140305b05: 4d8d43f0 lea r8, [r11 - 0x10]
140305b09: 4921d0 and r8, rdx
140305b0c: f3420f6f0401 movdqu xmm0, xmmword ptr [rcx + r8]
140305b12: 660f76c9 pcmpeqd xmm1, xmm1
140305b16: 660f74c1 pcmpeqb xmm0, xmm1
140305b1a: 660fd7d0 pmovmskb edx, xmm0
140305b1e: f3420f6f0419 movdqu xmm0, xmmword ptr [rcx + r11]
140305b24: 660f74c1 pcmpeqb xmm0, xmm1
140305b28: 66440fd7c8 pmovmskb r9d, xmm0
140305b2d: 6641be1f00 mov r14w, 0x1f
140305b32: 66440fbdf2 bsr r14w, dx
140305b37: 4183f60f xor r14d, 0xf
140305b3b: 4181c900000100 or r9d, 0x10000
140305b42: f3450fbcc9 tzcnt r9d, r9d
140305b47: 4501f1 add r9d, r14d
140305b4a: b280 mov dl, 0x80
140305b4c: 664183f90f cmp r9w, 0xf
140305b51: 7709 ja 0x140305b5c
140305b53: 48ff86f0000000 inc qword ptr [rsi + 0xf0]
140305b5a: b2ff mov dl, 0xff
140305b5c: 42881419 mov byte ptr [rcx + r11], dl
140305b60: 4288540110 mov byte ptr [rcx + r8 + 0x10], dl
140305b65: 48ff8ef8000000 dec qword ptr [rsi + 0xf8]
140305b6c: 498b4a90 mov rcx, qword ptr [r10 - 0x70]
140305b70: 4883f902 cmp rcx, 2
140305b74: 0f850f010000 jne 0x140305c89
140305b7a: 4c8b30 mov r14, qword ptr [rax]
140305b7d: 498d4e01 lea rcx, [r14 + 1]
140305b81: 488908 mov qword ptr [rax], rcx
140305b84: 66c745780001 mov word ptr [rbp + 0x78], 0x100
140305b8a: 48c7452801000000 mov qword ptr [rbp + 0x28], 1
140305b92: f30f6f05ae74b005 movdqu xmm0, xmmword ptr [rip + 0x5b074ae]
140305b9a: f30f7f4530 movdqu xmmword ptr [rbp + 0x30], xmm0
140305b9f: 48c7455008000000 mov qword ptr [rbp + 0x50], 8
140305ba7: 48c7455870000000 mov qword ptr [rbp + 0x58], 0x70
140305baf: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
140305bb7: c6457a01 mov byte ptr [rbp + 0x7a], 1
140305bbb: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
140305bc3: c6456002 mov byte ptr [rbp + 0x60], 2
140305bc7: 4c8d4528 lea r8, [rbp + 0x28]
140305bcb: 4889d9 mov rcx, rbx
140305bce: 4c89f2 mov rdx, r14
140305bd1: e83aafd0ff call 0x140010b10
140305bd6: 90 nop
140305bd7: 488d4e78 lea rcx, [rsi + 0x78]
140305bdb: 488d156674b005 lea rdx, [rip + 0x5b07466]
140305be2: 4d89f0 mov r8, r14
140305be5: e876add0ff call 0x140010960
140305bea: 90 nop
140305beb: e916010000 jmp 0x140305d06
140305bf0: 488b05b173d807 mov rax, qword ptr [rip + 0x7d873b1]
140305bf7: 488b00 mov rax, qword ptr [rax]
140305bfa: 4883f804 cmp rax, 4
140305bfe: 0f8341020000 jae 0x140305e45
140305c04: 0fb615c5b4d407 movzx edx, byte ptr [rip + 0x7d4b4c5]
140305c0b: 0fb6c2 movzx eax, dl
140305c0e: 8d48ff lea ecx, [rax - 1]
140305c11: 83f902 cmp ecx, 2
140305c14: 0f833b020000 jae 0x140305e55
140305c1a: 488b0d9fb4d407 mov rcx, qword ptr [rip + 0x7d4b49f]
140305c21: e89a329604 call 0x144c68ec0
140305c26: 84c0 test al, al
140305c28: 0f8417020000 je 0x140305e45
140305c2e: 488b0d8bb4d407 mov rcx, qword ptr [rip + 0x7d4b48b]
140305c35: 488d4130 lea rax, [rcx + 0x30]
140305c39: 488d15480eb105 lea rdx, [rip + 0x5b10e48]
140305c40: 488955b0 mov qword ptr [rbp - 0x50], rdx
140305c44: 48c745b857000000 mov qword ptr [rbp - 0x48], 0x57
140305c4c: 488d55b0 lea rdx, [rbp - 0x50]
140305c50: 488955a0 mov qword ptr [rbp - 0x60], rdx
140305c54: 488d155d0eb105 lea rdx, [rip + 0x5b10e5d]
140305c5b: 488955a8 mov qword ptr [rbp - 0x58], rdx
140305c5f: 48c7452801000000 mov qword ptr [rbp + 0x28], 1
140305c67: 488d55a0 lea rdx, [rbp - 0x60]
140305c6b: 48895530 mov qword ptr [rbp + 0x30], rdx
140305c6f: 48c7453801000000 mov qword ptr [rbp + 0x38], 1
140305c77: 48894540 mov qword ptr [rbp + 0x40], rax
140305c7b: 488d5528 lea rdx, [rbp + 0x28]
140305c7f: e85c4a9604 call 0x144c6a6e0
140305c84: e9bc010000 jmp 0x140305e45
140305c89: 498b42f8 mov rax, qword ptr [r10 - 8]
140305c8d: 48898590000000 mov qword ptr [rbp + 0x90], rax
140305c94: 410f1042e8 movups xmm0, xmmword ptr [r10 - 0x18]
140305c99: 0f118580000000 movups xmmword ptr [rbp + 0x80], xmm0
140305ca0: 410f1042d8 movups xmm0, xmmword ptr [r10 - 0x28]
140305ca5: 0f114570 movups xmmword ptr [rbp + 0x70], xmm0
140305ca9: f3410f6f4298 movdqu xmm0, xmmword ptr [r10 - 0x68]
140305caf: f3410f6f4aa8 movdqu xmm1, xmmword ptr [r10 - 0x58]
140305cb5: f3410f6f52b8 movdqu xmm2, xmmword ptr [r10 - 0x48]
140305cbb: f3410f6f5ac8 movdqu xmm3, xmmword ptr [r10 - 0x38]
140305cc1: f30f7f5d60 movdqu xmmword ptr [rbp + 0x60], xmm3
140305cc6: f30f7f5550 movdqu xmmword ptr [rbp + 0x50], xmm2
140305ccb: f30f7f4d40 movdqu xmmword ptr [rbp + 0x40], xmm1
140305cd0: f30f7f4530 movdqu xmmword ptr [rbp + 0x30], xmm0
140305cd5: 48894d28 mov qword ptr [rbp + 0x28], rcx
140305cd9: 488d4d28 lea rcx, [rbp + 0x28]
140305cdd: 488d55b0 lea rdx, [rbp - 0x50]
140305ce1: e82ae8b004 call 0x144e14510
140305ce6: 90 nop
140305ce7: 4989c6 mov r14, rax
140305cea: 488b55b0 mov rdx, qword ptr [rbp - 0x50]
140305cee: 4885d2 test rdx, rdx
140305cf1: 7413 je 0x140305d06
140305cf3: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
140305cf7: 48c1e203 shl rdx, 3
140305cfb: 41b808000000 mov r8d, 8
140305d01: e8cac4cfff call 0x1400021d0
140305d06: 48897d28 mov qword ptr [rbp + 0x28], rdi
140305d0a: c7453000000000 mov dword ptr [rbp + 0x30], 0
140305d11: c7454800000000 mov dword ptr [rbp + 0x48], 0
140305d18: c7456000000000 mov dword ptr [rbp + 0x60], 0
140305d1f: c7457800000000 mov dword ptr [rbp + 0x78], 0
140305d26: c7859000000000000000 mov dword ptr [rbp + 0x90], 0
140305d30: 448bbeb0050000 mov r15d, dword ptr [rsi + 0x5b0]
140305d37: 4889f1 mov rcx, rsi
140305d3a: e8a1b8b604 call 0x144e715e0
140305d3f: 4c8975b0 mov qword ptr [rbp - 0x50], r14
140305d43: 488d8ed8010000 lea rcx, [rsi + 0x1d8]
140305d4a: 4c8d4db0 lea r9, [rbp - 0x50]
140305d4e: 4c89f2 mov rdx, r14
140305d51: 4989d8 mov r8, rbx
140305d54: e8d7fce4ff call 0x140155a30
140305d59: 4889c7 mov rdi, rax
140305d5c: 80783001 cmp byte ptr [rax + 0x30], 1
140305d60: 7510 jne 0x140305d72
140305d62: 4c8d4528 lea r8, [rbp + 0x28]
140305d66: 4889f9 mov rcx, rdi
140305d69: 31d2 xor edx, edx
140305d6b: e880aeb704 call 0x144e80bf0
140305d70: eb19 jmp 0x140305d8b
140305d72: 4c8b4708 mov r8, qword ptr [rdi + 8]
140305d76: 488b4f10 mov rcx, qword ptr [rdi + 0x10]
140305d7a: 488d5528 lea rdx, [rbp + 0x28]
140305d7e: e86a469005 call 0x145c0a3ed
140305d83: 44897f28 mov dword ptr [rdi + 0x28], r15d
140305d87: c6473001 mov byte ptr [rdi + 0x30], 1
140305d8b: 44897f2c mov dword ptr [rdi + 0x2c], r15d
140305d8f: e86cc4cfff call 0x140002200
140305d94: b978000000 mov ecx, 0x78
140305d99: ba08000000 mov edx, 8
140305d9e: e81dc4cfff call 0x1400021c0
140305da3: 4885c0 test rax, rax
140305da6: 0f84c5000000 je 0x140305e71
140305dac: 48c700ffffffff mov qword ptr [rax], 0xffffffffffffffff
140305db3: c7407000000000 mov dword ptr [rax + 0x70], 0
140305dba: c6407400 mov byte ptr [rax + 0x74], 0
140305dbe: 4c8d05ab11b105 lea r8, [rip + 0x5b111ab]
140305dc5: 488d4d28 lea rcx, [rbp + 0x28]
140305dc9: 4889c2 mov rdx, rax
140305dcc: e84f54b204 call 0x144e2b220
140305dd1: 90 nop
140305dd2: 488b0dc7d8d807 mov rcx, qword ptr [rip + 0x7d8d8c7]
140305dd9: 4c8d05586bac05 lea r8, [rip + 0x5ac6b58]
140305de0: 488d959f000000 lea rdx, [rbp + 0x9f]
140305de7: e85407ebff call 0x1401b6540
140305dec: 90 nop
140305ded: 4989d0 mov r8, rdx
140305df0: 488d4d28 lea rcx, [rbp + 0x28]
140305df4: 4889c2 mov rdx, rax
140305df7: e8d416e5ff call 0x1401574d0
140305dfc: 90 nop
140305dfd: 0f108588000000 movups xmm0, xmmword ptr [rbp + 0x88]
140305e04: 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
140305e08: 0f104578 movups xmm0, xmmword ptr [rbp + 0x78]
140305e0c: 0f294500 movaps xmmword ptr [rbp], xmm0
140305e10: 0f104568 movups xmm0, xmmword ptr [rbp + 0x68]
140305e14: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140305e18: 0f104528 movups xmm0, xmmword ptr [rbp + 0x28]
140305e1c: 0f104d38 movups xmm1, xmmword ptr [rbp + 0x38]
140305e20: 0f105548 movups xmm2, xmmword ptr [rbp + 0x48]
140305e24: 0f105d58 movups xmm3, xmmword ptr [rbp + 0x58]
140305e28: 0f295de0 movaps xmmword ptr [rbp - 0x20], xmm3
140305e2c: 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
140305e30: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
140305e34: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
140305e38: 488d55b0 lea rdx, [rbp - 0x50]
140305e3c: 4889f1 mov rcx, rsi
140305e3f: e8bcded8ff call 0x140093d00
140305e44: 90 nop
140305e45: 4881c428010000 add rsp, 0x128
140305e4c: 5b pop rbx
140305e4d: 5f pop rdi
140305e4e: 5e pop rsi
140305e4f: 415e pop r14
140305e51: 415f pop r15
140305e53: 5d pop rbp
140305e54: c3 ret
140305e55: 85c0 test eax, eax
140305e57: 74ec je 0x140305e45
140305e59: 488d0d60b2d407 lea rcx, [rip + 0x7d4b260]
140305e60: e87bf6a405 call 0x145d554e0
140305e65: 89c2 mov edx, eax
140305e67: 84c0 test al, al
140305e69: 0f85abfdffff jne 0x140305c1a
140305e6f: ebd4 jmp 0x140305e45
140305e71: b908000000 mov ecx, 8
140305e76: ba78000000 mov edx, 0x78
140305e7b: e85136aa05 call 0x145da94d1
140305e80: 0f0b ud2
