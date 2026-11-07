; hud-default
1402b203c 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1402b2045 488d155e0cc705 lea rdx, [rip + 0x5c70c5e]
1402b204c 41b809000000 mov r8d, 9
1402b2052 4889f1 mov rcx, rsi
1402b2055 4989d9 mov r9, rbx
1402b2058 e8d3b23100 call 0x1405cd330

; hud-read-normalize
1402b245f 4c8d054408c705 lea r8, [rip + 0x5c70844]
1402b2466 488d4da8 lea rcx, [rbp - 0x58]
1402b246a 41b909000000 mov r9d, 9
1402b2470 4889f2 mov rdx, rsi
1402b2473 e8a8e23100 call 0x1405d0720
1402b2478 488b45a8 mov rax, qword ptr [rbp - 0x58]
1402b247c 4883f8ff cmp rax, -1
1402b2480 744e je 0x1402b24d0
1402b2482 488985a8000000 mov qword ptr [rbp + 0xa8], rax
1402b2489 488b4db0 mov rcx, qword ptr [rbp - 0x50]
1402b248d 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1402b2491 48898d90000000 mov qword ptr [rbp + 0x90], rcx
1402b2498 e803b6f3ff call 0x1401edaa0
1402b249d 90 nop
1402b249e b101 mov cl, 1
1402b24a0 4883fa01 cmp rdx, 1
1402b24a4 7506 jne 0x1402b24ac
1402b24a6 803830 cmp byte ptr [rax], 0x30
1402b24a9 0f95c1 setne cl
1402b24ac 888db0000000 mov byte ptr [rbp + 0xb0], cl

; hud-resource-write
1402b285e 0fb68db0000000 movzx ecx, byte ptr [rbp + 0xb0]
1402b2865 884809 mov byte ptr [rax + 9], cl

; bootstrap-table
1458494c0 488d15e9e17b01 lea rdx, [rip + 0x17be1e9]
1458494c7 4c8d0522e37b01 lea r8, [rip + 0x17be322]
1458494ce 488d4dd0 lea rcx, [rbp - 0x30]
1458494d2 e8f9a91800 call 0x1459d3ed0
1458494d7 488b7dd8 mov rdi, qword ptr [rbp - 0x28]
1458494db 488b5de0 mov rbx, qword ptr [rbp - 0x20]
1458494df 48c744242002000000 mov qword ptr [rsp + 0x20], 2
1458494e8 4c8d0da9364801 lea r9, [rip + 0x14836a9]
1458494ef 488d4db8 lea rcx, [rbp - 0x48]
1458494f3 4889fa mov rdx, rdi
1458494f6 4989d8 mov r8, rbx
1458494f9 e8f26c0700 call 0x1458c01f0
1458494fe 90 nop
1458494ff 488b45b8 mov rax, qword ptr [rbp - 0x48]
145849503 488945f0 mov qword ptr [rbp - 0x10], rax
145849507 488b4dc0 mov rcx, qword ptr [rbp - 0x40]
14584950b 488b45c8 mov rax, qword ptr [rbp - 0x38]
14584950f 4889442430 mov qword ptr [rsp + 0x30], rax
145849514 48894de8 mov qword ptr [rbp - 0x18], rcx
145849518 48894c2428 mov qword ptr [rsp + 0x28], rcx
14584951d 48c74424200d000000 mov qword ptr [rsp + 0x20], 0xd
145849526 488d15c3e27b01 lea rdx, [rip + 0x17be2c3]
14584952d 4c8d0dd6237c01 lea r9, [rip + 0x17c23d6]
145849534 41b81a410000 mov r8d, 0x411a
14584953a 4889f1 mov rcx, rsi
14584953d e88e13ffff call 0x14583a8d0

; solo-party-gate
1458f5310 55 push rbp
1458f5311 4157 push r15
1458f5313 4156 push r14
1458f5315 4155 push r13
1458f5317 4154 push r12
1458f5319 56 push rsi
1458f531a 57 push rdi
1458f531b 53 push rbx
1458f531c 4881ece8000000 sub rsp, 0xe8
1458f5323 488dac2480000000 lea rbp, [rsp + 0x80]
1458f532b 48c74560feffffff mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
1458f5333 4889ce mov rsi, rcx
1458f5336 80ba410c000000 cmp byte ptr [rdx + 0xc41], 0
1458f533d 0f8405010000 je 0x1458f5448

; solo-empty-return
1458f5448 48c70600000000 mov qword ptr [rsi], 0
1458f544f 48c7460801000000 mov qword ptr [rsi + 8], 1
1458f5457 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1458f545f e94c030000 jmp 0x1458f57b0

; poll-gate
14587d6e4 f20f5c8040170000 subsd xmm0, qword ptr [rax + 0x1740]
14587d6ec 660f2e05dcee7a01 ucomisd xmm0, qword ptr [rip + 0x17aeedc]
14587d6f4 0f8297070000 jb 0x14587de91
14587d6fa 83b8580c000001 cmp dword ptr [rax + 0xc58], 1
14587d701 770d ja 0x14587d710
14587d703 f680490f000001 test byte ptr [rax + 0xf49], 1
14587d70a 0f8581070000 jne 0x14587de91
14587d710 f20f11b040170000 movsd qword ptr [rax + 0x1740], xmm6

; changed-byte-gate
14587dc9d 488bb5000e0000 mov rsi, qword ptr [rbp + 0xe00]
14587dca4 4a3b5c2610 cmp rbx, qword ptr [rsi + r12 + 0x10]
14587dca9 7518 jne 0x14587dcc3
14587dcab 4a8b542608 mov rdx, qword ptr [rsi + r12 + 8]
14587dcb0 4889f9 mov rcx, rdi
14587dcb3 4989d8 mov r8, rbx
14587dcb6 e846694900 call 0x145d14601
14587dcbb 85c0 test eax, eax
14587dcbd 0f84a2000000 je 0x14587dd65
