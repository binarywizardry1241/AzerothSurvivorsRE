0000000145bd4660 55                             push rbp
0000000145bd4661 4157                           push r15
0000000145bd4663 4156                           push r14
0000000145bd4665 4155                           push r13
0000000145bd4667 4154                           push r12
0000000145bd4669 56                             push rsi
0000000145bd466a 57                             push rdi
0000000145bd466b 53                             push rbx
0000000145bd466c 4881ec08020000                 sub rsp, 0x208
0000000145bd4673 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bd467b 48c78580010000feffffff         mov qword ptr [rbp + 0x180], 0xfffffffffffffffe
0000000145bd4686 83ba980d000003                 cmp dword ptr [rdx + 0xd98], 3
0000000145bd468d 0f8580020000                   jne 0x145bd4913
0000000145bd4693 4889d6                         mov rsi, rdx
0000000145bd4696 4889cf                         mov rdi, rcx
0000000145bd4699 4c8baa481b0000                 mov r13, qword ptr [rdx + 0x1b48]
0000000145bd46a0 4881c2a0140000                 add rdx, 0x14a0
0000000145bd46a7 448abed0140000                 mov r15b, byte ptr [rsi + 0x14d0]
0000000145bd46ae 448aa6d1140000                 mov r12b, byte ptr [rsi + 0x14d1]
0000000145bd46b5 8a9ed2140000                   mov bl, byte ptr [rsi + 0x14d2]
0000000145bd46bb 488d8d30010000                 lea rcx, [rbp + 0x130]
0000000145bd46c2 e869024600                     call 0x146034930
0000000145bd46c7 488d96b8140000                 lea rdx, [rsi + 0x14b8]
0000000145bd46ce 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145bd46d2 e859024600                     call 0x146034930
0000000145bd46d7 90                             nop 
0000000145bd46d8 0fb686d7140000                 movzx eax, byte ptr [rsi + 0x14d7]
0000000145bd46df 888587000000                   mov byte ptr [rbp + 0x87], al
0000000145bd46e5 8b86d3140000                   mov eax, dword ptr [rsi + 0x14d3]
0000000145bd46eb 898583000000                   mov dword ptr [rbp + 0x83], eax
0000000145bd46f1 0fb686d8140000                 movzx eax, byte ptr [rsi + 0x14d8]
0000000145bd46f8 4488bd80000000                 mov byte ptr [rbp + 0x80], r15b
0000000145bd46ff 4488a581000000                 mov byte ptr [rbp + 0x81], r12b
0000000145bd4706 889d82000000                   mov byte ptr [rbp + 0x82], bl
0000000145bd470c 488b8d40010000                 mov rcx, qword ptr [rbp + 0x140]
0000000145bd4713 48894d60                       mov qword ptr [rbp + 0x60], rcx
0000000145bd4717 0f108530010000                 movups xmm0, xmmword ptr [rbp + 0x130]
0000000145bd471e 0f294550                       movaps xmmword ptr [rbp + 0x50], xmm0
0000000145bd4722 488b4dd0                       mov rcx, qword ptr [rbp - 0x30]
0000000145bd4726 48894d78                       mov qword ptr [rbp + 0x78], rcx
0000000145bd472a 0f1045c0                       movups xmm0, xmmword ptr [rbp - 0x40]
0000000145bd472e 0f114568                       movups xmmword ptr [rbp + 0x68], xmm0
0000000145bd4732 888588000000                   mov byte ptr [rbp + 0x88], al
0000000145bd4738 488d8d30010000                 lea rcx, [rbp + 0x130]
0000000145bd473f 488d5550                       lea rdx, [rbp + 0x50]
0000000145bd4743 e848b7f4ff                     call 0x145b1fe90
0000000145bd4748 488b8530010000                 mov rax, qword ptr [rbp + 0x130]
0000000145bd474f 48898578010000                 mov qword ptr [rbp + 0x178], rax
0000000145bd4756 488b8538010000                 mov rax, qword ptr [rbp + 0x138]
0000000145bd475d 48898570010000                 mov qword ptr [rbp + 0x170], rax
0000000145bd4764 488b9d40010000                 mov rbx, qword ptr [rbp + 0x140]
0000000145bd476b 488d4d50                       lea rcx, [rbp + 0x50]
0000000145bd476f 4889f2                         mov rdx, rsi
0000000145bd4772 e8a9d9ffff                     call 0x145bd2120
0000000145bd4777 90                             nop 
0000000145bd4778 488d8e08120000                 lea rcx, [rsi + 0x1208]
0000000145bd477f e80c57f6ff                     call 0x145b39e90
0000000145bd4784 90                             nop 
0000000145bd4785 4189c6                         mov r14d, eax
0000000145bd4788 488b96180e0000                 mov rdx, qword ptr [rsi + 0xe18]
0000000145bd478f 488b86200e0000                 mov rax, qword ptr [rsi + 0xe20]
0000000145bd4796 488d4da8                       lea rcx, [rbp - 0x58]
0000000145bd479a ff5020                         call qword ptr [rax + 0x20]
0000000145bd479d 90                             nop 
0000000145bd479e 0f1085b0000000                 movups xmm0, xmmword ptr [rbp + 0xb0]
0000000145bd47a5 0f294520                       movaps xmmword ptr [rbp + 0x20], xmm0
0000000145bd47a9 0f1085a0000000                 movups xmm0, xmmword ptr [rbp + 0xa0]
0000000145bd47b0 0f294510                       movaps xmmword ptr [rbp + 0x10], xmm0
0000000145bd47b4 0f108590000000                 movups xmm0, xmmword ptr [rbp + 0x90]
0000000145bd47bb 0f294500                       movaps xmmword ptr [rbp], xmm0
0000000145bd47bf 0f104550                       movups xmm0, xmmword ptr [rbp + 0x50]
0000000145bd47c3 0f104d60                       movups xmm1, xmmword ptr [rbp + 0x60]
0000000145bd47c7 0f105570                       movups xmm2, xmmword ptr [rbp + 0x70]
0000000145bd47cb 0f109d80000000                 movups xmm3, xmmword ptr [rbp + 0x80]
0000000145bd47d2 0f295df0                       movaps xmmword ptr [rbp - 0x10], xmm3
0000000145bd47d6 0f2955e0                       movaps xmmword ptr [rbp - 0x20], xmm2
0000000145bd47da 0f294dd0                       movaps xmmword ptr [rbp - 0x30], xmm1
0000000145bd47de 0f2945c0                       movaps xmmword ptr [rbp - 0x40], xmm0
0000000145bd47e2 0f1045a8                       movups xmm0, xmmword ptr [rbp - 0x58]
0000000145bd47e6 0f294530                       movaps xmmword ptr [rbp + 0x30], xmm0
0000000145bd47ea 488b45b8                       mov rax, qword ptr [rbp - 0x48]
0000000145bd47ee 48894540                       mov qword ptr [rbp + 0x40], rax
0000000145bd47f2 488b9548010000                 mov rdx, qword ptr [rbp + 0x148]
0000000145bd47f9 4885d2                         test rdx, rdx
0000000145bd47fc 7412                           je 0x145bd4810
0000000145bd47fe 488b8d50010000                 mov rcx, qword ptr [rbp + 0x150]
0000000145bd4805 41b801000000                   mov r8d, 1
0000000145bd480b e8c0d942fa                     call 0x1400021d0
0000000145bd4810 488b8ec0140000                 mov rcx, qword ptr [rsi + 0x14c0]
0000000145bd4817 488b96c8140000                 mov rdx, qword ptr [rsi + 0x14c8]
0000000145bd481e e8dd0af3ff                     call 0x145b05300
0000000145bd4823 48898530010000                 mov qword ptr [rbp + 0x130], rax
0000000145bd482a 488b86d00d0000                 mov rax, qword ptr [rsi + 0xdd0]
0000000145bd4831 48698ed80d0000e8040000         imul rcx, qword ptr [rsi + 0xdd8], 0x4e8
0000000145bd483c 4801c1                         add rcx, rax
0000000145bd483f 488b9578010000                 mov rdx, qword ptr [rbp + 0x178]
0000000145bd4846 48895550                       mov qword ptr [rbp + 0x50], rdx
0000000145bd484a 488b9570010000                 mov rdx, qword ptr [rbp + 0x170]
0000000145bd4851 48895558                       mov qword ptr [rbp + 0x58], rdx
0000000145bd4855 48895d60                       mov qword ptr [rbp + 0x60], rbx
0000000145bd4859 0f284530                       movaps xmm0, xmmword ptr [rbp + 0x30]
0000000145bd485d 0f114568                       movups xmmword ptr [rbp + 0x68], xmm0
0000000145bd4861 488b5540                       mov rdx, qword ptr [rbp + 0x40]
0000000145bd4865 48895578                       mov qword ptr [rbp + 0x78], rdx
0000000145bd4869 0f2845c0                       movaps xmm0, xmmword ptr [rbp - 0x40]
0000000145bd486d 0f284dd0                       movaps xmm1, xmmword ptr [rbp - 0x30]
0000000145bd4871 0f2855e0                       movaps xmm2, xmmword ptr [rbp - 0x20]
0000000145bd4875 0f285df0                       movaps xmm3, xmmword ptr [rbp - 0x10]
0000000145bd4879 0f118580000000                 movups xmmword ptr [rbp + 0x80], xmm0
0000000145bd4880 0f118d90000000                 movups xmmword ptr [rbp + 0x90], xmm1
0000000145bd4887 0f1195a0000000                 movups xmmword ptr [rbp + 0xa0], xmm2
0000000145bd488e 0f119db0000000                 movups xmmword ptr [rbp + 0xb0], xmm3
0000000145bd4895 0f284500                       movaps xmm0, xmmword ptr [rbp]
0000000145bd4899 0f1185c0000000                 movups xmmword ptr [rbp + 0xc0], xmm0
0000000145bd48a0 0f284510                       movaps xmm0, xmmword ptr [rbp + 0x10]
0000000145bd48a4 0f1185d0000000                 movups xmmword ptr [rbp + 0xd0], xmm0
0000000145bd48ab 0f284520                       movaps xmm0, xmmword ptr [rbp + 0x20]
0000000145bd48af 0f1185e0000000                 movups xmmword ptr [rbp + 0xe0], xmm0
0000000145bd48b6 4c89adf0000000                 mov qword ptr [rbp + 0xf0], r13
0000000145bd48bd 66c785f80000000000             mov word ptr [rbp + 0xf8], 0
0000000145bd48c6 4489b5fc000000                 mov dword ptr [rbp + 0xfc], r14d
0000000145bd48cd c6850001000001                 mov byte ptr [rbp + 0x100], 1
0000000145bd48d4 4488bd01010000                 mov byte ptr [rbp + 0x101], r15b
0000000145bd48db 4488a502010000                 mov byte ptr [rbp + 0x102], r12b
0000000145bd48e2 48898508010000                 mov qword ptr [rbp + 0x108], rax
0000000145bd48e9 48898d10010000                 mov qword ptr [rbp + 0x110], rcx
0000000145bd48f0 488d8530010000                 lea rax, [rbp + 0x130]
0000000145bd48f7 48898518010000                 mov qword ptr [rbp + 0x118], rax
0000000145bd48fe 4889b520010000                 mov qword ptr [rbp + 0x120], rsi
0000000145bd4905 488d5550                       lea rdx, [rbp + 0x50]
0000000145bd4909 4889f9                         mov rcx, rdi
0000000145bd490c e82fcc1100                     call 0x145cf1540
0000000145bd4911 eb17                           jmp 0x145bd492a
0000000145bd4913 48c70100000000                 mov qword ptr [rcx], 0
0000000145bd491a 48c7410808000000               mov qword ptr [rcx + 8], 8
0000000145bd4922 48c7411000000000               mov qword ptr [rcx + 0x10], 0
0000000145bd492a 4881c408020000                 add rsp, 0x208
0000000145bd4931 5b                             pop rbx
0000000145bd4932 5f                             pop rdi
0000000145bd4933 5e                             pop rsi
0000000145bd4934 415c                           pop r12
0000000145bd4936 415d                           pop r13
0000000145bd4938 415e                           pop r14
0000000145bd493a 415f                           pop r15
0000000145bd493c 5d                             pop rbp
0000000145bd493d c3                             ret 
