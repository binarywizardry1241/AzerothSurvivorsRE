1401de7c0 55 push rbp
1401de7c1 4157 push r15
1401de7c3 4156 push r14
1401de7c5 4155 push r13
1401de7c7 4154 push r12
1401de7c9 56 push rsi
1401de7ca 57 push rdi
1401de7cb 53 push rbx
1401de7cc 4881ec18020000 sub rsp, 0x218
1401de7d3 488dac2480000000 lea rbp, [rsp + 0x80]
1401de7db 48c78590010000feffffff mov qword ptr [rbp + 0x190], 0xfffffffffffffffe
1401de7e6 4c898580010000 mov qword ptr [rbp + 0x180], r8
1401de7ed 4889d3 mov rbx, rdx
1401de7f0 4889ce mov rsi, rcx
1401de7f3 488b7a08 mov rdi, qword ptr [rdx + 8]
1401de7f7 c6858f01000001 mov byte ptr [rbp + 0x18f], 1
1401de7fe 4889f9 mov rcx, rdi
1401de801 e80a01c404 call 0x144e1e910
1401de806 90 nop
1401de807 4989c6 mov r14, rax
1401de80a 4c8b7b10 mov r15, qword ptr [rbx + 0x10]
1401de80e 4c8b6318 mov r12, qword ptr [rbx + 0x18]
1401de812 4d85ff test r15, r15
1401de815 4889bd70010000 mov qword ptr [rbp + 0x170], rdi
1401de81c 747e je 0x1401de89c
1401de81e 4c89a578010000 mov qword ptr [rbp + 0x178], r12
1401de825 488d4db0 lea rcx, [rbp - 0x50]
1401de829 41b8b8010000 mov r8d, 0x1b8
1401de82f 4c8ba580010000 mov r12, qword ptr [rbp + 0x180]
1401de836 4c89e2 mov rdx, r12
1401de839 e8a9b8a105 call 0x145bfa0e7
1401de83e 4c89b568010000 mov qword ptr [rbp + 0x168], r14
1401de845 498b07 mov rax, qword ptr [r15]
1401de848 4d8b6f10 mov r13, qword ptr [r15 + 0x10]
1401de84c 4c29e8 sub rax, r13
1401de84f 483dc7010000 cmp rax, 0x1c7
1401de855 0f86f0000000 jbe 0x1401de94b
1401de85b 498b7f08 mov rdi, qword ptr [r15 + 8]
1401de85f 488d054aa10900 lea rax, [rip + 0x9a14a]
1401de866 4a89042f mov qword ptr [rdi + r13], rax
1401de86a 4a8d0c2f lea rcx, [rdi + r13]
1401de86e 4883c108 add rcx, 8
1401de872 41b8b8010000 mov r8d, 0x1b8
1401de878 4c89e2 mov rdx, r12
1401de87b e867b8a105 call 0x145bfa0e7
1401de880 4e89b42fc0010000 mov qword ptr [rdi + r13 + 0x1c0], r14
1401de888 4981c5c8010000 add r13, 0x1c8
1401de88f 4d896f10 mov qword ptr [r15 + 0x10], r13
1401de893 4c8ba578010000 mov r12, qword ptr [rbp + 0x178]
1401de89a eb73 jmp 0x1401de90f
1401de89c 488d4db0 lea rcx, [rbp - 0x50]
1401de8a0 41b8b8010000 mov r8d, 0x1b8
1401de8a6 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1401de8ad e835b8a105 call 0x145bfa0e7
1401de8b2 4c89b568010000 mov qword ptr [rbp + 0x168], r14
1401de8b9 498b0424 mov rax, qword ptr [r12]
1401de8bd 4d8b6c2410 mov r13, qword ptr [r12 + 0x10]
1401de8c2 4c29e8 sub rax, r13
1401de8c5 483dc7010000 cmp rax, 0x1c7
1401de8cb 0f86a0000000 jbe 0x1401de971
1401de8d1 498b7c2408 mov rdi, qword ptr [r12 + 8]
1401de8d6 488d05d3a00900 lea rax, [rip + 0x9a0d3]
1401de8dd 4a89042f mov qword ptr [rdi + r13], rax
1401de8e1 4a8d0c2f lea rcx, [rdi + r13]
1401de8e5 4883c108 add rcx, 8
1401de8e9 41b8b8010000 mov r8d, 0x1b8
1401de8ef 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1401de8f6 e8ecb7a105 call 0x145bfa0e7
1401de8fb 4e89b42fc0010000 mov qword ptr [rdi + r13 + 0x1c0], r14
1401de903 4981c5c8010000 add r13, 0x1c8
1401de90a 4d896c2410 mov qword ptr [r12 + 0x10], r13
1401de90f 488b03 mov rax, qword ptr [rbx]
1401de912 488b4b20 mov rcx, qword ptr [rbx + 0x20]
1401de916 4c8936 mov qword ptr [rsi], r14
1401de919 48894608 mov qword ptr [rsi + 8], rax
1401de91d 488b8570010000 mov rax, qword ptr [rbp + 0x170]
1401de924 48894610 mov qword ptr [rsi + 0x10], rax
1401de928 4c897e18 mov qword ptr [rsi + 0x18], r15
1401de92c 4c896620 mov qword ptr [rsi + 0x20], r12
1401de930 48894e28 mov qword ptr [rsi + 0x28], rcx
1401de934 4889f0 mov rax, rsi
1401de937 4881c418020000 add rsp, 0x218
1401de93e 5b pop rbx
1401de93f 5f pop rdi
1401de940 5e pop rsi
1401de941 415c pop r12
1401de943 415d pop r13
1401de945 415e pop r14
1401de947 415f pop r15
1401de949 5d pop rbp
1401de94a c3 ret
1401de94b 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1401de954 41b8c8010000 mov r8d, 0x1c8
1401de95a 41b901000000 mov r9d, 1
1401de960 4c89f9 mov rcx, r15
1401de963 4c89ea mov rdx, r13
1401de966 e805c0a105 call 0x145bfa970
1401de96b 90 nop
1401de96c e9eafeffff jmp 0x1401de85b
1401de971 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1401de97a 41b8c8010000 mov r8d, 0x1c8
1401de980 41b901000000 mov r9d, 1
1401de986 4c89e1 mov rcx, r12
1401de989 4c89ea mov rdx, r13
1401de98c e8dfbfa105 call 0x145bfa970
1401de991 90 nop
1401de992 e93affffff jmp 0x1401de8d1
