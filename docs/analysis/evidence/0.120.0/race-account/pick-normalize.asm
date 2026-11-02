0000000145a98160  55                     push rbp
0000000145a98161  4157                   push r15
0000000145a98163  4156                   push r14
0000000145a98165  4155                   push r13
0000000145a98167  4154                   push r12
0000000145a98169  56                     push rsi
0000000145a9816a  57                     push rdi
0000000145a9816b  53                     push rbx
0000000145a9816c  4883ec58               sub rsp, 0x58
0000000145a98170  488d6c2450             lea rbp, [rsp + 0x50]
0000000145a98175  48c74500feffffff       mov qword ptr [rbp], 0xfffffffffffffffe
0000000145a9817d  4889d3                 mov rbx, rdx
0000000145a98180  4889ce                 mov rsi, rcx
0000000145a98183  0fb64238               movzx eax, byte ptr [rdx + 0x38]
0000000145a98187  04fe                   add al, 0xfe
0000000145a98189  3c0a                   cmp al, 0xa
0000000145a9818b  7310                   jae 0x145a9819d
0000000145a9818d  0fb6c0                 movzx eax, al
0000000145a98190  488d0dc1e24e01         lea rcx, [rip + 0x14ee2c1]
0000000145a98197  488b04c1               mov rax, qword ptr [rcx + rax*8]
0000000145a9819b  eb07                   jmp 0x145a981a4
0000000145a9819d  488d05542f4e01         lea rax, [rip + 0x14e2f54]
0000000145a981a4  0fb6808c000000         movzx eax, byte ptr [rax + 0x8c]
0000000145a981ab  884338                 mov byte ptr [rbx + 0x38], al
0000000145a981ae  0fb67b39               movzx edi, byte ptr [rbx + 0x39]
0000000145a981b2  8d4fff                 lea ecx, [rdi - 1]
0000000145a981b5  80f908                 cmp cl, 8
0000000145a981b8  7224                   jb 0x145a981de
0000000145a981ba  fec8                   dec al
0000000145a981bc  3c0a                   cmp al, 0xa
0000000145a981be  7710                   ja 0x145a981d0
0000000145a981c0  0fb6c0                 movzx eax, al
0000000145a981c3  488d0ddee24e01         lea rcx, [rip + 0x14ee2de]
0000000145a981ca  488b04c1               mov rax, qword ptr [rcx + rax*8]
0000000145a981ce  eb07                   jmp 0x145a981d7
0000000145a981d0  488d0501de4e01         lea rax, [rip + 0x14ede01]
0000000145a981d7  0fb638                 movzx edi, byte ptr [rax]
0000000145a981da  40887b39               mov byte ptr [rbx + 0x39], dil
0000000145a981de  807b3a00               cmp byte ptr [rbx + 0x3a], 0
0000000145a981e2  0f95433a               setne byte ptr [rbx + 0x3a]
0000000145a981e6  0f9545ff               setne byte ptr [rbp - 1]
0000000145a981ea  4c8b7b20               mov r15, qword ptr [rbx + 0x20]
0000000145a981ee  488b5328               mov rdx, qword ptr [rbx + 0x28]
0000000145a981f2  4c89f9                 mov rcx, r15
0000000145a981f5  e8a6aafeff             call 0x145a82ca0
0000000145a981fa  4869c0f0000000         imul rax, rax, 0xf0
0000000145a98201  488d0da00b4e01         lea rcx, [rip + 0x14e0ba0]
0000000145a98208  4c8b6c0808             mov r13, qword ptr [rax + rcx + 8]
0000000145a9820d  4c8b740810             mov r14, qword ptr [rax + rcx + 0x10]
0000000145a98212  e8e99f56fa             call 0x140002200
0000000145a98217  ba01000000             mov edx, 1
0000000145a9821c  4c89f1                 mov rcx, r14
0000000145a9821f  e89c9f56fa             call 0x1400021c0
0000000145a98224  4885c0                 test rax, rax
0000000145a98227  48895df0               mov qword ptr [rbp - 0x10], rbx
0000000145a9822b  0f848f020000           je 0x145a984c0
0000000145a98231  4989c4                 mov r12, rax
0000000145a98234  4889c1                 mov rcx, rax
0000000145a98237  4c89ea                 mov rdx, r13
0000000145a9823a  4d89f0                 mov r8, r14
0000000145a9823d  e869b85000             call 0x145fa3aab
0000000145a98242  488b5318               mov rdx, qword ptr [rbx + 0x18]
0000000145a98246  4885d2                 test rdx, rdx
0000000145a98249  740e                   je 0x145a98259
0000000145a9824b  41b801000000           mov r8d, 1
0000000145a98251  4c89f9                 mov rcx, r15
0000000145a98254  e8779f56fa             call 0x1400021d0
0000000145a98259  4c897318               mov qword ptr [rbx + 0x18], r14
0000000145a9825d  4c896320               mov qword ptr [rbx + 0x20], r12
0000000145a98261  4c897328               mov qword ptr [rbx + 0x28], r14
0000000145a98265  4c8b7308               mov r14, qword ptr [rbx + 8]
0000000145a98269  4c8b7b10               mov r15, qword ptr [rbx + 0x10]
0000000145a9826d  4c89f1                 mov rcx, r14
0000000145a98270  4c89fa                 mov rdx, r15
0000000145a98273  e8880f0000             call 0x145a99200
0000000145a98278  90                     nop
0000000145a98279  3cff                   cmp al, 0xff
0000000145a9827b  0f84f8010000           je 0x145a98479
0000000145a98281  e87a9f56fa             call 0x140002200
0000000145a98286  41bc04000000           mov r12d, 4
0000000145a9828c  b904000000             mov ecx, 4
0000000145a98291  ba01000000             mov edx, 1
0000000145a98296  e8259f56fa             call 0x1400021c0
0000000145a9829b  4885c0                 test rax, rax
0000000145a9829e  0f842c020000           je 0x145a984d0
0000000145a982a4  4989c7                 mov r15, rax
0000000145a982a7  c7004865726f           mov dword ptr [rax], 0x6f726548
0000000145a982ad  41bd04000000           mov r13d, 4
0000000145a982b3  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145a982b7  488b10                 mov rdx, qword ptr [rax]
0000000145a982ba  4885d2                 test rdx, rdx
0000000145a982bd  740e                   je 0x145a982cd
0000000145a982bf  41b801000000           mov r8d, 1
0000000145a982c5  4c89f1                 mov rcx, r14
0000000145a982c8  e8039f56fa             call 0x1400021d0
0000000145a982cd  488b4df0               mov rcx, qword ptr [rbp - 0x10]
0000000145a982d1  4c8929                 mov qword ptr [rcx], r13
0000000145a982d4  4c897908               mov qword ptr [rcx + 8], r15
0000000145a982d8  4c896110               mov qword ptr [rcx + 0x10], r12
0000000145a982dc  8b413b                 mov eax, dword ptr [rcx + 0x3b]
0000000145a982df  0fb6493f               movzx ecx, byte ptr [rcx + 0x3f]
0000000145a982e3  48c1e120               shl rcx, 0x20
0000000145a982e7  4809c1                 or rcx, rax
0000000145a982ea  89fa                   mov edx, edi
0000000145a982ec  440fb645ff             movzx r8d, byte ptr [rbp - 1]
0000000145a982f1  e86a77feff             call 0x145a7fa60
0000000145a982f6  90                     nop
0000000145a982f7  488b7df0               mov rdi, qword ptr [rbp - 0x10]
0000000145a982fb  89473b                 mov dword ptr [rdi + 0x3b], eax
0000000145a982fe  48c1e820               shr rax, 0x20
0000000145a98302  88473f                 mov byte ptr [rdi + 0x3f], al
0000000145a98305  488b4730               mov rax, qword ptr [rdi + 0x30]
0000000145a98309  4889c2                 mov rdx, rax
0000000145a9830c  48c1ea20               shr rdx, 0x20
0000000145a98310  0fb7ca                 movzx ecx, dx
0000000145a98313  81f92c010000           cmp ecx, 0x12c
0000000145a98319  41b82c010000           mov r8d, 0x12c
0000000145a9831f  440f42c2               cmovb r8d, edx
0000000145a98323  4183c09c               add r8d, -0x64
0000000145a98327  31c9                   xor ecx, ecx
0000000145a98329  6683fa64               cmp dx, 0x64
0000000145a9832d  440f42c1               cmovb r8d, ecx
0000000145a98331  410fb7d0               movzx edx, r8w
0000000145a98335  69d2cdcc0000           imul edx, edx, 0xcccd
0000000145a9833b  c1ea12                 shr edx, 0x12
0000000145a9833e  83e2fe                 and edx, 0xfffffffe
0000000145a98341  8d1492                 lea edx, [rdx + rdx*4]
0000000145a98344  83c264                 add edx, 0x64
0000000145a98347  4189c0                 mov r8d, eax
0000000145a9834a  41c1e810               shr r8d, 0x10
0000000145a9834e  4589c2                 mov r10d, r8d
0000000145a98351  4181f8f4010000         cmp r8d, 0x1f4
0000000145a98358  41b9f4010000           mov r9d, 0x1f4
0000000145a9835e  450f43c1               cmovae r8d, r9d
0000000145a98362  4183c09c               add r8d, -0x64
0000000145a98366  664183fa64             cmp r10w, 0x64
0000000145a9836b  440f42c1               cmovb r8d, ecx
0000000145a9836f  450fb7d0               movzx r10d, r8w
0000000145a98373  4569d2af470000         imul r10d, r10d, 0x47af
0000000145a9837a  41c1ea10               shr r10d, 0x10
0000000145a9837e  4529d0                 sub r8d, r10d
0000000145a98381  450fb7c0               movzx r8d, r8w
0000000145a98385  41d1e8                 shr r8d, 1
0000000145a98388  4501d0                 add r8d, r10d
0000000145a9838b  41c1e804               shr r8d, 4
0000000145a9838f  478d0480               lea r8d, [r8 + r8*4]
0000000145a98393  478d0480               lea r8d, [r8 + r8*4]
0000000145a98397  41c1e010               shl r8d, 0x10
0000000145a9839b  440fb7d0               movzx r10d, ax
0000000145a9839f  4181faf4010000         cmp r10d, 0x1f4
0000000145a983a6  440f42c8               cmovb r9d, eax
0000000145a983aa  4183c19c               add r9d, -0x64
0000000145a983ae  6683f864               cmp ax, 0x64
0000000145a983b2  440f42c9               cmovb r9d, ecx
0000000145a983b6  450fb7d1               movzx r10d, r9w
0000000145a983ba  4569d2af470000         imul r10d, r10d, 0x47af
0000000145a983c1  41c1ea10               shr r10d, 0x10
0000000145a983c5  4529d1                 sub r9d, r10d
0000000145a983c8  450fb7c9               movzx r9d, r9w
0000000145a983cc  41d1e9                 shr r9d, 1
0000000145a983cf  4501d1                 add r9d, r10d
0000000145a983d2  41c1e904               shr r9d, 4
0000000145a983d6  478d0c89               lea r9d, [r9 + r9*4]
0000000145a983da  478d0c89               lea r9d, [r9 + r9*4]
0000000145a983de  4183c164               add r9d, 0x64
0000000145a983e2  4989c2                 mov r10, rax
0000000145a983e5  49c1ea30               shr r10, 0x30
0000000145a983e9  48c1e832               shr rax, 0x32
0000000145a983ed  4181fa96000000         cmp r10d, 0x96
0000000145a983f4  41bb96000000           mov r11d, 0x96
0000000145a983fa  450f42da               cmovb r11d, r10d
0000000145a983fe  4183c39c               add r11d, -0x64
0000000145a98402  83f819                 cmp eax, 0x19
0000000145a98405  440f42d9               cmovb r11d, ecx
0000000145a98409  410fb7c3               movzx eax, r11w
0000000145a9840d  69c0cdcc0000           imul eax, eax, 0xcccd
0000000145a98413  c1e812                 shr eax, 0x12
0000000145a98416  8d0480                 lea eax, [rax + rax*4]
0000000145a98419  83c064                 add eax, 0x64
0000000145a9841c  48c1e030               shl rax, 0x30
0000000145a98420  0fb7ca                 movzx ecx, dx
0000000145a98423  48c1e120               shl rcx, 0x20
0000000145a98427  4809c1                 or rcx, rax
0000000145a9842a  4181c000006400         add r8d, 0x640000
0000000145a98431  4909c8                 or r8, rcx
0000000145a98434  410fb7c1               movzx eax, r9w
0000000145a98438  4c09c0                 or rax, r8
0000000145a9843b  48894730               mov qword ptr [rdi + 0x30], rax
0000000145a9843f  0f1007                 movups xmm0, xmmword ptr [rdi]
0000000145a98442  0f104f10               movups xmm1, xmmword ptr [rdi + 0x10]
0000000145a98446  0f105720               movups xmm2, xmmword ptr [rdi + 0x20]
0000000145a9844a  0f115620               movups xmmword ptr [rsi + 0x20], xmm2
0000000145a9844e  0f114e10               movups xmmword ptr [rsi + 0x10], xmm1
0000000145a98452  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145a98455  488b4730               mov rax, qword ptr [rdi + 0x30]
0000000145a98459  48894630               mov qword ptr [rsi + 0x30], rax
0000000145a9845d  488b4738               mov rax, qword ptr [rdi + 0x38]
0000000145a98461  48894638               mov qword ptr [rsi + 0x38], rax
0000000145a98465  4889f0                 mov rax, rsi
0000000145a98468  4883c458               add rsp, 0x58
0000000145a9846c  5b                     pop rbx
0000000145a9846d  5f                     pop rdi
0000000145a9846e  5e                     pop rsi
0000000145a9846f  415c                   pop r12
0000000145a98471  415d                   pop r13
0000000145a98473  415e                   pop r14
0000000145a98475  415f                   pop r15
0000000145a98477  5d                     pop rbp
0000000145a98478  c3                     ret
0000000145a98479  4c89f1                 mov rcx, r14
0000000145a9847c  4c89fa                 mov rdx, r15
0000000145a9847f  e8ecb575fa             call 0x1401f3a70
0000000145a98484  90                     nop
0000000145a98485  4989d0                 mov r8, rdx
0000000145a98488  488d4dd8               lea rcx, [rbp - 0x28]
0000000145a9848c  4889c2                 mov rdx, rax
0000000145a9848f  e8fc150000             call 0x145a99a90
0000000145a98494  90                     nop
0000000145a98495  4c8b6dd8               mov r13, qword ptr [rbp - 0x28]
0000000145a98499  4983fdff               cmp r13, -1
0000000145a9849d  0f84defdffff           je 0x145a98281
0000000145a984a3  4c8b7de0               mov r15, qword ptr [rbp - 0x20]
0000000145a984a7  4c8b65e8               mov r12, qword ptr [rbp - 0x18]
0000000145a984ab  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145a984af  488b10                 mov rdx, qword ptr [rax]
0000000145a984b2  4885d2                 test rdx, rdx
0000000145a984b5  0f8504feffff           jne 0x145a982bf
0000000145a984bb  e90dfeffff             jmp 0x145a982cd
0000000145a984c0  b901000000             mov ecx, 1
0000000145a984c5  4c89f2                 mov rdx, r14
0000000145a984c8  e89e286b00             call 0x14614ad6b
0000000145a984cd  90                     nop
0000000145a984ce  eb10                   jmp 0x145a984e0
0000000145a984d0  b901000000             mov ecx, 1
0000000145a984d5  ba04000000             mov edx, 4
0000000145a984da  e88c286b00             call 0x14614ad6b
0000000145a984df  90                     nop
0000000145a984e0  0f0b                   ud2
