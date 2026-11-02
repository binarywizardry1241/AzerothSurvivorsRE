145951091: f3410f107574 movss xmm6, dword ptr [r13 + 0x74]
145951097: 0f57c0 xorps xmm0, xmm0
14595109a: 0f2ef0 ucomiss xmm6, xmm0
14595109d: 0f97c1 seta cl
1459510a0: 418b4530 mov eax, dword ptr [r13 + 0x30]
1459510a4: 85c0 test eax, eax
1459510a6: 0f94c2 sete dl
1459510a9: 84d1 test cl, dl
1459510ab: 0f84f4000000 je 0x1459511a5
1459510b1: f3450f107534 movss xmm14, dword ptr [r13 + 0x34]
1459510b7: 8b4608 mov eax, dword ptr [rsi + 8]
1459510ba: 8985e8010000 mov dword ptr [rbp + 0x1e8], eax
1459510c0: 488b06 mov rax, qword ptr [rsi]
1459510c3: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
1459510ca: 418b7d5c mov edi, dword ptr [r13 + 0x5c]
1459510ce: 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
1459510d5: 483bb580000000 cmp rsi, qword ptr [rbp + 0x80]
1459510dc: 0f8584000000 jne 0x145951166
1459510e2: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
1459510e9: 48898568020000 mov qword ptr [rbp + 0x268], rax
1459510f0: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
1459510f7: 48898560020000 mov qword ptr [rbp + 0x260], rax
1459510fe: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
145951105: 48898558020000 mov qword ptr [rbp + 0x258], rax
14595110c: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
145951113: 48898550020000 mov qword ptr [rbp + 0x250], rax
14595111a: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
145951121: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
145951128: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
14595112f: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
145951136: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14595113d: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
145951144: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
14595114b: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
145951152: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
145951159: 488d8d80000000 lea rcx, [rbp + 0x80]
145951160: e8fb512d00 call 0x145c26360
145951165: 90 nop
145951166: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
14595116d: 488d0c76 lea rcx, [rsi + rsi*2]
145951171: 8b95e8010000 mov edx, dword ptr [rbp + 0x1e8]
145951177: 8954c808 mov dword ptr [rax + rcx*8 + 8], edx
14595117b: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
145951182: 488914c8 mov qword ptr [rax + rcx*8], rdx
145951186: f3440f1174c80c movss dword ptr [rax + rcx*8 + 0xc], xmm14
14595118d: f30f1174c810 movss dword ptr [rax + rcx*8 + 0x10], xmm6
145951193: 897cc814 mov dword ptr [rax + rcx*8 + 0x14], edi
145951197: 48ffc6 inc rsi
14595119a: 4889b590000000 mov qword ptr [rbp + 0x90], rsi
1459511a1: 418b4530 mov eax, dword ptr [r13 + 0x30]
