; Selected0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Exact native health/actor-membership branches; original function bounds in manifest.
; Native range 0x14594e36a..0x14594e3e3
0x14594e36a: 80be410c000001 cmp byte ptr [rsi + 0xc41], 1
0x14594e371: 756b jne 0x14594e3de
0x14594e373: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
0x14594e37a: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
0x14594e381: e85ab2ebff call 0x1458095e0
0x14594e386: 31c9 xor ecx, ecx
0x14594e388: 83f803 cmp eax, 3
0x14594e38b: 0f92c1 setb cl
0x14594e38e: 488b86500b0000 mov rax, qword ptr [rsi + 0xb50]
0x14594e395: 48ffc8 dec rax
0x14594e398: 780b js 0x14594e3a5
0x14594e39a: 450f57ed xorps xmm13, xmm13
0x14594e39e: f34c0f2ae8 cvtsi2ss xmm13, rax
0x14594e3a3: eb1a jmp 0x14594e3bf
0x14594e3a5: 4889c2 mov rdx, rax
0x14594e3a8: 48d1ea shr rdx, 1
0x14594e3ab: 83e001 and eax, 1
0x14594e3ae: 4809d0 or rax, rdx
0x14594e3b1: 450f57ed xorps xmm13, xmm13
0x14594e3b5: f34c0f2ae8 cvtsi2ss xmm13, rax
0x14594e3ba: f3450f58ed addss xmm13, xmm13
0x14594e3bf: 488d050ae76e01 lea rax, [rip + 0x16ee70a]
0x14594e3c6: f3440f592c88 mulss xmm13, dword ptr [rax + rcx*4]
0x14594e3cc: f3440f592d9f205a00 mulss xmm13, dword ptr [rip + 0x5a209f]
0x14594e3d5: f3440f582dd21a5900 addss xmm13, dword ptr [rip + 0x591ad2]
0x14594e3de: f3450f59d1 mulss xmm10, xmm9
; Native range 0x14594e52a..0x14594e54f
0x14594e52a: 440f14e8 unpcklps xmm13, xmm0
0x14594e52e: 410fb7c4 movzx eax, r12w
0x14594e532: 0f57c0 xorps xmm0, xmm0
0x14594e535: f30f2ac0 cvtsi2ss xmm0, eax
0x14594e539: f3440f103d7e1e5900 movss xmm15, dword ptr [rip + 0x591e7e]
0x14594e542: f3410f5ec7 divss xmm0, xmm15
0x14594e547: 440f14d0 unpcklps xmm10, xmm0
0x14594e54b: 450f59d5 mulps xmm10, xmm13
; Native range 0x14594be6c..0x14594bea7
0x14594be6c: 80be410c000001 cmp byte ptr [rsi + 0xc41], 1
0x14594be73: 7525 jne 0x14594be9a
0x14594be75: 31c9 xor ecx, ecx
0x14594be77: 83fb03 cmp ebx, 3
0x14594be7a: 0f92c1 setb cl
0x14594be7d: 488b96500b0000 mov rdx, qword ptr [rsi + 0xb50]
0x14594be84: 48ffca dec rdx
0x14594be87: 0f8818010000 js 0x14594bfa5
0x14594be8d: 0f57db xorps xmm3, xmm3
0x14594be90: f3480f2ada cvtsi2ss xmm3, rdx
0x14594be95: e923010000 jmp 0x14594bfbd
0x14594be9a: f30f101d0e405900 movss xmm3, dword ptr [rip + 0x59400e]
0x14594bea2: e932010000 jmp 0x14594bfd9
; Native range 0x14594bfa5..0x14594c015
0x14594bfa5: 4989d0 mov r8, rdx
0x14594bfa8: 49d1e8 shr r8, 1
0x14594bfab: 83e201 and edx, 1
0x14594bfae: 4c09c2 or rdx, r8
0x14594bfb1: 0f57db xorps xmm3, xmm3
0x14594bfb4: f3480f2ada cvtsi2ss xmm3, rdx
0x14594bfb9: f30f58db addss xmm3, xmm3
0x14594bfbd: 488d150c0b6f01 lea rdx, [rip + 0x16f0b0c]
0x14594bfc4: f30f591c8a mulss xmm3, dword ptr [rdx + rcx*4]
0x14594bfc9: f30f591dff445a00 mulss xmm3, dword ptr [rip + 0x5a44ff]
0x14594bfd1: f30f581dd73e5900 addss xmm3, dword ptr [rip + 0x593ed7]
0x14594bfd9: f30f590d27359e01 mulss xmm1, dword ptr [rip + 0x19e3527]
0x14594bfe1: f30f59cf mulss xmm1, xmm7
0x14594bfe5: 0fb7c0 movzx eax, ax
0x14594bfe8: 450f57c0 xorps xmm8, xmm8
0x14594bfec: f3440f2ac0 cvtsi2ss xmm8, eax
0x14594bff1: f30f59ca mulss xmm1, xmm2
0x14594bff5: 66440f6e96cc020000 movd xmm10, dword ptr [rsi + 0x2cc]
0x14594bffe: f3440f5e05b9435900 divss xmm8, dword ptr [rip + 0x5943b9]
0x14594c007: f30f59c1 mulss xmm0, xmm1
0x14594c00b: f3440f59c0 mulss xmm8, xmm0
0x14594c010: f3440f59c3 mulss xmm8, xmm3
; Native range 0x145983718..0x145983784
0x145983718: 80be410c000001 cmp byte ptr [rsi + 0xc41], 1
0x14598371f: 7563 jne 0x145983784
0x145983721: 4889f9 mov rcx, rdi
0x145983724: 4889da mov rdx, rbx
0x145983727: e8b45ee8ff call 0x1458095e0
0x14598372c: 31c9 xor ecx, ecx
0x14598372e: 83f803 cmp eax, 3
0x145983731: 0f92c1 setb cl
0x145983734: 488b86500b0000 mov rax, qword ptr [rsi + 0xb50]
0x14598373b: 48ffc8 dec rax
0x14598373e: 780b js 0x14598374b
0x145983740: 450f57e4 xorps xmm12, xmm12
0x145983744: f34c0f2ae0 cvtsi2ss xmm12, rax
0x145983749: eb1a jmp 0x145983765
0x14598374b: 4889c2 mov rdx, rax
0x14598374e: 48d1ea shr rdx, 1
0x145983751: 83e001 and eax, 1
0x145983754: 4809d0 or rax, rdx
0x145983757: 450f57e4 xorps xmm12, xmm12
0x14598375b: f34c0f2ae0 cvtsi2ss xmm12, rax
0x145983760: f3450f58e4 addss xmm12, xmm12
0x145983765: 488d0564936b01 lea rax, [rip + 0x16b9364]
0x14598376c: f3440f592488 mulss xmm12, dword ptr [rax + rcx*4]
0x145983772: f3440f592555cd5600 mulss xmm12, dword ptr [rip + 0x56cd55]
0x14598377b: f3440f58252cc75500 addss xmm12, dword ptr [rip + 0x55c72c]
; Native range 0x145983846..0x145983853
0x145983846: f30f59c3 mulss xmm0, xmm3
0x14598384a: f30f59c1 mulss xmm0, xmm1
0x14598384e: f3410f59c4 mulss xmm0, xmm12
