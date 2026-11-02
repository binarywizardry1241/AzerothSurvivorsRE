0000000145cccb89 80bd8200000000                 cmp byte ptr [rbp + 0x82], 0
0000000145cccb90 440fb68583000000               movzx r8d, byte ptr [rbp + 0x83]
0000000145cccb98 440fb68d81000000               movzx r9d, byte ptr [rbp + 0x81]
0000000145cccba0 450f44c1                       cmove r8d, r9d
0000000145cccba4 4180e006                       and r8b, 6
0000000145cccba8 4180f804                       cmp r8b, 4
0000000145cccbac 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145cccbb0 f30f11b898000000               movss dword ptr [rax + 0x98], xmm7
0000000145cccbb8 448888c3000000                 mov byte ptr [rax + 0xc3], r9b
0000000145cccbbf 0f9480c0000000                 sete byte ptr [rax + 0xc0]
0000000145cccbc6 448b451c                       mov r8d, dword ptr [rbp + 0x1c]
0000000145cccbca 4489809c000000                 mov dword ptr [rax + 0x9c], r8d
0000000145cccbd1 448b4518                       mov r8d, dword ptr [rbp + 0x18]
0000000145cccbd5 448880c1000000                 mov byte ptr [rax + 0xc1], r8b
