14028caa8 803802 cmp byte ptr [rax], 2
14028caab 750b jne 0x14028cab8
14028caad 4883780800 cmp qword ptr [rax + 8], 0
14028cab2 0f848a020000 je 0x14028cd42
14028cab8 48c7851001000000000000 mov qword ptr [rbp + 0x110], 0
14028cac3 c7854401000000000000 mov dword ptr [rbp + 0x144], 0
14028cacd 89742420 mov dword ptr [rsp + 0x20], esi
