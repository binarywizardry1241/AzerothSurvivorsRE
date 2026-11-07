145b98130 55 push rbp
145b98131 56 push rsi
145b98132 57 push rdi
145b98133 4881eca0000000 sub rsp, 0xa0
145b9813a 488dac2480000000 lea rbp, [rsp + 0x80]
145b98142 48c74518feffffff mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
145b9814a 4c894df8 mov qword ptr [rbp - 8], r9
145b9814e 4c894500 mov qword ptr [rbp], r8
145b98152 4889d6 mov rsi, rdx
145b98155 4889cf mov rdi, rcx
145b98158 c6451701 mov byte ptr [rbp + 0x17], 1
145b9815c e82f0b0500 call 0x145be8c90
145b98161 90 nop
145b98162 c6451701 mov byte ptr [rbp + 0x17], 1
145b98166 e885ed1200 call 0x145cc6ef0
145b9816b 90 nop
145b9816c 31c9 xor ecx, ecx
145b9816e e8ad460500 call 0x145bec820
145b98173 803800 cmp byte ptr [rax], 0
145b98176 7406 je 0x145b9817e
145b98178 488b4008 mov rax, qword ptr [rax + 8]
145b9817c eb07 jmp 0x145b98185
145b9817e 488b05bb90ac02 mov rax, qword ptr [rip + 0x2ac90bb]
145b98185 4883f80d cmp rax, 0xd
145b98189 b90d000000 mov ecx, 0xd
145b9818e 480f42c8 cmovb rcx, rax
145b98192 486bc138 imul rax, rcx, 0x38
145b98196 488d0d63538401 lea rcx, [rip + 0x1845363]
145b9819d 488b0c08 mov rcx, qword ptr [rax + rcx]
145b981a1 c6451701 mov byte ptr [rbp + 0x17], 1
145b981a5 ba02000000 mov edx, 2
145b981aa e8e1b11200 call 0x145cc3390
145b981af 90 nop
145b981b0 c6451701 mov byte ptr [rbp + 0x17], 1
145b981b4 e87788fbff call 0x145b50a30
145b981b9 90 nop
145b981ba c6451701 mov byte ptr [rbp + 0x17], 1
145b981be e89db61100 call 0x145cb3860
145b981c3 90 nop
145b981c4 c6451701 mov byte ptr [rbp + 0x17], 1
145b981c8 e803d30000 call 0x145ba54d0
145b981cd 90 nop
145b981ce c6451701 mov byte ptr [rbp + 0x17], 1
145b981d2 e8c9c90000 call 0x145ba4ba0
145b981d7 90 nop
145b981d8 c6451701 mov byte ptr [rbp + 0x17], 1
145b981dc e84fd70000 call 0x145ba5930
145b981e1 90 nop
145b981e2 c6451701 mov byte ptr [rbp + 0x17], 1
145b981e6 e8f5011300 call 0x145cc83e0
145b981eb 90 nop
145b981ec c6451701 mov byte ptr [rbp + 0x17], 1
145b981f0 e89b77faff call 0x145b3f990
145b981f5 90 nop
145b981f6 488b4568 mov rax, qword ptr [rbp + 0x68]
145b981fa 488b5560 mov rdx, qword ptr [rbp + 0x60]
145b981fe 488b4a30 mov rcx, qword ptr [rdx + 0x30]
145b98202 48894de0 mov qword ptr [rbp - 0x20], rcx
145b98206 0f1002 movups xmm0, xmmword ptr [rdx]
145b98209 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
145b9820d 0f105220 movups xmm2, xmmword ptr [rdx + 0x20]
145b98211 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
145b98215 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
145b98219 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
145b9821d c6451700 mov byte ptr [rbp + 0x17], 0
145b98221 4889442428 mov qword ptr [rsp + 0x28], rax
145b98226 488d45b0 lea rax, [rbp - 0x50]
145b9822a 4889442420 mov qword ptr [rsp + 0x20], rax
145b9822f 4889f9 mov rcx, rdi
145b98232 4889f2 mov rdx, rsi
145b98235 4c8b4500 mov r8, qword ptr [rbp]
145b98239 4c8b4df8 mov r9, qword ptr [rbp - 8]
145b9823d e82e260400 call 0x145bda870
145b98242 90 nop
145b98243 488945f0 mov qword ptr [rbp - 0x10], rax
145b98247 f048ff00 lock inc qword ptr [rax]
145b9824b 7e1c jle 0x145b98269
145b9824d 48894508 mov qword ptr [rbp + 8], rax
145b98251 4889c1 mov rcx, rax
145b98254 e8d7200500 call 0x145bea330
145b98259 90 nop
145b9825a 488b4508 mov rax, qword ptr [rbp + 8]
145b9825e 4881c4a0000000 add rsp, 0xa0
145b98265 5f pop rdi
145b98266 5e pop rsi
145b98267 5d pop rbp
145b98268 c3 ret
145b98269 0f0b ud2
