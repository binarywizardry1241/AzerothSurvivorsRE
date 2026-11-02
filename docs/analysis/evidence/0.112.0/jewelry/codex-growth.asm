14027268f: 488b8570060000 mov rax, qword ptr [rbp + 0x670]
140272696: 0fb64044 movzx eax, byte ptr [rax + 0x44]
14027269a: 4883f810 cmp rax, 0x10
14027269e: 0f87dc050000 ja 0x140272c80
1402726a4: 488d0db997b905 lea rcx, [rip + 0x5b997b9]
1402726ab: 48630481 movsxd rax, dword ptr [rcx + rax*4]
1402726af: 4801c8 add rax, rcx
1402726b2: ffe0 jmp rax
1402726b4: c6858706000000 mov byte ptr [rbp + 0x687], 0
1402726bb: 488d0db67cb905 lea rcx, [rip + 0x5b97cb6]
1402726c2: ba43000000 mov edx, 0x43
1402726c7: e854b67105 call 0x14598dd20
1402726cc: 90 nop
1402726cd: 4889d6 mov rsi, rdx
1402726d0: 4885d2 test rdx, rdx
1402726d3: 0f89f4020000 jns 0x1402729cd
1402726d9: 4531f6 xor r14d, r14d
1402726dc: c6858706000000 mov byte ptr [rbp + 0x687], 0
1402726e3: 4c89f1 mov rcx, r14
1402726e6: 4889f2 mov rdx, rsi
1402726e9: e8fd6db305 call 0x145da94eb
1402726ee: 90 nop
1402726ef: e98f090000 jmp 0x140273083
1402726f4: 31db xor ebx, ebx
1402726f6: 4889d9 mov rcx, rbx
1402726f9: 4889fa mov rdx, rdi
1402726fc: e8ea6db305 call 0x145da94eb
140272701: 90 nop
140272702: e97c090000 jmp 0x140273083
140272707: bf01000000 mov edi, 1
14027270c: 488b9568060000 mov rdx, qword ptr [rbp + 0x668]
140272713: 803a01 cmp byte ptr [rdx], 1
140272716: 751e jne 0x140272736
140272718: 8b4201 mov eax, dword ptr [rdx + 1]
14027271b: 8b4a04 mov ecx, dword ptr [rdx + 4]
14027271e: 898dc3030000 mov dword ptr [rbp + 0x3c3], ecx
140272724: 8985c0030000 mov dword ptr [rbp + 0x3c0], eax
14027272a: 488b4208 mov rax, qword ptr [rdx + 8]
14027272e: 0fb64a10 movzx ecx, byte ptr [rdx + 0x10]
140272732: b201 mov dl, 1
140272734: eb10 jmp 0x140272746
140272736: 488b4208 mov rax, qword ptr [rdx + 8]
14027273a: f048ff00 lock inc qword ptr [rax]
14027273e: 0f8e3f090000 jle 0x140273083
140272744: 31d2 xor edx, edx
140272746: 440f117dc1 movups xmmword ptr [rbp - 0x3f], xmm15
14027274b: c745d10000803f mov dword ptr [rbp - 0x2f], 0x3f800000
140272752: 4889b5f8030000 mov qword ptr [rbp + 0x3f8], rsi
140272759: 4889bd00040000 mov qword ptr [rbp + 0x400], rdi
140272760: 4889b508040000 mov qword ptr [rbp + 0x408], rsi
140272767: 48c7851004000000000000 mov qword ptr [rbp + 0x410], 0
140272772: 48c7851804000004000000 mov qword ptr [rbp + 0x418], 4
14027277d: 48c7852004000000000000 mov qword ptr [rbp + 0x420], 0
140272788: 889528040000 mov byte ptr [rbp + 0x428], dl
14027278e: 8b95c0030000 mov edx, dword ptr [rbp + 0x3c0]
140272794: 448b85c3030000 mov r8d, dword ptr [rbp + 0x3c3]
14027279b: 899529040000 mov dword ptr [rbp + 0x429], edx
1402727a1: 4489852c040000 mov dword ptr [rbp + 0x42c], r8d
1402727a8: 48898530040000 mov qword ptr [rbp + 0x430], rax
1402727af: 48898d38040000 mov qword ptr [rbp + 0x438], rcx
1402727b6: c7854004000000004041 mov dword ptr [rbp + 0x440], 0x41400000
1402727c0: 66c785440400009001 mov word ptr [rbp + 0x444], 0x190
1402727c9: c6854604000001 mov byte ptr [rbp + 0x446], 1
1402727d0: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
1402727d4: 0f118547040000 movups xmmword ptr [rbp + 0x447], xmm0
1402727db: 488b45cd mov rax, qword ptr [rbp - 0x33]
1402727df: 48898554040000 mov qword ptr [rbp + 0x454], rax
1402727e6: 8b056cc2b405 mov eax, dword ptr [rip + 0x5b4c26c]
1402727ec: 89856c040000 mov dword ptr [rbp + 0x46c], eax
1402727f2: 440f11b55c040000 movups xmmword ptr [rbp + 0x45c], xmm14
1402727fa: f2440f118570040000 movsd qword ptr [rbp + 0x470], xmm8
140272803: 488b8548060000 mov rax, qword ptr [rbp + 0x648]
14027280a: 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
140272811: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272818: 488d8de0010000 lea rcx, [rbp + 0x1e0]
14027281f: 4c8d85f0030000 lea r8, [rbp + 0x3f0]
140272826: 488d95b8010000 lea rdx, [rbp + 0x1b8]
14027282d: e88e0afdff call 0x1402432c0
140272832: 90 nop
140272833: e92c010000 jmp 0x140272964
140272838: bf01000000 mov edi, 1
14027283d: 488b9568060000 mov rdx, qword ptr [rbp + 0x668]
140272844: 803a01 cmp byte ptr [rdx], 1
140272847: 751e jne 0x140272867
140272849: 8b4201 mov eax, dword ptr [rdx + 1]
14027284c: 8b4a04 mov ecx, dword ptr [rdx + 4]
14027284f: 898dbb030000 mov dword ptr [rbp + 0x3bb], ecx
140272855: 8985b8030000 mov dword ptr [rbp + 0x3b8], eax
14027285b: 488b4208 mov rax, qword ptr [rdx + 8]
14027285f: 0fb64a10 movzx ecx, byte ptr [rdx + 0x10]
140272863: b201 mov dl, 1
140272865: eb10 jmp 0x140272877
140272867: 488b4208 mov rax, qword ptr [rdx + 8]
14027286b: f048ff00 lock inc qword ptr [rax]
14027286f: 0f8e0e080000 jle 0x140273083
140272875: 31d2 xor edx, edx
140272877: 440f117dc1 movups xmmword ptr [rbp - 0x3f], xmm15
14027287c: c745d10000803f mov dword ptr [rbp - 0x2f], 0x3f800000
140272883: 4889b5f8030000 mov qword ptr [rbp + 0x3f8], rsi
14027288a: 4889bd00040000 mov qword ptr [rbp + 0x400], rdi
140272891: 4889b508040000 mov qword ptr [rbp + 0x408], rsi
140272898: 48c7851004000000000000 mov qword ptr [rbp + 0x410], 0
1402728a3: 48c7851804000004000000 mov qword ptr [rbp + 0x418], 4
1402728ae: 48c7852004000000000000 mov qword ptr [rbp + 0x420], 0
1402728b9: 889528040000 mov byte ptr [rbp + 0x428], dl
1402728bf: 8b95b8030000 mov edx, dword ptr [rbp + 0x3b8]
1402728c5: 448b85bb030000 mov r8d, dword ptr [rbp + 0x3bb]
1402728cc: 899529040000 mov dword ptr [rbp + 0x429], edx
1402728d2: 4489852c040000 mov dword ptr [rbp + 0x42c], r8d
1402728d9: 48898530040000 mov qword ptr [rbp + 0x430], rax
1402728e0: 48898d38040000 mov qword ptr [rbp + 0x438], rcx
1402728e7: c7854004000000004041 mov dword ptr [rbp + 0x440], 0x41400000
1402728f1: 66c785440400009001 mov word ptr [rbp + 0x444], 0x190
1402728fa: c6854604000001 mov byte ptr [rbp + 0x446], 1
140272901: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
140272905: 0f118547040000 movups xmmword ptr [rbp + 0x447], xmm0
14027290c: 488b45cd mov rax, qword ptr [rbp - 0x33]
140272910: 48898554040000 mov qword ptr [rbp + 0x454], rax
140272917: 8b053bc1b405 mov eax, dword ptr [rip + 0x5b4c13b]
14027291d: 89856c040000 mov dword ptr [rbp + 0x46c], eax
140272923: 440f11b55c040000 movups xmmword ptr [rbp + 0x45c], xmm14
14027292b: f2440f118570040000 movsd qword ptr [rbp + 0x470], xmm8
140272934: 488b8548060000 mov rax, qword ptr [rbp + 0x648]
14027293b: 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
140272942: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272949: 488d8de0010000 lea rcx, [rbp + 0x1e0]
140272950: 4c8d85f0030000 lea r8, [rbp + 0x3f0]
140272957: 488d95b8010000 lea rdx, [rbp + 0x1b8]
14027295e: e85d09fdff call 0x1402432c0
140272963: 90 nop
140272964: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
14027296b: 0f28b590060000 movaps xmm6, xmmword ptr [rbp + 0x690]
140272972: 0f28bda0060000 movaps xmm7, xmmword ptr [rbp + 0x6a0]
140272979: 440f2885b0060000 movaps xmm8, xmmword ptr [rbp + 0x6b0]
140272981: 440f288dc0060000 movaps xmm9, xmmword ptr [rbp + 0x6c0]
140272989: 440f2895d0060000 movaps xmm10, xmmword ptr [rbp + 0x6d0]
140272991: 440f289de0060000 movaps xmm11, xmmword ptr [rbp + 0x6e0]
140272999: 440f28a5f0060000 movaps xmm12, xmmword ptr [rbp + 0x6f0]
1402729a1: 440f28ad00070000 movaps xmm13, xmmword ptr [rbp + 0x700]
1402729a9: 440f28b510070000 movaps xmm14, xmmword ptr [rbp + 0x710]
1402729b1: 440f28bd20070000 movaps xmm15, xmmword ptr [rbp + 0x720]
1402729b9: 4881c4b8070000 add rsp, 0x7b8
1402729c0: 5b pop rbx
1402729c1: 5f pop rdi
1402729c2: 5e pop rsi
1402729c3: 415c pop r12
1402729c5: 415d pop r13
1402729c7: 415e pop r14
1402729c9: 415f pop r15
1402729cb: 5d pop rbp
1402729cc: c3 ret
1402729cd: 4885f6 test rsi, rsi
1402729d0: 0f84b2030000 je 0x140272d88
1402729d6: 4889c7 mov rdi, rax
1402729d9: e822f8d8ff call 0x140002200
1402729de: 41be01000000 mov r14d, 1
1402729e4: ba01000000 mov edx, 1
1402729e9: 4889f1 mov rcx, rsi
1402729ec: e8cff7d8ff call 0x1400021c0
1402729f1: 4885c0 test rax, rax
1402729f4: 0f84e2fcffff je 0x1402726dc
1402729fa: 4889c3 mov rbx, rax
1402729fd: 4889c1 mov rcx, rax
140272a00: 4889fa mov rdx, rdi
140272a03: 4989f0 mov r8, rsi
140272a06: e8d0799905 call 0x145c0a3db
140272a0b: e97d030000 jmp 0x140272d8d
140272a10: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272a17: 488d0deb78b905 lea rcx, [rip + 0x5b978eb]
140272a1e: ba68000000 mov edx, 0x68
140272a23: e8f8b27105 call 0x14598dd20
140272a28: 90 nop
140272a29: 4889c6 mov rsi, rax
140272a2c: 4889d7 mov rdi, rdx
140272a2f: 488b9570060000 mov rdx, qword ptr [rbp + 0x670]
140272a36: f30f105240 movss xmm2, dword ptr [rdx + 0x40]
140272a3b: f30f59153daab305 mulss xmm2, dword ptr [rip + 0x5b3aa3d]
140272a43: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272a4a: 488d9de0010000 lea rbx, [rbp + 0x1e0]
140272a51: 4889d9 mov rcx, rbx
140272a54: e807bd6205 call 0x14589e760
140272a59: 90 nop
140272a5a: 488d051079b905 lea rax, [rip + 0x5b97910]
140272a61: 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
140272a68: 48c785f803000007000000 mov qword ptr [rbp + 0x3f8], 7
140272a73: 48899d00040000 mov qword ptr [rbp + 0x400], rbx
140272a7a: 4c89ad08040000 mov qword ptr [rbp + 0x408], r13
140272a81: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140272a8a: 488d8d00060000 lea rcx, [rbp + 0x600]
140272a91: 4c8d8df0030000 lea r9, [rbp + 0x3f0]
140272a98: 4889f2 mov rdx, rsi
140272a9b: 4989f8 mov r8, rdi
140272a9e: e8ddb67105 call 0x14598e180
140272aa3: 90 nop
140272aa4: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
140272aab: 4885d2 test rdx, rdx
140272aae: 0f843d040000 je 0x140272ef1
140272ab4: 488b8de8010000 mov rcx, qword ptr [rbp + 0x1e8]
140272abb: 41b801000000 mov r8d, 1
140272ac1: e80af7d8ff call 0x1400021d0
140272ac6: e926040000 jmp 0x140272ef1
140272acb: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272ad2: 488d0d9e77b905 lea rcx, [rip + 0x5b9779e]
140272ad9: ba86000000 mov edx, 0x86
140272ade: e83db27105 call 0x14598dd20
140272ae3: 90 nop
140272ae4: 4889c6 mov rsi, rax
140272ae7: 4889d7 mov rdi, rdx
140272aea: 488b8570060000 mov rax, qword ptr [rbp + 0x670]
140272af1: f30f104040 movss xmm0, dword ptr [rax + 0x40]
140272af6: f30f590582a9b305 mulss xmm0, dword ptr [rip + 0x5b3a982]
140272afe: f30f590582a9b305 mulss xmm0, dword ptr [rip + 0x5b3a982]
140272b06: f30f1145c0 movss dword ptr [rbp - 0x40], xmm0
140272b0b: 488d45c0 lea rax, [rbp - 0x40]
140272b0f: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
140272b16: 488d1dc3b39705 lea rbx, [rip + 0x597b3c3]
140272b1d: 48899de8010000 mov qword ptr [rbp + 0x1e8], rbx
140272b24: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272b2b: 488d15cb77b905 lea rdx, [rip + 0x5b977cb]
140272b32: 488d8df0030000 lea rcx, [rbp + 0x3f0]
140272b39: 4c8d85e0010000 lea r8, [rbp + 0x1e0]
140272b40: e8eba59605 call 0x145bdd130
140272b45: 90 nop
140272b46: 0f1085f0030000 movups xmm0, xmmword ptr [rbp + 0x3f0]
140272b4d: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
140272b51: 488b8500040000 mov rax, qword ptr [rbp + 0x400]
140272b58: 488945d0 mov qword ptr [rbp - 0x30], rax
140272b5c: 488b8570060000 mov rax, qword ptr [rbp + 0x670]
140272b63: f30f104040 movss xmm0, dword ptr [rax + 0x40]
140272b68: f30f590510a9b305 mulss xmm0, dword ptr [rip + 0x5b3a910]
140272b70: f30f5905bc3fb405 mulss xmm0, dword ptr [rip + 0x5b43fbc]
140272b78: f30f590508a9b305 mulss xmm0, dword ptr [rip + 0x5b3a908]
140272b80: f30f118500060000 movss dword ptr [rbp + 0x600], xmm0
140272b88: 488d8500060000 lea rax, [rbp + 0x600]
140272b8f: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
140272b96: 48899de8010000 mov qword ptr [rbp + 0x1e8], rbx
140272b9d: 488d15d071b905 lea rdx, [rip + 0x5b971d0]
140272ba4: 488d8df0030000 lea rcx, [rbp + 0x3f0]
140272bab: 488d9de0010000 lea rbx, [rbp + 0x1e0]
140272bb2: 4989d8 mov r8, rbx
140272bb5: e876a59605 call 0x145bdd130
140272bba: 90 nop
140272bbb: 0f1085f0030000 movups xmm0, xmmword ptr [rbp + 0x3f0]
140272bc2: 0f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm0
140272bc9: 488b8500040000 mov rax, qword ptr [rbp + 0x400]
140272bd0: 488985f0010000 mov qword ptr [rbp + 0x1f0], rax
140272bd7: 488d052777b905 lea rax, [rip + 0x5b97727]
140272bde: 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
140272be5: 48c785f803000002000000 mov qword ptr [rbp + 0x3f8], 2
140272bf0: 488d45c0 lea rax, [rbp - 0x40]
140272bf4: 48898500040000 mov qword ptr [rbp + 0x400], rax
140272bfb: 4c89ad08040000 mov qword ptr [rbp + 0x408], r13
140272c02: 488d05fe76b905 lea rax, [rip + 0x5b976fe]
140272c09: 48898510040000 mov qword ptr [rbp + 0x410], rax
140272c10: 48c7851804000002000000 mov qword ptr [rbp + 0x418], 2
140272c1b: 48899d20040000 mov qword ptr [rbp + 0x420], rbx
140272c22: 4c89ad28040000 mov qword ptr [rbp + 0x428], r13
140272c29: 48c744242002000000 mov qword ptr [rsp + 0x20], 2
140272c32: 488d8d00060000 lea rcx, [rbp + 0x600]
140272c39: 4c8d8df0030000 lea r9, [rbp + 0x3f0]
140272c40: 4889f2 mov rdx, rsi
140272c43: 4989f8 mov r8, rdi
140272c46: e835b57105 call 0x14598e180
140272c4b: 90 nop
140272c4c: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
140272c53: 4885d2 test rdx, rdx
140272c56: 7412 je 0x140272c6a
140272c58: 488b8de8010000 mov rcx, qword ptr [rbp + 0x1e8]
140272c5f: 41b801000000 mov r8d, 1
140272c65: e866f5d8ff call 0x1400021d0
140272c6a: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
140272c6e: 4885d2 test rdx, rdx
140272c71: 0f8461020000 je 0x140272ed8
140272c77: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
140272c7b: e94d020000 jmp 0x140272ecd
140272c80: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272c87: 488d0d7677b905 lea rcx, [rip + 0x5b97776]
140272c8e: ba47000000 mov edx, 0x47
140272c93: e888b07105 call 0x14598dd20
140272c98: 90 nop
140272c99: 4889c6 mov rsi, rax
140272c9c: 4889d7 mov rdi, rdx
140272c9f: 488b8570060000 mov rax, qword ptr [rbp + 0x670]
140272ca6: 0fb64044 movzx eax, byte ptr [rax + 0x44]
140272caa: f30f101516e8b305 movss xmm2, dword ptr [rip + 0x5b3e816]
140272cb2: 4883f813 cmp rax, 0x13
140272cb6: 0f870a010000 ja 0x140272dc6
140272cbc: 488d0d3592b905 lea rcx, [rip + 0x5b99235]
140272cc3: 48630481 movsxd rax, dword ptr [rcx + rax*4]
140272cc7: 4801c8 add rax, rcx
140272cca: ffe0 jmp rax
140272ccc: f30f1015c036b905 movss xmm2, dword ptr [rip + 0x5b936c0]
140272cd4: 488b9570060000 mov rdx, qword ptr [rbp + 0x670]
140272cdb: e9f2000000 jmp 0x140272dd2
140272ce0: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272ce7: 488d0d5d77b905 lea rcx, [rip + 0x5b9775d]
140272cee: ba39000000 mov edx, 0x39
140272cf3: e828b07105 call 0x14598dd20
140272cf8: 90 nop
140272cf9: 4989d0 mov r8, rdx
140272cfc: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272d03: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140272d0c: 4c8d0d7577b905 lea r9, [rip + 0x5b97775]
140272d13: 488d8d00060000 lea rcx, [rbp + 0x600]
140272d1a: 4889c2 mov rdx, rax
140272d1d: e85eb47105 call 0x14598e180
140272d22: 90 nop
140272d23: e9c9010000 jmp 0x140272ef1
140272d28: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272d2f: 488d0d8576b905 lea rcx, [rip + 0x5b97685]
140272d36: ba49000000 mov edx, 0x49
140272d3b: e8e0af7105 call 0x14598dd20
140272d40: 90 nop
140272d41: 4889c6 mov rsi, rax
140272d44: 4889d7 mov rdi, rdx
140272d47: 488b8570060000 mov rax, qword ptr [rbp + 0x670]
140272d4e: 0fb64044 movzx eax, byte ptr [rax + 0x44]
140272d52: f30f10156ee7b305 movss xmm2, dword ptr [rip + 0x5b3e76e]
140272d5a: 4883f813 cmp rax, 0x13
140272d5e: 0f87e9000000 ja 0x140272e4d
140272d64: 488d0d3d91b905 lea rcx, [rip + 0x5b9913d]
140272d6b: 48630481 movsxd rax, dword ptr [rcx + rax*4]
140272d6f: 4801c8 add rax, rcx
140272d72: ffe0 jmp rax
140272d74: f30f10151836b905 movss xmm2, dword ptr [rip + 0x5b93618]
140272d7c: 488b9570060000 mov rdx, qword ptr [rbp + 0x670]
140272d83: e9d1000000 jmp 0x140272e59
140272d88: bb01000000 mov ebx, 1
140272d8d: 4889b500060000 mov qword ptr [rbp + 0x600], rsi
140272d94: 48899d08060000 mov qword ptr [rbp + 0x608], rbx
140272d9b: 4889b510060000 mov qword ptr [rbp + 0x610], rsi
140272da2: e94a010000 jmp 0x140272ef1
140272da7: f30f1015d1a6b305 movss xmm2, dword ptr [rip + 0x5b3a6d1]
140272daf: eb15 jmp 0x140272dc6
140272db1: f30f1015c7a6b305 movss xmm2, dword ptr [rip + 0x5b3a6c7]
140272db9: e98f000000 jmp 0x140272e4d
140272dbe: f30f10156e3db405 movss xmm2, dword ptr [rip + 0x5b43d6e]
140272dc6: 488b9570060000 mov rdx, qword ptr [rbp + 0x670]
140272dcd: f30f595240 mulss xmm2, dword ptr [rdx + 0x40]
140272dd2: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272dd9: 488d9de0010000 lea rbx, [rbp + 0x1e0]
140272de0: 4889d9 mov rcx, rbx
140272de3: e878b96205 call 0x14589e760
140272de8: 90 nop
140272de9: 488d058175b905 lea rax, [rip + 0x5b97581]
140272df0: 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
140272df7: 48c785f803000007000000 mov qword ptr [rbp + 0x3f8], 7
140272e02: 48899d00040000 mov qword ptr [rbp + 0x400], rbx
140272e09: 4c89ad08040000 mov qword ptr [rbp + 0x408], r13
140272e10: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140272e19: 488d8d00060000 lea rcx, [rbp + 0x600]
140272e20: 4c8d8df0030000 lea r9, [rbp + 0x3f0]
140272e27: 4889f2 mov rdx, rsi
140272e2a: 4989f8 mov r8, rdi
140272e2d: e84eb37105 call 0x14598e180
140272e32: 90 nop
140272e33: e982000000 jmp 0x140272eba
140272e38: f30f1015f0e8b305 movss xmm2, dword ptr [rip + 0x5b3e8f0]
140272e40: e98ffeffff jmp 0x140272cd4
140272e45: f30f1015e73cb405 movss xmm2, dword ptr [rip + 0x5b43ce7]
140272e4d: 488b9570060000 mov rdx, qword ptr [rbp + 0x670]
140272e54: f30f595240 mulss xmm2, dword ptr [rdx + 0x40]
140272e59: c6858706000000 mov byte ptr [rbp + 0x687], 0
140272e60: 488d9de0010000 lea rbx, [rbp + 0x1e0]
140272e67: 4889d9 mov rcx, rbx
140272e6a: e8f1b86205 call 0x14589e760
140272e6f: 90 nop
140272e70: 488d05fa74b905 lea rax, [rip + 0x5b974fa]
140272e77: 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
140272e7e: 48c785f803000007000000 mov qword ptr [rbp + 0x3f8], 7
140272e89: 48899d00040000 mov qword ptr [rbp + 0x400], rbx
140272e90: 4c89ad08040000 mov qword ptr [rbp + 0x408], r13
140272e97: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140272ea0: 488d8d00060000 lea rcx, [rbp + 0x600]
140272ea7: 4c8d8df0030000 lea r9, [rbp + 0x3f0]
140272eae: 4889f2 mov rdx, rsi
140272eb1: 4989f8 mov r8, rdi
140272eb4: e8c7b27105 call 0x14598e180
140272eb9: 90 nop
140272eba: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
140272ec1: 4885d2 test rdx, rdx
140272ec4: 7412 je 0x140272ed8
140272ec6: 488b8de8010000 mov rcx, qword ptr [rbp + 0x1e8]
140272ecd: 41b801000000 mov r8d, 1
140272ed3: e8f8f2d8ff call 0x1400021d0
140272ed8: f2440f1005cfe7b305 movsd xmm8, qword ptr [rip + 0x5b3e7cf]
140272ee1: 440f10355fbbb405 movups xmm14, xmmword ptr [rip + 0x5b4bb5f]
140272ee9: 440f103dfb3cb905 movups xmm15, xmmword ptr [rip + 0x5b93cfb]
