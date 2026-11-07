00000001400be37b: 4889f9                         mov rcx, rdi
00000001400be37e: e81d3b0300                     call 0x1400f1ea0
00000001400be383: 4c8b87a0050000                 mov r8, qword ptr [rdi + 0x5a0]
00000001400be38a: 488b55b0                       mov rdx, qword ptr [rbp - 0x50]
00000001400be38e: 48c70201000000                 mov qword ptr [rdx], 1
00000001400be395: 488d4a08                       lea rcx, [rdx + 8]
00000001400be399: 48895a08                       mov qword ptr [rdx + 8], rbx
00000001400be39d: 4c897210                       mov qword ptr [rdx + 0x10], r14
00000001400be3a1: 4c897a18                       mov qword ptr [rdx + 0x18], r15
00000001400be3a5: 4c896220                       mov qword ptr [rdx + 0x20], r12
00000001400be3a9: 48894228                       mov qword ptr [rdx + 0x28], rax
00000001400be3ad: 4c894230                       mov qword ptr [rdx + 0x30], r8
