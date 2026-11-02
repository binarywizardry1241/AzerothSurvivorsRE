1458bba1c 4989d1 mov r9, rdx
1458bba1f 8b02 mov eax, dword ptr [rdx]
1458bba21 83e802 sub eax, 2
1458bba24 ba0b000000 mov edx, 0xb
1458bba29 0f43d0 cmovae edx, eax
1458bba2c 4889ce mov rsi, rcx
1458bba2f 488d0506233301 lea rax, [rip + 0x1332306]
1458bba36 48630c90 movsxd rcx, dword ptr [rax + rdx*4]
1458bba3a 4801c1 add rcx, rax
1458bba3d ffe1 jmp rcx
1458bbc5e 4889f1 mov rcx, rsi
1458bbc61 e8bac9ffff call 0x1458b8620
1458bbc66 488b4610 mov rax, qword ptr [rsi + 0x10]
1458bbc6a 48c7461002000000 mov qword ptr [rsi + 0x10], 2
1458bbc72 4883f802 cmp rax, 2
1458bbc76 0f846c150000 je 0x1458bd1e8
1458bbc7c 488d5618 lea rdx, [rsi + 0x18]
1458bbc80 488945b0 mov qword ptr [rbp - 0x50], rax
1458bbc84 488d4db8 lea rcx, [rbp - 0x48]
1458bbc88 41b8c00a0000 mov r8d, 0xac0
1458bbc8e e854e43300 call 0x145bfa0e7
1458bbc93 488b8e180b0000 mov rcx, qword ptr [rsi + 0xb18]
1458bbc9a 4885c9 test rcx, rcx
1458bbc9d 0f843b150000 je 0x1458bd1de
1458bbca3 488b86100b0000 mov rax, qword ptr [rsi + 0xb10]
1458bbcaa 4869c9b0000000 imul rcx, rcx, 0xb0
1458bbcb1 31db xor ebx, ebx
1458bbcb3 31d2 xor edx, edx
1458bbcb5 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458bbcc0 80bc10a800000000 cmp byte ptr [rax + rdx + 0xa8], 0
1458bbcc8 0f85540d0000 jne 0x1458bca22
1458bbcce 48ffc3 inc rbx
1458bbcd1 4881c2b0000000 add rdx, 0xb0
1458bbcd8 4839d1 cmp rcx, rdx
1458bbcdb 75e3 jne 0x1458bbcc0
1458bbcdd e9fc140000 jmp 0x1458bd1de
1458bc1a0 837e1002 cmp dword ptr [rsi + 0x10], 2
1458bc1a4 0f843e100000 je 0x1458bd1e8
1458bc1aa 488d4e10 lea rcx, [rsi + 0x10]
1458bc1ae e8fd140600 call 0x14591d6b0
1458bc1b3 48c7462000000000 mov qword ptr [rsi + 0x20], 0
1458bc1bb e8406074fa call 0x140002200
1458bc1c0 b920000000 mov ecx, 0x20
1458bc1c5 ba01000000 mov edx, 1
1458bc1ca e8f15f74fa call 0x1400021c0
1458bc1cf 48898520210000 mov qword ptr [rbp + 0x2120], rax
1458bc1d6 4885c0 test rax, rax
1458bc1d9 0f84a6100000 je 0x1458bd285
1458bc1df 488bbe38060000 mov rdi, qword ptr [rsi + 0x638]
1458bc1e6 483bbe28060000 cmp rdi, qword ptr [rsi + 0x628]
1458bc1ed 750d jne 0x1458bc1fc
1458bc1ef 488d8e28060000 lea rcx, [rsi + 0x628]
1458bc1f6 e815ec3300 call 0x145bfae10
1458bc1fb 90 nop
1458bc1fc 488b8630060000 mov rax, qword ptr [rsi + 0x630]
1458bc203 4889f9 mov rcx, rdi
1458bc206 48c1e105 shl rcx, 5
1458bc20a 48c7040820000000 mov qword ptr [rax + rcx], 0x20
1458bc212 488b9520210000 mov rdx, qword ptr [rbp + 0x2120]
1458bc219 4889540808 mov qword ptr [rax + rcx + 8], rdx
1458bc21e 48c744081000000000 mov qword ptr [rax + rcx + 0x10], 0
1458bc227 66c74408187e01 mov word ptr [rax + rcx + 0x18], 0x17e
1458bc22e 48ffc7 inc rdi
1458bc231 4889be38060000 mov qword ptr [rsi + 0x638], rdi
1458bc238 e9ab0f0000 jmp 0x1458bd1e8
1458bc4af 837e1002 cmp dword ptr [rsi + 0x10], 2
1458bc4b3 7411 je 0x1458bc4c6
1458bc4b5 488d4e10 lea rcx, [rsi + 0x10]
1458bc4b9 e872ee0800 call 0x14594b330
1458bc4be 84c0 test al, al
1458bc4c0 0f85220d0000 jne 0x1458bd1e8
1458bc4c6 4889f1 mov rcx, rsi
1458bc4c9 4881c4b8210000 add rsp, 0x21b8
1458bc4d0 5b pop rbx
1458bc4d1 5f pop rdi
1458bc4d2 5e pop rsi
1458bc4d3 415c pop r12
1458bc4d5 415d pop r13
1458bc4d7 415e pop r14
1458bc4d9 415f pop r15
1458bc4db 5d pop rbp
1458bc4dc e91fbeffff jmp 0x1458b8300
1458bca22 48837dc000 cmp qword ptr [rbp - 0x40], 0
1458bca27 7461 je 0x1458bca8a
1458bca29 e8d25774fa call 0x140002200
1458bca2e b920000000 mov ecx, 0x20
1458bca33 ba01000000 mov edx, 1
1458bca38 e8835774fa call 0x1400021c0
1458bca3d 4885c0 test rax, rax
1458bca40 0f8450080000 je 0x1458bd296
1458bca46 66c785980a00007e01 mov word ptr [rbp + 0xa98], 0x17e
1458bca4f 48c785800a000020000000 mov qword ptr [rbp + 0xa80], 0x20
1458bca5a 488985880a0000 mov qword ptr [rbp + 0xa88], rax
1458bca61 48c785900a000000000000 mov qword ptr [rbp + 0xa90], 0
1458bca6c 488b8e100b0000 mov rcx, qword ptr [rsi + 0xb10]
1458bca73 488b96180b0000 mov rdx, qword ptr [rsi + 0xb18]
1458bca7a 4c8d8d800a0000 lea r9, [rbp + 0xa80]
1458bca81 4989d8 mov r8, rbx
1458bca84 e8570bffff call 0x1458ad5e0
1458bca89 90 nop
1458bcbd8 e8b3130000 call 0x1458bdf90
1458bcbdd 90 nop
1458bcbde 83bd800a000002 cmp dword ptr [rbp + 0xa80], 2
1458bcbe5 750e jne 0x1458bcbf5
1458bcbe7 4584ed test r13b, r13b
1458bd064 488d4610 lea rax, [rsi + 0x10]
1458bd068 48898520210000 mov qword ptr [rbp + 0x2120], rax
1458bd06f 833802 cmp dword ptr [rax], 2
1458bd072 740d je 0x1458bd081
1458bd074 488b8d20210000 mov rcx, qword ptr [rbp + 0x2120]
1458bd07b e860e8feff call 0x1458ab8e0
1458bd080 90 nop
1458bd081 488d95800a0000 lea rdx, [rbp + 0xa80]
1458bd088 41b8c80a0000 mov r8d, 0xac8
1458bd08e 488b8d20210000 mov rcx, qword ptr [rbp + 0x2120]
1458bd095 e84dd03300 call 0x145bfa0e7
1458bd09a 488b9e90100000 mov rbx, qword ptr [rsi + 0x1090]
1458bd0a1 488bb698100000 mov rsi, qword ptr [rsi + 0x1098]
1458bd0a8 c6852f21000000 mov byte ptr [rbp + 0x212f], 0
1458bd0af 488d8d800a0000 lea rcx, [rbp + 0xa80]
1458bd0b6 e855cf0200 call 0x1458ea010
1458bd0bb 90 nop
1458bd0bc c6852f21000000 mov byte ptr [rbp + 0x212f], 0
1458bd0c3 488d05a7ed3201 lea rax, [rip + 0x132eda7]
1458bd0ca 4889442420 mov qword ptr [rsp + 0x20], rax
1458bd0cf 48c744242805000000 mov qword ptr [rsp + 0x28], 5
1458bd0d8 4c8d0558ec3201 lea r8, [rip + 0x132ec58]
1458bd0df 488d8dd8200000 lea rcx, [rbp + 0x20d8]
1458bd0e6 488d95800a0000 lea rdx, [rbp + 0xa80]
1458bd0ed 41b904000000 mov r9d, 4
1458bd0f3 e828e60200 call 0x1458eb720
1458bd0f8 90 nop
1458bd0f9 c6852f21000000 mov byte ptr [rbp + 0x212f], 0
1458bd100 488d050af13201 lea rax, [rip + 0x132f10a]
1458bd107 4889442420 mov qword ptr [rsp + 0x20], rax
1458bd10c 48c744242801000000 mov qword ptr [rsp + 0x28], 1
1458bd115 4c8d05eef03201 lea r8, [rip + 0x132f0ee]
1458bd11c 488d8d800a0000 lea rcx, [rbp + 0xa80]
1458bd123 488d95d8200000 lea rdx, [rbp + 0x20d8]
1458bd12a 41b907000000 mov r9d, 7
1458bd130 e8ebe50200 call 0x1458eb720
1458bd135 90 nop
1458bd136 c6852f21000000 mov byte ptr [rbp + 0x212f], 0
1458bd13d 488d8dd8200000 lea rcx, [rbp + 0x20d8]
1458bd144 488d95800a0000 lea rdx, [rbp + 0xa80]
1458bd14b e870e20200 call 0x1458eb3c0
1458bd150 90 nop
1458bd151 488b85d8200000 mov rax, qword ptr [rbp + 0x20d8]
1458bd158 48898520210000 mov qword ptr [rbp + 0x2120], rax
1458bd15f 488b95e0200000 mov rdx, qword ptr [rbp + 0x20e0]
1458bd166 4c8b85e8200000 mov r8, qword ptr [rbp + 0x20e8]
1458bd16d 4889d9 mov rcx, rbx
1458bd170 488995d0200000 mov qword ptr [rbp + 0x20d0], rdx
1458bd177 ff5618 call qword ptr [rsi + 0x18]
1458bd17a 90 nop
1458bd17b 488b9520210000 mov rdx, qword ptr [rbp + 0x2120]
1458bd182 4885d2 test rdx, rdx
1458bd185 7412 je 0x1458bd199
1458bd187 41b801000000 mov r8d, 1
1458bd18d 488b8dd0200000 mov rcx, qword ptr [rbp + 0x20d0]
1458bd194 e8375074fa call 0x1400021d0
1458bd199 80bd1821000000 cmp byte ptr [rbp + 0x2118], 0
1458bd1a0 741e je 0x1458bd1c0
1458bd1a2 488b95f8200000 mov rdx, qword ptr [rbp + 0x20f8]
1458bd1a9 4885d2 test rdx, rdx
1458bd1ac 7412 je 0x1458bd1c0
1458bd1ae 488b8d00210000 mov rcx, qword ptr [rbp + 0x2100]
1458bd1b5 41b801000000 mov r8d, 1
1458bd1bb e8105074fa call 0x1400021d0
1458bd1c0 488b95b8200000 mov rdx, qword ptr [rbp + 0x20b8]
1458bd1c7 4885d2 test rdx, rdx
1458bd1ca 7412 je 0x1458bd1de
1458bd1cc 48c1e203 shl rdx, 3
1458bd1d0 41b808000000 mov r8d, 8
1458bd1d6 4889f9 mov rcx, rdi
1458bd1d9 e8f24f74fa call 0x1400021d0
1458bd1de 488d4db0 lea rcx, [rbp - 0x50]
1458bd1e2 e8f9e6feff call 0x1458ab8e0
1458bd1e7 90 nop
1458bd1e8 4881c4b8210000 add rsp, 0x21b8
