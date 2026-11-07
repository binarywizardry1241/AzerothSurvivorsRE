145910580: sub       rsp, 0x58
145910584: mov       rax, rcx
145910587: mov       byte ptr [rsp + 0x27], dl
14591058b: mov       rcx, qword ptr [r8]
14591058e: test      rcx, rcx
145910591: je        0x1459105d5
145910593: mov       rdx, qword ptr [r8 + 8]
145910597: movups    xmm0, xmmword ptr [r8 + 0x10]
14591059c: mov       qword ptr [rsp + 0x28], 1
1459105a5: mov       qword ptr [rsp + 0x30], rcx
1459105aa: mov       qword ptr [rsp + 0x38], rdx
1459105af: mov       qword ptr [rsp + 0x40], 1
1459105b8: movups    xmmword ptr [rsp + 0x48], xmm0
1459105bd: lea       rcx, [rsp + 0x28]
1459105c2: lea       rdx, [rsp + 0x27]
1459105c7: mov       r8, rax
1459105ca: call      0x1459a00c0
1459105cf: nop
1459105d0: add       rsp, 0x58
1459105d4: ret
1459105d5: mov       al, 1
1459105d7: add       rsp, 0x58
1459105db: ret
