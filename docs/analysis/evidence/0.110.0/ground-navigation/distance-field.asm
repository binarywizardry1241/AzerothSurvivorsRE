1459a7c90: 55 push rbp
1459a7c91: 4157 push r15
1459a7c93: 4156 push r14
1459a7c95: 4155 push r13
1459a7c97: 4154 push r12
1459a7c99: 56 push rsi
1459a7c9a: 57 push rdi
1459a7c9b: 53 push rbx
1459a7c9c: 4881ec18010000 sub rsp, 0x118
1459a7ca3: 488dac2480000000 lea rbp, [rsp + 0x80]
1459a7cab: 48c78590000000feffffff mov qword ptr [rbp + 0x90], 0xfffffffffffffffe
1459a7cb6: f30f5c5220 subss xmm2, dword ptr [rdx + 0x20]
1459a7cbb: 0f57c0 xorps xmm0, xmm0
1459a7cbe: 0f2ec2 ucomiss xmm0, xmm2
1459a7cc1: 0f87d6000000 ja 0x1459a7d9d
1459a7cc7: 4989d6 mov r14, rdx
1459a7cca: f30f5c5a24 subss xmm3, dword ptr [rdx + 0x24]
1459a7ccf: 0f2ec3 ucomiss xmm0, xmm3
1459a7cd2: 0f87c5000000 ja 0x1459a7d9d
1459a7cd8: f30f1005709c4000 movss xmm0, dword ptr [rip + 0x409c70]
1459a7ce0: 0f28ca movaps xmm1, xmm2
1459a7ce3: f30f5cc8 subss xmm1, xmm0
1459a7ce7: f3480f2cc1 cvttss2si rax, xmm1
1459a7cec: 48894d58 mov qword ptr [rbp + 0x58], rcx
1459a7cf0: f3480f2cca cvttss2si rcx, xmm2
1459a7cf5: 4889ce mov rsi, rcx
1459a7cf8: 48c1fe3f sar rsi, 0x3f
1459a7cfc: 4821c6 and rsi, rax
1459a7cff: 4809ce or rsi, rcx
1459a7d02: 31c0 xor eax, eax
1459a7d04: 0f57c9 xorps xmm1, xmm1
1459a7d07: 0f2ed1 ucomiss xmm2, xmm1
1459a7d0a: 480f42f0 cmovb rsi, rax
1459a7d0e: f30f10253e9c4000 movss xmm4, dword ptr [rip + 0x409c3e]
1459a7d16: 0f2ed4 ucomiss xmm2, xmm4
1459a7d19: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1459a7d20: 480f47f1 cmova rsi, rcx
1459a7d24: 0f28d3 movaps xmm2, xmm3
1459a7d27: f30f5cd0 subss xmm2, xmm0
1459a7d2b: f3480f2cd2 cvttss2si rdx, xmm2
1459a7d30: f34c0f2cc3 cvttss2si r8, xmm3
1459a7d35: 4d89c1 mov r9, r8
1459a7d38: 49c1f93f sar r9, 0x3f
1459a7d3c: 4921d1 and r9, rdx
1459a7d3f: 4d09c1 or r9, r8
1459a7d42: 0f2ed9 ucomiss xmm3, xmm1
1459a7d45: 4c0f42c8 cmovb r9, rax
1459a7d49: 0f2edc ucomiss xmm3, xmm4
1459a7d4c: 4c0f47c9 cmova r9, rcx
1459a7d50: 498b5e18 mov rbx, qword ptr [r14 + 0x18]
1459a7d54: 4839de cmp rsi, rbx
1459a7d57: 0f93c0 setae al
1459a7d5a: 4939d9 cmp r9, rbx
1459a7d5d: 0f93c1 setae cl
1459a7d60: 08c1 or cl, al
1459a7d62: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
1459a7d66: 7535 jne 0x1459a7d9d
1459a7d68: 4889da mov rdx, rbx
1459a7d6b: 480fafd3 imul rdx, rbx
1459a7d6f: 4c8d3c12 lea r15, [rdx + rdx]
1459a7d73: 4885d2 test rdx, rdx
1459a7d76: 0f98c0 sets al
1459a7d79: 48b9feffffffffffff7f movabs rcx, 0x7ffffffffffffffe
1459a7d83: 4939cf cmp r15, rcx
1459a7d86: 0f97c1 seta cl
1459a7d89: 08c1 or cl, al
1459a7d8b: 742e je 0x1459a7dbb
1459a7d8d: 4531e4 xor r12d, r12d
1459a7d90: 4c89e1 mov rcx, r12
1459a7d93: 4c89fa mov rdx, r15
1459a7d96: e810c53f00 call 0x145da42ab
1459a7d9b: 0f0b ud2
1459a7d9d: 48c701ffffffff mov qword ptr [rcx], 0xffffffffffffffff
1459a7da4: 4889c8 mov rax, rcx
1459a7da7: 4881c418010000 add rsp, 0x118
1459a7dae: 5b pop rbx
1459a7daf: 5f pop rdi
1459a7db0: 5e pop rsi
1459a7db1: 415c pop r12
1459a7db3: 415d pop r13
1459a7db5: 415e pop r14
1459a7db7: 415f pop r15
1459a7db9: 5d pop rbp
1459a7dba: c3 ret
1459a7dbb: 4c89cf mov rdi, r9
1459a7dbe: 48899580000000 mov qword ptr [rbp + 0x80], rdx
1459a7dc5: 4d85ff test r15, r15
1459a7dc8: 7433 je 0x1459a7dfd
1459a7dca: e831a465fa call 0x140002200
1459a7dcf: 41bc02000000 mov r12d, 2
1459a7dd5: ba02000000 mov edx, 2
1459a7dda: 4c89f9 mov rcx, r15
1459a7ddd: e8dea365fa call 0x1400021c0
1459a7de2: 48898588000000 mov qword ptr [rbp + 0x88], rax
1459a7de9: 4885c0 test rax, rax
1459a7dec: 74a2 je 0x1459a7d90
1459a7dee: 4c8ba580000000 mov r12, qword ptr [rbp + 0x80]
1459a7df5: 4c89e0 mov rax, r12
1459a7df8: 4889f9 mov rcx, rdi
1459a7dfb: eb18 jmp 0x1459a7e15
1459a7dfd: b802000000 mov eax, 2
1459a7e02: 48898588000000 mov qword ptr [rbp + 0x88], rax
1459a7e09: 31c0 xor eax, eax
1459a7e0b: 4889f9 mov rcx, rdi
1459a7e0e: 4c8ba580000000 mov r12, qword ptr [rbp + 0x80]
1459a7e15: 480fafcb imul rcx, rbx
1459a7e19: 4801f1 add rcx, rsi
1459a7e1c: 4983fc02 cmp r12, 2
1459a7e20: 48894548 mov qword ptr [rbp + 0x48], rax
1459a7e24: 7225 jb 0x1459a7e4b
1459a7e26: 4d8d47fe lea r8, [r15 - 2]
1459a7e2a: 488bb588000000 mov rsi, qword ptr [rbp + 0x88]
1459a7e31: 4889cf mov rdi, rcx
1459a7e34: 4889f1 mov rcx, rsi
1459a7e37: b2ff mov dl, 0xff
1459a7e39: e863d32500 call 0x145c051a1
1459a7e3e: 4889f9 mov rcx, rdi
1459a7e41: 4a8d043e lea rax, [rsi + r15]
1459a7e45: 4883c0fe add rax, -2
1459a7e49: eb10 jmp 0x1459a7e5b
1459a7e4b: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
1459a7e52: 4d85e4 test r12, r12
1459a7e55: 0f8481030000 je 0x1459a81dc
1459a7e5b: 66c700ffff mov word ptr [rax], 0xffff
1459a7e60: 48c7456000000000 mov qword ptr [rbp + 0x60], 0
1459a7e68: 0f57c0 xorps xmm0, xmm0
1459a7e6b: 0f114570 movups xmmword ptr [rbp + 0x70], xmm0
1459a7e6f: 48c7456808000000 mov qword ptr [rbp + 0x68], 8
1459a7e77: 4c39e1 cmp rcx, r12
1459a7e7a: 0f8373030000 jae 0x1459a81f3
1459a7e80: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
1459a7e87: 48894d40 mov qword ptr [rbp + 0x40], rcx
1459a7e8b: 66c704480000 mov word ptr [rax + rcx*2], 0
1459a7e91: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1459a7e95: 488b4578 mov rax, qword ptr [rbp + 0x78]
1459a7e99: 4839c8 cmp rax, rcx
1459a7e9c: 7512 jne 0x1459a7eb0
1459a7e9e: 488d4d60 lea rcx, [rbp + 0x60]
1459a7ea2: e8395cb0fa call 0x1404adae0
1459a7ea7: 90 nop
1459a7ea8: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1459a7eac: 488b4578 mov rax, qword ptr [rbp + 0x78]
1459a7eb0: 488d5001 lea rdx, [rax + 1]
1459a7eb4: 48895578 mov qword ptr [rbp + 0x78], rdx
1459a7eb8: 48034570 add rax, qword ptr [rbp + 0x70]
1459a7ebc: 31d2 xor edx, edx
1459a7ebe: 4839c8 cmp rax, rcx
1459a7ec1: 480f43d1 cmovae rdx, rcx
1459a7ec5: 4829d0 sub rax, rdx
1459a7ec8: 488b4d68 mov rcx, qword ptr [rbp + 0x68]
1459a7ecc: 488b5540 mov rdx, qword ptr [rbp + 0x40]
1459a7ed0: 488914c1 mov qword ptr [rcx + rax*8], rdx
1459a7ed4: 498b7e08 mov rdi, qword ptr [r14 + 8]
1459a7ed8: 4d8b7610 mov r14, qword ptr [r14 + 0x10]
1459a7edc: b801000000 mov eax, 1
1459a7ee1: 48894538 mov qword ptr [rbp + 0x38], rax
1459a7ee5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a7ef0: 488b4578 mov rax, qword ptr [rbp + 0x78]
1459a7ef4: 4885c0 test rax, rax
1459a7ef7: 0f8417020000 je 0x1459a8114
1459a7efd: 488b4d70 mov rcx, qword ptr [rbp + 0x70]
1459a7f01: 488d5101 lea rdx, [rcx + 1]
1459a7f05: 4c8b4560 mov r8, qword ptr [rbp + 0x60]
1459a7f09: 4c8b4d68 mov r9, qword ptr [rbp + 0x68]
1459a7f0d: 4c39c2 cmp rdx, r8
1459a7f10: ba00000000 mov edx, 0
1459a7f15: 490f43d0 cmovae rdx, r8
1459a7f19: 48f7da neg rdx
1459a7f1c: 4801ca add rdx, rcx
1459a7f1f: 48ffc2 inc rdx
1459a7f22: 48895570 mov qword ptr [rbp + 0x70], rdx
1459a7f26: 48ffc8 dec rax
1459a7f29: 48894578 mov qword ptr [rbp + 0x78], rax
1459a7f2d: 498b0cc9 mov rcx, qword ptr [r9 + rcx*8]
1459a7f31: 4889c8 mov rax, rcx
1459a7f34: 4809d8 or rax, rbx
1459a7f37: 48c1e820 shr rax, 0x20
1459a7f3b: 7423 je 0x1459a7f60
1459a7f3d: 4889c8 mov rax, rcx
1459a7f40: 31d2 xor edx, edx
1459a7f42: 48f7f3 div rbx
1459a7f45: 4989d4 mov r12, rdx
1459a7f48: 4989c5 mov r13, rax
1459a7f4b: 483b8d80000000 cmp rcx, qword ptr [rbp + 0x80]
1459a7f52: 7225 jb 0x1459a7f79
1459a7f54: e96d020000 jmp 0x1459a81c6
1459a7f59: 0f1f8000000000 nop dword ptr [rax]
1459a7f60: 89c8 mov eax, ecx
1459a7f62: 31d2 xor edx, edx
1459a7f64: f7f3 div ebx
1459a7f66: 4189d4 mov r12d, edx
1459a7f69: 4189c5 mov r13d, eax
1459a7f6c: 483b8d80000000 cmp rcx, qword ptr [rbp + 0x80]
1459a7f73: 0f834d020000 jae 0x1459a81c6
1459a7f79: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
1459a7f80: 0fb70448 movzx eax, word ptr [rax + rcx*2]
1459a7f84: ffc0 inc eax
1459a7f86: 894554 mov dword ptr [rbp + 0x54], eax
1459a7f89: 0f100560c58901 movups xmm0, xmmword ptr [rip + 0x189c560]
1459a7f90: 488d45b0 lea rax, [rbp - 0x50]
1459a7f94: 0f114070 movups xmmword ptr [rax + 0x70], xmm0
1459a7f98: 0f100541c58901 movups xmm0, xmmword ptr [rip + 0x189c541]
1459a7f9f: 0f114060 movups xmmword ptr [rax + 0x60], xmm0
1459a7fa3: 0f100526c58901 movups xmm0, xmmword ptr [rip + 0x189c526]
1459a7faa: 0f114050 movups xmmword ptr [rax + 0x50], xmm0
1459a7fae: 0f10050bc58901 movups xmm0, xmmword ptr [rip + 0x189c50b]
1459a7fb5: 0f114040 movups xmmword ptr [rax + 0x40], xmm0
1459a7fb9: 0f1005f0c48901 movups xmm0, xmmword ptr [rip + 0x189c4f0]
1459a7fc0: 0f114030 movups xmmword ptr [rax + 0x30], xmm0
1459a7fc4: 0f1005d5c48901 movups xmm0, xmmword ptr [rip + 0x189c4d5]
1459a7fcb: 0f114020 movups xmmword ptr [rax + 0x20], xmm0
1459a7fcf: 0f1005bac48901 movups xmm0, xmmword ptr [rip + 0x189c4ba]
1459a7fd6: 0f114010 movups xmmword ptr [rax + 0x10], xmm0
1459a7fda: 0f10059fc48901 movups xmm0, xmmword ptr [rip + 0x189c49f]
1459a7fe1: 0f1100 movups xmmword ptr [rax], xmm0
1459a7fe4: 4c89e8 mov rax, r13
1459a7fe7: 480fafc3 imul rax, rbx
1459a7feb: 48894530 mov qword ptr [rbp + 0x30], rax
1459a7fef: 31f6 xor esi, esi
1459a7ff1: 4883fe08 cmp rsi, 8
1459a7ff5: 0f84f5feffff je 0x1459a7ef0
1459a7ffb: 4889f2 mov rdx, rsi
1459a7ffe: 48c1e204 shl rdx, 4
1459a8002: 488d45b8 lea rax, [rbp - 0x48]
1459a8006: 4801c2 add rdx, rax
1459a8009: eb16 jmp 0x1459a8021
1459a800b: 0f1f440000 nop dword ptr [rax + rax]
1459a8010: 48ffc6 inc rsi
1459a8013: 4883c210 add rdx, 0x10
1459a8017: 4883fe08 cmp rsi, 8
1459a801b: 0f84cffeffff je 0x1459a7ef0
1459a8021: 4c8b02 mov r8, qword ptr [rdx]
1459a8024: 4b8d0c28 lea rcx, [r8 + r13]
1459a8028: 4839d9 cmp rcx, rbx
1459a802b: 7de3 jge 0x1459a8010
1459a802d: 4c8b4af8 mov r9, qword ptr [rdx - 8]
1459a8031: 4b8d0421 lea rax, [r9 + r12]
1459a8035: 4839d8 cmp rax, rbx
1459a8038: 7dd6 jge 0x1459a8010
1459a803a: 4989ca mov r10, rcx
1459a803d: 4909c2 or r10, rax
1459a8040: 78ce js 0x1459a8010
1459a8042: 480fafcb imul rcx, rbx
1459a8046: 4c8d3c01 lea r15, [rcx + rax]
1459a804a: 4d39f7 cmp r15, r14
1459a804d: 0f831b010000 jae 0x1459a816e
1459a8053: 42803c3f00 cmp byte ptr [rdi + r15], 0
1459a8058: 75b6 jne 0x1459a8010
1459a805a: 4c3bbd80000000 cmp r15, qword ptr [rbp + 0x80]
1459a8061: 0f831f010000 jae 0x1459a8186
1459a8067: 4c8b9588000000 mov r10, qword ptr [rbp + 0x88]
1459a806e: 6643833c7aff cmp word ptr [r10 + r15*2], -1
1459a8074: 759a jne 0x1459a8010
1459a8076: 4d85c9 test r9, r9
1459a8079: 7432 je 0x1459a80ad
1459a807b: 4d85c0 test r8, r8
1459a807e: 742d je 0x1459a80ad
1459a8080: 48034530 add rax, qword ptr [rbp + 0x30]
1459a8084: 4c39f0 cmp rax, r14
1459a8087: 0f8312010000 jae 0x1459a819f
1459a808d: 803c0700 cmp byte ptr [rdi + rax], 0
1459a8091: 0f8579ffffff jne 0x1459a8010
1459a8097: 4c01e1 add rcx, r12
1459a809a: 4c39f1 cmp rcx, r14
1459a809d: 0f8311010000 jae 0x1459a81b4
1459a80a3: 803c0f00 cmp byte ptr [rdi + rcx], 0
1459a80a7: 0f8563ffffff jne 0x1459a8010
1459a80ad: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
1459a80b4: 8b4d54 mov ecx, dword ptr [rbp + 0x54]
1459a80b7: 6642890c78 mov word ptr [rax + r15*2], cx
1459a80bc: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1459a80c0: 488b4578 mov rax, qword ptr [rbp + 0x78]
1459a80c4: 4839c8 cmp rax, rcx
1459a80c7: 7512 jne 0x1459a80db
1459a80c9: 488d4d60 lea rcx, [rbp + 0x60]
1459a80cd: e80e5ab0fa call 0x1404adae0
1459a80d2: 90 nop
1459a80d3: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
1459a80d7: 488b4578 mov rax, qword ptr [rbp + 0x78]
1459a80db: 48ffc6 inc rsi
1459a80de: 488d5001 lea rdx, [rax + 1]
1459a80e2: 48895578 mov qword ptr [rbp + 0x78], rdx
1459a80e6: 48034570 add rax, qword ptr [rbp + 0x70]
1459a80ea: 4839c8 cmp rax, rcx
1459a80ed: ba00000000 mov edx, 0
1459a80f2: 480f43d1 cmovae rdx, rcx
1459a80f6: 4829d0 sub rax, rdx
1459a80f9: 488b4d68 mov rcx, qword ptr [rbp + 0x68]
1459a80fd: 4c893cc1 mov qword ptr [rcx + rax*8], r15
1459a8101: 48ff4538 inc qword ptr [rbp + 0x38]
1459a8105: 4883fe08 cmp rsi, 8
1459a8109: 0f85ecfeffff jne 0x1459a7ffb
1459a810f: e9dcfdffff jmp 0x1459a7ef0
1459a8114: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
1459a8118: 488b4548 mov rax, qword ptr [rbp + 0x48]
1459a811c: 488901 mov qword ptr [rcx], rax
1459a811f: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
1459a8126: 48894108 mov qword ptr [rcx + 8], rax
1459a812a: 488b8580000000 mov rax, qword ptr [rbp + 0x80]
1459a8131: 48894110 mov qword ptr [rcx + 0x10], rax
1459a8135: 488b4540 mov rax, qword ptr [rbp + 0x40]
1459a8139: 48894118 mov qword ptr [rcx + 0x18], rax
1459a813d: 488b4538 mov rax, qword ptr [rbp + 0x38]
1459a8141: 48894120 mov qword ptr [rcx + 0x20], rax
1459a8145: 488b5560 mov rdx, qword ptr [rbp + 0x60]
1459a8149: 4885d2 test rdx, rdx
1459a814c: 0f8452fcffff je 0x1459a7da4
1459a8152: 488b4d68 mov rcx, qword ptr [rbp + 0x68]
1459a8156: 48c1e203 shl rdx, 3
1459a815a: 41b808000000 mov r8d, 8
1459a8160: e86ba065fa call 0x1400021d0
1459a8165: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
1459a8169: e936fcffff jmp 0x1459a7da4
1459a816e: 4c8d0503c48901 lea r8, [rip + 0x189c403]
1459a8175: 4c89f9 mov rcx, r15
1459a8178: 4c89f2 mov rdx, r14
1459a817b: e8c3c43f00 call 0x145da4643
1459a8180: 90 nop
1459a8181: e981000000 jmp 0x1459a8207
1459a8186: 4c8d0503c48901 lea r8, [rip + 0x189c403]
1459a818d: 4c89f9 mov rcx, r15
1459a8190: 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
1459a8197: e8a7c43f00 call 0x145da4643
1459a819c: 90 nop
1459a819d: eb68 jmp 0x1459a8207
1459a819f: 4c8d0502c48901 lea r8, [rip + 0x189c402]
1459a81a6: 4889c1 mov rcx, rax
1459a81a9: 4c89f2 mov rdx, r14
1459a81ac: e892c43f00 call 0x145da4643
1459a81b1: 90 nop
1459a81b2: eb53 jmp 0x1459a8207
1459a81b4: 4c8d0505c48901 lea r8, [rip + 0x189c405]
1459a81bb: 4c89f2 mov rdx, r14
1459a81be: e880c43f00 call 0x145da4643
1459a81c3: 90 nop
1459a81c4: eb41 jmp 0x1459a8207
1459a81c6: 4c8d0593c38901 lea r8, [rip + 0x189c393]
1459a81cd: 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
1459a81d4: e86ac43f00 call 0x145da4643
1459a81d9: 90 nop
1459a81da: eb2b jmp 0x1459a8207
1459a81dc: 48c7456000000000 mov qword ptr [rbp + 0x60], 0
1459a81e4: 0f57c0 xorps xmm0, xmm0
1459a81e7: 0f114570 movups xmmword ptr [rbp + 0x70], xmm0
1459a81eb: 48c7456808000000 mov qword ptr [rbp + 0x68], 8
1459a81f3: 4c8d054ec38901 lea r8, [rip + 0x189c34e]
1459a81fa: 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
1459a8201: e83dc43f00 call 0x145da4643
1459a8206: 90 nop
1459a8207: 0f0b ud2
