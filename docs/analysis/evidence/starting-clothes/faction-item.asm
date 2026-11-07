; Current0.117.0 [0x145ab8d10,0x145ab8d79) SHA-256 0d0bcb5c238f3f0aa759acbefae4f5c334691a9d4b273e99457b91730f516725
145ab8d10  89c8                     mov eax, ecx
145ab8d12  80fa08                   cmp dl, 8
145ab8d15  7761                     ja 0x145ab8d78
145ab8d17  0fb6ca                   movzx ecx, dl
145ab8d1a  ba64010000               mov edx, 0x164
145ab8d1f  0fa3ca                   bt edx, ecx
145ab8d22  7354                     jae 0x145ab8d78
145ab8d24  3da0860100               cmp eax, 0x186a0
145ab8d29  724d                     jb 0x145ab8d78
145ab8d2b  8d886079feff             lea ecx, [rax - 0x186a0]
145ab8d31  81f9df2e0000             cmp ecx, 0x2edf
145ab8d37  773f                     ja 0x145ab8d78
145ab8d39  bacdcccccc               mov edx, 0xcccccccd
145ab8d3e  480fafd1                 imul rdx, rcx
145ab8d42  48c1ea23                 shr rdx, 0x23
145ab8d46  01d2                     add edx, edx
145ab8d48  8d1492                   lea edx, [rdx + rdx*4]
145ab8d4b  4189c8                   mov r8d, ecx
145ab8d4e  4129d0                   sub r8d, edx
145ab8d51  7525                     jne 0x145ab8d78
145ab8d53  69c9cdcc0000             imul ecx, ecx, 0xcccd
145ab8d59  c1e913                   shr ecx, 0x13
145ab8d5c  69c9cdccffff             imul ecx, ecx, 0xffffcccd
145ab8d62  ffc9                     dec ecx
145ab8d64  66d1c9                   ror cx, 1
145ab8d67  0fb7c9                   movzx ecx, cx
145ab8d6a  8d500a                   lea edx, [rax + 0xa]
145ab8d6d  81f99a190000             cmp ecx, 0x199a
145ab8d73  0f43d0                   cmovae edx, eax
145ab8d76  89d0                     mov eax, edx
145ab8d78  c3                       ret
