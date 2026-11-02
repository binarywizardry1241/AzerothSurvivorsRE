0000000145bb6642 c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb6649 c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb6650 c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb6657 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb665e 660f28ce                       movapd xmm1, xmm6
0000000145bb6662 e819b70100                     call 0x145bd1d80
0000000145bb6667 90                             nop 
0000000145bb6668 488b8d300d0000                 mov rcx, qword ptr [rbp + 0xd30]
0000000145bb666f 488339ff                       cmp qword ptr [rcx], -1
0000000145bb6673 0f95c1                         setne cl
0000000145bb6676 20c8                           and al, cl
0000000145bb6678 3c01                           cmp al, 1
0000000145bb667a 0f8556040000                   jne 0x145bb6ad6
0000000145bb6680 c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb6687 c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb668e c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb6695 488b8df00c0000                 mov rcx, qword ptr [rbp + 0xcf0]
0000000145bb669c 488d15ddcd4c01                 lea rdx, [rip + 0x14ccddd]
0000000145bb66a3 e8c8981000                     call 0x145cbff70
0000000145bb66a8 90                             nop 
0000000145bb66a9 e928040000                     jmp 0x145bb6ad6
0000000145bb66ae 6690                           nop 
0000000145bb66b0 83fe1d                         cmp esi, 0x1d
0000000145bb66b3 0f8711080000                   ja 0x145bb6eca
0000000145bb66b9 b800fe002c                     mov eax, 0x2c00fe00
0000000145bb66be 0fa3f0                         bt eax, esi
0000000145bb66c1 0f8303080000                   jae 0x145bb6eca
0000000145bb66c7 c6853e0d000000                 mov byte ptr [rbp + 0xd3e], 0
0000000145bb66ce 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb66d5 4c89fa                         mov rdx, r15
0000000145bb66d8 e833460100                     call 0x145bcad10
0000000145bb66dd 90                             nop 
0000000145bb66de c6853e0d000000                 mov byte ptr [rbp + 0xd3e], 0
0000000145bb66e5 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb66ec e84fe90100                     call 0x145bd5040
0000000145bb66f1 90                             nop 
0000000145bb66f2 e971feffff                     jmp 0x145bb6568
0000000145bb66f7 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb66fe 83b8980d000003                 cmp dword ptr [rax + 0xd98], 3
0000000145bb6705 0f85cb030000                   jne 0x145bb6ad6
0000000145bb670b 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb6712 488b88d80d0000                 mov rcx, qword ptr [rax + 0xdd8]
0000000145bb6719 4885c9                         test rcx, rcx
0000000145bb671c 0f84b4030000                   je 0x145bb6ad6
0000000145bb6722 488b8508030000                 mov rax, qword ptr [rbp + 0x308]
0000000145bb6729 488b95800d0000                 mov rdx, qword ptr [rbp + 0xd80]
0000000145bb6730 4c8bb2d00d0000                 mov r14, qword ptr [rdx + 0xdd0]
0000000145bb6737 4869c9e8040000                 imul rcx, rcx, 0x4e8
0000000145bb673e 4981c678020000                 add r14, 0x278
0000000145bb6745 31f6                           xor esi, esi
0000000145bb6747 eb1e                           jmp 0x145bb6767
0000000145bb6749 0f1f8000000000                 nop dword ptr [rax]
0000000145bb6750 48ffc6                         inc rsi
0000000145bb6753 4981c6e8040000                 add r14, 0x4e8
0000000145bb675a 4881c118fbffff                 add rcx, -0x4e8
0000000145bb6761 0f846f030000                   je 0x145bb6ad6
0000000145bb6767 49837e18ff                     cmp qword ptr [r14 + 0x18], -1
0000000145bb676c 74e2                           je 0x145bb6750
0000000145bb676e 493986d0010000                 cmp qword ptr [r14 + 0x1d0], rax
0000000145bb6775 75d9                           jne 0x145bb6750
0000000145bb6777 e884ba44fa                     call 0x140002200
0000000145bb677c b916000000                     mov ecx, 0x16
0000000145bb6781 ba01000000                     mov edx, 1
0000000145bb6786 e835ba44fa                     call 0x1400021c0
0000000145bb678b 4885c0                         test rax, rax
0000000145bb678e 0f8457440000                   je 0x145bbabeb
0000000145bb6794 0f1005e5d54c01                 movups xmm0, xmmword ptr [rip + 0x14cd5e5]
0000000145bb679b 0f1100                         movups xmmword ptr [rax], xmm0
0000000145bb679e 48b9796f752061776179           movabs rcx, 0x7961776120756f79
0000000145bb67a8 4889480e                       mov qword ptr [rax + 0xe], rcx
0000000145bb67ac 48c7855806000016000000         mov qword ptr [rbp + 0x658], 0x16
0000000145bb67b7 48898560060000                 mov qword ptr [rbp + 0x660], rax
0000000145bb67be 48c7856806000016000000         mov qword ptr [rbp + 0x668], 0x16
0000000145bb67c9 48b80200000000000080           movabs rax, 0x8000000000000002
0000000145bb67d3 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb67da 498b8e50020000                 mov rcx, qword ptr [r14 + 0x250]
0000000145bb67e1 498b9658020000                 mov rdx, qword ptr [r14 + 0x258]
0000000145bb67e8 4d89f0                         mov r8, r14
0000000145bb67eb e840b4fdff                     call 0x145b91c30
0000000145bb67f0 90                             nop 
0000000145bb67f1 498bbe50020000                 mov rdi, qword ptr [r14 + 0x250]
0000000145bb67f8 498b8658020000                 mov rax, qword ptr [r14 + 0x258]
0000000145bb67ff 488985100d0000                 mov qword ptr [rbp + 0xd10], rax
0000000145bb6806 488d8d500c0000                 lea rcx, [rbp + 0xc50]
0000000145bb680d 488d9550060000                 lea rdx, [rbp + 0x650]
0000000145bb6814 e877e21500                     call 0x145d14a90
0000000145bb6819 90                             nop 
0000000145bb681a 488b95580c0000                 mov rdx, qword ptr [rbp + 0xc58]
0000000145bb6821 4c8b85600c0000                 mov r8, qword ptr [rbp + 0xc60]
0000000145bb6828 f04c010518aaaa02               lock add qword ptr [rip + 0x2aaaa18], r8
0000000145bb6830 f048ff0520aaaa02               lock inc qword ptr [rip + 0x2aaaa20]
0000000145bb6838 4889f9                         mov rcx, rdi
0000000145bb683b 488995180d0000                 mov qword ptr [rbp + 0xd18], rdx
0000000145bb6842 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145bb6849 ff5018                         call qword ptr [rax + 0x18]
0000000145bb684c 90                             nop 
0000000145bb684d 488b95500c0000                 mov rdx, qword ptr [rbp + 0xc50]
0000000145bb6854 4885d2                         test rdx, rdx
0000000145bb6857 488dbd500c0000                 lea rdi, [rbp + 0xc50]
0000000145bb685e 7412                           je 0x145bb6872
0000000145bb6860 41b801000000                   mov r8d, 1
0000000145bb6866 488b8d180d0000                 mov rcx, qword ptr [rbp + 0xd18]
0000000145bb686d e85eb944fa                     call 0x1400021d0
0000000145bb6872 c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb6879 c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb6880 c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb6887 488d8d50060000                 lea rcx, [rbp + 0x650]
0000000145bb688e e83d3dffff                     call 0x145baa5d0
0000000145bb6893 90                             nop 
0000000145bb6894 498b8e50020000                 mov rcx, qword ptr [r14 + 0x250]
0000000145bb689b 498b8658020000                 mov rax, qword ptr [r14 + 0x258]
0000000145bb68a2 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145bb68a6 c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb68ad c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb68b4 c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb68bb ffd0                           call rax
0000000145bb68bd 90                             nop 
0000000145bb68be c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb68c5 c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb68cc c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb68d3 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb68da 4889f2                         mov rdx, rsi
0000000145bb68dd e8ce100200                     call 0x145bd79b0
0000000145bb68e2 90                             nop 
0000000145bb68e3 e9ee010000                     jmp 0x145bb6ad6
0000000145bb68e8 488b85f8010000                 mov rax, qword ptr [rbp + 0x1f8]
0000000145bb68ef 488985100d0000                 mov qword ptr [rbp + 0xd10], rax
0000000145bb68f6 488b8500020000                 mov rax, qword ptr [rbp + 0x200]
0000000145bb68fd 488985180d0000                 mov qword ptr [rbp + 0xd18], rax
0000000145bb6904 488bb508020000                 mov rsi, qword ptr [rbp + 0x208]
0000000145bb690b 4d89e6                         mov r14, r12
0000000145bb690e 498b44242c                     mov rax, qword ptr [r12 + 0x2c]
0000000145bb6913 488985600c0000                 mov qword ptr [rbp + 0xc60], rax
0000000145bb691a 410f1044241c                   movups xmm0, xmmword ptr [r12 + 0x1c]
0000000145bb6920 0f2985500c0000                 movaps xmmword ptr [rbp + 0xc50], xmm0
0000000145bb6927 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb692e 83b8980d000002                 cmp dword ptr [rax + 0xd98], 2
0000000145bb6935 0f85ee040000                   jne 0x145bb6e29
0000000145bb693b 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb6942 488b4010                       mov rax, qword ptr [rax + 0x10]
0000000145bb6946 83f802                         cmp eax, 2
0000000145bb6949 0f85da040000                   jne 0x145bb6e29
0000000145bb694f c685090d000001                 mov byte ptr [rbp + 0xd09], 1
0000000145bb6956 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb695d 660f28ce                       movapd xmm1, xmm6
0000000145bb6961 e81ab40100                     call 0x145bd1d80
0000000145bb6966 90                             nop 
0000000145bb6967 84c0                           test al, al
0000000145bb6969 0f84ba040000                   je 0x145bb6e29
0000000145bb696f 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb6976 488338ff                       cmp qword ptr [rax], -1
0000000145bb697a 0f84ea060000                   je 0x145bb706a
0000000145bb6980 c685090d000001                 mov byte ptr [rbp + 0xd09], 1
0000000145bb6987 488d8d50060000                 lea rcx, [rbp + 0x650]
0000000145bb698e 4889fa                         mov rdx, rdi
0000000145bb6991 e89adf4700                     call 0x146034930
0000000145bb6996 90                             nop 
0000000145bb6997 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb699e 488b10                         mov rdx, qword ptr [rax]
0000000145bb69a1 4885d2                         test rdx, rdx
0000000145bb69a4 7415                           je 0x145bb69bb
0000000145bb69a6 488b85600d0000                 mov rax, qword ptr [rbp + 0xd60]
0000000145bb69ad 488b08                         mov rcx, qword ptr [rax]
0000000145bb69b0 41b801000000                   mov r8d, 1
0000000145bb69b6 e815b844fa                     call 0x1400021d0
0000000145bb69bb 488b8560060000                 mov rax, qword ptr [rbp + 0x660]
0000000145bb69c2 488b8d300d0000                 mov rcx, qword ptr [rbp + 0xd30]
0000000145bb69c9 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb69cd 0f108550060000                 movups xmm0, xmmword ptr [rbp + 0x650]
0000000145bb69d4 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb69d7 488339ff                       cmp qword ptr [rcx], -1
0000000145bb69db 488b85100d0000                 mov rax, qword ptr [rbp + 0xd10]
0000000145bb69e2 48898558060000                 mov qword ptr [rbp + 0x658], rax
0000000145bb69e9 488b85180d0000                 mov rax, qword ptr [rbp + 0xd18]
0000000145bb69f0 48898560060000                 mov qword ptr [rbp + 0x660], rax
0000000145bb69f7 4889b568060000                 mov qword ptr [rbp + 0x668], rsi
0000000145bb69fe 488b85600c0000                 mov rax, qword ptr [rbp + 0xc60]
0000000145bb6a05 488d8d70060000                 lea rcx, [rbp + 0x670]
0000000145bb6a0c 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb6a10 0f2885500c0000                 movaps xmm0, xmmword ptr [rbp + 0xc50]
0000000145bb6a17 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb6a1a 48b80400000000000080           movabs rax, 0x8000000000000004
0000000145bb6a24 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb6a2b 488db550060000                 lea rsi, [rbp + 0x650]
0000000145bb6a32 0f84ae0a0000                   je 0x145bb74e6
0000000145bb6a38 488b8df00c0000                 mov rcx, qword ptr [rbp + 0xcf0]
0000000145bb6a3f 4889f2                         mov rdx, rsi
0000000145bb6a42 e829951000                     call 0x145cbff70
0000000145bb6a47 90                             nop 
0000000145bb6a48 e9990a0000                     jmp 0x145bb74e6
0000000145bb6a4d c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb6a54 c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb6a5b c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb6a62 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb6a69 e8e2d20100                     call 0x145bd3d50
0000000145bb6a6e 90                             nop 
0000000145bb6a6f 488b8d300d0000                 mov rcx, qword ptr [rbp + 0xd30]
0000000145bb6a76 488b01                         mov rax, qword ptr [rcx]
0000000145bb6a79 48c701ffffffff                 mov qword ptr [rcx], 0xffffffffffffffff
0000000145bb6a80 4883f8ff                       cmp rax, -1
0000000145bb6a84 7450                           je 0x145bb6ad6
0000000145bb6a86 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb6a8d 41b840010000                   mov r8d, 0x140
0000000145bb6a93 488d8d58060000                 lea rcx, [rbp + 0x658]
0000000145bb6a9a 488b95600d0000                 mov rdx, qword ptr [rbp + 0xd60]
0000000145bb6aa1 e875ac4a00                     call 0x14606171b
0000000145bb6aa6 90                             nop 
0000000145bb6aa7 488d8d78070000                 lea rcx, [rbp + 0x778]
0000000145bb6aae e8bd951000                     call 0x145cc0070
0000000145bb6ab3 90                             nop 
0000000145bb6ab4 c6857f0d000001                 mov byte ptr [rbp + 0xd7f], 1
0000000145bb6abb c6857e0d000001                 mov byte ptr [rbp + 0xd7e], 1
0000000145bb6ac2 c6857d0d000001                 mov byte ptr [rbp + 0xd7d], 1
0000000145bb6ac9 488d8d50060000                 lea rcx, [rbp + 0x650]
0000000145bb6ad0 e8ab3effff                     call 0x145baa980
0000000145bb6ad5 90                             nop 
0000000145bb6ad6 4c89f9                         mov rcx, r15
0000000145bb6ad9 e83223ffff                     call 0x145ba8e10
0000000145bb6ade 4d89e6                         mov r14, r12
0000000145bb6ae1 e982faffff                     jmp 0x145bb6568
0000000145bb6ae6 488b85f8010000                 mov rax, qword ptr [rbp + 0x1f8]
0000000145bb6aed 488985100d0000                 mov qword ptr [rbp + 0xd10], rax
0000000145bb6af4 488b8500020000                 mov rax, qword ptr [rbp + 0x200]
0000000145bb6afb 488985e00c0000                 mov qword ptr [rbp + 0xce0], rax
0000000145bb6b02 488b8508020000                 mov rax, qword ptr [rbp + 0x208]
0000000145bb6b09 488985a80c0000                 mov qword ptr [rbp + 0xca8], rax
0000000145bb6b10 0fb68550030000                 movzx eax, byte ptr [rbp + 0x350]
0000000145bb6b17 8885b00b0000                   mov byte ptr [rbp + 0xbb0], al
0000000145bb6b1d 0fb6b551030000                 movzx esi, byte ptr [rbp + 0x351]
0000000145bb6b24 4d89e6                         mov r14, r12
0000000145bb6b27 498b44242c                     mov rax, qword ptr [r12 + 0x2c]
0000000145bb6b2c 488985400c0000                 mov qword ptr [rbp + 0xc40], rax
0000000145bb6b33 410f1044241c                   movups xmm0, xmmword ptr [r12 + 0x1c]
0000000145bb6b39 0f2985300c0000                 movaps xmmword ptr [rbp + 0xc30], xmm0
0000000145bb6b40 488b8528020000                 mov rax, qword ptr [rbp + 0x228]
0000000145bb6b47 488985180d0000                 mov qword ptr [rbp + 0xd18], rax
0000000145bb6b4e 488b8d30020000                 mov rcx, qword ptr [rbp + 0x230]
0000000145bb6b55 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb6b5c 83b8980d000002                 cmp dword ptr [rax + 0xd98], 2
0000000145bb6b63 0f8505030000                   jne 0x145bb6e6e
0000000145bb6b69 488b85800d0000                 mov rax, qword ptr [rbp + 0xd80]
0000000145bb6b70 488b4010                       mov rax, qword ptr [rax + 0x10]
0000000145bb6b74 83f802                         cmp eax, 2
0000000145bb6b77 0f85f1020000                   jne 0x145bb6e6e
0000000145bb6b7d 48898d480c0000                 mov qword ptr [rbp + 0xc48], rcx
0000000145bb6b84 488b8538020000                 mov rax, qword ptr [rbp + 0x238]
0000000145bb6b8b 488985e00b0000                 mov qword ptr [rbp + 0xbe0], rax
0000000145bb6b92 c685260d000001                 mov byte ptr [rbp + 0xd26], 1
0000000145bb6b99 488b8d800d0000                 mov rcx, qword ptr [rbp + 0xd80]
0000000145bb6ba0 660f28ce                       movapd xmm1, xmm6
0000000145bb6ba4 e8d7b10100                     call 0x145bd1d80
0000000145bb6ba9 90                             nop 
0000000145bb6baa 84c0                           test al, al
0000000145bb6bac 488b8d480c0000                 mov rcx, qword ptr [rbp + 0xc48]
0000000145bb6bb3 0f84b5020000                   je 0x145bb6e6e
0000000145bb6bb9 488b85300d0000                 mov rax, qword ptr [rbp + 0xd30]
0000000145bb6bc0 488338ff                       cmp qword ptr [rax], -1
0000000145bb6bc4 0f8406050000                   je 0x145bb70d0
0000000145bb6bca 4084f6                         test sil, sil
0000000145bb6bcd 0f84ee040000                   je 0x145bb70c1
0000000145bb6bd3 400fb6c6                       movzx eax, sil
0000000145bb6bd7 4080fe05                       cmp sil, 5
0000000145bb6bdb b905000000                     mov ecx, 5
0000000145bb6be0 0f43c1                         cmovae eax, ecx
0000000145bb6be3 e9db040000                     jmp 0x145bb70c3
0000000145bb6be8 488b85f8010000                 mov rax, qword ptr [rbp + 0x1f8]
0000000145bb6bef 488985100d0000                 mov qword ptr [rbp + 0xd10], rax
0000000145bb6bf6 488b9500020000                 mov rdx, qword ptr [rbp + 0x200]
0000000145bb6bfd 4c8b8508020000                 mov r8, qword ptr [rbp + 0x208]
0000000145bb6c04 488d8d300c0000                 lea rcx, [rbp + 0xc30]
0000000145bb6c0b 488995180d0000                 mov qword ptr [rbp + 0xd18], rdx
0000000145bb6c12 e859d0f9ff                     call 0x145b53c70
0000000145bb6c17 90                             nop 
0000000145bb6c18 488bbd400c0000                 mov rdi, qword ptr [rbp + 0xc40]
0000000145bb6c1f 4885ff                         test rdi, rdi
0000000145bb6c22 488bb5800d0000                 mov rsi, qword ptr [rbp + 0xd80]
0000000145bb6c29 4d89e6                         mov r14, r12
0000000145bb6c2c 0f84e9030000                   je 0x145bb701b
0000000145bb6c32 488b86980d0000                 mov rax, qword ptr [rsi + 0xd98]
0000000145bb6c39 4883e802                       sub rax, 2
0000000145bb6c3d b902000000                     mov ecx, 2
0000000145bb6c42 480f42c1                       cmovb rax, rcx
0000000145bb6c46 4883f802                       cmp rax, 2
0000000145bb6c4a 0f8496020000                   je 0x145bb6ee6
0000000145bb6c50 4883f801                       cmp rax, 1
0000000145bb6c54 0f85c1030000                   jne 0x145bb701b
