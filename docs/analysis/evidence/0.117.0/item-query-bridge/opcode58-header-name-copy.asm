145b66370 push rbp
145b66371 push r15
145b66373 push r14
145b66375 push r13
145b66377 push r12
145b66379 push rsi
145b6637a push rdi
145b6637b push rbx
145b6637c sub rsp, 0x168
145b66383 lea rbp, [rsp + 0x80]
145b6638b mov qword ptr [rbp + 0xe0], 0xfffffffffffffffe
145b66396 mov rdi, rdx
145b66399 mov r12, rcx
145b6639c call 0x140002200
145b663a1 mov ecx, 0x20
145b663a6 mov edx, 1
145b663ab call 0x1400021c0
145b663b0 test rax, rax
145b663b3 je 0x145b690bf
145b663b9 mov rcx, qword ptr [rdi + 0x30]
145b663bd mov qword ptr [rax], rcx
145b663c0 mov qword ptr [rbp + 0xb0], 0x20
145b663cb mov qword ptr [rbp + 0xb8], rax
145b663d2 mov qword ptr [rbp + 0xc0], 8
145b663dd mov word ptr [rbp + 0xc8], 0x58
145b663e6 mov esi, dword ptr [rdi + 0x38]
145b663e9 mov eax, 8
145b663ee mov cl, 1
145b663f0 test cl, cl
145b663f2 je 0x145b682a9
145b663f8 mov rcx, qword ptr [rbp + 0xb8]
145b663ff mov dword ptr [rcx + rax], esi
145b66402 add rax, 4
145b66406 mov qword ptr [rbp + 0xc0], rax
145b6640d mov rax, qword ptr [rbp + 0xb0]
145b66414 mov qword ptr [rbp + 0x90], rax
145b6641b mov rax, qword ptr [rbp + 0xb8]
145b66422 mov qword ptr [rbp + 0x98], rax
145b66429 mov rax, qword ptr [rbp + 0xc0]
145b66430 mov qword ptr [rbp + 0xa0], rax
145b66437 movzx eax, word ptr [rbp + 0xc8]
145b6643e mov word ptr [rbp + 0xa8], ax
145b66445 mov eax, dword ptr [rbp + 0xca]
145b6644b mov dword ptr [rbp + 0xaa], eax
145b66451 movzx eax, word ptr [rbp + 0xce]
145b66458 mov word ptr [rbp + 0xae], ax
145b6645f mov r15, qword ptr [rdi]
145b66462 mov r14, qword ptr [rdi + 8]
145b66466 mov rbx, qword ptr [rbp + 0xa0]
145b6646d mov rsi, qword ptr [rbp + 0x90]
145b66474 mov rax, rsi
145b66477 sub rax, rbx
145b6647a cmp r14, rax
145b6647d ja 0x145b682dc
145b66483 test r14, r14
145b66486 je 0x145b6649d
145b66488 mov rcx, qword ptr [rbp + 0x98]
145b6648f add rcx, rbx
145b66492 mov rdx, r15
145b66495 mov r8, r14
145b66498 call 0x145f93cdb
