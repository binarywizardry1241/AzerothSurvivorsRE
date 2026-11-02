1458f2f2a: f3470f58641004 addss xmm12, dword ptr [r8 + r10 + 4]
1458f2f31: 4983c208 add r10, 8
1458f2f35: 4c39d2 cmp rdx, r10
1458f2f38: 0f8544010000 jne 0x1458f3082
1458f2f3e: e927ffffff jmp 0x1458f2e6a
1458f2f43: f3470f584c1004 addss xmm9, dword ptr [r8 + r10 + 4]
1458f2f4a: 4983c208 add r10, 8
1458f2f4e: 4c39d2 cmp rdx, r10
1458f2f51: 0f852b010000 jne 0x1458f3082
1458f2f57: e90effffff jmp 0x1458f2e6a
1458f2f5c: f30f1095a8000000 movss xmm2, dword ptr [rbp + 0xa8]
1458f2f64: f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
1458f2f6b: f30f1195a8000000 movss dword ptr [rbp + 0xa8], xmm2
1458f2f73: 4983c208 add r10, 8
1458f2f77: 4c39d2 cmp rdx, r10
1458f2f7a: 0f8502010000 jne 0x1458f3082
1458f2f80: e9e5feffff jmp 0x1458f2e6a
1458f2f85: f3430f586c1004 addss xmm5, dword ptr [r8 + r10 + 4]
1458f2f8c: 4983c208 add r10, 8
1458f2f90: 4c39d2 cmp rdx, r10
1458f2f93: 0f85e9000000 jne 0x1458f3082
1458f2f99: e9ccfeffff jmp 0x1458f2e6a
1458f2f9e: f3430f58741004 addss xmm6, dword ptr [r8 + r10 + 4]
1458f2fa5: 4983c208 add r10, 8
1458f2fa9: 4c39d2 cmp rdx, r10
1458f2fac: 0f85d0000000 jne 0x1458f3082
1458f2fb2: e9b3feffff jmp 0x1458f2e6a
1458f2fb7: f3430f584c1004 addss xmm1, dword ptr [r8 + r10 + 4]
1458f2fbe: 4983c208 add r10, 8
1458f2fc2: 4c39d2 cmp rdx, r10
1458f2fc5: 0f85b7000000 jne 0x1458f3082
1458f2fcb: e99afeffff jmp 0x1458f2e6a
1458f2fd0: f3430f585c1004 addss xmm3, dword ptr [r8 + r10 + 4]
1458f2fd7: 4983c208 add r10, 8
1458f2fdb: 4c39d2 cmp rdx, r10
1458f2fde: 0f859e000000 jne 0x1458f3082
1458f2fe4: e981feffff jmp 0x1458f2e6a
1458f2fe9: f3470f58541004 addss xmm10, dword ptr [r8 + r10 + 4]
1458f2ff0: 4983c208 add r10, 8
1458f2ff4: 4c39d2 cmp rdx, r10
1458f2ff7: 0f8585000000 jne 0x1458f3082
1458f2ffd: e968feffff jmp 0x1458f2e6a
1458f3002: 410f28d5 movaps xmm2, xmm13
1458f3006: f3470f106c1004 movss xmm13, dword ptr [r8 + r10 + 4]
1458f300d: f3440f582d4aa24b00 addss xmm13, dword ptr [rip + 0x4ba24a]
1458f3016: f3440f59ea mulss xmm13, xmm2
1458f301b: 4983c208 add r10, 8
1458f301f: 4c39d2 cmp rdx, r10
1458f3022: 755e jne 0x1458f3082
1458f3024: e941feffff jmp 0x1458f2e6a
1458f3029: f3470f58741004 addss xmm14, dword ptr [r8 + r10 + 4]
1458f3030: 4983c208 add r10, 8
1458f3034: 4c39d2 cmp rdx, r10
1458f3037: 7549 jne 0x1458f3082
1458f3039: e92cfeffff jmp 0x1458f2e6a
1458f303e: 0f285550 movaps xmm2, xmmword ptr [rbp + 0x50]
1458f3042: f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
1458f3049: 0f295550 movaps xmmword ptr [rbp + 0x50], xmm2
1458f304d: 4983c208 add r10, 8
1458f3051: 4c39d2 cmp rdx, r10
1458f3054: 752c jne 0x1458f3082
1458f3056: e90ffeffff jmp 0x1458f2e6a
1458f305b: 4303441004 add eax, dword ptr [r8 + r10 + 4]
1458f3060: 4983c208 add r10, 8
1458f3064: 4c39d2 cmp rdx, r10
1458f3067: 7519 jne 0x1458f3082
1458f3069: e9fcfdffff jmp 0x1458f2e6a
1458f306e: f3470f58441004 addss xmm8, dword ptr [r8 + r10 + 4]
1458f3075: 4983c208 add r10, 8
1458f3079: 4c39d2 cmp rdx, r10
1458f307c: 0f84e8fdffff je 0x1458f2e6a
1458f3082: 478b1c10 mov r11d, dword ptr [r8 + r10]
1458f3086: 4f631c99 movsxd r11, dword ptr [r9 + r11*4]
1458f308a: 4d01cb add r11, r9
1458f308d: 41ffe3 jmp r11
