0x140169630: push r15
0x140169632: push r14
0x140169634: push r13
0x140169636: push r12
0x140169638: push rsi
0x140169639: push rdi
0x14016963a: push rbp
0x14016963b: push rbx
0x14016963c: sub rsp, 0x108
0x140169643: mov ebp, 1
0x140169648: lock xadd dword ptr [r8 + 0x5b0], ebp
0x140169651: cmp qword ptr [rdx + 0x100], -1
0x140169659: je 0x140169943
0x14016965f: mov rbx, r8
0x140169662: mov rsi, rdx
0x140169665: mov rax, qword ptr [r8 + 0x5a0]
0x14016966c: mov qword ptr [rsp + 0x48], rax
0x140169671: cmp qword ptr [rdx + 8], rax
0x140169675: jne 0x14016995d
0x14016967b: mov rdi, rcx
0x14016967e: lea rcx, [rsi + 0x10]
0x140169682: mov r15d, dword ptr [rsi]
0x140169685: mov rdx, rbx
0x140169688: call 0x140452f90
0x14016968d: mov rax, qword ptr [rsi + 0x138]
0x140169694: cmp rax, qword ptr [rbx + 0x218]
0x14016969b: jae 0x1401699cc
0x1401696a1: mov rcx, qword ptr [rbx + 0x210]
0x1401696a8: mov rcx, qword ptr [rcx + rax*8]
0x1401696ac: test rcx, rcx
0x1401696af: je 0x1401699cc
0x1401696b5: mov rax, qword ptr [rbx + 0x1e0]
0x1401696bc: not rcx
0x1401696bf: imul rcx, rcx, 0x38
0x1401696c3: cmp byte ptr [rax + rcx + 0x30], 0
0x1401696c8: je 0x1401699cc
0x1401696ce: add rax, rcx
0x1401696d1: mov rcx, qword ptr [rax + 0x10]
0x1401696d5: mov edx, dword ptr [rbx + 0x5b0]
0x1401696db: mov rdx, qword ptr [rsi + 0x140]
0x1401696e2: cmp rdx, qword ptr [rbx + 0x218]
0x1401696e9: jae 0x1401699cc
0x1401696ef: mov r8, qword ptr [rbx + 0x210]
0x1401696f6: mov r8, qword ptr [r8 + rdx*8]
0x1401696fa: test r8, r8
0x1401696fd: je 0x1401699cc
0x140169703: mov rdx, qword ptr [rbx + 0x1e0]
0x14016970a: not r8
0x14016970d: imul r8, r8, 0x38
0x140169711: cmp byte ptr [rdx + r8 + 0x30], 0
0x140169717: je 0x1401699cc
0x14016971d: add rdx, r8
0x140169720: mov r8, qword ptr [rdx + 0x10]
0x140169724: mov r9d, dword ptr [rbx + 0x5b0]
0x14016972b: mov r9, qword ptr [rsi + 0x148]
0x140169732: mov r11, qword ptr [rbx + 0x218]
0x140169739: cmp r9, r11
0x14016973c: jae 0x14016998e
0x140169742: mov r14, qword ptr [rbx + 0x210]
0x140169749: mov r9, qword ptr [r14 + r9*8]
0x14016974d: test r9, r9
0x140169750: je 0x14016998e
0x140169756: mov r12, qword ptr [rbx + 0x1e0]
0x14016975d: not r9
0x140169760: imul r9, r9, 0x38
0x140169764: cmp byte ptr [r12 + r9 + 0x30], 0
0x14016976a: je 0x14016998e
0x140169770: mov r10, qword ptr [rsi + 0x150]
0x140169777: cmp r10, r11
0x14016977a: jae 0x14016998e
0x140169780: mov r10, qword ptr [r14 + r10*8]
0x140169784: test r10, r10
0x140169787: je 0x14016998e
0x14016978d: not r10
0x140169790: imul r10, r10, 0x38
0x140169794: cmp byte ptr [r12 + r10 + 0x30], 0
0x14016979a: je 0x14016998e
0x1401697a0: mov qword ptr [rsp + 0x100], rdi
0x1401697a8: mov r13, qword ptr [rsi + 0x158]
0x1401697af: cmp r13, r11
0x1401697b2: jae 0x14016998e
0x1401697b8: mov r11, qword ptr [r14 + r13*8]
0x1401697bc: test r11, r11
0x1401697bf: je 0x14016998e
0x1401697c5: not r11
0x1401697c8: imul r11, r11, 0x38
0x1401697cc: cmp byte ptr [r12 + r11 + 0x30], 0
0x1401697d2: je 0x14016998e
0x1401697d8: add r9, r12
0x1401697db: mov r14, qword ptr [r9 + 0x10]
0x1401697df: add r10, r12
0x1401697e2: mov r13, qword ptr [r10 + 0x10]
0x1401697e6: add r11, r12
0x1401697e9: mov r12, qword ptr [r11 + 0x10]
0x1401697ed: lea rdi, [rsi + 0x10]
0x1401697f1: mov qword ptr [rsp + 0x48], rdi
0x1401697f6: mov qword ptr [rsp + 0x50], rbx
0x1401697fb: mov dword ptr [rsp + 0x58], r15d
0x140169800: mov dword ptr [rsp + 0x5c], ebp
0x140169804: mov qword ptr [rsp + 0x60], rcx
0x140169809: lea rcx, [rax + 0x2c]
0x14016980d: add rax, 0x28
0x140169811: mov qword ptr [rsp + 0x68], rax
0x140169816: mov qword ptr [rsp + 0x70], rcx
0x14016981b: mov dword ptr [rsp + 0x78], r15d
0x140169820: mov dword ptr [rsp + 0x7c], ebp
0x140169824: mov qword ptr [rsp + 0x80], r8
0x14016982c: lea rax, [rdx + 0x2c]
0x140169830: add rdx, 0x28
0x140169834: mov qword ptr [rsp + 0x88], rdx
0x14016983c: mov qword ptr [rsp + 0x90], rax
0x140169844: mov dword ptr [rsp + 0x98], r15d
0x14016984c: mov dword ptr [rsp + 0x9c], ebp
0x140169853: mov qword ptr [rsp + 0xa0], r14
0x14016985b: lea rax, [r9 + 0x2c]
0x14016985f: add r9, 0x28
0x140169863: mov qword ptr [rsp + 0xa8], r9
0x14016986b: mov qword ptr [rsp + 0xb0], rax
0x140169873: mov dword ptr [rsp + 0xb8], r15d
0x14016987b: mov dword ptr [rsp + 0xbc], ebp
0x140169882: mov qword ptr [rsp + 0xc0], r13
0x14016988a: lea rax, [r10 + 0x2c]
0x14016988e: add r10, 0x28
0x140169892: mov qword ptr [rsp + 0xc8], r10
0x14016989a: lea rcx, [r11 + 0x28]
0x14016989e: add r11, 0x2c
0x1401698a2: mov qword ptr [rsp + 0xd0], rax
0x1401698aa: lea r8, [rsp + 0x60]
0x1401698af: mov dword ptr [rsp + 0xd8], r15d
0x1401698b7: mov dword ptr [rsp + 0xdc], ebp
0x1401698be: mov qword ptr [rsp + 0xe0], r12
0x1401698c6: lea r9, [rsp + 0x80]
0x1401698ce: mov qword ptr [rsp + 0xe8], rcx
0x1401698d6: lea rax, [rsp + 0xa0]
0x1401698de: mov qword ptr [rsp + 0xf0], r11
0x1401698e6: lea rcx, [rsp + 0xc0]
0x1401698ee: mov dword ptr [rsp + 0xf8], r15d
0x1401698f6: lea rdx, [rsp + 0xe0]
0x1401698fe: mov dword ptr [rsp + 0xfc], ebp
0x140169905: mov qword ptr [rsp + 0x30], rdx
0x14016990a: mov qword ptr [rsp + 0x28], rcx
0x14016990f: mov qword ptr [rsp + 0x20], rax
0x140169914: lea rdx, [rsp + 0x48]
0x140169919: call 0x14015f820
0x14016991e: mov dword ptr [rsi], ebp
0x140169920: mov rax, qword ptr [rsp + 0x100]
0x140169928: mov qword ptr [rax], 0xfffffffffffffffd
0x14016992f: add rsp, 0x108
0x140169936: pop rbx
0x140169937: pop rbp
0x140169938: pop rdi
0x140169939: pop rsi
0x14016993a: pop r12
0x14016993c: pop r13
0x14016993e: pop r14
0x140169940: pop r15
0x140169942: ret 
0x140169943: lea rcx, [rip + 0x605d486]
0x14016994a: lea r8, [rip + 0x605d4df]
0x140169951: mov edx, 0x59
0x140169956: call 0x1461ae010
0x14016995b: ud2 
0x14016995d: add rsi, 8
0x140169961: lea rax, [rip + 0x605d550]
0x140169968: mov qword ptr [rsp + 0x28], rax
0x14016996d: mov qword ptr [rsp + 0x20], 0xdf
0x140169976: lea r9, [rip + 0x605d4cb]
0x14016997d: lea r8, [rsp + 0x48]
0x140169982: xor ecx, ecx
0x140169984: mov rdx, rsi
0x140169987: call 0x1461574ad
0x14016998c: ud2 
0x14016998e: add rsi, 4
0x140169992: mov qword ptr [rsp + 0x48], rsi
0x140169997: lea rax, [rip + 0x506f792]
0x14016999e: mov qword ptr [rsp + 0x50], rax
0x1401699a3: lea rcx, [rsp + 0x47]
0x1401699a8: mov qword ptr [rsp + 0x58], rcx
0x1401699ad: mov qword ptr [rsp + 0x60], rax
0x1401699b2: lea rcx, [rip + 0x605cf07]
0x1401699b9: lea r8, [rip + 0x605cfa0]
0x1401699c0: lea rdx, [rsp + 0x48]
0x1401699c5: call 0x1461ae2d0
0x1401699ca: ud2 
0x1401699cc: add rsi, 4
0x1401699d0: mov qword ptr [rsp + 0x48], rsi
0x1401699d5: lea rax, [rip + 0x506f754]
0x1401699dc: mov qword ptr [rsp + 0x50], rax
0x1401699e1: lea rcx, [rsp + 0x47]
0x1401699e6: mov qword ptr [rsp + 0x58], rcx
0x1401699eb: mov qword ptr [rsp + 0x60], rax
0x1401699f0: lea rcx, [rip + 0x605cec9]
0x1401699f7: lea r8, [rip + 0x605cf7a]
0x1401699fe: lea rdx, [rsp + 0x48]
0x140169a03: call 0x1461ae2d0
0x140169a08: ud2 
