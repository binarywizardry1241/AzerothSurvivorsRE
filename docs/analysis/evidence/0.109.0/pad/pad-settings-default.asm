1445a52d0: 4881ec88000000 sub rsp, 0x88
1445a52d7: e824cfa5fb call 0x140002200
1445a52dc: b988000000 mov ecx, 0x88
1445a52e1: ba08000000 mov edx, 8
1445a52e6: e8d5cea5fb call 0x1400021c0
1445a52eb: 4885c0 test rax, rax
1445a52ee: 7478 je 0x1445a5368
1445a52f0: 0f100519693902 movups xmm0, xmmword ptr [rip + 0x2396919]
1445a52f7: 0f29442430 movaps xmmword ptr [rsp + 0x30], xmm0
1445a52fc: 0f100dfd683902 movups xmm1, xmmword ptr [rip + 0x23968fd]
1445a5303: 0f294c2420 movaps xmmword ptr [rsp + 0x20], xmm1
1445a5308: 0f294c2440 movaps xmmword ptr [rsp + 0x40], xmm1
1445a530d: 0f29442450 movaps xmmword ptr [rsp + 0x50], xmm0
1445a5312: 0f294c2460 movaps xmmword ptr [rsp + 0x60], xmm1
1445a5317: 0f29442470 movaps xmmword ptr [rsp + 0x70], xmm0
1445a531c: 0f1108 movups xmmword ptr [rax], xmm1
1445a531f: 0f114010 movups xmmword ptr [rax + 0x10], xmm0
1445a5323: 0f114820 movups xmmword ptr [rax + 0x20], xmm1
1445a5327: 0f114030 movups xmmword ptr [rax + 0x30], xmm0
1445a532b: 0f114840 movups xmmword ptr [rax + 0x40], xmm1
1445a532f: 0f114050 movups xmmword ptr [rax + 0x50], xmm0
1445a5333: 0f280566433902 movaps xmm0, xmmword ptr [rip + 0x2394366]
1445a533a: 0f114060 movups xmmword ptr [rax + 0x60], xmm0
1445a533e: 0f28056b433902 movaps xmm0, xmmword ptr [rip + 0x239436b]
1445a5345: 0f114070 movups xmmword ptr [rax + 0x70], xmm0
1445a5349: f20f10056f433902 movsd xmm0, qword ptr [rip + 0x239436f]
1445a5351: f20f118080000000 movsd qword ptr [rax + 0x80], xmm0
1445a5359: 488d15504a3902 lea rdx, [rip + 0x2394a50]
1445a5360: 4881c488000000 add rsp, 0x88
1445a5367: c3 ret
1445a5368: b908000000 mov ecx, 8
1445a536d: ba88000000 mov edx, 0x88
1445a5372: e82a3f7f01 call 0x145d992a1
1445a5377: 0f0b ud2
