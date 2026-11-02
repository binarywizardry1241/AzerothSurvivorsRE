000000014005df10 55                             push rbp
000000014005df11 4157                           push r15
000000014005df13 4156                           push r14
000000014005df15 56                             push rsi
000000014005df16 57                             push rdi
000000014005df17 53                             push rbx
000000014005df18 4881ecb8040000                 sub rsp, 0x4b8
000000014005df1f 488dac2480000000               lea rbp, [rsp + 0x80]
000000014005df27 48c78530040000feffffff         mov qword ptr [rbp + 0x430], 0xfffffffffffffffe
000000014005df32 4c89c3                         mov rbx, r8
000000014005df35 4889d7                         mov rdi, rdx
000000014005df38 4889ce                         mov rsi, rcx
000000014005df3b 4c8db5b8020000                 lea r14, [rbp + 0x2b8]
000000014005df42 4c89f1                         mov rcx, r14
000000014005df45 e846944100                     call 0x140477390
000000014005df4a 48c785200300000a000000         mov qword ptr [rbp + 0x320], 0xa
000000014005df55 c7852803000000000000           mov dword ptr [rbp + 0x328], 0
000000014005df5f 48c785300300001e000000         mov qword ptr [rbp + 0x330], 0x1e
000000014005df6a c7853803000000000000           mov dword ptr [rbp + 0x338], 0
000000014005df74 4c8d0536b61506                 lea r8, [rip + 0x615b636]
000000014005df7b 4c8dbdb8010000                 lea r15, [rbp + 0x1b8]
000000014005df82 41b916000000                   mov r9d, 0x16
000000014005df88 4c89f9                         mov rcx, r15
000000014005df8b 4c89f2                         mov rdx, r14
000000014005df8e e8fd924100                     call 0x140477290
000000014005df93 4c89f9                         mov rcx, r15
000000014005df96 e895964100                     call 0x140477630
000000014005df9b 48898510040000                 mov qword ptr [rbp + 0x410], rax
000000014005dfa2 48899518040000                 mov qword ptr [rbp + 0x418], rdx
000000014005dfa9 488d8db8010000                 lea rcx, [rbp + 0x1b8]
000000014005dfb0 488d9510040000                 lea rdx, [rbp + 0x410]
000000014005dfb7 4989f8                         mov r8, rdi
000000014005dfba 4989d9                         mov r9, rbx
000000014005dfbd e85e8d4100                     call 0x140476d20
000000014005dfc2 90                             nop
000000014005dfc3 488d8db8020000                 lea rcx, [rbp + 0x2b8]
000000014005dfca 488d95b8010000                 lea rdx, [rbp + 0x1b8]
000000014005dfd1 e89aca4100                     call 0x14047aa70
000000014005dfd6 90                             nop
000000014005dfd7 4c8bb5b8020000                 mov r14, qword ptr [rbp + 0x2b8]
000000014005dfde 488d95c0020000                 lea rdx, [rbp + 0x2c0]
000000014005dfe5 488d8db0000000                 lea rcx, [rbp + 0xb0]
000000014005dfec 41b808010000                   mov r8d, 0x108
000000014005dff2 e85470fa05                     call 0x14600504b
000000014005dff7 4983fefe                       cmp r14, -2
000000014005dffb 0f85fb000000                   jne 0x14005e0fc
000000014005e001 4c8d75a8                       lea r14, [rbp - 0x58]
000000014005e005 488d95b0000000                 lea rdx, [rbp + 0xb0]
000000014005e00c 41b808010000                   mov r8d, 0x108
000000014005e012 4c89f1                         mov rcx, r14
000000014005e015 e83170fa05                     call 0x14600504b
000000014005e01a 90                             nop
000000014005e01b 4c89f1                         mov rcx, r14
000000014005e01e e89dea4100                     call 0x14047cac0
000000014005e023 90                             nop
000000014005e024 4989d0                         mov r8, rdx
000000014005e027 488d8dc8030000                 lea rcx, [rbp + 0x3c8]
000000014005e02e 4889c2                         mov rdx, rax
000000014005e031 e8badd0000                     call 0x14006bdf0
000000014005e036 90                             nop
000000014005e037 0fb685c8030000                 movzx eax, byte ptr [rbp + 0x3c8]
000000014005e03e 3cff                           cmp al, 0xff
000000014005e040 0f8418010000                   je 0x14005e15e
000000014005e046 8b8dc9030000                   mov ecx, dword ptr [rbp + 0x3c9]
000000014005e04c 8b95cc030000                   mov edx, dword ptr [rbp + 0x3cc]
000000014005e052 8995bc010000                   mov dword ptr [rbp + 0x1bc], edx
000000014005e058 898db9010000                   mov dword ptr [rbp + 0x1b9], ecx
000000014005e05e 488b8dd0030000                 mov rcx, qword ptr [rbp + 0x3d0]
000000014005e065 0f1085d8030000                 movups xmm0, xmmword ptr [rbp + 0x3d8]
000000014005e06c 0f1185c8010000                 movups xmmword ptr [rbp + 0x1c8], xmm0
000000014005e073 8885b8010000                   mov byte ptr [rbp + 0x1b8], al
000000014005e079 48898dc0010000                 mov qword ptr [rbp + 0x1c0], rcx
000000014005e080 488b8510040000                 mov rax, qword ptr [rbp + 0x410]
000000014005e087 f048ff08                       lock dec qword ptr [rax]
000000014005e08b 750d                           jne 0x14005e09a
000000014005e08d 488d8d10040000                 lea rcx, [rbp + 0x410]
000000014005e094 e817654100                     call 0x1404745b0
000000014005e099 90                             nop
000000014005e09a 488b8518040000                 mov rax, qword ptr [rbp + 0x418]
000000014005e0a1 f048ff08                       lock dec qword ptr [rax]
000000014005e0a5 750d                           jne 0x14005e0b4
000000014005e0a7 488d8d18040000                 lea rcx, [rbp + 0x418]
000000014005e0ae e8cd624100                     call 0x140474380
000000014005e0b3 90                             nop
000000014005e0b4 488d0dcbb31506                 lea rcx, [rip + 0x615b3cb]
000000014005e0bb 4c8d85b8010000                 lea r8, [rbp + 0x1b8]
000000014005e0c2 ba07000000                     mov edx, 7
000000014005e0c7 e804f5c702                     call 0x142cdd5d0
000000014005e0cc 90                             nop
000000014005e0cd 4885c0                         test rax, rax
000000014005e0d0 7507                           jne 0x14005e0d9
000000014005e0d2 488b055f025608                 mov rax, qword ptr [rip + 0x856025f]
000000014005e0d9 803803                         cmp byte ptr [rax], 3
000000014005e0dc 0f85d9010000                   jne 0x14005e2bb
000000014005e0e2 488b5018                       mov rdx, qword ptr [rax + 0x18]
000000014005e0e6 4885d2                         test rdx, rdx
000000014005e0e9 0f8915010000                   jns 0x14005e204
000000014005e0ef 31c9                           xor ecx, ecx
000000014005e0f1 e865fc1406                     call 0x1461add5b
000000014005e0f6 90                             nop
000000014005e0f7 e9c5030000                     jmp 0x14005e4c1
000000014005e0fc 488d8dc0020000                 lea rcx, [rbp + 0x2c0]
000000014005e103 488d95b0000000                 lea rdx, [rbp + 0xb0]
000000014005e10a 41b808010000                   mov r8d, 0x108
000000014005e110 e8366ffa05                     call 0x14600504b
000000014005e115 4c89b5b8020000                 mov qword ptr [rbp + 0x2b8], r14
000000014005e11c e8df40faff                     call 0x140002200
000000014005e121 b910010000                     mov ecx, 0x110
000000014005e126 ba08000000                     mov edx, 8
000000014005e12b e89040faff                     call 0x1400021c0
000000014005e130 4885c0                         test rax, rax
000000014005e133 0f84a1000000                   je 0x14005e1da
000000014005e139 4889c7                         mov rdi, rax
000000014005e13c 488d95b8020000                 lea rdx, [rbp + 0x2b8]
000000014005e143 41b810010000                   mov r8d, 0x110
000000014005e149 4889c1                         mov rcx, rax
000000014005e14c e8fa6efa05                     call 0x14600504b
000000014005e151 48897e08                       mov qword ptr [rsi + 8], rdi
000000014005e155 488d05ecb31506                 lea rax, [rip + 0x615b3ec]
000000014005e15c eb35                           jmp 0x14005e193
000000014005e15e 488bbdd0030000                 mov rdi, qword ptr [rbp + 0x3d0]
000000014005e165 4889bdb8020000                 mov qword ptr [rbp + 0x2b8], rdi
000000014005e16c e88f40faff                     call 0x140002200
000000014005e171 b908000000                     mov ecx, 8
000000014005e176 ba08000000                     mov edx, 8
000000014005e17b e84040faff                     call 0x1400021c0
000000014005e180 4885c0                         test rax, rax
000000014005e183 746a                           je 0x14005e1ef
000000014005e185 488938                         mov qword ptr [rax], rdi
000000014005e188 48894608                       mov qword ptr [rsi + 8], rax
000000014005e18c 488d053db31506                 lea rax, [rip + 0x615b33d]
000000014005e193 48894610                       mov qword ptr [rsi + 0x10], rax
000000014005e197 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
000000014005e19e 488b8510040000                 mov rax, qword ptr [rbp + 0x410]
000000014005e1a5 f048ff08                       lock dec qword ptr [rax]
000000014005e1a9 750d                           jne 0x14005e1b8
000000014005e1ab 488d8d10040000                 lea rcx, [rbp + 0x410]
000000014005e1b2 e8f9634100                     call 0x1404745b0
000000014005e1b7 90                             nop
000000014005e1b8 488b8518040000                 mov rax, qword ptr [rbp + 0x418]
000000014005e1bf f048ff08                       lock dec qword ptr [rax]
000000014005e1c3 0f853c010000                   jne 0x14005e305
000000014005e1c9 488d8d18040000                 lea rcx, [rbp + 0x418]
000000014005e1d0 e8ab614100                     call 0x140474380
000000014005e1d5 e92b010000                     jmp 0x14005e305
000000014005e1da b908000000                     mov ecx, 8
000000014005e1df ba10010000                     mov edx, 0x110
000000014005e1e4 e858fb1406                     call 0x1461add41
000000014005e1e9 90                             nop
000000014005e1ea e9d2020000                     jmp 0x14005e4c1
000000014005e1ef b908000000                     mov ecx, 8
000000014005e1f4 ba08000000                     mov edx, 8
000000014005e1f9 e843fb1406                     call 0x1461add41
000000014005e1fe 90                             nop
000000014005e1ff e9bd020000                     jmp 0x14005e4c1
000000014005e204 488995f8030000                 mov qword ptr [rbp + 0x3f8], rdx
000000014005e20b 0f84aa000000                   je 0x14005e2bb
000000014005e211 4c8b7010                       mov r14, qword ptr [rax + 0x10]
000000014005e215 e8e63ffaff                     call 0x140002200
000000014005e21a ba01000000                     mov edx, 1
000000014005e21f 4c8bbdf8030000                 mov r15, qword ptr [rbp + 0x3f8]
000000014005e226 4c89f9                         mov rcx, r15
000000014005e229 e8923ffaff                     call 0x1400021c0
000000014005e22e 4c89fa                         mov rdx, r15
000000014005e231 b901000000                     mov ecx, 1
000000014005e236 48898500040000                 mov qword ptr [rbp + 0x400], rax
000000014005e23d 4885c0                         test rax, rax
000000014005e240 0f84abfeffff                   je 0x14005e0f1
000000014005e246 488b8d00040000                 mov rcx, qword ptr [rbp + 0x400]
000000014005e24d 4989d0                         mov r8, rdx
000000014005e250 4c89f2                         mov rdx, r14
000000014005e253 e8f36dfa05                     call 0x14600504b
000000014005e258 90                             nop
000000014005e259 488d0d46b21506                 lea rcx, [rip + 0x615b246]
000000014005e260 4c8d85b8010000                 lea r8, [rbp + 0x1b8]
000000014005e267 ba05000000                     mov edx, 5
000000014005e26c e85ff3c702                     call 0x142cdd5d0
000000014005e271 90                             nop
000000014005e272 4885c0                         test rax, rax
000000014005e275 7507                           jne 0x14005e27e
000000014005e277 488b05ba005608                 mov rax, qword ptr [rip + 0x85600ba]
000000014005e27e b901000000                     mov ecx, 1
000000014005e283 48898d08040000                 mov qword ptr [rbp + 0x408], rcx
000000014005e28a 803803                         cmp byte ptr [rax], 3
000000014005e28d 0f85cf000000                   jne 0x14005e362
000000014005e293 488b5018                       mov rdx, qword ptr [rax + 0x18]
000000014005e297 48899520040000                 mov qword ptr [rbp + 0x420], rdx
000000014005e29e 4885d2                         test rdx, rdx
000000014005e2a1 7975                           jns 0x14005e318
000000014005e2a3 4531ff                         xor r15d, r15d
000000014005e2a6 4c89f9                         mov rcx, r15
000000014005e2a9 488b9520040000                 mov rdx, qword ptr [rbp + 0x420]
000000014005e2b0 e8a6fa1406                     call 0x1461add5b
000000014005e2b5 90                             nop
000000014005e2b6 e906020000                     jmp 0x14005e4c1
000000014005e2bb 48c785f003000001000000         mov qword ptr [rbp + 0x3f0], 1
000000014005e2c6 48c785e803000000000000         mov qword ptr [rbp + 0x3e8], 0
000000014005e2d1 c6852f04000001                 mov byte ptr [rbp + 0x42f], 1
000000014005e2d8 488d0daeb11506                 lea rcx, [rip + 0x615b1ae]
000000014005e2df ba19000000                     mov edx, 0x19
000000014005e2e4 e887a4f705                     call 0x145fd8770
000000014005e2e9 90                             nop
000000014005e2ea 48894608                       mov qword ptr [rsi + 8], rax
000000014005e2ee 48895610                       mov qword ptr [rsi + 0x10], rdx
000000014005e2f2 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
000000014005e2f9 488d8db8010000                 lea rcx, [rbp + 0x1b8]
000000014005e300 e8ab86feff                     call 0x1400469b0
000000014005e305 4889f0                         mov rax, rsi
000000014005e308 4881c4b8040000                 add rsp, 0x4b8
000000014005e30f 5b                             pop rbx
000000014005e310 5f                             pop rdi
000000014005e311 5e                             pop rsi
000000014005e312 415e                           pop r14
000000014005e314 415f                           pop r15
000000014005e316 5d                             pop rbp
000000014005e317 c3                             ret
000000014005e318 7448                           je 0x14005e362
000000014005e31a 4c8b7010                       mov r14, qword ptr [rax + 0x10]
000000014005e31e e8dd3efaff                     call 0x140002200
000000014005e323 41bf01000000                   mov r15d, 1
000000014005e329 ba01000000                     mov edx, 1
000000014005e32e 488b8d20040000                 mov rcx, qword ptr [rbp + 0x420]
000000014005e335 e8863efaff                     call 0x1400021c0
000000014005e33a 48898508040000                 mov qword ptr [rbp + 0x408], rax
000000014005e341 4885c0                         test rax, rax
000000014005e344 0f845cffffff                   je 0x14005e2a6
000000014005e34a 488b8d08040000                 mov rcx, qword ptr [rbp + 0x408]
000000014005e351 4c89f2                         mov rdx, r14
000000014005e354 4c8b8520040000                 mov r8, qword ptr [rbp + 0x420]
000000014005e35b e8eb6cfa05                     call 0x14600504b
000000014005e360 eb0b                           jmp 0x14005e36d
000000014005e362 48c7852004000000000000         mov qword ptr [rbp + 0x420], 0
000000014005e36d 4531f6                         xor r14d, r14d
000000014005e370 4989d8                         mov r8, rbx
000000014005e373 eb05                           jmp 0x14005e37a
000000014005e375 4939d8                         cmp r8, rbx
000000014005e378 7734                           ja 0x14005e3ae
000000014005e37a b12f                           mov cl, 0x2f
000000014005e37c 4889fa                         mov rdx, rdi
000000014005e37f e83c25f805                     call 0x145fe08c0
000000014005e384 90                             nop
000000014005e385 4883f801                       cmp rax, 1
000000014005e389 7523                           jne 0x14005e3ae
000000014005e38b 4989d0                         mov r8, rdx
000000014005e38e 4839da                         cmp rdx, rbx
000000014005e391 73e2                           jae 0x14005e375
000000014005e393 42803c072f                     cmp byte ptr [rdi + r8], 0x2f
000000014005e398 75db                           jne 0x14005e375
000000014005e39a 4d8d7001                       lea r14, [r8 + 1]
000000014005e39e 4939de                         cmp r14, rbx
000000014005e3a1 730b                           jae 0x14005e3ae
000000014005e3a3 42803c37bf                     cmp byte ptr [rdi + r14], 0xbf
000000014005e3a8 0f8ef5000000                   jle 0x14005e4a3
000000014005e3ae 488d8db8020000                 lea rcx, [rbp + 0x2b8]
000000014005e3b5 488d95b8010000                 lea rdx, [rbp + 0x1b8]
000000014005e3bc 4989f8                         mov r8, rdi
000000014005e3bf 4d89f1                         mov r9, r14
000000014005e3c2 e8a9f5ffff                     call 0x14005d970
000000014005e3c7 90                             nop
000000014005e3c8 488b95b8020000                 mov rdx, qword ptr [rbp + 0x2b8]
000000014005e3cf 488b85c0020000                 mov rax, qword ptr [rbp + 0x2c0]
000000014005e3d6 488b8dc8020000                 mov rcx, qword ptr [rbp + 0x2c8]
000000014005e3dd 4883faff                       cmp rdx, -1
000000014005e3e1 7470                           je 0x14005e453
000000014005e3e3 4c8b8500030000                 mov r8, qword ptr [rbp + 0x300]
000000014005e3ea 4c894678                       mov qword ptr [rsi + 0x78], r8
000000014005e3ee 0f1085d0020000                 movups xmm0, xmmword ptr [rbp + 0x2d0]
000000014005e3f5 0f108de0020000                 movups xmm1, xmmword ptr [rbp + 0x2e0]
000000014005e3fc 0f1095f0020000                 movups xmm2, xmmword ptr [rbp + 0x2f0]
000000014005e403 0f115668                       movups xmmword ptr [rsi + 0x68], xmm2
000000014005e407 0f114e58                       movups xmmword ptr [rsi + 0x58], xmm1
000000014005e40b 0f114648                       movups xmmword ptr [rsi + 0x48], xmm0
000000014005e40f 4c8b85f8030000                 mov r8, qword ptr [rbp + 0x3f8]
000000014005e416 4c8906                         mov qword ptr [rsi], r8
000000014005e419 4c8b8d00040000                 mov r9, qword ptr [rbp + 0x400]
000000014005e420 4c894e08                       mov qword ptr [rsi + 8], r9
000000014005e424 4c894610                       mov qword ptr [rsi + 0x10], r8
000000014005e428 4c8b8520040000                 mov r8, qword ptr [rbp + 0x420]
000000014005e42f 4c894618                       mov qword ptr [rsi + 0x18], r8
000000014005e433 4c8b8d08040000                 mov r9, qword ptr [rbp + 0x408]
000000014005e43a 4c894e20                       mov qword ptr [rsi + 0x20], r9
000000014005e43e 4c894628                       mov qword ptr [rsi + 0x28], r8
000000014005e442 48895630                       mov qword ptr [rsi + 0x30], rdx
000000014005e446 48894638                       mov qword ptr [rsi + 0x38], rax
000000014005e44a 48894e40                       mov qword ptr [rsi + 0x40], rcx
000000014005e44e e9a6feffff                     jmp 0x14005e2f9
000000014005e453 48894608                       mov qword ptr [rsi + 8], rax
000000014005e457 48894e10                       mov qword ptr [rsi + 0x10], rcx
000000014005e45b 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
000000014005e462 4883bd2004000000               cmp qword ptr [rbp + 0x420], 0
000000014005e46a 7419                           je 0x14005e485
000000014005e46c 41b801000000                   mov r8d, 1
000000014005e472 488b8d08040000                 mov rcx, qword ptr [rbp + 0x408]
000000014005e479 488b9520040000                 mov rdx, qword ptr [rbp + 0x420]
000000014005e480 e84b3dfaff                     call 0x1400021d0
000000014005e485 41b801000000                   mov r8d, 1
000000014005e48b 488b8d00040000                 mov rcx, qword ptr [rbp + 0x400]
000000014005e492 488b95f8030000                 mov rdx, qword ptr [rbp + 0x3f8]
000000014005e499 e8323dfaff                     call 0x1400021d0
000000014005e49e e956feffff                     jmp 0x14005e2f9
000000014005e4a3 488d054eb11506                 lea rax, [rip + 0x615b14e]
000000014005e4aa 4889442420                     mov qword ptr [rsp + 0x20], rax
000000014005e4af 4889f9                         mov rcx, rdi
000000014005e4b2 4889da                         mov rdx, rbx
000000014005e4b5 4531c0                         xor r8d, r8d
000000014005e4b8 4d89f1                         mov r9, r14
000000014005e4bb e8b0fa1406                     call 0x1461adf70
000000014005e4c0 90                             nop
000000014005e4c1 0f0b                           ud2
