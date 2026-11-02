140190456 f30f100542cec005 movss xmm0, dword ptr [rip + 0x5c0ce42]
14019045e 40f6c701 test dil, 1
140190462 7538 jne 0x14019049c
140190464 48c1ef20 shr rdi, 0x20
140190468 89f8 mov eax, edi
14019046a 25ffffff7f and eax, 0x7fffffff
14019046f 3dffff7f7f cmp eax, 0x7f7fffff
140190474 7f26 jg 0x14019049c
140190476 660f6ec7 movd xmm0, edi
14019047a f30f100d22cec005 movss xmm1, dword ptr [rip + 0x5c0ce22]
140190482 f30f5fc8 maxss xmm1, xmm0
140190486 f30f10057a48c405 movss xmm0, dword ptr [rip + 0x5c4487a]
14019048e f30f5dc1 minss xmm0, xmm1
140190492 eb08 jmp 0x14019049c
140190494 f30f100504cec005 movss xmm0, dword ptr [rip + 0x5c0ce04]
