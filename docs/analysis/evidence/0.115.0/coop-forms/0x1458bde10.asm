0x1458bde10: push rbp
0x1458bde11: sub rsp, 0x60
0x1458bde15: lea rbp, [rsp + 0x60]
0x1458bde1a: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1458bde22: mov r8, rdx
0x1458bde25: mov rdx, rcx
0x1458bde28: lea rcx, [rbp - 0x38]
0x1458bde2c: call 0x1458544c0
0x1458bde31: call 0x140002200
0x1458bde36: mov ecx, 0x30
0x1458bde3b: mov edx, 8
0x1458bde40: call 0x1400021c0
0x1458bde45: test rax, rax
0x1458bde48: je 0x1458bde6e
0x1458bde4a: movups xmm0, xmmword ptr [rbp - 0x38]
0x1458bde4e: movups xmm1, xmmword ptr [rbp - 0x28]
0x1458bde52: movups xmm2, xmmword ptr [rbp - 0x18]
0x1458bde56: movups xmmword ptr [rax + 0x20], xmm2
0x1458bde5a: movups xmmword ptr [rax + 0x10], xmm1
0x1458bde5e: movups xmmword ptr [rax], xmm0
0x1458bde61: lea rdx, [rip + 0x1772f98]
0x1458bde68: add rsp, 0x60
0x1458bde6c: pop rbp
0x1458bde6d: ret
0x1458bde6e: mov ecx, 8
0x1458bde73: mov edx, 0x30
0x1458bde78: call 0x145eb6fb1
0x1458bde7d: nop
0x1458bde7e: ud2
