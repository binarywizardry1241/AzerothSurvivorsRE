1458c4c36 0fb64d50 movzx ecx, byte ptr [rbp + 0x50]
1458c4c3a c1e107 shl ecx, 7
1458c4c3d 83c902 or ecx, 2
1458c4c40 8908 mov dword ptr [rax], ecx
1458c4c42 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
1458c4c4a 488945d8 mov qword ptr [rbp - 0x28], rax
1458c4c4e 48c745e004000000 mov qword ptr [rbp - 0x20], 4
1458c4c56 66c745e84a01 mov word ptr [rbp - 0x18], 0x14a
