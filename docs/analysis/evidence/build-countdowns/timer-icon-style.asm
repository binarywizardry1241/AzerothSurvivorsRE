14025b443 66c785140600000000 mov word ptr [rbp + 0x614], 0
14025b44c c6850406000001 mov byte ptr [rbp + 0x604], 1
14025b453 0f117b10 movups xmmword ptr [rbx + 0x10], xmm7
14025b457 0f113b movups xmmword ptr [rbx], xmm7
14025b45a 0f11b538050000 movups xmmword ptr [rbp + 0x538], xmm6
14025b461 48c7851005000000000000 mov qword ptr [rbp + 0x510], 0
14025b46c 0f117b40 movups xmmword ptr [rbx + 0x40], xmm7
14025b470 0f117b30 movups xmmword ptr [rbx + 0x30], xmm7
14025b474 c7852a06000005000005 mov dword ptr [rbp + 0x62a], 0x5000005
14025b47e 0f100573b8ba05 movups xmm0, xmmword ptr [rip + 0x5bab873]
14025b485 0f114360 movups xmmword ptr [rbx + 0x60], xmm0
14025b489 0f100558b8ba05 movups xmm0, xmmword ptr [rip + 0x5bab858]
14025b490 0f114350 movups xmmword ptr [rbx + 0x50], xmm0
14025b494 0f10056db8ba05 movups xmm0, xmmword ptr [rip + 0x5bab86d]
14025b49b 0f114370 movups xmmword ptr [rbx + 0x70], xmm0
14025b49f 0f100572b8ba05 movups xmm0, xmmword ptr [rip + 0x5bab872]
14025b4a6 0f118380000000 movups xmmword ptr [rbx + 0x80], xmm0
14025b4ad 0f118da8050000 movups xmmword ptr [rbp + 0x5a8], xmm1
14025b4b4 0f118db8050000 movups xmmword ptr [rbp + 0x5b8], xmm1
14025b4bb 0f1195c8050000 movups xmmword ptr [rbp + 0x5c8], xmm2
14025b4c2 0f1195d8050000 movups xmmword ptr [rbp + 0x5d8], xmm2
14025b4c9 48c7850806000000000000 mov qword ptr [rbp + 0x608], 0
14025b4d4 c785100600000000803f mov dword ptr [rbp + 0x610], 0x3f800000
14025b4de 440f119de8050000 movups xmmword ptr [rbp + 0x5e8], xmm11
14025b4e6 c785f805000001000000 mov dword ptr [rbp + 0x5f8], 1
14025b4f0 48c785fc05000000000000 mov qword ptr [rbp + 0x5fc], 0
14025b4fb 48c7852206000000000000 mov qword ptr [rbp + 0x622], 0
14025b506 0f100523b7ba05 movups xmm0, xmmword ptr [rip + 0x5bab723]
14025b50d 0f2985b0040000 movaps xmmword ptr [rbp + 0x4b0], xmm0
14025b514 48c785c004000000000000 mov qword ptr [rbp + 0x4c0], 0
14025b51f 0f100522b7ba05 movups xmm0, xmmword ptr [rip + 0x5bab722]
14025b526 0f1143b0 movups xmmword ptr [rbx - 0x50], xmm0
14025b52a 48c743c000000000 mov qword ptr [rbx - 0x40], 0
14025b532 0f100527b7ba05 movups xmm0, xmmword ptr [rip + 0x5bab727]
14025b539 0f1143c8 movups xmmword ptr [rbx - 0x38], xmm0
14025b53d 48c743d800000000 mov qword ptr [rbx - 0x28], 0
14025b545 440f117be0 movups xmmword ptr [rbx - 0x20], xmm15
14025b54a 48c743f000000000 mov qword ptr [rbx - 0x10], 0
14025b552 c783fe00000000000100 mov dword ptr [rbx + 0xfe], 0x10000
14025b55c 66c783020100000000 mov word ptr [rbx + 0x102], 0
14025b565 66c783080100000000 mov word ptr [rbx + 0x108], 0
14025b56e c7830401000000000100 mov dword ptr [rbx + 0x104], 0x10000
14025b578 0f100589b9ba05 movups xmm0, xmmword ptr [rip + 0x5bab989]
14025b57f 0f298580070000 movaps xmmword ptr [rbp + 0x780], xmm0
14025b586 c785900700000000803f mov dword ptr [rbp + 0x790], 0x3f800000
14025b590 410f1107 movups xmmword ptr [r15], xmm0
14025b594 41c747100000803f mov dword ptr [r15 + 0x10], 0x3f800000
14025b59c 410f114714 movups xmmword ptr [r15 + 0x14], xmm0
14025b5a1 41c747240000803f mov dword ptr [r15 + 0x24], 0x3f800000
14025b5a9 410f114728 movups xmmword ptr [r15 + 0x28], xmm0
14025b5ae 41c747380000803f mov dword ptr [r15 + 0x38], 0x3f800000
14025b5b6 488b8530080000 mov rax, qword ptr [rbp + 0x830]
14025b5bd 488b10 mov rdx, qword ptr [rax]
14025b5c0 4d8b442408 mov r8, qword ptr [r12 + 8]
14025b5c5 4d8b4c2410 mov r9, qword ptr [r12 + 0x10]
14025b5ca 4889f9 mov rcx, rdi
14025b5cd e80eb8ecff call 0x140126de0
14025b5d2 90 nop
14025b5d3 4c89f1 mov rcx, r14
14025b5d6 4889fa mov rdx, rdi
14025b5d9 e8b2cd4902 call 0x1426f8390
14025b5de 90 nop
14025b5df c745e000000000 mov dword ptr [rbp - 0x20], 0
14025b5e6 440f1145e4 movups xmmword ptr [rbp - 0x1c], xmm8
