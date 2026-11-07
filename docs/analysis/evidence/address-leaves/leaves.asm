144094d80: 4889c8 mov rax, rcx
144094d83: 895104 mov dword ptr [rcx + 4], edx
144094d86: c6010c mov byte ptr [rcx], 0xc
144094d89: c3 ret
144094d90: 4889c8 mov rax, rcx
144094d93: 895104 mov dword ptr [rcx + 4], edx
144094d96: c6010b mov byte ptr [rcx], 0xb
144094d99: c3 ret
1448e61d0: 488b01 mov rax, qword ptr [rcx]
1448e61d3: 4c8b4108 mov r8, qword ptr [rcx + 8]
1448e61d7: 4c8b4910 mov r9, qword ptr [rcx + 0x10]
1448e61db: 4889c1 mov rcx, rax
1448e61de: e9ed1b0000 jmp 0x1448e7dd0
14517fe00: 660f2ec1 ucomisd xmm0, xmm1
14517fe04: 7a46 jp 0x14517fe4c
14517fe06: 66480f7ec8 movq rax, xmm1
14517fe0b: 48b9ffffffffffffff7f movabs rcx, 0x7fffffffffffffff
14517fe15: 4821c1 and rcx, rax
14517fe18: 48b8000000000000f07f movabs rax, 0x7ff0000000000000
14517fe22: 4839c1 cmp rcx, rax
14517fe25: 0f94c0 sete al
14517fe28: 660f28159046d700 movapd xmm2, xmmword ptr [rip + 0xd74690]
14517fe30: 660f54d0 andpd xmm2, xmm0
14517fe34: 660f2e153403d200 ucomisd xmm2, qword ptr [rip + 0xd20334]
14517fe3c: 0f9bc1 setnp cl
14517fe3f: 0f94c2 sete dl
14517fe42: 20ca and dl, cl
14517fe44: 84c2 test dl, al
14517fe46: 0f84e19bb700 je 0x145cf9a2d
14517fe4c: f20f1005f40fe100 movsd xmm0, qword ptr [rip + 0xe10ff4]
14517fe54: c3 ret
1457ca250: 89c8 mov eax, ecx
1457ca252: 09d0 or eax, edx
1457ca254: c3 ret
1457ca260: 89c8 mov eax, ecx
1457ca262: 31d0 xor eax, edx
1457ca264: c3 ret
1457ca270: 89c8 mov eax, ecx
1457ca272: 21d0 and eax, edx
1457ca274: c3 ret
1457de290: 410fb6c0 movzx eax, r8b
1457de294: c1e018 shl eax, 0x18
1457de297: 0fb6d2 movzx edx, dl
1457de29a: c1e210 shl edx, 0x10
1457de29d: 09c2 or edx, eax
1457de29f: 0fb6c1 movzx eax, cl
1457de2a2: c1e008 shl eax, 8
1457de2a5: 09d0 or eax, edx
1457de2a7: 4883c80f or rax, 0xf
1457de2ab: c3 ret
1457de2d0: 410fb6c0 movzx eax, r8b
1457de2d4: c1e018 shl eax, 0x18
1457de2d7: 0fb6d2 movzx edx, dl
1457de2da: c1e210 shl edx, 0x10
1457de2dd: 09c2 or edx, eax
1457de2df: 0fb6c1 movzx eax, cl
1457de2e2: c1e008 shl eax, 8
1457de2e5: 09d0 or eax, edx
1457de2e7: 4883c811 or rax, 0x11
1457de2eb: c3 ret
1457de2f0: 410fb6c0 movzx eax, r8b
1457de2f4: c1e018 shl eax, 0x18
1457de2f7: 0fb6d2 movzx edx, dl
1457de2fa: c1e210 shl edx, 0x10
1457de2fd: 09c2 or edx, eax
1457de2ff: 0fb6c1 movzx eax, cl
1457de302: c1e008 shl eax, 8
1457de305: 09d0 or eax, edx
1457de307: 4883c810 or rax, 0x10
1457de30b: c3 ret
1457de310: 410fb7c0 movzx eax, r8w
1457de314: 48c1e020 shl rax, 0x20
1457de318: 0fb6d2 movzx edx, dl
1457de31b: c1e210 shl edx, 0x10
1457de31e: 4809c2 or rdx, rax
1457de321: 0fb6c1 movzx eax, cl
1457de324: c1e008 shl eax, 8
1457de327: 4801d0 add rax, rdx
1457de32a: 4883c014 add rax, 0x14
1457de32e: c3 ret
1457de350: 410fb7c0 movzx eax, r8w
1457de354: 48c1e020 shl rax, 0x20
1457de358: 0fb6d2 movzx edx, dl
1457de35b: c1e210 shl edx, 0x10
1457de35e: 4809c2 or rdx, rax
1457de361: 0fb6c1 movzx eax, cl
1457de364: c1e008 shl eax, 8
1457de367: 4801d0 add rax, rdx
1457de36a: 4883c016 add rax, 0x16
1457de36e: c3 ret
1457de370: 410fb7c0 movzx eax, r8w
1457de374: 48c1e020 shl rax, 0x20
1457de378: 0fb6d2 movzx edx, dl
1457de37b: c1e210 shl edx, 0x10
1457de37e: 4809c2 or rdx, rax
1457de381: 0fb6c1 movzx eax, cl
1457de384: c1e008 shl eax, 8
1457de387: 4801d0 add rax, rdx
1457de38a: 4883c015 add rax, 0x15
1457de38e: c3 ret
1457de390: 0fb7c2 movzx eax, dx
1457de393: 48c1e020 shl rax, 0x20
1457de397: 410fb6d0 movzx edx, r8b
1457de39b: c1e210 shl edx, 0x10
1457de39e: 4809c2 or rdx, rax
1457de3a1: 0fb6c1 movzx eax, cl
1457de3a4: c1e008 shl eax, 8
1457de3a7: 4801d0 add rax, rdx
1457de3aa: 4883c018 add rax, 0x18
1457de3ae: c3 ret
1457de3d0: 0fb7c2 movzx eax, dx
1457de3d3: 48c1e020 shl rax, 0x20
1457de3d7: 410fb6d0 movzx edx, r8b
1457de3db: c1e210 shl edx, 0x10
1457de3de: 4809c2 or rdx, rax
1457de3e1: 0fb6c1 movzx eax, cl
1457de3e4: c1e008 shl eax, 8
1457de3e7: 4801d0 add rax, rdx
1457de3ea: 4883c01a add rax, 0x1a
1457de3ee: c3 ret
1457de3f0: 0fb7c2 movzx eax, dx
1457de3f3: 48c1e020 shl rax, 0x20
1457de3f7: 410fb6d0 movzx edx, r8b
1457de3fb: c1e210 shl edx, 0x10
1457de3fe: 4809c2 or rdx, rax
1457de401: 0fb6c1 movzx eax, cl
1457de404: c1e008 shl eax, 8
1457de407: 4801d0 add rax, rdx
1457de40a: 4883c019 add rax, 0x19
1457de40e: c3 ret
1457fb960: 8d51bf lea edx, [rcx - 0x41]
1457fb963: 448d8140ffffff lea r8d, [rcx - 0xc0]
1457fb96a: 8d4120 lea eax, [rcx + 0x20]
1457fb96d: 4183f81f cmp r8d, 0x1f
1457fb971: 0f42c8 cmovb ecx, eax
1457fb974: 83fa1a cmp edx, 0x1a
1457fb977: 0f43c1 cmovae eax, ecx
1457fb97a: c3 ret
1457fb980: 8d519f lea edx, [rcx - 0x61]
1457fb983: 448d8120ffffff lea r8d, [rcx - 0xe0]
1457fb98a: 8d41e0 lea eax, [rcx - 0x20]
1457fb98d: 4183f81f cmp r8d, 0x1f
1457fb991: 0f42c8 cmovb ecx, eax
1457fb994: 83fa1a cmp edx, 0x1a
1457fb997: 0f43c1 cmovae eax, ecx
1457fb99a: c3 ret
145af18c0: 488b09 mov rcx, qword ptr [rcx]
145af18c3: e9f8050000 jmp 0x145af1ec0
