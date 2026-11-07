1458c8a40 55 push rbp
1458c8a41 4157 push r15
1458c8a43 4156 push r14
1458c8a45 4154 push r12
1458c8a47 56 push rsi
1458c8a48 57 push rdi
1458c8a49 53 push rbx
1458c8a4a 4881ec80000000 sub rsp, 0x80
1458c8a51 488dac2480000000 lea rbp, [rsp + 0x80]
1458c8a59 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458c8a61 4c89cf mov rdi, r9
1458c8a64 4c89c3 mov rbx, r8
1458c8a67 4989d6 mov r14, rdx
1458c8a6a 4889ce mov rsi, rcx
1458c8a6d e88e9773fa call 0x140002200
1458c8a72 b920000000 mov ecx, 0x20
1458c8a77 ba01000000 mov edx, 1
1458c8a7c e83f9773fa call 0x1400021c0
1458c8a81 4885c0 test rax, rax
1458c8a84 0f84f3020000 je 0x1458c8d7d
1458c8a8a c6005a mov byte ptr [rax], 0x5a
1458c8a8d c7400100000000 mov dword ptr [rax + 1], 0
1458c8a94 48c745b020000000 mov qword ptr [rbp - 0x50], 0x20
1458c8a9c 488945b8 mov qword ptr [rbp - 0x48], rax
1458c8aa0 48c745c005000000 mov qword ptr [rbp - 0x40], 5
1458c8aa8 66c745c89600 mov word ptr [rbp - 0x38], 0x96
1458c8aae b805000000 mov eax, 5
1458c8ab3 b101 mov cl, 1
1458c8ab5 84c9 test cl, cl
1458c8ab7 0f84eb010000 je 0x1458c8ca8
1458c8abd 8d4b01 lea ecx, [rbx + 1]
1458c8ac0 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1458c8ac4 890c02 mov dword ptr [rdx + rax], ecx
1458c8ac7 4883c004 add rax, 4
1458c8acb 488945c0 mov qword ptr [rbp - 0x40], rax
1458c8acf 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c8ad3 488945d0 mov qword ptr [rbp - 0x30], rax
1458c8ad7 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c8adb 488945d8 mov qword ptr [rbp - 0x28], rax
1458c8adf 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c8ae3 488945e0 mov qword ptr [rbp - 0x20], rax
1458c8ae7 0fb745c8 movzx eax, word ptr [rbp - 0x38]
1458c8aeb 668945e8 mov word ptr [rbp - 0x18], ax
1458c8aef 8b45ca mov eax, dword ptr [rbp - 0x36]
1458c8af2 8945ea mov dword ptr [rbp - 0x16], eax
1458c8af5 0fb745ce movzx eax, word ptr [rbp - 0x32]
1458c8af9 668945ee mov word ptr [rbp - 0x12], ax
1458c8afd 4c8b7de0 mov r15, qword ptr [rbp - 0x20]
1458c8b01 4c8b65d0 mov r12, qword ptr [rbp - 0x30]
1458c8b05 4c89e0 mov rax, r12
1458c8b08 4c29f8 sub rax, r15
1458c8b0b 4839c3 cmp rbx, rax
1458c8b0e 0f87c1010000 ja 0x1458c8cd5
1458c8b14 4885db test rbx, rbx
1458c8b17 7412 je 0x1458c8b2b
1458c8b19 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458c8b1d 4c01f9 add rcx, r15
1458c8b20 4c89f2 mov rdx, r14
1458c8b23 4989d8 mov r8, rbx
1458c8b26 e8600e4300 call 0x145cf998b
1458c8b2b 4901df add r15, rbx
1458c8b2e 4c897de0 mov qword ptr [rbp - 0x20], r15
1458c8b32 4d39e7 cmp r15, r12
1458c8b35 750a jne 0x1458c8b41
1458c8b37 488d4dd0 lea rcx, [rbp - 0x30]
1458c8b3b e840315d00 call 0x145e9bc80
1458c8b40 90 nop
1458c8b41 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c8b45 42c6043800 mov byte ptr [rax + r15], 0
1458c8b4a 49ffc7 inc r15
1458c8b4d 4c897de0 mov qword ptr [rbp - 0x20], r15
1458c8b51 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c8b55 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c8b59 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c8b5d 488945c0 mov qword ptr [rbp - 0x40], rax
1458c8b61 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c8b65 488945c8 mov qword ptr [rbp - 0x38], rax
1458c8b69 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c8b6d 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c8b71 4829d0 sub rax, rdx
1458c8b74 4883f807 cmp rax, 7
1458c8b78 0f8683010000 jbe 0x1458c8d01
1458c8b7e 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c8b82 48c7041000000000 mov qword ptr [rax + rdx], 0
1458c8b8a 4883c208 add rdx, 8
1458c8b8e 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c8b92 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c8b96 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c8b9a 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c8b9e 488945e0 mov qword ptr [rbp - 0x20], rax
1458c8ba2 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c8ba6 488945e8 mov qword ptr [rbp - 0x18], rax
1458c8baa 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c8bae 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c8bb2 4829d0 sub rax, rdx
1458c8bb5 4883f803 cmp rax, 3
1458c8bb9 0f866a010000 jbe 0x1458c8d29
1458c8bbf 488b5d60 mov rbx, qword ptr [rbp + 0x60]
1458c8bc3 8d4301 lea eax, [rbx + 1]
1458c8bc6 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458c8bca 890411 mov dword ptr [rcx + rdx], eax
1458c8bcd 4883c204 add rdx, 4
1458c8bd1 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c8bd5 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c8bd9 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c8bdd 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c8be1 488945c0 mov qword ptr [rbp - 0x40], rax
1458c8be5 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c8be9 488945c8 mov qword ptr [rbp - 0x38], rax
1458c8bed 4c8b75c0 mov r14, qword ptr [rbp - 0x40]
1458c8bf1 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
1458c8bf5 4c89f8 mov rax, r15
1458c8bf8 4c29f0 sub rax, r14
1458c8bfb 4839c3 cmp rbx, rax
1458c8bfe 0f874d010000 ja 0x1458c8d51
1458c8c04 4885db test rbx, rbx
1458c8c07 7412 je 0x1458c8c1b
1458c8c09 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1458c8c0d 4c01f1 add rcx, r14
1458c8c10 4889fa mov rdx, rdi
1458c8c13 4989d8 mov r8, rbx
1458c8c16 e8700d4300 call 0x145cf998b
1458c8c1b 4901de add r14, rbx
1458c8c1e 4c8975c0 mov qword ptr [rbp - 0x40], r14
1458c8c22 4d39fe cmp r14, r15
1458c8c25 750a jne 0x1458c8c31
1458c8c27 488d4db0 lea rcx, [rbp - 0x50]
1458c8c2b e850305d00 call 0x145e9bc80
1458c8c30 90 nop
1458c8c31 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c8c35 42c6043000 mov byte ptr [rax + r14], 0
1458c8c3a 49ffc6 inc r14
1458c8c3d 4c8975c0 mov qword ptr [rbp - 0x40], r14
1458c8c41 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c8c45 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c8c49 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c8c4d 488945e0 mov qword ptr [rbp - 0x20], rax
1458c8c51 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c8c55 488945e8 mov qword ptr [rbp - 0x18], rax
1458c8c59 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1458c8c5d 483b7dd0 cmp rdi, qword ptr [rbp - 0x30]
1458c8c61 750a jne 0x1458c8c6d
1458c8c63 488d4dd0 lea rcx, [rbp - 0x30]
1458c8c67 e814305d00 call 0x145e9bc80
1458c8c6c 90 nop
1458c8c6d 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c8c71 c6043800 mov byte ptr [rax + rdi], 0
1458c8c75 48ffc7 inc rdi
1458c8c78 48897de0 mov qword ptr [rbp - 0x20], rdi
1458c8c7c 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c8c80 0f1106 movups xmmword ptr [rsi], xmm0
1458c8c83 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c8c87 48894610 mov qword ptr [rsi + 0x10], rax
1458c8c8b 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c8c8f 48894618 mov qword ptr [rsi + 0x18], rax
1458c8c93 4889f0 mov rax, rsi
1458c8c96 4881c480000000 add rsp, 0x80
1458c8c9d 5b pop rbx
1458c8c9e 5f pop rdi
1458c8c9f 5e pop rsi
1458c8ca0 415c pop r12
1458c8ca2 415e pop r14
1458c8ca4 415f pop r15
1458c8ca6 5d pop rbp
1458c8ca7 c3 ret
1458c8ca8 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c8cb1 488d4db0 lea rcx, [rbp - 0x50]
1458c8cb5 ba05000000 mov edx, 5
1458c8cba 41b804000000 mov r8d, 4
1458c8cc0 41b901000000 mov r9d, 1
1458c8cc6 e8d5104300 call 0x145cf9da0
1458c8ccb 90 nop
1458c8ccc 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c8cd0 e9e8fdffff jmp 0x1458c8abd
1458c8cd5 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c8cde 488d4dd0 lea rcx, [rbp - 0x30]
1458c8ce2 41b901000000 mov r9d, 1
1458c8ce8 4c89fa mov rdx, r15
1458c8ceb 4989d8 mov r8, rbx
1458c8cee e8ad104300 call 0x145cf9da0
1458c8cf3 90 nop
1458c8cf4 4c8b65d0 mov r12, qword ptr [rbp - 0x30]
1458c8cf8 4c8b7de0 mov r15, qword ptr [rbp - 0x20]
1458c8cfc e918feffff jmp 0x1458c8b19
1458c8d01 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c8d0a 488d4db0 lea rcx, [rbp - 0x50]
1458c8d0e 41b808000000 mov r8d, 8
1458c8d14 41b901000000 mov r9d, 1
1458c8d1a e881104300 call 0x145cf9da0
1458c8d1f 90 nop
1458c8d20 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c8d24 e955feffff jmp 0x1458c8b7e
1458c8d29 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c8d32 488d4dd0 lea rcx, [rbp - 0x30]
1458c8d36 41b804000000 mov r8d, 4
1458c8d3c 41b901000000 mov r9d, 1
1458c8d42 e859104300 call 0x145cf9da0
1458c8d47 90 nop
1458c8d48 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c8d4c e96efeffff jmp 0x1458c8bbf
1458c8d51 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c8d5a 488d4db0 lea rcx, [rbp - 0x50]
1458c8d5e 41b901000000 mov r9d, 1
1458c8d64 4c89f2 mov rdx, r14
1458c8d67 4989d8 mov r8, rbx
1458c8d6a e831104300 call 0x145cf9da0
1458c8d6f 90 nop
1458c8d70 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
1458c8d74 4c8b75c0 mov r14, qword ptr [rbp - 0x40]
1458c8d78 e98cfeffff jmp 0x1458c8c09
1458c8d7d b901000000 mov ecx, 1
1458c8d82 ba20000000 mov edx, 0x20
1458c8d87 e8ff2f5d00 call 0x145e9bd8b
1458c8d8c 0f0b ud2
