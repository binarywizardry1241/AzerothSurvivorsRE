14093fd70 sub rsp, 0x98
14093fd77 movss xmm0, dword ptr [rsp + 0xd0]
14093fd80 mov eax, dword ptr [rsp + 0xc8]
14093fd87 mov r10d, dword ptr [rsp + 0xc0]
14093fd8f mov qword ptr [rsp + 0x28], rdx
14093fd94 mov qword ptr [rsp + 0x30], r8
14093fd99 mov dword ptr [rsp + 0x20], r10d
14093fd9e mov dword ptr [rsp + 0x24], eax
14093fda2 mov byte ptr [rcx + 0x48], 1
14093fda6 mov byte ptr [rcx + 0x4b], 0
14093fdaa mov byte ptr [rcx + 0x49], r9b
14093fdae mov dword ptr [rcx], r10d
14093fdb1 mov dword ptr [rcx + 4], eax
14093fdb4 mov qword ptr [rcx + 0x38], 0
14093fdbc movss dword ptr [rcx + 0x40], xmm0
14093fdc1 movss dword ptr [rcx + 0x44], xmm0
14093fdc6 mov rax, qword ptr [rip + 0x77711db]
14093fdcd mov rax, qword ptr [rax]
14093fdd0 cmp rax, 2
14093fdd4 ja 0x14093fea8
14093fdda movzx edx, byte ptr [rip + 0x7738f17]
14093fde1 movzx eax, dl
14093fde4 lea ecx, [rax - 1]
14093fde7 cmp ecx, 2
14093fdea jae 0x14093fea4
14093fdf0 mov rcx, qword ptr [rip + 0x7738ef1]
14093fdf7 call 0x144c7d510
14093fdfc test al, al
14093fdfe je 0x14093fea8
14093fe04 mov rcx, qword ptr [rip + 0x7738edd]
14093fe0b lea rax, [rcx + 0x30]
14093fe0f lea rdx, [rsp + 0x28]
14093fe14 mov qword ptr [rsp + 0x58], rdx
14093fe19 lea rdx, [rip - 0x93dd60]
14093fe20 mov qword ptr [rsp + 0x60], rdx
14093fe25 lea rdx, [rsp + 0x20]
14093fe2a mov qword ptr [rsp + 0x68], rdx
14093fe2f lea rdx, [rip + 0x6723a]
14093fe36 mov qword ptr [rsp + 0x70], rdx
14093fe3b lea rdx, [rip + 0x55c89d6]
14093fe42 mov qword ptr [rsp + 0x48], rdx
14093fe47 lea rdx, [rsp + 0x58]
14093fe4c mov qword ptr [rsp + 0x50], rdx
14093fe51 lea rdx, [rsp + 0x48]
14093fe56 mov qword ptr [rsp + 0x38], rdx
14093fe5b lea rdx, [rip + 0x55c6a0e]
14093fe62 mov qword ptr [rsp + 0x40], rdx
14093fe67 mov qword ptr [rsp + 0x78], 1
14093fe70 lea rdx, [rsp + 0x38]
14093fe75 mov qword ptr [rsp + 0x80], rdx
14093fe7d mov qword ptr [rsp + 0x88], 1
14093fe89 mov qword ptr [rsp + 0x90], rax
14093fe91 lea rdx, [rsp + 0x78]
14093fe96 call 0x144c7ed30
14093fe9b nop
14093fe9c add rsp, 0x98
14093fea3 ret
14093fea4 test eax, eax
14093fea6 jne 0x14093feb0
14093fea8 add rsp, 0x98
14093feaf ret
14093feb0 lea rcx, [rip + 0x7738e31]
14093feb7 call 0x145d6a190
14093febc mov edx, eax
14093febe test al, al
14093fec0 jne 0x14093fdf0
14093fec6 jmp 0x14093fea8
