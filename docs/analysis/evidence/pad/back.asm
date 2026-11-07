1401c317d: 84c0 test al, al
1401c317f: 7419 je 0x1401c319a
1401c3181: 8b85cc000000 mov eax, dword ptr [rbp + 0xcc]
1401c3187: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
1401c318e: 8901 mov dword ptr [rcx], eax
1401c3190: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
1401c3197: c60001 mov byte ptr [rax], 1
