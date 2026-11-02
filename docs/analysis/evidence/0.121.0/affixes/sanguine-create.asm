0000000145c176c8 84db                           test bl, bl
0000000145c176ca 0f8429040000                   je 0x145c17af9
0000000145c176d0 498b842438080000               mov rax, qword ptr [r12 + 0x838]
0000000145c176d8 498b8c2440080000               mov rcx, qword ptr [r12 + 0x840]
0000000145c176e0 31d2                           xor edx, edx
0000000145c176e2 4839d1                         cmp rcx, rdx
0000000145c176e5 0f840e040000                   je 0x145c17af9
0000000145c176eb 803c1001                       cmp byte ptr [rax + rdx], 1
0000000145c176ef 488d5201                       lea rdx, [rdx + 1]
0000000145c176f3 75ed                           jne 0x145c176e2
0000000145c176f5 418b9c24780c0000               mov ebx, dword ptr [r12 + 0xc78]
0000000145c176fd ffc3                           inc ebx
0000000145c176ff 41899c24780c0000               mov dword ptr [r12 + 0xc78], ebx
0000000145c17707 f3450f10b424740c0000           movss xmm14, dword ptr [r12 + 0xc74]
0000000145c17711 498b8c24b80b0000               mov rcx, qword ptr [r12 + 0xbb8]
0000000145c17719 4883c110                       add rcx, 0x10
0000000145c1771d c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17724 0f28cf                         movaps xmm1, xmm7
0000000145c17727 410f28d0                       movaps xmm2, xmm8
0000000145c1772b e82062f7ff                     call 0x145b8d950
0000000145c17730 90                             nop
0000000145c17731 440f28c8                       movaps xmm9, xmm0
0000000145c17735 0f13bd60010000                 movlps qword ptr [rbp + 0x160], xmm7
0000000145c1773c f30f118568010000               movss dword ptr [rbp + 0x168], xmm0
0000000145c17744 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c1774b 4c8d8560010000                 lea r8, [rbp + 0x160]
0000000145c17752 f30f101d260c5800               movss xmm3, dword ptr [rip + 0x580c26]
0000000145c1775a 488b8de8010000                 mov rcx, qword ptr [rbp + 0x1e8]
0000000145c17761 bacd670000                     mov edx, 0x67cd
0000000145c17766 e855aafeff                     call 0x145c021c0
0000000145c1776b 90                             nop
0000000145c1776c 4989c6                         mov r14, rax
0000000145c1776f 488b85e8010000                 mov rax, qword ptr [rbp + 0x1e8]
0000000145c17776 488bb058080000                 mov rsi, qword ptr [rax + 0x858]
0000000145c1777d 483bb048080000                 cmp rsi, qword ptr [rax + 0x848]
0000000145c17784 751b                           jne 0x145c177a1
0000000145c17786 488b85e8010000                 mov rax, qword ptr [rbp + 0x1e8]
0000000145c1778d 488d8848080000                 lea rcx, [rax + 0x848]
0000000145c17794 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c1779b e8304f3d00                     call 0x145fec6d0
0000000145c177a0 90                             nop
0000000145c177a1 f3440f103d66115800             movss xmm15, dword ptr [rip + 0x581166]
0000000145c177aa f3450f58fe                     addss xmm15, xmm14
0000000145c177af f30f1005e9095800               movss xmm0, dword ptr [rip + 0x5809e9]
0000000145c177b7 f3410f58c6                     addss xmm0, xmm14
0000000145c177bc 488b95e8010000                 mov rdx, qword ptr [rbp + 0x1e8]
0000000145c177c3 488b8250080000                 mov rax, qword ptr [rdx + 0x850]
0000000145c177ca 4889f1                         mov rcx, rsi
0000000145c177cd 48c1e105                       shl rcx, 5
0000000145c177d1 4c893408                       mov qword ptr [rax + rcx], r14
0000000145c177d5 895c0808                       mov dword ptr [rax + rcx + 8], ebx
0000000145c177d9 0f137c080c                     movlps qword ptr [rax + rcx + 0xc], xmm7
0000000145c177de f3440f114c0814                 movss dword ptr [rax + rcx + 0x14], xmm9
0000000145c177e5 f3440f117c0818                 movss dword ptr [rax + rcx + 0x18], xmm15
0000000145c177ec f30f1144081c                   movss dword ptr [rax + rcx + 0x1c], xmm0
0000000145c177f2 48ffc6                         inc rsi
0000000145c177f5 4889b258080000                 mov qword ptr [rdx + 0x858], rsi
0000000145c177fc c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17803 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c1780a e82132eaff                     call 0x145abaa30
0000000145c1780f 90                             nop
0000000145c17810 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17817 488d05598aa701                 lea rax, [rip + 0x1a78a59]
0000000145c1781e 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145c17823 48c744242802000000             mov qword ptr [rsp + 0x28], 2
0000000145c1782c 4c8d05b581a701                 lea r8, [rip + 0x1a781b5]
0000000145c17833 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c1783a 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c17841 41b904000000                   mov r9d, 4
0000000145c17847 e8a484eaff                     call 0x145abfcf0
0000000145c1784c 90                             nop
0000000145c1784d c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17854 895c2420                       mov dword ptr [rsp + 0x20], ebx
0000000145c17858 4c8d05168aa701                 lea r8, [rip + 0x1a78a16]
0000000145c1785f 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c17866 488d9538010000                 lea rdx, [rbp + 0x138]
0000000145c1786d 41b902000000                   mov r9d, 2
0000000145c17873 e87823eaff                     call 0x145ab9bf0
0000000145c17878 90                             nop
0000000145c17879 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17880 488d05f689a701                 lea rax, [rip + 0x1a789f6]
0000000145c17887 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145c1788c 48c744242804000000             mov qword ptr [rsp + 0x28], 4
0000000145c17895 4c8d05dd89a701                 lea r8, [rip + 0x1a789dd]
0000000145c1789c 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c178a3 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c178aa 41b904000000                   mov r9d, 4
0000000145c178b0 e83b84eaff                     call 0x145abfcf0
0000000145c178b5 90                             nop
0000000145c178b6 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c178bd f30f117c2420                   movss dword ptr [rsp + 0x20], xmm7
0000000145c178c3 4c8d05b789a701                 lea r8, [rip + 0x1a789b7]
0000000145c178ca 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c178d1 488d9538010000                 lea rdx, [rbp + 0x138]
0000000145c178d8 41b901000000                   mov r9d, 1
0000000145c178de e80d20eaff                     call 0x145ab98f0
0000000145c178e3 90                             nop
0000000145c178e4 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c178eb f3440f11442420                 movss dword ptr [rsp + 0x20], xmm8
0000000145c178f2 4c8d058989a701                 lea r8, [rip + 0x1a78989]
0000000145c178f9 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c17900 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c17907 41b901000000                   mov r9d, 1
0000000145c1790d e8de1feaff                     call 0x145ab98f0
0000000145c17912 90                             nop
0000000145c17913 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c1791a f3440f114c2420                 movss dword ptr [rsp + 0x20], xmm9
0000000145c17921 4c8d055b89a701                 lea r8, [rip + 0x1a7895b]
0000000145c17928 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c1792f 488d9538010000                 lea rdx, [rbp + 0x138]
0000000145c17936 41b901000000                   mov r9d, 1
0000000145c1793c e8af1feaff                     call 0x145ab98f0
0000000145c17941 90                             nop
0000000145c17942 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17949 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145c17952 4c8d052b89a701                 lea r8, [rip + 0x1a7892b]
0000000145c17959 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c17960 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c17967 41b901000000                   mov r9d, 1
0000000145c1796d e8fe1deaff                     call 0x145ab9770
0000000145c17972 90                             nop
0000000145c17973 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c1797a 488d050989a701                 lea rax, [rip + 0x1a78909]
0000000145c17981 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145c17986 48c744242806000000             mov qword ptr [rsp + 0x28], 6
0000000145c1798f 4c8d05ef88a701                 lea r8, [rip + 0x1a788ef]
0000000145c17996 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c1799d 488d9538010000                 lea rdx, [rbp + 0x138]
0000000145c179a4 41b905000000                   mov r9d, 5
0000000145c179aa e84183eaff                     call 0x145abfcf0
0000000145c179af 90                             nop
0000000145c179b0 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c179b7 c74424200000c040               mov dword ptr [rsp + 0x20], 0x40c00000
0000000145c179bf 4c8d05ca88a701                 lea r8, [rip + 0x1a788ca]
0000000145c179c6 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c179cd 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c179d4 41b901000000                   mov r9d, 1
0000000145c179da e8111feaff                     call 0x145ab98f0
0000000145c179df 90                             nop
0000000145c179e0 c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c179e7 f3440f11742420                 movss dword ptr [rsp + 0x20], xmm14
0000000145c179ee 4c8d059c88a701                 lea r8, [rip + 0x1a7889c]
0000000145c179f5 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c179fc 488d9538010000                 lea rdx, [rbp + 0x138]
0000000145c17a03 41b902000000                   mov r9d, 2
0000000145c17a09 e8e21eeaff                     call 0x145ab98f0
0000000145c17a0e 90                             nop
0000000145c17a0f c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17a16 f3440f117c2420                 movss dword ptr [rsp + 0x20], xmm15
0000000145c17a1d 4c8d056f88a701                 lea r8, [rip + 0x1a7886f]
0000000145c17a24 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c17a2b 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c17a32 41b902000000                   mov r9d, 2
0000000145c17a38 e8b31eeaff                     call 0x145ab98f0
0000000145c17a3d 90                             nop
0000000145c17a3e c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17a45 f3440f11742420                 movss dword ptr [rsp + 0x20], xmm14
0000000145c17a4c 4c8d054288a701                 lea r8, [rip + 0x1a78842]
0000000145c17a53 488d8d60010000                 lea rcx, [rbp + 0x160]
0000000145c17a5a 488d9538010000                 lea rdx, [rbp + 0x138]
0000000145c17a61 41b901000000                   mov r9d, 1
0000000145c17a67 e8841eeaff                     call 0x145ab98f0
0000000145c17a6c 90                             nop
0000000145c17a6d c685f701000000                 mov byte ptr [rbp + 0x1f7], 0
0000000145c17a74 488d8d38010000                 lea rcx, [rbp + 0x138]
0000000145c17a7b 488d9560010000                 lea rdx, [rbp + 0x160]
0000000145c17a82 e8097feaff                     call 0x145abf990
0000000145c17a87 90                             nop
0000000145c17a88 4c8ba5e8010000                 mov r12, qword ptr [rbp + 0x1e8]
0000000145c17a8f 498bb42498060000               mov rsi, qword ptr [r12 + 0x698]
0000000145c17a97 493bb42488060000               cmp rsi, qword ptr [r12 + 0x688]
0000000145c17a9f 752a                           jne 0x145c17acb
0000000145c17aa1 498d8c2488060000               lea rcx, [r12 + 0x688]
0000000145c17aa9 488b8538010000                 mov rax, qword ptr [rbp + 0x138]
0000000145c17ab0 488985c0010000                 mov qword ptr [rbp + 0x1c0], rax
0000000145c17ab7 488b8540010000                 mov rax, qword ptr [rbp + 0x140]
0000000145c17abe 488985b0000000                 mov qword ptr [rbp + 0xb0], rax
0000000145c17ac5 e866493d00                     call 0x145fec430
0000000145c17aca 90                             nop
0000000145c17acb 498b842490060000               mov rax, qword ptr [r12 + 0x690]
0000000145c17ad3 488d0c76                       lea rcx, [rsi + rsi*2]
0000000145c17ad7 488b9548010000                 mov rdx, qword ptr [rbp + 0x148]
0000000145c17ade 488954c810                     mov qword ptr [rax + rcx*8 + 0x10], rdx
0000000145c17ae3 0f108538010000                 movups xmm0, xmmword ptr [rbp + 0x138]
0000000145c17aea 0f1104c8                       movups xmmword ptr [rax + rcx*8], xmm0
0000000145c17aee 48ffc6                         inc rsi
0000000145c17af1 4989b42498060000               mov qword ptr [r12 + 0x698], rsi
