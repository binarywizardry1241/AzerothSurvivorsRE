1459b8160 push rbp
1459b8161 push rsi
1459b8162 push rdi
1459b8163 sub rsp, 0x90
1459b816a lea rbp, [rsp + 0x80]
1459b8172 movaps xmmword ptr [rbp], xmm6
1459b8176 mov qword ptr [rbp - 8], 0xfffffffffffffffe
1459b817e movaps xmm6, xmm2
1459b8181 mov edi, edx
1459b8183 mov rsi, rcx
1459b8186 call 0x140002200
1459b818b mov ecx, 0x20
1459b8190 mov edx, 1
1459b8195 call 0x1400021c0
1459b819a test rax, rax
1459b819d je 0x1459b829b
1459b81a3 mov dword ptr [rax], edi
1459b81a5 mov qword ptr [rbp - 0x50], 0x20
1459b81ad mov qword ptr [rbp - 0x48], rax
1459b81b1 mov word ptr [rbp - 0x38], 0x2f4
1459b81b7 movss dword ptr [rax + 4], xmm6
1459b81bc mov qword ptr [rbp - 0x40], 8
1459b81c4 mov rcx, qword ptr [rbp - 0x50]
1459b81c8 and rcx, 0xfffffffffffffffc
1459b81cc mov eax, 8
1459b81d1 cmp rcx, 8
1459b81d5 je 0x1459b826e
1459b81db mov rcx, qword ptr [rbp - 0x48]
1459b81df mov dword ptr [rcx + rax], 0
1459b81e6 add rax, 4
1459b81ea mov qword ptr [rbp - 0x40], rax
1459b81ee mov rax, qword ptr [rbp - 0x40]
1459b81f2 mov qword ptr [rbp - 0x20], rax
1459b81f6 movzx eax, word ptr [rbp - 0x38]
1459b81fa mov word ptr [rbp - 0x18], ax
1459b81fe mov eax, dword ptr [rbp - 0x36]
1459b8201 mov dword ptr [rbp - 0x16], eax
1459b8204 movzx eax, word ptr [rbp - 0x32]
1459b8208 mov word ptr [rbp - 0x12], ax
1459b820c movups xmm0, xmmword ptr [rbp - 0x50]
1459b8210 movaps xmmword ptr [rbp - 0x30], xmm0
1459b8214 mov rdi, qword ptr [rbp - 0x20]
1459b8218 cmp rdi, qword ptr [rbp - 0x30]
1459b821c jne 0x1459b8228
1459b821e lea rcx, [rbp - 0x30]
1459b8222 call 0x145eb6ec0
1459b8227 nop
1459b8228 mov rax, qword ptr [rbp - 0x28]
1459b822c mov byte ptr [rax + rdi], 0
1459b8230 inc rdi
1459b8233 mov qword ptr [rbp - 0x20], rdi
1459b8237 movaps xmm0, xmmword ptr [rbp - 0x30]
1459b823b movups xmmword ptr [rsi], xmm0
1459b823e mov rax, qword ptr [rbp - 0x20]
1459b8242 mov qword ptr [rsi + 0x10], rax
1459b8246 movzx eax, word ptr [rbp - 0x18]
1459b824a mov word ptr [rsi + 0x18], ax
1459b824e mov eax, dword ptr [rbp - 0x16]
1459b8251 mov dword ptr [rsi + 0x1a], eax
1459b8254 movzx eax, word ptr [rbp - 0x12]
1459b8258 mov word ptr [rsi + 0x1e], ax
1459b825c mov rax, rsi
1459b825f movaps xmm6, xmmword ptr [rbp]
1459b8263 add rsp, 0x90
1459b826a pop rdi
1459b826b pop rsi
1459b826c pop rbp
1459b826d ret
1459b826e mov qword ptr [rsp + 0x20], 1
1459b8277 lea rcx, [rbp - 0x50]
1459b827b mov edx, 8
1459b8280 mov r8d, 4
1459b8286 mov r9d, 1
1459b828c call 0x145d14a10
1459b8291 nop
1459b8292 mov rax, qword ptr [rbp - 0x40]
1459b8296 jmp 0x1459b81db
1459b829b mov ecx, 1
1459b82a0 mov edx, 0x20
1459b82a5 call 0x145eb6fcb
1459b82aa ud2
