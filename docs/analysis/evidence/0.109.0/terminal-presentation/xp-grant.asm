14589cea0 4157 push r15
14589cea2 4156 push r14
14589cea4 56 push rsi
14589cea5 57 push rdi
14589cea6 55 push rbp
14589cea7 53 push rbx
14589cea8 4883ec28 sub rsp, 0x28
14589ceac 4c8b4968 mov r9, qword ptr [rcx + 0x68]
14589ceb0 488b7170 mov rsi, qword ptr [rcx + 0x70]
14589ceb4 4889f7 mov rdi, rsi
14589ceb7 48c1e705 shl rdi, 5
14589cebb 4531d2 xor r10d, r10d
14589cebe 31c0 xor eax, eax
14589cec0 4839c7 cmp rdi, rax
14589cec3 7413 je 0x14589ced8
14589cec5 4c8d5820 lea r11, [rax + 0x20]
14589cec9 4138540104 cmp byte ptr [r9 + rax + 4], dl
14589cece 4c89d8 mov rax, r11
14589ced1 75ed jne 0x14589cec0
14589ced3 478b5419e0 mov r10d, dword ptr [r9 + r11 - 0x20]
14589ced8 41bb6e000000 mov r11d, 0x6e
14589cede b802000000 mov eax, 2
14589cee3 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589cef0 418d5be2 lea ebx, [r11 - 0x1e]
14589cef4 4129da sub r10d, ebx
14589cef7 7225 jb 0x14589cf1e
14589cef9 418d5bf1 lea ebx, [r11 - 0xf]
14589cefd 4129da sub r10d, ebx
14589cf00 7221 jb 0x14589cf23
14589cf02 4529da sub r10d, r11d
14589cf05 721e jb 0x14589cf25
14589cf07 4183c32d add r11d, 0x2d
14589cf0b 83c003 add eax, 3
14589cf0e 4181fb6b030000 cmp r11d, 0x36b
14589cf15 75d9 jne 0x14589cef0
14589cf17 b833000000 mov eax, 0x33
14589cf1c eb07 jmp 0x14589cf25
14589cf1e 83c0fe add eax, -2
14589cf21 eb02 jmp 0x14589cf25
14589cf23 ffc8 dec eax
14589cf25 4531d2 xor r10d, r10d
14589cf28 0f1f840000000000 nop dword ptr [rax + rax]
14589cf30 4c39d7 cmp rdi, r10
14589cf33 7423 je 0x14589cf58
14589cf35 4d8d5a20 lea r11, [r10 + 0x20]
14589cf39 4338541104 cmp byte ptr [r9 + r10 + 4], dl
14589cf3e 4d89da mov r10, r11
14589cf41 75ed jne 0x14589cf30
14589cf43 47034419e0 add r8d, dword ptr [r9 + r11 - 0x20]
14589cf48 b9ffffffff mov ecx, 0xffffffff
14589cf4d 410f43c8 cmovae ecx, r8d
14589cf51 43894c19e0 mov dword ptr [r9 + r11 - 0x20], ecx
14589cf56 eb5b jmp 0x14589cfb3
14589cf58 483b7160 cmp rsi, qword ptr [rcx + 0x60]
14589cf5c 7526 jne 0x14589cf84
14589cf5e 4c8d4960 lea r9, [rcx + 0x60]
14589cf62 4889cb mov rbx, rcx
14589cf65 4c89c9 mov rcx, r9
14589cf68 89c5 mov ebp, eax
14589cf6a 4189d7 mov r15d, edx
14589cf6d 4589c6 mov r14d, r8d
14589cf70 e89bde3500 call 0x145bfae10
14589cf75 4589f0 mov r8d, r14d
14589cf78 4889d9 mov rcx, rbx
14589cf7b 4489fa mov edx, r15d
14589cf7e 89e8 mov eax, ebp
14589cf80 4c8b4b68 mov r9, qword ptr [rbx + 0x68]
14589cf84 45890439 mov dword ptr [r9 + rdi], r8d
14589cf88 4188543904 mov byte ptr [r9 + rdi + 4], dl
14589cf8d 49c744390800000000 mov qword ptr [r9 + rdi + 8], 0
14589cf96 49c744391008000000 mov qword ptr [r9 + rdi + 0x10], 8
14589cf9f 49c744391800000000 mov qword ptr [r9 + rdi + 0x18], 0
14589cfa8 48ffc6 inc rsi
14589cfab 48897170 mov qword ptr [rcx + 0x70], rsi
14589cfaf 4c8b4968 mov r9, qword ptr [rcx + 0x68]
14589cfb3 48c1e605 shl rsi, 5
14589cfb7 31c9 xor ecx, ecx
14589cfb9 4531c0 xor r8d, r8d
14589cfbc 0f1f4000 nop dword ptr [rax]
14589cfc0 4c39c6 cmp rsi, r8
14589cfc3 7413 je 0x14589cfd8
14589cfc5 4d8d5020 lea r10, [r8 + 0x20]
14589cfc9 4338540104 cmp byte ptr [r9 + r8 + 4], dl
14589cfce 4d89d0 mov r8, r10
14589cfd1 75ed jne 0x14589cfc0
14589cfd3 438b4c11e0 mov ecx, dword ptr [r9 + r10 - 0x20]
14589cfd8 41b86e000000 mov r8d, 0x6e
14589cfde ba02000000 mov edx, 2
14589cfe3 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589cff0 458d48e2 lea r9d, [r8 - 0x1e]
14589cff4 4429c9 sub ecx, r9d
14589cff7 7225 jb 0x14589d01e
14589cff9 458d48f1 lea r9d, [r8 - 0xf]
14589cffd 4429c9 sub ecx, r9d
14589d000 7221 jb 0x14589d023
14589d002 4429c1 sub ecx, r8d
14589d005 721e jb 0x14589d025
14589d007 4183c02d add r8d, 0x2d
14589d00b 83c203 add edx, 3
14589d00e 4181f86b030000 cmp r8d, 0x36b
14589d015 75d9 jne 0x14589cff0
14589d017 ba33000000 mov edx, 0x33
14589d01c eb07 jmp 0x14589d025
14589d01e 83c2fe add edx, -2
14589d021 eb02 jmp 0x14589d025
14589d023 ffca dec edx
14589d025 4883c428 add rsp, 0x28
14589d029 5b pop rbx
14589d02a 5d pop rbp
14589d02b 5f pop rdi
14589d02c 5e pop rsi
14589d02d 415e pop r14
14589d02f 415f pop r15
14589d031 c3 ret
