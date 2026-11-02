14028cd42 488b4810 mov rcx, qword ptr [rax + 0x10]
14028cd46 48898d10010000 mov qword ptr [rbp + 0x110], rcx
14028cd4d 4885c9 test rcx, rcx
14028cd50 0f846dfdffff je 0x14028cac3
14028cd56 807b0700 cmp byte ptr [rbx + 7], 0
14028cd5a 0f8463fdffff je 0x14028cac3
14028cd60 80bf80000000ff cmp byte ptr [rdi + 0x80], 0xff
14028cd67 0f8556fdffff jne 0x14028cac3
14028cd6d 80bfa0000000ff cmp byte ptr [rdi + 0xa0], 0xff
14028cd74 0f8549fdffff jne 0x14028cac3
14028cd7a 0fb687ea000000 movzx eax, byte ptr [rdi + 0xea]
14028cd81 3401 xor al, 1
14028cd83 898544010000 mov dword ptr [rbp + 0x144], eax
14028cd89 e93ffdffff jmp 0x14028cacd
