1401c148c: 84c0 test al, al
1401c148e: 741c je 0x1401c14ac
1401c1490: 8b8424f4010000 mov eax, dword ptr [rsp + 0x1f4]
1401c1497: 488b8c24e8010000 mov rcx, qword ptr [rsp + 0x1e8]
1401c149f: 8901 mov dword ptr [rcx], eax
1401c14a1: 488b8424d8010000 mov rax, qword ptr [rsp + 0x1d8]
1401c14a9: c60001 mov byte ptr [rax], 1
