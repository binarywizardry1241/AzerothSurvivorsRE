1400384d0 push rbp
1400384d1 push r15
1400384d3 push r14
1400384d5 push r13
1400384d7 push r12
1400384d9 push rsi
1400384da push rdi
1400384db push rbx
1400384dc sub rsp, 0x5b8
1400384e3 lea rbp, [rsp + 0x80]
1400384eb movaps xmmword ptr [rbp + 0x520], xmm15
1400384f3 movaps xmmword ptr [rbp + 0x510], xmm14
1400384fb movaps xmmword ptr [rbp + 0x500], xmm13
140038503 movaps xmmword ptr [rbp + 0x4f0], xmm12
14003850b movaps xmmword ptr [rbp + 0x4e0], xmm11
140038513 movaps xmmword ptr [rbp + 0x4d0], xmm10
14003851b movaps xmmword ptr [rbp + 0x4c0], xmm9
140038523 movaps xmmword ptr [rbp + 0x4b0], xmm8
14003852b movaps xmmword ptr [rbp + 0x4a0], xmm7
140038532 movaps xmmword ptr [rbp + 0x490], xmm6
140038539 mov qword ptr [rbp + 0x488], 0xfffffffffffffffe
140038544 mov qword ptr [rbp + 0x460], r8
14003854b mov qword ptr [rbp + 0x468], rdx
140038552 mov qword ptr [rbp + 0x480], rcx
140038559 mov rax, qword ptr [r9 + 0x70]
14003855d test rax, rax
140038560 je 0x140038921
140038566 mov r14, qword ptr [r9 + 0x68]
14003856a imul rax, rax, 0xf0
140038571 add rax, r14
140038574 mov qword ptr [rbp + 0x470], rax
14003857b lea rdi, [rbp + 0x230]
140038582 lea rbx, [rbp + 0x360]
140038589 mov rax, qword ptr [rbp + 0x480]
140038590 add rax, 8
140038594 mov qword ptr [rbp + 0x478], rax
14003859b lea r15, [rbp - 0x58]
14003859f xor esi, esi
1400385a1 movups xmm6, xmmword ptr [rip + 0x5e8e378]
1400385a8 xorps xmm7, xmm7
1400385ab movaps xmm12, xmmword ptr [rip + 0x5e69aad]
1400385b3 movaps xmm13, xmmword ptr [rip + 0x5e69ab5]
1400385bb movups xmm8, xmmword ptr [rip + 0x5e8e1dd]
1400385c3 movups xmm9, xmmword ptr [rip + 0x5e8e1ed]
1400385cb movups xmm10, xmmword ptr [rip + 0x5e8e1fd]
1400385d3 movups xmm11, xmmword ptr [rip + 0x5e8e20d]
1400385db movss xmm15, dword ptr [rip + 0x5e69aa0]
1400385e4 lea r13, [rbp + 0x1d0]
1400385eb jmp 0x140038772
1400385f0 mov rax, qword ptr [rbp + 0x450]
1400385f7 mov qword ptr [r15 + 0x1b0], rax
1400385fe movaps xmm0, xmmword ptr [rbp + 0x430]
140038605 movaps xmm1, xmmword ptr [rbp + 0x440]
14003860c movups xmmword ptr [r15 + 0x1a0], xmm1
140038614 movups xmmword ptr [r15 + 0x190], xmm0
14003861c mov r8d, 0x180
140038622 mov rcx, r15
140038625 mov rdx, r13
140038628 call 0x145cf998b
14003862d mov rax, qword ptr [rbp + 0x428]
140038634 mov qword ptr [rbx + 0x60], rax
140038638 movups xmm0, xmmword ptr [rbp + 0x418]
14003863f movups xmmword ptr [rbx + 0x50], xmm0
140038643 movups xmm0, xmmword ptr [rbp + 0x408]
14003864a movups xmmword ptr [rbx + 0x40], xmm0
14003864e movups xmm0, xmmword ptr [rbp + 0x3c8]
140038655 movups xmm1, xmmword ptr [rbp + 0x3d8]
14003865c movups xmm2, xmmword ptr [rbp + 0x3e8]
140038663 movups xmm3, xmmword ptr [rbp + 0x3f8]
14003866a movups xmmword ptr [rbx + 0x30], xmm3
14003866e movups xmmword ptr [rbx + 0x20], xmm2
140038672 movups xmmword ptr [rbx + 0x10], xmm1
140038676 movups xmmword ptr [rbx], xmm0
140038679 mov rax, qword ptr [rbp + 0x480]
140038680 mov rax, qword ptr [rax]
140038683 mov byte ptr [rbp + 0x128], 2
14003868a mov qword ptr [rbp + 0x130], rsi
140038691 movss dword ptr [rbp + 0x160], xmm14
14003869a mov byte ptr [rbp + 0x164], 2
1400386a1 movups xmm0, xmmword ptr [rbp + 0x3b8]
1400386a8 movups xmmword ptr [r15 + 0x218], xmm0
1400386b0 movups xmm0, xmmword ptr [rbp + 0x3ad]
1400386b7 movups xmmword ptr [r15 + 0x20d], xmm0
1400386bf movups xmm0, xmmword ptr [rbp + 0x39d]
1400386c6 movups xmmword ptr [r15 + 0x1fd], xmm0
1400386ce movups xmm0, xmmword ptr [rbp + 0x35d]
1400386d5 movups xmm1, xmmword ptr [rbp + 0x36d]
1400386dc movups xmm2, xmmword ptr [rbp + 0x37d]
1400386e3 movups xmm3, xmmword ptr [rbp + 0x38d]
1400386ea movups xmmword ptr [r15 + 0x1ed], xmm3
1400386f2 movups xmmword ptr [r15 + 0x1dd], xmm2
1400386fa movups xmmword ptr [r15 + 0x1cd], xmm1
140038702 movups xmmword ptr [r15 + 0x1bd], xmm0
14003870a mov qword ptr [rbp - 0x60], rax
14003870e mov rcx, r13
140038711 mov rdx, qword ptr [rbp + 0x478]
140038718 lea r12, [rbp - 0x60]
14003871c mov r8, r12
14003871f lea r9, [rip + 0x5eb9ea2]
140038726 call 0x14026b850
14003872b mov qword ptr [rbp - 0x60], r14
14003872f mov rax, qword ptr [rbp + 0x468]
140038736 mov qword ptr [rbp - 0x58], rax
14003873a lea rax, [rbp + 0x458]
140038741 mov qword ptr [rbp - 0x50], rax
140038745 mov rax, qword ptr [rbp + 0x460]
14003874c mov qword ptr [rbp - 0x48], rax
140038750 mov rcx, r13
140038753 mov rdx, r12
140038756 call 0x140298d50
14003875b add r14, 0xf0
140038762 inc rsi
140038765 cmp r14, qword ptr [rbp + 0x470]
14003876c je 0x140038921
140038772 mov qword ptr [rbp + 0x458], r14
140038779 movzx r12d, byte ptr [r14 + 0xe8]
140038781 test r12b, r12b
140038784 je 0x1400387a0
140038786 movups xmm0, xmmword ptr [rip + 0x5e8e1a7]
14003878d movaps xmmword ptr [rbp - 0x60], xmm0
140038791 jmp 0x1400387a4
140038793 nop word ptr cs:[rax + rax]
1400387a0 movaps xmmword ptr [rbp - 0x60], xmm6
1400387a4 mov dword ptr [rbp - 0x50], 0x3f800000
1400387ab movaps xmmword ptr [rbp + 0x430], xmm6
1400387b2 mov dword ptr [rbp + 0x440], 0x3f800000
1400387bc movaps xmm0, xmmword ptr [rbp - 0x60]
1400387c0 lea rcx, [rbp + 0x444]
1400387c7 movups xmmword ptr [rcx], xmm0
1400387ca mov eax, dword ptr [rbp - 0x50]
1400387cd mov dword ptr [rcx + 0x10], eax
1400387d0 mov word ptr [rbp + 0x334], 0
1400387d9 mov byte ptr [rbp + 0x324], 1
1400387e0 movups xmmword ptr [rdi + 0x40], xmm7
1400387e4 movups xmmword ptr [rdi + 0x30], xmm7
1400387e8 movups xmmword ptr [rdi + 0x20], xmm7
1400387ec movups xmmword ptr [rdi + 0x10], xmm7
1400387f0 movups xmmword ptr [rdi], xmm7
1400387f3 mov qword ptr [rdi + 0x50], 0
1400387fb mov dword ptr [rbp + 0x34a], 5
140038805 movups xmm0, xmmword ptr [rip + 0x5e8e05c]
14003880c movups xmmword ptr [rdi + 0x68], xmm0
140038810 movups xmm0, xmmword ptr [rip + 0x5e8e041]
140038817 movups xmmword ptr [rdi + 0x58], xmm0
14003881b movaps xmm0, xmmword ptr [rip + 0x5e6981e]
140038822 movups xmmword ptr [rbp + 0x2a8], xmm0
140038829 movaps xmm0, xmmword ptr [rip + 0x5e69820]
140038830 movups xmmword ptr [rbp + 0x2b8], xmm0
140038837 movups xmmword ptr [rbp + 0x2c8], xmm12
14003883f movups xmmword ptr [rbp + 0x2d8], xmm12
140038847 movups xmmword ptr [rbp + 0x2e8], xmm13
14003884f movups xmmword ptr [rbp + 0x2f8], xmm13
140038857 mov qword ptr [rbp + 0x328], 0
140038862 mov dword ptr [rbp + 0x330], 0
14003886c movaps xmm0, xmmword ptr [rip + 0x5e697bd]
140038873 movups xmmword ptr [rbp + 0x308], xmm0
14003887a mov dword ptr [rbp + 0x318], 1
140038884 movss xmm0, dword ptr [rip + 0x5e697f4]
14003888c movlps qword ptr [rbp + 0x31c], xmm0
140038893 mov qword ptr [rbp + 0x342], 0
14003889e movaps xmmword ptr [rbp + 0x1d0], xmm8
1400388a6 mov qword ptr [rbp + 0x1e0], 0
1400388b1 movups xmmword ptr [rdi - 0x48], xmm9
1400388b6 mov qword ptr [rdi - 0x38], 0
1400388be movups xmmword ptr [rdi - 0x30], xmm10
1400388c3 mov qword ptr [rdi - 0x20], 0
1400388cb movups xmmword ptr [rdi - 0x18], xmm11
1400388d0 mov qword ptr [rdi - 8], 0
1400388d8 mov dword ptr [rdi + 0x106], 0x10000
1400388e2 mov word ptr [rdi + 0x10a], 0
1400388eb mov word ptr [rdi + 0x110], 0
1400388f4 mov dword ptr [rdi + 0x10c], 0x10000
1400388fe lea rcx, [rbp + 0x3c8]
140038905 call 0x1400de320
14003890a nop
14003890b movaps xmm14, xmm15
14003890f test r12b, r12b
140038912 jne 0x1400385f0
140038918 xorps xmm14, xmm14
14003891c jmp 0x1400385f0
140038921 movaps xmm6, xmmword ptr [rbp + 0x490]
140038928 movaps xmm7, xmmword ptr [rbp + 0x4a0]
14003892f movaps xmm8, xmmword ptr [rbp + 0x4b0]
140038937 movaps xmm9, xmmword ptr [rbp + 0x4c0]
14003893f movaps xmm10, xmmword ptr [rbp + 0x4d0]
140038947 movaps xmm11, xmmword ptr [rbp + 0x4e0]
14003894f movaps xmm12, xmmword ptr [rbp + 0x4f0]
140038957 movaps xmm13, xmmword ptr [rbp + 0x500]
14003895f movaps xmm14, xmmword ptr [rbp + 0x510]
140038967 movaps xmm15, xmmword ptr [rbp + 0x520]
14003896f add rsp, 0x5b8
140038976 pop rbx
140038977 pop rdi
140038978 pop rsi
140038979 pop r12
14003897b pop r13
14003897d pop r14
14003897f pop r15
140038981 pop rbp
140038982 ret
