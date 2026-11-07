0x1458cf500: 55                       push rbp
0x1458cf501: 4157                     push r15
0x1458cf503: 4156                     push r14
0x1458cf505: 4155                     push r13
0x1458cf507: 4154                     push r12
0x1458cf509: 56                       push rsi
0x1458cf50a: 57                       push rdi
0x1458cf50b: 53                       push rbx
0x1458cf50c: 4881ec88000000           sub rsp, 0x88
0x1458cf513: 488dac2480000000         lea rbp, [rsp + 0x80]
0x1458cf51b: 48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
0x1458cf523: 4c89cf                   mov rdi, r9
0x1458cf526: 48894dd0                 mov qword ptr [rbp - 0x30], rcx
0x1458cf52a: b001                     mov al, 1
0x1458cf52c: 4983f80f                 cmp r8, 0xf
0x1458cf530: 0f876f0c0000             ja 0x1458d01a5
0x1458cf536: 4983f807                 cmp r8, 7
0x1458cf53a: 0f852e030000             jne 0x1458cf86e
0x1458cf540: 0fb60dc9023101           movzx ecx, byte ptr [rip + 0x13102c9]
0x1458cf547: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf54b: 4180f91a                 cmp r9b, 0x1a
0x1458cf54f: 410f92c1                 setb r9b
0x1458cf553: 41c0e105                 shl r9b, 5
0x1458cf557: 4108c9                   or r9b, cl
0x1458cf55a: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cf55d: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf561: 4180fa1a                 cmp r10b, 0x1a
0x1458cf565: 410f92c2                 setb r10b
0x1458cf569: 41c0e205                 shl r10b, 5
0x1458cf56d: 4108ca                   or r10b, cl
0x1458cf570: 4538d1                   cmp r9b, r10b
0x1458cf573: 0f855e010000             jne 0x1458cf6d7
0x1458cf579: 0fb60d91023101           movzx ecx, byte ptr [rip + 0x1310291]
0x1458cf580: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf584: 4180f91a                 cmp r9b, 0x1a
0x1458cf588: 410f92c1                 setb r9b
0x1458cf58c: 41c0e105                 shl r9b, 5
0x1458cf590: 4108c9                   or r9b, cl
0x1458cf593: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cf597: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf59b: 4180fa1a                 cmp r10b, 0x1a
0x1458cf59f: 410f92c2                 setb r10b
0x1458cf5a3: 41c0e205                 shl r10b, 5
0x1458cf5a7: 4108ca                   or r10b, cl
0x1458cf5aa: 4538d1                   cmp r9b, r10b
0x1458cf5ad: 0f8524010000             jne 0x1458cf6d7
0x1458cf5b3: 0fb60d58023101           movzx ecx, byte ptr [rip + 0x1310258]
0x1458cf5ba: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf5be: 4180f91a                 cmp r9b, 0x1a
0x1458cf5c2: 410f92c1                 setb r9b
0x1458cf5c6: 41c0e105                 shl r9b, 5
0x1458cf5ca: 4108c9                   or r9b, cl
0x1458cf5cd: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cf5d1: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf5d5: 4180fa1a                 cmp r10b, 0x1a
0x1458cf5d9: 410f92c2                 setb r10b
0x1458cf5dd: 41c0e205                 shl r10b, 5
0x1458cf5e1: 4108ca                   or r10b, cl
0x1458cf5e4: 4538d1                   cmp r9b, r10b
0x1458cf5e7: 0f85ea000000             jne 0x1458cf6d7
0x1458cf5ed: 0fb60d1f023101           movzx ecx, byte ptr [rip + 0x131021f]
0x1458cf5f4: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf5f8: 4180f91a                 cmp r9b, 0x1a
0x1458cf5fc: 410f92c1                 setb r9b
0x1458cf600: 41c0e105                 shl r9b, 5
0x1458cf604: 4108c9                   or r9b, cl
0x1458cf607: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cf60b: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf60f: 4180fa1a                 cmp r10b, 0x1a
0x1458cf613: 410f92c2                 setb r10b
0x1458cf617: 41c0e205                 shl r10b, 5
0x1458cf61b: 4108ca                   or r10b, cl
0x1458cf61e: 4538d1                   cmp r9b, r10b
0x1458cf621: 0f85b0000000             jne 0x1458cf6d7
0x1458cf627: 0fb60de6013101           movzx ecx, byte ptr [rip + 0x13101e6]
0x1458cf62e: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf632: 4180f91a                 cmp r9b, 0x1a
0x1458cf636: 410f92c1                 setb r9b
0x1458cf63a: 41c0e105                 shl r9b, 5
0x1458cf63e: 4108c9                   or r9b, cl
0x1458cf641: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cf645: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf649: 4180fa1a                 cmp r10b, 0x1a
0x1458cf64d: 410f92c2                 setb r10b
0x1458cf651: 41c0e205                 shl r10b, 5
0x1458cf655: 4108ca                   or r10b, cl
0x1458cf658: 4538d1                   cmp r9b, r10b
0x1458cf65b: 757a                     jne 0x1458cf6d7
0x1458cf65d: 0fb60db1013101           movzx ecx, byte ptr [rip + 0x13101b1]
0x1458cf664: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf668: 4180f91a                 cmp r9b, 0x1a
0x1458cf66c: 410f92c1                 setb r9b
0x1458cf670: 41c0e105                 shl r9b, 5
0x1458cf674: 4108c9                   or r9b, cl
0x1458cf677: 0fb64a05                 movzx ecx, byte ptr [rdx + 5]
0x1458cf67b: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf67f: 4180fa1a                 cmp r10b, 0x1a
0x1458cf683: 410f92c2                 setb r10b
0x1458cf687: 41c0e205                 shl r10b, 5
0x1458cf68b: 4108ca                   or r10b, cl
0x1458cf68e: 4538d1                   cmp r9b, r10b
0x1458cf691: 7544                     jne 0x1458cf6d7
0x1458cf693: 0fb60d7c013101           movzx ecx, byte ptr [rip + 0x131017c]
0x1458cf69a: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf69e: 4180f91a                 cmp r9b, 0x1a
0x1458cf6a2: 410f92c1                 setb r9b
0x1458cf6a6: 41c0e105                 shl r9b, 5
0x1458cf6aa: 4108c9                   or r9b, cl
0x1458cf6ad: 0fb64a06                 movzx ecx, byte ptr [rdx + 6]
0x1458cf6b1: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf6b5: 4180fa1a                 cmp r10b, 0x1a
0x1458cf6b9: 410f92c2                 setb r10b
0x1458cf6bd: 41c0e205                 shl r10b, 5
0x1458cf6c1: 4108ca                   or r10b, cl
0x1458cf6c4: 4538d1                   cmp r9b, r10b
0x1458cf6c7: 750e                     jne 0x1458cf6d7
0x1458cf6c9: 488d0d18103101           lea rcx, [rip + 0x1311018]
0x1458cf6d0: 31c0                     xor eax, eax
0x1458cf6d2: e9d00a0000               jmp 0x1458d01a7
0x1458cf6d7: 0fb60dc9023101           movzx ecx, byte ptr [rip + 0x13102c9]
0x1458cf6de: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf6e2: 4180f91a                 cmp r9b, 0x1a
0x1458cf6e6: 410f92c1                 setb r9b
0x1458cf6ea: 41c0e105                 shl r9b, 5
0x1458cf6ee: 4108c9                   or r9b, cl
0x1458cf6f1: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cf6f4: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf6f8: 4180fa1a                 cmp r10b, 0x1a
0x1458cf6fc: 410f92c2                 setb r10b
0x1458cf700: 41c0e205                 shl r10b, 5
0x1458cf704: 4108ca                   or r10b, cl
0x1458cf707: 4538d1                   cmp r9b, r10b
0x1458cf70a: 0f855e010000             jne 0x1458cf86e
0x1458cf710: 0fb60d91023101           movzx ecx, byte ptr [rip + 0x1310291]
0x1458cf717: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf71b: 4180f91a                 cmp r9b, 0x1a
0x1458cf71f: 410f92c1                 setb r9b
0x1458cf723: 41c0e105                 shl r9b, 5
0x1458cf727: 4108c9                   or r9b, cl
0x1458cf72a: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cf72e: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf732: 4180fa1a                 cmp r10b, 0x1a
0x1458cf736: 410f92c2                 setb r10b
0x1458cf73a: 41c0e205                 shl r10b, 5
0x1458cf73e: 4108ca                   or r10b, cl
0x1458cf741: 4538d1                   cmp r9b, r10b
0x1458cf744: 0f8524010000             jne 0x1458cf86e
0x1458cf74a: 0fb60d58023101           movzx ecx, byte ptr [rip + 0x1310258]
0x1458cf751: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf755: 4180f91a                 cmp r9b, 0x1a
0x1458cf759: 410f92c1                 setb r9b
0x1458cf75d: 41c0e105                 shl r9b, 5
0x1458cf761: 4108c9                   or r9b, cl
0x1458cf764: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cf768: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf76c: 4180fa1a                 cmp r10b, 0x1a
0x1458cf770: 410f92c2                 setb r10b
0x1458cf774: 41c0e205                 shl r10b, 5
0x1458cf778: 4108ca                   or r10b, cl
0x1458cf77b: 4538d1                   cmp r9b, r10b
0x1458cf77e: 0f85ea000000             jne 0x1458cf86e
0x1458cf784: 0fb60d1f023101           movzx ecx, byte ptr [rip + 0x131021f]
0x1458cf78b: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf78f: 4180f91a                 cmp r9b, 0x1a
0x1458cf793: 410f92c1                 setb r9b
0x1458cf797: 41c0e105                 shl r9b, 5
0x1458cf79b: 4108c9                   or r9b, cl
0x1458cf79e: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cf7a2: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf7a6: 4180fa1a                 cmp r10b, 0x1a
0x1458cf7aa: 410f92c2                 setb r10b
0x1458cf7ae: 41c0e205                 shl r10b, 5
0x1458cf7b2: 4108ca                   or r10b, cl
0x1458cf7b5: 4538d1                   cmp r9b, r10b
0x1458cf7b8: 0f85b0000000             jne 0x1458cf86e
0x1458cf7be: 0fb60de6013101           movzx ecx, byte ptr [rip + 0x13101e6]
0x1458cf7c5: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf7c9: 4180f91a                 cmp r9b, 0x1a
0x1458cf7cd: 410f92c1                 setb r9b
0x1458cf7d1: 41c0e105                 shl r9b, 5
0x1458cf7d5: 4108c9                   or r9b, cl
0x1458cf7d8: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cf7dc: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf7e0: 4180fa1a                 cmp r10b, 0x1a
0x1458cf7e4: 410f92c2                 setb r10b
0x1458cf7e8: 41c0e205                 shl r10b, 5
0x1458cf7ec: 4108ca                   or r10b, cl
0x1458cf7ef: 4538d1                   cmp r9b, r10b
0x1458cf7f2: 757a                     jne 0x1458cf86e
0x1458cf7f4: 0fb60db1013101           movzx ecx, byte ptr [rip + 0x13101b1]
0x1458cf7fb: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf7ff: 4180f91a                 cmp r9b, 0x1a
0x1458cf803: 410f92c1                 setb r9b
0x1458cf807: 41c0e105                 shl r9b, 5
0x1458cf80b: 4108c9                   or r9b, cl
0x1458cf80e: 0fb64a05                 movzx ecx, byte ptr [rdx + 5]
0x1458cf812: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf816: 4180fa1a                 cmp r10b, 0x1a
0x1458cf81a: 410f92c2                 setb r10b
0x1458cf81e: 41c0e205                 shl r10b, 5
0x1458cf822: 4108ca                   or r10b, cl
0x1458cf825: 4538d1                   cmp r9b, r10b
0x1458cf828: 7544                     jne 0x1458cf86e
0x1458cf82a: 0fb60d7c013101           movzx ecx, byte ptr [rip + 0x131017c]
0x1458cf831: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf835: 4180f91a                 cmp r9b, 0x1a
0x1458cf839: 410f92c1                 setb r9b
0x1458cf83d: 41c0e105                 shl r9b, 5
0x1458cf841: 4108c9                   or r9b, cl
0x1458cf844: 0fb64a06                 movzx ecx, byte ptr [rdx + 6]
0x1458cf848: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf84c: 4180fa1a                 cmp r10b, 0x1a
0x1458cf850: 410f92c2                 setb r10b
0x1458cf854: 41c0e205                 shl r10b, 5
0x1458cf858: 4108ca                   or r10b, cl
0x1458cf85b: 4538d1                   cmp r9b, r10b
0x1458cf85e: 750e                     jne 0x1458cf86e
0x1458cf860: 488d0d110f3101           lea rcx, [rip + 0x1310f11]
0x1458cf867: 31c0                     xor eax, eax
0x1458cf869: e939090000               jmp 0x1458d01a7
0x1458cf86e: 4983f806                 cmp r8, 6
0x1458cf872: 0f855d010000             jne 0x1458cf9d5
0x1458cf878: 0fb60dd6023101           movzx ecx, byte ptr [rip + 0x13102d6]
0x1458cf87f: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf883: 4180f91a                 cmp r9b, 0x1a
0x1458cf887: 410f92c1                 setb r9b
0x1458cf88b: 41c0e105                 shl r9b, 5
0x1458cf88f: 4108c9                   or r9b, cl
0x1458cf892: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cf895: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf899: 4180fa1a                 cmp r10b, 0x1a
0x1458cf89d: 410f92c2                 setb r10b
0x1458cf8a1: 41c0e205                 shl r10b, 5
0x1458cf8a5: 4108ca                   or r10b, cl
0x1458cf8a8: 4538d1                   cmp r9b, r10b
0x1458cf8ab: 0f8524010000             jne 0x1458cf9d5
0x1458cf8b1: 0fb60d9e023101           movzx ecx, byte ptr [rip + 0x131029e]
0x1458cf8b8: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf8bc: 4180f91a                 cmp r9b, 0x1a
0x1458cf8c0: 410f92c1                 setb r9b
0x1458cf8c4: 41c0e105                 shl r9b, 5
0x1458cf8c8: 4108c9                   or r9b, cl
0x1458cf8cb: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cf8cf: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf8d3: 4180fa1a                 cmp r10b, 0x1a
0x1458cf8d7: 410f92c2                 setb r10b
0x1458cf8db: 41c0e205                 shl r10b, 5
0x1458cf8df: 4108ca                   or r10b, cl
0x1458cf8e2: 4538d1                   cmp r9b, r10b
0x1458cf8e5: 0f85ea000000             jne 0x1458cf9d5
0x1458cf8eb: 0fb60d65023101           movzx ecx, byte ptr [rip + 0x1310265]
0x1458cf8f2: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf8f6: 4180f91a                 cmp r9b, 0x1a
0x1458cf8fa: 410f92c1                 setb r9b
0x1458cf8fe: 41c0e105                 shl r9b, 5
0x1458cf902: 4108c9                   or r9b, cl
0x1458cf905: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cf909: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf90d: 4180fa1a                 cmp r10b, 0x1a
0x1458cf911: 410f92c2                 setb r10b
0x1458cf915: 41c0e205                 shl r10b, 5
0x1458cf919: 4108ca                   or r10b, cl
0x1458cf91c: 4538d1                   cmp r9b, r10b
0x1458cf91f: 0f85b0000000             jne 0x1458cf9d5
0x1458cf925: 0fb60d2c023101           movzx ecx, byte ptr [rip + 0x131022c]
0x1458cf92c: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf930: 4180f91a                 cmp r9b, 0x1a
0x1458cf934: 410f92c1                 setb r9b
0x1458cf938: 41c0e105                 shl r9b, 5
0x1458cf93c: 4108c9                   or r9b, cl
0x1458cf93f: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cf943: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf947: 4180fa1a                 cmp r10b, 0x1a
0x1458cf94b: 410f92c2                 setb r10b
0x1458cf94f: 41c0e205                 shl r10b, 5
0x1458cf953: 4108ca                   or r10b, cl
0x1458cf956: 4538d1                   cmp r9b, r10b
0x1458cf959: 757a                     jne 0x1458cf9d5
0x1458cf95b: 0fb60df7013101           movzx ecx, byte ptr [rip + 0x13101f7]
0x1458cf962: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf966: 4180f91a                 cmp r9b, 0x1a
0x1458cf96a: 410f92c1                 setb r9b
0x1458cf96e: 41c0e105                 shl r9b, 5
0x1458cf972: 4108c9                   or r9b, cl
0x1458cf975: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cf979: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf97d: 4180fa1a                 cmp r10b, 0x1a
0x1458cf981: 410f92c2                 setb r10b
0x1458cf985: 41c0e205                 shl r10b, 5
0x1458cf989: 4108ca                   or r10b, cl
0x1458cf98c: 4538d1                   cmp r9b, r10b
0x1458cf98f: 7544                     jne 0x1458cf9d5
0x1458cf991: 0fb60dc2013101           movzx ecx, byte ptr [rip + 0x13101c2]
0x1458cf998: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf99c: 4180f91a                 cmp r9b, 0x1a
0x1458cf9a0: 410f92c1                 setb r9b
0x1458cf9a4: 41c0e105                 shl r9b, 5
0x1458cf9a8: 4108c9                   or r9b, cl
0x1458cf9ab: 0fb64a05                 movzx ecx, byte ptr [rdx + 5]
0x1458cf9af: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cf9b3: 4180fa1a                 cmp r10b, 0x1a
0x1458cf9b7: 410f92c2                 setb r10b
0x1458cf9bb: 41c0e205                 shl r10b, 5
0x1458cf9bf: 4108ca                   or r10b, cl
0x1458cf9c2: 4538d1                   cmp r9b, r10b
0x1458cf9c5: 750e                     jne 0x1458cf9d5
0x1458cf9c7: 488d0d3a0e3101           lea rcx, [rip + 0x1310e3a]
0x1458cf9ce: 31c0                     xor eax, eax
0x1458cf9d0: e9d2070000               jmp 0x1458d01a7
0x1458cf9d5: 4983f805                 cmp r8, 5
0x1458cf9d9: 0f8523010000             jne 0x1458cfb02
0x1458cf9df: 0fb60d11033101           movzx ecx, byte ptr [rip + 0x1310311]
0x1458cf9e6: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cf9ea: 4180f91a                 cmp r9b, 0x1a
0x1458cf9ee: 410f92c1                 setb r9b
0x1458cf9f2: 41c0e105                 shl r9b, 5
0x1458cf9f6: 4108c9                   or r9b, cl
0x1458cf9f9: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cf9fc: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfa00: 4180fa1a                 cmp r10b, 0x1a
0x1458cfa04: 410f92c2                 setb r10b
0x1458cfa08: 41c0e205                 shl r10b, 5
0x1458cfa0c: 4108ca                   or r10b, cl
0x1458cfa0f: 4538d1                   cmp r9b, r10b
0x1458cfa12: 0f85ea000000             jne 0x1458cfb02
0x1458cfa18: 0fb60dd9023101           movzx ecx, byte ptr [rip + 0x13102d9]
0x1458cfa1f: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfa23: 4180f91a                 cmp r9b, 0x1a
0x1458cfa27: 410f92c1                 setb r9b
0x1458cfa2b: 41c0e105                 shl r9b, 5
0x1458cfa2f: 4108c9                   or r9b, cl
0x1458cfa32: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cfa36: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfa3a: 4180fa1a                 cmp r10b, 0x1a
0x1458cfa3e: 410f92c2                 setb r10b
0x1458cfa42: 41c0e205                 shl r10b, 5
0x1458cfa46: 4108ca                   or r10b, cl
0x1458cfa49: 4538d1                   cmp r9b, r10b
0x1458cfa4c: 0f85b0000000             jne 0x1458cfb02
0x1458cfa52: 0fb60da0023101           movzx ecx, byte ptr [rip + 0x13102a0]
0x1458cfa59: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfa5d: 4180f91a                 cmp r9b, 0x1a
0x1458cfa61: 410f92c1                 setb r9b
0x1458cfa65: 41c0e105                 shl r9b, 5
0x1458cfa69: 4108c9                   or r9b, cl
0x1458cfa6c: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cfa70: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfa74: 4180fa1a                 cmp r10b, 0x1a
0x1458cfa78: 410f92c2                 setb r10b
0x1458cfa7c: 41c0e205                 shl r10b, 5
0x1458cfa80: 4108ca                   or r10b, cl
0x1458cfa83: 4538d1                   cmp r9b, r10b
0x1458cfa86: 757a                     jne 0x1458cfb02
0x1458cfa88: 0fb60d6b023101           movzx ecx, byte ptr [rip + 0x131026b]
0x1458cfa8f: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfa93: 4180f91a                 cmp r9b, 0x1a
0x1458cfa97: 410f92c1                 setb r9b
0x1458cfa9b: 41c0e105                 shl r9b, 5
0x1458cfa9f: 4108c9                   or r9b, cl
0x1458cfaa2: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cfaa6: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfaaa: 4180fa1a                 cmp r10b, 0x1a
0x1458cfaae: 410f92c2                 setb r10b
0x1458cfab2: 41c0e205                 shl r10b, 5
0x1458cfab6: 4108ca                   or r10b, cl
0x1458cfab9: 4538d1                   cmp r9b, r10b
0x1458cfabc: 7544                     jne 0x1458cfb02
0x1458cfabe: 0fb60d36023101           movzx ecx, byte ptr [rip + 0x1310236]
0x1458cfac5: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfac9: 4180f91a                 cmp r9b, 0x1a
0x1458cfacd: 410f92c1                 setb r9b
0x1458cfad1: 41c0e105                 shl r9b, 5
0x1458cfad5: 4108c9                   or r9b, cl
0x1458cfad8: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cfadc: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfae0: 4180fa1a                 cmp r10b, 0x1a
0x1458cfae4: 410f92c2                 setb r10b
0x1458cfae8: 41c0e205                 shl r10b, 5
0x1458cfaec: 4108ca                   or r10b, cl
0x1458cfaef: 4538d1                   cmp r9b, r10b
0x1458cfaf2: 750e                     jne 0x1458cfb02
0x1458cfaf4: 488d0d9d0d3101           lea rcx, [rip + 0x1310d9d]
0x1458cfafb: 31c0                     xor eax, eax
0x1458cfafd: e9a5060000               jmp 0x1458d01a7
0x1458cfb02: 4983f806                 cmp r8, 6
0x1458cfb06: 0f85ba020000             jne 0x1458cfdc6
0x1458cfb0c: 0fb60d83033101           movzx ecx, byte ptr [rip + 0x1310383]
0x1458cfb13: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfb17: 4180f91a                 cmp r9b, 0x1a
0x1458cfb1b: 410f92c1                 setb r9b
0x1458cfb1f: 41c0e105                 shl r9b, 5
0x1458cfb23: 4108c9                   or r9b, cl
0x1458cfb26: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cfb29: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfb2d: 4180fa1a                 cmp r10b, 0x1a
0x1458cfb31: 410f92c2                 setb r10b
0x1458cfb35: 41c0e205                 shl r10b, 5
0x1458cfb39: 4108ca                   or r10b, cl
0x1458cfb3c: 4538d1                   cmp r9b, r10b
0x1458cfb3f: 0f8524010000             jne 0x1458cfc69
0x1458cfb45: 0fb60d4b033101           movzx ecx, byte ptr [rip + 0x131034b]
0x1458cfb4c: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfb50: 4180f91a                 cmp r9b, 0x1a
0x1458cfb54: 410f92c1                 setb r9b
0x1458cfb58: 41c0e105                 shl r9b, 5
0x1458cfb5c: 4108c9                   or r9b, cl
0x1458cfb5f: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cfb63: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfb67: 4180fa1a                 cmp r10b, 0x1a
0x1458cfb6b: 410f92c2                 setb r10b
0x1458cfb6f: 41c0e205                 shl r10b, 5
0x1458cfb73: 4108ca                   or r10b, cl
0x1458cfb76: 4538d1                   cmp r9b, r10b
0x1458cfb79: 0f85ea000000             jne 0x1458cfc69
0x1458cfb7f: 0fb60d12033101           movzx ecx, byte ptr [rip + 0x1310312]
0x1458cfb86: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfb8a: 4180f91a                 cmp r9b, 0x1a
0x1458cfb8e: 410f92c1                 setb r9b
0x1458cfb92: 41c0e105                 shl r9b, 5
0x1458cfb96: 4108c9                   or r9b, cl
0x1458cfb99: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cfb9d: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfba1: 4180fa1a                 cmp r10b, 0x1a
0x1458cfba5: 410f92c2                 setb r10b
0x1458cfba9: 41c0e205                 shl r10b, 5
0x1458cfbad: 4108ca                   or r10b, cl
0x1458cfbb0: 4538d1                   cmp r9b, r10b
0x1458cfbb3: 0f85b0000000             jne 0x1458cfc69
0x1458cfbb9: 0fb60dd9023101           movzx ecx, byte ptr [rip + 0x13102d9]
0x1458cfbc0: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfbc4: 4180f91a                 cmp r9b, 0x1a
0x1458cfbc8: 410f92c1                 setb r9b
0x1458cfbcc: 41c0e105                 shl r9b, 5
0x1458cfbd0: 4108c9                   or r9b, cl
0x1458cfbd3: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cfbd7: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfbdb: 4180fa1a                 cmp r10b, 0x1a
0x1458cfbdf: 410f92c2                 setb r10b
0x1458cfbe3: 41c0e205                 shl r10b, 5
0x1458cfbe7: 4108ca                   or r10b, cl
0x1458cfbea: 4538d1                   cmp r9b, r10b
0x1458cfbed: 757a                     jne 0x1458cfc69
0x1458cfbef: 0fb60da4023101           movzx ecx, byte ptr [rip + 0x13102a4]
0x1458cfbf6: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfbfa: 4180f91a                 cmp r9b, 0x1a
0x1458cfbfe: 410f92c1                 setb r9b
0x1458cfc02: 41c0e105                 shl r9b, 5
0x1458cfc06: 4108c9                   or r9b, cl
0x1458cfc09: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cfc0d: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfc11: 4180fa1a                 cmp r10b, 0x1a
0x1458cfc15: 410f92c2                 setb r10b
0x1458cfc19: 41c0e205                 shl r10b, 5
0x1458cfc1d: 4108ca                   or r10b, cl
0x1458cfc20: 4538d1                   cmp r9b, r10b
0x1458cfc23: 7544                     jne 0x1458cfc69
0x1458cfc25: 0fb60d6f023101           movzx ecx, byte ptr [rip + 0x131026f]
0x1458cfc2c: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfc30: 4180f91a                 cmp r9b, 0x1a
0x1458cfc34: 410f92c1                 setb r9b
0x1458cfc38: 41c0e105                 shl r9b, 5
0x1458cfc3c: 4108c9                   or r9b, cl
0x1458cfc3f: 0fb64a05                 movzx ecx, byte ptr [rdx + 5]
0x1458cfc43: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfc47: 4180fa1a                 cmp r10b, 0x1a
0x1458cfc4b: 410f92c2                 setb r10b
0x1458cfc4f: 41c0e205                 shl r10b, 5
0x1458cfc53: 4108ca                   or r10b, cl
0x1458cfc56: 4538d1                   cmp r9b, r10b
0x1458cfc59: 750e                     jne 0x1458cfc69
0x1458cfc5b: 488d0dc60c3101           lea rcx, [rip + 0x1310cc6]
0x1458cfc62: 31c0                     xor eax, eax
0x1458cfc64: e93e050000               jmp 0x1458d01a7
0x1458cfc69: 0fb60dab033101           movzx ecx, byte ptr [rip + 0x13103ab]
0x1458cfc70: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfc74: 4180f91a                 cmp r9b, 0x1a
0x1458cfc78: 410f92c1                 setb r9b
0x1458cfc7c: 41c0e105                 shl r9b, 5
0x1458cfc80: 4108c9                   or r9b, cl
0x1458cfc83: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cfc86: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfc8a: 4180fa1a                 cmp r10b, 0x1a
0x1458cfc8e: 410f92c2                 setb r10b
0x1458cfc92: 41c0e205                 shl r10b, 5
0x1458cfc96: 4108ca                   or r10b, cl
0x1458cfc99: 4538d1                   cmp r9b, r10b
0x1458cfc9c: 0f8524010000             jne 0x1458cfdc6
0x1458cfca2: 0fb60d73033101           movzx ecx, byte ptr [rip + 0x1310373]
0x1458cfca9: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfcad: 4180f91a                 cmp r9b, 0x1a
0x1458cfcb1: 410f92c1                 setb r9b
0x1458cfcb5: 41c0e105                 shl r9b, 5
0x1458cfcb9: 4108c9                   or r9b, cl
0x1458cfcbc: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cfcc0: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfcc4: 4180fa1a                 cmp r10b, 0x1a
0x1458cfcc8: 410f92c2                 setb r10b
0x1458cfccc: 41c0e205                 shl r10b, 5
0x1458cfcd0: 4108ca                   or r10b, cl
0x1458cfcd3: 4538d1                   cmp r9b, r10b
0x1458cfcd6: 0f85ea000000             jne 0x1458cfdc6
0x1458cfcdc: 0fb60d3a033101           movzx ecx, byte ptr [rip + 0x131033a]
0x1458cfce3: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfce7: 4180f91a                 cmp r9b, 0x1a
0x1458cfceb: 410f92c1                 setb r9b
0x1458cfcef: 41c0e105                 shl r9b, 5
0x1458cfcf3: 4108c9                   or r9b, cl
0x1458cfcf6: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cfcfa: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfcfe: 4180fa1a                 cmp r10b, 0x1a
0x1458cfd02: 410f92c2                 setb r10b
0x1458cfd06: 41c0e205                 shl r10b, 5
0x1458cfd0a: 4108ca                   or r10b, cl
0x1458cfd0d: 4538d1                   cmp r9b, r10b
0x1458cfd10: 0f85b0000000             jne 0x1458cfdc6
0x1458cfd16: 0fb60d01033101           movzx ecx, byte ptr [rip + 0x1310301]
0x1458cfd1d: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfd21: 4180f91a                 cmp r9b, 0x1a
0x1458cfd25: 410f92c1                 setb r9b
0x1458cfd29: 41c0e105                 shl r9b, 5
0x1458cfd2d: 4108c9                   or r9b, cl
0x1458cfd30: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cfd34: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfd38: 4180fa1a                 cmp r10b, 0x1a
0x1458cfd3c: 410f92c2                 setb r10b
0x1458cfd40: 41c0e205                 shl r10b, 5
0x1458cfd44: 4108ca                   or r10b, cl
0x1458cfd47: 4538d1                   cmp r9b, r10b
0x1458cfd4a: 757a                     jne 0x1458cfdc6
0x1458cfd4c: 0fb60dcc023101           movzx ecx, byte ptr [rip + 0x13102cc]
0x1458cfd53: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfd57: 4180f91a                 cmp r9b, 0x1a
0x1458cfd5b: 410f92c1                 setb r9b
0x1458cfd5f: 41c0e105                 shl r9b, 5
0x1458cfd63: 4108c9                   or r9b, cl
0x1458cfd66: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cfd6a: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfd6e: 4180fa1a                 cmp r10b, 0x1a
0x1458cfd72: 410f92c2                 setb r10b
0x1458cfd76: 41c0e205                 shl r10b, 5
0x1458cfd7a: 4108ca                   or r10b, cl
0x1458cfd7d: 4538d1                   cmp r9b, r10b
0x1458cfd80: 7544                     jne 0x1458cfdc6
0x1458cfd82: 0fb60d97023101           movzx ecx, byte ptr [rip + 0x1310297]
0x1458cfd89: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfd8d: 4180f91a                 cmp r9b, 0x1a
0x1458cfd91: 410f92c1                 setb r9b
0x1458cfd95: 41c0e105                 shl r9b, 5
0x1458cfd99: 4108c9                   or r9b, cl
0x1458cfd9c: 0fb64a05                 movzx ecx, byte ptr [rdx + 5]
0x1458cfda0: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfda4: 4180fa1a                 cmp r10b, 0x1a
0x1458cfda8: 410f92c2                 setb r10b
0x1458cfdac: 41c0e205                 shl r10b, 5
0x1458cfdb0: 4108ca                   or r10b, cl
0x1458cfdb3: 4538d1                   cmp r9b, r10b
0x1458cfdb6: 750e                     jne 0x1458cfdc6
0x1458cfdb8: 488d0df90b3101           lea rcx, [rip + 0x1310bf9]
0x1458cfdbf: 31c0                     xor eax, eax
0x1458cfdc1: e9e1030000               jmp 0x1458d01a7
0x1458cfdc6: 4983f804                 cmp r8, 4
0x1458cfdca: 0f85e9000000             jne 0x1458cfeb9
0x1458cfdd0: 0fb60de9033101           movzx ecx, byte ptr [rip + 0x13103e9]
0x1458cfdd7: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfddb: 4180f91a                 cmp r9b, 0x1a
0x1458cfddf: 410f92c1                 setb r9b
0x1458cfde3: 41c0e105                 shl r9b, 5
0x1458cfde7: 4108c9                   or r9b, cl
0x1458cfdea: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cfded: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfdf1: 4180fa1a                 cmp r10b, 0x1a
0x1458cfdf5: 410f92c2                 setb r10b
0x1458cfdf9: 41c0e205                 shl r10b, 5
0x1458cfdfd: 4108ca                   or r10b, cl
0x1458cfe00: 4538d1                   cmp r9b, r10b
0x1458cfe03: 0f85b0000000             jne 0x1458cfeb9
0x1458cfe09: 0fb60db1033101           movzx ecx, byte ptr [rip + 0x13103b1]
0x1458cfe10: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfe14: 4180f91a                 cmp r9b, 0x1a
0x1458cfe18: 410f92c1                 setb r9b
0x1458cfe1c: 41c0e105                 shl r9b, 5
0x1458cfe20: 4108c9                   or r9b, cl
0x1458cfe23: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cfe27: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfe2b: 4180fa1a                 cmp r10b, 0x1a
0x1458cfe2f: 410f92c2                 setb r10b
0x1458cfe33: 41c0e205                 shl r10b, 5
0x1458cfe37: 4108ca                   or r10b, cl
0x1458cfe3a: 4538d1                   cmp r9b, r10b
0x1458cfe3d: 757a                     jne 0x1458cfeb9
0x1458cfe3f: 0fb60d7c033101           movzx ecx, byte ptr [rip + 0x131037c]
0x1458cfe46: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfe4a: 4180f91a                 cmp r9b, 0x1a
0x1458cfe4e: 410f92c1                 setb r9b
0x1458cfe52: 41c0e105                 shl r9b, 5
0x1458cfe56: 4108c9                   or r9b, cl
0x1458cfe59: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cfe5d: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfe61: 4180fa1a                 cmp r10b, 0x1a
0x1458cfe65: 410f92c2                 setb r10b
0x1458cfe69: 41c0e205                 shl r10b, 5
0x1458cfe6d: 4108ca                   or r10b, cl
0x1458cfe70: 4538d1                   cmp r9b, r10b
0x1458cfe73: 7544                     jne 0x1458cfeb9
0x1458cfe75: 0fb60d47033101           movzx ecx, byte ptr [rip + 0x1310347]
0x1458cfe7c: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfe80: 4180f91a                 cmp r9b, 0x1a
0x1458cfe84: 410f92c1                 setb r9b
0x1458cfe88: 41c0e105                 shl r9b, 5
0x1458cfe8c: 4108c9                   or r9b, cl
0x1458cfe8f: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cfe93: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfe97: 4180fa1a                 cmp r10b, 0x1a
0x1458cfe9b: 410f92c2                 setb r10b
0x1458cfe9f: 41c0e205                 shl r10b, 5
0x1458cfea3: 4108ca                   or r10b, cl
0x1458cfea6: 4538d1                   cmp r9b, r10b
0x1458cfea9: 750e                     jne 0x1458cfeb9
0x1458cfeab: 488d0d960b3101           lea rcx, [rip + 0x1310b96]
0x1458cfeb2: 31c0                     xor eax, eax
0x1458cfeb4: e9ee020000               jmp 0x1458d01a7
0x1458cfeb9: 4983f807                 cmp r8, 7
0x1458cfebd: 0f85b8010000             jne 0x1458d007b
0x1458cfec3: 0fb60dc2043101           movzx ecx, byte ptr [rip + 0x13104c2]
0x1458cfeca: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cfece: 4180f91a                 cmp r9b, 0x1a
0x1458cfed2: 410f92c1                 setb r9b
0x1458cfed6: 41c0e105                 shl r9b, 5
0x1458cfeda: 4108c9                   or r9b, cl
0x1458cfedd: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458cfee0: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cfee4: 4180fa1a                 cmp r10b, 0x1a
0x1458cfee8: 410f92c2                 setb r10b
0x1458cfeec: 41c0e205                 shl r10b, 5
0x1458cfef0: 4108ca                   or r10b, cl
0x1458cfef3: 4538d1                   cmp r9b, r10b
0x1458cfef6: 0f857f010000             jne 0x1458d007b
0x1458cfefc: 0fb60d8a043101           movzx ecx, byte ptr [rip + 0x131048a]
0x1458cff03: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cff07: 4180f91a                 cmp r9b, 0x1a
0x1458cff0b: 410f92c1                 setb r9b
0x1458cff0f: 41c0e105                 shl r9b, 5
0x1458cff13: 4108c9                   or r9b, cl
0x1458cff16: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458cff1a: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cff1e: 4180fa1a                 cmp r10b, 0x1a
0x1458cff22: 410f92c2                 setb r10b
0x1458cff26: 41c0e205                 shl r10b, 5
0x1458cff2a: 4108ca                   or r10b, cl
0x1458cff2d: 4538d1                   cmp r9b, r10b
0x1458cff30: 0f8545010000             jne 0x1458d007b
0x1458cff36: 0fb60d51043101           movzx ecx, byte ptr [rip + 0x1310451]
0x1458cff3d: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cff41: 4180f91a                 cmp r9b, 0x1a
0x1458cff45: 410f92c1                 setb r9b
0x1458cff49: 41c0e105                 shl r9b, 5
0x1458cff4d: 4108c9                   or r9b, cl
0x1458cff50: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458cff54: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cff58: 4180fa1a                 cmp r10b, 0x1a
0x1458cff5c: 410f92c2                 setb r10b
0x1458cff60: 41c0e205                 shl r10b, 5
0x1458cff64: 4108ca                   or r10b, cl
0x1458cff67: 4538d1                   cmp r9b, r10b
0x1458cff6a: 0f850b010000             jne 0x1458d007b
0x1458cff70: 0fb60d18043101           movzx ecx, byte ptr [rip + 0x1310418]
0x1458cff77: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cff7b: 4180f91a                 cmp r9b, 0x1a
0x1458cff7f: 410f92c1                 setb r9b
0x1458cff83: 41c0e105                 shl r9b, 5
0x1458cff87: 4108c9                   or r9b, cl
0x1458cff8a: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458cff8e: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cff92: 4180fa1a                 cmp r10b, 0x1a
0x1458cff96: 410f92c2                 setb r10b
0x1458cff9a: 41c0e205                 shl r10b, 5
0x1458cff9e: 4108ca                   or r10b, cl
0x1458cffa1: 4538d1                   cmp r9b, r10b
0x1458cffa4: 0f85d1000000             jne 0x1458d007b
0x1458cffaa: 0fb60ddf033101           movzx ecx, byte ptr [rip + 0x13103df]
0x1458cffb1: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cffb5: 4180f91a                 cmp r9b, 0x1a
0x1458cffb9: 410f92c1                 setb r9b
0x1458cffbd: 41c0e105                 shl r9b, 5
0x1458cffc1: 4108c9                   or r9b, cl
0x1458cffc4: 0fb64a04                 movzx ecx, byte ptr [rdx + 4]
0x1458cffc8: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458cffcc: 4180fa1a                 cmp r10b, 0x1a
0x1458cffd0: 410f92c2                 setb r10b
0x1458cffd4: 41c0e205                 shl r10b, 5
0x1458cffd8: 4108ca                   or r10b, cl
0x1458cffdb: 4538d1                   cmp r9b, r10b
0x1458cffde: 0f8597000000             jne 0x1458d007b
0x1458cffe4: 0fb60da6033101           movzx ecx, byte ptr [rip + 0x13103a6]
0x1458cffeb: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458cffef: 4180f91a                 cmp r9b, 0x1a
0x1458cfff3: 410f92c1                 setb r9b
0x1458cfff7: 41c0e105                 shl r9b, 5
0x1458cfffb: 4108c9                   or r9b, cl
0x1458cfffe: 0fb64a05                 movzx ecx, byte ptr [rdx + 5]
0x1458d0002: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458d0006: 4180fa1a                 cmp r10b, 0x1a
0x1458d000a: 410f92c2                 setb r10b
0x1458d000e: 41c0e205                 shl r10b, 5
0x1458d0012: 4108ca                   or r10b, cl
0x1458d0015: 4538d1                   cmp r9b, r10b
0x1458d0018: 7561                     jne 0x1458d007b
0x1458d001a: 4983f805                 cmp r8, 5
0x1458d001e: 410f95c0                 setne r8b
0x1458d0022: 0fb60d69033101           movzx ecx, byte ptr [rip + 0x1310369]
0x1458d0029: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458d002d: 4180f91a                 cmp r9b, 0x1a
0x1458d0031: 410f92c1                 setb r9b
0x1458d0035: 41c0e105                 shl r9b, 5
0x1458d0039: 4108c9                   or r9b, cl
0x1458d003c: 0fb64a06                 movzx ecx, byte ptr [rdx + 6]
0x1458d0040: 448d51bf                 lea r10d, [rcx - 0x41]
0x1458d0044: 4180fa1a                 cmp r10b, 0x1a
0x1458d0048: 410f92c2                 setb r10b
0x1458d004c: 41c0e205                 shl r10b, 5
0x1458d0050: 4108ca                   or r10b, cl
0x1458d0053: 31c9                     xor ecx, ecx
0x1458d0055: 4538d1                   cmp r9b, r10b
0x1458d0058: 410f95c1                 setne r9b
0x1458d005c: 410f94c2                 sete r10b
0x1458d0060: 4c8d1d710a3101           lea r11, [rip + 0x1310a71]
0x1458d0067: 490f44cb                 cmove rcx, r11
0x1458d006b: 4508c2                   or r10b, r8b
0x1458d006e: 7415                     je 0x1458d0085
0x1458d0070: 41f6d9                   neg r9b
0x1458d0073: 4489c8                   mov eax, r9d
0x1458d0076: e92c010000               jmp 0x1458d01a7
0x1458d007b: 4983f805                 cmp r8, 5
0x1458d007f: 0f8520010000             jne 0x1458d01a5
0x1458d0085: 0fb60dbc043101           movzx ecx, byte ptr [rip + 0x13104bc]
0x1458d008c: 448d41bf                 lea r8d, [rcx - 0x41]
0x1458d0090: 4180f81a                 cmp r8b, 0x1a
0x1458d0094: 410f92c0                 setb r8b
0x1458d0098: 41c0e005                 shl r8b, 5
0x1458d009c: 4108c8                   or r8b, cl
0x1458d009f: 0fb60a                   movzx ecx, byte ptr [rdx]
0x1458d00a2: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458d00a6: 4180f91a                 cmp r9b, 0x1a
0x1458d00aa: 410f92c1                 setb r9b
0x1458d00ae: 41c0e105                 shl r9b, 5
0x1458d00b2: 4108c9                   or r9b, cl
0x1458d00b5: 4538c8                   cmp r8b, r9b
0x1458d00b8: 0f85e7000000             jne 0x1458d01a5
0x1458d00be: 0fb60d84043101           movzx ecx, byte ptr [rip + 0x1310484]
0x1458d00c5: 448d41bf                 lea r8d, [rcx - 0x41]
0x1458d00c9: 4180f81a                 cmp r8b, 0x1a
0x1458d00cd: 410f92c0                 setb r8b
0x1458d00d1: 41c0e005                 shl r8b, 5
0x1458d00d5: 4108c8                   or r8b, cl
0x1458d00d8: 0fb64a01                 movzx ecx, byte ptr [rdx + 1]
0x1458d00dc: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458d00e0: 4180f91a                 cmp r9b, 0x1a
0x1458d00e4: 410f92c1                 setb r9b
0x1458d00e8: 41c0e105                 shl r9b, 5
0x1458d00ec: 4108c9                   or r9b, cl
0x1458d00ef: 4538c8                   cmp r8b, r9b
0x1458d00f2: 0f85ad000000             jne 0x1458d01a5
0x1458d00f8: 0fb60d4b043101           movzx ecx, byte ptr [rip + 0x131044b]
0x1458d00ff: 448d41bf                 lea r8d, [rcx - 0x41]
0x1458d0103: 4180f81a                 cmp r8b, 0x1a
0x1458d0107: 410f92c0                 setb r8b
0x1458d010b: 41c0e005                 shl r8b, 5
0x1458d010f: 4108c8                   or r8b, cl
0x1458d0112: 0fb64a02                 movzx ecx, byte ptr [rdx + 2]
0x1458d0116: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458d011a: 4180f91a                 cmp r9b, 0x1a
0x1458d011e: 410f92c1                 setb r9b
0x1458d0122: 41c0e105                 shl r9b, 5
0x1458d0126: 4108c9                   or r9b, cl
0x1458d0129: 4538c8                   cmp r8b, r9b
0x1458d012c: 7577                     jne 0x1458d01a5
0x1458d012e: 0fb60d16043101           movzx ecx, byte ptr [rip + 0x1310416]
0x1458d0135: 448d41bf                 lea r8d, [rcx - 0x41]
0x1458d0139: 4180f81a                 cmp r8b, 0x1a
0x1458d013d: 410f92c0                 setb r8b
0x1458d0141: 41c0e005                 shl r8b, 5
0x1458d0145: 4108c8                   or r8b, cl
0x1458d0148: 0fb64a03                 movzx ecx, byte ptr [rdx + 3]
0x1458d014c: 448d49bf                 lea r9d, [rcx - 0x41]
0x1458d0150: 4180f91a                 cmp r9b, 0x1a
0x1458d0154: 410f92c1                 setb r9b
0x1458d0158: 41c0e105                 shl r9b, 5
0x1458d015c: 4108c9                   or r9b, cl
0x1458d015f: 4538c8                   cmp r8b, r9b
0x1458d0162: 7541                     jne 0x1458d01a5
0x1458d0164: 0fb605e1033101           movzx eax, byte ptr [rip + 0x13103e1]
0x1458d016b: 8d48bf                   lea ecx, [rax - 0x41]
0x1458d016e: 80f91a                   cmp cl, 0x1a
0x1458d0171: 410f92c0                 setb r8b
0x1458d0175: 41c0e005                 shl r8b, 5
0x1458d0179: 4108c0                   or r8b, al
0x1458d017c: 0fb64204                 movzx eax, byte ptr [rdx + 4]
0x1458d0180: 8d48bf                   lea ecx, [rax - 0x41]
0x1458d0183: 80f91a                   cmp cl, 0x1a
0x1458d0186: 0f92c2                   setb dl
0x1458d0189: c0e205                   shl dl, 5
0x1458d018c: 08c2                     or dl, al
0x1458d018e: 31c9                     xor ecx, ecx
0x1458d0190: 4138d0                   cmp r8b, dl
0x1458d0193: 0f95c0                   setne al
0x1458d0196: 488d15cb093101           lea rdx, [rip + 0x13109cb]
0x1458d019d: 480f44ca                 cmove rcx, rdx
0x1458d01a1: f6d8                     neg al
0x1458d01a3: eb02                     jmp 0x1458d01a7
0x1458d01a5: 31c9                     xor ecx, ecx
0x1458d01a7: 488d153a053101           lea rdx, [rip + 0x131053a]
0x1458d01ae: a801                     test al, 1
0x1458d01b0: 480f44d1                 cmove rdx, rcx
0x1458d01b4: 488955d8                 mov qword ptr [rbp - 0x28], rdx
0x1458d01b8: 0fb6828c000000           movzx eax, byte ptr [rdx + 0x8c]
0x1458d01bf: fec8                     dec al
0x1458d01c1: 3c0a                     cmp al, 0xa
0x1458d01c3: 771e                     ja 0x1458d01e3
0x1458d01c5: 488d0d44c33101           lea rcx, [rip + 0x131c344]
0x1458d01cc: 0fb6c0                   movzx eax, al
0x1458d01cf: 48631c81                 movsxd rbx, dword ptr [rcx + rax*4]
0x1458d01d3: 4801cb                   add rbx, rcx
0x1458d01d6: 488d0d63c33101           lea rcx, [rip + 0x131c363]
0x1458d01dd: 4c8b3cc1                 mov r15, qword ptr [rcx + rax*8]
0x1458d01e1: eb0d                     jmp 0x1458d01f0
0x1458d01e3: 41bf01000000             mov r15d, 1
0x1458d01e9: 488d1dc0c13101           lea rbx, [rip + 0x131c1c0]
0x1458d01f0: 31c0                     xor eax, eax
0x1458d01f2: 48897db8                 mov qword ptr [rbp - 0x48], rdi
0x1458d01f6: 48895dc0                 mov qword ptr [rbp - 0x40], rbx
0x1458d01fa: 4c897dc8                 mov qword ptr [rbp - 0x38], r15
0x1458d01fe: eb10                     jmp 0x1458d0210
0x1458d0200: 488b45a8                 mov rax, qword ptr [rbp - 0x58]
0x1458d0204: 483dc0020000             cmp rax, 0x2c0
0x1458d020a: 0f84bf020000             je 0x1458d04cf
0x1458d0210: 488d0d39f33001           lea rcx, [rip + 0x130f339]
0x1458d0217: 488d1401                 lea rdx, [rcx + rax]
0x1458d021b: 488955b0                 mov qword ptr [rbp - 0x50], rdx
0x1458d021f: 4c8b3c08                 mov r15, qword ptr [rax + rcx]
0x1458d0223: 4c8b740808               mov r14, qword ptr [rax + rcx + 8]
0x1458d0228: 4883c058                 add rax, 0x58
0x1458d022c: 488945a8                 mov qword ptr [rbp - 0x58], rax
0x1458d0230: 48c745e000000000         mov qword ptr [rbp - 0x20], 0
0x1458d0238: 48c745e801000000         mov qword ptr [rbp - 0x18], 1
0x1458d0240: 4531e4                   xor r12d, r12d
0x1458d0243: 31ff                     xor edi, edi
0x1458d0245: 4c8965f0                 mov qword ptr [rbp - 0x10], r12
0x1458d0249: 4c89f3                   mov rbx, r14
0x1458d024c: 48897df8                 mov qword ptr [rbp - 8], rdi
0x1458d0250: 4829fb                   sub rbx, rdi
0x1458d0253: 0f8217010000             jb 0x1458d0370
0x1458d0259: 4c8b6df8                 mov r13, qword ptr [rbp - 8]
0x1458d025d: eb0d                     jmp 0x1458d026c
0x1458d025f: 90                       nop
0x1458d0260: 4989fd                   mov r13, rdi
0x1458d0263: 4c39f7                   cmp rdi, r14
0x1458d0266: 0f8704010000             ja 0x1458d0370
0x1458d026c: 4d89f0                   mov r8, r14
0x1458d026f: 4d29e8                   sub r8, r13
0x1458d0272: 4b8d142f                 lea rdx, [r15 + r13]
0x1458d0276: 4983f810                 cmp r8, 0x10
0x1458d027a: 7334                     jae 0x1458d02b0
0x1458d027c: 31f6                     xor esi, esi
0x1458d027e: 4d85c0                   test r8, r8
0x1458d0281: 741e                     je 0x1458d02a1
0x1458d0283: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458d0290: 803c3220                 cmp byte ptr [rdx + rsi], 0x20
0x1458d0294: 7430                     je 0x1458d02c6
0x1458d0296: 48ffc6                   inc rsi
0x1458d0299: 4939f0                   cmp r8, rsi
0x1458d029c: 75f2                     jne 0x1458d0290
0x1458d029e: 4c89c6                   mov rsi, r8
0x1458d02a1: 31c0                     xor eax, eax
0x1458d02a3: 4883f801                 cmp rax, 1
0x1458d02a7: 7437                     je 0x1458d02e0
0x1458d02a9: e9c2000000               jmp 0x1458d0370
0x1458d02ae: 6690                     nop
0x1458d02b0: b120                     mov cl, 0x20
0x1458d02b2: e8a9553000               call 0x145bd5860
0x1458d02b7: 90                       nop
0x1458d02b8: 4889d6                   mov rsi, rdx
0x1458d02bb: 4883f801                 cmp rax, 1
0x1458d02bf: 741f                     je 0x1458d02e0
0x1458d02c1: e9aa000000               jmp 0x1458d0370
0x1458d02c6: b801000000               mov eax, 1
0x1458d02cb: 4883f801                 cmp rax, 1
0x1458d02cf: 0f859b000000             jne 0x1458d0370
0x1458d02d5: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
0x1458d02e0: 4a8d3c2e                 lea rdi, [rsi + r13]
0x1458d02e4: 48ffc7                   inc rdi
0x1458d02e7: 4c01ee                   add rsi, r13
0x1458d02ea: 4c39f6                   cmp rsi, r14
0x1458d02ed: 0f836dffffff             jae 0x1458d0260
0x1458d02f3: 41803c3720               cmp byte ptr [r15 + rsi], 0x20
0x1458d02f8: 0f8562ffffff             jne 0x1458d0260
0x1458d02fe: 4889f3                   mov rbx, rsi
0x1458d0301: 482b5df8                 sub rbx, qword ptr [rbp - 8]
0x1458d0305: 488b45e0                 mov rax, qword ptr [rbp - 0x20]
0x1458d0309: 4c29e0                   sub rax, r12
0x1458d030c: 4839c3                   cmp rbx, rax
0x1458d030f: 7727                     ja 0x1458d0338
0x1458d0311: 488b55f8                 mov rdx, qword ptr [rbp - 8]
0x1458d0315: 4839d6                   cmp rsi, rdx
0x1458d0318: 7412                     je 0x1458d032c
0x1458d031a: 4c01fa                   add rdx, r15
0x1458d031d: 488b4de8                 mov rcx, qword ptr [rbp - 0x18]
0x1458d0321: 4c01e1                   add rcx, r12
0x1458d0324: 4989d8                   mov r8, rbx
0x1458d0327: e8bb9d3200               call 0x145bfa0e7
0x1458d032c: 4901dc                   add r12, rbx
0x1458d032f: 4c8965f0                 mov qword ptr [rbp - 0x10], r12
0x1458d0333: e90dffffff               jmp 0x1458d0245
0x1458d0338: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x1458d0341: 41b901000000             mov r9d, 1
0x1458d0347: 488d4de0                 lea rcx, [rbp - 0x20]
0x1458d034b: 4c89e2                   mov rdx, r12
0x1458d034e: 4989d8                   mov r8, rbx
0x1458d0351: e81aa63200               call 0x145bfa970
0x1458d0356: 90                       nop
0x1458d0357: 4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
0x1458d035b: 488b55f8                 mov rdx, qword ptr [rbp - 8]
0x1458d035f: 4839d6                   cmp rsi, rdx
0x1458d0362: 75b6                     jne 0x1458d031a
0x1458d0364: ebc6                     jmp 0x1458d032c
0x1458d0366: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458d0370: 488b45e0                 mov rax, qword ptr [rbp - 0x20]
0x1458d0374: 4c29e0                   sub rax, r12
0x1458d0377: 4839c3                   cmp rbx, rax
0x1458d037a: 0f870f010000             ja 0x1458d048f
0x1458d0380: 488b75e8                 mov rsi, qword ptr [rbp - 0x18]
0x1458d0384: 488b45f8                 mov rax, qword ptr [rbp - 8]
0x1458d0388: 4939c6                   cmp r14, rax
0x1458d038b: 7412                     je 0x1458d039f
0x1458d038d: 4901c7                   add r15, rax
0x1458d0390: 4a8d0c26                 lea rcx, [rsi + r12]
0x1458d0394: 4c89fa                   mov rdx, r15
0x1458d0397: 4989d8                   mov r8, rbx
0x1458d039a: e8489d3200               call 0x145bfa0e7
0x1458d039f: 4901dc                   add r12, rbx
0x1458d03a2: 4c8b75e0                 mov r14, qword ptr [rbp - 0x20]
0x1458d03a6: 4c8b4d70                 mov r9, qword ptr [rbp + 0x70]
0x1458d03aa: 4d39cc                   cmp r12, r9
0x1458d03ad: 488b7db8                 mov rdi, qword ptr [rbp - 0x48]
0x1458d03b1: 488b5dc0                 mov rbx, qword ptr [rbp - 0x40]
0x1458d03b5: 4c8b7dc8                 mov r15, qword ptr [rbp - 0x38]
0x1458d03b9: 0f85b1000000             jne 0x1458d0470
0x1458d03bf: 4983f90f                 cmp r9, 0xf
0x1458d03c3: 765b                     jbe 0x1458d0420
0x1458d03c5: 4889f1                   mov rcx, rsi
0x1458d03c8: 4c89ca                   mov rdx, r9
0x1458d03cb: 4989f8                   mov r8, rdi
0x1458d03ce: e8bd8f8afa               call 0x140179390
0x1458d03d3: 84c0                     test al, al
0x1458d03d5: 0f8495000000             je 0x1458d0470
0x1458d03db: 4d85f6                   test r14, r14
0x1458d03de: 7411                     je 0x1458d03f1
0x1458d03e0: 41b801000000             mov r8d, 1
0x1458d03e6: 4889f1                   mov rcx, rsi
0x1458d03e9: 4c89f2                   mov rdx, r14
0x1458d03ec: e8df1d73fa               call 0x1400021d0
0x1458d03f1: 488b55b0                 mov rdx, qword ptr [rbp - 0x50]
0x1458d03f5: 0fb64250                 movzx eax, byte ptr [rdx + 0x50]
0x1458d03f9: 31c9                     xor ecx, ecx
0x1458d03fb: 0f1f440000               nop dword ptr [rax + rax]
0x1458d0400: 38040b                   cmp byte ptr [rbx + rcx], al
0x1458d0403: 0f84bf000000             je 0x1458d04c8
0x1458d0409: 48ffc1                   inc rcx
0x1458d040c: 4939cf                   cmp r15, rcx
0x1458d040f: 75ef                     jne 0x1458d0400
0x1458d0411: e9eafdffff               jmp 0x1458d0200
0x1458d0416: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458d0420: 31c0                     xor eax, eax
0x1458d0422: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458d0430: 4939c1                   cmp r9, rax
0x1458d0433: 74a6                     je 0x1458d03db
0x1458d0435: 0fb60c06                 movzx ecx, byte ptr [rsi + rax]
0x1458d0439: 8d51bf                   lea edx, [rcx - 0x41]
0x1458d043c: 80fa1a                   cmp dl, 0x1a
0x1458d043f: 0f92c2                   setb dl
0x1458d0442: c0e205                   shl dl, 5
0x1458d0445: 08ca                     or dl, cl
0x1458d0447: 0fb60c07                 movzx ecx, byte ptr [rdi + rax]
0x1458d044b: 448d41bf                 lea r8d, [rcx - 0x41]
0x1458d044f: 4180f81a                 cmp r8b, 0x1a
0x1458d0453: 410f92c0                 setb r8b
0x1458d0457: 41c0e005                 shl r8b, 5
0x1458d045b: 4108c8                   or r8b, cl
0x1458d045e: 48ffc0                   inc rax
0x1458d0461: 4438c2                   cmp dl, r8b
0x1458d0464: 74ca                     je 0x1458d0430
0x1458d0466: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458d0470: 4d85f6                   test r14, r14
0x1458d0473: 0f8487fdffff             je 0x1458d0200
0x1458d0479: 41b801000000             mov r8d, 1
0x1458d047f: 4889f1                   mov rcx, rsi
0x1458d0482: 4c89f2                   mov rdx, r14
0x1458d0485: e8461d73fa               call 0x1400021d0
0x1458d048a: e971fdffff               jmp 0x1458d0200
0x1458d048f: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x1458d0498: 41b901000000             mov r9d, 1
0x1458d049e: 488d4de0                 lea rcx, [rbp - 0x20]
0x1458d04a2: 4c89e2                   mov rdx, r12
0x1458d04a5: 4989d8                   mov r8, rbx
0x1458d04a8: e8c3a43200               call 0x145bfa970
0x1458d04ad: 90                       nop
0x1458d04ae: 4c8b65f0                 mov r12, qword ptr [rbp - 0x10]
0x1458d04b2: 488b75e8                 mov rsi, qword ptr [rbp - 0x18]
0x1458d04b6: 488b45f8                 mov rax, qword ptr [rbp - 8]
0x1458d04ba: 4939c6                   cmp r14, rax
0x1458d04bd: 0f85cafeffff             jne 0x1458d038d
0x1458d04c3: e9d7feffff               jmp 0x1458d039f
0x1458d04c8: 4883c250                 add rdx, 0x50
0x1458d04cc: 4889d3                   mov rbx, rdx
0x1458d04cf: 0fb61b                   movzx ebx, byte ptr [rbx]
0x1458d04d2: e8291d73fa               call 0x140002200
0x1458d04d7: b906000000               mov ecx, 6
0x1458d04dc: ba01000000               mov edx, 1
0x1458d04e1: e8da1c73fa               call 0x1400021c0
0x1458d04e6: 4885c0                   test rax, rax
0x1458d04e9: 746e                     je 0x1458d0559
0x1458d04eb: 66c740046572             mov word ptr [rax + 4], 0x7265
0x1458d04f1: c70054657374             mov dword ptr [rax], 0x74736554
0x1458d04f7: 488b4dd8                 mov rcx, qword ptr [rbp - 0x28]
0x1458d04fb: 0fb6898c000000           movzx ecx, byte ptr [rcx + 0x8c]
0x1458d0502: 488b55d0                 mov rdx, qword ptr [rbp - 0x30]
0x1458d0506: c6423700                 mov byte ptr [rdx + 0x37], 0
0x1458d050a: c7423300000000           mov dword ptr [rdx + 0x33], 0
0x1458d0511: 48c74218ffffff00         mov qword ptr [rdx + 0x18], 0xffffff
0x1458d0519: 48c70206000000           mov qword ptr [rdx], 6
0x1458d0520: 48894208                 mov qword ptr [rdx + 8], rax
0x1458d0524: 48c7421006000000         mov qword ptr [rdx + 0x10], 6
0x1458d052c: 885a30                   mov byte ptr [rdx + 0x30], bl
0x1458d052f: 884a31                   mov byte ptr [rdx + 0x31], cl
0x1458d0532: c6423200                 mov byte ptr [rdx + 0x32], 0
0x1458d0536: f30f1005e2ab5100         movss xmm0, dword ptr [rip + 0x51abe2]
0x1458d053e: 0f114220                 movups xmmword ptr [rdx + 0x20], xmm0
0x1458d0542: 4889d0                   mov rax, rdx
0x1458d0545: 4881c488000000           add rsp, 0x88
0x1458d054c: 5b                       pop rbx
0x1458d054d: 5f                       pop rdi
0x1458d054e: 5e                       pop rsi
0x1458d054f: 415c                     pop r12
0x1458d0551: 415d                     pop r13
0x1458d0553: 415e                     pop r14
0x1458d0555: 415f                     pop r15
0x1458d0557: 5d                       pop rbp
0x1458d0558: c3                       ret
0x1458d0559: b901000000               mov ecx, 1
0x1458d055e: ba06000000               mov edx, 6
0x1458d0563: e8538d4c00               call 0x145d992bb
0x1458d0568: 0f0b                     ud2
