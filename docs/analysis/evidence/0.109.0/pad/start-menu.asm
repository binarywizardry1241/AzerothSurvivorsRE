1401c321c: 84c0 test al, al
1401c321e: 741c je 0x1401c323c
1401c3220: 8b8424f4010000 mov eax, dword ptr [rsp + 0x1f4]
1401c3227: 488b8c24e8010000 mov rcx, qword ptr [rsp + 0x1e8]
1401c322f: 8901 mov dword ptr [rcx], eax
1401c3231: 488b8424d8010000 mov rax, qword ptr [rsp + 0x1d8]
1401c3239: c60001 mov byte ptr [rax], 1
