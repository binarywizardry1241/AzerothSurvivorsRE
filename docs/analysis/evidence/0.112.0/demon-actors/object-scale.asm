; object-display-scale 0x14592e636..0x14592e65e
0x14592e636: f3440f104f28 movss xmm9, dword ptr [rdi + 0x28]
0x14592e63c: 0fb64739 movzx eax, byte ptr [rdi + 0x39]
0x14592e640: fec8 dec al
0x14592e642: 3c07 cmp al, 7
0x14592e644: 0f878f000000 ja 0x14592e6d9
0x14592e64a: 0fb6c0 movzx eax, al
0x14592e64d: 488d0df4d82d01 lea rcx, [rip + 0x12dd8f4]
0x14592e654: f30f100481 movss xmm0, dword ptr [rcx + rax*4]
0x14592e659: f3410f59c1 mulss xmm0, xmm9

; object-ordinary-scale 0x14592e6d9..0x14592e6e6
0x14592e6d9: f30f10057feb4700 movss xmm0, dword ptr [rip + 0x47eb7f]
0x14592e6e1: f3410f59c1 mulss xmm0, xmm9

; object-collision-radius 0x14592eb73..0x14592eb80
0x14592eb73: f30f1005e9e64700 movss xmm0, dword ptr [rip + 0x47e6e9]
0x14592eb7b: f3410f59c1 mulss xmm0, xmm9

; object-collision-reach 0x14592ec2a..0x14592ec33
0x14592ec2a: f3440f590d65c44800 mulss xmm9, dword ptr [rip + 0x48c465]
