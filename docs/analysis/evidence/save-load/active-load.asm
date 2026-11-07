14589d550: 55 push rbp
14589d551: 4157 push r15
14589d553: 4156 push r14
14589d555: 56 push rsi
14589d556: 57 push rdi
14589d557: 53 push rbx
14589d558: 4881eca8000000 sub rsp, 0xa8
14589d55f: 488dac2480000000 lea rbp, [rsp + 0x80]
14589d567: 48c74520feffffff mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
14589d56f: 4889ce mov rsi, rcx
14589d572: 488d4df0 lea rcx, [rbp - 0x10]
14589d576: e8f51f0500 call 0x1458ef570
14589d57b: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14589d57f: 4883f8ff cmp rax, -1
14589d583: 0f8494000000 je 0x14589d61d
14589d589: 48894508 mov qword ptr [rbp + 8], rax
14589d58d: 488b4df8 mov rcx, qword ptr [rbp - 8]
14589d591: 488b7d00 mov rdi, qword ptr [rbp]
14589d595: 48894d18 mov qword ptr [rbp + 0x18], rcx
14589d599: 4889fa mov rdx, rdi
14589d59c: e83fd78bfb call 0x14115ace0
14589d5a1: 90 nop
14589d5a2: 4883fa05 cmp rdx, 5
14589d5a6: 721d jb 0x14589d5c5
14589d5a8: 8b0d945c6301 mov ecx, dword ptr [rip + 0x1635c94]
14589d5ae: 3308 xor ecx, dword ptr [rax]
14589d5b0: 0fb6158f5c6301 movzx edx, byte ptr [rip + 0x1635c8f]
14589d5b7: 325004 xor dl, byte ptr [rax + 4]
14589d5ba: 0fb6c2 movzx eax, dl
14589d5bd: 09c8 or eax, ecx
14589d5bf: 0f84cf010000 je 0x14589d794
14589d5c5: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d5c9: 4889fa mov rdx, rdi
14589d5cc: e82fbc7efa call 0x140089200
14589d5d1: 90 nop
14589d5d2: 4885d2 test rdx, rdx
14589d5d5: 0f847e010000 je 0x14589d759
14589d5db: 488d1516e13401 lea rdx, [rip + 0x134e116]
14589d5e2: 488d4df0 lea rcx, [rbp - 0x10]
14589d5e6: 41b811000000 mov r8d, 0x11
14589d5ec: e8cf2b0500 call 0x1458f01c0
14589d5f1: 90 nop
14589d5f2: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14589d5f6: 4883faff cmp rdx, -1
14589d5fa: 0f8440010000 je 0x14589d740
14589d600: 4885d2 test rdx, rdx
14589d603: 0f8450010000 je 0x14589d759
14589d609: 488b4df8 mov rcx, qword ptr [rbp - 8]
14589d60d: 41b801000000 mov r8d, 1
14589d613: e8b84b76fa call 0x1400021d0
14589d618: e93c010000 jmp 0x14589d759
14589d61d: 0f57c0 xorps xmm0, xmm0
14589d620: 0f1186b0010000 movups xmmword ptr [rsi + 0x1b0], xmm0
14589d627: 0f1186a0010000 movups xmmword ptr [rsi + 0x1a0], xmm0
14589d62e: 0f118690010000 movups xmmword ptr [rsi + 0x190], xmm0
14589d635: 48c786c001000000000000 mov qword ptr [rsi + 0x1c0], 0
14589d640: 48c70600000000 mov qword ptr [rsi], 0
14589d647: 48c7460808000000 mov qword ptr [rsi + 8], 8
14589d64f: 0f114610 movups xmmword ptr [rsi + 0x10], xmm0
14589d653: 48c78650010000ffffffff mov qword ptr [rsi + 0x150], 0xffffffffffffffff
14589d65e: 48c7462008000000 mov qword ptr [rsi + 0x20], 8
14589d666: 0f114628 movups xmmword ptr [rsi + 0x28], xmm0
14589d66a: 48c7463804000000 mov qword ptr [rsi + 0x38], 4
14589d672: 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
14589d676: 48c7465004000000 mov qword ptr [rsi + 0x50], 4
14589d67e: 0f114658 movups xmmword ptr [rsi + 0x58], xmm0
14589d682: 48c7466808000000 mov qword ptr [rsi + 0x68], 8
14589d68a: 0f114670 movups xmmword ptr [rsi + 0x70], xmm0
14589d68e: 48c7868000000008000000 mov qword ptr [rsi + 0x80], 8
14589d699: 0f118688000000 movups xmmword ptr [rsi + 0x88], xmm0
14589d6a0: 48c7869800000008000000 mov qword ptr [rsi + 0x98], 8
14589d6ab: 0f1186a0000000 movups xmmword ptr [rsi + 0xa0], xmm0
14589d6b2: 48c786b000000008000000 mov qword ptr [rsi + 0xb0], 8
14589d6bd: 0f1186b8000000 movups xmmword ptr [rsi + 0xb8], xmm0
14589d6c4: 48c786c800000008000000 mov qword ptr [rsi + 0xc8], 8
14589d6cf: 0f1186d0000000 movups xmmword ptr [rsi + 0xd0], xmm0
14589d6d6: 48c786e000000008000000 mov qword ptr [rsi + 0xe0], 8
14589d6e1: 0f1186e8000000 movups xmmword ptr [rsi + 0xe8], xmm0
14589d6e8: 48c786f800000008000000 mov qword ptr [rsi + 0xf8], 8
14589d6f3: 0f118600010000 movups xmmword ptr [rsi + 0x100], xmm0
14589d6fa: 48c7861001000004000000 mov qword ptr [rsi + 0x110], 4
14589d705: c786c801000000000000 mov dword ptr [rsi + 0x1c8], 0
14589d70f: 0f118618010000 movups xmmword ptr [rsi + 0x118], xmm0
14589d716: 48c7862801000008000000 mov qword ptr [rsi + 0x128], 8
14589d721: 0f118630010000 movups xmmword ptr [rsi + 0x130], xmm0
14589d728: 48c7864001000001000000 mov qword ptr [rsi + 0x140], 1
14589d733: 48c7864801000000000000 mov qword ptr [rsi + 0x148], 0
14589d73e: eb41 jmp 0x14589d781
14589d740: 488d0db1df3401 lea rcx, [rip + 0x134dfb1]
14589d747: ba11000000 mov edx, 0x11
14589d74c: 4c8b4518 mov r8, qword ptr [rbp + 0x18]
14589d750: 4989f9 mov r9, rdi
14589d753: e8d8170500 call 0x1458eef30
14589d758: 90 nop
14589d759: 4889f1 mov rcx, rsi
14589d75c: 488b5518 mov rdx, qword ptr [rbp + 0x18]
14589d760: 4989f8 mov r8, rdi
14589d763: e8180c0000 call 0x14589e380
14589d768: 90 nop
14589d769: 488b5508 mov rdx, qword ptr [rbp + 8]
14589d76d: 4885d2 test rdx, rdx
14589d770: 740f je 0x14589d781
14589d772: 41b801000000 mov r8d, 1
14589d778: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d77c: e84f4a76fa call 0x1400021d0
14589d781: 4889f0 mov rax, rsi
14589d784: 4881c4a8000000 add rsp, 0xa8
14589d78b: 5b pop rbx
14589d78c: 5f pop rdi
14589d78d: 5e pop rsi
14589d78e: 415e pop r14
14589d790: 415f pop r15
14589d792: 5d pop rbp
14589d793: c3 ret
14589d794: 488d4da8 lea rcx, [rbp - 0x58]
14589d798: 488b5518 mov rdx, qword ptr [rbp + 0x18]
14589d79c: 4989f8 mov r8, rdi
14589d79f: e8ac910500 call 0x1458f6950
14589d7a4: 90 nop
14589d7a5: 488b45a8 mov rax, qword ptr [rbp - 0x58]
14589d7a9: 4883f8ff cmp rax, -1
14589d7ad: 7439 je 0x14589d7e8
14589d7af: 48894510 mov qword ptr [rbp + 0x10], rax
14589d7b3: 488b55b0 mov rdx, qword ptr [rbp - 0x50]
14589d7b7: 4c8b45b8 mov r8, qword ptr [rbp - 0x48]
14589d7bb: 4889f1 mov rcx, rsi
14589d7be: 488955e8 mov qword ptr [rbp - 0x18], rdx
14589d7c2: e8b90b0000 call 0x14589e380
14589d7c7: 90 nop
14589d7c8: 488b5510 mov rdx, qword ptr [rbp + 0x10]
14589d7cc: 4885d2 test rdx, rdx
14589d7cf: 488b7d08 mov rdi, qword ptr [rbp + 8]
14589d7d3: 0f847c050000 je 0x14589dd55
14589d7d9: 41b801000000 mov r8d, 1
14589d7df: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
14589d7e3: e968050000 jmp 0x14589dd50
14589d7e8: 41b801000000 mov r8d, 1
14589d7ee: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d7f2: 4889fa mov rdx, rdi
14589d7f5: e8d6e1ffff call 0x14589b9d0
14589d7fa: 90 nop
14589d7fb: a801 test al, 1
14589d7fd: 0f8516030000 jne 0x14589db19
14589d803: 41b802000000 mov r8d, 2
14589d809: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d80d: 4889fa mov rdx, rdi
14589d810: e8bbe1ffff call 0x14589b9d0
14589d815: 90 nop
14589d816: a801 test al, 1
14589d818: 0f85fb020000 jne 0x14589db19
14589d81e: 41b803000000 mov r8d, 3
14589d824: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d828: 4889fa mov rdx, rdi
14589d82b: e8a0e1ffff call 0x14589b9d0
14589d830: 90 nop
14589d831: a801 test al, 1
14589d833: 0f85e0020000 jne 0x14589db19
14589d839: 41b804000000 mov r8d, 4
14589d83f: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d843: 4889fa mov rdx, rdi
14589d846: e885e1ffff call 0x14589b9d0
14589d84b: 90 nop
14589d84c: a801 test al, 1
14589d84e: 0f85c5020000 jne 0x14589db19
14589d854: 41b805000000 mov r8d, 5
14589d85a: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d85e: 4889fa mov rdx, rdi
14589d861: e86ae1ffff call 0x14589b9d0
14589d866: 90 nop
14589d867: a801 test al, 1
14589d869: 0f85aa020000 jne 0x14589db19
14589d86f: 41b806000000 mov r8d, 6
14589d875: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d879: 4889fa mov rdx, rdi
14589d87c: e84fe1ffff call 0x14589b9d0
14589d881: 90 nop
14589d882: a801 test al, 1
14589d884: 0f858f020000 jne 0x14589db19
14589d88a: 41b807000000 mov r8d, 7
14589d890: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d894: 4889fa mov rdx, rdi
14589d897: e834e1ffff call 0x14589b9d0
14589d89c: 90 nop
14589d89d: a801 test al, 1
14589d89f: 0f8574020000 jne 0x14589db19
14589d8a5: 41b808000000 mov r8d, 8
14589d8ab: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d8af: 4889fa mov rdx, rdi
14589d8b2: e819e1ffff call 0x14589b9d0
14589d8b7: 90 nop
14589d8b8: a801 test al, 1
14589d8ba: 0f8559020000 jne 0x14589db19
14589d8c0: 41b809000000 mov r8d, 9
14589d8c6: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d8ca: 4889fa mov rdx, rdi
14589d8cd: e8fee0ffff call 0x14589b9d0
14589d8d2: 90 nop
14589d8d3: a801 test al, 1
14589d8d5: 0f853e020000 jne 0x14589db19
14589d8db: 41b80a000000 mov r8d, 0xa
14589d8e1: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d8e5: 4889fa mov rdx, rdi
14589d8e8: e8e3e0ffff call 0x14589b9d0
14589d8ed: 90 nop
14589d8ee: a801 test al, 1
14589d8f0: 0f8523020000 jne 0x14589db19
14589d8f6: 41b80b000000 mov r8d, 0xb
14589d8fc: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d900: 4889fa mov rdx, rdi
14589d903: e8c8e0ffff call 0x14589b9d0
14589d908: 90 nop
14589d909: a801 test al, 1
14589d90b: 0f8508020000 jne 0x14589db19
14589d911: 41b80c000000 mov r8d, 0xc
14589d917: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d91b: 4889fa mov rdx, rdi
14589d91e: e8ade0ffff call 0x14589b9d0
14589d923: 90 nop
14589d924: a801 test al, 1
14589d926: 0f85ed010000 jne 0x14589db19
14589d92c: 41b80d000000 mov r8d, 0xd
14589d932: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d936: 4889fa mov rdx, rdi
14589d939: e892e0ffff call 0x14589b9d0
14589d93e: 90 nop
14589d93f: a801 test al, 1
14589d941: 0f85d2010000 jne 0x14589db19
14589d947: 41b80e000000 mov r8d, 0xe
14589d94d: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d951: 4889fa mov rdx, rdi
14589d954: e877e0ffff call 0x14589b9d0
14589d959: 90 nop
14589d95a: a801 test al, 1
14589d95c: 0f85b7010000 jne 0x14589db19
14589d962: 41b80f000000 mov r8d, 0xf
14589d968: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d96c: 4889fa mov rdx, rdi
14589d96f: e85ce0ffff call 0x14589b9d0
14589d974: 90 nop
14589d975: a801 test al, 1
14589d977: 0f859c010000 jne 0x14589db19
14589d97d: 41b810000000 mov r8d, 0x10
14589d983: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d987: 4889fa mov rdx, rdi
14589d98a: e841e0ffff call 0x14589b9d0
14589d98f: 90 nop
14589d990: a801 test al, 1
14589d992: 0f8581010000 jne 0x14589db19
14589d998: 41b811000000 mov r8d, 0x11
14589d99e: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d9a2: 4889fa mov rdx, rdi
14589d9a5: e826e0ffff call 0x14589b9d0
14589d9aa: 90 nop
14589d9ab: a801 test al, 1
14589d9ad: 0f8566010000 jne 0x14589db19
14589d9b3: 41b812000000 mov r8d, 0x12
14589d9b9: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d9bd: 4889fa mov rdx, rdi
14589d9c0: e80be0ffff call 0x14589b9d0
14589d9c5: 90 nop
14589d9c6: a801 test al, 1
14589d9c8: 0f854b010000 jne 0x14589db19
14589d9ce: 41b813000000 mov r8d, 0x13
14589d9d4: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d9d8: 4889fa mov rdx, rdi
14589d9db: e8f0dfffff call 0x14589b9d0
14589d9e0: 90 nop
14589d9e1: a801 test al, 1
14589d9e3: 0f8530010000 jne 0x14589db19
14589d9e9: 41b814000000 mov r8d, 0x14
14589d9ef: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589d9f3: 4889fa mov rdx, rdi
14589d9f6: e8d5dfffff call 0x14589b9d0
14589d9fb: 90 nop
14589d9fc: a801 test al, 1
14589d9fe: 0f8515010000 jne 0x14589db19
14589da04: 41b815000000 mov r8d, 0x15
14589da0a: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589da0e: 4889fa mov rdx, rdi
14589da11: e8badfffff call 0x14589b9d0
14589da16: 90 nop
14589da17: a801 test al, 1
14589da19: 0f85fa000000 jne 0x14589db19
14589da1f: 41b816000000 mov r8d, 0x16
14589da25: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589da29: 4889fa mov rdx, rdi
14589da2c: e89fdfffff call 0x14589b9d0
14589da31: 90 nop
14589da32: a801 test al, 1
14589da34: 0f85df000000 jne 0x14589db19
14589da3a: 41b817000000 mov r8d, 0x17
14589da40: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589da44: 4889fa mov rdx, rdi
14589da47: e884dfffff call 0x14589b9d0
14589da4c: 90 nop
14589da4d: a801 test al, 1
14589da4f: 0f85c4000000 jne 0x14589db19
14589da55: 41b818000000 mov r8d, 0x18
14589da5b: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589da5f: 4889fa mov rdx, rdi
14589da62: e869dfffff call 0x14589b9d0
14589da67: 90 nop
14589da68: a801 test al, 1
14589da6a: 0f85a9000000 jne 0x14589db19
14589da70: 41b819000000 mov r8d, 0x19
14589da76: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589da7a: 4889fa mov rdx, rdi
14589da7d: e84edfffff call 0x14589b9d0
14589da82: 90 nop
14589da83: a801 test al, 1
14589da85: 0f858e000000 jne 0x14589db19
14589da8b: 41b81a000000 mov r8d, 0x1a
14589da91: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589da95: 4889fa mov rdx, rdi
14589da98: e833dfffff call 0x14589b9d0
14589da9d: 90 nop
14589da9e: a801 test al, 1
14589daa0: 7577 jne 0x14589db19
14589daa2: 41b81b000000 mov r8d, 0x1b
14589daa8: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589daac: 4889fa mov rdx, rdi
14589daaf: e81cdfffff call 0x14589b9d0
14589dab4: 90 nop
14589dab5: a801 test al, 1
14589dab7: 7560 jne 0x14589db19
14589dab9: 41b81c000000 mov r8d, 0x1c
14589dabf: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589dac3: 4889fa mov rdx, rdi
14589dac6: e805dfffff call 0x14589b9d0
14589dacb: 90 nop
14589dacc: a801 test al, 1
14589dace: 7549 jne 0x14589db19
14589dad0: 41b81d000000 mov r8d, 0x1d
14589dad6: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589dada: 4889fa mov rdx, rdi
14589dadd: e8eedeffff call 0x14589b9d0
14589dae2: 90 nop
14589dae3: a801 test al, 1
14589dae5: 7532 jne 0x14589db19
14589dae7: 41b81e000000 mov r8d, 0x1e
14589daed: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589daf1: 4889fa mov rdx, rdi
14589daf4: e8d7deffff call 0x14589b9d0
14589daf9: 90 nop
14589dafa: a801 test al, 1
14589dafc: 751b jne 0x14589db19
14589dafe: 41b81f000000 mov r8d, 0x1f
14589db04: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589db08: 4889fa mov rdx, rdi
14589db0b: e8c0deffff call 0x14589b9d0
14589db10: 90 nop
14589db11: a801 test al, 1
14589db13: 0f8457020000 je 0x14589dd70
14589db19: 4889d3 mov rbx, rdx
14589db1c: 48895dd8 mov qword ptr [rbp - 0x28], rbx
14589db20: 4c8d75d8 lea r14, [rbp - 0x28]
14589db24: 4c8975c0 mov qword ptr [rbp - 0x40], r14
14589db28: 4c8d3da11c3400 lea r15, [rip + 0x341ca1]
14589db2f: 4c897dc8 mov qword ptr [rbp - 0x38], r15
14589db33: 488d15e6da3401 lea rdx, [rip + 0x134dae6]
14589db3a: 488d4df0 lea rcx, [rbp - 0x10]
14589db3e: 4c8d45c0 lea r8, [rbp - 0x40]
14589db42: e8e9f23200 call 0x145bcce30
14589db47: 90 nop
14589db48: 488b4df8 mov rcx, qword ptr [rbp - 8]
14589db4c: 488b5500 mov rdx, qword ptr [rbp]
14589db50: 48894d10 mov qword ptr [rbp + 0x10], rcx
14589db54: 4c8b4518 mov r8, qword ptr [rbp + 0x18]
14589db58: 4989f9 mov r9, rdi
14589db5b: e8d0130500 call 0x1458eef30
14589db60: 90 nop
14589db61: 488b55f0 mov rdx, qword ptr [rbp - 0x10]
14589db65: 4885d2 test rdx, rdx
14589db68: 740f je 0x14589db79
14589db6a: 41b801000000 mov r8d, 1
14589db70: 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14589db74: e8574676fa call 0x1400021d0
14589db79: 48895dd8 mov qword ptr [rbp - 0x28], rbx
14589db7d: 4c8975f0 mov qword ptr [rbp - 0x10], r14
14589db81: 4c897df8 mov qword ptr [rbp - 8], r15
14589db85: 488d1594da3401 lea rdx, [rip + 0x134da94]
14589db8c: 488d7dc0 lea rdi, [rbp - 0x40]
14589db90: 4c8d45f0 lea r8, [rbp - 0x10]
14589db94: 4889f9 mov rcx, rdi
14589db97: e894f23200 call 0x145bcce30
14589db9c: 90 nop
14589db9d: 48897dd8 mov qword ptr [rbp - 0x28], rdi
14589dba1: 488d05384576fa lea rax, [rip - 0x589bac8]
14589dba8: 488945e0 mov qword ptr [rbp - 0x20], rax
14589dbac: 488d1556db3401 lea rdx, [rip + 0x134db56]
14589dbb3: 488d4df0 lea rcx, [rbp - 0x10]
14589dbb7: 488d7dd8 lea rdi, [rbp - 0x28]
14589dbbb: 4989f8 mov r8, rdi
14589dbbe: e86df23200 call 0x145bcce30
14589dbc3: 90 nop
14589dbc4: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14589dbc8: 48894510 mov qword ptr [rbp + 0x10], rax
14589dbcc: 488b4df8 mov rcx, qword ptr [rbp - 8]
14589dbd0: 488b4500 mov rax, qword ptr [rbp]
14589dbd4: 48894de8 mov qword ptr [rbp - 0x18], rcx
14589dbd8: 48894dd8 mov qword ptr [rbp - 0x28], rcx
14589dbdc: 488945e0 mov qword ptr [rbp - 0x20], rax
14589dbe0: 48897df0 mov qword ptr [rbp - 0x10], rdi
14589dbe4: 488d05d54476fa lea rax, [rip - 0x589bb2b]
14589dbeb: 488945f8 mov qword ptr [rbp - 8], rax
14589dbef: 488d0d1a3a3501 lea rcx, [rip + 0x1353a1a]
14589dbf6: 488d55f0 lea rdx, [rbp - 0x10]
14589dbfa: e891893100 call 0x145bb6590
14589dbff: 90 nop
14589dc00: 488b5510 mov rdx, qword ptr [rbp + 0x10]
14589dc04: 4885d2 test rdx, rdx
14589dc07: 740f je 0x14589dc18
14589dc09: 41b801000000 mov r8d, 1
14589dc0f: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
14589dc13: e8b84576fa call 0x1400021d0
14589dc18: 0f57c0 xorps xmm0, xmm0
14589dc1b: 0f1186b0010000 movups xmmword ptr [rsi + 0x1b0], xmm0
14589dc22: 0f1186a0010000 movups xmmword ptr [rsi + 0x1a0], xmm0
14589dc29: 0f118690010000 movups xmmword ptr [rsi + 0x190], xmm0
14589dc30: 48c786c001000000000000 mov qword ptr [rsi + 0x1c0], 0
14589dc3b: 48c70600000000 mov qword ptr [rsi], 0
14589dc42: 48c7460808000000 mov qword ptr [rsi + 8], 8
14589dc4a: 0f114610 movups xmmword ptr [rsi + 0x10], xmm0
14589dc4e: 48c78650010000ffffffff mov qword ptr [rsi + 0x150], 0xffffffffffffffff
14589dc59: 48c7462008000000 mov qword ptr [rsi + 0x20], 8
14589dc61: 0f114628 movups xmmword ptr [rsi + 0x28], xmm0
14589dc65: 48c7463804000000 mov qword ptr [rsi + 0x38], 4
14589dc6d: 0f114640 movups xmmword ptr [rsi + 0x40], xmm0
14589dc71: 48c7465004000000 mov qword ptr [rsi + 0x50], 4
14589dc79: 0f114658 movups xmmword ptr [rsi + 0x58], xmm0
14589dc7d: 48c7466808000000 mov qword ptr [rsi + 0x68], 8
14589dc85: 0f114670 movups xmmword ptr [rsi + 0x70], xmm0
14589dc89: 48c7868000000008000000 mov qword ptr [rsi + 0x80], 8
14589dc94: 0f118688000000 movups xmmword ptr [rsi + 0x88], xmm0
14589dc9b: 48c7869800000008000000 mov qword ptr [rsi + 0x98], 8
14589dca6: 0f1186a0000000 movups xmmword ptr [rsi + 0xa0], xmm0
14589dcad: 48c786b000000008000000 mov qword ptr [rsi + 0xb0], 8
14589dcb8: 0f1186b8000000 movups xmmword ptr [rsi + 0xb8], xmm0
14589dcbf: 48c786c800000008000000 mov qword ptr [rsi + 0xc8], 8
14589dcca: 0f1186d0000000 movups xmmword ptr [rsi + 0xd0], xmm0
14589dcd1: 48c786e000000008000000 mov qword ptr [rsi + 0xe0], 8
14589dcdc: 0f1186e8000000 movups xmmword ptr [rsi + 0xe8], xmm0
14589dce3: 48c786f800000008000000 mov qword ptr [rsi + 0xf8], 8
14589dcee: 0f118600010000 movups xmmword ptr [rsi + 0x100], xmm0
14589dcf5: 48c7861001000004000000 mov qword ptr [rsi + 0x110], 4
14589dd00: c786c801000000000000 mov dword ptr [rsi + 0x1c8], 0
14589dd0a: 0f118618010000 movups xmmword ptr [rsi + 0x118], xmm0
14589dd11: 48c7862801000008000000 mov qword ptr [rsi + 0x128], 8
14589dd1c: 0f118630010000 movups xmmword ptr [rsi + 0x130], xmm0
14589dd23: 48c7864001000001000000 mov qword ptr [rsi + 0x140], 1
14589dd2e: 48c7864801000000000000 mov qword ptr [rsi + 0x148], 0
14589dd39: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14589dd3d: 4885d2 test rdx, rdx
14589dd40: 488b7d08 mov rdi, qword ptr [rbp + 8]
14589dd44: 740f je 0x14589dd55
14589dd46: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14589dd4a: 41b801000000 mov r8d, 1
14589dd50: e87b4476fa call 0x1400021d0
14589dd55: 4885ff test rdi, rdi
14589dd58: 0f8423faffff je 0x14589d781
14589dd5e: 41b801000000 mov r8d, 1
14589dd64: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589dd68: 4889fa mov rdx, rdi
14589dd6b: e90cfaffff jmp 0x14589d77c
14589dd70: bb20000000 mov ebx, 0x20
14589dd75: 41b820000000 mov r8d, 0x20
14589dd7b: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14589dd7f: 4889fa mov rdx, rdi
14589dd82: e849dcffff call 0x14589b9d0
14589dd87: 90 nop
14589dd88: a801 test al, 1
14589dd8a: 480f45da cmovne rbx, rdx
14589dd8e: e989fdffff jmp 0x14589db1c
