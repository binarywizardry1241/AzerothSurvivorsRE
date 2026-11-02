0x145d3d590: sub rsp, 0x48
0x145d3d594: mov rax, rcx
0x145d3d597: cmp r8, 0x40
0x145d3d59b: jne 0x145d3d5d8
0x145d3d59d: movups xmm0, xmmword ptr [rdx]
0x145d3d5a0: movups xmm1, xmmword ptr [rdx + 0x10]
0x145d3d5a4: movaps xmmword ptr [rsp + 0x10], xmm1
0x145d3d5a9: movaps xmmword ptr [rsp], xmm0
0x145d3d5ad: movups xmm2, xmmword ptr [rdx + 0x20]
0x145d3d5b1: movups xmm3, xmmword ptr [rdx + 0x30]
0x145d3d5b5: movaps xmmword ptr [rsp + 0x20], xmm2
0x145d3d5ba: movaps xmmword ptr [rsp + 0x30], xmm3
0x145d3d5bf: movups xmmword ptr [rax + 0x31], xmm3
0x145d3d5c3: movups xmmword ptr [rax + 0x21], xmm2
0x145d3d5c7: movups xmmword ptr [rax + 0x11], xmm1
0x145d3d5cb: movups xmmword ptr [rax + 1], xmm0
0x145d3d5cf: xor ecx, ecx
0x145d3d5d1: mov byte ptr [rax], cl
0x145d3d5d3: add rsp, 0x48
0x145d3d5d7: ret 
0x145d3d5d8: mov qword ptr [rax + 8], 0
0x145d3d5e0: mov cl, 1
0x145d3d5e2: mov byte ptr [rax], cl
0x145d3d5e4: add rsp, 0x48
0x145d3d5e8: ret 
