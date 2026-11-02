140c7cb40: 4157 push r15
140c7cb42: 4156 push r14
140c7cb44: 4155 push r13
140c7cb46: 4154 push r12
140c7cb48: 56 push rsi
140c7cb49: 57 push rdi
140c7cb4a: 55 push rbp
140c7cb4b: 53 push rbx
140c7cb4c: 4881ecf8000000 sub rsp, 0xf8
140c7cb53: 4c89cf mov rdi, r9
140c7cb56: 4489c5 mov ebp, r8d
140c7cb59: 4889d3 mov rbx, rdx
140c7cb5c: 4889ce mov rsi, rcx
140c7cb5f: 0f10842468010000 movups xmm0, xmmword ptr [rsp + 0x168]
140c7cb67: 0f118424e8000000 movups xmmword ptr [rsp + 0xe8], xmm0
140c7cb6f: 8b05332c8507 mov eax, dword ptr [rip + 0x7852c33]
140c7cb75: 85c0 test eax, eax
140c7cb77: 0f847e010000 je 0x140c7ccfb
140c7cb7d: 4885db test rbx, rbx
140c7cb80: 0f849b010000 je 0x140c7cd21
140c7cb86: 4889d9 mov rcx, rbx
140c7cb89: 89ea mov edx, ebp
140c7cb8b: e840b11905 call 0x145e17cd0
140c7cb90: 4885c0 test rax, rax
140c7cb93: 0f8488010000 je 0x140c7cd21
140c7cb99: 48837878ff cmp qword ptr [rax + 0x78], -1
140c7cb9e: 0f847d010000 je 0x140c7cd21
140c7cba4: 4c8b8088000000 mov r8, qword ptr [rax + 0x88]
140c7cbab: 4d85c0 test r8, r8
140c7cbae: 0f846d010000 je 0x140c7cd21
140c7cbb4: 488b8c2498010000 mov rcx, qword ptr [rsp + 0x198]
140c7cbbc: 4c8b8c2490010000 mov r9, qword ptr [rsp + 0x190]
140c7cbc4: 4c8b942488010000 mov r10, qword ptr [rsp + 0x188]
140c7cbcc: 4c8b9c2480010000 mov r11, qword ptr [rsp + 0x180]
140c7cbd4: 4c8bb42478010000 mov r14, qword ptr [rsp + 0x178]
140c7cbdc: 4c8bbc2460010000 mov r15, qword ptr [rsp + 0x160]
140c7cbe4: 488b9080000000 mov rdx, qword ptr [rax + 0x80]
140c7cbeb: 4c8da3b0010000 lea r12, [rbx + 0x1b0]
140c7cbf2: 4c8dabe0010000 lea r13, [rbx + 0x1e0]
140c7cbf9: 48895c2430 mov qword ptr [rsp + 0x30], rbx
140c7cbfe: 4881c350010000 add rbx, 0x150
140c7cc05: 488dac24e8000000 lea rbp, [rsp + 0xe8]
140c7cc0d: 48896c2438 mov qword ptr [rsp + 0x38], rbp
140c7cc12: 4c89642458 mov qword ptr [rsp + 0x58], r12
140c7cc17: 4c896c2460 mov qword ptr [rsp + 0x60], r13
140c7cc1c: 48899c24c8000000 mov qword ptr [rsp + 0xc8], rbx
140c7cc24: 48897c2468 mov qword ptr [rsp + 0x68], rdi
140c7cc29: 4c897c2470 mov qword ptr [rsp + 0x70], r15
140c7cc2e: 488d7c2430 lea rdi, [rsp + 0x30]
140c7cc33: 48897c2478 mov qword ptr [rsp + 0x78], rdi
140c7cc38: 488d3dd1915f05 lea rdi, [rip + 0x55f91d1]
140c7cc3f: 4889bc2480000000 mov qword ptr [rsp + 0x80], rdi
140c7cc47: 4c899424d0000000 mov qword ptr [rsp + 0xd0], r10
140c7cc4f: 4c8d15ea915f05 lea r10, [rip + 0x55f91ea]
140c7cc56: 4c899424d8000000 mov qword ptr [rsp + 0xd8], r10
140c7cc5e: c68424e000000000 mov byte ptr [rsp + 0xe0], 0
140c7cc66: 4c89b42488000000 mov qword ptr [rsp + 0x88], r14
140c7cc6e: 4c899c2490000000 mov qword ptr [rsp + 0x90], r11
140c7cc76: 4c8d542438 lea r10, [rsp + 0x38]
140c7cc7b: 4c89942498000000 mov qword ptr [rsp + 0x98], r10
140c7cc83: 4c8d15e6915f05 lea r10, [rip + 0x55f91e6]
140c7cc8a: 4c899424a0000000 mov qword ptr [rsp + 0xa0], r10
140c7cc92: 4c898c24a8000000 mov qword ptr [rsp + 0xa8], r9
140c7cc9a: 48898c24b0000000 mov qword ptr [rsp + 0xb0], rcx
140c7cca2: 48c78424b800000001000000 mov qword ptr [rsp + 0xb8], 1
140c7ccae: 488d0deb915f05 lea rcx, [rip + 0x55f91eb]
140c7ccb5: 48898c24c0000000 mov qword ptr [rsp + 0xc0], rcx
140c7ccbd: 488d4c2458 lea rcx, [rsp + 0x58]
140c7ccc2: 48894c2420 mov qword ptr [rsp + 0x20], rcx
140c7ccc7: 488d4c2440 lea rcx, [rsp + 0x40]
140c7cccc: 4989c1 mov r9, rax
140c7cccf: e85c531f05 call 0x145e72030
140c7ccd4: 488b542440 mov rdx, qword ptr [rsp + 0x40]
140c7ccd9: 4883faff cmp rdx, -1
140c7ccdd: 7442 je 0x140c7cd21
140c7ccdf: 488b4c2448 mov rcx, qword ptr [rsp + 0x48]
140c7cce4: 488b442450 mov rax, qword ptr [rsp + 0x50]
140c7cce9: 4885c0 test rax, rax
140c7ccec: 7423 je 0x140c7cd11
140c7ccee: 488916 mov qword ptr [rsi], rdx
140c7ccf1: 48894e08 mov qword ptr [rsi + 8], rcx
140c7ccf5: 48894610 mov qword ptr [rsi + 0x10], rax
140c7ccf9: eb2d jmp 0x140c7cd28
140c7ccfb: 4889f1 mov rcx, rsi
140c7ccfe: 89ea mov edx, ebp
140c7cd00: ff159a2a8507 call qword ptr [rip + 0x7852a9a]
140c7cd06: 48833eff cmp qword ptr [rsi], -1
140c7cd0a: 751c jne 0x140c7cd28
140c7cd0c: e96cfeffff jmp 0x140c7cb7d
140c7cd11: 4885d2 test rdx, rdx
140c7cd14: 740b je 0x140c7cd21
140c7cd16: 41b801000000 mov r8d, 1
140c7cd1c: e8af5438ff call 0x1400021d0
140c7cd21: 48c706ffffffff mov qword ptr [rsi], 0xffffffffffffffff
140c7cd28: 4881c4f8000000 add rsp, 0xf8
140c7cd2f: 5b pop rbx
140c7cd30: 5d pop rbp
140c7cd31: 5f pop rdi
140c7cd32: 5e pop rsi
140c7cd33: 415c pop r12
140c7cd35: 415d pop r13
140c7cd37: 415e pop r14
140c7cd39: 415f pop r15
140c7cd3b: c3 ret
