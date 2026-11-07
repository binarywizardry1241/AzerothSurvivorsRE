0x1458e8c5a: 4c898500130000           mov qword ptr [rbp + 0x1300], r8
0x1458e8c61: 498d40ff                 lea rax, [r8 - 1]
0x1458e8c65: 4c39f0                   cmp rax, r14
0x1458e8c68: 48898510130000           mov qword ptr [rbp + 0x1310], rax
0x1458e8c6f: 0f83c8020000             jae 0x1458e8f3d
0x1458e8c75: 4c8ba780090000           mov r12, qword ptr [rdi + 0x980]
0x1458e8c7c: 4869d880090000           imul rbx, rax, 0x980
0x1458e8c83: 498d041c                 lea rax, [r12 + rbx]
0x1458e8c87: 48898508130000           mov qword ptr [rbp + 0x1308], rax
0x1458e8c8e: 4d8b2c1c                 mov r13, qword ptr [r12 + rbx]
0x1458e8c92: 498d141c                 lea rdx, [r12 + rbx]
0x1458e8c96: 4883c208                 add rdx, 8
0x1458e8c9a: 488d8d40090000           lea rcx, [rbp + 0x940]
0x1458e8ca1: 41b878090000             mov r8d, 0x978
0x1458e8ca7: e84fb94200               call 0x145d145fb
0x1458e8cac: 498d141c                 lea rdx, [r12 + rbx]
0x1458e8cb0: 4881c280090000           add rdx, 0x980
0x1458e8cb7: 4d69c780090000           imul r8, r15, 0x980
0x1458e8cbe: 488b8d08130000           mov rcx, qword ptr [rbp + 0x1308]
0x1458e8cc5: e83db94200               call 0x145d14607
0x1458e8cca: 49ffce                   dec r14
0x1458e8ccd: 4c89b788090000           mov qword ptr [rdi + 0x988], r14
0x1458e8cd4: 4983fd02                 cmp r13, 2
0x1458e8cd8: 0f845f020000             je 0x1458e8f3d
0x1458e8cde: 4c896dc0                 mov qword ptr [rbp - 0x40], r13
0x1458e8ce2: 488d4dc8                 lea rcx, [rbp - 0x38]
0x1458e8ce6: 488d9540090000           lea rdx, [rbp + 0x940]
0x1458e8ced: 41b878090000             mov r8d, 0x978
0x1458e8cf3: e803b94200               call 0x145d145fb
0x1458e8cf8: 80bf410c000001           cmp byte ptr [rdi + 0xc41], 1
0x1458e8cff: 4c8bb510130000           mov r14, qword ptr [rbp + 0x1310]
0x1458e8d06: 0f85f6000000             jne 0x1458e8e02
0x1458e8d0c: 488b87400b0000           mov rax, qword ptr [rdi + 0xb40]
0x1458e8d13: 488985c0120000           mov qword ptr [rbp + 0x12c0], rax
0x1458e8d1a: 488d8730060000           lea rax, [rdi + 0x630]
0x1458e8d21: 488b8f38060000           mov rcx, qword ptr [rdi + 0x638]
0x1458e8d28: 488b9740060000           mov rdx, qword ptr [rdi + 0x640]
0x1458e8d2f: 48c7874006000000000000   mov qword ptr [rdi + 0x640], 0
0x1458e8d3a: 48899558090000           mov qword ptr [rbp + 0x958], rdx
0x1458e8d41: 48c1e205                 shl rdx, 5
0x1458e8d45: 4801ca                   add rdx, rcx
0x1458e8d48: 48c7856009000000000000   mov qword ptr [rbp + 0x960], 0
0x1458e8d53: 48898d40090000           mov qword ptr [rbp + 0x940], rcx
0x1458e8d5a: 48899548090000           mov qword ptr [rbp + 0x948], rdx
0x1458e8d61: 48898550090000           mov qword ptr [rbp + 0x950], rax
0x1458e8d68: 488d8f380a0000           lea rcx, [rdi + 0xa38]
0x1458e8d6f: 4c8dbdc0120000           lea r15, [rbp + 0x12c0]
0x1458e8d76: 4c89bd68090000           mov qword ptr [rbp + 0x968], r15
0x1458e8d7d: c6851f13000001           mov byte ptr [rbp + 0x131f], 1
0x1458e8d84: 488d9540090000           lea rdx, [rbp + 0x940]
0x1458e8d8b: e8b0370d00               call 0x1459bc540
0x1458e8d90: 90                       nop
0x1458e8d91: 488d8748060000           lea rax, [rdi + 0x648]
0x1458e8d98: 488b8f50060000           mov rcx, qword ptr [rdi + 0x650]
0x1458e8d9f: 488b9758060000           mov rdx, qword ptr [rdi + 0x658]
0x1458e8da6: 48c7875806000000000000   mov qword ptr [rdi + 0x658], 0
0x1458e8db1: 4c8d0452                 lea r8, [rdx + rdx*2]
0x1458e8db5: 4e8d04c1                 lea r8, [rcx + r8*8]
0x1458e8db9: 48899558090000           mov qword ptr [rbp + 0x958], rdx
0x1458e8dc0: 48c7856009000000000000   mov qword ptr [rbp + 0x960], 0
0x1458e8dcb: 48898d40090000           mov qword ptr [rbp + 0x940], rcx
0x1458e8dd2: 4c898548090000           mov qword ptr [rbp + 0x948], r8
0x1458e8dd9: 48898550090000           mov qword ptr [rbp + 0x950], rax
0x1458e8de0: 488d8f500a0000           lea rcx, [rdi + 0xa50]
0x1458e8de7: 4c89bd68090000           mov qword ptr [rbp + 0x968], r15
0x1458e8dee: c6851f13000001           mov byte ptr [rbp + 0x131f], 1
0x1458e8df5: 488d9540090000           lea rdx, [rbp + 0x940]
0x1458e8dfc: e86f360d00               call 0x1459bc470
0x1458e8e01: 90                       nop
0x1458e8e02: 488d55c0                 lea rdx, [rbp - 0x40]
0x1458e8e06: 4889f9                   mov rcx, rdi
0x1458e8e09: e8c2800300               call 0x145920ed0
0x1458e8e0e: 488b8500130000           mov rax, qword ptr [rbp + 0x1300]
0x1458e8e15: 488987400b0000           mov qword ptr [rdi + 0xb40], rax
0x1458e8e1c: 488b97d0020000           mov rdx, qword ptr [rdi + 0x2d0]
0x1458e8e23: 4c8b87d8020000           mov r8, qword ptr [rdi + 0x2d8]
0x1458e8e2a: c6851f13000001           mov byte ptr [rbp + 0x131f], 1
0x1458e8e31: 488d8dc0120000           lea rcx, [rbp + 0x12c0]
0x1458e8e38: 4989f9                   mov r9, rdi
0x1458e8e3b: e810d8feff               call 0x1458d6650
0x1458e8e40: 90                       nop
0x1458e8e41: c6851e13000001           mov byte ptr [rbp + 0x131e], 1
0x1458e8e48: 4889f9                   mov rcx, rdi
0x1458e8e4b: e8f0810100               call 0x145901040
0x1458e8e50: 90                       nop
0x1458e8e51: 48c787400b000000000000   mov qword ptr [rdi + 0xb40], 0
0x1458e8e5c: 4c8d7dc0                 lea r15, [rbp - 0x40]
0x1458e8e60: 4889f9                   mov rcx, rdi
0x1458e8e63: 4c89fa                   mov rdx, r15
0x1458e8e66: e865800300               call 0x145920ed0
0x1458e8e6b: 488d8d40090000           lea rcx, [rbp + 0x940]
0x1458e8e72: 41b880090000             mov r8d, 0x980
0x1458e8e78: 4c89fa                   mov rdx, r15
0x1458e8e7b: e87bb74200               call 0x145d145fb
0x1458e8e80: 4c8bbf88090000           mov r15, qword ptr [rdi + 0x988]
0x1458e8e87: 4d39f7                   cmp r15, r14
0x1458e8e8a: 0f8298000000             jb 0x1458e8f28
0x1458e8e90: 488d8f78090000           lea rcx, [rdi + 0x978]
0x1458e8e97: 4c3b39                   cmp r15, qword ptr [rcx]
0x1458e8e9a: 7506                     jne 0x1458e8ea2
0x1458e8e9c: e83ff65a00               call 0x145e984e0
0x1458e8ea1: 90                       nop
0x1458e8ea2: 48039f80090000           add rbx, qword ptr [rdi + 0x980]
0x1458e8ea9: 4c89f8                   mov rax, r15
0x1458e8eac: 4c29f0                   sub rax, r14
0x1458e8eaf: 7616                     jbe 0x1458e8ec7
0x1458e8eb1: 488d8b80090000           lea rcx, [rbx + 0x980]
0x1458e8eb8: 4c69c080090000           imul r8, rax, 0x980
0x1458e8ebf: 4889da                   mov rdx, rbx
0x1458e8ec2: e840b74200               call 0x145d14607
0x1458e8ec7: 488d9540090000           lea rdx, [rbp + 0x940]
0x1458e8ece: 41b880090000             mov r8d, 0x980
0x1458e8ed4: 4889d9                   mov rcx, rbx
0x1458e8ed7: e81fb74200               call 0x145d145fb
0x1458e8edc: 49ffc7                   inc r15
0x1458e8edf: 4c89bf88090000           mov qword ptr [rdi + 0x988], r15
