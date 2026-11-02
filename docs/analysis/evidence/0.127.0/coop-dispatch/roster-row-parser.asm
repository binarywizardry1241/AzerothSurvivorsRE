0000000145d10851 48c785c004000000000000         mov qword ptr [rbp + 0x4c0], 0
0000000145d1085c 48c785c804000008000000         mov qword ptr [rbp + 0x4c8], 8
0000000145d10867 48c785d004000000000000         mov qword ptr [rbp + 0x4d0], 0
0000000145d10872 488d8d28050000                 lea rcx, [rbp + 0x528]
0000000145d10879 ba0f000000                     mov edx, 0xf
0000000145d1087e e88d321b00                     call 0x145ec3b10
0000000145d10883 48898560050000                 mov qword ptr [rbp + 0x560], rax
0000000145d1088a 31f6                           xor esi, esi
0000000145d1088c 488dbd28050000                 lea rdi, [rbp + 0x528]
0000000145d10893 eb38                           jmp 0x145d108cd
0000000145d10895 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145d108a0 48ffc6                         inc rsi
0000000145d108a3 4869cbb8000000                 imul rcx, rbx, 0xb8
0000000145d108aa 48038dc8040000                 add rcx, qword ptr [rbp + 0x4c8]
0000000145d108b1 41b8b8000000                   mov r8d, 0xb8
0000000145d108b7 488d95e0010000                 lea rdx, [rbp + 0x1e0]
0000000145d108be e8580e3500                     call 0x14606171b
0000000145d108c3 48ffc3                         inc rbx
0000000145d108c6 48899dd0040000                 mov qword ptr [rbp + 0x4d0], rbx
0000000145d108cd 483bb560050000                 cmp rsi, qword ptr [rbp + 0x560]
0000000145d108d4 0f83a1190000                   jae 0x145d1227b
0000000145d108da 4889f9                         mov rcx, rdi
0000000145d108dd e89e301b00                     call 0x145ec3980
0000000145d108e2 90                             nop 
0000000145d108e3 4989c5                         mov r13, rax
0000000145d108e6 488d8d20040000                 lea rcx, [rbp + 0x420]
0000000145d108ed 4889fa                         mov rdx, rdi
0000000145d108f0 e8eb2d1b00                     call 0x145ec36e0
0000000145d108f5 90                             nop 
0000000145d108f6 4889f9                         mov rcx, rdi
0000000145d108f9 e8422d1b00                     call 0x145ec3640
0000000145d108fe 90                             nop 
0000000145d108ff 4188c6                         mov r14b, al
0000000145d10902 4889f9                         mov rcx, rdi
0000000145d10905 e8362d1b00                     call 0x145ec3640
0000000145d1090a 90                             nop 
0000000145d1090b 4188c7                         mov r15b, al
0000000145d1090e 4889f9                         mov rcx, rdi
0000000145d10911 e8ba301b00                     call 0x145ec39d0
0000000145d10916 90                             nop 
0000000145d10917 84c0                           test al, al
0000000145d10919 7415                           je 0x145d10930
0000000145d1091b 488d8d50010000                 lea rcx, [rbp + 0x150]
0000000145d10922 4889fa                         mov rdx, rdi
0000000145d10925 e846271b00                     call 0x145ec3070
0000000145d1092a 90                             nop 
0000000145d1092b eb0e                           jmp 0x145d1093b
0000000145d1092d 0f1f00                         nop dword ptr [rax]
0000000145d10930 48c78550010000ffffffff         mov qword ptr [rbp + 0x150], 0xffffffffffffffff
0000000145d1093b 4889f9                         mov rcx, rdi
0000000145d1093e e8ed2f1b00                     call 0x145ec3930
0000000145d10943 90                             nop 
0000000145d10944 89c3                           mov ebx, eax
0000000145d10946 4889f9                         mov rcx, rdi
0000000145d10949 e882301b00                     call 0x145ec39d0
0000000145d1094e 90                             nop 
0000000145d1094f 4188c4                         mov r12b, al
0000000145d10952 4889f9                         mov rcx, rdi
0000000145d10955 e8862f1b00                     call 0x145ec38e0
0000000145d1095a 90                             nop 
0000000145d1095b 31c9                           xor ecx, ecx
0000000145d1095d 6683f8ff                       cmp ax, -1
0000000145d10961 0f95c1                         setne cl
0000000145d10964 4c89ad80020000                 mov qword ptr [rbp + 0x280], r13
0000000145d1096b 0f108520040000                 movups xmm0, xmmword ptr [rbp + 0x420]
0000000145d10972 0f2985e0010000                 movaps xmmword ptr [rbp + 0x1e0], xmm0
0000000145d10979 488b9530040000                 mov rdx, qword ptr [rbp + 0x430]
0000000145d10980 488995f0010000                 mov qword ptr [rbp + 0x1f0], rdx
0000000145d10987 4488b591020000                 mov byte ptr [rbp + 0x291], r14b
0000000145d1098e 4488bd92020000                 mov byte ptr [rbp + 0x292], r15b
0000000145d10995 0f1085b0010000                 movups xmm0, xmmword ptr [rbp + 0x1b0]
0000000145d1099c 488d9510020000                 lea rdx, [rbp + 0x210]
0000000145d109a3 0f114260                       movups xmmword ptr [rdx + 0x60], xmm0
0000000145d109a7 0f1085a0010000                 movups xmm0, xmmword ptr [rbp + 0x1a0]
0000000145d109ae 0f114250                       movups xmmword ptr [rdx + 0x50], xmm0
0000000145d109b2 0f108590010000                 movups xmm0, xmmword ptr [rbp + 0x190]
0000000145d109b9 0f114240                       movups xmmword ptr [rdx + 0x40], xmm0
0000000145d109bd f30f6f8550010000               movdqu xmm0, xmmword ptr [rbp + 0x150]
0000000145d109c5 0f108d60010000                 movups xmm1, xmmword ptr [rbp + 0x160]
0000000145d109cc f30f6f9570010000               movdqu xmm2, xmmword ptr [rbp + 0x170]
0000000145d109d4 0f109d80010000                 movups xmm3, xmmword ptr [rbp + 0x180]
0000000145d109db 0f115a30                       movups xmmword ptr [rdx + 0x30], xmm3
0000000145d109df f30f7f5220                     movdqu xmmword ptr [rdx + 0x20], xmm2
0000000145d109e4 0f114a10                       movups xmmword ptr [rdx + 0x10], xmm1
0000000145d109e8 f30f7f02                       movdqu xmmword ptr [rdx], xmm0
0000000145d109ec 899d8c020000                   mov dword ptr [rbp + 0x28c], ebx
0000000145d109f2 4488a590020000                 mov byte ptr [rbp + 0x290], r12b
0000000145d109f9 66898d88020000                 mov word ptr [rbp + 0x288], cx
0000000145d10a00 6689858a020000                 mov word ptr [rbp + 0x28a], ax
0000000145d10a07 48c785f801000000000000         mov qword ptr [rbp + 0x1f8], 0
0000000145d10a12 48c7850002000001000000         mov qword ptr [rbp + 0x200], 1
0000000145d10a1d 48c7850802000000000000         mov qword ptr [rbp + 0x208], 0
0000000145d10a28 488b9dd0040000                 mov rbx, qword ptr [rbp + 0x4d0]
0000000145d10a2f 483b9dc0040000                 cmp rbx, qword ptr [rbp + 0x4c0]
0000000145d10a36 0f8564feffff                   jne 0x145d108a0
0000000145d10a3c 488d8dc0040000                 lea rcx, [rbp + 0x4c0]
0000000145d10a43 e8a8193800                     call 0x1460923f0
0000000145d10a48 90                             nop 
0000000145d10a49 e952feffff                     jmp 0x145d108a0
