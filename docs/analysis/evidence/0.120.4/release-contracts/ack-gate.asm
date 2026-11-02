0000000145c5fe35 410f2ef1                       ucomiss xmm6, xmm9
0000000145c5fe39 0f8223ffffff                   jb 0x145c5fd62
0000000145c5fe3f 488b5fe8                       mov rbx, qword ptr [rdi - 0x18]
0000000145c5fe43 483b5ff0                       cmp rbx, qword ptr [rdi - 0x10]
0000000145c5fe47 0f8615ffffff                   jbe 0x145c5fd62
0000000145c5fe4d 48895ff0                       mov qword ptr [rdi - 0x10], rbx
0000000145c5fe51 488bbd10020000                 mov rdi, qword ptr [rbp + 0x210]
