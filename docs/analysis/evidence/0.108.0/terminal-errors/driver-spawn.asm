00000001458e7cc0  55                       push rbp
00000001458e7cc1  56                       push rsi
00000001458e7cc2  4881ecd8000000           sub rsp, 0xd8
00000001458e7cc9  488dac2480000000         lea rbp, [rsp + 0x80]
00000001458e7cd1  48c74550feffffff         mov qword ptr [rbp + 0x50], 0xfffffffffffffffe
00000001458e7cd9  4889ce                   mov rsi, rcx
00000001458e7cdc  48894d10                 mov qword ptr [rbp + 0x10], rcx
00000001458e7ce0  48c74528ffffffff         mov qword ptr [rbp + 0x28], 0xffffffffffffffff
00000001458e7ce8  48c7451800000000         mov qword ptr [rbp + 0x18], 0
00000001458e7cf0  c6454000                 mov byte ptr [rbp + 0x40], 0
00000001458e7cf4  e807a571fa               call 0x140002200
00000001458e7cf9  b90c000000               mov ecx, 0xc
00000001458e7cfe  ba01000000               mov edx, 1
00000001458e7d03  e8b8a471fa               call 0x1400021c0
00000001458e7d08  4885c0                   test rax, rax
00000001458e7d0b  48894508                 mov qword ptr [rbp + 8], rax
00000001458e7d0f  0f84bf000000             je 0x1458e7dd4
00000001458e7d15  48b9726f6775652d7365     movabs rcx, 0x65732d6575676f72
00000001458e7d1f  488908                   mov qword ptr [rax], rcx
00000001458e7d22  c7400872766572           mov dword ptr [rax + 8], 0x72657672
00000001458e7d29  48c745f00c000000         mov qword ptr [rbp - 0x10], 0xc
00000001458e7d31  488945f8                 mov qword ptr [rbp - 8], rax
00000001458e7d35  48c745000c000000         mov qword ptr [rbp], 0xc
00000001458e7d3d  488d4dc0                 lea rcx, [rbp - 0x40]
00000001458e7d41  488d5518                 lea rdx, [rbp + 0x18]
00000001458e7d45  4c8d45f0                 lea r8, [rbp - 0x10]
00000001458e7d49  e832562b00               call 0x145b9d380
00000001458e7d4e  90                       nop
00000001458e7d4f  488d55d0                 lea rdx, [rbp - 0x30]
00000001458e7d53  4c8b45c0                 mov r8, qword ptr [rbp - 0x40]
00000001458e7d57  4c8b4dc8                 mov r9, qword ptr [rbp - 0x38]
00000001458e7d5b  0fb645e8                 movzx eax, byte ptr [rbp - 0x18]
00000001458e7d5f  c6454f00                 mov byte ptr [rbp + 0x4f], 0
00000001458e7d63  4889742430               mov qword ptr [rsp + 0x30], rsi
00000001458e7d68  88442420                 mov byte ptr [rsp + 0x20], al
00000001458e7d6c  48c744242800000000       mov qword ptr [rsp + 0x28], 0
00000001458e7d75  488d4d18                 lea rcx, [rbp + 0x18]
00000001458e7d79  e87287ffff               call 0x1458e04f0
00000001458e7d7e  90                       nop
00000001458e7d7f  488b7518                 mov rsi, qword ptr [rbp + 0x18]
00000001458e7d83  488b4520                 mov rax, qword ptr [rbp + 0x20]
00000001458e7d87  4885f6                   test rsi, rsi
00000001458e7d8a  745a                     je 0x1458e7de6
00000001458e7d8c  488b4d28                 mov rcx, qword ptr [rbp + 0x28]
00000001458e7d90  48897518                 mov qword ptr [rbp + 0x18], rsi
00000001458e7d94  48894520                 mov qword ptr [rbp + 0x20], rax
00000001458e7d98  48894d28                 mov qword ptr [rbp + 0x28], rcx
00000001458e7d9c  ff151ecb4a00             call qword ptr [rip + 0x4acb1e]
00000001458e7da2  f048ff0e                 lock dec qword ptr [rsi]
00000001458e7da6  750a                     jne 0x1458e7db2
00000001458e7da8  488d4d18                 lea rcx, [rbp + 0x18]
00000001458e7dac  e87f322c00               call 0x145bab030
00000001458e7db1  90                       nop
00000001458e7db2  488b4520                 mov rax, qword ptr [rbp + 0x20]
00000001458e7db6  f048ff08                 lock dec qword ptr [rax]
00000001458e7dba  750e                     jne 0x1458e7dca
00000001458e7dbc  c6454f00                 mov byte ptr [rbp + 0x4f], 0
00000001458e7dc0  488d4d20                 lea rcx, [rbp + 0x20]
00000001458e7dc4  e827312c00               call 0x145baaef0
00000001458e7dc9  90                       nop
00000001458e7dca  4881c4d8000000           add rsp, 0xd8
00000001458e7dd1  5e                       pop rsi
00000001458e7dd2  5d                       pop rbp
00000001458e7dd3  c3                       ret
00000001458e7dd4  b901000000               mov ecx, 1
00000001458e7dd9  ba0c000000               mov edx, 0xc
00000001458e7dde  e818b74a00               call 0x145d934fb
00000001458e7de3  90                       nop
00000001458e7de4  eb2d                     jmp 0x1458e7e13
00000001458e7de6  48894518                 mov qword ptr [rbp + 0x18], rax
00000001458e7dea  488d0587e65a01           lea rax, [rip + 0x15ae687]
00000001458e7df1  4889442420               mov qword ptr [rsp + 0x20], rax
00000001458e7df6  488d0d3be65a01           lea rcx, [rip + 0x15ae63b]
00000001458e7dfd  4c8d0dc4323001           lea r9, [rip + 0x13032c4]
00000001458e7e04  4c8d4518                 lea r8, [rbp + 0x18]
00000001458e7e08  ba1d000000               mov edx, 0x1d
00000001458e7e0d  e8feb94a00               call 0x145d93810
00000001458e7e12  90                       nop
00000001458e7e13  0f0b                     ud2
