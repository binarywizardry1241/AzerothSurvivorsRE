140298d50 push r15
140298d52 push r14
140298d54 push r13
140298d56 push r12
140298d58 push rsi
140298d59 push rdi
140298d5a push rbp
140298d5b push rbx
140298d5c sub rsp, 0x668
140298d63 movaps xmmword ptr [rsp + 0x650], xmm15
140298d6c movaps xmmword ptr [rsp + 0x640], xmm14
140298d75 movaps xmmword ptr [rsp + 0x630], xmm13
140298d7e movaps xmmword ptr [rsp + 0x620], xmm12
140298d87 movaps xmmword ptr [rsp + 0x610], xmm11
140298d90 movaps xmmword ptr [rsp + 0x600], xmm10
140298d99 movaps xmmword ptr [rsp + 0x5f0], xmm9
140298da2 movaps xmmword ptr [rsp + 0x5e0], xmm8
140298dab movaps xmmword ptr [rsp + 0x5d0], xmm7
140298db3 movaps xmmword ptr [rsp + 0x5c0], xmm6
140298dbb mov r14, rdx
140298dbe mov rsi, rcx
140298dc1 mov rbp, qword ptr [rcx]
140298dc4 mov rax, qword ptr [rcx + 0x28]
140298dc8 mov qword ptr [rsp + 0x380], rbp
140298dd0 lea rbx, [rsp + 0x388]
140298dd8 movups xmm0, xmmword ptr [rcx + 8]
140298ddc movups xmmword ptr [rsp + 0x388], xmm0
140298de4 movups xmm0, xmmword ptr [rcx + 0x18]
140298de8 movups xmmword ptr [rsp + 0x398], xmm0
140298df0 mov qword ptr [rsp + 0x3a8], rax
140298df8 xorps xmm0, xmm0
140298dfb movaps xmmword ptr [rsp + 0x450], xmm0
140298e03 movaps xmmword ptr [rsp + 0x440], xmm0
140298e0b movaps xmmword ptr [rsp + 0x430], xmm0
140298e13 movaps xmmword ptr [rsp + 0x420], xmm0
140298e1b movaps xmmword ptr [rsp + 0x410], xmm0
140298e23 mov qword ptr [rsp + 0x460], 0
140298e2f mov word ptr [rsp + 0x234], 0
140298e39 mov dword ptr [rsp + 0x230], 0
140298e44 movups xmm15, xmmword ptr [rip + 0x5c64c3c]
140298e4c movups xmmword ptr [rsp + 0x468], xmm15
140298e55 movups xmm9, xmmword ptr [rip + 0x5c64c3b]
140298e5d movups xmmword ptr [rsp + 0x478], xmm9
140298e66 movups xmm10, xmmword ptr [rip + 0x5c64c3a]
140298e6e movups xmmword ptr [rsp + 0x488], xmm10
140298e77 movups xmm11, xmmword ptr [rip + 0x5c64c39]
140298e7f movups xmmword ptr [rsp + 0x498], xmm11
140298e88 movups xmm12, xmmword ptr [rip + 0x5c64c48]
140298e90 movups xmmword ptr [rsp + 0x4b8], xmm12
140298e99 movups xmm13, xmmword ptr [rip + 0x5c64c27]
140298ea1 movups xmmword ptr [rsp + 0x4a8], xmm13
140298eaa movups xmm0, xmmword ptr [rip + 0x5c64c47]
140298eb1 movups xmmword ptr [rsp + 0x4d8], xmm0
140298eb9 movups xmm0, xmmword ptr [rip + 0x5c64c28]
140298ec0 movups xmmword ptr [rsp + 0x4c8], xmm0
140298ec8 movups xmm0, xmmword ptr [rip + 0x5c64b01]
140298ecf movaps xmmword ptr [rsp + 0x3b0], xmm0
140298ed7 mov qword ptr [rsp + 0x3c0], 0
140298ee3 movups xmm0, xmmword ptr [rip + 0x5c64afe]
140298eea movups xmmword ptr [rsp + 0x3c8], xmm0
140298ef2 mov qword ptr [rsp + 0x3d8], 0
140298efe movups xmm0, xmmword ptr [rip + 0x5c64afb]
140298f05 movaps xmmword ptr [rsp + 0x3e0], xmm0
140298f0d mov qword ptr [rsp + 0x3f0], 0
140298f19 movups xmm0, xmmword ptr [rip + 0x5c64af8]
140298f20 movups xmmword ptr [rsp + 0x3f8], xmm0
140298f28 mov qword ptr [rsp + 0x408], 0
140298f34 lea rcx, [rsp + 0xb8]
140298f3c lea rdi, [rsp + 0x3b0]
140298f44 mov r8d, 0x138
140298f4a mov rdx, rdi
140298f4d call 0x145cf998b
140298f52 movaps xmm6, xmmword ptr [rip + 0x5c090d7]
140298f59 movups xmmword ptr [rsp + 0x1f0], xmm6
140298f61 mov dword ptr [rsp + 0x200], 1
140298f6c mov qword ptr [rsp + 0x204], 0
140298f78 mov byte ptr [rsp + 0x20c], 1
140298f80 movsd xmm0, qword ptr [rip + 0x5c327d8]
140298f88 movsd qword ptr [rsp + 0x210], xmm0
140298f91 mov dword ptr [rsp + 0x218], 0x3f800000
140298f9c mov word ptr [rsp + 0x21c], 0
140298fa6 mov dword ptr [rsp + 0x21e], 0x10000
140298fb1 mov word ptr [rsp + 0x222], 0
140298fbb mov dword ptr [rsp + 0x224], 0x10000
140298fc6 mov word ptr [rsp + 0x228], 0
140298fd0 mov dword ptr [rsp + 0x22a], 0
140298fdb mov word ptr [rsp + 0x22e], 1
140298fe5 mov qword ptr [rsp + 0xb0], rbp
140298fed lea rcx, [rsp + 0x2f8]
140298ff5 lea r8, [rsp + 0xb0]
140298ffd mov rdx, rbx
140299000 call 0x1402628b0
140299005 mov rcx, qword ptr [r14]
140299008 mov rbx, qword ptr [r14 + 8]
14029900c mov r12, qword ptr [r14 + 0x10]
140299010 mov r13, qword ptr [rsp + 0x2f8]
140299018 mov rax, qword ptr [rsp + 0x320]
140299020 mov qword ptr [rsp + 0x2c8], r13
140299028 movups xmm0, xmmword ptr [rsp + 0x300]
140299030 movups xmmword ptr [rsp + 0x2d0], xmm0
140299038 movups xmm0, xmmword ptr [rsp + 0x310]
140299040 movups xmmword ptr [rsp + 0x2e0], xmm0
140299048 mov qword ptr [rsp + 0x2f0], rax
140299050 lea r15, [rcx + 0x18]
140299054 mov qword ptr [rsp + 0x40], rcx
140299059 cmp byte ptr [rcx + 0xe9], 0
140299060 je 0x140299102
140299066 lea rcx, [rip + 0x5c664e2]
14029906d mov edx, 8
140299072 call 0x145895670
140299077 mov qword ptr [rsp + 0x3b0], rax
14029907f mov qword ptr [rsp + 0x3b8], rdx
140299087 mov qword ptr [rsp + 0xb0], r15
14029908f lea rax, [rip - 0x296fb6]
140299096 mov qword ptr [rsp + 0xb8], rax
14029909e mov qword ptr [rsp + 0xc0], rdi
1402990a6 lea rax, [rip - 0x296fed]
1402990ad mov qword ptr [rsp + 0xc8], rax
1402990b5 lea rdx, [rip + 0x5c64ea9]
1402990bc lea rcx, [rsp + 0x368]
1402990c4 lea r8, [rsp + 0xb0]
1402990cc call 0x145ccc6e0
1402990d1 mov rax, qword ptr [r12]
1402990d5 cmp byte ptr [rax + 0xe8], 0
1402990dc je 0x14029911f
1402990de movss xmm0, dword ptr [rip + 0x5c08f9e]
1402990e6 cmp byte ptr [rbx], 1
1402990e9 mov qword ptr [rsp + 0x70], r12
1402990ee je 0x140299131
1402990f0 mov rax, qword ptr [rbx + 8]
1402990f4 lock inc qword ptr [rax]
1402990f8 jle 0x14029a0be
1402990fe xor ecx, ecx
140299100 jmp 0x14029914f
140299102 lea rcx, [rsp + 0x368]
14029910a mov rdx, r15
14029910d call 0x145cccba0
140299112 mov rax, qword ptr [r12]
140299116 cmp byte ptr [rax + 0xe8], 0
14029911d jne 0x1402990de
14029911f movss xmm0, dword ptr [rip + 0x5c09449]
140299127 cmp byte ptr [rbx], 1
14029912a mov qword ptr [rsp + 0x70], r12
14029912f jne 0x1402990f0
140299131 mov eax, dword ptr [rbx + 1]
140299134 mov ecx, dword ptr [rbx + 4]
140299137 mov dword ptr [rsp + 0x3b3], ecx
14029913e mov dword ptr [rsp + 0x3b0], eax
140299145 mov rax, qword ptr [rbx + 8]
140299149 movzx edx, byte ptr [rbx + 0x10]
14029914d mov cl, 1
14029914f lea r15, [rsp + 0x2d0]
140299157 mov r8, qword ptr [rsp + 0x378]
14029915f mov qword ptr [rsp + 0xc8], r8
140299167 movups xmm1, xmmword ptr [rsp + 0x368]
14029916f movups xmmword ptr [rsp + 0xb8], xmm1
140299177 mov r8d, dword ptr [rsp + 0x3b0]
14029917f mov r9d, dword ptr [rsp + 0x3b3]
140299187 mov dword ptr [rsp + 0xe9], r8d
14029918f mov dword ptr [rsp + 0xec], r9d
140299197 movups xmm1, xmmword ptr [rip + 0x5c64a06]
14029919e movups xmmword ptr [rsp + 0x79], xmm1
1402991a3 mov qword ptr [rsp + 0xd0], 0
1402991af mov qword ptr [rsp + 0xd8], 4
1402991bb mov qword ptr [rsp + 0xe0], 0
1402991c7 mov byte ptr [rsp + 0xe8], cl
1402991ce mov qword ptr [rsp + 0xf0], rax
1402991d6 mov qword ptr [rsp + 0xf8], rdx
1402991de mov dword ptr [rsp + 0x100], 0x41880000
1402991e9 mov word ptr [rsp + 0x104], 0x190
1402991f3 mov byte ptr [rsp + 0x106], 1
1402991fb movzx eax, byte ptr [rsp + 0x88]
140299203 mov byte ptr [rsp + 0x117], al
14029920a movups xmm1, xmmword ptr [rsp + 0x78]
14029920f movups xmmword ptr [rsp + 0x107], xmm1
140299217 movss dword ptr [rsp + 0x118], xmm0
140299220 mov eax, dword ptr [rip + 0x5c366b2]
140299226 mov dword ptr [rsp + 0x12c], eax
14029922d movups xmm7, xmmword ptr [rip + 0x5c36694]
140299234 movups xmmword ptr [rsp + 0x11c], xmm7
14029923c movsd xmm8, qword ptr [rip + 0x5c08e8b]
140299245 movsd qword ptr [rsp + 0x130], xmm8
14029924f mov qword ptr [rsp + 0xb0], r13
140299257 lea rcx, [rsp + 0x3b0]
14029925f lea r8, [rsp + 0xb0]
140299267 mov rdx, r15
14029926a call 0x140278cc0
14029926f mov r12, qword ptr [rsp + 0x40]
140299274 cmp qword ptr [r12 + 0x40], 0
14029927a je 0x140299401
140299280 movaps xmm14, xmm6
140299284 lea rdx, [r12 + 0x30]
140299289 mov rax, qword ptr [rsp + 0x70]
14029928e mov rax, qword ptr [rax]
140299291 cmp byte ptr [rax + 0xe8], 0
140299298 jne 0x1402992c6
14029929a movss xmm6, dword ptr [rip + 0x5c092ce]
1402992a2 lea rcx, [rsp + 0x3b0]
1402992aa call 0x145cccba0
1402992af cmp byte ptr [rbx], 0
1402992b2 jne 0x1402992e0
1402992b4 mov rax, qword ptr [rbx + 8]
1402992b8 lock inc qword ptr [rax]
1402992bc jle 0x14029a0be
1402992c2 xor edx, edx
1402992c4 jmp 0x1402992f8
1402992c6 movss xmm6, dword ptr [rip + 0x5c08db6]
1402992ce lea rcx, [rsp + 0x3b0]
1402992d6 call 0x145cccba0
1402992db cmp byte ptr [rbx], 0
1402992de je 0x1402992b4
1402992e0 mov eax, dword ptr [rbx + 1]
1402992e3 mov ecx, dword ptr [rbx + 4]
1402992e6 mov dword ptr [rsp + 0x4b], ecx
1402992ea mov dword ptr [rsp + 0x48], eax
1402992ee mov rax, qword ptr [rbx + 8]
1402992f2 movzx ecx, byte ptr [rbx + 0x10]
1402992f6 mov dl, 1
1402992f8 mov r8, qword ptr [rsp + 0x3c0]
140299300 mov qword ptr [rsp + 0xc8], r8
140299308 movups xmm0, xmmword ptr [rsp + 0x3b0]
140299310 movups xmmword ptr [rsp + 0xb8], xmm0
140299318 movups xmm0, xmmword ptr [rip + 0x5c649d1]
14029931f movups xmmword ptr [rsp + 0x79], xmm0
140299324 mov qword ptr [rsp + 0xd0], 0
140299330 mov qword ptr [rsp + 0xd8], 4
14029933c mov qword ptr [rsp + 0xe0], 0
140299348 mov byte ptr [rsp + 0xe8], dl
14029934f mov edx, dword ptr [rsp + 0x48]
140299353 mov r8d, dword ptr [rsp + 0x4b]
140299358 mov dword ptr [rsp + 0xe9], edx
14029935f mov dword ptr [rsp + 0xec], r8d
140299367 mov qword ptr [rsp + 0xf0], rax
14029936f mov qword ptr [rsp + 0xf8], rcx
140299377 mov dword ptr [rsp + 0x100], 0x41500000
140299382 mov word ptr [rsp + 0x104], 0x190
14029938c mov byte ptr [rsp + 0x106], 1
140299394 movzx eax, byte ptr [rsp + 0x88]
14029939c mov byte ptr [rsp + 0x117], al
1402993a3 movups xmm0, xmmword ptr [rsp + 0x78]
1402993a8 movups xmmword ptr [rsp + 0x107], xmm0
1402993b0 movss dword ptr [rsp + 0x118], xmm6
1402993b9 mov eax, dword ptr [rip + 0x5c36519]
1402993bf mov dword ptr [rsp + 0x12c], eax
1402993c6 movups xmmword ptr [rsp + 0x11c], xmm7
1402993ce movsd qword ptr [rsp + 0x130], xmm8
1402993d8 mov qword ptr [rsp + 0xb0], r13
1402993e0 lea rcx, [rsp + 0x3b0]
1402993e8 lea r8, [rsp + 0xb0]
1402993f0 mov rdx, r15
1402993f3 call 0x140278cc0
1402993f8 mov r12, qword ptr [rsp + 0x40]
1402993fd movaps xmm6, xmm14
140299401 mov qword ptr [rsp + 0x38], rbx
140299406 mov qword ptr [rsp + 0xa8], rsi
14029940e lea rcx, [rip + 0x5c66142]
140299415 mov edx, 0x1c
14029941a call 0x145895670
14029941f mov r8, rdx
140299422 lea rcx, [r12 + 0x60]
140299427 lea rdx, [r12 + 0x78]
14029942c lea rdi, [r12 + 0x90]
140299434 lea r9, [rip + 0x5c64a78]
14029943b mov qword ptr [rsp + 0xb0], r9
140299443 mov qword ptr [rsp + 0xb8], 4
14029944f mov qword ptr [rsp + 0xc0], rcx
140299457 lea rbx, [rip + 0x5c64a82]
14029945e mov qword ptr [rsp + 0xc8], rbx
140299466 lea rcx, [rip + 0x5c64a4e]
14029946d mov qword ptr [rsp + 0xd0], rcx
140299475 mov qword ptr [rsp + 0xd8], 5
140299481 mov qword ptr [rsp + 0xe0], rdx
140299489 mov qword ptr [rsp + 0xe8], rbx
140299491 lea rsi, [rip + 0x5c64a68]
140299498 mov qword ptr [rsp + 0xf0], rsi
1402994a0 mov qword ptr [rsp + 0xf8], 4
1402994ac mov qword ptr [rsp + 0x100], rdi
1402994b4 mov qword ptr [rsp + 0x108], rbx
1402994bc mov qword ptr [rsp + 0x20], 3
1402994c5 lea rcx, [rsp + 0x338]
1402994cd lea r9, [rsp + 0xb0]
1402994d5 mov rdx, rax
1402994d8 call 0x145895ad0
1402994dd mov rax, qword ptr [r12 + 0xd0]
1402994e5 test rax, rax
1402994e8 je 0x14029954d
1402994ea mov rcx, qword ptr [rsp + 0x348]
1402994f2 mov qword ptr [rsp + 0xc0], rcx
1402994fa movups xmm0, xmmword ptr [rsp + 0x338]
140299502 movaps xmmword ptr [rsp + 0xb0], xmm0
14029950a mov r9, qword ptr [r12 + 0xc8]
140299512 mov qword ptr [rsp + 0x20], rax
140299517 mov dword ptr [rsp + 0x28], 0x41400000
14029951f lea rcx, [rsp + 0x2c8]
140299527 lea r8, [rsp + 0xb0]
14029952f mov rdx, qword ptr [rsp + 0x38]
140299534 call 0x140038a60
140299539 cmp byte ptr [r12 + 0xe8], 0
140299542 je 0x1402996c0
140299548 jmp 0x140299858
14029954d mov rax, qword ptr [rsp + 0x70]
140299552 mov rax, qword ptr [rax]
140299555 cmp byte ptr [rax + 0xe8], 0
14029955c jne 0x140299582
14029955e movss xmm0, dword ptr [rip + 0x5c0900a]
140299566 mov rdx, qword ptr [rsp + 0x38]
14029956b cmp byte ptr [rdx], 0
14029956e jne 0x140299594
140299570 mov rax, qword ptr [rdx + 8]
140299574 lock inc qword ptr [rax]
140299578 jle 0x14029a0be
14029957e xor edx, edx
140299580 jmp 0x1402995ac
140299582 movss xmm0, dword ptr [rip + 0x5c08afa]
14029958a mov rdx, qword ptr [rsp + 0x38]
14029958f cmp byte ptr [rdx], 0
140299592 je 0x140299570
140299594 mov eax, dword ptr [rdx + 1]
140299597 mov ecx, dword ptr [rdx + 4]
14029959a mov dword ptr [rsp + 0x53], ecx
14029959e mov dword ptr [rsp + 0x50], eax
1402995a2 mov rax, qword ptr [rdx + 8]
1402995a6 movzx ecx, byte ptr [rdx + 0x10]
1402995aa mov dl, 1
1402995ac mov r8, qword ptr [rsp + 0x348]
1402995b4 mov qword ptr [rsp + 0xc8], r8
1402995bc movups xmm1, xmmword ptr [rsp + 0x338]
1402995c4 movups xmmword ptr [rsp + 0xb8], xmm1
1402995cc movups xmm1, xmmword ptr [rip + 0x5c643b9]
1402995d3 movups xmmword ptr [rsp + 0x79], xmm1
1402995d8 mov qword ptr [rsp + 0xd0], 0
1402995e4 mov qword ptr [rsp + 0xd8], 4
1402995f0 mov qword ptr [rsp + 0xe0], 0
1402995fc mov byte ptr [rsp + 0xe8], dl
140299603 mov edx, dword ptr [rsp + 0x50]
140299607 mov r8d, dword ptr [rsp + 0x53]
14029960c mov dword ptr [rsp + 0xe9], edx
140299613 mov dword ptr [rsp + 0xec], r8d
14029961b mov qword ptr [rsp + 0xf0], rax
140299623 mov qword ptr [rsp + 0xf8], rcx
14029962b mov dword ptr [rsp + 0x100], 0x41400000
140299636 mov word ptr [rsp + 0x104], 0x190
140299640 mov byte ptr [rsp + 0x106], 1
140299648 movzx eax, byte ptr [rsp + 0x88]
140299650 mov byte ptr [rsp + 0x117], al
140299657 movups xmm1, xmmword ptr [rsp + 0x78]
14029965c movups xmmword ptr [rsp + 0x107], xmm1
140299664 movss dword ptr [rsp + 0x118], xmm0
14029966d movups xmmword ptr [rsp + 0x11c], xmm7
140299675 mov eax, dword ptr [rip + 0x5c3625d]
14029967b mov dword ptr [rsp + 0x12c], eax
140299682 movsd qword ptr [rsp + 0x130], xmm8
14029968c mov qword ptr [rsp + 0xb0], r13
140299694 lea rcx, [rsp + 0x3b0]
14029969c lea r8, [rsp + 0xb0]
1402996a4 mov rdx, r15
1402996a7 call 0x140278cc0
1402996ac mov r12, qword ptr [rsp + 0x40]
1402996b1 cmp byte ptr [r12 + 0xe8], 0
1402996ba jne 0x140299858
1402996c0 lea rcx, [rip + 0x5c65eac]
1402996c7 mov edx, 0x30
1402996cc call 0x145895670
1402996d1 mov r8, rdx
1402996d4 mov qword ptr [rsp + 0x78], rsi
1402996d9 mov qword ptr [rsp + 0x80], 4
1402996e5 mov qword ptr [rsp + 0x88], rdi
1402996ed mov qword ptr [rsp + 0x90], rbx
1402996f5 mov qword ptr [rsp + 0x20], 1
1402996fe lea rcx, [rsp + 0x3b0]
140299706 lea r9, [rsp + 0x78]
14029970b mov rdx, rax
14029970e call 0x145895ad0
140299713 mov rdx, qword ptr [rsp + 0x38]
140299718 cmp byte ptr [rdx], 1
14029971b jne 0x140299737
14029971d mov eax, dword ptr [rdx + 1]
140299720 mov ecx, dword ptr [rdx + 4]
140299723 mov dword ptr [rsp + 0x5b], ecx
140299727 mov dword ptr [rsp + 0x58], eax
14029972b mov rax, qword ptr [rdx + 8]
14029972f movzx ecx, byte ptr [rdx + 0x10]
140299733 mov dl, 1
140299735 jmp 0x140299747
140299737 mov rax, qword ptr [rdx + 8]
14029973b lock inc qword ptr [rax]
14029973f jle 0x14029a0be
140299745 xor edx, edx
140299747 mov r8, qword ptr [rsp + 0x3c0]
14029974f mov qword ptr [rsp + 0xc8], r8
140299757 movups xmm0, xmmword ptr [rsp + 0x3b0]
14029975f movups xmmword ptr [rsp + 0xb8], xmm0
140299767 movups xmm0, xmmword ptr [rip + 0x5c6423a]
14029976e movups xmmword ptr [rsp + 0x354], xmm0
140299776 mov dword ptr [rsp + 0x364], 0x3f800000
140299781 mov r8, qword ptr [rsp + 0x2c8]
140299789 mov qword ptr [rsp + 0xd0], 0
140299795 mov qword ptr [rsp + 0xd8], 4
1402997a1 mov qword ptr [rsp + 0xe0], 0
1402997ad mov byte ptr [rsp + 0xe8], dl
1402997b4 mov edx, dword ptr [rsp + 0x58]
1402997b8 mov r9d, dword ptr [rsp + 0x5b]
1402997bd mov dword ptr [rsp + 0xe9], edx
1402997c4 mov dword ptr [rsp + 0xec], r9d
1402997cc mov qword ptr [rsp + 0xf0], rax
1402997d4 mov qword ptr [rsp + 0xf8], rcx
1402997dc mov dword ptr [rsp + 0x100], 0x41400000
1402997e7 mov word ptr [rsp + 0x104], 0x190
1402997f1 mov byte ptr [rsp + 0x106], 1
1402997f9 mov rax, qword ptr [rsp + 0x360]
140299801 mov qword ptr [rsp + 0x114], rax
140299809 movups xmm0, xmmword ptr [rsp + 0x353]
140299811 movups xmmword ptr [rsp + 0x107], xmm0
140299819 mov eax, dword ptr [rip + 0x5c360b9]
14029981f mov dword ptr [rsp + 0x12c], eax
140299826 movups xmmword ptr [rsp + 0x11c], xmm7
14029982e movsd qword ptr [rsp + 0x130], xmm8
140299838 mov qword ptr [rsp + 0xb0], r8
140299840 lea rcx, [rsp + 0x3b0]
140299848 lea r8, [rsp + 0xb0]
140299850 mov rdx, r15
140299853 call 0x140278cc0
140299858 xorps xmm14, xmm14
14029985c movaps xmmword ptr [rsp + 0x450], xmm14
140299865 movaps xmmword ptr [rsp + 0x440], xmm14
14029986e movaps xmmword ptr [rsp + 0x430], xmm14
140299877 movaps xmmword ptr [rsp + 0x420], xmm14
140299880 movaps xmmword ptr [rsp + 0x410], xmm14
140299889 mov qword ptr [rsp + 0x460], 0
140299895 movups xmmword ptr [rsp + 0x468], xmm15
14029989e movups xmmword ptr [rsp + 0x478], xmm9
1402998a7 movups xmmword ptr [rsp + 0x488], xmm10
1402998b0 movups xmmword ptr [rsp + 0x498], xmm11
1402998b9 movups xmmword ptr [rsp + 0x4a8], xmm13
1402998c2 movups xmmword ptr [rsp + 0x4b8], xmm12
1402998cb movups xmm0, xmmword ptr [rip + 0x5c64226]
1402998d2 movups xmmword ptr [rsp + 0x4d8], xmm0
1402998da movups xmm0, xmmword ptr [rip + 0x5c64207]
1402998e1 movups xmmword ptr [rsp + 0x4c8], xmm0
1402998e9 movups xmm0, xmmword ptr [rip + 0x5c640e0]
1402998f0 movaps xmmword ptr [rsp + 0x3b0], xmm0
1402998f8 mov qword ptr [rsp + 0x3c0], 0
140299904 movups xmm0, xmmword ptr [rip + 0x5c640dd]
14029990b movups xmmword ptr [rsp + 0x3c8], xmm0
140299913 mov qword ptr [rsp + 0x3d8], 0
14029991f movups xmm0, xmmword ptr [rip + 0x5c640da]
140299926 movaps xmmword ptr [rsp + 0x3e0], xmm0
14029992e mov qword ptr [rsp + 0x3f0], 0
14029993a movups xmm0, xmmword ptr [rip + 0x5c640d7]
140299941 movups xmmword ptr [rsp + 0x3f8], xmm0
140299949 mov qword ptr [rsp + 0x408], 0
140299955 lea rcx, [rsp + 0xb8]
14029995d lea rdx, [rsp + 0x3b0]
140299965 mov r8d, 0x138
14029996b call 0x145cf998b
140299970 movups xmmword ptr [rsp + 0x1f0], xmm6
140299978 mov dword ptr [rsp + 0x200], 1
140299983 movss xmm0, dword ptr [rip + 0x5c08c35]
14029998b movlps qword ptr [rsp + 0x204], xmm0
140299993 mov byte ptr [rsp + 0x20c], 1
14029999b mov qword ptr [rsp + 0x210], 0
1402999a7 mov dword ptr [rsp + 0x218], 0x3f800000
1402999b2 mov word ptr [rsp + 0x21c], 0
1402999bc mov dword ptr [rsp + 0x21e], 0x10000
1402999c7 mov word ptr [rsp + 0x222], 0
1402999d1 mov dword ptr [rsp + 0x224], 0x10000
1402999dc mov word ptr [rsp + 0x228], 0
1402999e6 mov qword ptr [rsp + 0x22a], 0
1402999f2 mov dword ptr [rsp + 0x232], 5
1402999fd mov qword ptr [rsp + 0x328], rbp
140299a05 mov qword ptr [rsp + 0xb0], rbp
140299a0d lea rcx, [rsp + 0x78]
140299a12 lea r8, [rsp + 0xb0]
140299a1a lea rdx, [rsp + 0x388]
140299a22 call 0x1402628b0
140299a27 mov rax, qword ptr [r14 + 0x18]
140299a2b mov qword ptr [rsp + 0x330], rax
140299a33 mov r14, qword ptr [r12 + 0x50]
140299a38 mov rsi, qword ptr [r12 + 0x58]
140299a3d mov r15, qword ptr [rsp + 0x78]
140299a42 mov rax, qword ptr [rsp + 0xa0]
140299a4a mov qword ptr [rsp + 0x2f8], r15
140299a52 movups xmm0, xmmword ptr [rsp + 0x80]
140299a5a movups xmmword ptr [rsp + 0x300], xmm0
140299a62 movups xmm0, xmmword ptr [rsp + 0x90]
140299a6a movups xmmword ptr [rsp + 0x310], xmm0
140299a72 mov qword ptr [rsp + 0x320], rax
140299a7a test rsi, rsi
140299a7d je 0x140299d13
140299a83 lea r12, [rsp + 0xc8]
140299a8b lea rdi, [rsp + 0x438]
140299a93 xor ebx, ebx
140299a95 lea r13, [rsp + 0xb0]
140299a9d lea rbp, [rsp + 0x3b0]
140299aa5 movups xmm15, xmmword ptr [rip + 0x5c2cdbb]
140299aad movups xmm13, xmmword ptr [rip + 0x5c2cda3]
140299ab5 movups xmm7, xmmword ptr [rip + 0x5c2cdcc]
140299abc movups xmm8, xmmword ptr [rip + 0x5c2cdb4]
140299ac4 movups xmm9, xmmword ptr [rip + 0x5c2cddc]
140299acc movups xmm10, xmmword ptr [rip + 0x5c2cdc4]
140299ad4 movups xmm11, xmmword ptr [rip + 0x5c2cdec]
140299adc movups xmm12, xmmword ptr [rip + 0x5c2cdd4]
140299ae4 nop word ptr cs:[rax + rax]
140299af0 movzx ecx, byte ptr [r14 + rbx]
140299af5 call 0x145808f40
140299afa mov r8, qword ptr [rax + 0x60]
140299afe mov r9, qword ptr [rax + 0x68]
140299b02 mov rcx, r13
140299b05 mov rdx, qword ptr [rsp + 0x330]
140299b0d call 0x1400de550
140299b12 mov rcx, rbp
140299b15 mov rdx, r13
140299b18 call 0x142674550
140299b1d mov rax, qword ptr [rip + 0x5c2cc8c]
140299b24 mov qword ptr [rsp + 0xc0], rax
140299b2c movups xmm0, xmmword ptr [rip + 0x5c2cc6d]
140299b33 movaps xmmword ptr [rsp + 0xb0], xmm0
140299b3b mov rax, qword ptr [rip + 0x5c2cc86]
140299b42 mov qword ptr [r12 + 0x10], rax
140299b47 movups xmm0, xmmword ptr [rip + 0x5c2cc6a]
140299b4e movups xmmword ptr [r12], xmm0
140299b53 mov rax, qword ptr [rip + 0x5c2cc86]
140299b5a mov qword ptr [r12 + 0x28], rax
140299b5f movups xmm0, xmmword ptr [rip + 0x5c2cc6a]
140299b66 movups xmmword ptr [r12 + 0x18], xmm0
140299b6c mov rax, qword ptr [rip + 0x5c2cc85]
140299b73 mov qword ptr [r12 + 0x40], rax
140299b78 movups xmm0, xmmword ptr [rip + 0x5c2cc69]
140299b7f movups xmmword ptr [r12 + 0x30], xmm0
140299b85 movaps xmm0, xmmword ptr [rsp + 0x100]
140299b8d movups xmmword ptr [rdi + 0x50], xmm0
140299b91 movaps xmm0, xmmword ptr [rsp + 0xf0]
140299b99 movups xmmword ptr [rdi + 0x40], xmm0
140299b9d movaps xmm0, xmmword ptr [rsp + 0xe0]
140299ba5 movups xmmword ptr [rdi + 0x30], xmm0
140299ba9 movaps xmm0, xmmword ptr [rsp + 0xd0]
140299bb1 movups xmmword ptr [rdi + 0x20], xmm0
140299bb5 movaps xmm0, xmmword ptr [rsp + 0xb0]
140299bbd movups xmmword ptr [rdi], xmm0
140299bc0 mov rax, qword ptr [rsp + 0xc0]
140299bc8 mov qword ptr [rdi + 0x10], rax
140299bcc mov rax, qword ptr [rsp + 0xc8]
140299bd4 mov qword ptr [rdi + 0x18], rax
140299bd8 movups xmmword ptr [rdi + 0x70], xmm14
140299bdd movups xmmword ptr [rdi + 0x60], xmm14
140299be2 mov qword ptr [rdi + 0x80], 0
140299bed movaps xmm0, xmmword ptr [rip + 0x5c4c57c]
140299bf4 movups xmmword ptr [rsp + 0x4c0], xmm0
140299bfc movups xmmword ptr [rdi + 0xa8], xmm14
140299c04 movups xmmword ptr [rdi + 0x98], xmm14
140299c0c movups xmmword ptr [rdi + 0xc8], xmm15
140299c14 movups xmmword ptr [rdi + 0xb8], xmm13
140299c1c movups xmmword ptr [rdi + 0xe8], xmm7
140299c23 movups xmmword ptr [rdi + 0xd8], xmm8
140299c2b movups xmmword ptr [rdi + 0x108], xmm9
140299c33 movups xmmword ptr [rdi + 0xf8], xmm10
140299c3b movups xmmword ptr [rdi + 0x128], xmm11
140299c43 movups xmmword ptr [rdi + 0x118], xmm12
140299c4b movups xmmword ptr [rsp + 0x570], xmm6
140299c53 mov dword ptr [rsp + 0x580], 1
140299c5e mov qword ptr [rsp + 0x584], 0
140299c6a mov byte ptr [rsp + 0x58c], 1
140299c72 mov qword ptr [rdi + 0x158], 0
140299c7d mov qword ptr [rdi + 0x15e], 0
140299c88 movzx eax, word ptr [rip + 0x5c2cc7b]
140299c8f mov word ptr [rdi + 0x16a], ax
140299c96 mov eax, dword ptr [rip + 0x5c2cc6a]
140299c9c mov dword ptr [rdi + 0x166], eax
140299ca2 mov eax, dword ptr [rip + 0x5c2cc64]
140299ca8 mov dword ptr [rdi + 0x16c], eax
140299cae movzx eax, word ptr [rip + 0x5c2cc5b]
140299cb5 mov word ptr [rdi + 0x170], ax
140299cbc mov qword ptr [rdi + 0x172], 0
140299cc7 mov dword ptr [rdi + 0x17a], 0
140299cd1 mov r8d, 0x208
140299cd7 lea rcx, [rsp + 0xb8]
140299cdf mov rdx, rbp
140299ce2 call 0x145cf998b
140299ce7 mov qword ptr [rsp + 0xb0], r15
140299cef lea rcx, [rsp + 0x2c8]
140299cf7 lea rdx, [rsp + 0x300]
140299cff mov r8, r13
140299d02 call 0x140278f50
140299d07 inc rbx
140299d0a cmp rsi, rbx
140299d0d jne 0x140299af0
140299d13 mov rsi, qword ptr [rsp + 0x40]
140299d18 cmp qword ptr [rsi + 0xb8], 0
140299d20 lea rdi, [rsp + 0x388]
140299d28 mov r14, qword ptr [rsp + 0x328]
140299d30 mov rbx, qword ptr [rsp + 0x70]
140299d35 movups xmm6, xmmword ptr [rip + 0x5c35b8c]
140299d3c movsd xmm7, qword ptr [rip + 0x5c0838c]
140299d44 je 0x140299e9a
140299d4a lea rdx, [rsi + 0xa8]
140299d51 lea rcx, [rsp + 0x3b0]
140299d59 call 0x145cccba0
140299d5e mov rdx, qword ptr [rsp + 0x38]
140299d63 cmp byte ptr [rdx], 1
140299d66 jne 0x140299d82
140299d68 mov eax, dword ptr [rdx + 1]
140299d6b mov ecx, dword ptr [rdx + 4]
140299d6e mov dword ptr [rsp + 0x63], ecx
140299d72 mov dword ptr [rsp + 0x60], eax
140299d76 mov rax, qword ptr [rdx + 8]
140299d7a movzx ecx, byte ptr [rdx + 0x10]
140299d7e mov dl, 1
140299d80 jmp 0x140299d92
140299d82 mov rax, qword ptr [rdx + 8]
140299d86 lock inc qword ptr [rax]
140299d8a jle 0x14029a0be
140299d90 xor edx, edx
140299d92 mov r8, qword ptr [rsp + 0x3c0]
140299d9a mov qword ptr [rsp + 0xc8], r8
140299da2 movups xmm0, xmmword ptr [rsp + 0x3b0]
140299daa movups xmmword ptr [rsp + 0xb8], xmm0
140299db2 movups xmm0, xmmword ptr [rip + 0x5c63bd3]
140299db9 movups xmmword ptr [rsp + 0x2c9], xmm0
140299dc1 mov dword ptr [rsp + 0x2d9], 0x3f800000
140299dcc mov qword ptr [rsp + 0xd0], 0
140299dd8 mov qword ptr [rsp + 0xd8], 4
140299de4 mov qword ptr [rsp + 0xe0], 0
140299df0 mov byte ptr [rsp + 0xe8], dl
140299df7 mov edx, dword ptr [rsp + 0x60]
140299dfb mov r8d, dword ptr [rsp + 0x63]
140299e00 mov dword ptr [rsp + 0xe9], edx
140299e07 mov dword ptr [rsp + 0xec], r8d
140299e0f mov qword ptr [rsp + 0xf0], rax
140299e17 mov qword ptr [rsp + 0xf8], rcx
140299e1f mov dword ptr [rsp + 0x100], 0x41500000
140299e2a mov word ptr [rsp + 0x104], 0x190
140299e34 mov byte ptr [rsp + 0x106], 1
140299e3c mov rax, qword ptr [rsp + 0x2d5]
140299e44 mov qword ptr [rsp + 0x114], rax
140299e4c movups xmm0, xmmword ptr [rsp + 0x2c8]
140299e54 movups xmmword ptr [rsp + 0x107], xmm0
140299e5c mov eax, dword ptr [rip + 0x5c35a76]
140299e62 mov dword ptr [rsp + 0x12c], eax
140299e69 movups xmmword ptr [rsp + 0x11c], xmm6
140299e71 movsd qword ptr [rsp + 0x130], xmm7
140299e7a mov qword ptr [rsp + 0xb0], r14
140299e82 lea rcx, [rsp + 0x3b0]
140299e8a lea r8, [rsp + 0xb0]
140299e92 mov rdx, rdi
140299e95 call 0x140278cc0
140299e9a mov rax, qword ptr [rbx]
140299e9d movzx ebx, byte ptr [rax + 0xe8]
140299ea4 lea rax, [rsi + 0xd8]
140299eab add rsi, 0xe0
140299eb2 mov qword ptr [rsp + 0xb0], rax
140299eba lea rax, [rip + 0x5a451bf]
140299ec1 mov qword ptr [rsp + 0xb8], rax
140299ec9 mov qword ptr [rsp + 0xc0], rsi
140299ed1 mov qword ptr [rsp + 0xc8], rax
140299ed9 lea rdx, [rip + 0x5c670b8]
140299ee0 lea rcx, [rsp + 0x2c8]
140299ee8 lea r8, [rsp + 0xb0]
140299ef0 call 0x145ccc6e0
140299ef5 mov rdx, qword ptr [rsp + 0x38]
140299efa cmp byte ptr [rdx + 0x18], 1
140299efe jne 0x140299f26
140299f00 mov eax, dword ptr [rdx + 0x19]
140299f03 mov ecx, dword ptr [rdx + 0x1c]
140299f06 mov dword ptr [rsp + 0x6b], ecx
140299f0a mov dword ptr [rsp + 0x68], eax
140299f0e mov rax, qword ptr [rdx + 0x20]
140299f12 movzx ecx, byte ptr [rdx + 0x28]
140299f16 mov dl, 1
140299f18 test bl, bl
140299f1a jne 0x140299f3a
140299f1c movss xmm0, dword ptr [rip + 0x5c0864c]
140299f24 jmp 0x140299f42
140299f26 mov rax, qword ptr [rdx + 0x20]
140299f2a lock inc qword ptr [rax]
140299f2e jle 0x14029a0be
140299f34 xor edx, edx
140299f36 test bl, bl
140299f38 je 0x140299f1c
140299f3a movss xmm0, dword ptr [rip + 0x5c08142]
140299f42 mov rsi, qword ptr [rsp + 0xa8]
140299f4a mov r8, qword ptr [rsp + 0x2d8]
140299f52 mov qword ptr [rsp + 0xc8], r8
140299f5a movups xmm1, xmmword ptr [rsp + 0x2c8]
140299f62 movups xmmword ptr [rsp + 0xb8], xmm1
140299f6a movups xmm1, xmmword ptr [rip + 0x5c639d7]
140299f71 movups xmmword ptr [rsp + 0x2f9], xmm1
140299f79 mov qword ptr [rsp + 0xd0], 0
140299f85 mov qword ptr [rsp + 0xd8], 4
140299f91 mov qword ptr [rsp + 0xe0], 0
140299f9d mov byte ptr [rsp + 0xe8], dl
140299fa4 mov edx, dword ptr [rsp + 0x68]
140299fa8 mov r8d, dword ptr [rsp + 0x6b]
140299fad mov dword ptr [rsp + 0xe9], edx
140299fb4 mov dword ptr [rsp + 0xec], r8d
140299fbc mov qword ptr [rsp + 0xf0], rax
140299fc4 mov qword ptr [rsp + 0xf8], rcx
140299fcc mov dword ptr [rsp + 0x100], 0x41a00000
140299fd7 mov word ptr [rsp + 0x104], 0x190
140299fe1 mov byte ptr [rsp + 0x106], 1
140299fe9 movzx eax, byte ptr [rsp + 0x308]
140299ff1 mov byte ptr [rsp + 0x117], al
140299ff8 movups xmm1, xmmword ptr [rsp + 0x2f8]
14029a000 movups xmmword ptr [rsp + 0x107], xmm1
14029a008 movss dword ptr [rsp + 0x118], xmm0
14029a011 movups xmmword ptr [rsp + 0x11c], xmm6
14029a019 mov eax, dword ptr [rip + 0x5c358b9]
14029a01f mov dword ptr [rsp + 0x12c], eax
14029a026 movsd qword ptr [rsp + 0x130], xmm7
14029a02f mov qword ptr [rsp + 0xb0], r14
14029a037 lea rcx, [rsp + 0x3b0]
14029a03f lea r8, [rsp + 0xb0]
14029a047 mov rdx, rdi
14029a04a call 0x140278cc0
14029a04f mov rax, rsi
14029a052 movaps xmm6, xmmword ptr [rsp + 0x5c0]
14029a05a movaps xmm7, xmmword ptr [rsp + 0x5d0]
14029a062 movaps xmm8, xmmword ptr [rsp + 0x5e0]
14029a06b movaps xmm9, xmmword ptr [rsp + 0x5f0]
14029a074 movaps xmm10, xmmword ptr [rsp + 0x600]
14029a07d movaps xmm11, xmmword ptr [rsp + 0x610]
14029a086 movaps xmm12, xmmword ptr [rsp + 0x620]
14029a08f movaps xmm13, xmmword ptr [rsp + 0x630]
14029a098 movaps xmm14, xmmword ptr [rsp + 0x640]
14029a0a1 movaps xmm15, xmmword ptr [rsp + 0x650]
14029a0aa add rsp, 0x668
14029a0b1 pop rbx
14029a0b2 pop rbp
14029a0b3 pop rdi
14029a0b4 pop rsi
14029a0b5 pop r12
14029a0b7 pop r13
14029a0b9 pop r14
14029a0bb pop r15
14029a0bd ret
14029a0be ud2
