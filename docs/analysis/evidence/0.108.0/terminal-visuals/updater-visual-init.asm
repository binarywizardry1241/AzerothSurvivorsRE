1400daf60 55 push rbp
1400daf61 4157 push r15
1400daf63 4156 push r14
1400daf65 4155 push r13
1400daf67 4154 push r12
1400daf69 56 push rsi
1400daf6a 57 push rdi
1400daf6b 53 push rbx
1400daf6c 4881ec180e0000 sub rsp, 0xe18
1400daf73 488dac2480000000 lea rbp, [rsp + 0x80]
1400daf7b 48c785900d0000feffffff mov qword ptr [rbp + 0xd90], 0xfffffffffffffffe
1400daf86 4c89c3 mov rbx, r8
1400daf89 4889d7 mov rdi, rdx
1400daf8c 4889ce mov rsi, rcx
1400daf8f 4883baf0000000ff cmp qword ptr [rdx + 0xf0], -1
1400daf97 7451 je 0x1400dafea
1400daf99 488b83a0050000 mov rax, qword ptr [rbx + 0x5a0]
1400dafa0 488985c8070000 mov qword ptr [rbp + 0x7c8], rax
1400dafa7 483987f8060000 cmp qword ptr [rdi + 0x6f8], rax
1400dafae 0f8475010000 je 0x1400db129
1400dafb4 4881c7f8060000 add rdi, 0x6f8
1400dafbb 488d05f64acf05 lea rax, [rip + 0x5cf4af6]
1400dafc2 4889442428 mov qword ptr [rsp + 0x28], rax
1400dafc7 48c744242083000000 mov qword ptr [rsp + 0x20], 0x83
1400dafd0 4c8d0d994acf05 lea r9, [rip + 0x5cf4a99]
1400dafd7 4c8d85c8070000 lea r8, [rbp + 0x7c8]
1400dafde 31c9 xor ecx, ecx
1400dafe0 4889fa mov rdx, rdi
1400dafe3 e81575c605 call 0x145d424fd
1400dafe8 0f0b ud2
1400dafea 4889d9 mov rcx, rbx
1400dafed e8eedbf5ff call 0x140038be0
1400daff2 4989c6 mov r14, rax
1400daff5 488d8d80050000 lea rcx, [rbp + 0x580]
1400daffc 4889da mov rdx, rbx
1400dafff e8dc433000 call 0x1403df3e0
1400db004 90 nop
1400db005 488d8d58040000 lea rcx, [rbp + 0x458]
1400db00c 4889da mov rdx, rbx
1400db00f e8bcdb2d00 call 0x1403b8bd0
1400db014 90 nop
1400db015 488d8d00020000 lea rcx, [rbp + 0x200]
1400db01c 4889da mov rdx, rbx
1400db01f e82c473000 call 0x1403df750
1400db024 90 nop
1400db025 488d8da8060000 lea rcx, [rbp + 0x6a8]
1400db02c 4889da mov rdx, rbx
1400db02f e82c272e00 call 0x1403bd760
1400db034 90 nop
1400db035 488d8d30030000 lea rcx, [rbp + 0x330]
1400db03c 4889da mov rdx, rbx
1400db03f e81c0d2e00 call 0x1403bbd60
1400db044 90 nop
1400db045 488d8dd8000000 lea rcx, [rbp + 0xd8]
1400db04c 4889da mov rdx, rbx
1400db04f e84c362f00 call 0x1403ce6a0
1400db054 90 nop
1400db055 4c8dbdc8070000 lea r15, [rbp + 0x7c8]
1400db05c 488d9580050000 lea rdx, [rbp + 0x580]
1400db063 41b828010000 mov r8d, 0x128
1400db069 4c89f9 mov rcx, r15
1400db06c e8ca78b105 call 0x145bf293b
1400db071 488d8df0080000 lea rcx, [rbp + 0x8f0]
1400db078 488d9558040000 lea rdx, [rbp + 0x458]
1400db07f 41b828010000 mov r8d, 0x128
1400db085 e8b178b105 call 0x145bf293b
1400db08a 488d8d180a0000 lea rcx, [rbp + 0xa18]
1400db091 488d9500020000 lea rdx, [rbp + 0x200]
1400db098 41b830010000 mov r8d, 0x130
1400db09e e89878b105 call 0x145bf293b
1400db0a3 488d8d480b0000 lea rcx, [rbp + 0xb48]
1400db0aa 488d95a8060000 lea rdx, [rbp + 0x6a8]
1400db0b1 41b820010000 mov r8d, 0x120
1400db0b7 e87f78b105 call 0x145bf293b
1400db0bc 488d8d680c0000 lea rcx, [rbp + 0xc68]
1400db0c3 488d9530030000 lea rdx, [rbp + 0x330]
1400db0ca 41b828010000 mov r8d, 0x128
1400db0d0 e86678b105 call 0x145bf293b
1400db0d5 4c8d65b0 lea r12, [rbp - 0x50]
1400db0d9 488d95d8000000 lea rdx, [rbp + 0xd8]
1400db0e0 41b828010000 mov r8d, 0x128
1400db0e6 4c89e1 mov rcx, r12
1400db0e9 e84d78b105 call 0x145bf293b
1400db0ee 4c8baba0050000 mov r13, qword ptr [rbx + 0x5a0]
1400db0f5 41b8c8050000 mov r8d, 0x5c8
1400db0fb 4889f9 mov rcx, rdi
1400db0fe 4c89fa mov rdx, r15
1400db101 e83578b105 call 0x145bf293b
1400db106 4c89b7c8050000 mov qword ptr [rdi + 0x5c8], r14
1400db10d 488d8fd0050000 lea rcx, [rdi + 0x5d0]
1400db114 41b828010000 mov r8d, 0x128
1400db11a 4c89e2 mov rdx, r12
1400db11d e81978b105 call 0x145bf293b
1400db122 4c89aff8060000 mov qword ptr [rdi + 0x6f8], r13
1400db129 b80050cc3d mov eax, 0x3dcc5000
1400db12e 0383b0050000 add eax, dword ptr [rbx + 0x5b0]
1400db134 488d9700070000 lea rdx, [rdi + 0x700]
1400db13b 898700070000 mov dword ptr [rdi + 0x700], eax
1400db141 48c785e007000010000000 mov qword ptr [rbp + 0x7e0], 0x10
1400db14c 0f57c0 xorps xmm0, xmm0
1400db14f 0f1185e8070000 movups xmmword ptr [rbp + 0x7e8], xmm0
1400db156 48c785f807000010000000 mov qword ptr [rbp + 0x7f8], 0x10
1400db161 0f118500080000 movups xmmword ptr [rbp + 0x800], xmm0
1400db168 48c7851008000010000000 mov qword ptr [rbp + 0x810], 0x10
1400db173 0f118518080000 movups xmmword ptr [rbp + 0x818], xmm0
1400db17a 48c7852808000010000000 mov qword ptr [rbp + 0x828], 0x10
1400db185 0f118530080000 movups xmmword ptr [rbp + 0x830], xmm0
1400db18c 48c7854008000010000000 mov qword ptr [rbp + 0x840], 0x10
1400db197 48c785c807000000000000 mov qword ptr [rbp + 0x7c8], 0
1400db1a2 0f118548080000 movups xmmword ptr [rbp + 0x848], xmm0
1400db1a9 c7855808000000000000 mov dword ptr [rbp + 0x858], 0
1400db1b3 48c785d007000008000000 mov qword ptr [rbp + 0x7d0], 8
1400db1be 48c785d807000000000000 mov qword ptr [rbp + 0x7d8], 0
1400db1c9 4c8d85c8070000 lea r8, [rbp + 0x7c8]
1400db1d0 4889f9 mov rcx, rdi
1400db1d3 4989d9 mov r9, rbx
1400db1d6 e8a517f5ff call 0x14002c980
1400db1db 90 nop
1400db1dc 488d95c8070000 lea rdx, [rbp + 0x7c8]
1400db1e3 41b898000000 mov r8d, 0x98
1400db1e9 4889f1 mov rcx, rsi
1400db1ec e84a77b105 call 0x145bf293b
1400db1f1 4889f0 mov rax, rsi
1400db1f4 4881c4180e0000 add rsp, 0xe18
1400db1fb 5b pop rbx
1400db1fc 5f pop rdi
1400db1fd 5e pop rsi
1400db1fe 415c pop r12
1400db200 415d pop r13
1400db202 415e pop r14
1400db204 415f pop r15
1400db206 5d pop rbp
1400db207 c3 ret
