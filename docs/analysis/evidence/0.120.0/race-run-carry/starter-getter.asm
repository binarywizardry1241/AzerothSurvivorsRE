0000000145af68d0  55                     push rbp
0000000145af68d1  4157                   push r15
0000000145af68d3  4156                   push r14
0000000145af68d5  4154                   push r12
0000000145af68d7  56                     push rsi
0000000145af68d8  57                     push rdi
0000000145af68d9  53                     push rbx
0000000145af68da  4881eca0000000         sub rsp, 0xa0
0000000145af68e1  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145af68e9  48c74518feffffff       mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
0000000145af68f1  4889ce                 mov rsi, rcx
0000000145af68f4  41fec8                 dec r8b
0000000145af68f7  0fb6c2                 movzx eax, dl
0000000145af68fa  ffc8                   dec eax
0000000145af68fc  83f807                 cmp eax, 7
0000000145af68ff  0f8760010000           ja 0x145af6a65
0000000145af6905  488d0d6c1e4c01         lea rcx, [rip + 0x14c1e6c]
0000000145af690c  48630481               movsxd rax, dword ptr [rcx + rax*4]
0000000145af6910  4801c8                 add rax, rcx
0000000145af6913  ffe0                   jmp rax
0000000145af6915  41bf04000000           mov r15d, 4
0000000145af691b  4180f80b               cmp r8b, 0xb
0000000145af691f  0f8373010000           jae 0x145af6a98
0000000145af6925  410fb6c0               movzx eax, r8b
0000000145af6929  b9df050000             mov ecx, 0x5df
0000000145af692e  0fa3c1                 bt ecx, eax
0000000145af6931  0f8248010000           jb 0x145af6a7f
0000000145af6937  e95c010000             jmp 0x145af6a98
0000000145af693c  41bf04000000           mov r15d, 4
0000000145af6942  4180f80b               cmp r8b, 0xb
0000000145af6946  0f834c010000           jae 0x145af6a98
0000000145af694c  410fb6c0               movzx eax, r8b
0000000145af6950  b9df050000             mov ecx, 0x5df
0000000145af6955  0fa3c1                 bt ecx, eax
0000000145af6958  0f833a010000           jae 0x145af6a98
0000000145af695e  488d05b3134c01         lea rax, [rip + 0x14c13b3]
0000000145af6965  e91c010000             jmp 0x145af6a86
0000000145af696a  41bf04000000           mov r15d, 4
0000000145af6970  4180f80b               cmp r8b, 0xb
0000000145af6974  0f831e010000           jae 0x145af6a98
0000000145af697a  410fb6c0               movzx eax, r8b
0000000145af697e  b9df050000             mov ecx, 0x5df
0000000145af6983  0fa3c1                 bt ecx, eax
0000000145af6986  0f830c010000           jae 0x145af6a98
0000000145af698c  488d05d5124c01         lea rax, [rip + 0x14c12d5]
0000000145af6993  e9ee000000             jmp 0x145af6a86
0000000145af6998  41bf04000000           mov r15d, 4
0000000145af699e  4180f80b               cmp r8b, 0xb
0000000145af69a2  0f83f0000000           jae 0x145af6a98
0000000145af69a8  410fb6c0               movzx eax, r8b
0000000145af69ac  b9df050000             mov ecx, 0x5df
0000000145af69b1  0fa3c1                 bt ecx, eax
0000000145af69b4  0f83de000000           jae 0x145af6a98
0000000145af69ba  488d05ff124c01         lea rax, [rip + 0x14c12ff]
0000000145af69c1  e9c0000000             jmp 0x145af6a86
0000000145af69c6  41bf04000000           mov r15d, 4
0000000145af69cc  4180f80b               cmp r8b, 0xb
0000000145af69d0  0f83c2000000           jae 0x145af6a98
0000000145af69d6  410fb6c0               movzx eax, r8b
0000000145af69da  b9df050000             mov ecx, 0x5df
0000000145af69df  0fa3c1                 bt ecx, eax
0000000145af69e2  0f83b0000000           jae 0x145af6a98
0000000145af69e8  488d0531144c01         lea rax, [rip + 0x14c1431]
0000000145af69ef  e992000000             jmp 0x145af6a86
0000000145af69f4  41bf04000000           mov r15d, 4
0000000145af69fa  4180f80b               cmp r8b, 0xb
0000000145af69fe  0f8394000000           jae 0x145af6a98
0000000145af6a04  410fb6c0               movzx eax, r8b
0000000145af6a08  b9df050000             mov ecx, 0x5df
0000000145af6a0d  0fa3c1                 bt ecx, eax
0000000145af6a10  0f8382000000           jae 0x145af6a98
0000000145af6a16  488d05f3114c01         lea rax, [rip + 0x14c11f3]
0000000145af6a1d  eb67                   jmp 0x145af6a86
0000000145af6a1f  41bf04000000           mov r15d, 4
0000000145af6a25  4180f80b               cmp r8b, 0xb
0000000145af6a29  736d                   jae 0x145af6a98
0000000145af6a2b  410fb6c0               movzx eax, r8b
0000000145af6a2f  b9df050000             mov ecx, 0x5df
0000000145af6a34  0fa3c1                 bt ecx, eax
0000000145af6a37  735f                   jae 0x145af6a98
0000000145af6a39  488d0530134c01         lea rax, [rip + 0x14c1330]
0000000145af6a40  eb44                   jmp 0x145af6a86
0000000145af6a42  41bf04000000           mov r15d, 4
0000000145af6a48  4180f80b               cmp r8b, 0xb
0000000145af6a4c  734a                   jae 0x145af6a98
0000000145af6a4e  410fb6c0               movzx eax, r8b
0000000145af6a52  b9df050000             mov ecx, 0x5df
0000000145af6a57  0fa3c1                 bt ecx, eax
0000000145af6a5a  733c                   jae 0x145af6a98
0000000145af6a5c  488d0565134c01         lea rax, [rip + 0x14c1365]
0000000145af6a63  eb21                   jmp 0x145af6a86
0000000145af6a65  41bf04000000           mov r15d, 4
0000000145af6a6b  4180f80b               cmp r8b, 0xb
0000000145af6a6f  7327                   jae 0x145af6a98
0000000145af6a71  410fb6c0               movzx eax, r8b
0000000145af6a75  b9df050000             mov ecx, 0x5df
0000000145af6a7a  0fa3c1                 bt ecx, eax
0000000145af6a7d  7319                   jae 0x145af6a98
0000000145af6a7f  488d05f2134c01         lea rax, [rip + 0x14c13f2]
0000000145af6a86  410fb6c8               movzx ecx, r8b
0000000145af6a8a  488b04c8               mov rax, qword ptr [rax + rcx*8]
0000000145af6a8e  4c8b7808               mov r15, qword ptr [rax + 8]
0000000145af6a92  488b4010               mov rax, qword ptr [rax + 0x10]
0000000145af6a96  eb02                   jmp 0x145af6a9a
0000000145af6a98  31c0                   xor eax, eax
0000000145af6a9a  0f57c0                 xorps xmm0, xmm0
0000000145af6a9d  0f11463c               movups xmmword ptr [rsi + 0x3c], xmm0
0000000145af6aa1  0f114630               movups xmmword ptr [rsi + 0x30], xmm0
0000000145af6aa5  0f114620               movups xmmword ptr [rsi + 0x20], xmm0
0000000145af6aa9  0f114610               movups xmmword ptr [rsi + 0x10], xmm0
0000000145af6aad  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145af6ab0  4d8d2487               lea r12, [r15 + rax*4]
0000000145af6ab4  488d7da8               lea rdi, [rbp - 0x58]
0000000145af6ab8  0f1f840000000000       nop dword ptr [rax + rax]
0000000145af6ac0  4d39e7                 cmp r15, r12
0000000145af6ac3  7467                   je 0x145af6b2c
0000000145af6ac5  418b17                 mov edx, dword ptr [r15]
0000000145af6ac8  4983c704               add r15, 4
0000000145af6acc  4889f9                 mov rcx, rdi
0000000145af6acf  e8cc000000             call 0x145af6ba0
0000000145af6ad4  48837da8ff             cmp qword ptr [rbp - 0x58], -1
0000000145af6ad9  74e5                   je 0x145af6ac0
0000000145af6adb  0fb64d10               movzx ecx, byte ptr [rbp + 0x10]
0000000145af6adf  4883f913               cmp rcx, 0x13
0000000145af6ae3  735c                   jae 0x145af6b41
0000000145af6ae5  488b55a8               mov rdx, qword ptr [rbp - 0x58]
0000000145af6ae9  488b45b0               mov rax, qword ptr [rbp - 0x50]
0000000145af6aed  488b5dc0               mov rbx, qword ptr [rbp - 0x40]
0000000145af6af1  4c8b75c8               mov r14, qword ptr [rbp - 0x38]
0000000145af6af5  448b45f8               mov r8d, dword ptr [rbp - 8]
0000000145af6af9  4489048e               mov dword ptr [rsi + rcx*4], r8d
0000000145af6afd  4885d2                 test rdx, rdx
0000000145af6b00  740e                   je 0x145af6b10
0000000145af6b02  41b801000000           mov r8d, 1
0000000145af6b08  4889c1                 mov rcx, rax
0000000145af6b0b  e8c0b650fa             call 0x1400021d0
0000000145af6b10  4885db                 test rbx, rbx
0000000145af6b13  74ab                   je 0x145af6ac0
0000000145af6b15  48c1e303               shl rbx, 3
0000000145af6b19  41b804000000           mov r8d, 4
0000000145af6b1f  4c89f1                 mov rcx, r14
0000000145af6b22  4889da                 mov rdx, rbx
0000000145af6b25  e8a6b650fa             call 0x1400021d0
0000000145af6b2a  eb94                   jmp 0x145af6ac0
0000000145af6b2c  4889f0                 mov rax, rsi
0000000145af6b2f  4881c4a0000000         add rsp, 0xa0
0000000145af6b36  5b                     pop rbx
0000000145af6b37  5f                     pop rdi
0000000145af6b38  5e                     pop rsi
0000000145af6b39  415c                   pop r12
0000000145af6b3b  415e                   pop r14
0000000145af6b3d  415f                   pop r15
0000000145af6b3f  5d                     pop rbp
0000000145af6b40  c3                     ret
0000000145af6b41  4c8d0570d84b01         lea r8, [rip + 0x14bd870]
0000000145af6b48  ba13000000             mov edx, 0x13
0000000145af6b4d  e8b1456500             call 0x14614b103
0000000145af6b52  90                     nop
0000000145af6b53  0f0b                   ud2
