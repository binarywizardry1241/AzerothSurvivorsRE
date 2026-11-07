# destroy-command-publication
14118dcc3: 498d4e20 lea rcx, [r14 + 0x20]
14118dcc7: 488dbdf8040000 lea rdi, [rbp + 0x4f8]
14118dcce: 4889fa mov rdx, rdi
14118dcd1: e8ba39e8fe call 0x140011690
14118dcd6: 90 nop
14118dcd7: 488d8d68050000 lea rcx, [rbp + 0x568]
14118dcde: 4c89f2 mov rdx, r14
14118dce1: 4989c0 mov r8, rax
14118dce4: 4989f9 mov r9, rdi
14118dce7: e884d234ff call 0x1404daf70
14118dcec: 90 nop
14118dced: 488b8570050000 mov rax, qword ptr [rbp + 0x570]
14118dcf4: 31db xor ebx, ebx
14118dcf6: 85c0 test eax, eax
14118dcf8: 480f45d8 cmovne rbx, rax
14118dcfc: 85db test ebx, ebx
14118dcfe: 0f8496000000 je 0x14118dd9a
14118dd04: 48c1ee30 shr rsi, 0x30
14118dd08: 81fe00400000 cmp esi, 0x4000
14118dd0e: 754b jne 0x14118dd5b
14118dd10: 488b8510020000 mov rax, qword ptr [rbp + 0x210]
14118dd17: 48899d68050000 mov qword ptr [rbp + 0x568], rbx
14118dd1e: f30f6f85f0010000 movdqu xmm0, xmmword ptr [rbp + 0x1f0]
14118dd26: f30f6f8d00020000 movdqu xmm1, xmmword ptr [rbp + 0x200]
14118dd2e: f30f7f8570050000 movdqu xmmword ptr [rbp + 0x570], xmm0
14118dd36: f30f7f8d80050000 movdqu xmmword ptr [rbp + 0x580], xmm1
14118dd3e: 48898590050000 mov qword ptr [rbp + 0x590], rax
14118dd45: 488d15bc39f404 lea rdx, [rip + 0x4f439bc]
14118dd4c: 488d8d68050000 lea rcx, [rbp + 0x568]
14118dd53: e868f3c503 call 0x144ded0c0
14118dd58: 90 nop
14118dd59: eb3f jmp 0x14118dd9a
14118dd5b: 488bb500020000 mov rsi, qword ptr [rbp + 0x200]
14118dd62: 4885f6 test rsi, rsi
14118dd65: 7507 jne 0x14118dd6e
14118dd67: 488bb508020000 mov rsi, qword ptr [rbp + 0x208]
14118dd6e: 488b06 mov rax, qword ptr [rsi]
14118dd71: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
14118dd75: 4829f8 sub rax, rdi
14118dd78: 4883f80f cmp rax, 0xf
14118dd7c: 7666 jbe 0x14118dde4
14118dd7e: 488b4608 mov rax, qword ptr [rsi + 8]
14118dd82: 488d0df7ce7bff lea rcx, [rip - 0x843109]
14118dd89: 48890c38 mov qword ptr [rax + rdi], rcx
14118dd8d: 48895c3808 mov qword ptr [rax + rdi + 8], rbx
14118dd92: 4883c710 add rdi, 0x10
14118dd96: 48897e10 mov qword ptr [rsi + 0x10], rdi
# destroy-command
14094ac80: 56 push rsi
14094ac81: 4883ec20 sub rsp, 0x20
14094ac85: 49830008 add qword ptr [r8], 8
14094ac89: 4885d2 test rdx, rdx
14094ac8c: 7420 je 0x14094acae
14094ac8e: 488b09 mov rcx, qword ptr [rcx]
14094ac91: 4889d6 mov rsi, rdx
14094ac94: e857298200 call 0x14116d5f0
14094ac99: 4889f1 mov rcx, rsi
14094ac9c: e87f1e4904 call 0x144ddcb20
14094aca1: 4889f1 mov rcx, rsi
14094aca4: 4883c420 add rsp, 0x20
14094aca8: 5e pop rsi
14094aca9: e9221e4904 jmp 0x144ddcad0
14094acae: 4883c420 add rsp, 0x20
14094acb2: 5e pop rsi
14094acb3: c3 ret
# marker-identity-lookup
14116d65f: 4c89442448 mov qword ptr [rsp + 0x48], r8
14116d664: 488b4258 mov rax, qword ptr [rdx + 0x58]
14116d668: 4c8b4a60 mov r9, qword ptr [rdx + 0x60]
14116d66c: 49ba79039f4c3cf19444 movabs r10, 0x4494f13c4c9f0379
14116d676: 31ed xor ebp, ebp
14116d678: 660f6f05801dd604 movdqa xmm0, xmmword ptr [rip + 0x4d61d80]
14116d680: 660f76c9 pcmpeqd xmm1, xmm1
14116d684: 660f6f15445cdd04 movdqa xmm2, xmmword ptr [rip + 0x4dd5c44]
14116d68c: 4d21ca and r10, r9
14116d68f: f3420f6f1c10 movdqu xmm3, xmmword ptr [rax + r10]
14116d695: 660f6fe3 movdqa xmm4, xmm3
14116d699: 660f74e0 pcmpeqb xmm4, xmm0
14116d69d: 66440fd7fc pmovmskb r15d, xmm4
14116d6a2: 4585ff test r15d, r15d
14116d6a5: 7444 je 0x14116d6eb
14116d6a7: 4189c8 mov r8d, ecx
14116d6aa: 4889e9 mov rcx, rbp
14116d6ad: f3410fbcef tzcnt ebp, r15d
14116d6b2: 4c01d5 add rbp, r10
14116d6b5: 4c21cd and rbp, r9
14116d6b8: 48f7dd neg rbp
14116d6bb: 488d6c6d00 lea rbp, [rbp + rbp*2]
14116d6c0: f30f6f64e8e8 movdqu xmm4, xmmword ptr [rax + rbp*8 - 0x18]
14116d6c6: 660f74e2 pcmpeqb xmm4, xmm2
14116d6ca: 66440fd7dc pmovmskb r11d, xmm4
14116d6cf: 4181fbffff0000 cmp r11d, 0xffff
14116d6d6: 7432 je 0x14116d70a
14116d6d8: 458d5fff lea r11d, [r15 - 1]
14116d6dc: 664521fb and r11w, r15w
14116d6e0: 4589df mov r15d, r11d
14116d6e3: 4889cd mov rbp, rcx
14116d6e6: 4489c1 mov ecx, r8d
14116d6e9: 75bc jne 0x14116d6a7
14116d6eb: 660f74d9 pcmpeqb xmm3, xmm1
14116d6ef: 66440fd7db pmovmskb r11d, xmm3
14116d6f4: 4585db test r11d, r11d
14116d6f7: 0f85da020000 jne 0x14116d9d7
14116d6fd: 4901ea add r10, rbp
14116d700: 4983c210 add r10, 0x10
14116d704: 4883c510 add rbp, 0x10
14116d708: eb82 jmp 0x14116d68c
# marker-present-boundary
14116d70a: 488b4c2448 mov rcx, qword ptr [rsp + 0x48]
14116d70f: 48398ab0010000 cmp qword ptr [rdx + 0x1b0], rcx
14116d716: 0f86bb020000 jbe 0x14116d9d7
14116d71c: 488d04e8 lea rax, [rax + rbp*8]
14116d720: 488b40f8 mov rax, qword ptr [rax - 8]
14116d724: 488d0cc9 lea rcx, [rcx + rcx*8]
14116d728: 48c1e103 shl rcx, 3
14116d72c: 48038aa8010000 add rcx, qword ptr [rdx + 0x1a8]
14116d733: 4889542448 mov qword ptr [rsp + 0x48], rdx
14116d738: 4889c2 mov rdx, rax
14116d73b: e8b07cc503 call 0x144dc53f0
14116d740: 488b542448 mov rdx, qword ptr [rsp + 0x48]
14116d745: 4885c0 test rax, rax
14116d748: 0f8489020000 je 0x14116d9d7
14116d74e: 48037a08 add rdi, qword ptr [rdx + 8]
14116d752: 4c3b7210 cmp r14, qword ptr [rdx + 0x10]
14116d756: 490f43fd cmovae rdi, r13
14116d75a: 395f10 cmp dword ptr [rdi + 0x10], ebx
14116d75d: 0f85cb020000 jne 0x14116da2e
14116d763: 8b2f mov ebp, dword ptr [rdi]
14116d765: 85ed test ebp, ebp
14116d767: 0f84c1020000 je 0x14116da2e
14116d76d: 4c8b7704 mov r14, qword ptr [rdi + 4]
14116d771: 8b4f0c mov ecx, dword ptr [rdi + 0xc]
14116d774: 48899424a8000000 mov qword ptr [rsp + 0xa8], rdx
14116d77c: 4889b424b0000000 mov qword ptr [rsp + 0xb0], rsi
14116d784: 89ac24b8000000 mov dword ptr [rsp + 0xb8], ebp
14116d78b: 4c89b424bc000000 mov qword ptr [rsp + 0xbc], r14
14116d793: 894c246c mov dword ptr [rsp + 0x6c], ecx
14116d797: 898c24c4000000 mov dword ptr [rsp + 0xc4], ecx
14116d79e: 4c89742440 mov qword ptr [rsp + 0x40], r14
14116d7a3: 49c1ee20 shr r14, 0x20
14116d7a7: 8b9ab0050000 mov ebx, dword ptr [rdx + 0x5b0]
14116d7ad: 4889d1 mov rcx, rdx
14116d7b0: 4889d7 mov rdi, rdx
14116d7b3: e8988690ff call 0x140a75e50
# marker-absent-boundary
14116d9d7: 48037a08 add rdi, qword ptr [rdx + 8]
14116d9db: 4c3b7210 cmp r14, qword ptr [rdx + 0x10]
14116d9df: 4c0f42ef cmovb r13, rdi
14116d9e3: 41395d10 cmp dword ptr [r13 + 0x10], ebx
14116d9e7: 7545 jne 0x14116da2e
14116d9e9: 418b4500 mov eax, dword ptr [r13]
14116d9ed: 85c0 test eax, eax
14116d9ef: 743d je 0x14116da2e
14116d9f1: 498b4d04 mov rcx, qword ptr [r13 + 4]
14116d9f5: 458b450c mov r8d, dword ptr [r13 + 0xc]
14116d9f9: 48899424d0000000 mov qword ptr [rsp + 0xd0], rdx
14116da01: 4889b424d8000000 mov qword ptr [rsp + 0xd8], rsi
14116da09: 898424e0000000 mov dword ptr [rsp + 0xe0], eax
14116da10: 48898c24e4000000 mov qword ptr [rsp + 0xe4], rcx
14116da18: 44898424ec000000 mov dword ptr [rsp + 0xec], r8d
14116da20: 488d8c24d0000000 lea rcx, [rsp + 0xd0]
14116da28: e8a3aef6ff call 0x1410d88d0
14116da2d: 90 nop
14116da2e: 4881c418010000 add rsp, 0x118
14116da35: 5b pop rbx
14116da36: 5d pop rbp
14116da37: 5f pop rdi
14116da38: 5e pop rsi
14116da39: 415c pop r12
14116da3b: 415d pop r13
14116da3d: 415e pop r14
14116da3f: 415f pop r15
14116da41: c3 ret
# remove-guid
1410d893d: 488d8f68020000 lea rcx, [rdi + 0x268]
1410d8944: 4c8d8758010000 lea r8, [rdi + 0x158]
1410d894b: 488d5520 lea rdx, [rbp + 0x20]
1410d894f: e82c313dff call 0x1404aba80
1410d8954: 90 nop
1410d8955: 4989c7 mov r15, rax
1410d8958: 488b5520 mov rdx, qword ptr [rbp + 0x20]
1410d895c: 4885d2 test rdx, rdx
1410d895f: 7413 je 0x1410d8974
1410d8961: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
1410d8965: 48c1e203 shl rdx, 3
1410d8969: 41b808000000 mov r8d, 8
1410d896f: e85c98f2fe call 0x1400021d0
1410d8974: 488d4dc0 lea rcx, [rbp - 0x40]
1410d8978: 4889fa mov rdx, rdi
1410d897b: 4589f0 mov r8d, r14d
1410d897e: 4d89f9 mov r9, r15
1410d8981: e88a6cfeff call 0x1410bf610
1410d8986: 807df0ff cmp byte ptr [rbp - 0x10], 0xff
1410d898a: 745e je 0x1410d89ea
1410d898c: 4d8d742410 lea r14, [r12 + 0x10]
1410d8991: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1410d8995: 48894550 mov qword ptr [rbp + 0x50], rax
1410d8999: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
1410d899d: 0f104dd0 movups xmm1, xmmword ptr [rbp - 0x30]
1410d89a1: 0f1055e0 movups xmm2, xmmword ptr [rbp - 0x20]
1410d89a5: 0f295540 movaps xmmword ptr [rbp + 0x40], xmm2
1410d89a9: 0f294d30 movaps xmmword ptr [rbp + 0x30], xmm1
1410d89ad: 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
1410d89b1: 4d8b442408 mov r8, qword ptr [r12 + 8]
1410d89b6: 89742420 mov dword ptr [rsp + 0x20], esi
1410d89ba: 488d4dc0 lea rcx, [rbp - 0x40]
1410d89be: 488d5520 lea rdx, [rbp + 0x20]
1410d89c2: 4189d9 mov r9d, ebx
1410d89c5: e8a699fcff call 0x1410a2370
1410d89ca: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
1410d89ce: 410f1106 movups xmmword ptr [r14], xmm0
1410d89d2: 4889f9 mov rcx, rdi
1410d89d5: e84641d003 call 0x144ddcb20
1410d89da: 4889f9 mov rcx, rdi
1410d89dd: e8ee40d003 call 0x144ddcad0
1410d89e2: 4c89e1 mov rcx, r12
1410d89e5: e88629d103 call 0x144deb370
# fade-default-and-registration
1410d89ea: c7455c000080bf mov dword ptr [rbp + 0x5c], 0xbf800000
1410d89f1: 418b442410 mov eax, dword ptr [r12 + 0x10]
1410d89f6: 89859c000000 mov dword ptr [rbp + 0x9c], eax
1410d89fc: 85c0 test eax, eax
1410d89fe: 0f841e080000 je 0x1410d9222
1410d8a04: 458b742414 mov r14d, dword ptr [r12 + 0x14]
1410d8a09: 418b442418 mov eax, dword ptr [r12 + 0x18]
1410d8a0e: 89858c000000 mov dword ptr [rbp + 0x8c], eax
1410d8a14: 418b44241c mov eax, dword ptr [r12 + 0x1c]
1410d8a19: 894568 mov dword ptr [rbp + 0x68], eax
1410d8a1c: 498b3c24 mov rdi, qword ptr [r12]
1410d8a20: 8bb7b0050000 mov esi, dword ptr [rdi + 0x5b0]
1410d8a26: 488d4740 lea rax, [rdi + 0x40]
1410d8a2a: 488d8fa8050000 lea rcx, [rdi + 0x5a8]
1410d8a31: 488945d8 mov qword ptr [rbp - 0x28], rax
1410d8a35: 48894de0 mov qword ptr [rbp - 0x20], rcx
1410d8a39: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1410d8a41: 48c745c808000000 mov qword ptr [rbp - 0x38], 8
1410d8a49: 48c745d000000000 mov qword ptr [rbp - 0x30], 0
1410d8a51: 488d8f68020000 lea rcx, [rdi + 0x268]
1410d8a58: 4c8d8758010000 lea r8, [rdi + 0x158]
1410d8a5f: 488d55c0 lea rdx, [rbp - 0x40]
1410d8a63: e8c8ae3cff call 0x1404a3930
1410d8a68: 90 nop
1410d8a69: 4889c3 mov rbx, rax
# explicit-announcement-command
14118cac6: 488b4608 mov rax, qword ptr [rsi + 8]
14118caca: 488d0dbfef7cff lea rcx, [rip - 0x831041]
14118cad1: 48890c38 mov qword ptr [rax + rdi], rcx
14118cad5: 48895c3808 mov qword ptr [rax + rdi + 8], rbx
14118cada: c644381000 mov byte ptr [rax + rdi + 0x10], 0
14118cadf: 4883c718 add rdi, 0x18
14118cae3: 48897e10 mov qword ptr [rsi + 0x10], rdi
# arm-despawn-dense
1409dae9e: 4d6bc834 imul r9, r8, 0x34
1409daea2: 4c8b542420 mov r10, qword ptr [rsp + 0x20]
1409daea7: 43892c82 mov dword ptr [r10 + r8*4], ebp
1409daeab: 43c7440d2c01009d00 mov dword ptr [r13 + r9 + 0x2c], 0x9d0001
# arm-despawn-sparse
1409daf9b: 4d6bd134 imul r10, r9, 0x34
1409daf9f: 4c8b5c2420 mov r11, qword ptr [rsp + 0x20]
1409dafa4: 43892c8b mov dword ptr [r11 + r9*4], ebp
1409dafa8: 42c744162c01009d00 mov dword ptr [rsi + r10 + 0x2c], 0x9d0001
