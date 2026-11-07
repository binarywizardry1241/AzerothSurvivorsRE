145c22000: 4157 push r15
145c22002: 4156 push r14
145c22004: 4155 push r13
145c22006: 4154 push r12
145c22008: 56 push rsi
145c22009: 57 push rdi
145c2200a: 55 push rbp
145c2200b: 53 push rbx
145c2200c: 4883ec48 sub rsp, 0x48
145c22010: 660f7f742430 movdqa xmmword ptr [rsp + 0x30], xmm6
145c22016: 4c8b3a mov r15, qword ptr [rdx]
145c22019: 488b5a08 mov rbx, qword ptr [rdx + 8]
145c2201d: 4939df cmp r15, rbx
145c22020: 0f84c3030000 je 0x145c223e9
145c22026: 49bea38b2ebae8a28b2e movabs r14, 0x2e8ba2e8ba2e8ba3
145c22030: 660f6f35e82a5500 movdqa xmm6, xmmword ptr [rip + 0x552ae8]
145c22038: 4d89f9 mov r9, r15
145c2203b: 0f1f440000 nop dword ptr [rax + rax]
145c22040: 4180b98309000001 cmp byte ptr [r9 + 0x983], 1
145c22048: 7516 jne 0x145c22060
145c2204a: 4981c190090000 add r9, 0x990
145c22051: 4939d9 cmp r9, rbx
145c22054: 75ea jne 0x145c22040
145c22056: e98e030000 jmp 0x145c223e9
145c2205b: 0f1f440000 nop dword ptr [rax + rax]
145c22060: 4d8db990090000 lea r15, [r9 + 0x990]
145c22067: 4c893a mov qword ptr [rdx], r15
145c2206a: 498b8158030000 mov rax, qword ptr [r9 + 0x358]
145c22071: 4885c0 test rax, rax
145c22074: 7441 je 0x145c220b7
145c22076: 4d8b9150030000 mov r10, qword ptr [r9 + 0x350]
145c2207d: 4c6bd858 imul r11, rax, 0x58
145c22081: 418b7a08 mov edi, dword ptr [r10 + 8]
145c22085: 4883f801 cmp rax, 1
145c22089: 0f84b4010000 je 0x145c22243
145c2208f: 4889d6 mov rsi, rdx
145c22092: 4d8d43a8 lea r8, [r11 - 0x58]
145c22096: 4c89c0 mov rax, r8
145c22099: 49f7e6 mul r14
145c2209c: 4889d0 mov rax, rdx
145c2209f: 48c1e804 shr rax, 4
145c220a3: 4981f8c0020000 cmp r8, 0x2c0
145c220aa: 732e jae 0x145c220da
145c220ac: 4531c0 xor r8d, r8d
145c220af: 4889f2 mov rdx, rsi
145c220b2: e961010000 jmp 0x145c22218
145c220b7: 410fb6a93c030000 movzx ebp, byte ptr [r9 + 0x33c]
145c220bf: 4531e4 xor r12d, r12d
145c220c2: 498b81d8010000 mov rax, qword ptr [r9 + 0x1d8]
145c220c9: 4885c0 test rax, rax
145c220cc: 0f85b8010000 jne 0x145c2228a
145c220d2: 4531ed xor r13d, r13d
145c220d5: e95f020000 jmp 0x145c22339
145c220da: 4989c0 mov r8, rax
145c220dd: 4983e0f8 and r8, 0xfffffffffffffff8
145c220e1: 660f6ec7 movd xmm0, edi
145c220e5: 660f70c000 pshufd xmm0, xmm0, 0
145c220ea: 498d92c8020000 lea rdx, [r10 + 0x2c8]
145c220f1: 4c89c7 mov rdi, r8
145c220f4: 660f6fc8 movdqa xmm1, xmm0
145c220f8: 0f1f840000000000 nop dword ptr [rax + rax]
145c22100: 660f6e92a0feffff movd xmm2, dword ptr [rdx - 0x160]
145c22108: 660f6e9a48feffff movd xmm3, dword ptr [rdx - 0x1b8]
145c22110: 660f62da punpckldq xmm3, xmm2
145c22114: 660f6e92f0fdffff movd xmm2, dword ptr [rdx - 0x210]
145c2211c: 660f6ea298fdffff movd xmm4, dword ptr [rdx - 0x268]
145c22124: 660f62e2 punpckldq xmm4, xmm2
145c22128: 660f6ce3 punpcklqdq xmm4, xmm3
145c2212c: 660f6e12 movd xmm2, dword ptr [rdx]
145c22130: 660f6e5aa8 movd xmm3, dword ptr [rdx - 0x58]
145c22135: 660f62da punpckldq xmm3, xmm2
145c22139: 660f6e9250ffffff movd xmm2, dword ptr [rdx - 0xb0]
145c22141: 660f6eaaf8feffff movd xmm5, dword ptr [rdx - 0x108]
145c22149: 660f62ea punpckldq xmm5, xmm2
145c2214d: 660f6ceb punpcklqdq xmm5, xmm3
145c22151: 660f6fd4 movdqa xmm2, xmm4
145c22155: 660fefd6 pxor xmm2, xmm6
145c22159: 660f6fd8 movdqa xmm3, xmm0
145c2215d: 660fefc6 pxor xmm0, xmm6
145c22161: 660f66c2 pcmpgtd xmm0, xmm2
145c22165: 660fdbd8 pand xmm3, xmm0
145c22169: 660fdfc4 pandn xmm0, xmm4
145c2216d: 660febc3 por xmm0, xmm3
145c22171: 660f6fd5 movdqa xmm2, xmm5
145c22175: 660fefd6 pxor xmm2, xmm6
145c22179: 660f6fd9 movdqa xmm3, xmm1
145c2217d: 660fefce pxor xmm1, xmm6
145c22181: 660f66ca pcmpgtd xmm1, xmm2
145c22185: 660fdbd9 pand xmm3, xmm1
145c22189: 660fdfcd pandn xmm1, xmm5
145c2218d: 660febcb por xmm1, xmm3
145c22191: 4881c2c0020000 add rdx, 0x2c0
145c22198: 4883c7f8 add rdi, -8
145c2219c: 0f855effffff jne 0x145c22100
145c221a2: 660f6fd1 movdqa xmm2, xmm1
145c221a6: 660fefd6 pxor xmm2, xmm6
145c221aa: 660f6fd8 movdqa xmm3, xmm0
145c221ae: 660fefde pxor xmm3, xmm6
145c221b2: 660f66da pcmpgtd xmm3, xmm2
145c221b6: 660fdbc3 pand xmm0, xmm3
145c221ba: 660fdfd9 pandn xmm3, xmm1
145c221be: 660febd8 por xmm3, xmm0
145c221c2: 660f70c3ee pshufd xmm0, xmm3, 0xee
145c221c7: 660f6fcb movdqa xmm1, xmm3
145c221cb: 660fefce pxor xmm1, xmm6
145c221cf: 660f6fd0 movdqa xmm2, xmm0
145c221d3: 660fefd6 pxor xmm2, xmm6
145c221d7: 660f66ca pcmpgtd xmm1, xmm2
145c221db: 660fdbd9 pand xmm3, xmm1
145c221df: 660fdfc8 pandn xmm1, xmm0
145c221e3: 660febcb por xmm1, xmm3
145c221e7: 660f70c155 pshufd xmm0, xmm1, 0x55
145c221ec: 660f6fd1 movdqa xmm2, xmm1
145c221f0: 660fefd6 pxor xmm2, xmm6
145c221f4: 660f6fd8 movdqa xmm3, xmm0
145c221f8: 660fefde pxor xmm3, xmm6
145c221fc: 660f66d3 pcmpgtd xmm2, xmm3
145c22200: 660fdbca pand xmm1, xmm2
145c22204: 660fdfd0 pandn xmm2, xmm0
145c22208: 660febd1 por xmm2, xmm1
145c2220c: 660f7ed7 movd edi, xmm2
145c22210: 4c39c0 cmp rax, r8
145c22213: 4889f2 mov rdx, rsi
145c22216: 742b je 0x145c22243
145c22218: 4c29c0 sub rax, r8
145c2221b: 4d6bc058 imul r8, r8, 0x58
145c2221f: 4d01d0 add r8, r10
145c22222: 4983c060 add r8, 0x60
145c22226: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c22230: 89fe mov esi, edi
145c22232: 418b38 mov edi, dword ptr [r8]
145c22235: 39fe cmp esi, edi
145c22237: 0f47fe cmova edi, esi
145c2223a: 4983c058 add r8, 0x58
145c2223e: 48ffc8 dec rax
145c22241: 75ed jne 0x145c22230
145c22243: 410fb6a93c030000 movzx ebp, byte ptr [r9 + 0x33c]
145c2224b: 498d4258 lea rax, [r10 + 0x58]
145c2224f: 4531c0 xor r8d, r8d
145c22252: 4c89de mov rsi, r11
145c22255: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c22260: 3978b0 cmp dword ptr [rax - 0x50], edi
145c22263: 0f8409010000 je 0x145c22372
145c22269: 4883c058 add rax, 0x58
145c2226d: 4983c058 add r8, 0x58
145c22271: 4883c6a8 add rsi, -0x58
145c22275: 75e9 jne 0x145c22260
145c22277: 4531e4 xor r12d, r12d
145c2227a: 498b81d8010000 mov rax, qword ptr [r9 + 0x1d8]
145c22281: 4885c0 test rax, rax
145c22284: 0f8448feffff je 0x145c220d2
145c2228a: 4d8b81d0010000 mov r8, qword ptr [r9 + 0x1d0]
145c22291: 48c1e004 shl rax, 4
145c22295: 4531c9 xor r9d, r9d
145c22298: eb0f jmp 0x145c222a9
145c2229a: 660f1f440000 nop word ptr [rax + rax]
145c222a0: 4983c110 add r9, 0x10
145c222a4: 4c39c8 cmp rax, r9
145c222a7: 7437 je 0x145c222e0
145c222a9: 4f8b1408 mov r10, qword ptr [r8 + r9]
145c222ad: 49837a380b cmp qword ptr [r10 + 0x38], 0xb
145c222b2: 75ec jne 0x145c222a0
145c222b4: 4d8b5230 mov r10, qword ptr [r10 + 0x30]
145c222b8: 4d8b1a mov r11, qword ptr [r10]
145c222bb: 4c331d2a459a01 xor r11, qword ptr [rip + 0x19a452a]
145c222c2: 4d8b5203 mov r10, qword ptr [r10 + 3]
145c222c6: 4c331522459a01 xor r10, qword ptr [rip + 0x19a4522]
145c222cd: 4d09da or r10, r11
145c222d0: 75ce jne 0x145c222a0
145c222d2: 43807c080800 cmp byte ptr [r8 + r9 + 8], 0
145c222d8: 410f95c5 setne r13b
145c222dc: eb05 jmp 0x145c222e3
145c222de: 6690 nop
145c222e0: 4531ed xor r13d, r13d
145c222e3: 4531c9 xor r9d, r9d
145c222e6: eb11 jmp 0x145c222f9
145c222e8: 0f1f840000000000 nop dword ptr [rax + rax]
145c222f0: 4983c110 add r9, 0x10
145c222f4: 4c39c8 cmp rax, r9
145c222f7: 7440 je 0x145c22339
145c222f9: 4f8b1408 mov r10, qword ptr [r8 + r9]
145c222fd: 49837a380a cmp qword ptr [r10 + 0x38], 0xa
145c22302: 75ec jne 0x145c222f0
145c22304: 4d8b5230 mov r10, qword ptr [r10 + 0x30]
145c22308: 4d8b1a mov r11, qword ptr [r10]
145c2230b: 4c331d05489a01 xor r11, qword ptr [rip + 0x19a4805]
145c22312: 450fb75208 movzx r10d, word ptr [r10 + 8]
145c22317: 6644331500489a01 xor r10w, word ptr [rip + 0x19a4800]
145c2231f: 450fb7d2 movzx r10d, r10w
145c22323: 4d09da or r10, r11
145c22326: 75c8 jne 0x145c222f0
145c22328: 43807c080800 cmp byte ptr [r8 + r9 + 8], 0
145c2232e: 0f95c0 setne al
145c22331: 00c0 add al, al
145c22333: 4408e8 or al, r13b
145c22336: 4189c5 mov r13d, eax
145c22339: 488b7110 mov rsi, qword ptr [rcx + 0x10]
145c2233d: 483b31 cmp rsi, qword ptr [rcx]
145c22340: 746f je 0x145c223b1
145c22342: 410fb6c5 movzx eax, r13b
145c22346: 48c1e028 shl rax, 0x28
145c2234a: 440fb6c5 movzx r8d, bpl
145c2234e: 49c1e020 shl r8, 0x20
145c22352: 4909c0 or r8, rax
145c22355: 4d09e0 or r8, r12
145c22358: 488b4108 mov rax, qword ptr [rcx + 8]
145c2235c: 4c8904f0 mov qword ptr [rax + rsi*8], r8
145c22360: 48ffc6 inc rsi
145c22363: 48897110 mov qword ptr [rcx + 0x10], rsi
145c22367: 4939df cmp r15, rbx
145c2236a: 0f85c8fcffff jne 0x145c22038
145c22370: eb77 jmp 0x145c223e9
145c22372: 4883fe58 cmp rsi, 0x58
145c22376: 741c je 0x145c22394
145c22378: 4983c3a8 add r11, -0x58
145c2237c: 0f1f4000 nop dword ptr [rax]
145c22380: 43397c0260 cmp dword ptr [r10 + r8 + 0x60], edi
145c22385: 0f84ecfeffff je 0x145c22277
145c2238b: 4983c058 add r8, 0x58
145c2238f: 4d39c3 cmp r11, r8
145c22392: 75ec jne 0x145c22380
145c22394: 488b40a8 mov rax, qword ptr [rax - 0x58]
145c22398: 448b6040 mov r12d, dword ptr [rax + 0x40]
145c2239c: 498b81d8010000 mov rax, qword ptr [r9 + 0x1d8]
145c223a3: 4885c0 test rax, rax
145c223a6: 0f85defeffff jne 0x145c2228a
145c223ac: e921fdffff jmp 0x145c220d2
145c223b1: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
145c223ba: 41b801000000 mov r8d, 1
145c223c0: 41b904000000 mov r9d, 4
145c223c6: 4889cf mov rdi, rcx
145c223c9: 4989d6 mov r14, rdx
145c223cc: 4889f2 mov rdx, rsi
145c223cf: e81c1d3700 call 0x145f940f0
145c223d4: 4889f9 mov rcx, rdi
145c223d7: 4c89f2 mov rdx, r14
145c223da: 49bea38b2ebae8a28b2e movabs r14, 0x2e8ba2e8ba2e8ba3
145c223e4: e959ffffff jmp 0x145c22342
145c223e9: 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
145c223ee: 4883c448 add rsp, 0x48
145c223f2: 5b pop rbx
145c223f3: 5d pop rbp
145c223f4: 5f pop rdi
145c223f5: 5e pop rsi
145c223f6: 415c pop r12
145c223f8: 415d pop r13
145c223fa: 415e pop r14
145c223fc: 415f pop r15
145c223fe: c3 ret
