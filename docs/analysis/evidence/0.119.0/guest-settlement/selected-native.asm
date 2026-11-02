; summary-started-phase
0000000145b0f829: e852550000                       call 0x145b14d80
0000000145b0f82e: 4883bd28010000ff                 cmp qword ptr [rbp + 0x128], -1
0000000145b0f836: 0f84f2110000                     je 0x145b10a2e
0000000145b0f83c: 488d4db0                         lea rcx, [rbp - 0x50]
0000000145b0f840: 488d9528010000                   lea rdx, [rbp + 0x128]
0000000145b0f847: bbc8000000                       mov ebx, 0xc8
0000000145b0f84c: 41b8c8000000                     mov r8d, 0xc8
0000000145b0f852: e884494800                       call 0x145f941db
0000000145b0f857: 0fb6456f                         movzx eax, byte ptr [rbp + 0x6f]
0000000145b0f85b: 04fa                             add al, 0xfa
0000000145b0f85d: 3cfb                             cmp al, 0xfb
0000000145b0f85f: 0f82c0110000                     jb 0x145b10a25
; summary-xp-delta-checkpoint
0000000145b0fadc: 498dbeb8170000                   lea rdi, [r14 + 0x17b8]
0000000145b0fae3: 48c7853801000000000000           mov qword ptr [rbp + 0x138], 0
0000000145b0faee: 48c7854001000007000000           mov qword ptr [rbp + 0x140], 7
0000000145b0faf9: 488d85c0000000                   lea rax, [rbp + 0xc0]
0000000145b0fb00: 48898528010000                   mov qword ptr [rbp + 0x128], rax
0000000145b0fb07: 4889bd30010000                   mov qword ptr [rbp + 0x130], rdi
0000000145b0fb0e: 488d8d10010000                   lea rcx, [rbp + 0x110]
0000000145b0fb15: 488d9528010000                   lea rdx, [rbp + 0x128]
0000000145b0fb1c: e8afd81200                       call 0x145c3d3d0
0000000145b0fb21: 90                               nop
0000000145b0fb22: 4c8bad20010000                   mov r13, qword ptr [rbp + 0x120]
0000000145b0fb29: 4d85ed                           test r13, r13
0000000145b0fb2c: 4c8ba520020000                   mov r12, qword ptr [rbp + 0x220]
0000000145b0fb33: 7416                             je 0x145b0fb4b
; summary-xp-positive-recipient
0000000145b0fc1f: 4531c0                           xor r8d, r8d
0000000145b0fc22: 4885c9                           test rcx, rcx
0000000145b0fc25: 4c0f4fc1                         cmovg r8, rcx
0000000145b0fc29: 4489857c020000                   mov dword ptr [rbp + 0x27c], r8d
0000000145b0fc30: 488b85f0000000                   mov rax, qword ptr [rbp + 0xf0]
0000000145b0fc37: 48894730                         mov qword ptr [rdi + 0x30], rax
0000000145b0fc3b: 0f1085c0000000                   movups xmm0, xmmword ptr [rbp + 0xc0]
0000000145b0fc42: 0f108dd0000000                   movups xmm1, xmmword ptr [rbp + 0xd0]
0000000145b0fc49: 0f1095e0000000                   movups xmm2, xmmword ptr [rbp + 0xe0]
0000000145b0fc50: 0f115720                         movups xmmword ptr [rdi + 0x20], xmm2
0000000145b0fc54: 0f114f10                         movups xmmword ptr [rdi + 0x10], xmm1
0000000145b0fc58: 0f1107                           movups xmmword ptr [rdi], xmm0
0000000145b0fc5b: 40b701                           mov dil, 1
0000000145b0fc5e: 4981fcffffff00                   cmp r12, 0xffffff
0000000145b0fc65: 0f95c3                           setne bl
0000000145b0fc68: 0f84280c0000                     je 0x145b10896
0000000145b0fc6e: 4585c0                           test r8d, r8d
0000000145b0fc71: 0f841f0c0000                     je 0x145b10896
0000000145b0fc77: 4c898d70020000                   mov qword ptr [rbp + 0x270], r9
0000000145b0fc7e: 4d8dbe20100000                   lea r15, [r14 + 0x1020]
0000000145b0fc85: 498b8688100000                   mov rax, qword ptr [r14 + 0x1088]
0000000145b0fc8c: 498b8e90100000                   mov rcx, qword ptr [r14 + 0x1090]
0000000145b0fc93: 48c1e103                         shl rcx, 3
0000000145b0fc97: 488d0c89                         lea rcx, [rcx + rcx*4]
0000000145b0fc9b: 31f6                             xor esi, esi
0000000145b0fc9d: 4531d2                           xor r10d, r10d
0000000145b0fca0: 488b95f0010000                   mov rdx, qword ptr [rbp + 0x1f0]
0000000145b0fca7: 660f1f840000000000               nop word ptr [rax + rax]
0000000145b0fcb0: 4c39d1                           cmp rcx, r10
0000000145b0fcb3: 7413                             je 0x145b0fcc8
0000000145b0fcb5: 4d8d4a28                         lea r9, [r10 + 0x28]
0000000145b0fcb9: 4238541004                       cmp byte ptr [rax + r10 + 4], dl
0000000145b0fcbe: 4d89ca                           mov r10, r9
0000000145b0fcc1: 75ed                             jne 0x145b0fcb0
0000000145b0fcc3: 428b7408d8                       mov esi, dword ptr [rax + r9 - 0x28]
0000000145b0fcc8: c685a602000001                   mov byte ptr [rbp + 0x2a6], 1
0000000145b0fccf: 4c89f9                           mov rcx, r15
0000000145b0fcd2: e8d93efbff                       call 0x145ac3bb0
0000000145b0fcd7: 898560020000                     mov dword ptr [rbp + 0x260], eax
0000000145b0fcdd: 89956c020000                     mov dword ptr [rbp + 0x26c], edx
0000000145b0fce3: c685a602000001                   mov byte ptr [rbp + 0x2a6], 1
0000000145b0fcea: 4c89f9                           mov rcx, r15
0000000145b0fced: e8fea8fbff                       call 0x145aca5f0
; summary-first-result
0000000145b10931: 4180beba18000000                 cmp byte ptr [r14 + 0x18ba], 0
0000000145b10939: 7412                             je 0x145b1094d
0000000145b1093b: 4088bda6020000                   mov byte ptr [rbp + 0x2a6], dil
0000000145b10942: e8a99cfbff                       call 0x145aca5f0
0000000145b10947: 90                               nop
0000000145b10948: e9b1000000                       jmp 0x145b109fe
0000000145b1094d: 41c686ba18000001                 mov byte ptr [r14 + 0x18ba], 1
0000000145b10955: 4584d2                           test r10b, r10b
0000000145b10958: 742a                             je 0x145b10984
0000000145b1095a: 4088bda6020000                   mov byte ptr [rbp + 0x2a6], dil
0000000145b10961: 4889ce                           mov rsi, rcx
0000000145b10964: 4c89f1                           mov rcx, r14
0000000145b10967: 488b95f0010000                   mov rdx, qword ptr [rbp + 0x1f0]
0000000145b1096e: 4c8b85a0000000                   mov r8, qword ptr [rbp + 0xa0]
0000000145b10975: 4c8b8da8000000                   mov r9, qword ptr [rbp + 0xa8]
0000000145b1097c: e87f550000                       call 0x145b15f00
0000000145b10981: 4889f1                           mov rcx, rsi
0000000145b10984: 498b8628100000                   mov rax, qword ptr [r14 + 0x1028]
0000000145b1098b: 4d6b863010000038                 imul r8, qword ptr [r14 + 0x1030], 0x38
0000000145b10993: 31d2                             xor edx, edx
0000000145b10995: 4989c1                           mov r9, rax
0000000145b10998: 4c8b9520020000                   mov r10, qword ptr [rbp + 0x220]
0000000145b1099f: 90                               nop
0000000145b109a0: 4939d0                           cmp r8, rdx
0000000145b109a3: 7417                             je 0x145b109bc
0000000145b109a5: 4883c238                         add rdx, 0x38
0000000145b109a9: 4d395118                         cmp qword ptr [r9 + 0x18], r10
0000000145b109ad: 4d8d4938                         lea r9, [r9 + 0x38]
0000000145b109b1: 75ed                             jne 0x145b109a0
0000000145b109b3: ff4410f0                         inc dword ptr [rax + rdx - 0x10]
0000000145b109b7: 44017c10f4                       add dword ptr [rax + rdx - 0xc], r15d
0000000145b109bc: 84db                             test bl, bl
0000000145b109be: 7431                             je 0x145b109f1
0000000145b109c0: 498b86e8110000                   mov rax, qword ptr [r14 + 0x11e8]
0000000145b109c7: 48ffc0                           inc rax
0000000145b109ca: 48c7c2ffffffff                   mov rdx, 0xffffffffffffffff
0000000145b109d1: 480f44c2                         cmove rax, rdx
0000000145b109d5: 498986e8110000                   mov qword ptr [r14 + 0x11e8], rax
0000000145b109dc: 498b86f0110000                   mov rax, qword ptr [r14 + 0x11f0]
0000000145b109e3: 4c01f8                           add rax, r15
0000000145b109e6: 480f42c2                         cmovb rax, rdx
0000000145b109ea: 498986f0110000                   mov qword ptr [r14 + 0x11f0], rax
0000000145b109f1: 4088bda6020000                   mov byte ptr [rbp + 0x2a6], dil
0000000145b109f8: e8f39bfbff                       call 0x145aca5f0
0000000145b109fd: 90                               nop
; guest-snapshot-selection
0000000145b14dbd: 837a1002                         cmp dword ptr [rdx + 0x10], 2
0000000145b14dc1: 0f85a5000000                     jne 0x145b14e6c
0000000145b14dc7: 83baa00c000001                   cmp dword ptr [rdx + 0xca0], 1
0000000145b14dce: 0f87ce000000                     ja 0x145b14ea2
0000000145b14dd4: 4883bad00e0000ff                 cmp qword ptr [rdx + 0xed0], -1
0000000145b14ddc: 0f84c0000000                     je 0x145b14ea2
0000000145b14de2: 4989cc                           mov r12, rcx
0000000145b14de5: 488d82d00e0000                   lea rax, [rdx + 0xed0]
0000000145b14dec: f3440f1082680f0000               movss xmm8, dword ptr [rdx + 0xf68]
0000000145b14df5: 440f108a6c0f0000                 movups xmm9, xmmword ptr [rdx + 0xf6c]
0000000145b14dfd: f20f10b27c0f0000                 movsd xmm6, qword ptr [rdx + 0xf7c]
0000000145b14e05: f2440f1092840f0000               movsd xmm10, qword ptr [rdx + 0xf84]
0000000145b14e0e: f30f10ba8c0f0000                 movss xmm7, dword ptr [rdx + 0xf8c]
0000000145b14e16: 0fb69a900f0000                   movzx ebx, byte ptr [rdx + 0xf90]
0000000145b14e1d: 488d4dd8                         lea rcx, [rbp - 0x28]
0000000145b14e21: 4989d5                           mov r13, rdx
0000000145b14e24: 4889c2                           mov rdx, rax
0000000145b14e27: e8c4254500                       call 0x145f673f0
; guest-close-wrapper
0000000145b18a59: 4c8db1a00c0000                   lea r14, [rcx + 0xca0]
0000000145b18a60: 83b9a00c000001                   cmp dword ptr [rcx + 0xca0], 1
0000000145b18a67: 7724                             ja 0x145b18a8d
0000000145b18a69: 4883bfa80f000000                 cmp qword ptr [rdi + 0xfa8], 0
0000000145b18a71: 741a                             je 0x145b18a8d
0000000145b18a73: 4883bfd00e0000ff                 cmp qword ptr [rdi + 0xed0], -1
0000000145b18a7b: 7410                             je 0x145b18a8d
0000000145b18a7d: 4889f9                           mov rcx, rdi
0000000145b18a80: e84b6dffff                       call 0x145b0f7d0
0000000145b18a85: 4889f9                           mov rcx, rdi
0000000145b18a88: e803cbffff                       call 0x145b15590
0000000145b18a8d: 488d4da8                         lea rcx, [rbp - 0x58]
0000000145b18a91: 41b838030000                     mov r8d, 0x338
0000000145b18a97: 4c89f2                           mov rdx, r14
0000000145b18a9a: e83cb74700                       call 0x145f941db
0000000145b18a9f: 49c70602000000                   mov qword ptr [r14], 2
; party-close-wrapper
0000000145b18b99: 488b81a00c0000                   mov rax, qword ptr [rcx + 0xca0]
0000000145b18ba0: 4883f801                         cmp rax, 1
0000000145b18ba4: 772b                             ja 0x145b18bd1
0000000145b18ba6: 4883bea80f000000                 cmp qword ptr [rsi + 0xfa8], 0
0000000145b18bae: 7421                             je 0x145b18bd1
0000000145b18bb0: 4883bed00e0000ff                 cmp qword ptr [rsi + 0xed0], -1
0000000145b18bb8: 7417                             je 0x145b18bd1
0000000145b18bba: 4889f1                           mov rcx, rsi
0000000145b18bbd: e80e6cffff                       call 0x145b0f7d0
0000000145b18bc2: 4889f1                           mov rcx, rsi
0000000145b18bc5: e8c6c9ffff                       call 0x145b15590
0000000145b18bca: 488b86a00c0000                   mov rax, qword ptr [rsi + 0xca0]
0000000145b18bd1: 48c786a00c000002000000           mov qword ptr [rsi + 0xca0], 2
0000000145b18bdc: 4889c1                           mov rcx, rax
0000000145b18bdf: 4883e902                         sub rcx, 2
0000000145b18be3: ba02000000                       mov edx, 2
0000000145b18be8: 480f43d1                         cmovae rdx, rcx
; guest-end-dispatch
0000000145b1c31f: 488b86a00c0000                   mov rax, qword ptr [rsi + 0xca0]
0000000145b1c326: 4883f801                         cmp rax, 1
0000000145b1c32a: 7749                             ja 0x145b1c375
0000000145b1c32c: 4883bea80f000000                 cmp qword ptr [rsi + 0xfa8], 0
0000000145b1c334: 743f                             je 0x145b1c375
0000000145b1c336: 4883bed00e0000ff                 cmp qword ptr [rsi + 0xed0], -1
0000000145b1c33e: 7435                             je 0x145b1c375
0000000145b1c340: c6855704000001                   mov byte ptr [rbp + 0x457], 1
0000000145b1c347: c6855604000001                   mov byte ptr [rbp + 0x456], 1
0000000145b1c34e: 4889f1                           mov rcx, rsi
0000000145b1c351: e87a34ffff                       call 0x145b0f7d0
0000000145b1c356: 90                               nop
0000000145b1c357: c6855704000001                   mov byte ptr [rbp + 0x457], 1
0000000145b1c35e: c6855604000001                   mov byte ptr [rbp + 0x456], 1
0000000145b1c365: 4889f1                           mov rcx, rsi
0000000145b1c368: e82392ffff                       call 0x145b15590
0000000145b1c36d: 90                               nop
0000000145b1c36e: 488b86a00c0000                   mov rax, qword ptr [rsi + 0xca0]
0000000145b1c375: 83f801                           cmp eax, 1
0000000145b1c378: 7727                             ja 0x145b1c3a1
0000000145b1c37a: f686d10f000001                   test byte ptr [rsi + 0xfd1], 1
0000000145b1c381: 741e                             je 0x145b1c3a1
0000000145b1c383: c6855704000001                   mov byte ptr [rbp + 0x457], 1
0000000145b1c38a: c6855604000001                   mov byte ptr [rbp + 0x456], 1
0000000145b1c391: 4889f1                           mov rcx, rsi
0000000145b1c394: e897e2ffff                       call 0x145b1a630
0000000145b1c399: 90                               nop
0000000145b1c39a: 488b86a00c0000                   mov rax, qword ptr [rsi + 0xca0]
0000000145b1c3a1: 83f801                           cmp eax, 1
0000000145b1c3a4: 772b                             ja 0x145b1c3d1
0000000145b1c3a6: 488dbed00e0000                   lea rdi, [rsi + 0xed0]
0000000145b1c3ad: 48c786a80f000000000000           mov qword ptr [rsi + 0xfa8], 0
0000000145b1c3b8: 4883bed00e0000ff                 cmp qword ptr [rsi + 0xed0], -1
0000000145b1c3c0: 7408                             je 0x145b1c3ca
0000000145b1c3c2: 4889f9                           mov rcx, rdi
0000000145b1c3c5: e816a4f8ff                       call 0x145aa67e0
0000000145b1c3ca: 48c707ffffffff                   mov qword ptr [rdi], 0xffffffffffffffff
0000000145b1c3d1: c6855704000001                   mov byte ptr [rbp + 0x457], 1
0000000145b1c3d8: c6855604000001                   mov byte ptr [rbp + 0x456], 1
0000000145b1c3df: 4889f1                           mov rcx, rsi
0000000145b1c3e2: e809d9ffff                       call 0x145b19cf0
0000000145b1c3e7: 90                               nop
0000000145b1c3e8: c6855704000001                   mov byte ptr [rbp + 0x457], 1
0000000145b1c3ef: c6855604000001                   mov byte ptr [rbp + 0x456], 1
0000000145b1c3f6: 48c744242000000000               mov qword ptr [rsp + 0x20], 0
0000000145b1c3ff: 488d1552fa7b01                   lea rdx, [rip + 0x17bfa52]
0000000145b1c406: 41b806000000                     mov r8d, 6
0000000145b1c40c: 41b901000000                     mov r9d, 1
0000000145b1c412: 4889f1                           mov rcx, rsi
0000000145b1c415: e876cbffff                       call 0x145b18f90
0000000145b1c41a: 90                               nop
; guest-zone-reset
0000000145b1c61f: 488b8538040000                   mov rax, qword ptr [rbp + 0x438]
0000000145b1c626: 488b4808                         mov rcx, qword ptr [rax + 8]
0000000145b1c62a: 48898d40040000                   mov qword ptr [rbp + 0x440], rcx
0000000145b1c631: 488b4810                         mov rcx, qword ptr [rax + 0x10]
0000000145b1c635: 488b5018                         mov rdx, qword ptr [rax + 0x18]
0000000145b1c639: 48898d30040000                   mov qword ptr [rbp + 0x430], rcx
0000000145b1c640: e8ebe5f5ff                       call 0x145a7ac30
0000000145b1c645: 4869c0f0000000                   imul rax, rax, 0xf0
0000000145b1c64c: 488d0d3df77701                   lea rcx, [rip + 0x177f73d]
0000000145b1c653: 488b5c0808                       mov rbx, qword ptr [rax + rcx + 8]
0000000145b1c658: 4c8b740810                       mov r14, qword ptr [rax + rcx + 0x10]
0000000145b1c65d: 83bea00c000001                   cmp dword ptr [rsi + 0xca0], 1
0000000145b1c664: 7741                             ja 0x145b1c6a7
0000000145b1c666: 48899ea80f0000                   mov qword ptr [rsi + 0xfa8], rbx
0000000145b1c66d: 4c89b6b00f0000                   mov qword ptr [rsi + 0xfb0], r14
0000000145b1c674: 4883bed00e0000ff                 cmp qword ptr [rsi + 0xed0], -1
0000000145b1c67c: 740c                             je 0x145b1c68a
0000000145b1c67e: 488d8ed00e0000                   lea rcx, [rsi + 0xed0]
0000000145b1c685: e856a1f8ff                       call 0x145aa67e0
0000000145b1c68a: 48c786d00e0000ffffffff           mov qword ptr [rsi + 0xed0], 0xffffffffffffffff
0000000145b1c695: f20f11b6b80f0000                 movsd qword ptr [rsi + 0xfb8], xmm6
0000000145b1c69d: 0f57c0                           xorps xmm0, xmm0
0000000145b1c6a0: 0f1186c00f0000                   movups xmmword ptr [rsi + 0xfc0], xmm0
0000000145b1c6a7: c686ba18000000                   mov byte ptr [rsi + 0x18ba], 0
0000000145b1c6ae: 0f57c0                           xorps xmm0, xmm0
0000000145b1c6b1: 0f1186b8170000                   movups xmmword ptr [rsi + 0x17b8], xmm0
0000000145b1c6b8: 0f1186c8170000                   movups xmmword ptr [rsi + 0x17c8], xmm0
0000000145b1c6bf: 0f1186d8170000                   movups xmmword ptr [rsi + 0x17d8], xmm0
0000000145b1c6c6: 48c786e817000000000000           mov qword ptr [rsi + 0x17e8], 0
0000000145b1c6d1: c686be180000ff                   mov byte ptr [rsi + 0x18be], 0xff
0000000145b1c6d8: 0f11867c180000                   movups xmmword ptr [rsi + 0x187c], xmm0
0000000145b1c6df: c7868c18000000000000             mov dword ptr [rsi + 0x188c], 0
0000000145b1c6e9: 488b8670180000                   mov rax, qword ptr [rsi + 0x1870]
0000000145b1c6f0: 488986b0170000                   mov qword ptr [rsi + 0x17b0], rax
0000000145b1c6f7: 488d8e20100000                   lea rcx, [rsi + 0x1020]
0000000145b1c6fe: 0fb69640120000                   movzx edx, byte ptr [rsi + 0x1240]
0000000145b1c705: e856820200                       call 0x145b44960
0000000145b1c70a: 90                               nop
; guest-state-terminal-edge
0000000145b1d48a: 83bea00c000001                   cmp dword ptr [rsi + 0xca0], 1
0000000145b1d491: 0f8753ffffff                     ja 0x145b1d3ea
0000000145b1d497: 4883bed00e0000ff                 cmp qword ptr [rsi + 0xed0], -1
0000000145b1d49f: 0f8445ffffff                     je 0x145b1d3ea
0000000145b1d4a5: 0fb68e8f0f0000                   movzx ecx, byte ptr [rsi + 0xf8f]
0000000145b1d4ac: 31c0                             xor eax, eax
0000000145b1d4ae: 80f906                           cmp cl, 6
0000000145b1d4b1: 0f42c1                           cmovb eax, ecx
0000000145b1d4b4: 80be8c0f000000                   cmp byte ptr [rsi + 0xf8c], 0
0000000145b1d4bb: 0f8429ffffff                     je 0x145b1d3ea
0000000145b1d4c1: 3886be180000                     cmp byte ptr [rsi + 0x18be], al
0000000145b1d4c7: 0f841dffffff                     je 0x145b1d3ea
0000000145b1d4cd: 8886be180000                     mov byte ptr [rsi + 0x18be], al
0000000145b1d4d3: c6855504000000                   mov byte ptr [rbp + 0x455], 0
0000000145b1d4da: 4889f1                           mov rcx, rsi
0000000145b1d4dd: e8ee22ffff                       call 0x145b0f7d0
0000000145b1d4e2: 90                               nop
0000000145b1d4e3: c6855504000000                   mov byte ptr [rbp + 0x455], 0
0000000145b1d4ea: 4889f1                           mov rcx, rsi
0000000145b1d4ed: e89e80ffff                       call 0x145b15590
0000000145b1d4f2: 90                               nop
; host-loss
0000000145affb40: 498b8d980f0000                   mov rcx, qword ptr [r13 + 0xf98]
0000000145affb47: 498b85a00f0000                   mov rax, qword ptr [r13 + 0xfa0]
0000000145affb4e: ff5028                           call qword ptr [rax + 0x28]
0000000145affb51: 84c0                             test al, al
0000000145affb53: 0f8524010000                     jne 0x145affc7d
0000000145affb59: 488d1570bb7d01                   lea rdx, [rip + 0x17dbb70]
0000000145affb60: 41b80d000000                     mov r8d, 0xd
0000000145affb66: 4c89e9                           mov rcx, r13
0000000145affb69: e8c28e0100                       call 0x145b18a30
0000000145affb6e: e90a010000                       jmp 0x145affc7d
; form-leave-command
0000000145affdd3: 8bbd90020000                     mov edi, dword ptr [rbp + 0x290]
0000000145affdd9: 89f8                             mov eax, edi
0000000145affddb: 83e802                           sub eax, 2
0000000145affdde: 0f42c3                           cmovb eax, ebx
0000000145affde1: 488985600c0000                   mov qword ptr [rbp + 0xc60], rax
0000000145affde8: 83c0ee                           add eax, -0x12
0000000145affdeb: 83f804                           cmp eax, 4
0000000145affdee: 0f8781040000                     ja 0x145b00275
0000000145affdf4: 488d0dd5db7d01                   lea rcx, [rip + 0x17ddbd5]
0000000145affdfb: 48630481                         movsxd rax, dword ptr [rcx + rax*4]
0000000145affdff: 4801c8                           add rax, rcx
0000000145affe02: ffe0                             jmp rax
; form-leave-close
0000000145b001fa: c6856f0c000001                   mov byte ptr [rbp + 0xc6f], 1
0000000145b00201: c6856e0c000001                   mov byte ptr [rbp + 0xc6e], 1
0000000145b00208: 488b8d700c0000                   mov rcx, qword ptr [rbp + 0xc70]
0000000145b0020f: e85c890100                       call 0x145b18b70
0000000145b00214: 90                               nop
0000000145b00215: 488b8d380c0000                   mov rcx, qword ptr [rbp + 0xc38]
0000000145b0021c: 488b01                           mov rax, qword ptr [rcx]
0000000145b0021f: 48c701ffffffff                   mov qword ptr [rcx], 0xffffffffffffffff
0000000145b00226: 4883f8ff                         cmp rax, -1
0000000145b0022a: 7449                             je 0x145b00275
; run-leave-command
0000000145b198b6: 8b0a                             mov ecx, dword ptr [rdx]
0000000145b198b8: 83e902                           sub ecx, 2
0000000145b198bb: b80b000000                       mov eax, 0xb
0000000145b198c0: 0f43c1                           cmovae eax, ecx
0000000145b198c3: 83f81a                           cmp eax, 0x1a
0000000145b198c6: 0f8752010000                     ja 0x145b19a1e
0000000145b198cc: 40b601                           mov sil, 1
0000000145b198cf: 488d0db2417c01                   lea rcx, [rip + 0x17c41b2]
0000000145b198d6: 48630481                         movsxd rax, dword ptr [rcx + rax*4]
0000000145b198da: 4801c8                           add rax, rcx
0000000145b198dd: ffe0                             jmp rax
; run-leave-close
0000000145b199a1: 488d15b8237c01                   lea rdx, [rip + 0x17c23b8]
0000000145b199a8: 41b810000000                     mov r8d, 0x10
0000000145b199ae: 4889f9                           mov rcx, rdi
0000000145b199b1: e87af0ffff                       call 0x145b18a30
0000000145b199b6: e9a1010000                       jmp 0x145b19b5c
; notifications-guest-gate
0000000145b13d8d: 4d8b3e                           mov r15, qword ptr [r14]
0000000145b13d90: 498b5720                         mov rdx, qword ptr [r15 + 0x20]
0000000145b13d94: 4d8b4728                         mov r8, qword ptr [r15 + 0x28]
0000000145b13d98: 458b8f90000000                   mov r9d, dword ptr [r15 + 0x90]
0000000145b13d9f: 488d4da0                         lea rcx, [rbp - 0x60]
0000000145b13da3: e848def6ff                       call 0x145a81bf0
0000000145b13da8: 90                               nop
0000000145b13da9: 837e1002                         cmp dword ptr [rsi + 0x10], 2
0000000145b13dad: 751a                             jne 0x145b13dc9
0000000145b13daf: 83bea00c000001                   cmp dword ptr [rsi + 0xca0], 1
0000000145b13db6: 0f87e4000000                     ja 0x145b13ea0
0000000145b13dbc: 80bed10f000000                   cmp byte ptr [rsi + 0xfd1], 0
0000000145b13dc3: 0f84d7000000                     je 0x145b13ea0
; notifications-in-world
0000000145b13dc9: c6456f01                         mov byte ptr [rbp + 0x6f], 1
0000000145b13dcd: 488d4de8                         lea rcx, [rbp - 0x18]
0000000145b13dd1: 4c89fa                           mov rdx, r15
0000000145b13dd4: e8a7ec0200                       call 0x145b42a80
0000000145b13dd9: 90                               nop
0000000145b13dda: 488b55f0                         mov rdx, qword ptr [rbp - 0x10]
0000000145b13dde: 4c8b45f8                         mov r8, qword ptr [rbp - 8]
0000000145b13de2: 4889d9                           mov rcx, rbx
0000000145b13de5: 48895560                         mov qword ptr [rbp + 0x60], rdx
0000000145b13de9: e8a2fa0400                       call 0x145b63890
0000000145b13dee: 90                               nop
0000000145b13def: 4889f1                           mov rcx, rsi
0000000145b13df2: 4889da                           mov rdx, rbx
0000000145b13df5: e83694feff                       call 0x145afd230
0000000145b13dfa: 90                               nop
0000000145b13dfb: 488b55e8                         mov rdx, qword ptr [rbp - 0x18]
0000000145b13dff: 4885d2                           test rdx, rdx
0000000145b13e02: 740f                             je 0x145b13e13
0000000145b13e04: 41b801000000                     mov r8d, 1
0000000145b13e0a: 488b4d60                         mov rcx, qword ptr [rbp + 0x60]
0000000145b13e0e: e8bde34efa                       call 0x1400021d0
0000000145b13e13: e8e8e34efa                       call 0x140002200
0000000145b13e18: b920000000                       mov ecx, 0x20
0000000145b13e1d: ba01000000                       mov edx, 1
0000000145b13e22: e899e34efa                       call 0x1400021c0
0000000145b13e27: 4885c0                           test rax, rax
0000000145b13e2a: 0f8492010000                     je 0x145b13fc2
0000000145b13e30: c70078030000                     mov dword ptr [rax], 0x378
0000000145b13e36: 48c7450020000000                 mov qword ptr [rbp], 0x20
0000000145b13e3e: 48894508                         mov qword ptr [rbp + 8], rax
0000000145b13e42: 48c7451004000000                 mov qword ptr [rbp + 0x10], 4
0000000145b13e4a: 66c74518d202                     mov word ptr [rbp + 0x18], 0x2d2
0000000145b13e50: c6456f01                         mov byte ptr [rbp + 0x6f], 1
0000000145b13e54: 4889f1                           mov rcx, rsi
0000000145b13e57: 4889da                           mov rdx, rbx
0000000145b13e5a: e8d193feff                       call 0x145afd230
0000000145b13e5f: 90                               nop
0000000145b13e60: 488b45e0                         mov rax, qword ptr [rbp - 0x20]
0000000145b13e64: 48894540                         mov qword ptr [rbp + 0x40], rax
0000000145b13e68: 0f1045a0                         movups xmm0, xmmword ptr [rbp - 0x60]
0000000145b13e6c: 0f104db0                         movups xmm1, xmmword ptr [rbp - 0x50]
0000000145b13e70: 0f1055c0                         movups xmm2, xmmword ptr [rbp - 0x40]
0000000145b13e74: 0f105dd0                         movups xmm3, xmmword ptr [rbp - 0x30]
0000000145b13e78: 0f295d30                         movaps xmmword ptr [rbp + 0x30], xmm3
0000000145b13e7c: 0f295520                         movaps xmmword ptr [rbp + 0x20], xmm2
0000000145b13e80: 0f294d10                         movaps xmmword ptr [rbp + 0x10], xmm1
0000000145b13e84: 0f294500                         movaps xmmword ptr [rbp], xmm0
0000000145b13e88: c6456f00                         mov byte ptr [rbp + 0x6f], 0
0000000145b13e8c: 4889f1                           mov rcx, rsi
0000000145b13e8f: 4889da                           mov rdx, rbx
0000000145b13e92: e8a954feff                       call 0x145af9340
0000000145b13e97: 90                               nop
0000000145b13e98: 31c0                             xor eax, eax
0000000145b13e9a: eb5f                             jmp 0x145b13efb
; notifications-frontend
0000000145b13ea0: 4c8ba6a0170000                   mov r12, qword ptr [rsi + 0x17a0]
0000000145b13ea7: 488bbea8170000                   mov rdi, qword ptr [rsi + 0x17a8]
0000000145b13eae: 41b801000000                     mov r8d, 1
0000000145b13eb4: f0440fc1059325a002               lock xadd dword ptr [rip + 0x2a02593], r8d
0000000145b13ebd: c6456f01                         mov byte ptr [rbp + 0x6f], 1
0000000145b13ec1: 4889d9                           mov rcx, rbx
0000000145b13ec4: 488d55a0                         lea rdx, [rbp - 0x60]
0000000145b13ec8: e8b3e4f6ff                       call 0x145a82380
0000000145b13ecd: 90                               nop
0000000145b13ece: 488b5508                         mov rdx, qword ptr [rbp + 8]
0000000145b13ed2: 4c8b4510                         mov r8, qword ptr [rbp + 0x10]
0000000145b13ed6: 4c89e1                           mov rcx, r12
0000000145b13ed9: 48895560                         mov qword ptr [rbp + 0x60], rdx
0000000145b13edd: ff5718                           call qword ptr [rdi + 0x18]
0000000145b13ee0: 90                               nop
0000000145b13ee1: 488b5500                         mov rdx, qword ptr [rbp]
0000000145b13ee5: 4885d2                           test rdx, rdx
0000000145b13ee8: 740f                             je 0x145b13ef9
0000000145b13eea: 41b801000000                     mov r8d, 1
0000000145b13ef0: 488b4d60                         mov rcx, qword ptr [rbp + 0x60]
0000000145b13ef4: e8d7e24efa                       call 0x1400021d0
0000000145b13ef9: b001                             mov al, 1
0000000145b13efb: 4c8ba6a0170000                   mov r12, qword ptr [rsi + 0x17a0]
0000000145b13f02: 488bbea8170000                   mov rdi, qword ptr [rsi + 0x17a8]
0000000145b13f09: 894560                           mov dword ptr [rbp + 0x60], eax
0000000145b13f0c: 88456f                           mov byte ptr [rbp + 0x6f], al
0000000145b13f0f: 4889d9                           mov rcx, rbx
0000000145b13f12: 4c89fa                           mov rdx, r15
0000000145b13f15: e8f6d00200                       call 0x145b41010
0000000145b13f1a: 90                               nop
0000000145b13f1b: 488b5508                         mov rdx, qword ptr [rbp + 8]
0000000145b13f1f: 4c8b4510                         mov r8, qword ptr [rbp + 0x10]
0000000145b13f23: 4c89e1                           mov rcx, r12
0000000145b13f26: 48895548                         mov qword ptr [rbp + 0x48], rdx
0000000145b13f2a: ff5718                           call qword ptr [rdi + 0x18]
0000000145b13f2d: 90                               nop
0000000145b13f2e: 488b5500                         mov rdx, qword ptr [rbp]
0000000145b13f32: 4885d2                           test rdx, rdx
0000000145b13f35: 740f                             je 0x145b13f46
0000000145b13f37: 41b801000000                     mov r8d, 1
0000000145b13f3d: 488b4d48                         mov rcx, qword ptr [rbp + 0x48]
0000000145b13f41: e88ae24efa                       call 0x1400021d0
; entry-veteran-selection
0000000145b44a2f: 4c89e8                           mov rax, r13
0000000145b44a32: 48c1e005                         shl rax, 5
0000000145b44a36: 31c9                             xor ecx, ecx
0000000145b44a38: ba76657465                       mov edx, 0x65746576
0000000145b44a3d: 41b86572616e                     mov r8d, 0x6e617265
0000000145b44a43: eb14                             jmp 0x145b44a59
0000000145b44a45: 66662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b44a50: 4883c120                         add rcx, 0x20
0000000145b44a54: 4839c8                           cmp rax, rcx
0000000145b44a57: 742a                             je 0x145b44a83
0000000145b44a59: 49837c0c1007                     cmp qword ptr [r12 + rcx + 0x10], 7
0000000145b44a5f: 75ef                             jne 0x145b44a50
0000000145b44a61: 4d8b4c0c08                       mov r9, qword ptr [r12 + rcx + 8]
0000000145b44a66: 458b11                           mov r10d, dword ptr [r9]
0000000145b44a69: 4131d2                           xor r10d, edx
0000000145b44a6c: 458b4903                         mov r9d, dword ptr [r9 + 3]
0000000145b44a70: 4531c1                           xor r9d, r8d
0000000145b44a73: 4509d1                           or r9d, r10d
0000000145b44a76: 75d8                             jne 0x145b44a50
0000000145b44a78: 410fb6440c18                     movzx eax, byte ptr [r12 + rcx + 0x18]
0000000145b44a7e: 8945fc                           mov dword ptr [rbp - 4], eax
0000000145b44a81: eb07                             jmp 0x145b44a8a
0000000145b44a83: c745fc00000000                   mov dword ptr [rbp - 4], 0
; entry-veteran-bonus
0000000145b44ca3: 0f57c0                           xorps xmm0, xmm0
0000000145b44ca6: 4084ff                           test dil, dil
0000000145b44ca9: 7445                             je 0x145b44cf0
0000000145b44cab: 4531c0                           xor r8d, r8d
0000000145b44cae: 4531c9                           xor r9d, r9d
0000000145b44cb1: 6666666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b44cc0: 4c39c9                           cmp rcx, r9
0000000145b44cc3: 7413                             je 0x145b44cd8
0000000145b44cc5: 4d8d5128                         lea r10, [r9 + 0x28]
0000000145b44cc9: 42385c0804                       cmp byte ptr [rax + r9 + 4], bl
0000000145b44cce: 4d89d1                           mov r9, r10
0000000145b44cd1: 75ed                             jne 0x145b44cc0
0000000145b44cd3: 468b4410d8                       mov r8d, dword ptr [rax + r10 - 0x28]
0000000145b44cd8: 4139d0                           cmp r8d, edx
0000000145b44cdb: 7313                             jae 0x145b44cf0
0000000145b44cdd: 400fb6c7                         movzx eax, dil
0000000145b44ce1: 0f57c0                           xorps xmm0, xmm0
0000000145b44ce4: f30f2ac0                         cvtsi2ss xmm0, eax
0000000145b44ce8: f30f5905f0566300                 mulss xmm0, dword ptr [rip + 0x6356f0]
; xp-component-subtractions
0000000145c3d479: 4c8b02                           mov r8, qword ptr [rdx]
0000000145c3d47c: 4c8b5a08                         mov r11, qword ptr [rdx + 8]
0000000145c3d480: 4c8d4e01                         lea r9, [rsi + 1]
0000000145c3d484: 498b14f0                         mov rdx, qword ptr [r8 + rsi*8]
0000000145c3d488: 492b14f3                         sub rdx, qword ptr [r11 + rsi*8]
0000000145c3d48c: 488930                           mov qword ptr [rax], rsi
0000000145c3d48f: 48895008                         mov qword ptr [rax + 8], rdx
0000000145c3d493: ba01000000                       mov edx, 1
0000000145c3d498: 4d39f1                           cmp r9, r14
0000000145c3d49b: 0f8416010000                     je 0x145c3d5b7
0000000145c3d4a1: 4883fe06                         cmp rsi, 6
0000000145c3d4a5: 0f842b010000                     je 0x145c3d5d6
0000000145c3d4ab: 4c8d5602                         lea r10, [rsi + 2]
0000000145c3d4af: 498b54f008                       mov rdx, qword ptr [r8 + rsi*8 + 8]
0000000145c3d4b4: 492b54f308                       sub rdx, qword ptr [r11 + rsi*8 + 8]
0000000145c3d4b9: 4c894810                         mov qword ptr [rax + 0x10], r9
0000000145c3d4bd: 48895018                         mov qword ptr [rax + 0x18], rdx
0000000145c3d4c1: ba02000000                       mov edx, 2
0000000145c3d4c6: 4d39f2                           cmp r10, r14
0000000145c3d4c9: 0f84e8000000                     je 0x145c3d5b7
0000000145c3d4cf: 4883fe04                         cmp rsi, 4
0000000145c3d4d3: 0f8702010000                     ja 0x145c3d5db
0000000145c3d4d9: 4c8d4e03                         lea r9, [rsi + 3]
0000000145c3d4dd: 498b54f010                       mov rdx, qword ptr [r8 + rsi*8 + 0x10]
0000000145c3d4e2: 492b54f310                       sub rdx, qword ptr [r11 + rsi*8 + 0x10]
0000000145c3d4e7: 4c895020                         mov qword ptr [rax + 0x20], r10
0000000145c3d4eb: 48895028                         mov qword ptr [rax + 0x28], rdx
0000000145c3d4ef: ba03000000                       mov edx, 3
0000000145c3d4f4: 4d39f1                           cmp r9, r14
0000000145c3d4f7: 0f84ba000000                     je 0x145c3d5b7
0000000145c3d4fd: 4883fe04                         cmp rsi, 4
0000000145c3d501: 0f84cf000000                     je 0x145c3d5d6
0000000145c3d507: 4c8d5604                         lea r10, [rsi + 4]
0000000145c3d50b: 498b54f018                       mov rdx, qword ptr [r8 + rsi*8 + 0x18]
0000000145c3d510: 492b54f318                       sub rdx, qword ptr [r11 + rsi*8 + 0x18]
0000000145c3d515: 4c894830                         mov qword ptr [rax + 0x30], r9
0000000145c3d519: 48895038                         mov qword ptr [rax + 0x38], rdx
0000000145c3d51d: ba04000000                       mov edx, 4
0000000145c3d522: 4d39f2                           cmp r10, r14
0000000145c3d525: 0f848c000000                     je 0x145c3d5b7
0000000145c3d52b: 4883fe02                         cmp rsi, 2
0000000145c3d52f: 0f87a6000000                     ja 0x145c3d5db
0000000145c3d535: 4c8d4e05                         lea r9, [rsi + 5]
0000000145c3d539: 498b54f020                       mov rdx, qword ptr [r8 + rsi*8 + 0x20]
0000000145c3d53e: 492b54f320                       sub rdx, qword ptr [r11 + rsi*8 + 0x20]
0000000145c3d543: 4c895040                         mov qword ptr [rax + 0x40], r10
0000000145c3d547: 48895048                         mov qword ptr [rax + 0x48], rdx
0000000145c3d54b: ba05000000                       mov edx, 5
0000000145c3d550: 4d39f1                           cmp r9, r14
0000000145c3d553: 7462                             je 0x145c3d5b7
0000000145c3d555: 4883fe02                         cmp rsi, 2
0000000145c3d559: 747b                             je 0x145c3d5d6
0000000145c3d55b: 4c8d5606                         lea r10, [rsi + 6]
0000000145c3d55f: 498b54f028                       mov rdx, qword ptr [r8 + rsi*8 + 0x28]
0000000145c3d564: 492b54f328                       sub rdx, qword ptr [r11 + rsi*8 + 0x28]
0000000145c3d569: 4c894850                         mov qword ptr [rax + 0x50], r9
0000000145c3d56d: 48895058                         mov qword ptr [rax + 0x58], rdx
0000000145c3d571: ba06000000                       mov edx, 6
0000000145c3d576: 4d39f2                           cmp r10, r14
0000000145c3d579: 743c                             je 0x145c3d5b7
0000000145c3d57b: 4885f6                           test rsi, rsi
0000000145c3d57e: 755b                             jne 0x145c3d5db
0000000145c3d580: 498b54f030                       mov rdx, qword ptr [r8 + rsi*8 + 0x30]
0000000145c3d585: 492b54f330                       sub rdx, qword ptr [r11 + rsi*8 + 0x30]
0000000145c3d58a: 4c895060                         mov qword ptr [rax + 0x60], r10
0000000145c3d58e: 48895068                         mov qword ptr [rax + 0x68], rdx
0000000145c3d592: be07000000                       mov esi, 7
0000000145c3d597: ba07000000                       mov edx, 7
; guest-skips-local-tick-delivery
0000000145b00aa6: 837f1002                         cmp dword ptr [rdi + 0x10], 2
0000000145b00aaa: 0f8558120000                     jne 0x145b01d08
; guest-close-world-teardown
0000000145b18ad8: 80bd1106000000                   cmp byte ptr [rbp + 0x611], 0
0000000145b18adf: 7409                             je 0x145b18aea
0000000145b18ae1: 4889f9                           mov rcx, rdi
0000000145b18ae4: e8471b0000                       call 0x145b1a630
0000000145b18ae9: 90                               nop
; party-close-world-teardown
0000000145b18e0b: 80bde102000000                   cmp byte ptr [rbp + 0x2e1], 0
0000000145b18e12: 7409                             je 0x145b18e1d
0000000145b18e14: 4889f1                           mov rcx, rsi
0000000145b18e17: e814180000                       call 0x145b1a630
0000000145b18e1c: 90                               nop
