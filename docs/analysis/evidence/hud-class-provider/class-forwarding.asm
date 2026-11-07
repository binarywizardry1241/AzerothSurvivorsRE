# argument-six-load
14028e715 488b85b8040000 mov rax, qword ptr [rbp + 0x4b8]
14028e71c 0f114d28 movups xmmword ptr [rbp + 0x28], xmm1
14028e720 0f114518 movups xmmword ptr [rbp + 0x18], xmm0
14028e724 0f1000 movups xmm0, xmmword ptr [rax]
14028e727 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
14028e72b 488b85c0040000 mov rax, qword ptr [rbp + 0x4c0]
14028e732 0f114d48 movups xmmword ptr [rbp + 0x48], xmm1
14028e736 0f114538 movups xmmword ptr [rbp + 0x38], xmm0
# pick-pointer
14028e81a 488b4538 mov rax, qword ptr [rbp + 0x38]
# class-byte
14028ea00 0fb64038 movzx eax, byte ptr [rax + 0x38]
14028ea04 8885a0030000 mov byte ptr [rbp + 0x3a0], al
# closure-class
14028ec59 488d85a0030000 lea rax, [rbp + 0x3a0]
14028ec60 48898570010000 mov qword ptr [rbp + 0x170], rax
14028ec67 488d9560010000 lea rdx, [rbp + 0x160]
14028ec6e 4889f1 mov rcx, rsi
14028ec71 e85ae0f7ff call 0x14020ccd0
# constructor-argument
14020cd44 4989d6 mov r14, rdx
# constructor-retain
14020d15e 4c89b520010000 mov qword ptr [rbp + 0x120], r14
# constructor-class-pointer
14020e9ff 488b8520010000 mov rax, qword ptr [rbp + 0x120]
14020ea06 488b5808 mov rbx, qword ptr [rax + 8]
14020ea0a 4c8b7810 mov r15, qword ptr [rax + 0x10]
# constructor-class-call
14020efc3 410fb60f movzx ecx, byte ptr [r15]
14020efc7 e8c4e76705 call 0x14588d790
