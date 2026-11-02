; row-total 0x1405a5267..0x1405a5272
1405a5267 4c8bad80010000 mov r13, qword ptr [rbp + 0x180]
1405a526e 4983c505 add r13, 5
; empty-total 0x1405a5a3b..0x1405a5a41
1405a5a3b 41bd05000000 mov r13d, 5
; initialize-counters 0x1405a5b98..0x1405a5bcb
1405a5b98 4d89ac2418010000 mov qword ptr [r12 + 0x118], r13
1405a5ba0 49c784241001000000000000 mov qword ptr [r12 + 0x110], 0
1405a5bac 31c0 xor eax, eax
1405a5bae 4883bd40010000ff cmp qword ptr [rbp + 0x140], -1
1405a5bb6 0f94c0 sete al
1405a5bb9 488d440001 lea rax, [rax + rax + 1]
1405a5bbe 49890424 mov qword ptr [r12], rax
1405a5bc2 49c744240800000000 mov qword ptr [r12 + 8], 0
; stage-dispatch 0x1405a51f3..0x1405a520b
1405a51f3 4d8b5210 mov r10, qword ptr [r10 + 0x10]
1405a51f7 4d8b1a mov r11, qword ptr [r10]
1405a51fa 4c8d357f289d05 lea r14, [rip + 0x59d287f]
1405a5201 4f631c9e movsxd r11, dword ptr [r14 + r11*4]
1405a5205 4d01f3 add r11, r14
1405a5208 41ffe3 jmp r11
; row-attempt 0x1405a5772..0x1405a5819
1405a5772 4983bd98000000ff cmp qword ptr [r13 + 0x98], -1
1405a577a 0f848b0d0000 je 0x1405a650b
1405a5780 4d3bb5d8000000 cmp r14, qword ptr [r13 + 0xd8]
1405a5787 0f83bc040000 jae 0x1405a5c49
1405a578d 498d9598000000 lea rdx, [r13 + 0x98]
1405a5794 4f8d0c76 lea r9, [r14 + r14*2]
1405a5798 49c1e103 shl r9, 3
1405a579c 4d038dd0000000 add r9, qword ptr [r13 + 0xd0]
1405a57a3 498d4578 lea rax, [r13 + 0x78]
1405a57a7 c685b702000001 mov byte ptr [rbp + 0x2b7], 1
1405a57ae 4889442428 mov qword ptr [rsp + 0x28], rax
1405a57b3 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1405a57bc 488d8d40010000 lea rcx, [rbp + 0x140]
1405a57c3 4c8d8578020000 lea r8, [rbp + 0x278]
1405a57ca e8614d6500 call 0x140bfa530
1405a57cf 90 nop
1405a57d0 488d8d40010000 lea rcx, [rbp + 0x140]
1405a57d7 e834a9aeff call 0x140090110
1405a57dc 90 nop
1405a57dd 488b8540010000 mov rax, qword ptr [rbp + 0x140]
1405a57e4 4885c0 test rax, rax
1405a57e7 741a je 0x1405a5803
1405a57e9 488b8d48010000 mov rcx, qword ptr [rbp + 0x148]
1405a57f0 48c1e003 shl rax, 3
1405a57f4 488d1440 lea rdx, [rax + rax*2]
1405a57f8 41b808000000 mov r8d, 8
1405a57fe e8cdc9a5ff call 0x1400021d0
1405a5803 49ff8510010000 inc qword ptr [r13 + 0x110]
1405a580a 49ffc6 inc r14
1405a580d 49c7450001000000 mov qword ptr [r13], 1
1405a5815 4d897508 mov qword ptr [r13 + 8], r14
; core-close-bindings 0x1405a560b..0x1405a5675
1405a560b f30f6f4078 movdqu xmm0, xmmword ptr [rax + 0x78]
1405a5610 f30f6f8888000000 movdqu xmm1, xmmword ptr [rax + 0x88]
1405a5618 660f7f8d50010000 movdqa xmmword ptr [rbp + 0x150], xmm1
1405a5620 660f7f8540010000 movdqa xmmword ptr [rbp + 0x140], xmm0
1405a5628 48c7407800000000 mov qword ptr [rax + 0x78], 0
1405a5630 48c7808000000008000000 mov qword ptr [rax + 0x80], 8
1405a563b 48c7808800000000000000 mov qword ptr [rax + 0x88], 0
1405a5646 c6809000000000 mov byte ptr [rax + 0x90], 0
1405a564d c685b702000001 mov byte ptr [rbp + 0x2b7], 1
1405a5654 488d4d10 lea rcx, [rbp + 0x10]
1405a5658 488d9578020000 lea rdx, [rbp + 0x278]
1405a565f 4c8d8540010000 lea r8, [rbp + 0x140]
1405a5666 e805902000 call 0x1407ae670
1405a566b 90 nop
1405a566c 488d4d10 lea rcx, [rbp + 0x10]
1405a5670 e89baaaeff call 0x140090110
; core-close-count 0x1405a59d7..0x1405a59e8
1405a59d7 48ff8110010000 inc qword ptr [rcx + 0x110]
1405a59de 89502c mov dword ptr [rax + 0x2c], edx
1405a59e1 48c70103000000 mov qword ptr [rcx], 3
; layer 0x1405a53da..0x1405a5441
1405a53da c685b702000001 mov byte ptr [rbp + 0x2b7], 1
1405a53e1 e82a952000 call 0x1407ae910
1405a53e6 90 nop
1405a53e7 84c0 test al, al
1405a53e9 744e je 0x1405a5439
1405a53eb c685b702000001 mov byte ptr [rbp + 0x2b7], 1
1405a53f2 488d8d40010000 lea rcx, [rbp + 0x140]
1405a53f9 488d9578020000 lea rdx, [rbp + 0x278]
1405a5400 e86b942000 call 0x1407ae870
1405a5405 90 nop
1405a5406 488d8d40010000 lea rcx, [rbp + 0x140]
1405a540d e8feacaeff call 0x140090110
1405a5412 90 nop
1405a5413 488b8540010000 mov rax, qword ptr [rbp + 0x140]
1405a541a 4885c0 test rax, rax
1405a541d 741a je 0x1405a5439
1405a541f 488b8d48010000 mov rcx, qword ptr [rbp + 0x148]
1405a5426 48c1e003 shl rax, 3
1405a542a 488d1440 lea rdx, [rax + rax*2]
1405a542e 41b808000000 mov r8d, 8
1405a5434 e897cda5ff call 0x1400021d0
1405a5439 4883be9000000000 cmp qword ptr [rsi + 0x90], 0
; layer-count 0x1405a596f..0x1405a5980
1405a596f 48ff8110010000 inc qword ptr [rcx + 0x110]
1405a5976 89502c mov dword ptr [rax + 0x2c], edx
1405a5979 48c70104000000 mov qword ptr [rcx], 4
; bootstrap 0x1405a5277..0x1405a52cd
1405a5277 c685b702000001 mov byte ptr [rbp + 0x2b7], 1
1405a527e 488d8d40010000 lea rcx, [rbp + 0x140]
1405a5285 488d9578020000 lea rdx, [rbp + 0x278]
1405a528c e8cfa62000 call 0x1407af960
1405a5291 90 nop
1405a5292 488d8d40010000 lea rcx, [rbp + 0x140]
1405a5299 e872aeaeff call 0x140090110
1405a529e 90 nop
1405a529f 488b8540010000 mov rax, qword ptr [rbp + 0x140]
1405a52a6 4885c0 test rax, rax
1405a52a9 741a je 0x1405a52c5
1405a52ab 488b8d48010000 mov rcx, qword ptr [rbp + 0x148]
1405a52b2 48c1e003 shl rax, 3
1405a52b6 488d1440 lea rdx, [rax + rax*2]
1405a52ba 41b808000000 mov r8d, 8
1405a52c0 e80bcfa5ff call 0x1400021d0
1405a52c5 4883be9000000000 cmp qword ptr [rsi + 0x90], 0
; bootstrap-count 0x1405a5907..0x1405a5918
1405a5907 48ff8110010000 inc qword ptr [rcx + 0x110]
1405a590e 89502c mov dword ptr [rax + 0x2c], edx
1405a5911 48c70105000000 mov qword ptr [rcx], 5
; addons-tail 0x1405a5c68..0x1405a5cfa
1405a5c68 498d5610 lea rdx, [r14 + 0x10]
1405a5c6c 488d4db8 lea rcx, [rbp - 0x48]
1405a5c70 e88b7c6000 call 0x140bad900
1405a5c75 90 nop
1405a5c76 410fb64674 movzx eax, byte ptr [r14 + 0x74]
1405a5c7b 0f284510 movaps xmm0, xmmword ptr [rbp + 0x10]
1405a5c7f 660f6f4d20 movdqa xmm1, xmmword ptr [rbp + 0x20]
1405a5c84 660f6f5530 movdqa xmm2, xmmword ptr [rbp + 0x30]
1405a5c89 660f7f9560010000 movdqa xmmword ptr [rbp + 0x160], xmm2
1405a5c91 660f7f8d50010000 movdqa xmmword ptr [rbp + 0x150], xmm1
1405a5c99 0f298540010000 movaps xmmword ptr [rbp + 0x140], xmm0
1405a5ca0 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
1405a5ca4 48898da0020000 mov qword ptr [rbp + 0x2a0], rcx
1405a5cab f30f6f45b8 movdqu xmm0, xmmword ptr [rbp - 0x48]
1405a5cb0 660f7f8590020000 movdqa xmmword ptr [rbp + 0x290], xmm0
1405a5cb8 4883bd40010000ff cmp qword ptr [rbp + 0x140], -1
1405a5cc0 4c8d8540010000 lea r8, [rbp + 0x140]
1405a5cc7 ba00000000 mov edx, 0
1405a5ccc 4c0f44c2 cmove r8, rdx
1405a5cd0 4c8b8d98020000 mov r9, qword ptr [rbp + 0x298]
1405a5cd7 88442428 mov byte ptr [rsp + 0x28], al
1405a5cdb 48894c2420 mov qword ptr [rsp + 0x20], rcx
1405a5ce0 488d4d10 lea rcx, [rbp + 0x10]
1405a5ce4 488d9578020000 lea rdx, [rbp + 0x278]
1405a5ceb e850106a00 call 0x140c46d40
1405a5cf0 90 nop
1405a5cf1 488d4d10 lea rcx, [rbp + 0x10]
1405a5cf5 e816a4aeff call 0x140090110
; addons-tail-count 0x1405a5e05..0x1405a5e16
1405a5e05 48ff8110010000 inc qword ptr [rcx + 0x110]
1405a5e0c 89502c mov dword ptr [rax + 0x2c], edx
1405a5e0f 48c70106000000 mov qword ptr [rcx], 6
; slice-budget 0x1405a5e55..0x1405a5e81
1405a5e55 c685b702000001 mov byte ptr [rbp + 0x2b7], 1
1405a5e5c 488d4df0 lea rcx, [rbp - 0x10]
1405a5e60 e86bd96f05 call 0x145ca37d0
1405a5e65 90 nop
1405a5e66 48bf57ad8c123b500bf9 movabs rdi, 0xf90b503b128cad57
1405a5e70 4885c0 test rax, rax
1405a5e73 750c jne 0x1405a5e81
1405a5e75 81fa00127a00 cmp edx, 0x7a1200
1405a5e7b 0f8298f2ffff jb 0x1405a5119
; publication 0x1405a6140..0x1405a616e
1405a6140 488d8d40010000 lea rcx, [rbp + 0x140]
1405a6147 4889f2 mov rdx, rsi
1405a614a e8f1a0fcff call 0x140570240
1405a614f 83bd40010000ff cmp dword ptr [rbp + 0x140], -1
1405a6156 7436 je 0x1405a618e
1405a6158 488d4d10 lea rcx, [rbp + 0x10]
1405a615c 488d9540010000 lea rdx, [rbp + 0x140]
1405a6163 41b828010000 mov r8d, 0x128
1405a6169 e81d387505 call 0x145cf998b
; cover-progress 0x1408dd872..0x1408dd962
1408dd872 488b75c0 mov rsi, qword ptr [rbp - 0x40]
1408dd876 807e4901 cmp byte ptr [rsi + 0x49], 1
1408dd87a 750a jne 0x1408dd886
1408dd87c f30f10463c movss xmm0, dword ptr [rsi + 0x3c]
1408dd881 e9dc000000 jmp 0x1408dd962
1408dd886 488b4de0 mov rcx, qword ptr [rbp - 0x20]
1408dd88a 488bb580010000 mov rsi, qword ptr [rbp + 0x180]
1408dd891 e85a9bf900 call 0x1418773f0
1408dd896 4885f6 test rsi, rsi
1408dd899 0f848d000000 je 0x1408dd92c
1408dd89f f30f59054d195f05 mulss xmm0, dword ptr [rip + 0x55f194d]
1408dd8a7 488b8618010000 mov rax, qword ptr [rsi + 0x118]
1408dd8ae 4885c0 test rax, rax
1408dd8b1 7433 je 0x1408dd8e6
1408dd8b3 488b8e10010000 mov rcx, qword ptr [rsi + 0x110]
1408dd8ba 4885c9 test rcx, rcx
1408dd8bd 782c js 0x1408dd8eb
1408dd8bf 0f57c9 xorps xmm1, xmm1
1408dd8c2 f3480f2ac9 cvtsi2ss xmm1, rcx
1408dd8c7 4885c0 test rax, rax
1408dd8ca 793c jns 0x1408dd908
1408dd8cc 4889c1 mov rcx, rax
1408dd8cf 48d1e9 shr rcx, 1
1408dd8d2 83e001 and eax, 1
1408dd8d5 4809c8 or rax, rcx
1408dd8d8 0f57d2 xorps xmm2, xmm2
1408dd8db f3480f2ad0 cvtsi2ss xmm2, rax
1408dd8e0 f30f58d2 addss xmm2, xmm2
1408dd8e4 eb2a jmp 0x1408dd910
1408dd8e6 0f57d2 xorps xmm2, xmm2
1408dd8e9 eb3d jmp 0x1408dd928
1408dd8eb 4889ca mov rdx, rcx
1408dd8ee 48d1ea shr rdx, 1
1408dd8f1 83e101 and ecx, 1
1408dd8f4 4809d1 or rcx, rdx
1408dd8f7 0f57c9 xorps xmm1, xmm1
1408dd8fa f3480f2ac9 cvtsi2ss xmm1, rcx
1408dd8ff f30f58c9 addss xmm1, xmm1
1408dd903 4885c0 test rax, rax
1408dd906 78c4 js 0x1408dd8cc
1408dd908 0f57d2 xorps xmm2, xmm2
1408dd90b f3480f2ad0 cvtsi2ss xmm2, rax
1408dd910 f30f5eca divss xmm1, xmm2
1408dd914 f30f101568475c05 movss xmm2, dword ptr [rip + 0x55c4768]
1408dd91c f30f5dd1 minss xmm2, xmm1
1408dd920 f30f5915d8dd5e05 mulss xmm2, dword ptr [rip + 0x55eddd8]
1408dd928 f30f58c2 addss xmm0, xmm2
1408dd92c 488b45c0 mov rax, qword ptr [rbp - 0x40]
1408dd930 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
1408dd934 f30f10483c movss xmm1, dword ptr [rax + 0x3c]
1408dd939 0f28d1 movaps xmm2, xmm1
1408dd93c f30f5fd0 maxss xmm2, xmm0
1408dd940 0f28c2 movaps xmm0, xmm2
1408dd943 f30fc2c203 cmpunordss xmm0, xmm2
1408dd948 0f28d8 movaps xmm3, xmm0
1408dd94b 0f55da andnps xmm3, xmm2
1408dd94e 0f54c1 andps xmm0, xmm1
1408dd951 0f56c3 orps xmm0, xmm3
1408dd954 8b45dc mov eax, dword ptr [rbp - 0x24]
1408dd957 8901 mov dword ptr [rcx], eax
1408dd959 488b45c0 mov rax, qword ptr [rbp - 0x40]
1408dd95d f30f11403c movss dword ptr [rax + 0x3c], xmm0
; world-fraction 0x1418773f0..0x141877465
1418773f0 488b4108 mov rax, qword ptr [rcx + 8]
1418773f4 4885c0 test rax, rax
1418773f7 7438 je 0x141877431
1418773f9 488b09 mov rcx, qword ptr [rcx]
1418773fc 4885c9 test rcx, rcx
1418773ff 7834 js 0x141877435
141877401 f3480f2ac9 cvtsi2ss xmm1, rcx
141877406 4885c0 test rax, rax
141877409 7944 jns 0x14187744f
14187740b 4889c1 mov rcx, rax
14187740e 48d1e9 shr rcx, 1
141877411 83e001 and eax, 1
141877414 4809c8 or rax, rcx
141877417 f3480f2ac0 cvtsi2ss xmm0, rax
14187741c f30f58c0 addss xmm0, xmm0
141877420 f30f5ec8 divss xmm1, xmm0
141877424 f30f100558ac6204 movss xmm0, dword ptr [rip + 0x462ac58]
14187742c f30f5dc1 minss xmm0, xmm1
141877430 c3 ret
141877431 0f57c0 xorps xmm0, xmm0
141877434 c3 ret
141877435 4889ca mov rdx, rcx
141877438 48d1ea shr rdx, 1
14187743b 83e101 and ecx, 1
14187743e 4809d1 or rcx, rdx
141877441 f3480f2ac9 cvtsi2ss xmm1, rcx
141877446 f30f58c9 addss xmm1, xmm1
14187744a 4885c0 test rax, rax
14187744d 78bc js 0x14187740b
14187744f f3480f2ac0 cvtsi2ss xmm0, rax
141877454 f30f5ec8 divss xmm1, xmm0
141877458 f30f100524ac6204 movss xmm0, dword ptr [rip + 0x462ac24]
141877460 f30f5dc1 minss xmm0, xmm1
141877464 c3 ret
