; AS 0.115.0 selected native byte excerpts; Capstone disassembly, Ghidra owners separately bound.
; board
145824040 55 push rbp
145824041 4157 push r15
145824043 4156 push r14
145824045 4155 push r13
145824047 4154 push r12
145824049 56 push rsi
14582404a 57 push rdi
14582404b 53 push rbx
14582404c 4883ec68 sub rsp, 0x68
145824050 488d6c2460 lea rbp, [rsp + 0x60]
145824055 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14582405d 4889ce mov rsi, rcx
145824060 4180f808 cmp r8b, 8
145824064 0f83c3000000 jae 0x14582412d
14582406a 4c89cf mov rdi, r9
14582406d 4489c3 mov ebx, r8d
145824070 410fb6c0 movzx eax, r8b
145824074 488b0cc2 mov rcx, qword ptr [rdx + rax*8]
145824078 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145824080 48c745f001000000 mov qword ptr [rbp - 0x10], 1
145824088 48c745f800000000 mov qword ptr [rbp - 8], 0
145824090 4d85c9 test r9, r9
145824093 0f84c0000000 je 0x145824159
145824099 48894dd0 mov qword ptr [rbp - 0x30], rcx
14582409d 488945c8 mov qword ptr [rbp - 0x38], rax
1458240a1 48f7d8 neg rax
1458240a4 4531e4 xor r12d, r12d
1458240a7 488d4de8 lea rcx, [rbp - 0x18]
1458240ab 4531ed xor r13d, r13d
1458240ae 4531ff xor r15d, r15d
1458240b1 488955e0 mov qword ptr [rbp - 0x20], rdx
1458240b5 488945d8 mov qword ptr [rbp - 0x28], rax
1458240b9 4e8d0c28 lea r9, [rax + r13]
1458240bd 4a8d043a lea rax, [rdx + r15]
1458240c1 4531f6 xor r14d, r14d
1458240c4 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458240d0 4983ff40 cmp r15, 0x40
1458240d4 7470 je 0x145824146
1458240d6 4c89f2 mov rdx, r14
1458240d9 4f8d0431 lea r8, [r9 + r14]
1458240dd 4983c708 add r15, 8
1458240e1 49ffc6 inc r14
1458240e4 4d85c0 test r8, r8
1458240e7 74e7 je 0x1458240d0
1458240e9 48393cd0 cmp qword ptr [rax + rdx*8], rdi
1458240ed 75e1 jne 0x1458240d0
1458240ef 4ac744f0f800000000 mov qword ptr [rax + r14*8 - 8], 0
1458240f8 4c3b65e8 cmp r12, qword ptr [rbp - 0x18]
1458240fc 7509 jne 0x145824107
1458240fe e8bd2d6900 call 0x145eb6ec0
145824103 488d4de8 lea rcx, [rbp - 0x18]
145824107 4b8d042e lea rax, [r14 + r13]
14582410b 4805ff000000 add rax, 0xff
145824111 4d01f5 add r13, r14
145824114 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145824118 42880422 mov byte ptr [rdx + r12], al
14582411c 49ffc4 inc r12
14582411f 4c8965f8 mov qword ptr [rbp - 8], r12
145824123 488b55e0 mov rdx, qword ptr [rbp - 0x20]
145824127 488b45d8 mov rax, qword ptr [rbp - 0x28]
14582412b eb8c jmp 0x1458240b9
14582412d 48c70600000000 mov qword ptr [rsi], 0
145824134 48c7460801000000 mov qword ptr [rsi + 8], 1
14582413c 48c7461000000000 mov qword ptr [rsi + 0x10], 0
145824144 eb4d jmp 0x145824193
145824146 488b55e0 mov rdx, qword ptr [rbp - 0x20]
14582414a 488b45c8 mov rax, qword ptr [rbp - 0x38]
14582414e 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
145824152 4839f9 cmp rcx, rdi
145824155 750a jne 0x145824161
145824157 eb2b jmp 0x145824184
145824159 4531e4 xor r12d, r12d
14582415c 4839f9 cmp rcx, rdi
14582415f 7423 je 0x145824184
145824161 48893cc2 mov qword ptr [rdx + rax*8], rdi
145824165 4c3b65e8 cmp r12, qword ptr [rbp - 0x18]
145824169 750a jne 0x145824175
14582416b 488d4de8 lea rcx, [rbp - 0x18]
14582416f e84c2d6900 call 0x145eb6ec0
145824174 90 nop
145824175 488b45f0 mov rax, qword ptr [rbp - 0x10]
145824179 42881c20 mov byte ptr [rax + r12], bl
14582417d 49ffc4 inc r12
145824180 4c8965f8 mov qword ptr [rbp - 8], r12
145824184 488b45f8 mov rax, qword ptr [rbp - 8]
145824188 48894610 mov qword ptr [rsi + 0x10], rax
14582418c 0f1045e8 movups xmm0, xmmword ptr [rbp - 0x18]
145824190 0f1106 movups xmmword ptr [rsi], xmm0
145824193 4889f0 mov rax, rsi
145824196 4883c468 add rsp, 0x68
14582419a 5b pop rbx
14582419b 5f pop rdi
14582419c 5e pop rsi
14582419d 415c pop r12
14582419f 415d pop r13
1458241a1 415e pop r14
1458241a3 415f pop r15
1458241a5 5d pop rbp
1458241a6 c3 ret
; delta
1459ab120 55 push rbp
1459ab121 56 push rsi
1459ab122 57 push rdi
1459ab123 53 push rbx
1459ab124 4883ec58 sub rsp, 0x58
1459ab128 488d6c2450 lea rbp, [rsp + 0x50]
1459ab12d 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459ab135 4c89c7 mov rdi, r8
1459ab138 89d3 mov ebx, edx
1459ab13a 4889ce mov rsi, rcx
1459ab13d e8be7065fa call 0x140002200
1459ab142 b920000000 mov ecx, 0x20
1459ab147 ba01000000 mov edx, 1
1459ab14c e86f7065fa call 0x1400021c0
1459ab151 4885c0 test rax, rax
1459ab154 0f8498000000 je 0x1459ab1f2
1459ab15a c60000 mov byte ptr [rax], 0
1459ab15d 48c745e020000000 mov qword ptr [rbp - 0x20], 0x20
1459ab165 488945e8 mov qword ptr [rbp - 0x18], rax
1459ab169 66c745f82103 mov word ptr [rbp - 8], 0x321
1459ab16f 885801 mov byte ptr [rax + 1], bl
1459ab172 48c745f002000000 mov qword ptr [rbp - 0x10], 2
1459ab17a 488b4de0 mov rcx, qword ptr [rbp - 0x20]
1459ab17e 4883c1fe add rcx, -2
1459ab182 b802000000 mov eax, 2
1459ab187 4883f907 cmp rcx, 7
1459ab18b 763b jbe 0x1459ab1c8
1459ab18d 488b4de8 mov rcx, qword ptr [rbp - 0x18]
1459ab191 48893c01 mov qword ptr [rcx + rax], rdi
1459ab195 4883c008 add rax, 8
1459ab199 488945f0 mov qword ptr [rbp - 0x10], rax
1459ab19d 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459ab1a1 488906 mov qword ptr [rsi], rax
1459ab1a4 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459ab1a8 48894608 mov qword ptr [rsi + 8], rax
1459ab1ac 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459ab1b0 48894610 mov qword ptr [rsi + 0x10], rax
1459ab1b4 488b45f8 mov rax, qword ptr [rbp - 8]
1459ab1b8 48894618 mov qword ptr [rsi + 0x18], rax
1459ab1bc 4889f0 mov rax, rsi
1459ab1bf 4883c458 add rsp, 0x58
1459ab1c3 5b pop rbx
1459ab1c4 5f pop rdi
1459ab1c5 5e pop rsi
1459ab1c6 5d pop rbp
1459ab1c7 c3 ret
1459ab1c8 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459ab1d1 488d4de0 lea rcx, [rbp - 0x20]
1459ab1d5 ba02000000 mov edx, 2
1459ab1da 41b808000000 mov r8d, 8
1459ab1e0 41b901000000 mov r9d, 1
1459ab1e6 e825983600 call 0x145d14a10
1459ab1eb 90 nop
1459ab1ec 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459ab1f0 eb9b jmp 0x1459ab18d
1459ab1f2 b901000000 mov ecx, 1
1459ab1f7 ba20000000 mov edx, 0x20
1459ab1fc e8cabd5000 call 0x145eb6fcb
1459ab201 0f0b ud2
; list
1459ac910 55 push rbp
1459ac911 4157 push r15
1459ac913 4156 push r14
1459ac915 4155 push r13
1459ac917 4154 push r12
1459ac919 56 push rsi
1459ac91a 57 push rdi
1459ac91b 53 push rbx
1459ac91c 4881ec88000000 sub rsp, 0x88
1459ac923 488dac2480000000 lea rbp, [rsp + 0x80]
1459ac92b 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459ac933 4889d7 mov rdi, rdx
1459ac936 4889ce mov rsi, rcx
1459ac939 e8c25865fa call 0x140002200
1459ac93e 41bc20000000 mov r12d, 0x20
1459ac944 bb01000000 mov ebx, 1
1459ac949 b920000000 mov ecx, 0x20
1459ac94e ba01000000 mov edx, 1
1459ac953 e8685865fa call 0x1400021c0
1459ac958 4885c0 test rax, rax
1459ac95b 0f8447010000 je 0x1459acaa8
1459ac961 c60001 mov byte ptr [rax], 1
1459ac964 66b92103 mov cx, 0x321
1459ac968 48c745a800000000 mov qword ptr [rbp - 0x58], 0
1459ac970 4531f6 xor r14d, r14d
1459ac973 4531ff xor r15d, r15d
1459ac976 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459ac980 4983fe40 cmp r14, 0x40
1459ac984 0f84ea000000 je 0x1459aca74
1459ac98a 4e8b2c37 mov r13, qword ptr [rdi + r14]
1459ac98e 4983c608 add r14, 8
1459ac992 41fecf dec r15b
1459ac995 4d85ed test r13, r13
1459ac998 74e6 je 0x1459ac980
1459ac99a 4c8965b0 mov qword ptr [rbp - 0x50], r12
1459ac99e 488945b8 mov qword ptr [rbp - 0x48], rax
1459ac9a2 48895dc0 mov qword ptr [rbp - 0x40], rbx
1459ac9a6 66894dc8 mov word ptr [rbp - 0x38], cx
1459ac9aa 0fb74dfc movzx ecx, word ptr [rbp - 4]
1459ac9ae 488d55ca lea rdx, [rbp - 0x36]
1459ac9b2 66894a04 mov word ptr [rdx + 4], cx
1459ac9b6 8b4df8 mov ecx, dword ptr [rbp - 8]
1459ac9b9 890a mov dword ptr [rdx], ecx
1459ac9bb 4c39e3 cmp rbx, r12
1459ac9be 750e jne 0x1459ac9ce
1459ac9c0 488d4db0 lea rcx, [rbp - 0x50]
1459ac9c4 e8f7a45000 call 0x145eb6ec0
1459ac9c9 90 nop
1459ac9ca 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459ac9ce 488b4da8 mov rcx, qword ptr [rbp - 0x58]
1459ac9d2 4428f9 sub cl, r15b
1459ac9d5 4989cf mov r15, rcx
1459ac9d8 ffc9 dec ecx
1459ac9da 880c18 mov byte ptr [rax + rbx], cl
1459ac9dd 48ffc3 inc rbx
1459ac9e0 48895dc0 mov qword ptr [rbp - 0x40], rbx
1459ac9e4 488b45b0 mov rax, qword ptr [rbp - 0x50]
1459ac9e8 488945d0 mov qword ptr [rbp - 0x30], rax
1459ac9ec 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459ac9f0 488945d8 mov qword ptr [rbp - 0x28], rax
1459ac9f4 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459ac9f8 488945e0 mov qword ptr [rbp - 0x20], rax
1459ac9fc 488b45c8 mov rax, qword ptr [rbp - 0x38]
1459aca00 488945e8 mov qword ptr [rbp - 0x18], rax
1459aca04 488b5de0 mov rbx, qword ptr [rbp - 0x20]
1459aca08 4c8b65d0 mov r12, qword ptr [rbp - 0x30]
1459aca0c 4c89e0 mov rax, r12
1459aca0f 4829d8 sub rax, rbx
1459aca12 4883f807 cmp rax, 7
1459aca16 7630 jbe 0x1459aca48
1459aca18 4c897da8 mov qword ptr [rbp - 0x58], r15
1459aca1c 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459aca20 4c892c18 mov qword ptr [rax + rbx], r13
1459aca24 4883c308 add rbx, 8
1459aca28 48895de0 mov qword ptr [rbp - 0x20], rbx
1459aca2c 0fb74de8 movzx ecx, word ptr [rbp - 0x18]
1459aca30 4c8d45ea lea r8, [rbp - 0x16]
1459aca34 418b10 mov edx, dword ptr [r8]
1459aca37 8955f8 mov dword ptr [rbp - 8], edx
1459aca3a 410fb75004 movzx edx, word ptr [r8 + 4]
1459aca3f 668955fc mov word ptr [rbp - 4], dx
1459aca43 e92bffffff jmp 0x1459ac973
1459aca48 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1459aca51 41b808000000 mov r8d, 8
1459aca57 41b901000000 mov r9d, 1
1459aca5d 488d4dd0 lea rcx, [rbp - 0x30]
1459aca61 4889da mov rdx, rbx
1459aca64 e8a77f3600 call 0x145d14a10
1459aca69 90 nop
1459aca6a 4c8b65d0 mov r12, qword ptr [rbp - 0x30]
1459aca6e 488b5de0 mov rbx, qword ptr [rbp - 0x20]
1459aca72 eba4 jmp 0x1459aca18
1459aca74 4c8926 mov qword ptr [rsi], r12
1459aca77 48894608 mov qword ptr [rsi + 8], rax
1459aca7b 48895e10 mov qword ptr [rsi + 0x10], rbx
1459aca7f 66894e18 mov word ptr [rsi + 0x18], cx
1459aca83 8b45f8 mov eax, dword ptr [rbp - 8]
1459aca86 89461a mov dword ptr [rsi + 0x1a], eax
1459aca89 0fb745fc movzx eax, word ptr [rbp - 4]
1459aca8d 6689461e mov word ptr [rsi + 0x1e], ax
1459aca91 4889f0 mov rax, rsi
1459aca94 4881c488000000 add rsp, 0x88
1459aca9b 5b pop rbx
1459aca9c 5f pop rdi
1459aca9d 5e pop rsi
1459aca9e 415c pop r12
1459acaa0 415d pop r13
1459acaa2 415e pop r14
1459acaa4 415f pop r15
1459acaa6 5d pop rbp
1459acaa7 c3 ret
1459acaa8 b901000000 mov ecx, 1
1459acaad ba20000000 mov edx, 0x20
1459acab2 e814a55000 call 0x145eb6fcb
1459acab7 0f0b ud2
; request-opcode-selector
145873c6b 3d21030000 cmp eax, 0x321
145873c70 0f85a9020000 jne 0x145873f1f
145873c76 4d85e4 test r12, r12
145873c79 0f8413060000 je 0x145874292
145873c7f 450fb606 movzx r8d, byte ptr [r14]
145873c83 4180f8ff cmp r8b, 0xff
145873c87 0f84fd0f0000 je 0x145874c8a
145873c8d 4d89e1 mov r9, r12
145873c90 49ffc9 dec r9
145873c93 0f84fc050000 je 0x145874295
145873c99 410fb64e01 movzx ecx, byte ptr [r14 + 1]
145873c9e 31c0 xor eax, eax
145873ca0 4983f901 cmp r9, 1
145873ca4 0f85d4150000 jne 0x14587527e
145873caa 31d2 xor edx, edx
145873cac e9ea050000 jmp 0x14587429b
; request-local-board-and-deltas
145874292 4531c0 xor r8d, r8d
145874295 31c0 xor eax, eax
145874297 31d2 xor edx, edx
145874299 31c9 xor ecx, ecx
14587429b 4531d2 xor r10d, r10d
14587429e 4531c9 xor r9d, r9d
1458742a1 4531db xor r11d, r11d
1458742a4 4883fb01 cmp rbx, 1
1458742a8 7533 jne 0x1458742dd
1458742aa 83be580c000003 cmp dword ptr [rsi + 0xc58], 3
1458742b1 0f85be200000 jne 0x145876375
1458742b7 4c3bae980c0000 cmp r13, qword ptr [rsi + 0xc98]
1458742be 0f83b1200000 jae 0x145876375
1458742c4 488bbe900c0000 mov rdi, qword ptr [rsi + 0xc90]
1458742cb 4969dd78040000 imul rbx, r13, 0x478
1458742d2 48833c1f00 cmp qword ptr [rdi + rbx], 0
1458742d7 0f8498200000 je 0x145876375
1458742dd 450fb6d2 movzx r10d, r10b
1458742e1 0fb6c9 movzx ecx, cl
1458742e4 09c2 or edx, eax
1458742e6 09ca or edx, ecx
1458742e8 4509d9 or r9d, r11d
1458742eb 4509d1 or r9d, r10d
1458742ee 49c1e120 shl r9, 0x20
1458742f2 4909d1 or r9, rdx
1458742f5 488dbe50170000 lea rdi, [rsi + 0x1750]
1458742fc 488d8dc0000000 lea rcx, [rbp + 0xc0]
145874303 4889fa mov rdx, rdi
145874306 e835fdfaff call 0x145824040
14587430b 41bf01000000 mov r15d, 1
145874311 837e1002 cmp dword ptr [rsi + 0x10], 2
145874315 740a je 0x145874321
145874317 4c8bbe98090000 mov r15, qword ptr [rsi + 0x998]
14587431e 49ffc7 inc r15
145874321 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
145874328 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
14587432f 4c8badc8000000 mov r13, qword ptr [rbp + 0xc8]
145874336 4c8ba5d0000000 mov r12, qword ptr [rbp + 0xd0]
14587433d 4d01ec add r12, r13
145874340 488d9db0010000 lea rbx, [rbp + 0x1b0]
145874347 4c89adc0020000 mov qword ptr [rbp + 0x2c0], r13
14587434e 6690 nop
145874350 4d39e5 cmp r13, r12
145874353 7462 je 0x1458743b7
145874355 410fb65500 movzx edx, byte ptr [r13]
14587435a 4883fa08 cmp rdx, 8
14587435e 0f83071c0000 jae 0x145875f6b
145874364 4c8b04d7 mov r8, qword ptr [rdi + rdx*8]
145874368 4889d9 mov rcx, rbx
14587436b e8b06d1300 call 0x1459ab120
145874370 90 nop
145874371 49ffc5 inc r13
145874374 4531f6 xor r14d, r14d
145874377 660f1f840000000000 nop word ptr [rax + rax]
145874380 4889f1 mov rcx, rsi
145874383 4c89f2 mov rdx, r14
145874386 4989d8 mov r8, rbx
145874389 e8520c0200 call 0x145894fe0
14587438e 90 nop
14587438f 49ffc6 inc r14
145874392 4d39f7 cmp r15, r14
145874395 75e9 jne 0x145874380
145874397 488b95b0010000 mov rdx, qword ptr [rbp + 0x1b0]
14587439e 4885d2 test rdx, rdx
1458743a1 74ad je 0x145874350
1458743a3 488b8db8010000 mov rcx, qword ptr [rbp + 0x1b8]
1458743aa 41b801000000 mov r8d, 1
1458743b0 e81bde78fa call 0x1400021d0
1458743b5 eb99 jmp 0x145874350
1458743b7 488b95c8020000 mov rdx, qword ptr [rbp + 0x2c8]
1458743be 4885d2 test rdx, rdx
1458743c1 0f84ae1f0000 je 0x145876375
; replacement-reset
14588cff7 488d9650170000 lea rdx, [rsi + 0x1750]
14588cffe 0f57c0 xorps xmm0, xmm0
14588d001 0f118678170000 movups xmmword ptr [rsi + 0x1778], xmm0
14588d008 0f118668170000 movups xmmword ptr [rsi + 0x1768], xmm0
14588d00f 0f118658170000 movups xmmword ptr [rsi + 0x1758], xmm0
14588d016 0f118648170000 movups xmmword ptr [rsi + 0x1748], xmm0
14588d01d 48c7868817000000000000 mov qword ptr [rsi + 0x1788], 0
14588d028 c685bf25000001 mov byte ptr [rbp + 0x25bf], 1
14588d02f 488d8d000c0000 lea rcx, [rbp + 0xc00]
14588d036 e8d5f81100 call 0x1459ac910
; login-list
1458865fd 488d9650170000 lea rdx, [rsi + 0x1750]
145886604 c685c62c000001 mov byte ptr [rbp + 0x2cc6], 1
14588660b 488d8d501c0000 lea rcx, [rbp + 0x1c50]
145886612 e8f9621200 call 0x1459ac910
; core-patch-bootstrap
145996550 55 push rbp
145996551 56 push rsi
145996552 57 push rdi
145996553 53 push rbx
145996554 4881ec38010000 sub rsp, 0x138
14599655b 488dac2480000000 lea rbp, [rsp + 0x80]
145996563 48c785b0000000feffffff mov qword ptr [rbp + 0xb0], 0xfffffffffffffffe
14599656e 488d4d58 lea rcx, [rbp + 0x58]
145996572 e849b71e00 call 0x145b81cc0
145996577 488b4558 mov rax, qword ptr [rbp + 0x58]
14599657b 4883f8ff cmp rax, -1
14599657f 0f844c020000 je 0x1459967d1
145996585 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14599658c 488b5560 mov rdx, qword ptr [rbp + 0x60]
145996590 4c8b4568 mov r8, qword ptr [rbp + 0x68]
145996594 488d4d58 lea rcx, [rbp + 0x58]
145996598 48899588000000 mov qword ptr [rbp + 0x88], rdx
14599659f e8dca92300 call 0x145bd0f80
1459965a4 90 nop
1459965a5 48837d58ff cmp qword ptr [rbp + 0x58], -1
1459965aa 0f843f010000 je 0x1459966ef
1459965b0 0f104558 movups xmm0, xmmword ptr [rbp + 0x58]
1459965b4 0f104d68 movups xmm1, xmmword ptr [rbp + 0x68]
1459965b8 0f294d30 movaps xmmword ptr [rbp + 0x30], xmm1
1459965bc 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
1459965c0 4c8d053d019a01 lea r8, [rip + 0x19a013d]
1459965c7 488d4d08 lea rcx, [rbp + 8]
1459965cb 488d5520 lea rdx, [rbp + 0x20]
1459965cf 41b926000000 mov r9d, 0x26
1459965d5 e836bd2300 call 0x145bd2310
1459965da 90 nop
1459965db 488b4508 mov rax, qword ptr [rbp + 8]
1459965df 4883f8ff cmp rax, -1
1459965e3 0f8415010000 je 0x1459966fe
1459965e9 488985a0000000 mov qword ptr [rbp + 0xa0], rax
1459965f0 488b5510 mov rdx, qword ptr [rbp + 0x10]
1459965f4 4c8b4518 mov r8, qword ptr [rbp + 0x18]
1459965f8 488d4df0 lea rcx, [rbp - 0x10]
1459965fc 48899598000000 mov qword ptr [rbp + 0x98], rdx
145996603 e848e73400 call 0x145ce4d50
145996608 90 nop
145996609 488b4df8 mov rcx, qword ptr [rbp - 8]
14599660d 488b4500 mov rax, qword ptr [rbp]
145996611 48898d90000000 mov qword ptr [rbp + 0x90], rcx
145996618 48894de0 mov qword ptr [rbp - 0x20], rcx
14599661c 488945e8 mov qword ptr [rbp - 0x18], rax
145996620 488d7540 lea rsi, [rbp + 0x40]
145996624 4889f1 mov rcx, rsi
145996627 e8742eebff call 0x1458494a0
14599662c 90 nop
14599662d 488d45e0 lea rax, [rbp - 0x20]
145996631 48894558 mov qword ptr [rbp + 0x58], rax
145996635 488d0584ba66fa lea rax, [rip - 0x599457c]
14599663c 48894560 mov qword ptr [rbp + 0x60], rax
145996640 488d0da9009a01 lea rcx, [rip + 0x19a00a9]
145996647 48894d68 mov qword ptr [rbp + 0x68], rcx
14599664b 48894570 mov qword ptr [rbp + 0x70], rax
14599664f 48897578 mov qword ptr [rbp + 0x78], rsi
145996653 488d0586ba66fa lea rax, [rip - 0x599457a]
14599665a 48898580000000 mov qword ptr [rbp + 0x80], rax
145996661 488d1598009a01 lea rdx, [rip + 0x19a0098]
145996668 488d4da8 lea rcx, [rbp - 0x58]
14599666c 4c8d4558 lea r8, [rbp + 0x58]
145996670 e8db0c3500 call 0x145ce7350
145996675 90 nop
145996676 488b5540 mov rdx, qword ptr [rbp + 0x40]
14599667a 4885d2 test rdx, rdx
14599667d 740f je 0x14599668e
14599667f 488b4d48 mov rcx, qword ptr [rbp + 0x48]
145996683 41b801000000 mov r8d, 1
145996689 e842bb66fa call 0x1400021d0
14599668e 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145996692 4885d2 test rdx, rdx
145996695 7e12 jle 0x1459966a9
145996697 41b801000000 mov r8d, 1
14599669d 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
1459966a4 e827bb66fa call 0x1400021d0
1459966a9 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
1459966ad 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
1459966b1 488b45b8 mov rax, qword ptr [rbp - 0x48]
1459966b5 488945d0 mov qword ptr [rbp - 0x30], rax
1459966b9 488d0d44009a01 lea rcx, [rip + 0x19a0044]
1459966c0 4c8d45c0 lea r8, [rbp - 0x40]
1459966c4 ba26000000 mov edx, 0x26
1459966c9 e8a2e92300 call 0x145bd5070
1459966ce 90 nop
1459966cf 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1459966d6 4885d2 test rdx, rdx
1459966d9 7459 je 0x145996734
1459966db 41b801000000 mov r8d, 1
1459966e1 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
1459966e8 e8e3ba66fa call 0x1400021d0
1459966ed eb45 jmp 0x145996734
1459966ef 488d4d60 lea rcx, [rbp + 0x60]
1459966f3 e868083200 call 0x145cb6f60
1459966f8 90 nop
1459966f9 e9b4000000 jmp 0x1459967b2
1459966fe 488b4510 mov rax, qword ptr [rbp + 0x10]
145996702 48894540 mov qword ptr [rbp + 0x40], rax
145996706 488d4540 lea rax, [rbp + 0x40]
14599670a 48894558 mov qword ptr [rbp + 0x58], rax
14599670e 488d052b083200 lea rax, [rip + 0x32082b]
145996715 48894560 mov qword ptr [rbp + 0x60], rax
145996719 488d0d0a009a01 lea rcx, [rip + 0x19a000a]
145996720 488d5558 lea rdx, [rbp + 0x58]
145996724 e8e7a03300 call 0x145cd0810
145996729 90 nop
14599672a 488d4d40 lea rcx, [rbp + 0x40]
14599672e e82d083200 call 0x145cb6f60
145996733 90 nop
145996734 488b4530 mov rax, qword ptr [rbp + 0x30]
145996738 48898598000000 mov qword ptr [rbp + 0x98], rax
14599673f 4885c0 test rax, rax
145996742 7452 je 0x145996796
145996744 488b7528 mov rsi, qword ptr [rbp + 0x28]
145996748 488bbd98000000 mov rdi, qword ptr [rbp + 0x98]
14599674f 48f7df neg rdi
145996752 b901000000 mov ecx, 1
145996757 4889b590000000 mov qword ptr [rbp + 0x90], rsi
14599675e eb1b jmp 0x14599677b
145996760 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
145996767 488d040f lea rax, [rdi + rcx]
14599676b 48ffc0 inc rax
14599676e 48ffc1 inc rcx
145996771 4883c608 add rsi, 8
145996775 4883f801 cmp rax, 1
145996779 741b je 0x145996796
14599677b 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
145996782 488b06 mov rax, qword ptr [rsi]
145996785 f048ff08 lock dec qword ptr [rax]
145996789 75d5 jne 0x145996760
14599678b 4889f1 mov rcx, rsi
14599678e e8bdb42500 call 0x145bf1c50
145996793 90 nop
145996794 ebca jmp 0x145996760
145996796 488b5520 mov rdx, qword ptr [rbp + 0x20]
14599679a 4885d2 test rdx, rdx
14599679d 7413 je 0x1459967b2
14599679f 488b4d28 mov rcx, qword ptr [rbp + 0x28]
1459967a3 48c1e203 shl rdx, 3
1459967a7 41b808000000 mov r8d, 8
1459967ad e81eba66fa call 0x1400021d0
1459967b2 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
1459967b9 4885d2 test rdx, rdx
1459967bc 7413 je 0x1459967d1
1459967be 41b801000000 mov r8d, 1
1459967c4 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
1459967cb e800ba66fa call 0x1400021d0
1459967d0 90 nop
1459967d1 4881c438010000 add rsp, 0x138
1459967d8 5b pop rbx
1459967d9 5f pop rdi
1459967da 5e pop rsi
1459967db 5d pop rbp
1459967dc c3 ret
