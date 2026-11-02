1458c2220: 55 push rbp
1458c2221: 4156 push r14
1458c2223: 56 push rsi
1458c2224: 57 push rdi
1458c2225: 53 push rbx
1458c2226: 4881ec80000000 sub rsp, 0x80
1458c222d: 488dac2480000000 lea rbp, [rsp + 0x80]
1458c2235: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458c223d: 4489cf mov edi, r9d
1458c2240: 4489c3 mov ebx, r8d
1458c2243: 4989d6 mov r14, rdx
1458c2246: 4889ce mov rsi, rcx
1458c2249: e8b2ff73fa call 0x140002200
1458c224e: b920000000 mov ecx, 0x20
1458c2253: ba01000000 mov edx, 1
1458c2258: e863ff73fa call 0x1400021c0
1458c225d: 4885c0 test rax, rax
1458c2260: 0f84a4010000 je 0x1458c240a
1458c2266: 66c745e83101 mov word ptr [rbp - 0x18], 0x131
1458c226c: 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
1458c2274: 488945d8 mov qword ptr [rbp - 0x28], rax
1458c2278: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
1458c2280: 488d55d0 lea rdx, [rbp - 0x30]
1458c2284: 4c89f1 mov rcx, r14
1458c2287: e854d00000 call 0x1458cf2e0
1458c228c: 90 nop
1458c228d: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458c2291: 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
1458c2295: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1458c2299: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c229d: 488d55b0 lea rdx, [rbp - 0x50]
1458c22a1: 4c89f1 mov rcx, r14
1458c22a4: e837d00000 call 0x1458cf2e0
1458c22a9: 90 nop
1458c22aa: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c22ae: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
1458c22b2: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
1458c22b6: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c22ba: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c22be: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c22c2: 4829d0 sub rax, rdx
1458c22c5: 4883f803 cmp rax, 3
1458c22c9: 0f86c3000000 jbe 0x1458c2392
1458c22cf: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c22d3: 891c10 mov dword ptr [rax + rdx], ebx
1458c22d6: 4883c204 add rdx, 4
1458c22da: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c22de: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c22e2: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c22e6: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c22ea: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c22ee: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c22f2: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c22f6: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c22fa: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c22fe: 4829d0 sub rax, rdx
1458c2301: 4883f801 cmp rax, 1
1458c2305: 0f86af000000 jbe 0x1458c23ba
1458c230b: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c230f: 66c704100200 mov word ptr [rax + rdx], 2
1458c2315: 4883c202 add rdx, 2
1458c2319: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c231d: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c2321: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2325: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c2329: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c232d: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c2331: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c2335: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c2339: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c233d: 4829d0 sub rax, rdx
1458c2340: 4883f803 cmp rax, 3
1458c2344: 0f8698000000 jbe 0x1458c23e2
1458c234a: 4c8b4550 mov r8, qword ptr [rbp + 0x50]
1458c234e: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2352: 893c10 mov dword ptr [rax + rdx], edi
1458c2355: 4883c204 add rdx, 4
1458c2359: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c235d: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2361: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2365: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2369: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c236d: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2371: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2375: 488d55b0 lea rdx, [rbp - 0x50]
1458c2379: 4889f1 mov rcx, rsi
1458c237c: e87faf0000 call 0x1458cd300
1458c2381: 4889f0 mov rax, rsi
1458c2384: 4881c480000000 add rsp, 0x80
1458c238b: 5b pop rbx
1458c238c: 5f pop rdi
1458c238d: 5e pop rsi
1458c238e: 415e pop r14
1458c2390: 5d pop rbp
1458c2391: c3 ret
1458c2392: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c239b: 488d4dd0 lea rcx, [rbp - 0x30]
1458c239f: 41b804000000 mov r8d, 4
1458c23a5: 41b901000000 mov r9d, 1
1458c23ab: e8c0853300 call 0x145bfa970
1458c23b0: 90 nop
1458c23b1: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c23b5: e915ffffff jmp 0x1458c22cf
1458c23ba: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c23c3: 488d4db0 lea rcx, [rbp - 0x50]
1458c23c7: 41b802000000 mov r8d, 2
1458c23cd: 41b901000000 mov r9d, 1
1458c23d3: e898853300 call 0x145bfa970
1458c23d8: 90 nop
1458c23d9: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c23dd: e929ffffff jmp 0x1458c230b
1458c23e2: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c23eb: 488d4dd0 lea rcx, [rbp - 0x30]
1458c23ef: 41b804000000 mov r8d, 4
1458c23f5: 41b901000000 mov r9d, 1
1458c23fb: e870853300 call 0x145bfa970
1458c2400: 90 nop
1458c2401: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c2405: e940ffffff jmp 0x1458c234a
1458c240a: b901000000 mov ecx, 1
1458c240f: ba20000000 mov edx, 0x20
1458c2414: e8a26e4d00 call 0x145d992bb
1458c2419: 0f0b ud2
