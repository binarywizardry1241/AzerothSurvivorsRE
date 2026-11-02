1459b1230 push rbp
1459b1231 push rsi
1459b1232 push rdi
1459b1233 push rbx
1459b1234 sub rsp, 0x58
1459b1238 lea rbp, [rsp + 0x50]
1459b123d mov qword ptr [rbp], 0xfffffffffffffffe
1459b1245 mov edi, r8d
1459b1248 mov ebx, edx
1459b124a mov rsi, rcx
1459b124d call 0x140002200
1459b1252 mov ecx, 0x20
1459b1257 mov edx, 1
1459b125c call 0x1400021c0
1459b1261 test rax, rax
1459b1264 je 0x1459b1303
1459b126a mov dword ptr [rax], ebx
1459b126c mov qword ptr [rbp - 0x20], 0x20
1459b1274 mov qword ptr [rbp - 0x18], rax
1459b1278 mov word ptr [rbp - 8], 0x2c2
1459b127e mov dword ptr [rax + 4], edi
1459b1281 mov qword ptr [rbp - 0x10], 8
1459b1289 mov rcx, qword ptr [rbp - 0x20]
1459b128d and rcx, 0xfffffffffffffffe
1459b1291 mov eax, 8
1459b1296 cmp rcx, 8
1459b129a je 0x1459b12d9
1459b129c mov rcx, qword ptr [rbp - 0x18]
1459b12a0 mov word ptr [rcx + rax], 0
1459b12a6 add rax, 2
1459b12aa mov qword ptr [rbp - 0x10], rax
1459b12ae mov rax, qword ptr [rbp - 0x20]
1459b12b2 mov qword ptr [rsi], rax
1459b12b5 mov rax, qword ptr [rbp - 0x18]
1459b12b9 mov qword ptr [rsi + 8], rax
1459b12bd mov rax, qword ptr [rbp - 0x10]
1459b12c1 mov qword ptr [rsi + 0x10], rax
1459b12c5 mov rax, qword ptr [rbp - 8]
1459b12c9 mov qword ptr [rsi + 0x18], rax
1459b12cd mov rax, rsi
1459b12d0 add rsp, 0x58
1459b12d4 pop rbx
1459b12d5 pop rdi
1459b12d6 pop rsi
1459b12d7 pop rbp
1459b12d8 ret
1459b12d9 mov qword ptr [rsp + 0x20], 1
1459b12e2 lea rcx, [rbp - 0x20]
1459b12e6 mov edx, 8
1459b12eb mov r8d, 2
1459b12f1 mov r9d, 1
1459b12f7 call 0x145d14a10
1459b12fc nop
1459b12fd mov rax, qword ptr [rbp - 0x10]
1459b1301 jmp 0x1459b129c
1459b1303 mov ecx, 1
1459b1308 mov edx, 0x20
1459b130d call 0x145eb6fcb
1459b1312 ud2
