00000001402131e0 55                             push rbp
00000001402131e1 4157                           push r15
00000001402131e3 4156                           push r14
00000001402131e5 4155                           push r13
00000001402131e7 4154                           push r12
00000001402131e9 56                             push rsi
00000001402131ea 57                             push rdi
00000001402131eb 53                             push rbx
00000001402131ec b888200000                     mov eax, 0x2088
00000001402131f1 e8ea12df05                     call 0x1460044e0
00000001402131f6 4829c4                         sub rsp, rax
00000001402131f9 488dac2480000000               lea rbp, [rsp + 0x80]
0000000140213201 48c78500200000feffffff         mov qword ptr [rbp + 0x2000], 0xfffffffffffffffe
000000014021320c 4889ce                         mov rsi, rcx
000000014021320f 488d45a0                       lea rax, [rbp - 0x60]
0000000140213213 488985d01f0000                 mov qword ptr [rbp + 0x1fd0], rax
000000014021321a 48c785d81f000000200000         mov qword ptr [rbp + 0x1fd8], 0x2000
0000000140213225 48c785e01f000000000000         mov qword ptr [rbp + 0x1fe0], 0
0000000140213230 c685e81f000000                 mov byte ptr [rbp + 0x1fe8], 0
0000000140213237 488b01                         mov rax, qword ptr [rcx]
000000014021323a 488985f01f0000                 mov qword ptr [rbp + 0x1ff0], rax
0000000140213241 4c8b7110                       mov r14, qword ptr [rcx + 0x10]
0000000140213245 488d3ddc99ff05                 lea rdi, [rip + 0x5ff99dc]
000000014021324c 48c785a81f000000000000         mov qword ptr [rbp + 0x1fa8], 0
0000000140213257 4d85f6                         test r14, r14
000000014021325a 7538                           jne 0x140213294
000000014021325c 31db                           xor ebx, ebx
000000014021325e e9e5010000                     jmp 0x140213448
0000000140213263 666666662e0f1f840000000000     nop word ptr cs:[rax + rax]
0000000140213270 4c89f8                         mov rax, r15
0000000140213273 48c1e820                       shr rax, 0x20
0000000140213277 4883f82b                       cmp rax, 0x2b
000000014021327b b9ff000000                     mov ecx, 0xff
0000000140213280 0f43c1                         cmovae eax, ecx
0000000140213283 3c23                           cmp al, 0x23
0000000140213285 0f85e5010000                   jne 0x140213470
000000014021328b 4d85f6                         test r14, r14
000000014021328e 0f84ad010000                   je 0x140213441
0000000140213294 4c8ba5d81f0000                 mov r12, qword ptr [rbp + 0x1fd8]
000000014021329b 488b9de01f0000                 mov rbx, qword ptr [rbp + 0x1fe0]
00000001402132a2 4929dc                         sub r12, rbx
00000001402132a5 4d29f4                         sub r12, r14
00000001402132a8 7666                           jbe 0x140213310
00000001402132aa 4889f7                         mov rdi, rsi
00000001402132ad 4c8badd01f0000                 mov r13, qword ptr [rbp + 0x1fd0]
00000001402132b4 4901dd                         add r13, rbx
00000001402132b7 80bde81f000000                 cmp byte ptr [rbp + 0x1fe8], 0
00000001402132be 4c89adb01f0000                 mov qword ptr [rbp + 0x1fb0], r13
00000001402132c5 4c89b5b81f0000                 mov qword ptr [rbp + 0x1fb8], r14
00000001402132cc 48c785c01f000000000000         mov qword ptr [rbp + 0x1fc0], 0
00000001402132d7 c685c81f000000                 mov byte ptr [rbp + 0x1fc8], 0
00000001402132de 7470                           je 0x140213350
00000001402132e0 c685c81f000001                 mov byte ptr [rbp + 0x1fc8], 1
00000001402132e7 488b85f01f0000                 mov rax, qword ptr [rbp + 0x1ff0]
00000001402132ee 488b08                         mov rcx, qword ptr [rax]
00000001402132f1 488b4008                       mov rax, qword ptr [rax + 8]
00000001402132f5 488d95b01f0000                 lea rdx, [rbp + 0x1fb0]
00000001402132fc ff5048                         call qword ptr [rax + 0x48]
00000001402132ff 4989c7                         mov r15, rax
0000000140213302 488bb5c01f0000                 mov rsi, qword ptr [rbp + 0x1fc0]
0000000140213309 e984000000                     jmp 0x140213392
000000014021330e 6690                           nop
0000000140213310 488b85f01f0000                 mov rax, qword ptr [rbp + 0x1ff0]
0000000140213317 488b08                         mov rcx, qword ptr [rax]
000000014021331a 488b4008                       mov rax, qword ptr [rax + 8]
000000014021331e 488d95d01f0000                 lea rdx, [rbp + 0x1fd0]
0000000140213325 ff5048                         call qword ptr [rax + 0x48]
0000000140213328 4989c7                         mov r15, rax
000000014021332b 4901de                         add r14, rbx
000000014021332e 488b9de01f0000                 mov rbx, qword ptr [rbp + 0x1fe0]
0000000140213335 4929de                         sub r14, rbx
0000000140213338 4c897610                       mov qword ptr [rsi + 0x10], r14
000000014021333c 4c89bda01f0000                 mov qword ptr [rbp + 0x1fa0], r15
0000000140213343 4d85ff                         test r15, r15
0000000140213346 7575                           jne 0x1402133bd
0000000140213348 e9fe000000                     jmp 0x14021344b
000000014021334d 0f1f00                         nop dword ptr [rax]
0000000140213350 488b85f01f0000                 mov rax, qword ptr [rbp + 0x1ff0]
0000000140213357 488b08                         mov rcx, qword ptr [rax]
000000014021335a 488b4008                       mov rax, qword ptr [rax + 8]
000000014021335e 488d95b01f0000                 lea rdx, [rbp + 0x1fb0]
0000000140213365 ff5048                         call qword ptr [rax + 0x48]
0000000140213368 4989c7                         mov r15, rax
000000014021336b 488bb5c01f0000                 mov rsi, qword ptr [rbp + 0x1fc0]
0000000140213372 80bdc81f000000                 cmp byte ptr [rbp + 0x1fc8], 0
0000000140213379 7417                           je 0x140213392
000000014021337b 4d01f5                         add r13, r14
000000014021337e 4c89e9                         mov rcx, r13
0000000140213381 31d2                           xor edx, edx
0000000140213383 4d89e0                         mov r8, r12
0000000140213386 e8d21cdf05                     call 0x14600505d
000000014021338b c685e81f000001                 mov byte ptr [rbp + 0x1fe8], 1
0000000140213392 4801f3                         add rbx, rsi
0000000140213395 48899de01f0000                 mov qword ptr [rbp + 0x1fe0], rbx
000000014021339c 4929f6                         sub r14, rsi
000000014021339f 4889fe                         mov rsi, rdi
00000001402133a2 4c897710                       mov qword ptr [rdi + 0x10], r14
00000001402133a6 488d3d7b98ff05                 lea rdi, [rip + 0x5ff987b]
00000001402133ad 4c89bda01f0000                 mov qword ptr [rbp + 0x1fa0], r15
00000001402133b4 4d85ff                         test r15, r15
00000001402133b7 0f848e000000                   je 0x14021344b
00000001402133bd 4489f8                         mov eax, r15d
00000001402133c0 83e003                         and eax, 3
00000001402133c3 48630487                       movsxd rax, dword ptr [rdi + rax*4]
00000001402133c7 4801f8                         add rax, rdi
00000001402133ca ffe0                           jmp rax
00000001402133cc 41807f1023                     cmp byte ptr [r15 + 0x10], 0x23
00000001402133d1 0f84b4feffff                   je 0x14021328b
00000001402133d7 e994000000                     jmp 0x140213470
00000001402133dc 0f1f4000                       nop dword ptr [rax]
00000001402133e0 c685ff1f000001                 mov byte ptr [rbp + 0x1fff], 1
00000001402133e7 e804d6dc05                     call 0x145fe09f0
00000001402133ec 90                             nop
00000001402133ed 4c89f9                         mov rcx, r15
00000001402133f0 48c1e920                       shr rcx, 0x20
00000001402133f4 488b4010                       mov rax, qword ptr [rax + 0x10]
00000001402133f8 c685ff1f000001                 mov byte ptr [rbp + 0x1fff], 1
00000001402133ff ffd0                           call rax
0000000140213401 90                             nop
0000000140213402 84c0                           test al, al
0000000140213404 0f8581feffff                   jne 0x14021328b
000000014021340a eb64                           jmp 0x140213470
000000014021340c 0f1f4000                       nop dword ptr [rax]
0000000140213410 41807f1f23                     cmp byte ptr [r15 + 0x1f], 0x23
0000000140213415 7559                           jne 0x140213470
0000000140213417 49ffcf                         dec r15
000000014021341a 4c89bdb81f0000                 mov qword ptr [rbp + 0x1fb8], r15
0000000140213421 c685b01f000003                 mov byte ptr [rbp + 0x1fb0], 3
0000000140213428 c685ff1f000000                 mov byte ptr [rbp + 0x1fff], 0
000000014021342f 488d8db81f0000                 lea rcx, [rbp + 0x1fb8]
0000000140213436 e8f572dd05                     call 0x145fea730
000000014021343b 90                             nop
000000014021343c e94afeffff                     jmp 0x14021328b
0000000140213441 488b9de01f0000                 mov rbx, qword ptr [rbp + 0x1fe0]
0000000140213448 4531f6                         xor r14d, r14d
000000014021344b 4885db                         test rbx, rbx
000000014021344e 743c                           je 0x14021348c
0000000140213450 48019da81f0000                 add qword ptr [rbp + 0x1fa8], rbx
0000000140213457 48c785e01f000000000000         mov qword ptr [rbp + 0x1fe0], 0
0000000140213462 4d85f6                         test r14, r14
0000000140213465 0f8529feffff                   jne 0x140213294
000000014021346b e9ecfdffff                     jmp 0x14021325c
0000000140213470 b801000000                     mov eax, 1
0000000140213475 4c89fa                         mov rdx, r15
0000000140213478 4881c488200000                 add rsp, 0x2088
000000014021347f 5b                             pop rbx
0000000140213480 5f                             pop rdi
0000000140213481 5e                             pop rsi
0000000140213482 415c                           pop r12
0000000140213484 415d                           pop r13
0000000140213486 415e                           pop r14
0000000140213488 415f                           pop r15
000000014021348a 5d                             pop rbp
000000014021348b c3                             ret
000000014021348c 31c0                           xor eax, eax
000000014021348e 4c8bbda81f0000                 mov r15, qword ptr [rbp + 0x1fa8]
0000000140213495 ebde                           jmp 0x140213475
