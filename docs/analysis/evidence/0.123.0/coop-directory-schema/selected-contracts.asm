// lacks-key-and-type
000000014009a342 ba05000000                     mov edx, 5
000000014009a347 488d0d551b1206                 lea rcx, [rip + 0x6121b55]
000000014009a34e 4d89e8                         mov r8, r13
000000014009a351 e87a32c402                     call 0x142cdd5d0
000000014009a356 90                             nop
000000014009a357 4885c0                         test rax, rax
000000014009a35a 7503                           jne 0x14009a35f
000000014009a35c 4c89f0                         mov rax, r14
000000014009a35f 803803                         cmp byte ptr [rax], 3
000000014009a362 755d                           jne 0x14009a3c1
000000014009a364 488b4818                       mov rcx, qword ptr [rax + 0x18]
000000014009a368 4885c9                         test rcx, rcx
000000014009a36b 0f8889040000                   js 0x14009a7fa
000000014009a371 48898d98000000                 mov qword ptr [rbp + 0x98], rcx
000000014009a378 7447                           je 0x14009a3c1
// lacks-empty-default
000000014009a3c1 b801000000                     mov eax, 1
000000014009a3c6 48898590000000                 mov qword ptr [rbp + 0x90], rax
000000014009a3cd 48c7859800000000000000         mov qword ptr [rbp + 0x98], 0
// heroic-key-and-value
000000014009a3d8 ba06000000                     mov edx, 6
000000014009a3dd 488d0dc41a1206                 lea rcx, [rip + 0x6121ac4]
000000014009a3e4 4d89e8                         mov r8, r13
000000014009a3e7 e8e431c402                     call 0x142cdd5d0
000000014009a3ec 90                             nop
000000014009a3ed 4885c0                         test rax, rax
000000014009a3f0 7503                           jne 0x14009a3f5
000000014009a3f2 4c89f0                         mov rax, r14
000000014009a3f5 803802                         cmp byte ptr [rax], 2
000000014009a3f8 7525                           jne 0x14009a41f
000000014009a3fa 488b4808                       mov rcx, qword ptr [rax + 8]
000000014009a3fe 4885c9                         test rcx, rcx
000000014009a401 740f                           je 0x14009a412
000000014009a403 83f901                         cmp ecx, 1
000000014009a406 7517                           jne 0x14009a41f
000000014009a408 488b4010                       mov rax, qword ptr [rax + 0x10]
000000014009a40c 48894520                       mov qword ptr [rbp + 0x20], rax
000000014009a410 eb15                           jmp 0x14009a427
000000014009a412 488b4010                       mov rax, qword ptr [rax + 0x10]
000000014009a416 48894520                       mov qword ptr [rbp + 0x20], rax
000000014009a41a 4885c0                         test rax, rax
000000014009a41d 7908                           jns 0x14009a427
000000014009a41f 48c74520ffffffff               mov qword ptr [rbp + 0x20], 0xffffffffffffffff
// difficulty-key-and-type
000000014009a427 ba0a000000                     mov edx, 0xa
000000014009a42c 488d0d7b1a1206                 lea rcx, [rip + 0x6121a7b]
000000014009a433 4d89e8                         mov r8, r13
000000014009a436 e89531c402                     call 0x142cdd5d0
000000014009a43b 90                             nop
000000014009a43c 4885c0                         test rax, rax
000000014009a43f 7503                           jne 0x14009a444
000000014009a441 4c89f0                         mov rax, r14
000000014009a444 803803                         cmp byte ptr [rax], 3
000000014009a447 755d                           jne 0x14009a4a6
000000014009a449 488b4818                       mov rcx, qword ptr [rax + 0x18]
000000014009a44d 4885c9                         test rcx, rcx
000000014009a450 0f88b5030000                   js 0x14009a80b
000000014009a456 48898da8000000                 mov qword ptr [rbp + 0xa8], rcx
000000014009a45d 7447                           je 0x14009a4a6
// difficulty-empty-default
000000014009a4a6 b801000000                     mov eax, 1
000000014009a4ab 488985a0000000                 mov qword ptr [rbp + 0xa0], rax
000000014009a4b2 48c785a800000000000000         mov qword ptr [rbp + 0xa8], 0
// string-record-stores
000000014009a6b5 4c8b8598000000                 mov r8, qword ptr [rbp + 0x98]
000000014009a6bc 4d898402a8000000               mov qword ptr [r10 + rax + 0xa8], r8
000000014009a6c4 488b8d90000000                 mov rcx, qword ptr [rbp + 0x90]
000000014009a6cb 49898c02b0000000               mov qword ptr [r10 + rax + 0xb0], rcx
000000014009a6d3 4d898402b8000000               mov qword ptr [r10 + rax + 0xb8], r8
000000014009a6db 4c8b85a8000000                 mov r8, qword ptr [rbp + 0xa8]
000000014009a6e2 4d898402c0000000               mov qword ptr [r10 + rax + 0xc0], r8
000000014009a6ea 488b8da0000000                 mov rcx, qword ptr [rbp + 0xa0]
000000014009a6f1 49898c02c8000000               mov qword ptr [r10 + rax + 0xc8], rcx
000000014009a6f9 4d898402d0000000               mov qword ptr [r10 + rax + 0xd0], r8
// rank-record-store
000000014009a73d 488b4d20                       mov rcx, qword ptr [rbp + 0x20]
000000014009a741 49898c0208010000               mov qword ptr [r10 + rax + 0x108], rcx
