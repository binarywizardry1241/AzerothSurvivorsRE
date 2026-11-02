000000014596a412: 4c89adf8010000                 mov qword ptr [rbp + 0x1f8], r13
000000014596a419: 498b4818                       mov rcx, qword ptr [r8 + 0x18]
000000014596a41d: 498b9638030000                 mov rdx, qword ptr [r14 + 0x338]
000000014596a424: 4839d1                         cmp rcx, rdx
000000014596a427: 0f8334140000                   jae 0x14596b861
000000014596a42d: 498d8680040000                 lea rax, [r14 + 0x480]
000000014596a434: 4d8b8630030000                 mov r8, qword ptr [r14 + 0x330]
000000014596a43b: 48898d20020000                 mov qword ptr [rbp + 0x220], rcx
000000014596a442: 486bd158                       imul rdx, rcx, 0x58
000000014596a446: 498d3c10                       lea rdi, [r8 + rdx]
000000014596a44a: 48899de0000000                 mov qword ptr [rbp + 0xe0], rbx
000000014596a451: 498b0c10                       mov rcx, qword ptr [r8 + rdx]
000000014596a455: 488b5130                       mov rdx, qword ptr [rcx + 0x30]
000000014596a459: 4c8b4138                       mov r8, qword ptr [rcx + 0x38]
000000014596a45d: 4901d0                         add r8, rdx
000000014596a460: 48899568010000                 mov qword ptr [rbp + 0x168], rdx
000000014596a467: 4c898570010000                 mov qword ptr [rbp + 0x170], r8
000000014596a46e: 48898d78010000                 mov qword ptr [rbp + 0x178], rcx
000000014596a475: 4889bd80010000                 mov qword ptr [rbp + 0x180], rdi
000000014596a47c: 48898588010000                 mov qword ptr [rbp + 0x188], rax
000000014596a483: 4889bd90010000                 mov qword ptr [rbp + 0x190], rdi
000000014596a48a: 48898598010000                 mov qword ptr [rbp + 0x198], rax
000000014596a491: 488d85e0000000                 lea rax, [rbp + 0xe0]
000000014596a498: 488985a0010000                 mov qword ptr [rbp + 0x1a0], rax
000000014596a49f: 4889bda8010000                 mov qword ptr [rbp + 0x1a8], rdi
000000014596a4a6: 488985b0010000                 mov qword ptr [rbp + 0x1b0], rax
000000014596a4ad: c6854702000001                 mov byte ptr [rbp + 0x247], 1
000000014596a4b4: 488d8d38010000                 lea rcx, [rbp + 0x138]
000000014596a4bb: 488d9568010000                 lea rdx, [rbp + 0x168]
000000014596a4c2: e8f9630100                     call 0x1459808c0
