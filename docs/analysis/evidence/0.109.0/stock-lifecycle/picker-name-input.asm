0x14007b130: 55                       push rbp
0x14007b131: 4157                     push r15
0x14007b133: 4156                     push r14
0x14007b135: 4155                     push r13
0x14007b137: 4154                     push r12
0x14007b139: 56                       push rsi
0x14007b13a: 57                       push rdi
0x14007b13b: 53                       push rbx
0x14007b13c: 4883ec78                 sub rsp, 0x78
0x14007b140: 488d6c2470               lea rbp, [rsp + 0x70]
0x14007b145: 48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
0x14007b14d: 4c8b32                   mov r14, qword ptr [rdx]
0x14007b150: 488b7208                 mov rsi, qword ptr [rdx + 8]
0x14007b154: 498b00                   mov rax, qword ptr [r8]
0x14007b157: 80780d00                 cmp byte ptr [rax + 0xd], 0
0x14007b15b: 742a                     je 0x14007b187
0x14007b15d: 803800                   cmp byte ptr [rax], 0
0x14007b160: 7525                     jne 0x14007b187
0x14007b162: 498b01                   mov rax, qword ptr [r9]
0x14007b165: 80787200                 cmp byte ptr [rax + 0x72], 0
0x14007b169: 751c                     jne 0x14007b187
0x14007b16b: 488b4570                 mov rax, qword ptr [rbp + 0x70]
0x14007b16f: 488b00                   mov rax, qword ptr [rax]
0x14007b172: 80b8c001000000           cmp byte ptr [rax + 0x1c0], 0
0x14007b179: 750c                     jne 0x14007b187
0x14007b17b: 488b4578                 mov rax, qword ptr [rbp + 0x78]
0x14007b17f: 488b00                   mov rax, qword ptr [rax]
0x14007b182: 803800                   cmp byte ptr [rax], 0
0x14007b185: 7418                     je 0x14007b19f
0x14007b187: 488b4640                 mov rax, qword ptr [rsi + 0x40]
0x14007b18b: 498906                   mov qword ptr [r14], rax
0x14007b18e: 4883c478                 add rsp, 0x78
0x14007b192: 5b                       pop rbx
0x14007b193: 5f                       pop rdi
0x14007b194: 5e                       pop rsi
0x14007b195: 415c                     pop r12
0x14007b197: 415d                     pop r13
0x14007b199: 415e                     pop r14
0x14007b19b: 415f                     pop r15
0x14007b19d: 5d                       pop rbp
0x14007b19e: c3                       ret
0x14007b19f: 488b8580000000           mov rax, qword ptr [rbp + 0x80]
0x14007b1a6: 488b10                   mov rdx, qword ptr [rax]
0x14007b1a9: 488b4810                 mov rcx, qword ptr [rax + 0x10]
0x14007b1ad: 48894dd0                 mov qword ptr [rbp - 0x30], rcx
0x14007b1b1: 8b401c                   mov eax, dword ptr [rax + 0x1c]
0x14007b1b4: 8945fc                   mov dword ptr [rbp - 4], eax
0x14007b1b7: 488d7dd8                 lea rdi, [rbp - 0x28]
0x14007b1bb: 4889f9                   mov rcx, rdi
0x14007b1be: 488955f0                 mov qword ptr [rbp - 0x10], rdx
0x14007b1c2: e82921b505               call 0x145bcd2f0
0x14007b1c7: 498b06                   mov rax, qword ptr [r14]
0x14007b1ca: 4531c9                   xor r9d, r9d
0x14007b1cd: 4889c1                   mov rcx, rax
0x14007b1d0: 482b4e18                 sub rcx, qword ptr [rsi + 0x18]
0x14007b1d4: 490f42c9                 cmovb rcx, r9
0x14007b1d8: 482b4638                 sub rax, qword ptr [rsi + 0x38]
0x14007b1dc: 490f42c1                 cmovb rax, r9
0x14007b1e0: 4c6be158                 imul r12, rcx, 0x58
0x14007b1e4: 4c036608                 add r12, qword ptr [rsi + 8]
0x14007b1e8: 488b5610                 mov rdx, qword ptr [rsi + 0x10]
0x14007b1ec: 4829ca                   sub rdx, rcx
0x14007b1ef: 490f42d1                 cmovb rdx, r9
0x14007b1f3: 488b4e30                 mov rcx, qword ptr [rsi + 0x30]
0x14007b1f7: 41b808000000             mov r8d, 8
0x14007b1fd: 4d0f42e0                 cmovb r12, r8
0x14007b201: 4c6bf858                 imul r15, rax, 0x58
0x14007b205: 4c037e28                 add r15, qword ptr [rsi + 0x28]
0x14007b209: 4829c1                   sub rcx, rax
0x14007b20c: 4d0f42f8                 cmovb r15, r8
0x14007b210: 490f42c9                 cmovb rcx, r9
0x14007b214: 488b4640                 mov rax, qword ptr [rsi + 0x40]
0x14007b218: 4829c8                   sub rax, rcx
0x14007b21b: 4829d0                   sub rax, rdx
0x14007b21e: 498906                   mov qword ptr [r14], rax
0x14007b221: 4c6bea58                 imul r13, rdx, 0x58
0x14007b225: 4d01e5                   add r13, r12
0x14007b228: 486bc158                 imul rax, rcx, 0x58
0x14007b22c: 4c01f8                   add rax, r15
0x14007b22f: 488945c8                 mov qword ptr [rbp - 0x38], rax
0x14007b233: eb1b                     jmp 0x14007b250
0x14007b235: 4889f9                   mov rcx, rdi
0x14007b238: ba20000000               mov edx, 0x20
0x14007b23d: e84eccfeff               call 0x140067e90
0x14007b242: 90                       nop
0x14007b243: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14007b250: 4d85e4                   test r12, r12
0x14007b253: 741b                     je 0x14007b270
0x14007b255: 4d39ec                   cmp r12, r13
0x14007b258: 7416                     je 0x14007b270
0x14007b25a: 498d4c2458               lea rcx, [r12 + 0x58]
0x14007b25f: 4c89e0                   mov rax, r12
0x14007b262: 49ff06                   inc qword ptr [r14]
0x14007b265: 4989cc                   mov r12, rcx
0x14007b268: 80785400                 cmp byte ptr [rax + 0x54], 0
0x14007b26c: 75e2                     jne 0x14007b250
0x14007b26e: eb28                     jmp 0x14007b298
0x14007b270: 4d85ff                   test r15, r15
0x14007b273: 0f84a0010000             je 0x14007b419
0x14007b279: 4c3b7dc8                 cmp r15, qword ptr [rbp - 0x38]
0x14007b27d: 0f8496010000             je 0x14007b419
0x14007b283: 4c89f8                   mov rax, r15
0x14007b286: 4983c758                 add r15, 0x58
0x14007b28a: 31c9                     xor ecx, ecx
0x14007b28c: 49ff06                   inc qword ptr [r14]
0x14007b28f: 4989cc                   mov r12, rcx
0x14007b292: 80785400                 cmp byte ptr [rax + 0x54], 0
0x14007b296: 75b8                     jne 0x14007b250
0x14007b298: 8b4808                   mov ecx, dword ptr [rax + 8]
0x14007b29b: 83f91c                   cmp ecx, 0x1c
0x14007b29e: 7432                     je 0x14007b2d2
0x14007b2a0: 83f913                   cmp ecx, 0x13
0x14007b2a3: 7490                     je 0x14007b235
0x14007b2a5: 85c9                     test ecx, ecx
0x14007b2a7: 75a7                     jne 0x14007b250
0x14007b2a9: 0fb65810                 movzx ebx, byte ptr [rax + 0x10]
0x14007b2ad: 488d4be9                 lea rcx, [rbx - 0x17]
0x14007b2b1: 4883fb18                 cmp rbx, 0x18
0x14007b2b5: ba00000000               mov edx, 0
0x14007b2ba: 480f42ca                 cmovb rcx, rdx
0x14007b2be: 4885c9                   test rcx, rcx
0x14007b2c1: 746c                     je 0x14007b32f
0x14007b2c3: 83f901                   cmp ecx, 1
0x14007b2c6: 7579                     jne 0x14007b341
0x14007b2c8: 488b7018                 mov rsi, qword ptr [rax + 0x18]
0x14007b2cc: 488b5820                 mov rbx, qword ptr [rax + 0x20]
0x14007b2d0: eb7b                     jmp 0x14007b34d
0x14007b2d2: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0x14007b2d6: 4885c0                   test rax, rax
0x14007b2d9: 0f8471ffffff             je 0x14007b250
0x14007b2df: 4c8b4de0                 mov r9, qword ptr [rbp - 0x20]
0x14007b2e3: 48c7c1ffffffff           mov rcx, 0xffffffffffffffff
0x14007b2ea: 41807c01ff00             cmp byte ptr [r9 + rax - 1], 0
0x14007b2f0: 0f8917010000             jns 0x14007b40d
0x14007b2f6: 410fb65401fe             movzx edx, byte ptr [r9 + rax - 2]
0x14007b2fc: 80fabf                   cmp dl, 0xbf
0x14007b2ff: 0f8fd5000000             jg 0x14007b3da
0x14007b305: 450fb64401fd             movzx r8d, byte ptr [r9 + rax - 3]
0x14007b30b: 4180f8bf                 cmp r8b, 0xbf
0x14007b30f: 0f8fca000000             jg 0x14007b3df
0x14007b315: 450fb64c01fc             movzx r9d, byte ptr [r9 + rax - 4]
0x14007b31b: 4183e107                 and r9d, 7
0x14007b31f: 41c1e106                 shl r9d, 6
0x14007b323: 4183e03f                 and r8d, 0x3f
0x14007b327: 4509c8                   or r8d, r9d
0x14007b32a: e9b4000000               jmp 0x14007b3e3
0x14007b32f: 80fb18                   cmp bl, 0x18
0x14007b332: 0f8369010000             jae 0x14007b4a1
0x14007b338: 4883c011                 add rax, 0x11
0x14007b33c: 4889c6                   mov rsi, rax
0x14007b33f: eb0c                     jmp 0x14007b34d
0x14007b341: 488b7018                 mov rsi, qword ptr [rax + 0x18]
0x14007b345: 488b5820                 mov rbx, qword ptr [rax + 0x20]
0x14007b349: 4883c610                 add rsi, 0x10
0x14007b34d: 4801f3                   add rbx, rsi
0x14007b350: eb1a                     jmp 0x14007b36c
0x14007b352: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x14007b360: 48ffc6                   inc rsi
0x14007b363: 4889f9                   mov rcx, rdi
0x14007b366: e825cbfeff               call 0x140067e90
0x14007b36b: 90                       nop
0x14007b36c: 4839de                   cmp rsi, rbx
0x14007b36f: 0f84dbfeffff             je 0x14007b250
0x14007b375: 0fb60e                   movzx ecx, byte ptr [rsi]
0x14007b378: 0fb6d1                   movzx edx, cl
0x14007b37b: 84d2                     test dl, dl
0x14007b37d: 79e1                     jns 0x14007b360
0x14007b37f: 89d0                     mov eax, edx
0x14007b381: 83e01f                   and eax, 0x1f
0x14007b384: 440fb64601               movzx r8d, byte ptr [rsi + 1]
0x14007b389: 4183e03f                 and r8d, 0x3f
0x14007b38d: 80fadf                   cmp dl, 0xdf
0x14007b390: 762f                     jbe 0x14007b3c1
0x14007b392: 0fb65602                 movzx edx, byte ptr [rsi + 2]
0x14007b396: 41c1e006                 shl r8d, 6
0x14007b39a: 83e23f                   and edx, 0x3f
0x14007b39d: 4409c2                   or edx, r8d
0x14007b3a0: 80f9f0                   cmp cl, 0xf0
0x14007b3a3: 722a                     jb 0x14007b3cf
0x14007b3a5: 0fb64e03                 movzx ecx, byte ptr [rsi + 3]
0x14007b3a9: 4883c604                 add rsi, 4
0x14007b3ad: 83e007                   and eax, 7
0x14007b3b0: c1e012                   shl eax, 0x12
0x14007b3b3: c1e206                   shl edx, 6
0x14007b3b6: 83e13f                   and ecx, 0x3f
0x14007b3b9: 09d1                     or ecx, edx
0x14007b3bb: 09c1                     or ecx, eax
0x14007b3bd: 89ca                     mov edx, ecx
0x14007b3bf: eba2                     jmp 0x14007b363
0x14007b3c1: 4883c602                 add rsi, 2
0x14007b3c5: c1e006                   shl eax, 6
0x14007b3c8: 4409c0                   or eax, r8d
0x14007b3cb: 89c2                     mov edx, eax
0x14007b3cd: eb94                     jmp 0x14007b363
0x14007b3cf: 4883c603                 add rsi, 3
0x14007b3d3: c1e00c                   shl eax, 0xc
0x14007b3d6: 09c2                     or edx, eax
0x14007b3d8: eb89                     jmp 0x14007b363
0x14007b3da: 83e21f                   and edx, 0x1f
0x14007b3dd: eb0e                     jmp 0x14007b3ed
0x14007b3df: 4183e00f                 and r8d, 0xf
0x14007b3e3: 41c1e006                 shl r8d, 6
0x14007b3e7: 83e23f                   and edx, 0x3f
0x14007b3ea: 4409c2                   or edx, r8d
0x14007b3ed: 83fa02                   cmp edx, 2
0x14007b3f0: 721b                     jb 0x14007b40d
0x14007b3f2: 48c7c1feffffff           mov rcx, 0xfffffffffffffffe
0x14007b3f9: 83fa20                   cmp edx, 0x20
0x14007b3fc: 720f                     jb 0x14007b40d
0x14007b3fe: 31c9                     xor ecx, ecx
0x14007b400: 81fa00040000             cmp edx, 0x400
0x14007b406: 0f92c1                   setb cl
0x14007b409: 4883c9fc                 or rcx, 0xfffffffffffffffc
0x14007b40d: 4801c1                   add rcx, rax
0x14007b410: 48894de8                 mov qword ptr [rbp - 0x18], rcx
0x14007b414: e937feffff               jmp 0x14007b250
0x14007b419: 488b7de0                 mov rdi, qword ptr [rbp - 0x20]
0x14007b41d: 488b5de8                 mov rbx, qword ptr [rbp - 0x18]
0x14007b421: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x14007b425: 483b5810                 cmp rbx, qword ptr [rax + 0x10]
0x14007b429: 7513                     jne 0x14007b43e
0x14007b42b: 488b5008                 mov rdx, qword ptr [rax + 8]
0x14007b42f: 4889f9                   mov rcx, rdi
0x14007b432: 4989d8                   mov r8, rbx
0x14007b435: e8a7ecb705               call 0x145bfa0e1
0x14007b43a: 85c0                     test eax, eax
0x14007b43c: 7443                     je 0x14007b481
0x14007b43e: 488d4db0                 lea rcx, [rbp - 0x50]
0x14007b442: 4889fa                   mov rdx, rdi
0x14007b445: 4989d8                   mov r8, rbx
0x14007b448: e853db8205               call 0x1458a8fa0
0x14007b44d: 90                       nop
0x14007b44e: 488b45d0                 mov rax, qword ptr [rbp - 0x30]
0x14007b452: 8b4dfc                   mov ecx, dword ptr [rbp - 4]
0x14007b455: 8908                     mov dword ptr [rax], ecx
0x14007b457: 488b75f0                 mov rsi, qword ptr [rbp - 0x10]
0x14007b45b: 488b16                   mov rdx, qword ptr [rsi]
0x14007b45e: 4885d2                   test rdx, rdx
0x14007b461: 740f                     je 0x14007b472
0x14007b463: 488b4e08                 mov rcx, qword ptr [rsi + 8]
0x14007b467: 41b801000000             mov r8d, 1
0x14007b46d: e85e6df8ff               call 0x1400021d0
0x14007b472: 488b45c0                 mov rax, qword ptr [rbp - 0x40]
0x14007b476: 48894610                 mov qword ptr [rsi + 0x10], rax
0x14007b47a: 0f1045b0                 movups xmm0, xmmword ptr [rbp - 0x50]
0x14007b47e: 0f1106                   movups xmmword ptr [rsi], xmm0
0x14007b481: 488b55d8                 mov rdx, qword ptr [rbp - 0x28]
0x14007b485: 4885d2                   test rdx, rdx
0x14007b488: 0f8400fdffff             je 0x14007b18e
0x14007b48e: 41b801000000             mov r8d, 1
0x14007b494: 4889f9                   mov rcx, rdi
0x14007b497: e8346df8ff               call 0x1400021d0
0x14007b49c: e9edfcffff               jmp 0x14007b18e
0x14007b4a1: 4c8d0d0033d505           lea r9, [rip + 0x5d53300]
0x14007b4a8: 41b817000000             mov r8d, 0x17
0x14007b4ae: 31c9                     xor ecx, ecx
0x14007b4b0: 4889da                   mov rdx, rbx
0x14007b4b3: e8a8e3d105               call 0x145d99860
0x14007b4b8: 90                       nop
0x14007b4b9: 0f0b                     ud2
