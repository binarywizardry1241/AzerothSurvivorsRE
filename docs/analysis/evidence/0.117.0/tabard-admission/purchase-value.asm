; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145b2bbd0, 0x145b2bdee); bytes SHA-256 c18c75d0d13a2f1d3ec67afa14902cf0a87cd6bf9c438a8bcd11591b074b9d55
; Current EXE bytes decoded with Capstone 5.0.7; no process execution.
0000000145b2bbd0: 56                       push rsi
0000000145b2bbd1: 4d85c0                   test r8, r8
0000000145b2bbd4: 0f8401010000             je 0x145b2bcdb
0000000145b2bbda: 4889d1                   mov rcx, rdx
0000000145b2bbdd: 4983f801                 cmp r8, 1
0000000145b2bbe1: 7517                     jne 0x145b2bbfa
0000000145b2bbe3: 0fb611                   movzx edx, byte ptr [rcx]
0000000145b2bbe6: 83fa2b                   cmp edx, 0x2b
0000000145b2bbe9: 0f84ec000000             je 0x145b2bcdb
0000000145b2bbef: 83fa2d                   cmp edx, 0x2d
0000000145b2bbf2: 0f84e3000000             je 0x145b2bcdb
0000000145b2bbf8: eb03                     jmp 0x145b2bbfd
0000000145b2bbfa: 0fb611                   movzx edx, byte ptr [rcx]
0000000145b2bbfd: 31c0                     xor eax, eax
0000000145b2bbff: 80fa2b                   cmp dl, 0x2b
0000000145b2bc02: 0f94c0                   sete al
0000000145b2bc05: 4d89c1                   mov r9, r8
0000000145b2bc08: 4929c1                   sub r9, rax
0000000145b2bc0b: 4801c1                   add rcx, rax
0000000145b2bc0e: 4983f909                 cmp r9, 9
0000000145b2bc12: 736c                     jae 0x145b2bc80
0000000145b2bc14: 4d85c9                   test r9, r9
0000000145b2bc17: 0f84af000000             je 0x145b2bccc
0000000145b2bc1d: 0fb611                   movzx edx, byte ptr [rcx]
0000000145b2bc20: 83c2d0                   add edx, -0x30
0000000145b2bc23: 31c0                     xor eax, eax
0000000145b2bc25: 83fa09                   cmp edx, 9
0000000145b2bc28: 0f8798010000             ja 0x145b2bdc6
0000000145b2bc2e: 4983f901                 cmp r9, 1
0000000145b2bc32: 0f85a7000000             jne 0x145b2bcdf
0000000145b2bc38: 48c1e220                 shl rdx, 0x20
0000000145b2bc3c: f6c201                   test dl, 1
0000000145b2bc3f: 0f8596000000             jne 0x145b2bcdb
0000000145b2bc45: 48c1ea20                 shr rdx, 0x20
0000000145b2bc49: 8d8a6fa0feff             lea ecx, [rdx - 0x15f91]
0000000145b2bc4f: 83f919                   cmp ecx, 0x19
0000000145b2bc52: 0f92c0                   setb al
0000000145b2bc55: 41b83ffcff01             mov r8d, 0x1fffc3f
0000000145b2bc5b: 41d3e8                   shr r8d, cl
0000000145b2bc5e: 4120c0                   and r8b, al
0000000145b2bc61: 4180f801                 cmp r8b, 1
0000000145b2bc65: 7574                     jne 0x145b2bcdb
0000000145b2bc67: 89c8                     mov eax, ecx
0000000145b2bc69: 488d0d30a4a901           lea rcx, [rip + 0x1a9a430]
0000000145b2bc70: 488b0cc1                 mov rcx, qword ptr [rcx + rax*8]
0000000145b2bc74: 31c0                     xor eax, eax
0000000145b2bc76: 4883792000               cmp qword ptr [rcx + 0x20], 0
0000000145b2bc7b: 0f94c0                   sete al
0000000145b2bc7e: 5e                       pop rsi
0000000145b2bc7f: c3                       ret
0000000145b2bc80: 48f7d8                   neg rax
0000000145b2bc83: 4901c0                   add r8, rax
0000000145b2bc86: 49f7d8                   neg r8
0000000145b2bc89: 31d2                     xor edx, edx
0000000145b2bc8b: 41ba0a000000             mov r10d, 0xa
0000000145b2bc91: 4531c9                   xor r9d, r9d
0000000145b2bc94: 4c89c0                   mov rax, r8
0000000145b2bc97: 4c01c8                   add rax, r9
0000000145b2bc9a: 749c                     je 0x145b2bc38
0000000145b2bc9c: 89d0                     mov eax, edx
0000000145b2bc9e: 41f7e2                   mul r10d
0000000145b2bca1: 0f8021010000             jo 0x145b2bdc8
0000000145b2bca7: 89c2                     mov edx, eax
0000000145b2bca9: 420fb63409               movzx esi, byte ptr [rcx + r9]
0000000145b2bcae: 83c6d0                   add esi, -0x30
0000000145b2bcb1: 01f2                     add edx, esi
0000000145b2bcb3: 410f92c3                 setb r11b
0000000145b2bcb7: 31c0                     xor eax, eax
0000000145b2bcb9: 83fe09                   cmp esi, 9
0000000145b2bcbc: 0f8704010000             ja 0x145b2bdc6
0000000145b2bcc2: 49ffc1                   inc r9
0000000145b2bcc5: 4584db                   test r11b, r11b
0000000145b2bcc8: 74ca                     je 0x145b2bc94
0000000145b2bcca: ebb2                     jmp 0x145b2bc7e
0000000145b2bccc: 31d2                     xor edx, edx
0000000145b2bcce: 48c1e220                 shl rdx, 0x20
0000000145b2bcd2: f6c201                   test dl, 1
0000000145b2bcd5: 0f846affffff             je 0x145b2bc45
0000000145b2bcdb: 31c0                     xor eax, eax
0000000145b2bcdd: 5e                       pop rsi
0000000145b2bcde: c3                       ret
0000000145b2bcdf: 440fb64101               movzx r8d, byte ptr [rcx + 1]
0000000145b2bce4: 4183c0d0                 add r8d, -0x30
0000000145b2bce8: 4183f809                 cmp r8d, 9
0000000145b2bcec: 0f87d4000000             ja 0x145b2bdc6
0000000145b2bcf2: 8d1492                   lea edx, [rdx + rdx*4]
0000000145b2bcf5: 418d1450                 lea edx, [r8 + rdx*2]
0000000145b2bcf9: 4983f902                 cmp r9, 2
0000000145b2bcfd: 0f8435ffffff             je 0x145b2bc38
0000000145b2bd03: 440fb64102               movzx r8d, byte ptr [rcx + 2]
0000000145b2bd08: 4183c0d0                 add r8d, -0x30
0000000145b2bd0c: 4183f809                 cmp r8d, 9
0000000145b2bd10: 0f87b0000000             ja 0x145b2bdc6
0000000145b2bd16: 8d1492                   lea edx, [rdx + rdx*4]
0000000145b2bd19: 418d1450                 lea edx, [r8 + rdx*2]
0000000145b2bd1d: 4983f903                 cmp r9, 3
0000000145b2bd21: 0f8411ffffff             je 0x145b2bc38
0000000145b2bd27: 440fb64103               movzx r8d, byte ptr [rcx + 3]
0000000145b2bd2c: 4183c0d0                 add r8d, -0x30
0000000145b2bd30: 4183f809                 cmp r8d, 9
0000000145b2bd34: 0f878c000000             ja 0x145b2bdc6
0000000145b2bd3a: 8d1492                   lea edx, [rdx + rdx*4]
0000000145b2bd3d: 418d1450                 lea edx, [r8 + rdx*2]
0000000145b2bd41: 4983f904                 cmp r9, 4
0000000145b2bd45: 0f84edfeffff             je 0x145b2bc38
0000000145b2bd4b: 440fb64104               movzx r8d, byte ptr [rcx + 4]
0000000145b2bd50: 4183c0d0                 add r8d, -0x30
0000000145b2bd54: 4183f809                 cmp r8d, 9
0000000145b2bd58: 776c                     ja 0x145b2bdc6
0000000145b2bd5a: 8d1492                   lea edx, [rdx + rdx*4]
0000000145b2bd5d: 418d1450                 lea edx, [r8 + rdx*2]
0000000145b2bd61: 4983f905                 cmp r9, 5
0000000145b2bd65: 0f84cdfeffff             je 0x145b2bc38
0000000145b2bd6b: 440fb64105               movzx r8d, byte ptr [rcx + 5]
0000000145b2bd70: 4183c0d0                 add r8d, -0x30
0000000145b2bd74: 4183f809                 cmp r8d, 9
0000000145b2bd78: 774c                     ja 0x145b2bdc6
0000000145b2bd7a: 8d1492                   lea edx, [rdx + rdx*4]
0000000145b2bd7d: 418d1450                 lea edx, [r8 + rdx*2]
0000000145b2bd81: 4983f906                 cmp r9, 6
0000000145b2bd85: 0f84adfeffff             je 0x145b2bc38
0000000145b2bd8b: 440fb64106               movzx r8d, byte ptr [rcx + 6]
0000000145b2bd90: 4183c0d0                 add r8d, -0x30
0000000145b2bd94: 4183f809                 cmp r8d, 9
0000000145b2bd98: 772c                     ja 0x145b2bdc6
0000000145b2bd9a: 8d1492                   lea edx, [rdx + rdx*4]
0000000145b2bd9d: 418d1450                 lea edx, [r8 + rdx*2]
0000000145b2bda1: 4983f907                 cmp r9, 7
0000000145b2bda5: 0f848dfeffff             je 0x145b2bc38
0000000145b2bdab: 0fb64907                 movzx ecx, byte ptr [rcx + 7]
0000000145b2bdaf: 83c1d0                   add ecx, -0x30
0000000145b2bdb2: 83f909                   cmp ecx, 9
0000000145b2bdb5: 0f87c3feffff             ja 0x145b2bc7e
0000000145b2bdbb: 8d0492                   lea eax, [rdx + rdx*4]
0000000145b2bdbe: 8d1441                   lea edx, [rcx + rax*2]
0000000145b2bdc1: e972feffff               jmp 0x145b2bc38
0000000145b2bdc6: 5e                       pop rsi
0000000145b2bdc7: c3                       ret
0000000145b2bdc8: 420fb60409               movzx eax, byte ptr [rcx + r9]
0000000145b2bdcd: 04d0                     add al, 0xd0
0000000145b2bdcf: 31d2                     xor edx, edx
0000000145b2bdd1: 3c0a                     cmp al, 0xa
0000000145b2bdd3: 0f92c2                   setb dl
0000000145b2bdd6: c1e208                   shl edx, 8
0000000145b2bdd9: 4881c201010000           add rdx, 0x101
0000000145b2bde0: f6c201                   test dl, 1
0000000145b2bde3: 0f85f2feffff             jne 0x145b2bcdb
0000000145b2bde9: e957feffff               jmp 0x145b2bc45
