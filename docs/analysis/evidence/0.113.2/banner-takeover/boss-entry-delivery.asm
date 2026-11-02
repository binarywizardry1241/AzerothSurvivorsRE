14593d35c 4c8d3d4dfb9c01 lea r15, [rip + 0x19cfb4d]
14593d363 bf1a000000 mov edi, 0x1a
14593d368 ba1a000000 mov edx, 0x1a
14593d36d 4c89f9 mov rcx, r15
14593d370 e8ab83f5ff call 0x145895720
14593d375 4885c0 test rax, rax
14593d378 4c0f45f8 cmovne r15, rax
14593d37c 480f44d7 cmove rdx, rdi
14593d380 4889542420 mov qword ptr [rsp + 0x20], rdx
14593d385 488d4dc8 lea rcx, [rbp - 0x38]
14593d389 4889da mov rdx, rbx
14593d38c 4d89e0 mov r8, r12
14593d38f 4d89f9 mov r9, r15
14593d392 e8a9b6f8ff call 0x1458c8a40
