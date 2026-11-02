0000000145bb706a 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145bb7071 48898558060000                 mov qword ptr [rbp + 0x658], rax
0000000145bb7078 488b85180d0000                 mov rax, qword ptr [rbp + 0xd18]
0000000145bb707f 48898560060000                 mov qword ptr [rbp + 0x660], rax
0000000145bb7086 4889b568060000                 mov qword ptr [rbp + 0x668], rsi
0000000145bb708d 498b462c                       mov rax, qword ptr [r14 + 0x2c]
0000000145bb7091 488d8d70060000                 lea rcx, [rbp + 0x670]
0000000145bb7098 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb709c 410f10461c                     movups xmm0, xmmword ptr [r14 + 0x1c]
0000000145bb70a1 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb70a4 48b80400000000000080           movabs rax, 0x8000000000000004
0000000145bb70ae 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb70b5 488db550060000                 lea rsi, [rbp + 0x650]
0000000145bb70bc e925040000                     jmp 0x145bb74e6
0000000145bb70c1 b001                           mov al, 1
0000000145bb70c3 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb70ca 8881591a0000                   mov byte ptr [rcx + 0x1a59], al
0000000145bb70d0 c685260d000001                 mov byte ptr [rbp + 0xd26], 1
0000000145bb70d7 4889f9                         mov rcx, rdi
0000000145bb70da 488b95800d0000                 mov rdx, qword ptr [rbp + 0xd80]
0000000145bb70e1 e81aa60100                     call 0x145bd1700
0000000145bb70e6 90                             nop 
0000000145bb70e7 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb70ee 488338ff                       cmp qword ptr [rax], -1
0000000145bb70f2 0f84f8000000                   je 0x145bb71f0
0000000145bb70f8 c685250d000001                 mov byte ptr [rbp + 0xd25], 1
0000000145bb70ff 488db550060000                 lea rsi, [rbp + 0x650]
0000000145bb7106 4889f1                         mov rcx, rsi
0000000145bb7109 488d95300c0000                 lea rdx, [rbp + 0xc30]
0000000145bb7110 e81bd84700                     call 0x146034930
0000000145bb7115 90                             nop 
0000000145bb7116 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb711d 488b10                         mov rdx, qword ptr [rax]
0000000145bb7120 4885d2                         test rdx, rdx
0000000145bb7123 7415                           je 0x145bb713a
0000000145bb7125 488b85600d0000                 mov rax, qword ptr [rbp + 0xd60]
0000000145bb712c 488b08                         mov rcx, qword ptr [rax]
0000000145bb712f 41b801000000                   mov r8d, 1
0000000145bb7135 e896b044fa                     call 0x1400021d0
0000000145bb713a 488b8560060000                 mov rax, qword ptr [rbp + 0x660]
0000000145bb7141 488b8d300d0000                 mov rcx, qword ptr [rbp + 0xd30]
0000000145bb7148 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb714c 0f108550060000                 movups xmm0, xmmword ptr [rbp + 0x650]
0000000145bb7153 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb7156 c685250d000001                 mov byte ptr [rbp + 0xd25], 1
0000000145bb715d 488d8dc00b0000                 lea rcx, [rbp + 0xbc0]
0000000145bb7164 4889fa                         mov rdx, rdi
0000000145bb7167 e8c4d74700                     call 0x146034930
0000000145bb716c 90                             nop 
0000000145bb716d 408abd990c0000                 mov dil, byte ptr [rbp + 0xc99]
0000000145bb7174 4889f1                         mov rcx, rsi
0000000145bb7177 488d95680c0000                 lea rdx, [rbp + 0xc68]
0000000145bb717e e8add74700                     call 0x146034930
0000000145bb7183 90                             nop 
0000000145bb7184 488bb5900c0000                 mov rsi, qword ptr [rbp + 0xc90]
0000000145bb718b 4885f6                         test rsi, rsi
0000000145bb718e 0f88eb280000                   js 0x145bb9a7f
0000000145bb7194 4088bdd80b0000                 mov byte ptr [rbp + 0xbd8], dil
0000000145bb719b 0fb685980c0000                 movzx eax, byte ptr [rbp + 0xc98]
0000000145bb71a2 8885b80b0000                   mov byte ptr [rbp + 0xbb8], al
0000000145bb71a8 0f8400010000                   je 0x145bb72ae
0000000145bb71ae 488bbd880c0000                 mov rdi, qword ptr [rbp + 0xc88]
0000000145bb71b5 e846b044fa                     call 0x140002200
0000000145bb71ba 41be01000000                   mov r14d, 1
0000000145bb71c0 ba01000000                     mov edx, 1
0000000145bb71c5 4889f1                         mov rcx, rsi
0000000145bb71c8 e8f3af44fa                     call 0x1400021c0
0000000145bb71cd 4885c0                         test rax, rax
0000000145bb71d0 0f84ac280000                   je 0x145bb9a82
0000000145bb71d6 488985780b0000                 mov qword ptr [rbp + 0xb78], rax
0000000145bb71dd 4889c1                         mov rcx, rax
0000000145bb71e0 4889fa                         mov rdx, rdi
0000000145bb71e3 4989f0                         mov r8, rsi
0000000145bb71e6 e830a54a00                     call 0x14606171b
0000000145bb71eb e9ca000000                     jmp 0x145bb72ba
0000000145bb71f0 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145bb71f7 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb71fe 488b85e00c0000                 mov rax, qword ptr [rbp + 0xce0]
0000000145bb7205 48898558060000                 mov qword ptr [rbp + 0x658], rax
0000000145bb720c 488b85a80c0000                 mov rax, qword ptr [rbp + 0xca8]
0000000145bb7213 48898560060000                 mov qword ptr [rbp + 0x660], rax
0000000145bb721a 498b462c                       mov rax, qword ptr [r14 + 0x2c]
0000000145bb721e 488db550060000                 lea rsi, [rbp + 0x650]
0000000145bb7225 48894628                       mov qword ptr [rsi + 0x28], rax
0000000145bb7229 410f10461c                     movups xmm0, xmmword ptr [r14 + 0x1c]
0000000145bb722e 0f114618                       movups xmmword ptr [rsi + 0x18], xmm0
0000000145bb7232 488b85180d0000                 mov rax, qword ptr [rbp + 0xd18]
0000000145bb7239 48898580060000                 mov qword ptr [rbp + 0x680], rax
0000000145bb7240 488b85480c0000                 mov rax, qword ptr [rbp + 0xc48]
0000000145bb7247 48898588060000                 mov qword ptr [rbp + 0x688], rax
0000000145bb724e 488b85e00b0000                 mov rax, qword ptr [rbp + 0xbe0]
0000000145bb7255 48898590060000                 mov qword ptr [rbp + 0x690], rax
0000000145bb725c 0f1085900c0000                 movups xmm0, xmmword ptr [rbp + 0xc90]
0000000145bb7263 0f118688000000                 movups xmmword ptr [rsi + 0x88], xmm0
0000000145bb726a 0f1085500c0000                 movups xmm0, xmmword ptr [rbp + 0xc50]
0000000145bb7271 660f108d600c0000               movupd xmm1, xmmword ptr [rbp + 0xc60]
0000000145bb7279 660f1095700c0000               movupd xmm2, xmmword ptr [rbp + 0xc70]
0000000145bb7281 660f109d800c0000               movupd xmm3, xmmword ptr [rbp + 0xc80]
0000000145bb7289 660f115e78                     movupd xmmword ptr [rsi + 0x78], xmm3
0000000145bb728e 660f115668                     movupd xmmword ptr [rsi + 0x68], xmm2
0000000145bb7293 660f114e58                     movupd xmmword ptr [rsi + 0x58], xmm1
0000000145bb7298 0f114648                       movups xmmword ptr [rsi + 0x48], xmm0
0000000145bb729c 0fb685b00b0000                 movzx eax, byte ptr [rbp + 0xbb0]
0000000145bb72a3 8885e8060000                   mov byte ptr [rbp + 0x6e8], al
0000000145bb72a9 e938020000                     jmp 0x145bb74e6
0000000145bb72ae b801000000                     mov eax, 1
0000000145bb72b3 488985780b0000                 mov qword ptr [rbp + 0xb78], rax
0000000145bb72ba 0fb6bd9a0c0000                 movzx edi, byte ptr [rbp + 0xc9a]
0000000145bb72c1 440fb6b59b0c0000               movzx r14d, byte ptr [rbp + 0xc9b]
0000000145bb72c9 0f1085c00b0000                 movups xmm0, xmmword ptr [rbp + 0xbc0]
0000000145bb72d0 0f2985f00b0000                 movaps xmmword ptr [rbp + 0xbf0], xmm0
0000000145bb72d7 488b85d00b0000                 mov rax, qword ptr [rbp + 0xbd0]
0000000145bb72de 488985000c0000                 mov qword ptr [rbp + 0xc00], rax
0000000145bb72e5 488b8560060000                 mov rax, qword ptr [rbp + 0x660]
0000000145bb72ec 488d8d080c0000                 lea rcx, [rbp + 0xc08]
0000000145bb72f3 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb72f7 0f108550060000                 movups xmm0, xmmword ptr [rbp + 0x650]
0000000145bb72fe 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb7301 488b85f80c0000                 mov rax, qword ptr [rbp + 0xcf8]
0000000145bb7308 488b10                         mov rdx, qword ptr [rax]
0000000145bb730b 4883faff                       cmp rdx, -1
0000000145bb730f 7476                           je 0x145bb7387
0000000145bb7311 4488b5a00b0000                 mov byte ptr [rbp + 0xba0], r14b
0000000145bb7318 4189fe                         mov r14d, edi
0000000145bb731b 4885d2                         test rdx, rdx
0000000145bb731e 488bbd800d0000                 mov rdi, qword ptr [rbp + 0xd80]
0000000145bb7325 7412                           je 0x145bb7339
0000000145bb7327 488b8f68190000                 mov rcx, qword ptr [rdi + 0x1968]
0000000145bb732e 41b801000000                   mov r8d, 1
0000000145bb7334 e897ae44fa                     call 0x1400021d0
0000000145bb7339 488b9778190000                 mov rdx, qword ptr [rdi + 0x1978]
0000000145bb7340 4885d2                         test rdx, rdx
0000000145bb7343 7412                           je 0x145bb7357
0000000145bb7345 488b8f80190000                 mov rcx, qword ptr [rdi + 0x1980]
0000000145bb734c 41b801000000                   mov r8d, 1
0000000145bb7352 e879ae44fa                     call 0x1400021d0
0000000145bb7357 488b9790190000                 mov rdx, qword ptr [rdi + 0x1990]
0000000145bb735e 4885d2                         test rdx, rdx
0000000145bb7361 4489f7                         mov edi, r14d
0000000145bb7364 440fb6b5a00b0000               movzx r14d, byte ptr [rbp + 0xba0]
0000000145bb736c 7419                           je 0x145bb7387
0000000145bb736e 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb7375 488b8898190000                 mov rcx, qword ptr [rax + 0x1998]
0000000145bb737c 41b801000000                   mov r8d, 1
0000000145bb7382 e849ae44fa                     call 0x1400021d0
0000000145bb7387 488b85000c0000                 mov rax, qword ptr [rbp + 0xc00]
0000000145bb738e 488b8df80c0000                 mov rcx, qword ptr [rbp + 0xcf8]
0000000145bb7395 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb7399 488b85080c0000                 mov rax, qword ptr [rbp + 0xc08]
0000000145bb73a0 48894118                       mov qword ptr [rcx + 0x18], rax
0000000145bb73a4 0f2885f00b0000                 movaps xmm0, xmmword ptr [rbp + 0xbf0]
0000000145bb73ab 0f288d100c0000                 movaps xmm1, xmmword ptr [rbp + 0xc10]
0000000145bb73b2 0f114920                       movups xmmword ptr [rcx + 0x20], xmm1
0000000145bb73b6 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb73b9 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb73c0 4889b190190000                 mov qword ptr [rcx + 0x1990], rsi
0000000145bb73c7 488b85780b0000                 mov rax, qword ptr [rbp + 0xb78]
0000000145bb73ce 48898198190000                 mov qword ptr [rcx + 0x1998], rax
0000000145bb73d5 4889b1a0190000                 mov qword ptr [rcx + 0x19a0], rsi
0000000145bb73dc 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145bb73e3 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb73ea 488b85e00c0000                 mov rax, qword ptr [rbp + 0xce0]
0000000145bb73f1 48898558060000                 mov qword ptr [rbp + 0x658], rax
0000000145bb73f8 488b85a80c0000                 mov rax, qword ptr [rbp + 0xca8]
0000000145bb73ff 48898560060000                 mov qword ptr [rbp + 0x660], rax
0000000145bb7406 488b85400c0000                 mov rax, qword ptr [rbp + 0xc40]
0000000145bb740d 488db550060000                 lea rsi, [rbp + 0x650]
0000000145bb7414 48894628                       mov qword ptr [rsi + 0x28], rax
0000000145bb7418 0f2885300c0000                 movaps xmm0, xmmword ptr [rbp + 0xc30]
0000000145bb741f 0f114618                       movups xmmword ptr [rsi + 0x18], xmm0
0000000145bb7423 488b85180d0000                 mov rax, qword ptr [rbp + 0xd18]
0000000145bb742a 48898580060000                 mov qword ptr [rbp + 0x680], rax
0000000145bb7431 488b85480c0000                 mov rax, qword ptr [rbp + 0xc48]
0000000145bb7438 48898588060000                 mov qword ptr [rbp + 0x688], rax
0000000145bb743f 488b85e00b0000                 mov rax, qword ptr [rbp + 0xbe0]
0000000145bb7446 48898590060000                 mov qword ptr [rbp + 0x690], rax
0000000145bb744d 0fb685b80b0000                 movzx eax, byte ptr [rbp + 0xbb8]
0000000145bb7454 8881a8190000                   mov byte ptr [rcx + 0x19a8], al
0000000145bb745a 0fb685d80b0000                 movzx eax, byte ptr [rbp + 0xbd8]
0000000145bb7461 8881a9190000                   mov byte ptr [rcx + 0x19a9], al
0000000145bb7467 4088b9aa190000                 mov byte ptr [rcx + 0x19aa], dil
0000000145bb746e 4488b1ab190000                 mov byte ptr [rcx + 0x19ab], r14b
0000000145bb7475 0f1085900c0000                 movups xmm0, xmmword ptr [rbp + 0xc90]
0000000145bb747c 0f118688000000                 movups xmmword ptr [rsi + 0x88], xmm0
0000000145bb7483 0f1085500c0000                 movups xmm0, xmmword ptr [rbp + 0xc50]
0000000145bb748a 660f108d600c0000               movupd xmm1, xmmword ptr [rbp + 0xc60]
0000000145bb7492 660f1095700c0000               movupd xmm2, xmmword ptr [rbp + 0xc70]
0000000145bb749a 660f109d800c0000               movupd xmm3, xmmword ptr [rbp + 0xc80]
0000000145bb74a2 660f115e78                     movupd xmmword ptr [rsi + 0x78], xmm3
0000000145bb74a7 660f115668                     movupd xmmword ptr [rsi + 0x68], xmm2
0000000145bb74ac 660f114e58                     movupd xmmword ptr [rsi + 0x58], xmm1
0000000145bb74b1 0f114648                       movups xmmword ptr [rsi + 0x48], xmm0
0000000145bb74b5 0fb685b00b0000                 movzx eax, byte ptr [rbp + 0xbb0]
0000000145bb74bc 8885e8060000                   mov byte ptr [rbp + 0x6e8], al
0000000145bb74c2 4883b918190000ff               cmp qword ptr [rcx + 0x1918], -1
0000000145bb74ca 488dbd500c0000                 lea rdi, [rbp + 0xc50]
0000000145bb74d1 4d89e6                         mov r14, r12
0000000145bb74d4 7410                           je 0x145bb74e6
0000000145bb74d6 488b8df00c0000                 mov rcx, qword ptr [rbp + 0xcf0]
0000000145bb74dd 4889f2                         mov rdx, rsi
0000000145bb74e0 e88b8a1000                     call 0x145cbff70
0000000145bb74e5 90                             nop 
0000000145bb74e6 4889f1                         mov rcx, rsi
0000000145bb74e9 e8c216ffff                     call 0x145ba8bb0
0000000145bb74ee e975f0ffff                     jmp 0x145bb6568
