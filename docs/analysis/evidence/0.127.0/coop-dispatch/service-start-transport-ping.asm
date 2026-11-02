0000000145cc9770 55                             push rbp
0000000145cc9771 4156                           push r14
0000000145cc9773 56                             push rsi
0000000145cc9774 57                             push rdi
0000000145cc9775 53                             push rbx
0000000145cc9776 4881ec10010000                 sub rsp, 0x110
0000000145cc977d 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145cc9785 48c78588000000feffffff         mov qword ptr [rbp + 0x88], 0xfffffffffffffffe
0000000145cc9790 4c8b31                         mov r14, qword ptr [rcx]
0000000145cc9793 b201                           mov dl, 1
0000000145cc9795 31c0                           xor eax, eax
0000000145cc9797 f0410fb05610                   lock cmpxchg byte ptr [r14 + 0x10], dl
0000000145cc979d 0f85ad010000                   jne 0x145cc9950
0000000145cc97a3 488b3dbe539902                 mov rdi, qword ptr [rip + 0x29953be]
0000000145cc97aa 488b07                         mov rax, qword ptr [rdi]
0000000145cc97ad 48d1e0                         shl rax, 1
0000000145cc97b0 4885c0                         test rax, rax
0000000145cc97b3 0f85ae010000                   jne 0x145cc9967
0000000145cc97b9 c7858000000000000000           mov dword ptr [rbp + 0x80], 0
0000000145cc97c3 410fb64611                     movzx eax, byte ptr [r14 + 0x11]
0000000145cc97c8 8b5908                         mov ebx, dword ptr [rcx + 8]
0000000145cc97cb 498b7678                       mov rsi, qword ptr [r14 + 0x78]
0000000145cc97cf 4883feff                       cmp rsi, -1
0000000145cc97d3 7428                           je 0x145cc97fd
0000000145cc97d5 4180be5901000000               cmp byte ptr [r14 + 0x159], 0
0000000145cc97dd 0f8541010000                   jne 0x145cc9924
0000000145cc97e3 4183be40010000ff               cmp dword ptr [r14 + 0x140], -1
0000000145cc97eb 0f8533010000                   jne 0x145cc9924
0000000145cc97f1 b838010000                     mov eax, 0x138
0000000145cc97f6 b930010000                     mov ecx, 0x130
0000000145cc97fb eb0a                           jmp 0x145cc9807
0000000145cc97fd b888010000                     mov eax, 0x188
0000000145cc9802 b980010000                     mov ecx, 0x180
0000000145cc9807 498b4c0e18                     mov rcx, qword ptr [r14 + rcx + 0x18]
0000000145cc980c 4c897578                       mov qword ptr [rbp + 0x78], r14
0000000145cc9810 498b440618                     mov rax, qword ptr [r14 + rax + 0x18]
0000000145cc9815 ff5028                         call qword ptr [rax + 0x28]
0000000145cc9818 90                             nop 
0000000145cc9819 3c01                           cmp al, 1
0000000145cc981b 4c8b7578                       mov r14, qword ptr [rbp + 0x78]
0000000145cc981f 0f85ff000000                   jne 0x145cc9924
0000000145cc9825 e8d68933fa                     call 0x140002200
0000000145cc982a b901000000                     mov ecx, 1
0000000145cc982f ba01000000                     mov edx, 1
0000000145cc9834 e8878933fa                     call 0x1400021c0
0000000145cc9839 4885c0                         test rax, rax
0000000145cc983c 0f845b010000                   je 0x145cc999d
0000000145cc9842 c60005                         mov byte ptr [rax], 5
0000000145cc9845 48c7456001000000               mov qword ptr [rbp + 0x60], 1
0000000145cc984d 48894568                       mov qword ptr [rbp + 0x68], rax
0000000145cc9851 48c7457001000000               mov qword ptr [rbp + 0x70], 1
0000000145cc9859 c6858700000001                 mov byte ptr [rbp + 0x87], 1
0000000145cc9860 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145cc9869 488d4d60                       lea rcx, [rbp + 0x60]
0000000145cc986d ba01000000                     mov edx, 1
0000000145cc9872 41b808000000                   mov r8d, 8
0000000145cc9878 41b901000000                   mov r9d, 1
0000000145cc987e e8ad823900                     call 0x146061b30
0000000145cc9883 90                             nop 
0000000145cc9884 488b4568                       mov rax, qword ptr [rbp + 0x68]
0000000145cc9888 488b4d70                       mov rcx, qword ptr [rbp + 0x70]
0000000145cc988c 488d5108                       lea rdx, [rcx + 8]
0000000145cc9890 48c7040800000000               mov qword ptr [rax + rcx], 0
0000000145cc9898 48895570                       mov qword ptr [rbp + 0x70], rdx
0000000145cc989c 488955c0                       mov qword ptr [rbp - 0x40], rdx
0000000145cc98a0 0f104560                       movups xmm0, xmmword ptr [rbp + 0x60]
0000000145cc98a4 0f1145b0                       movups xmmword ptr [rbp - 0x50], xmm0
0000000145cc98a8 895dc8                         mov dword ptr [rbp - 0x38], ebx
0000000145cc98ab 48b80500000000000080           movabs rax, 0x8000000000000005
0000000145cc98b5 488945a8                       mov qword ptr [rbp - 0x58], rax
0000000145cc98b9 4883feff                       cmp rsi, -1
0000000145cc98bd 742d                           je 0x145cc98ec
0000000145cc98bf 488b4578                       mov rax, qword ptr [rbp + 0x78]
0000000145cc98c3 488bb048010000                 mov rsi, qword ptr [rax + 0x148]
0000000145cc98ca 488b9850010000                 mov rbx, qword ptr [rax + 0x150]
0000000145cc98d1 488d4d48                       lea rcx, [rbp + 0x48]
0000000145cc98d5 488d55a8                       lea rdx, [rbp - 0x58]
0000000145cc98d9 e8327d1f00                     call 0x145ec1610
0000000145cc98de 90                             nop 
0000000145cc98df 488d5548                       lea rdx, [rbp + 0x48]
0000000145cc98e3 4889f1                         mov rcx, rsi
0000000145cc98e6 ff5318                         call qword ptr [rbx + 0x18]
0000000145cc98e9 90                             nop 
0000000145cc98ea eb2b                           jmp 0x145cc9917
0000000145cc98ec 488b4578                       mov rax, qword ptr [rbp + 0x78]
0000000145cc98f0 488bb098010000                 mov rsi, qword ptr [rax + 0x198]
0000000145cc98f7 488b98a0010000                 mov rbx, qword ptr [rax + 0x1a0]
0000000145cc98fe 488d4d48                       lea rcx, [rbp + 0x48]
0000000145cc9902 488d55a8                       lea rdx, [rbp - 0x58]
0000000145cc9906 e8057d1f00                     call 0x145ec1610
0000000145cc990b 90                             nop 
0000000145cc990c 488d5548                       lea rdx, [rbp + 0x48]
0000000145cc9910 4889f1                         mov rcx, rsi
0000000145cc9913 ff5318                         call qword ptr [rbx + 0x18]
0000000145cc9916 90                             nop 
0000000145cc9917 488d4da8                       lea rcx, [rbp - 0x58]
0000000145cc991b e820c5feff                     call 0x145cb5e40
0000000145cc9920 4c8b7578                       mov r14, qword ptr [rbp + 0x78]
0000000145cc9924 80bd8000000000                 cmp byte ptr [rbp + 0x80], 0
0000000145cc992b 750b                           jne 0x145cc9938
0000000145cc992d 488b07                         mov rax, qword ptr [rdi]
0000000145cc9930 48d1e0                         shl rax, 1
0000000145cc9933 4885c0                         test rax, rax
0000000145cc9936 7555                           jne 0x145cc998d
0000000145cc9938 31c0                           xor eax, eax
0000000145cc993a 41864610                       xchg byte ptr [r14 + 0x10], al
0000000145cc993e 3c02                           cmp al, 2
0000000145cc9940 743d                           je 0x145cc997f
0000000145cc9942 4881c410010000                 add rsp, 0x110
0000000145cc9949 5b                             pop rbx
0000000145cc994a 5f                             pop rdi
0000000145cc994b 5e                             pop rsi
0000000145cc994c 415e                           pop r14
0000000145cc994e 5d                             pop rbp
0000000145cc994f c3                             ret 
0000000145cc9950 498d4610                       lea rax, [r14 + 0x10]
0000000145cc9954 4889ce                         mov rsi, rcx
0000000145cc9957 4889c1                         mov rcx, rax
0000000145cc995a e8b1d65300                     call 0x146207010
0000000145cc995f 4889f1                         mov rcx, rsi
0000000145cc9962 e93cfeffff                     jmp 0x145cc97a3
0000000145cc9967 4889ce                         mov rsi, rcx
0000000145cc996a e831e45300                     call 0x146207da0
0000000145cc996f 4889f1                         mov rcx, rsi
0000000145cc9972 3401                           xor al, 1
0000000145cc9974 898580000000                   mov dword ptr [rbp + 0x80], eax
0000000145cc997a e944feffff                     jmp 0x145cc97c3
0000000145cc997f 4983c610                       add r14, 0x10
0000000145cc9983 4c89f1                         mov rcx, r14
0000000145cc9986 e845d75300                     call 0x1462070d0
0000000145cc998b ebb5                           jmp 0x145cc9942
0000000145cc998d e80ee45300                     call 0x146207da0
0000000145cc9992 84c0                           test al, al
0000000145cc9994 75a2                           jne 0x145cc9938
0000000145cc9996 41c6461101                     mov byte ptr [r14 + 0x11], 1
0000000145cc999b eb9b                           jmp 0x145cc9938
0000000145cc999d b901000000                     mov ecx, 1
0000000145cc99a2 ba01000000                     mov edx, 1
0000000145cc99a7 e8a5ef5300                     call 0x146208951
0000000145cc99ac 90                             nop 
0000000145cc99ad 0f0b                           ud2 
