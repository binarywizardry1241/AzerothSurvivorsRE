145949366: 31c0 xor eax, eax
145949368: 41807d7e00 cmp byte ptr [r13 + 0x7e], 0
14594936d: 0f857efdffff jne 0x1459490f1
145949373: f3410f104554 movss xmm0, dword ptr [r13 + 0x54]
145949379: f3410f5c4564 subss xmm0, dword ptr [r13 + 0x64]
14594937f: f30f108d34020000 movss xmm1, dword ptr [rbp + 0x234]
145949387: 0f2ec8 ucomiss xmm1, xmm0
14594938a: 0f82f2000000 jb 0x145949482
145949390: 41c6457e01 mov byte ptr [r13 + 0x7e], 1
145949395: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
14594939c: 483bb528010000 cmp rsi, qword ptr [rbp + 0x128]
1459493a3: 0f8584000000 jne 0x14594942d
1459493a9: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
1459493b0: 48898568020000 mov qword ptr [rbp + 0x268], rax
1459493b7: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
1459493be: 48898560020000 mov qword ptr [rbp + 0x260], rax
1459493c5: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
1459493cc: 48898558020000 mov qword ptr [rbp + 0x258], rax
1459493d3: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
1459493da: 48898550020000 mov qword ptr [rbp + 0x250], rax
1459493e1: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
1459493e8: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
1459493ef: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
1459493f6: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
1459493fd: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
145949404: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14594940b: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
145949412: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
145949419: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145949420: 488d8d28010000 lea rcx, [rbp + 0x128]
145949427: e814b82a00 call 0x145bf4c40
14594942c: 90 nop
14594942d: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
145949434: 4c8934f0 mov qword ptr [rax + rsi*8], r14
145949438: 48ffc6 inc rsi
14594943b: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
145949442: eb3e jmp 0x145949482
