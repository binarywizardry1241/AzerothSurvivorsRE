145950134: f3410f104558 movss xmm0, dword ptr [r13 + 0x58]
14595013a: 410f2e4550 ucomiss xmm0, dword ptr [r13 + 0x50]
14595013f: 0f87a7fcffff ja 0x14594fdec
145950145: f3410f104570 movss xmm0, dword ptr [r13 + 0x70]
14595014b: 0f57c9 xorps xmm1, xmm1
14595014e: 0f2ec1 ucomiss xmm0, xmm1
145950151: 0f8795fcffff ja 0x14594fdec
145950157: f3410f10451c movss xmm0, dword ptr [r13 + 0x1c]
14595015d: 0f2ec1 ucomiss xmm0, xmm1
145950160: 0f9ac1 setp cl
145950163: 0f95c2 setne dl
145950166: 08ca or dl, cl
145950168: 20d0 and al, dl
14595016a: 3c01 cmp al, 1
14595016c: 0f847afcffff je 0x14594fdec
