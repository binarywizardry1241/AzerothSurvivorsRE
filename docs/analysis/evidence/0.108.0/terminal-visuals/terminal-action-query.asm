1403d76a0 55 push rbp
1403d76a1 4157 push r15
1403d76a3 4156 push r14
1403d76a5 56 push rsi
1403d76a6 57 push rdi
1403d76a7 53 push rbx
1403d76a8 4881ecd8020000 sub rsp, 0x2d8
1403d76af 488dac2480000000 lea rbp, [rsp + 0x80]
1403d76b7 48c78550020000feffffff mov qword ptr [rbp + 0x250], 0xfffffffffffffffe
1403d76c2 4889d7 mov rdi, rdx
1403d76c5 4889ce mov rsi, rcx
1403d76c8 4889d1 mov rcx, rdx
1403d76cb e8c0f5efff call 0x1402d6c90
1403d76d0 4889c3 mov rbx, rax
1403d76d3 4889f9 mov rcx, rdi
1403d76d6 e85507f1ff call 0x1402e7e30
1403d76db 4989c6 mov r14, rax
1403d76de 4889f9 mov rcx, rdi
1403d76e1 e85ac1f0ff call 0x1402e3840
1403d76e6 48899d30020000 mov qword ptr [rbp + 0x230], rbx
1403d76ed 4c89b538020000 mov qword ptr [rbp + 0x238], r14
1403d76f4 48898540020000 mov qword ptr [rbp + 0x240], rax
1403d76fb 4889f9 mov rcx, rdi
1403d76fe e88df5efff call 0x1402d6c90
1403d7703 4889c3 mov rbx, rax
1403d7706 4c8d75a0 lea r14, [rbp - 0x60]
1403d770a 4c89f1 mov rcx, r14
1403d770d e83e21aa04 call 0x144e79850
1403d7712 c6854f02000001 mov byte ptr [rbp + 0x24f], 1
1403d7719 488d8d30020000 lea rcx, [rbp + 0x230]
1403d7720 4c89f2 mov rdx, r14
1403d7723 e82859fdff call 0x1403ad050
1403d7728 90 nop
1403d7729 c6854f02000001 mov byte ptr [rbp + 0x24f], 1
1403d7730 488d4d50 lea rcx, [rbp + 0x50]
1403d7734 e81721aa04 call 0x144e79850
1403d7739 90 nop
1403d773a 0fb685e1000000 movzx eax, byte ptr [rbp + 0xe1]
1403d7741 483b9d90000000 cmp rbx, qword ptr [rbp + 0x90]
1403d7748 0f83f1000000 jae 0x1403d783f
1403d774e 488b8d80000000 mov rcx, qword ptr [rbp + 0x80]
1403d7755 4889da mov rdx, rbx
1403d7758 48c1ea06 shr rdx, 6
1403d775c 488b0cd1 mov rcx, qword ptr [rcx + rdx*8]
1403d7760 480fa3d9 bt rcx, rbx
1403d7764 1c00 sbb al, 0
1403d7766 0f85db000000 jne 0x1403d7847
1403d776c 488d4d50 lea rcx, [rbp + 0x50]
1403d7770 4889da mov rdx, rbx
1403d7773 e8a8b7a904 call 0x144e72f20
1403d7778 90 nop
1403d7779 488d4da0 lea rcx, [rbp - 0x60]
1403d777d 488d5550 lea rdx, [rbp + 0x50]
1403d7781 e80abba904 call 0x144e73290
1403d7786 90 nop
1403d7787 41b601 mov r14b, 1
1403d778a 4883bf9000000000 cmp qword ptr [rdi + 0x90], 0
1403d7792 0f8442010000 je 0x1403d78da
1403d7798 488b4778 mov rax, qword ptr [rdi + 0x78]
1403d779c 488b8f80000000 mov rcx, qword ptr [rdi + 0x80]
1403d77a3 48ba1942cea89620590e movabs rdx, 0xe592096a8ce4219
1403d77ad 4531c0 xor r8d, r8d
1403d77b0 660f6f05585a9f05 movdqa xmm0, xmmword ptr [rip + 0x59f5a58]
1403d77b8 660f76c9 pcmpeqd xmm1, xmm1
1403d77bc 660f6f153c8fa205 movdqa xmm2, xmmword ptr [rip + 0x5a28f3c]
1403d77c4 4821ca and rdx, rcx
1403d77c7 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1403d77cc 660f6fe3 movdqa xmm4, xmm3
1403d77d0 660f74e0 pcmpeqb xmm4, xmm0
1403d77d4 66440fd7cc pmovmskb r9d, xmm4
1403d77d9 4585c9 test r9d, r9d
1403d77dc 7442 je 0x1403d7820
1403d77de f3450fbcd1 tzcnt r10d, r9d
1403d77e3 4901d2 add r10, rdx
1403d77e6 4921ca and r10, rcx
1403d77e9 49f7da neg r10
1403d77ec 4f8d1452 lea r10, [r10 + r10*2]
1403d77f0 f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403d77f7 660f74e2 pcmpeqb xmm4, xmm2
1403d77fb 66440fd7dc pmovmskb r11d, xmm4
1403d7800 4181fbffff0000 cmp r11d, 0xffff
1403d7807 7477 je 0x1403d7880
1403d7809 458d51ff lea r10d, [r9 - 1]
1403d780d 664521ca and r10w, r9w
1403d7811 4589d1 mov r9d, r10d
1403d7814 75c8 jne 0x1403d77de
1403d7816 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1403d7820 660f74d9 pcmpeqb xmm3, xmm1
1403d7824 66440fd7cb pmovmskb r9d, xmm3
1403d7829 4585c9 test r9d, r9d
1403d782c 0f85a8000000 jne 0x1403d78da
1403d7832 4c01c2 add rdx, r8
1403d7835 4883c210 add rdx, 0x10
1403d7839 4983c010 add r8, 0x10
1403d783d eb85 jmp 0x1403d77c4
1403d783f 84c0 test al, al
1403d7841 0f8425ffffff je 0x1403d776c
1403d7847 488d854e020000 lea rax, [rbp + 0x24e]
1403d784e 48898500010000 mov qword ptr [rbp + 0x100], rax
1403d7855 488d05c4f6c104 lea rax, [rip + 0x4c1f6c4]
1403d785c 48898508010000 mov qword ptr [rbp + 0x108], rax
1403d7863 488d0df68fa205 lea rcx, [rip + 0x5a28ff6]
1403d786a 4c8d05cf90a205 lea r8, [rip + 0x5a290cf]
1403d7871 488d9500010000 lea rdx, [rbp + 0x100]
1403d7878 e8f3c19b05 call 0x145d93a70
1403d787d 90 nop
1403d787e 0f0b ud2
1403d7880 4a8d04d0 lea rax, [rax + r10*8]
1403d7884 488b40f8 mov rax, qword ptr [rax - 8]
1403d7888 483b8718020000 cmp rax, qword ptr [rdi + 0x218]
1403d788f 7349 jae 0x1403d78da
1403d7891 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403d7898 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1403d789c 4885c9 test rcx, rcx
1403d789f 7439 je 0x1403d78da
1403d78a1 488b87e0010000 mov rax, qword ptr [rdi + 0x1e0]
1403d78a8 48f7d1 not rcx
1403d78ab 486bc938 imul rcx, rcx, 0x38
1403d78af 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
1403d78b4 7524 jne 0x1403d78da
1403d78b6 4801c8 add rax, rcx
1403d78b9 4c8b7010 mov r14, qword ptr [rax + 0x10]
1403d78bd 488d55a0 lea rdx, [rbp - 0x60]
1403d78c1 4c89f1 mov rcx, r14
1403d78c4 e8f7b3a204 call 0x144e02cc0
1403d78c9 90 nop
1403d78ca 488d5740 lea rdx, [rdi + 0x40]
1403d78ce 4c89f1 mov rcx, r14
1403d78d1 e84ab5a204 call 0x144e02e20
1403d78d6 90 nop
1403d78d7 4189c6 mov r14d, eax
1403d78da 4c8bbfa0050000 mov r15, qword ptr [rdi + 0x5a0]
1403d78e1 488d8d40010000 lea rcx, [rbp + 0x140]
1403d78e8 488d55a0 lea rdx, [rbp - 0x60]
1403d78ec 41b8b0000000 mov r8d, 0xb0
1403d78f2 e844b08105 call 0x145bf293b
1403d78f7 4c89bd00010000 mov qword ptr [rbp + 0x100], r15
1403d78fe c7850801000000000000 mov dword ptr [rbp + 0x108], 0
1403d7908 48c7851001000010000000 mov qword ptr [rbp + 0x110], 0x10
1403d7913 660fefc0 pxor xmm0, xmm0
1403d7917 f30f7f8518010000 movdqu xmmword ptr [rbp + 0x118], xmm0
1403d791f 48c7852801000010000000 mov qword ptr [rbp + 0x128], 0x10
1403d792a f30f7f8530010000 movdqu xmmword ptr [rbp + 0x130], xmm0
1403d7932 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
1403d793d 48c785f801000004000000 mov qword ptr [rbp + 0x1f8], 4
1403d7948 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1403d7953 4488b508020000 mov byte ptr [rbp + 0x208], r14b
1403d795a f30f6f8530020000 movdqu xmm0, xmmword ptr [rbp + 0x230]
1403d7962 f30f7f8510020000 movdqu xmmword ptr [rbp + 0x210], xmm0
1403d796a 488b8540020000 mov rax, qword ptr [rbp + 0x240]
1403d7971 48898520020000 mov qword ptr [rbp + 0x220], rax
1403d7978 48899d28020000 mov qword ptr [rbp + 0x228], rbx
1403d797f c6854f02000000 mov byte ptr [rbp + 0x24f], 0
1403d7986 488d4d50 lea rcx, [rbp + 0x50]
1403d798a e8019ffdff call 0x1403b1890
1403d798f 90 nop
1403d7990 488d8d00010000 lea rcx, [rbp + 0x100]
1403d7997 4889fa mov rdx, rdi
1403d799a e8f1f0ffff call 0x1403d6a90
1403d799f 90 nop
1403d79a0 488d9500010000 lea rdx, [rbp + 0x100]
1403d79a7 41b830010000 mov r8d, 0x130
1403d79ad 4889f1 mov rcx, rsi
1403d79b0 e886af8105 call 0x145bf293b
1403d79b5 4889f0 mov rax, rsi
1403d79b8 4881c4d8020000 add rsp, 0x2d8
1403d79bf 5b pop rbx
1403d79c0 5f pop rdi
1403d79c1 5e pop rsi
1403d79c2 415e pop r14
1403d79c4 415f pop r15
1403d79c6 5d pop rbp
1403d79c7 c3 ret
