000000014009f816: 488d0dde76e405                 lea rcx, [rip + 0x5e476de]
000000014009f81d: 4c8d0dc076e405                 lea r9, [rip + 0x5e476c0]
000000014009f837: 4d8b4540                       mov r8, qword ptr [r13 + 0x40]
000000014009f83b: 4d85c0                         test r8, r8
000000014009f83e: 0f84fc000000                   je 0x14009f940
000000014009f844: 498b5538                       mov rdx, qword ptr [r13 + 0x38]
000000014009f848: 48c744242002000000             mov qword ptr [rsp + 0x20], 2
000000014009f851: 488d7d30                       lea rdi, [rbp + 0x30]
000000014009f855: 4889f9                         mov rcx, rdi
000000014009f858: 4c8d0db576e405                 lea r9, [rip + 0x5e476b5]
000000014009f85f: e84c8b0500                     call 0x1400f83b0
000000014009f940: 0fb685d6020000                 movzx eax, byte ptr [rbp + 0x2d6]
000000014009f947: 41844560                       test byte ptr [r13 + 0x60], al
000000014009f94b: 0f844b030000                   je 0x14009fc9c
000000014009f951: ba19000000                     mov edx, 0x19
000000014009f956: e885058405                     call 0x1458dfee0
000000014009fc9c: 41807d6100                     cmp byte ptr [r13 + 0x61], 0
000000014009fca1: 7466                           je 0x14009fd09
000000014009fca3: ba17000000                     mov edx, 0x17
000000014009fca8: 4c89c9                         mov rcx, r9
000000014009fcab: e830028405                     call 0x1458dfee0
000000014009fd09: 48c785a002000000000000         mov qword ptr [rbp + 0x2a0], 0
000000014009fd14: 48c785a802000001000000         mov qword ptr [rbp + 0x2a8], 1
000000014009fd1f: 48c785b002000000000000         mov qword ptr [rbp + 0x2b0], 0
000000014009fd2a: bf01000000                     mov edi, 1
000000014009fd2f: 31db                           xor ebx, ebx
000000014009fd31: 48c785c002000000000000         mov qword ptr [rbp + 0x2c0], 0
000000014009fd3c: 31c0                           xor eax, eax
000000014009fd3e: e9c2fbffff                     jmp 0x14009f905
