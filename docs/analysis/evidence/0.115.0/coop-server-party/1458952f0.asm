1458952f0 push rbp
1458952f1 push r15
1458952f3 push r14
1458952f5 push r13
1458952f7 push r12
1458952f9 push rsi
1458952fa push rdi
1458952fb push rbx
1458952fc sub rsp, 0x678
145895303 lea rbp, [rsp + 0x80]
14589530b movaps xmmword ptr [rbp + 0x5e0], xmm6
145895312 mov qword ptr [rbp + 0x5d8], 0xfffffffffffffffe
14589531d movdqa xmm6, xmm3
145895321 mov rdi, rdx
145895324 mov rsi, rcx
145895327 mov qword ptr [rbp + 0x580], rdx
14589532e mov rax, qword ptr [rcx + 0xc58]
145895335 cmp rax, 3
145895339 mov qword ptr [rbp + 0x5c8], r8
145895340 jne 0x145895532
145895346 mov rdx, qword ptr [rsi + 0xc98]
14589534d cmp rdi, rdx
145895350 jae 0x145895c5e
145895356 mov r12, qword ptr [r8]
145895359 movabs rdx, 0x8000000000000000
145895363 xor rdx, r12
145895366 test r12, r12
145895369 mov ecx, 3
14589536e cmovs rcx, rdx
145895372 test rcx, rcx
145895375 je 0x145895561
14589537b cmp rcx, 0x12
14589537f je 0x14589561b
145895385 mov rax, qword ptr [rsi + 0xc90]
14589538c imul r14, rdi, 0x478
145895393 cmp byte ptr [rax + r14 + 0x470], 0
14589539c je 0x145895a16
1458953a2 add rcx, -3
1458953a6 cmp rcx, 0xc
1458953aa ja 0x145895a16
1458953b0 add rax, r14
1458953b3 lea rdx, [rip + 0x179a9ba]
1458953ba movsxd rcx, dword ptr [rdx + rcx*4]
1458953be add rcx, rdx
1458953c1 jmp rcx
1458953c3 lea rbx, [rbp + 0x190]
1458953ca mov rdx, r8
1458953cd mov r8d, 0x1e8
1458953d3 mov rcx, rbx
1458953d6 call 0x145d145fb
1458953db mov byte ptr [rbp + 0x5d7], 0
1458953e2 mov byte ptr [rbp + 0x5d6], 1
1458953e9 mov byte ptr [rbp + 0x5d5], 1
1458953f0 mov byte ptr [rbp + 0x5d4], 1
1458953f7 lea rcx, [rbp + 0x380]
1458953fe mov rdx, rbx
145895401 call 0x14584b690
145895406 nop
145895407 cmp qword ptr [rbp + 0x380], -1
14589540f je 0x145895a96
145895415 lea rcx, [rbp - 0x58]
145895419 lea rdx, [rbp + 0x380]
145895420 mov r8d, 0x1e8
145895426 call 0x145d145fb
14589542b mov rdx, qword ptr [rbp + 0x128]
145895432 mov rcx, rsi
145895435 mov r8, rdi
145895438 call 0x145891b70
14589543d mov ebx, eax
14589543f mov r15b, 1
145895442 cmp dword ptr [rsi + 0x10], 2
145895446 je 0x14589545b
145895448 movzx eax, byte ptr [rsi + 0xc51]
14589544f cmp byte ptr [rsi + rax + 0xc56], 0
145895457 sete r15b
14589545b mov rcx, qword ptr [rsi + 0x1188]
145895462 mov rdx, qword ptr [rsi + 0x1190]
145895469 call 0x1458095e0
14589546e cmp dword ptr [rsi + 0xc58], 3
145895475 jne 0x145895c49
14589547b mov byte ptr [rbp + 0x5c0], bl
145895481 mov rdx, qword ptr [rsi + 0xc98]
145895488 cmp rdi, rdx
14589548b jae 0x145895c9c
145895491 mov rbx, qword ptr [rsi + 0xc90]
145895498 mov rcx, qword ptr [rbx + r14 + 0x278]
1458954a0 cmp rcx, -1
1458954a4 jne 0x1458954e1
1458954a6 imul rax, rax, 0xf0
1458954ad lea r13, [rip + 0x142b854]
1458954b4 add r13, rax
1458954b7 mov qword ptr [rbp + 0x5b8], rcx
1458954be mov rcx, qword ptr [r13 + 8]
1458954c2 mov rdx, qword ptr [r13 + 0x10]
1458954c6 call 0x1458095e0
1458954cb movzx ecx, byte ptr [rbp + 0x18b]
1458954d2 cmp eax, ecx
1458954d4 mov rcx, qword ptr [rbp + 0x5b8]
1458954db jae 0x145895bfe
1458954e1 cmp byte ptr [rbp + 0x5c0], 0
1458954e8 jne 0x145895b14
1458954ee lea rax, [rbx + r14]
1458954f2 cmp qword ptr [rax], 0
1458954f6 sete al
1458954f9 test r15b, al
1458954fc je 0x145895b14
145895502 lea rsi, [rbx + r14]
145895506 add rsi, 0x278
14589550d cmp rcx, -1
145895511 je 0x14589551b
145895513 mov rcx, rsi
145895516 call 0x1458132e0
14589551b lea rdx, [rbp - 0x58]
14589551f mov r8d, 0x1e8
145895525 mov rcx, rsi
145895528 call 0x145d145fb
14589552d jmp 0x145895a7b
145895532 mov r12, qword ptr [r8]
145895535 movabs rdx, 0x8000000000000000
14589553f xor rdx, r12
145895542 test r12, r12
145895545 mov ecx, 3
14589554a cmovs rcx, rdx
14589554e cmp rcx, 0x12
145895552 je 0x14589561b
145895558 test rcx, rcx
14589555b jne 0x145895a16
145895561 mov rdx, qword ptr [rbp + 0x5c8]
145895568 mov rcx, qword ptr [rdx + 8]
14589556c mov r10, qword ptr [rdx + 0x10]
145895570 mov r8, qword ptr [rdx + 0x20]
145895574 mov r15, qword ptr [rdx + 0x28]
145895578 cmp eax, 3
14589557b mov qword ptr [rbp + 0x5c0], rcx
145895582 mov qword ptr [rbp + 0x5b0], r10
145895589 mov qword ptr [rbp + 0x5b8], r8
145895590 mov qword ptr [rbp + 0x5a8], r15
145895597 jne 0x14589582a
14589559d cmp dword ptr [rdx + 0x38], 4
1458955a1 lea r14, [rip + 0x1797fef]
1458955a8 mov ebx, 0x1f
1458955ad jne 0x145895836
1458955b3 cmp qword ptr [rdx + 0x18], 7
1458955b8 jne 0x145895836
1458955be mov eax, 0x31312e30
1458955c3 xor eax, dword ptr [r10]
1458955c6 mov ecx, 0x302e3531
1458955cb xor ecx, dword ptr [r10 + 3]
1458955cf or ecx, eax
1458955d1 jne 0x145895836
1458955d7 mov rcx, qword ptr [rsi + 0xc80]
1458955de test rcx, rcx
1458955e1 je 0x145895ccd
1458955e7 mov rax, qword ptr [rdx + 0x30]
1458955eb lea r14, [rip + 0x1797f72]
1458955f2 mov ebx, 0xe
1458955f7 cmp rax, rcx
1458955fa jne 0x145895836
145895600 mov rcx, qword ptr [rsi + 0xc78]
145895607 cmp rax, 4
14589560b jae 0x145895aa2
145895611 xor r8d, r8d
145895614 xor edx, edx
145895616 jmp 0x145895cb0
14589561b mov rax, qword ptr [r8 + 8]
14589561f mov qword ptr [rbp + 0x590], rax
145895626 mov rdx, qword ptr [r8 + 0x10]
14589562a mov r8, qword ptr [r8 + 0x18]
14589562e lea rcx, [rbp + 0x380]
145895635 mov qword ptr [rbp + 0x588], rdx
14589563c call 0x145821360
145895641 nop
145895642 mov rdx, qword ptr [rbp + 0x380]
145895649 xor eax, eax
14589564b cmp rdx, -1
14589564f mov rcx, qword ptr [rbp + 0x390]
145895656 cmove rcx, rax
14589565a cmove rdx, rax
14589565e mov eax, 8
145895663 cmovne rax, qword ptr [rbp + 0x388]
14589566b imul r15, rcx, 0x1e8
145895672 add r15, rax
145895675 mov qword ptr [rbp + 0x190], rax
14589567c mov qword ptr [rbp + 0x198], rax
145895683 mov qword ptr [rbp + 0x598], rdx
14589568a mov qword ptr [rbp + 0x1a0], rdx
145895691 mov qword ptr [rbp + 0x1a8], r15
145895698 mov qword ptr [rbp + 0x5a8], rax
14589569f mov rdx, rax
1458956a2 test rcx, rcx
1458956a5 je 0x14589573c
1458956ab lea rbx, [rbp + 0x388]
1458956b2 mov rax, qword ptr [rbp + 0x5a8]
1458956b9 add rax, 0x1e8
1458956bf lea r14, [rbp + 0x380]
1458956c6 nop word ptr cs:[rax + rax]
1458956d0 mov rdx, rax
1458956d3 mov rax, qword ptr [rax - 0x1e8]
1458956da cmp rax, -1
1458956de je 0x145895735
1458956e0 lea r13, [rdx - 0x1e8]
1458956e7 mov qword ptr [rbp + 0x380], rax
1458956ee mov qword ptr [rbp + 0x5b0], rdx
1458956f5 lea rdx, [r13 + 8]
1458956f9 mov r8d, 0x1e0
1458956ff mov rcx, rbx
145895702 call 0x145d145fb
145895707 nop
145895708 mov rcx, rsi
14589570b mov rdx, rdi
14589570e mov r8, r14
145895711 movdqa xmm3, xmm6
145895715 call 0x1458952f0
14589571a nop
14589571b mov rdx, qword ptr [rbp + 0x5b0]
145895722 lea rax, [rdx + 0x1e8]
145895729 add r13, 0x1e8
145895730 cmp r13, r15
145895733 jne 0x1458956d0
145895735 mov qword ptr [rbp + 0x198], rdx
14589573c sub r15, rdx
14589573f shr r15, 3
145895743 movabs rax, 0x4fbcda3ac10c9715
14589574d imul rax, r15
145895751 mov qword ptr [rbp + 0x5b8], rax
145895758 mov qword ptr [rbp + 0x5c0], 0
145895763 mov qword ptr [rbp + 0x5b0], rdx
14589576a mov rcx, rdx
14589576d nop dword ptr [rax]
145895770 mov rax, qword ptr [rbp + 0x5c0]
145895777 cmp qword ptr [rbp + 0x5b8], rax
14589577e je 0x14589579c
145895780 inc rax
145895783 mov qword ptr [rbp + 0x5c0], rax
14589578a lea rsi, [rcx + 0x1e8]
145895791 call 0x1458e3e00
145895796 nop
145895797 mov rcx, rsi
14589579a jmp 0x145895770
14589579c mov rax, qword ptr [rbp + 0x598]
1458957a3 test rax, rax
1458957a6 je 0x1458957c1
1458957a8 imul rdx, rax, 0x1e8
1458957af mov r8d, 8
1458957b5 mov rcx, qword ptr [rbp + 0x5a8]
1458957bc call 0x1400021d0
1458957c1 mov rdi, qword ptr [rbp + 0x590]
1458957c8 test rdi, rdi
1458957cb mov rsi, qword ptr [rbp + 0x5c8]
1458957d2 je 0x1458957e9
1458957d4 mov r8d, 1
1458957da mov rcx, qword ptr [rbp + 0x588]
1458957e1 mov rdx, rdi
1458957e4 call 0x1400021d0
1458957e9 movabs rcx, 0x8000000000000000
1458957f3 xor rcx, r12
1458957f6 test r12, r12
1458957f9 mov eax, 3
1458957fe cmovs rax, rcx
145895802 cmp rax, 0x12
145895806 ja 0x145895a56
14589580c lea rcx, [rip + 0x179a515]
145895813 movsxd rax, dword ptr [rcx + rax*4]
145895817 add rax, rcx
14589581a jmp rax
14589581c test rdi, rdi
14589581f jne 0x145895a69
145895825 jmp 0x145895a7b
14589582a lea r14, [rip + 0x1797d85]
145895831 mov ebx, 0xb
145895836 call 0x140002200
14589583b mov edx, 1
145895840 mov rcx, rbx
145895843 call 0x1400021c0
145895848 test rax, rax
14589584b je 0x145895c8c
145895851 mov r15, rax
145895854 mov rcx, rax
145895857 mov rdx, r14
14589585a mov r8, rbx
14589585d call 0x145d145fb
145895862 mov qword ptr [rbp + 0x380], rbx
145895869 mov qword ptr [rbp + 0x388], r15
145895870 mov qword ptr [rbp + 0x390], rbx
145895877 lea r8, [rbp + 0x380]
14589587e mov rcx, rsi
145895881 mov rdx, rdi
145895884 movdqa xmm3, xmm6
145895888 call 0x145894d00
14589588d nop
14589588e mov rdx, qword ptr [rbp + 0x5b8]
145895895 test rdx, rdx
145895898 mov rsi, qword ptr [rbp + 0x5c8]
14589589f je 0x1458958b3
1458958a1 mov r8d, 1
1458958a7 mov rcx, qword ptr [rbp + 0x5a8]
1458958ae call 0x1400021d0
1458958b3 mov rdx, qword ptr [rbp + 0x5c0]
1458958ba test rdx, rdx
1458958bd je 0x1458958d1
1458958bf mov r8d, 1
1458958c5 mov rcx, qword ptr [rbp + 0x5b0]
1458958cc call 0x1400021d0
1458958d1 movabs rcx, 0x8000000000000000
1458958db xor rcx, r12
1458958de test r12, r12
1458958e1 mov eax, 3
1458958e6 cmovs rax, rcx
1458958ea cmp rax, 0x12
1458958ee ja 0x145895a56
1458958f4 mov ecx, 0x40049
1458958f9 bt rcx, rax
1458958fd jb 0x145895a7b
145895903 jmp 0x145895a56
145895908 movzx ecx, word ptr [r8 + 0x20]
14589590d mov word ptr [rbp + 0x5a6], cx
145895914 mov rcx, qword ptr [r8 + 0x18]
145895918 mov qword ptr [rbp + 0x1a0], rcx
14589591f movdqu xmm0, xmmword ptr [r8 + 8]
145895925 movdqa xmmword ptr [rbp + 0x190], xmm0
14589592d cmp byte ptr [rax + 0x471], 1
145895934 jne 0x145895af2
14589593a lea rcx, [rbp + 0x380]
145895941 mov rdx, rsi
145895944 mov r8, rdi
145895947 call 0x14586e3c0
14589594c nop
14589594d mov rdx, qword ptr [rbp + 0x390]
145895954 cmp byte ptr [rbp + 0x380], 0
14589595b je 0x145895ab2
145895961 mov rcx, qword ptr [rbp + 0x388]
145895968 jmp 0x145895ab4
14589596d cmp qword ptr [rax], 0
145895971 je 0x145895a16
145895977 cmp byte ptr [rax + 0x471], 0
14589597e jne 0x145895a16
145895984 mov byte ptr [rbp + 0x5d7], 1
14589598b mov byte ptr [rbp + 0x5d6], 1
145895992 mov byte ptr [rbp + 0x5d5], 1
145895999 mov byte ptr [rbp + 0x5d4], 1
1458959a0 mov rcx, rsi
1458959a3 mov rdx, rdi
1458959a6 call 0x145892220
1458959ab nop
1458959ac jmp 0x145895a16
1458959ae mov rax, r8
1458959b1 movzx r8d, byte ptr [r8 + 8]
1458959b6 movzx r9d, byte ptr [rax + 9]
1458959bb mov byte ptr [rbp + 0x5d7], 1
1458959c2 mov byte ptr [rbp + 0x5d6], 1
1458959c9 mov byte ptr [rbp + 0x5d5], 1
1458959d0 mov byte ptr [rbp + 0x5d4], 1
1458959d7 mov rcx, rsi
1458959da mov rdx, rdi
1458959dd call 0x1458939c0
1458959e2 nop
1458959e3 jmp 0x145895a16
1458959e5 mov rcx, qword ptr [rax + 0x460]
1458959ec mov rax, qword ptr [rax + 0x468]
1458959f3 mov rax, qword ptr [rax + 0x30]
1458959f7 mov byte ptr [rbp + 0x5d7], 1
1458959fe mov byte ptr [rbp + 0x5d6], 1
145895a05 mov byte ptr [rbp + 0x5d5], 1
145895a0c mov byte ptr [rbp + 0x5d4], 1
145895a13 call rax
145895a15 nop
145895a16 movabs rcx, 0x8000000000000000
145895a20 xor rcx, r12
145895a23 test r12, r12
145895a26 mov eax, 3
145895a2b cmovs rax, rcx
145895a2f cmp rax, 0x12
145895a33 mov rsi, qword ptr [rbp + 0x5c8]
145895a3a ja 0x145895a56
145895a3c lea rcx, [rip + 0x179a3b1]
145895a43 movsxd rax, dword ptr [rcx + rax*4]
145895a47 add rax, rcx
145895a4a jmp rax
145895a4c mov rcx, rsi
145895a4f call 0x1458132e0
145895a54 jmp 0x145895a7b
145895a56 mov rcx, rsi
145895a59 call 0x1458712e0
145895a5e jmp 0x145895a7b
145895a60 mov rdi, qword ptr [rsi + 8]
145895a64 test rdi, rdi
145895a67 je 0x145895a7b
145895a69 mov rcx, qword ptr [rsi + 0x10]
145895a6d mov r8d, 1
145895a73 mov rdx, rdi
145895a76 call 0x1400021d0
145895a7b movaps xmm6, xmmword ptr [rbp + 0x5e0]
145895a82 add rsp, 0x678
145895a89 pop rbx
145895a8a pop rdi
145895a8b pop rsi
145895a8c pop r12
145895a8e pop r13
145895a90 pop r14
145895a92 pop r15
145895a94 pop rbp
145895a95 ret
145895a96 mov rsi, qword ptr [rbp + 0x5c8]
145895a9d jmp 0x1458958d1
145895aa2 cmp rax, 0x20
145895aa6 jae 0x145895b22
145895aa8 xor edx, edx
145895aaa xor r8d, r8d
145895aad jmp 0x145895bad
145895ab2 xor ecx, ecx
145895ab4 mov qword ptr [rbp + 0x380], rsi
145895abb lea rax, [rbp + 0x580]
145895ac2 mov qword ptr [rbp + 0x388], rax
145895ac9 lea rax, [rbp + 0x5a6]
145895ad0 mov qword ptr [rbp + 0x390], rax
145895ad7 lea rax, [rbp + 0x190]
145895ade mov qword ptr [rbp + 0x398], rax
145895ae5 lea r8, [rbp + 0x380]
145895aec call 0x1458dca70
145895af1 nop
145895af2 mov rdx, qword ptr [rbp + 0x190]
145895af9 test rdx, rdx
145895afc je 0x145895a7b
145895b02 mov rcx, qword ptr [rbp + 0x198]
145895b09 mov r8d, 1
145895b0f jmp 0x145895a76
145895b14 lea rcx, [rbp - 0x58]
145895b18 call 0x1458132e0
145895b1d jmp 0x145895a7b
145895b22 mov rdx, rax
145895b25 and rdx, 0xffffffffffffffe0
145895b29 pxor xmm0, xmm0
145895b2d xor r8d, r8d
145895b30 pxor xmm1, xmm1
145895b34 movdqu xmm2, xmmword ptr [r15 + r8]
145895b3a movdqu xmm3, xmmword ptr [r15 + r8 + 0x10]
145895b41 movdqu xmm4, xmmword ptr [rcx + r8]
145895b47 pxor xmm4, xmm2
145895b4b por xmm1, xmm4
145895b4f movdqu xmm2, xmmword ptr [rcx + r8 + 0x10]
145895b56 pxor xmm2, xmm3
145895b5a por xmm0, xmm2
145895b5e add r8, 0x20
145895b62 cmp rdx, r8
145895b65 jne 0x145895b34
145895b67 por xmm0, xmm1
145895b6b pshufd xmm1, xmm0, 0xee
145895b70 por xmm1, xmm0
145895b74 pshufd xmm0, xmm1, 0x55
145895b79 por xmm0, xmm1
145895b7d movdqa xmm1, xmm0
145895b81 psrld xmm1, 0x10
145895b86 por xmm1, xmm0
145895b8a movdqa xmm0, xmm1
145895b8e psrlw xmm0, 8
145895b93 por xmm0, xmm1
145895b97 movd r8d, xmm0
145895b9c cmp rax, rdx
145895b9f je 0x145895cc4
145895ba5 test al, 0x1c
145895ba7 je 0x145895cb0
145895bad mov r9, rdx
145895bb0 mov rdx, rax
145895bb3 and rdx, 0xfffffffffffffffc
145895bb7 movzx r8d, r8b
145895bbb movd xmm0, r8d
145895bc0 mov r8d, dword ptr [rcx + r9]
145895bc4 xor r8d, dword ptr [r15 + r9]
145895bc8 movd xmm1, r8d
145895bcd por xmm0, xmm1
145895bd1 add r9, 4
145895bd5 cmp rdx, r9
145895bd8 jne 0x145895bc0
145895bda movdqa xmm1, xmm0
145895bde psrld xmm1, 0x10
145895be3 por xmm1, xmm0
145895be7 movdqa xmm0, xmm1
145895beb psrlw xmm0, 8
145895bf0 por xmm0, xmm1
145895bf4 movd r8d, xmm0
145895bf9 jmp 0x145895cbf
145895bfe add r13, 8
145895c02 mov qword ptr [rbp + 0x380], r13
145895c09 lea rax, [rip - 0x5893b50]
145895c10 mov qword ptr [rbp + 0x388], rax
145895c17 lea rdx, [rip + 0x179790a]
145895c1e lea rcx, [rbp + 0x568]
145895c25 lea r8, [rbp + 0x380]
145895c2c call 0x145ce7350
145895c31 nop
145895c32 lea r8, [rbp + 0x568]
145895c39 mov rcx, rsi
145895c3c mov rdx, rdi
145895c3f movdqa xmm3, xmm6
145895c43 call 0x145894d00
145895c48 nop
145895c49 lea rcx, [rbp - 0x58]
145895c4d call 0x1458132e0
145895c52 mov rsi, qword ptr [rbp + 0x5c8]
145895c59 jmp 0x1458958d1
145895c5e mov byte ptr [rbp + 0x5d7], 1
145895c65 mov byte ptr [rbp + 0x5d6], 1
145895c6c mov byte ptr [rbp + 0x5d5], 1
145895c73 mov byte ptr [rbp + 0x5d4], 1
145895c7a lea r8, [rip + 0x179698f]
145895c81 mov rcx, rdi
145895c84 call 0x145eb7363
145895c89 nop
145895c8a jmp 0x145895cae
145895c8c mov ecx, 1
145895c91 mov rdx, rbx
145895c94 call 0x145eb6fcb
145895c99 nop
145895c9a jmp 0x145895cae
145895c9c lea r8, [rip + 0x1796985]
145895ca3 mov rcx, rdi
145895ca6 call 0x145eb7363
145895cab nop
145895cac jmp 0x145895cae
145895cae ud2
145895cb0 movzx r9d, byte ptr [rcx + rdx]
145895cb5 xor r9b, byte ptr [r15 + rdx]
145895cb9 inc rdx
145895cbc or r8b, r9b
145895cbf cmp rax, rdx
145895cc2 jne 0x145895cb0
145895cc4 test r8b, r8b
145895cc7 jne 0x145895836
145895ccd mov rax, qword ptr [rsi + 0xc90]
145895cd4 mov rdx, qword ptr [rsi + 0xc98]
145895cdb test rdx, rdx
145895cde je 0x145895cf4
145895ce0 mov r8d, edx
145895ce3 and r8d, 3
145895ce7 cmp rdx, 4
145895ceb jae 0x145895cfb
145895ced xor r9d, r9d
145895cf0 xor ecx, ecx
145895cf2 jmp 0x145895d4b
145895cf4 xor ecx, ecx
145895cf6 jmp 0x145895d84
145895cfb mov r10, rdx
145895cfe and r10, 0xfffffffffffffffc
145895d02 lea r11, [rax + 0x11d8]
145895d09 xor r9d, r9d
145895d0c xor ecx, ecx
145895d0e movzx ebx, byte ptr [r11 - 0xd68]
145895d16 add rbx, rcx
145895d19 movzx ecx, byte ptr [r11 - 0x8f0]
145895d21 movzx r14d, byte ptr [r11 - 0x478]
145895d29 add r14, rcx
145895d2c add r14, rbx
145895d2f movzx ecx, byte ptr [r11]
145895d33 add rcx, r14
145895d36 add r9, 4
145895d3a add r11, 0x11e0
145895d41 cmp r10, r9
145895d44 jne 0x145895d0e
145895d46 test r8, r8
145895d49 je 0x145895d84
145895d4b imul r9, r9, 0x478
145895d52 add r9, rax
145895d55 add r9, 0x470
145895d5c imul r8, r8, 0x478
145895d63 xor r10d, r10d
145895d66 nop word ptr cs:[rax + rax]
145895d70 movzx r11d, byte ptr [r9 + r10]
145895d75 add rcx, r11
145895d78 add r10, 0x478
145895d7f cmp r8, r10
145895d82 jne 0x145895d70
145895d84 inc rcx
145895d87 mov r9, qword ptr [rsi + 0x1590]
145895d8e movzx r8d, byte ptr [rsi + 0x16d1]
145895d96 cmp r8b, 5
145895d9a mov r10d, 5
145895da0 cmovb r10d, r8d
145895da4 cmp r9, -1
145895da8 movzx r8d, r10b
145895dac mov r10d, 5
145895db2 cmovne r10, r8
145895db6 cmp rcx, r10
145895db9 jae 0x145895de3
145895dbb cmp dword ptr [rsi + 0x10], 2
145895dbf je 0x145895df4
145895dc1 movzx ecx, byte ptr [rsi + 0xc51]
145895dc8 cmp byte ptr [rsi + rcx + 0xc56], 0
145895dd0 je 0x145895df4
145895dd2 lea r14, [rip + 0x1797799]
145895dd9 mov ebx, 0x14
145895dde jmp 0x145895836
145895de3 lea r14, [rip + 0x179779c]
145895dea mov ebx, 0x11
145895def jmp 0x145895836
145895df4 cmp rdi, rdx
145895df7 jae 0x145895ec7
145895dfd cmp r9, -1
145895e01 mov ecx, 5
145895e06 cmove r8d, ecx
145895e0a imul rdx, rdi, 0x478
145895e11 lea rcx, [rax + rdx]
145895e15 mov byte ptr [rax + rdx + 0x470], 1
145895e1d movzx eax, byte ptr [rax + rdx + 0x472]
145895e25 mov byte ptr [rbp + 0x388], al
145895e2b mov byte ptr [rbp + 0x389], r8b
145895e32 movabs rax, 0x8000000000000001
145895e3c mov qword ptr [rbp + 0x380], rax
145895e43 lea rdx, [rbp + 0x380]
145895e4a call 0x145818d20
145895e4f nop
145895e50 lea rcx, [rbp + 0x380]
145895e57 call 0x1458712e0
145895e5c nop
145895e5d mov qword ptr [rsp + 0x20], 0
145895e66 lea rdx, [rip + 0x1797773]
145895e6d mov r8d, 6
145895e73 mov r9d, 1
145895e79 mov rcx, rsi
145895e7c call 0x145893140
145895e81 nop
145895e82 mov rdx, qword ptr [rbp + 0x5b8]
145895e89 test rdx, rdx
145895e8c je 0x145895ea0
145895e8e mov r8d, 1
145895e94 mov rcx, qword ptr [rbp + 0x5a8]
145895e9b call 0x1400021d0
145895ea0 mov rdx, qword ptr [rbp + 0x5c0]
145895ea7 test rdx, rdx
145895eaa je 0x145895a16
145895eb0 mov r8d, 1
145895eb6 mov rcx, qword ptr [rbp + 0x5b0]
145895ebd call 0x1400021d0
145895ec2 jmp 0x145895a16
145895ec7 lea r8, [rip + 0x17976fa]
145895ece mov rcx, rdi
145895ed1 call 0x145eb7363
145895ed6 nop
145895ed7 jmp 0x145895cae
