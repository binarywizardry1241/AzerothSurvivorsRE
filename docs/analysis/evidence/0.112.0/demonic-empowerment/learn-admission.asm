14595cec8 498b9100080000 mov rdx, qword ptr [r9 + 0x800]
14595cecf 410f28c1 movaps xmm0, xmm9
14595ced3 4885d2 test rdx, rdx
14595ced6 746e je 0x14595cf46
14595ced8 498b81f8070000 mov rax, qword ptr [r9 + 0x7f8]
14595cedf 4883fa01 cmp rdx, 1
14595cee3 7508 jne 0x14595ceed
14595cee5 31c9 xor ecx, ecx
14595cee7 410f28c1 movaps xmm0, xmm9
14595ceeb eb4d jmp 0x14595cf3a
14595ceed 4989d0 mov r8, rdx
14595cef0 4983e0fe and r8, 0xfffffffffffffffe
14595cef4 31c9 xor ecx, ecx
14595cef6 410f28c1 movaps xmm0, xmm9
14595cefa eb0d jmp 0x14595cf09
14595cefc 0f1f4000 nop dword ptr [rax]
14595cf00 4883c102 add rcx, 2
14595cf04 4939c8 cmp r8, rcx
14595cf07 742c je 0x14595cf35
14595cf09 803cc820 cmp byte ptr [rax + rcx*8], 0x20
14595cf0d 7411 je 0x14595cf20
14595cf0f 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
14595cf14 75ea jne 0x14595cf00
14595cf16 eb15 jmp 0x14595cf2d
14595cf18 0f1f840000000000 nop dword ptr [rax + rax]
14595cf20 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14595cf26 807cc80820 cmp byte ptr [rax + rcx*8 + 8], 0x20
14595cf2b 75d3 jne 0x14595cf00
14595cf2d f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
14595cf33 ebcb jmp 0x14595cf00
14595cf35 f6c201 test dl, 1
14595cf38 740c je 0x14595cf46
14595cf3a 803cc820 cmp byte ptr [rax + rcx*8], 0x20
14595cf3e 7506 jne 0x14595cf46
14595cf40 f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
14595cf46 498b8130080000 mov rax, qword ptr [r9 + 0x830]
14595cf4d 4885c0 test rax, rax
14595cf50 0f8474fdffff je 0x14595ccca
14595cf56 498b8928080000 mov rcx, qword ptr [r9 + 0x828]
14595cf5d 48c1e006 shl rax, 6
14595cf61 31d2 xor edx, edx
14595cf63 410f2ec2 ucomiss xmm0, xmm10
14595cf67 7724 ja 0x14595cf8d
14595cf69 eb62 jmp 0x14595cfcd
14595cf6b 0f1f440000 nop dword ptr [rax + rax]
14595cf70 4c8b441108 mov r8, qword ptr [rcx + rdx + 8]
14595cf75 4180783904 cmp byte ptr [r8 + 0x39], 4
14595cf7a 0f874efeffff ja 0x14595cdce
14595cf80 4883c240 add rdx, 0x40
14595cf84 4839d0 cmp rax, rdx
14595cf87 0f843dfdffff je 0x14595ccca
14595cf8d 440fb60411 movzx r8d, byte ptr [rcx + rdx]
14595cf92 4183f81d cmp r8d, 0x1d
14595cf96 74d8 je 0x14595cf70
14595cf98 4183c0df add r8d, -0x21
14595cf9c 4183f802 cmp r8d, 2
14595cfa0 73de jae 0x14595cf80
14595cfa2 e927feffff jmp 0x14595cdce
14595cfa7 660f1f840000000000 nop word ptr [rax + rax]
14595cfb0 4c8b441108 mov r8, qword ptr [rcx + rdx + 8]
14595cfb5 4180783900 cmp byte ptr [r8 + 0x39], 0
14595cfba 0f850efeffff jne 0x14595cdce
14595cfc0 4883c240 add rdx, 0x40
14595cfc4 4839d0 cmp rax, rdx
14595cfc7 0f84fdfcffff je 0x14595ccca
14595cfcd 440fb60411 movzx r8d, byte ptr [rcx + rdx]
14595cfd2 4183f81d cmp r8d, 0x1d
14595cfd6 74d8 je 0x14595cfb0
14595cfd8 4183c0e0 add r8d, -0x20
14595cfdc 4183f803 cmp r8d, 3
14595cfe0 73de jae 0x14595cfc0
14595cfe2 e9e7fdffff jmp 0x14595cdce
