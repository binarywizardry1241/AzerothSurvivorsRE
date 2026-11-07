1458ef170 55 push rbp
1458ef171 56 push rsi
1458ef172 4881eca8000000 sub rsp, 0xa8
1458ef179 488dac2480000000 lea rbp, [rsp + 0x80]
1458ef181 48c74520feffffff mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
1458ef189 4889ce mov rsi, rcx
1458ef18c 488d15e1375e01 lea rdx, [rip + 0x15e37e1]
1458ef193 488d4dc8 lea rcx, [rbp - 0x38]
1458ef197 41b80e000000 mov r8d, 0xe
1458ef19d e8eea72c00 call 0x145bb9990
1458ef1a2 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458ef1a6 4883f8ff cmp rax, -1
1458ef1aa 7431 je 0x1458ef1dd
1458ef1ac 48894518 mov qword ptr [rbp + 0x18], rax
1458ef1b0 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
1458ef1b4 488b55d8 mov rdx, qword ptr [rbp - 0x28]
1458ef1b8 48894d10 mov qword ptr [rbp + 0x10], rcx
1458ef1bc e8af7c2b00 call 0x145ba6e70
1458ef1c1 90 nop
1458ef1c2 4885c0 test rax, rax
1458ef1c5 0f8496000000 je 0x1458ef261
1458ef1cb 4989d0 mov r8, rdx
1458ef1ce 488d4df0 lea rcx, [rbp - 0x10]
1458ef1d2 4889c2 mov rdx, rax
1458ef1d5 e8d6d32d00 call 0x145bcc5b0
1458ef1da 90 nop
1458ef1db eb6a jmp 0x1458ef247
1458ef1dd 488d159e375e01 lea rdx, [rip + 0x15e379e]
1458ef1e4 488d4df0 lea rcx, [rbp - 0x10]
1458ef1e8 41b807000000 mov r8d, 7
1458ef1ee e89da72c00 call 0x145bb9990
1458ef1f3 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458ef1f7 4883f8ff cmp rax, -1
1458ef1fb 7520 jne 0x1458ef21d
1458ef1fd 488d153b243001 lea rdx, [rip + 0x130243b]
1458ef204 488d4df0 lea rcx, [rbp - 0x10]
1458ef208 41b80d000000 mov r8d, 0xd
1458ef20e e87da72c00 call 0x145bb9990
1458ef213 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458ef217 4883f8ff cmp rax, -1
1458ef21b 7470 je 0x1458ef28d
1458ef21d 48894518 mov qword ptr [rbp + 0x18], rax
1458ef221 488b55f8 mov rdx, qword ptr [rbp - 8]
1458ef225 4c8b4500 mov r8, qword ptr [rbp]
1458ef229 48c74424200d000000 mov qword ptr [rsp + 0x20], 0xd
1458ef232 4c8d0d50375e01 lea r9, [rip + 0x15e3750]
1458ef239 488d4df0 lea rcx, [rbp - 0x10]
1458ef23d 48895510 mov qword ptr [rbp + 0x10], rdx
1458ef241 e8fa7a2b00 call 0x145ba6d40
1458ef246 90 nop
1458ef247 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
1458ef24b 0f104d00 movups xmm1, xmmword ptr [rbp]
1458ef24f 0f114e10 movups xmmword ptr [rsi + 0x10], xmm1
1458ef253 0f1106 movups xmmword ptr [rsi], xmm0
1458ef256 488b5518 mov rdx, qword ptr [rbp + 0x18]
1458ef25a 4885d2 test rdx, rdx
1458ef25d 7512 jne 0x1458ef271
1458ef25f eb1f jmp 0x1458ef280
1458ef261 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
1458ef268 488b5518 mov rdx, qword ptr [rbp + 0x18]
1458ef26c 4885d2 test rdx, rdx
1458ef26f 740f je 0x1458ef280
1458ef271 41b801000000 mov r8d, 1
1458ef277 488b4d10 mov rcx, qword ptr [rbp + 0x10]
1458ef27b e8502f71fa call 0x1400021d0
1458ef280 4889f0 mov rax, rsi
1458ef283 4881c4a8000000 add rsp, 0xa8
1458ef28a 5e pop rsi
1458ef28b 5d pop rbp
1458ef28c c3 ret
1458ef28d 488d15e5223001 lea rdx, [rip + 0x13022e5]
1458ef294 488d4da8 lea rcx, [rbp - 0x58]
1458ef298 41b804000000 mov r8d, 4
1458ef29e e8eda62c00 call 0x145bb9990
1458ef2a3 488b45a8 mov rax, qword ptr [rbp - 0x58]
1458ef2a7 4883f8ff cmp rax, -1
1458ef2ab 0f849b000000 je 0x1458ef34c
1458ef2b1 48894518 mov qword ptr [rbp + 0x18], rax
1458ef2b5 488b55b0 mov rdx, qword ptr [rbp - 0x50]
1458ef2b9 4c8b45b8 mov r8, qword ptr [rbp - 0x48]
1458ef2bd 48c744242006000000 mov qword ptr [rsp + 0x20], 6
1458ef2c6 4c8d0da1223001 lea r9, [rip + 0x13022a1]
1458ef2cd 488d4df0 lea rcx, [rbp - 0x10]
1458ef2d1 48895510 mov qword ptr [rbp + 0x10], rdx
1458ef2d5 e8667a2b00 call 0x145ba6d40
1458ef2da 90 nop
1458ef2db 488b55f8 mov rdx, qword ptr [rbp - 8]
1458ef2df 4c8b4500 mov r8, qword ptr [rbp]
1458ef2e3 48c744242005000000 mov qword ptr [rsp + 0x20], 5
1458ef2ec 4c8d0d81223001 lea r9, [rip + 0x1302281]
1458ef2f3 488d4dc8 lea rcx, [rbp - 0x38]
1458ef2f7 488955e8 mov qword ptr [rbp - 0x18], rdx
1458ef2fb e8407a2b00 call 0x145ba6d40
1458ef300 90 nop
1458ef301 488b55f0 mov rdx, qword ptr [rbp - 0x10]
1458ef305 4885d2 test rdx, rdx
1458ef308 740f je 0x1458ef319
1458ef30a 41b801000000 mov r8d, 1
1458ef310 488b4de8 mov rcx, qword ptr [rbp - 0x18]
1458ef314 e8b72e71fa call 0x1400021d0
1458ef319 488b5518 mov rdx, qword ptr [rbp + 0x18]
1458ef31d 4885d2 test rdx, rdx
1458ef320 740f je 0x1458ef331
1458ef322 41b801000000 mov r8d, 1
1458ef328 488b4d10 mov rcx, qword ptr [rbp + 0x10]
1458ef32c e89f2e71fa call 0x1400021d0
1458ef331 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458ef335 4883f8ff cmp rax, -1
1458ef339 7411 je 0x1458ef34c
1458ef33b 48894518 mov qword ptr [rbp + 0x18], rax
1458ef33f 488b55d0 mov rdx, qword ptr [rbp - 0x30]
1458ef343 4c8b45d8 mov r8, qword ptr [rbp - 0x28]
1458ef347 e9ddfeffff jmp 0x1458ef229
1458ef34c 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
1458ef353 e928ffffff jmp 0x1458ef280
