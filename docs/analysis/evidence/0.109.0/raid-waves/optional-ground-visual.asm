1459527aa: 4c89f0 mov rax, r14
1459527ad: 4983c618 add r14, 0x18
1459527b1: 448b4008 mov r8d, dword ptr [rax + 8]
1459527b5: 4585c0 test r8d, r8d
1459527b8: 74e7 je 0x1459527a1
1459527ba: 488b10 mov rdx, qword ptr [rax]
1459527bd: 8b4814 mov ecx, dword ptr [rax + 0x14]
1459527c0: 894b08 mov dword ptr [rbx + 8], ecx
1459527c3: 488b400c mov rax, qword ptr [rax + 0xc]
1459527c7: 488903 mov qword ptr [rbx], rax
1459527ca: c7858001000001000000 mov dword ptr [rbp + 0x180], 1
1459527d4: c7854001000000000000 mov dword ptr [rbp + 0x140], 0
1459527de: 488d8540010000 lea rax, [rbp + 0x140]
1459527e5: 4889442430 mov qword ptr [rsp + 0x30], rax
1459527ea: 488d8580010000 lea rax, [rbp + 0x180]
1459527f1: 4889442428 mov qword ptr [rsp + 0x28], rax
1459527f6: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
1459527ff: 41b908000000 mov r9d, 8
145952805: 4889f9 mov rcx, rdi
145952808: e863aff7ff call 0x1458cd770
