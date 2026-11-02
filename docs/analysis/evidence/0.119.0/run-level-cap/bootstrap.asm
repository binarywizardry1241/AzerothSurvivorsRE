145aa8a20 55 push rbp
145aa8a21 56 push rsi
145aa8a22 57 push rdi
145aa8a23 4881eca0000000 sub rsp, 0xa0
145aa8a2a 488dac2480000000 lea rbp, [rsp + 0x80]
145aa8a32 48c74518feffffff mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
145aa8a3a 4c894df8 mov qword ptr [rbp - 8], r9
145aa8a3e 4c894500 mov qword ptr [rbp], r8
145aa8a42 4889d6 mov rsi, rdx
145aa8a45 4889cf mov rdi, rcx
145aa8a48 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8a4c e81f1a0800 call 0x145b2a470
145aa8a51 90 nop
145aa8a52 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8a56 e8b513fdff call 0x145a79e10
145aa8a5b 90 nop
145aa8a5c 31c9 xor ecx, ecx
145aa8a5e e81d3e0800 call 0x145b2c880
145aa8a63 803800 cmp byte ptr [rax], 0
145aa8a66 7406 je 0x145aa8a6e
145aa8a68 488b4008 mov rax, qword ptr [rax + 8]
145aa8a6c eb07 jmp 0x145aa8a75
145aa8a6e 488b05eb07a702 mov rax, qword ptr [rip + 0x2a707eb]
145aa8a75 4883f80d cmp rax, 0xd
145aa8a79 b90d000000 mov ecx, 0xd
145aa8a7e 480f42c8 cmovb rcx, rax
145aa8a82 486bc138 imul rax, rcx, 0x38
145aa8a86 488d0dc3e8b201 lea rcx, [rip + 0x1b2e8c3]
145aa8a8d 488b0c08 mov rcx, qword ptr [rax + rcx]
145aa8a91 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8a95 ba02000000 mov edx, 2
145aa8a9a e801d6fcff call 0x145a760a0
145aa8a9f 90 nop
145aa8aa0 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8aa4 e89712feff call 0x145a89d40
145aa8aa9 90 nop
145aa8aaa c6451701 mov byte ptr [rbp + 0x17], 1
145aa8aae e88dda0900 call 0x145b46540
145aa8ab3 90 nop
145aa8ab4 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8ab8 e8d3b60900 call 0x145b44190
145aa8abd 90 nop
145aa8abe c6451701 mov byte ptr [rbp + 0x17], 1
145aa8ac2 e8a9ff0800 call 0x145b38a70
145aa8ac7 90 nop
145aa8ac8 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8acc e8efcb0900 call 0x145b456c0
145aa8ad1 90 nop
145aa8ad2 c6451701 mov byte ptr [rbp + 0x17], 1
145aa8ad6 e805790300 call 0x145ae03e0
145aa8adb 90 nop
145aa8adc c6451701 mov byte ptr [rbp + 0x17], 1
145aa8ae0 e84bd20900 call 0x145b45d30
145aa8ae5 90 nop
145aa8ae6 488b4568 mov rax, qword ptr [rbp + 0x68]
145aa8aea 488b5560 mov rdx, qword ptr [rbp + 0x60]
145aa8aee 488b4a30 mov rcx, qword ptr [rdx + 0x30]
145aa8af2 48894de0 mov qword ptr [rbp - 0x20], rcx
145aa8af6 0f1002 movups xmm0, xmmword ptr [rdx]
145aa8af9 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
145aa8afd 0f105220 movups xmm2, xmmword ptr [rdx + 0x20]
145aa8b01 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
145aa8b05 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
145aa8b09 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
145aa8b0d c6451700 mov byte ptr [rbp + 0x17], 0
145aa8b11 4889442428 mov qword ptr [rsp + 0x28], rax
145aa8b16 488d45b0 lea rax, [rbp - 0x50]
145aa8b1a 4889442420 mov qword ptr [rsp + 0x20], rax
145aa8b1f 4889f9 mov rcx, rdi
145aa8b22 4889f2 mov rdx, rsi
145aa8b25 4c8b4500 mov r8, qword ptr [rbp]
145aa8b29 4c8b4df8 mov r9, qword ptr [rbp - 8]
145aa8b2d e85e560700 call 0x145b1e190
145aa8b32 90 nop
145aa8b33 488945f0 mov qword ptr [rbp - 0x10], rax
145aa8b37 f048ff00 lock inc qword ptr [rax]
145aa8b3b 7e1c jle 0x145aa8b59
145aa8b3d 48894508 mov qword ptr [rbp + 8], rax
145aa8b41 4889c1 mov rcx, rax
145aa8b44 e8175fffff call 0x145a9ea60
145aa8b49 90 nop
145aa8b4a 488b4508 mov rax, qword ptr [rbp + 8]
145aa8b4e 4881c4a0000000 add rsp, 0xa0
145aa8b55 5f pop rdi
145aa8b56 5e pop rsi
145aa8b57 5d pop rbp
145aa8b58 c3 ret
145aa8b59 0f0b ud2
