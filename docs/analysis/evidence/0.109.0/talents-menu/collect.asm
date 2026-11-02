1459bfb40: push      rbp
1459bfb41: push      r15
1459bfb43: push      r14
1459bfb45: push      r13
1459bfb47: push      r12
1459bfb49: push      rsi
1459bfb4a: push      rdi
1459bfb4b: push      rbx
1459bfb4c: sub       rsp, 0x58
1459bfb50: lea       rbp, [rsp + 0x50]
1459bfb55: mov       qword ptr [rbp], 0xfffffffffffffffe
1459bfb5d: mov       rdi, rdx
1459bfb60: mov       rbx, rcx
1459bfb63: mov       rcx, qword ptr [rdx]
1459bfb66: mov       r13, qword ptr [rdx + 8]
1459bfb6a: mov       r14, qword ptr [rdx + 0x10]
1459bfb6e: nop
1459bfb70: cmp       rcx, r13
1459bfb73: je        0x1459bfc8a
1459bfb79: lea       rsi, [rcx + 0x10]
1459bfb7d: mov       qword ptr [rdi], rsi
1459bfb80: mov       rax, qword ptr [rcx]
1459bfb83: movzx     ecx, byte ptr [r14]
1459bfb87: mov       rdx, qword ptr [rax + 0x20]
1459bfb8b: mov       r8, qword ptr [rax + 0x28]
1459bfb8f: call      0x145912d90
1459bfb94: mov       rcx, rsi
1459bfb97: test      rdx, rdx
1459bfb9a: je        0x1459bfb70
1459bfb9c: mov       qword ptr [rbp - 0x28], rbx
1459bfba0: mov       qword ptr [rbp - 8], rax
1459bfba4: movzx     r12d, byte ptr [rsi - 8]
1459bfba9: mov       r15, rdx
1459bfbac: movzx     ebx, byte ptr [rdx + 0x72]
1459bfbb0: call      0x140002200
1459bfbb5: mov       ecx, 0x60
1459bfbba: mov       edx, 8
1459bfbbf: call      0x1400021c0
1459bfbc4: test      rax, rax
1459bfbc7: je        0x1459bfcca
1459bfbcd: mov       rdi, rax
1459bfbd0: movzx     eax, bl
1459bfbd3: movzx     ecx, r12b
1459bfbd7: cmp       al, cl
1459bfbd9: cmovb     ecx, eax
1459bfbdc: mov       qword ptr [rdi], r15
1459bfbdf: mov       rax, qword ptr [rbp - 8]
1459bfbe3: mov       qword ptr [rdi + 8], rax
1459bfbe7: mov       byte ptr [rdi + 0x10], cl
1459bfbea: mov       qword ptr [rbp - 0x20], 4
1459bfbf2: mov       qword ptr [rbp - 0x18], rdi
1459bfbf6: mov       ebx, 1
1459bfbfb: mov       qword ptr [rbp - 0x10], rbx
1459bfbff: nop
1459bfc00: cmp       rsi, r13
1459bfc03: je        0x1459bfca3
1459bfc09: mov       rax, qword ptr [rsi]
1459bfc0c: add       rsi, 0x10
1459bfc10: movzx     ecx, byte ptr [r14]
1459bfc14: mov       rdx, qword ptr [rax + 0x20]
1459bfc18: mov       r8, qword ptr [rax + 0x28]
1459bfc1c: call      0x145912d90
1459bfc21: test      rdx, rdx
1459bfc24: je        0x1459bfc00
1459bfc26: mov       r15, rax
1459bfc29: mov       r12, rdx
1459bfc2c: mov       rdx, rbx
1459bfc2f: mov       ebx, dword ptr [rsi - 8]
1459bfc32: movzx     eax, byte ptr [r12 + 0x72]
1459bfc38: cmp       al, bl
1459bfc3a: cmovb     ebx, eax
1459bfc3d: cmp       rdx, qword ptr [rbp - 0x20]
1459bfc41: jne       0x1459bfc6e
1459bfc43: mov       qword ptr [rsp + 0x20], 0x18
1459bfc4c: mov       r8d, 1
1459bfc52: mov       r9d, 8
1459bfc58: lea       rcx, [rbp - 0x20]
1459bfc5c: mov       qword ptr [rbp - 8], rdx
1459bfc60: call      0x145bfa970
1459bfc65: nop
1459bfc66: mov       rdi, qword ptr [rbp - 0x18]
1459bfc6a: mov       rdx, qword ptr [rbp - 8]
1459bfc6e: lea       rax, [rdx + rdx*2]
1459bfc72: mov       qword ptr [rdi + rax*8], r12
1459bfc76: mov       qword ptr [rdi + rax*8 + 8], r15
1459bfc7b: mov       byte ptr [rdi + rax*8 + 0x10], bl
1459bfc7f: inc       rdx
1459bfc82: mov       rbx, rdx
1459bfc85: jmp       0x1459bfbfb
1459bfc8a: mov       qword ptr [rbx], 0
1459bfc91: mov       qword ptr [rbx + 8], 8
1459bfc99: mov       qword ptr [rbx + 0x10], 0
1459bfca1: jmp       0x1459bfcb6
1459bfca3: mov       rax, qword ptr [rbp - 0x10]
1459bfca7: mov       rbx, qword ptr [rbp - 0x28]
1459bfcab: mov       qword ptr [rbx + 0x10], rax
1459bfcaf: movups    xmm0, xmmword ptr [rbp - 0x20]
1459bfcb3: movups    xmmword ptr [rbx], xmm0
1459bfcb6: mov       rax, rbx
1459bfcb9: add       rsp, 0x58
1459bfcbd: pop       rbx
1459bfcbe: pop       rdi
1459bfcbf: pop       rsi
1459bfcc0: pop       r12
1459bfcc2: pop       r13
1459bfcc4: pop       r14
1459bfcc6: pop       r15
1459bfcc8: pop       rbp
1459bfcc9: ret
1459bfcca: mov       ecx, 8
1459bfccf: mov       edx, 0x60
1459bfcd4: call      0x145d992bb
1459bfcd9: ud2
