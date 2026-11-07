14009e3c0 push rbp
14009e3c1 push rsi
14009e3c2 push rdi
14009e3c3 sub rsp, 0xc0
14009e3ca lea rbp, [rsp + 0x80]
14009e3d2 mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
14009e3da mov rax, rcx
14009e3dd movups xmm0, xmmword ptr [rdx + 0x40]
14009e3e1 movaps xmmword ptr [rbp + 0x10], xmm0
14009e3e5 movups xmm0, xmmword ptr [rdx]
14009e3e8 movups xmm1, xmmword ptr [rdx + 0x10]
14009e3ec movups xmm2, xmmword ptr [rdx + 0x20]
14009e3f0 movups xmm3, xmmword ptr [rdx + 0x30]
14009e3f4 movaps xmmword ptr [rbp], xmm3
14009e3f8 movaps xmmword ptr [rbp - 0x10], xmm2
14009e3fc movaps xmmword ptr [rbp - 0x20], xmm1
14009e400 movaps xmmword ptr [rbp - 0x30], xmm0
14009e404 cmp byte ptr [rbp + 0x18], 0
14009e408 jne 0x14009e519
14009e40e cmp byte ptr [rbp + 0x11], 0
14009e412 jne 0x14009e519
14009e418 mov rsi, rax
14009e41b lea rdx, [rbp - 0x20]
14009e41f mov rdi, qword ptr [rbp - 0x20]
14009e423 lea rcx, [rbp + 0x20]
14009e427 call 0x1400bb580
14009e42c cmp dword ptr [rbp + 0x20], 1
14009e430 jne 0x14009e46b
14009e432 mov rcx, qword ptr [rbp + 0x30]
14009e436 mov rax, qword ptr [rbp - 0x30]
14009e43a mov qword ptr [rbp - 0x30], rcx
14009e43e sub rcx, rax
14009e441 add rdi, rax
14009e444 mov rax, rsi
14009e447 test rcx, rcx
14009e44a je 0x14009e49e
14009e44c cmp byte ptr [rdi + rcx - 1], 0xa
14009e451 mov rdx, rcx
14009e454 jne 0x14009e4a1
14009e456 mov rdx, rcx
14009e459 dec rdx
14009e45c je 0x14009e4a1
14009e45e cmp byte ptr [rdi + rcx - 2], 0xd
14009e463 jne 0x14009e4a1
14009e465 add rcx, -2
14009e469 jmp 0x14009e49e
14009e46b cmp byte ptr [rbp + 0x11], 0
14009e46f jne 0x14009e516
14009e475 mov byte ptr [rbp + 0x11], 1
14009e479 mov rdi, qword ptr [rbp - 0x30]
14009e47d mov rcx, qword ptr [rbp - 0x28]
14009e481 sub rcx, rdi
14009e484 setne al
14009e487 or al, byte ptr [rbp + 0x10]
14009e48a test al, 1
14009e48c je 0x14009e516
14009e492 add rdi, qword ptr [rbp - 0x20]
14009e496 mov rax, rsi
14009e499 test rcx, rcx
14009e49c jne 0x14009e44c
14009e49e mov rdx, rcx
14009e4a1 test rdx, rdx
14009e4a4 je 0x14009e519
14009e4a6 cmp byte ptr [rdi], 0x23
14009e4a9 jne 0x14009e519
14009e4ab mov qword ptr [rbp - 0x40], rdi
14009e4af mov qword ptr [rbp - 0x38], rdx
14009e4b3 lea rax, [rbp - 0x40]
14009e4b7 mov qword ptr [rbp + 0x20], rax
14009e4bb lea rax, [rip - 0x9c402]
14009e4c2 mov qword ptr [rbp + 0x28], rax
14009e4c6 lea rdx, [rip + 0x5e2e165]
14009e4cd lea rcx, [rbp - 0x58]
14009e4d1 lea r8, [rbp + 0x20]
14009e4d5 call 0x145ccc6e0
14009e4da mov rax, rsi
14009e4dd cmp qword ptr [rbp - 0x58], -1
14009e4e2 je 0x14009e519
14009e4e4 mov rax, qword ptr [rbp - 0x48]
14009e4e8 mov qword ptr [rbp + 0x30], rax
14009e4ec movups xmm0, xmmword ptr [rbp - 0x58]
14009e4f0 movaps xmmword ptr [rbp + 0x20], xmm0
14009e4f4 lea rcx, [rbp - 0x30]
14009e4f8 lea rdx, [rbp + 0x20]
14009e4fc call 0x14010ab60
14009e501 nop
14009e502 mov rcx, qword ptr [rbp + 0x30]
14009e506 mov rax, rsi
14009e509 mov qword ptr [rsi + 0x10], rcx
14009e50d movaps xmm0, xmmword ptr [rbp + 0x20]
14009e511 movups xmmword ptr [rsi], xmm0
14009e514 jmp 0x14009e530
14009e516 mov rax, rsi
14009e519 mov qword ptr [rax], 0
14009e520 mov qword ptr [rax + 8], 1
14009e528 mov qword ptr [rax + 0x10], 0
14009e530 add rsp, 0xc0
14009e537 pop rdi
14009e538 pop rsi
14009e539 pop rbp
14009e53a ret
