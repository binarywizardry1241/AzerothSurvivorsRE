0x1458f9b71: 488b45a8                 mov rax, qword ptr [rbp - 0x58]
0x1458f9b75: 488b4db0                 mov rcx, qword ptr [rbp - 0x50]
0x1458f9b79: 31d2                     xor edx, edx
0x1458f9b7b: 0f1f440000               nop dword ptr [rax + rax]
0x1458f9b80: 4839d1                   cmp rcx, rdx
0x1458f9b83: 7416                     je 0x1458f9b9b
0x1458f9b85: 440fb60410               movzx r8d, byte ptr [rax + rdx]
0x1458f9b8a: 41fec8                   dec r8b
0x1458f9b8d: 48ffc2                   inc rdx
0x1458f9b90: 4180f802                 cmp r8b, 2
0x1458f9b94: 73ea                     jae 0x1458f9b80
0x1458f9b96: e995020000               jmp 0x1458f9e30
0x1458f9b9b: 31d2                     xor edx, edx
0x1458f9b9d: 0f1f00                   nop dword ptr [rax]
0x1458f9ba0: 4839d1                   cmp rcx, rdx
0x1458f9ba3: 741b                     je 0x1458f9bc0
0x1458f9ba5: 803c1005                 cmp byte ptr [rax + rdx], 5
0x1458f9ba9: 488d5201                 lea rdx, [rdx + 1]
0x1458f9bad: 75f1                     jne 0x1458f9ba0
0x1458f9baf: c6850013000001           mov byte ptr [rbp + 0x1300], 1
0x1458f9bb6: 41c685470c000005         mov byte ptr [r13 + 0xc47], 5
0x1458f9bbe: eb18                     jmp 0x1458f9bd8
0x1458f9bc0: c6850013000000           mov byte ptr [rbp + 0x1300], 0
0x1458f9bc7: 41c685470c000004         mov byte ptr [r13 + 0xc47], 4
0x1458f9bcf: 4c89e9                   mov rcx, r13
0x1458f9bd2: e869190100               call 0x14590b540
0x1458f9bd7: 90                       nop
0x1458f9bd8: 488d8500130000           lea rax, [rbp + 0x1300]
0x1458f9bdf: 48898520130000           mov qword ptr [rbp + 0x1320], rax
0x1458f9be6: 4180bd460c000004         cmp byte ptr [r13 + 0xc46], 4
0x1458f9bee: 0f85b2000000             jne 0x1458f9ca6
0x1458f9bf4: 80bd0013000000           cmp byte ptr [rbp + 0x1300], 0
0x1458f9bfb: 7427                     je 0x1458f9c24
0x1458f9bfd: 41c685460c000005         mov byte ptr [r13 + 0xc46], 5
0x1458f9c05: 4c8d05bd5ba301           lea r8, [rip + 0x1a35bbd] ; 0x14732f7c9 766963746f727974797065656e646c6573736372617465735c77656e696c6c612d726f6775655c7372635c67616d655c68617a617264732e72730000000000dbf732470100000028
0x1458f9c0c: 488d8d20090000           lea rcx, [rbp + 0x920]
0x1458f9c13: 41b907000000             mov r9d, 7
0x1458f9c19: 4c89ea                   mov rdx, r13
0x1458f9c1c: e82f5a0200               call 0x14591f650
0x1458f9c21: 90                       nop
0x1458f9c22: eb1d                     jmp 0x1458f9c41
