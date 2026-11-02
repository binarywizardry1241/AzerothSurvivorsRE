1401c4ed1: 84c0 test al, al
1401c4ed3: 7419 je 0x1401c4eee
1401c4ed5: 8b85cc000000 mov eax, dword ptr [rbp + 0xcc]
1401c4edb: 488b8dc0000000 mov rcx, qword ptr [rbp + 0xc0]
1401c4ee2: 8901 mov dword ptr [rcx], eax
1401c4ee4: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
1401c4eeb: c60001 mov byte ptr [rax], 1
