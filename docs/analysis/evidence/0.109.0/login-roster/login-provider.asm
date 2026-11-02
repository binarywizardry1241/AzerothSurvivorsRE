1458b30f9 488d8d30170000 lea rcx, [rbp + 0x1730]
1458b3100 4889f2 mov rdx, rsi
1458b3103 e878870000 call 0x1458bb880
1458b3108 488b8d30170000 mov rcx, qword ptr [rbp + 0x1730]
1458b310f 488b9d38170000 mov rbx, qword ptr [rbp + 0x1738]
1458b3116 488b8540170000 mov rax, qword ptr [rbp + 0x1740]
1458b311d 4c6bf038 imul r14, rax, 0x38
1458b3121 4e8d2433 lea r12, [rbx + r14]
1458b3125 48899d600c0000 mov qword ptr [rbp + 0xc60], rbx
1458b312c 48898d700c0000 mov qword ptr [rbp + 0xc70], rcx
1458b3133 48899d680c0000 mov qword ptr [rbp + 0xc68], rbx
1458b313a 4c89a5780c0000 mov qword ptr [rbp + 0xc78], r12
