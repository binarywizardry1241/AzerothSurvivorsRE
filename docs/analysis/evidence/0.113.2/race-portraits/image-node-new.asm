0000000142674550 mov rax, rcx
0000000142674553 movups xmm0, xmmword ptr [rip + 0x3cfdc5e]
000000014267455a movups xmmword ptr [rcx + 0x38], xmm0
000000014267455e mov dword ptr [rcx + 0x48], 0x3f800000
0000000142674565 movups xmm0, xmmword ptr [rdx]
0000000142674568 movups xmmword ptr [rcx + 0x20], xmm0
000000014267456c mov rcx, qword ptr [rdx + 0x10]
0000000142674570 mov qword ptr [rax + 0x30], rcx
0000000142674574 mov byte ptr [rax], 2
0000000142674577 mov word ptr [rax + 0x84], 0
0000000142674580 mov dword ptr [rax + 0x70], 0
0000000142674587 mov dword ptr [rax + 0x4c], 2
000000014267458e ret
