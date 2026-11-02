0x1451c5130: push rbp
0x1451c5131: push r15
0x1451c5133: push r14
0x1451c5135: push r13
0x1451c5137: push r12
0x1451c5139: push rsi
0x1451c513a: push rdi
0x1451c513b: push rbx
0x1451c513c: sub rsp, 0x398
0x1451c5143: lea rbp, [rsp + 0x80]
0x1451c514b: mov qword ptr [rbp + 0x310], 0xfffffffffffffffe
0x1451c5156: mov edi, r9d
0x1451c5159: mov r13, r8
0x1451c515c: mov rbx, rdx
0x1451c515f: mov rsi, rcx
0x1451c5162: mov r14, qword ptr [rbp + 0x398]
0x1451c5169: mov r12d, dword ptr [rbp + 0x388]
0x1451c5170: mov r9, r14
0x1451c5173: shr r9, 0x30
0x1451c5177: and r9d, 1
0x1451c517b: mov byte ptr [rbp + 0x30f], 1
0x1451c5182: mov byte ptr [rbp + 0x30e], 1
0x1451c5189: lea rcx, [rbp - 0x40]
0x1451c518d: mov r8d, r12d
0x1451c5190: call 0x1451c7bb0
0x1451c5195: nop
0x1451c5196: cmp qword ptr [rbp - 0x40], -1
0x1451c519b: je 0x1451c5255
0x1451c51a1: lea r15, [rbp + 0x100]
0x1451c51a8: lea rdx, [rbp - 0x40]
0x1451c51ac: mov r8d, 0x140
0x1451c51b2: mov rcx, r15
0x1451c51b5: call 0x145d145fb
0x1451c51ba: nop
0x1451c51bb: mov rax, qword ptr [rbp + 0x3a0]
0x1451c51c2: mov qword ptr [rsp + 0x28], rax
0x1451c51c7: mov qword ptr [rsp + 0x20], r14
0x1451c51cc: mov qword ptr [rsp + 0x30], 0
0x1451c51d5: lea rcx, [rbp + 0x260]
0x1451c51dc: mov rdx, rbx
0x1451c51df: mov r8, r13
0x1451c51e2: mov r9, r15
0x1451c51e5: call 0x1451c6910
0x1451c51ea: nop
0x1451c51eb: movzx eax, byte ptr [rbp + 0x260]
0x1451c51f2: movzx r14d, byte ptr [rbp + 0x261]
0x1451c51fa: cmp al, 0xff
0x1451c51fc: je 0x1451c534b
0x1451c5202: mov rcx, qword ptr [rbp + 0x2a0]
0x1451c5209: mov qword ptr [rsi + 0x40], rcx
0x1451c520d: movdqu xmm0, xmmword ptr [rbp + 0x262]
0x1451c5215: movdqu xmm1, xmmword ptr [rbp + 0x272]
0x1451c521d: movdqu xmm2, xmmword ptr [rbp + 0x282]
0x1451c5225: movdqu xmm3, xmmword ptr [rbp + 0x292]
0x1451c522d: movdqu xmmword ptr [rsi + 0x32], xmm3
0x1451c5232: movdqu xmmword ptr [rsi + 0x22], xmm2
0x1451c5237: movdqu xmmword ptr [rsi + 0x12], xmm1
0x1451c523c: movdqu xmmword ptr [rsi + 2], xmm0
0x1451c5241: mov byte ptr [rsi], al
0x1451c5243: mov byte ptr [rsi + 1], r14b
0x1451c5247: lea rcx, [rbp - 0x40]
0x1451c524b: call 0x140bd1c90
0x1451c5250: jmp 0x1451c5821
0x1451c5255: mov rax, qword ptr [rbp + 0x390]
0x1451c525c: mov r15, qword ptr [rax]
0x1451c525f: cmp r15, -1
0x1451c5263: je 0x1451c53a1
0x1451c5269: mov byte ptr [rbp + 0x30f], 1
0x1451c5270: mov byte ptr [rbp + 0x30e], 1
0x1451c5277: lea rcx, [rbp + 0x100]
0x1451c527e: mov rdx, qword ptr [rbp + 0x390]
0x1451c5285: call 0x145ce7810
0x1451c528a: nop
0x1451c528b: mov rax, qword ptr [rbp + 0x110]
0x1451c5292: mov qword ptr [rbp + 0x2f0], rax
0x1451c5299: movups xmm0, xmmword ptr [rbp + 0x100]
0x1451c52a0: movaps xmmword ptr [rbp + 0x2e0], xmm0
0x1451c52a7: movdqu xmm0, xmmword ptr [rip + 0x1ac30f9]
0x1451c52af: movdqu xmmword ptr [rbp + 0x2f8], xmm0
0x1451c52b7: mov qword ptr [rbp + 0x260], 0xffffffffffffffff
0x1451c52c2: mov byte ptr [rbp + 0x30f], 1
0x1451c52c9: mov byte ptr [rbp + 0x30e], 1
0x1451c52d0: lea rax, [rbp + 0x260]
0x1451c52d7: mov qword ptr [rsp + 0x20], rax
0x1451c52dc: mov byte ptr [rsp + 0x28], 0
0x1451c52e1: lea rcx, [rbp + 0x100]
0x1451c52e8: lea r9, [rbp + 0x2e0]
0x1451c52ef: mov rdx, rbx
0x1451c52f2: mov r8, r13
0x1451c52f5: call 0x14519b7b0
0x1451c52fa: nop
0x1451c52fb: cmp byte ptr [rbp + 0x100], 0xff
0x1451c5302: je 0x1451c53a1
0x1451c5308: mov rax, qword ptr [rbp + 0x140]
0x1451c530f: mov qword ptr [rsi + 0x40], rax
0x1451c5313: movdqu xmm0, xmmword ptr [rbp + 0x100]
0x1451c531b: movdqu xmm1, xmmword ptr [rbp + 0x110]
0x1451c5323: movdqu xmm2, xmmword ptr [rbp + 0x120]
0x1451c532b: movdqu xmm3, xmmword ptr [rbp + 0x130]
0x1451c5333: movdqu xmmword ptr [rsi + 0x30], xmm3
0x1451c5338: movdqu xmmword ptr [rsi + 0x20], xmm2
0x1451c533d: movdqu xmmword ptr [rsi + 0x10], xmm1
0x1451c5342: movdqu xmmword ptr [rsi], xmm0
0x1451c5346: jmp 0x1451c57c1
0x1451c534b: lea rcx, [rbp - 0x40]
0x1451c534f: call 0x140bd1c90
0x1451c5354: mov r12b, 1
0x1451c5357: mov byte ptr [rbp + 0x30f], 0
0x1451c535e: mov byte ptr [rbp + 0x30e], r12b
0x1451c5365: mov rcx, rbx
0x1451c5368: mov edx, edi
0x1451c536a: mov r8d, dword ptr [rbp + 0x380]
0x1451c5371: call 0x1451a23c0
0x1451c5376: nop
0x1451c5377: mov byte ptr [rsi + 1], r14b
0x1451c537b: mov byte ptr [rsi], 0xff
0x1451c537e: mov rax, qword ptr [rbp + 0x390]
0x1451c5385: mov r15, qword ptr [rax]
0x1451c5388: cmp r15, -1
0x1451c538c: setne al
0x1451c538f: and r12b, al
0x1451c5392: cmp r12b, 1
0x1451c5396: je 0x1451c5831
0x1451c539c: jmp 0x1451c5850
0x1451c53a1: test r12d, r12d
0x1451c53a4: je 0x1451c57d8
0x1451c53aa: mov rcx, qword ptr [rbx]
0x1451c53ad: mov byte ptr [rbp + 0x30f], 1
0x1451c53b4: mov byte ptr [rbp + 0x30e], 1
0x1451c53bb: call 0x1452c4780
0x1451c53c0: nop
0x1451c53c1: mov r13, rax
0x1451c53c4: test rax, rax
0x1451c53c7: je 0x1451c5a3b
0x1451c53cd: mov qword ptr [rbp + 0x100], r13
0x1451c53d4: cmp qword ptr [r13 + 0x10], 0
0x1451c53d9: jne 0x1451c59f0
0x1451c53df: lea rax, [r13 + 0x10]
0x1451c53e3: mov qword ptr [r13 + 0x10], 0xffffffffffffffff
0x1451c53eb: lea rcx, [r13 + 0x18]
0x1451c53ef: mov qword ptr [rbp + 0x2c0], rcx
0x1451c53f6: mov qword ptr [rbp + 0x2c8], rax
0x1451c53fd: lea r15, [rbp + 0x2d0]
0x1451c5404: mov qword ptr [rbp + 0x2d0], r13
0x1451c540b: mov ecx, edi
0x1451c540d: cmp qword ptr [r13 + 0x3ce8], rcx
0x1451c5414: jbe 0x1451c56a5
0x1451c541a: mov rax, qword ptr [r13 + 0x3ce0]
0x1451c5421: imul rcx, rcx, 0x270
0x1451c5428: mov edx, dword ptr [rbp + 0x380]
0x1451c542e: cmp dword ptr [rax + rcx + 0x268], edx
0x1451c5435: jne 0x1451c56a5
0x1451c543b: add rax, rcx
0x1451c543e: cmp qword ptr [rax], -1
0x1451c5442: je 0x1451c56a5
0x1451c5448: movabs rcx, 0x800000000000000b
0x1451c5452: cmp qword ptr [rax + 0x48], rcx
0x1451c5456: jne 0x1451c56a5
0x1451c545c: mov rcx, qword ptr [rax + 0x98]
0x1451c5463: mov rdx, qword ptr [rax + 0x68]
0x1451c5467: mov r8, qword ptr [rax + 0x70]
0x1451c546b: lea r8, [rdx + r8*8]
0x1451c546f: mov r9, qword ptr [rax + 0x80]
0x1451c5476: mov rax, qword ptr [rax + 0x88]
0x1451c547d: lea rax, [r9 + rax*8]
0x1451c5481: mov qword ptr [rbp + 0x260], rdx
0x1451c5488: mov qword ptr [rbp + 0x268], r8
0x1451c548f: mov qword ptr [rbp + 0x270], rcx
0x1451c5496: mov qword ptr [rbp + 0x278], r9
0x1451c549d: mov qword ptr [rbp + 0x280], rax
0x1451c54a4: mov qword ptr [rbp + 0x288], rcx
0x1451c54ab: mov byte ptr [rbp + 0x30d], 1
0x1451c54b2: lea rcx, [rbp + 0x248]
0x1451c54b9: lea rdx, [rbp + 0x260]
0x1451c54c0: call 0x145213c70
0x1451c54c5: nop
0x1451c54c6: mov rax, qword ptr [rbp + 0x248]
0x1451c54cd: mov rcx, qword ptr [rbp + 0x250]
0x1451c54d4: mov rdx, qword ptr [rbp + 0x258]
0x1451c54db: lea rdx, [rcx + rdx*8]
0x1451c54df: add r13, 0x8008
0x1451c54e6: mov qword ptr [rbp + 0x260], rcx
0x1451c54ed: mov qword ptr [rbp + 0x268], rcx
0x1451c54f4: mov qword ptr [rbp + 0x270], rax
0x1451c54fb: mov qword ptr [rbp + 0x278], rdx
0x1451c5502: mov qword ptr [rbp + 0x280], r13
0x1451c5509: lea r13, [rbp + 0x108]
0x1451c5510: mov byte ptr [rbp + 0x30d], 1
0x1451c5517: lea rdx, [rbp + 0x260]
0x1451c551e: mov rcx, r13
0x1451c5521: call 0x145214e10
0x1451c5526: nop
0x1451c5527: movups xmm0, xmmword ptr [r13]
0x1451c552c: movups xmmword ptr [rbp + 0x2e7], xmm0
0x1451c5533: mov rax, qword ptr [r13 + 0x10]
0x1451c5537: mov qword ptr [rbp + 0x2f7], rax
0x1451c553e: mov qword ptr [rbp + 0x110], rax
0x1451c5545: movaps xmmword ptr [rbp + 0x100], xmm0
0x1451c554c: mov r15, qword ptr [rbp + 0x2c0]
0x1451c5553: mov rax, qword ptr [rbp + 0x390]
0x1451c555a: movups xmm0, xmmword ptr [rax]
0x1451c555d: movups xmmword ptr [rbp + 0x118], xmm0
0x1451c5564: mov rax, qword ptr [rax + 0x10]
0x1451c5568: mov qword ptr [rbp + 0x128], rax
0x1451c556f: mov rax, qword ptr [rbp + 0x3a0]
0x1451c5576: movdqu xmm0, xmmword ptr [rax]
0x1451c557a: movdqa xmmword ptr [rbp + 0x130], xmm0
0x1451c5582: mov rax, qword ptr [rax + 0x10]
0x1451c5586: mov qword ptr [rbp + 0x140], rax
0x1451c558d: mov dword ptr [rbp + 0x150], r12d
0x1451c5594: mov qword ptr [rbp + 0x148], r14
0x1451c559b: mov dword ptr [rbp + 0x2e0], edi
0x1451c55a1: mov eax, dword ptr [rbp + 0x380]
0x1451c55a7: mov dword ptr [rbp + 0x2e4], eax
0x1451c55ad: lea r13, [r15 + 0x8a00]
0x1451c55b4: lea rdx, [rbp + 0x2e0]
0x1451c55bb: mov rcx, r13
0x1451c55be: call 0x140f00d90
0x1451c55c3: nop
0x1451c55c4: mov r12, rax
0x1451c55c7: cmp qword ptr [r15 + 0x89f0], 0
0x1451c55cf: je 0x1451c5a06
0x1451c55d5: mov rax, qword ptr [r15 + 0x89e0]
0x1451c55dc: mov rdx, qword ptr [r15 + 0x89e8]
0x1451c55e3: mov rcx, r12
0x1451c55e6: shr rcx, 0x39
0x1451c55ea: movd xmm0, ecx
0x1451c55ee: punpcklbw xmm0, xmm0
0x1451c55f2: pshuflw xmm0, xmm0, 0
0x1451c55f7: pshufd xmm0, xmm0, 0x44
0x1451c55fc: xor r10d, r10d
0x1451c55ff: pcmpeqd xmm1, xmm1
0x1451c5603: xor r9d, r9d
0x1451c5606: and r12, rdx
0x1451c5609: movdqu xmm2, xmmword ptr [rax + r12]
0x1451c560f: movdqa xmm3, xmm2
0x1451c5613: pcmpeqb xmm3, xmm0
0x1451c5617: pmovmskb r11d, xmm3
0x1451c561c: test r11d, r11d
0x1451c561f: je 0x1451c565d
0x1451c5621: tzcnt r14d, r11d
0x1451c5626: add r14, r12
0x1451c5629: and r14, rdx
0x1451c562c: neg r14
0x1451c562f: lea r14, [r14 + r14*2]
0x1451c5633: shl r14, 5
0x1451c5637: cmp edi, dword ptr [rax + r14 - 0x60]
0x1451c563c: jne 0x1451c5650
0x1451c563e: mov r13d, dword ptr [rbp + 0x380]
0x1451c5645: cmp r13d, dword ptr [rax + r14 - 0x5c]
0x1451c564a: je 0x1451c5864
0x1451c5650: lea r14d, [r11 - 1]
0x1451c5654: and r14w, r11w
0x1451c5658: mov r11d, r14d
0x1451c565b: jne 0x1451c5621
0x1451c565d: cmp r10, 1
0x1451c5661: je 0x1451c5678
0x1451c5663: pmovmskb r8d, xmm2
0x1451c5668: test r8d, r8d
0x1451c566b: je 0x1451c5692
0x1451c566d: tzcnt r8d, r8d
0x1451c5672: add r8, r12
0x1451c5675: and r8, rdx
0x1451c5678: pcmpeqb xmm2, xmm1
0x1451c567c: pmovmskb r10d, xmm2
0x1451c5681: test r10d, r10d
0x1451c5684: jne 0x1451c590a
0x1451c568a: mov r10d, 1
0x1451c5690: jmp 0x1451c5695
0x1451c5692: xor r10d, r10d
0x1451c5695: add r12, r9
0x1451c5698: add r12, 0x10
0x1451c569c: add r9, 0x10
0x1451c56a0: jmp 0x1451c5606
0x1451c56a5: call 0x140002200
0x1451c56aa: mov ecx, 0x11
0x1451c56af: mov edx, 1
0x1451c56b4: call 0x1400021c0
0x1451c56b9: test rax, rax
0x1451c56bc: je 0x1451c5a64
0x1451c56c2: movzx ecx, byte ptr [rip + 0x1ac1267]
0x1451c56c9: mov byte ptr [rax + 0x10], cl
0x1451c56cc: movups xmm0, xmmword ptr [rip + 0x1ac124d]
0x1451c56d3: movups xmmword ptr [rax], xmm0
0x1451c56d6: mov qword ptr [rbp + 0x110], rax
0x1451c56dd: mov qword ptr [rbp + 0x118], 0x11
0x1451c56e8: mov qword ptr [rbp + 0x108], 0x11
0x1451c56f3: mov eax, dword ptr [rbp + 0x101]
0x1451c56f9: mov dword ptr [rbp + 0x2e0], eax
0x1451c56ff: movzx eax, word ptr [rbp + 0x105]
0x1451c5706: mov word ptr [rbp + 0x2e4], ax
0x1451c570d: movzx eax, byte ptr [rbp + 0x107]
0x1451c5714: mov byte ptr [rbp + 0x2e6], al
0x1451c571a: mov rax, qword ptr [rbp + 0x108]
0x1451c5721: mov qword ptr [rbp + 0x2e7], rax
0x1451c5728: movzx eax, byte ptr [rbp + 0x110]
0x1451c572f: mov byte ptr [rbp + 0x2ef], al
0x1451c5735: mov rax, qword ptr [rbp + 0x110]
0x1451c573c: mov qword ptr [rbp + 0x2ef], rax
0x1451c5743: mov rax, qword ptr [rbp + 0x118]
0x1451c574a: mov qword ptr [rbp + 0x2f7], rax
0x1451c5751: movzx eax, byte ptr [rbp + 0x2ef]
0x1451c5758: mov byte ptr [rsi + 0x10], al
0x1451c575b: mov eax, dword ptr [rbp + 0x2f0]
0x1451c5761: mov dword ptr [rsi + 0x11], eax
0x1451c5764: movzx eax, word ptr [rbp + 0x2f4]
0x1451c576b: mov word ptr [rsi + 0x15], ax
0x1451c576f: movzx eax, byte ptr [rbp + 0x2f6]
0x1451c5776: mov byte ptr [rsi + 0x17], al
0x1451c5779: mov rax, qword ptr [rbp + 0x2f7]
0x1451c5780: mov qword ptr [rsi + 0x18], rax
0x1451c5784: movdqa xmm0, xmmword ptr [rbp + 0x2e0]
0x1451c578c: movdqu xmmword ptr [rsi + 1], xmm0
0x1451c5791: mov byte ptr [rsi], 1
0x1451c5794: mov rax, qword ptr [rbp + 0x2c8]
0x1451c579b: inc qword ptr [rax]
0x1451c579e: mov rax, qword ptr [rbp + 0x2d0]
0x1451c57a5: dec qword ptr [rax]
0x1451c57a8: jne 0x1451c57c1
0x1451c57aa: mov byte ptr [rbp + 0x30f], 1
0x1451c57b1: mov byte ptr [rbp + 0x30e], 1
0x1451c57b8: mov rcx, r15
0x1451c57bb: call 0x145074f00
0x1451c57c0: nop
0x1451c57c1: mov rax, qword ptr [rbp + 0x3a0]
0x1451c57c8: mov rdx, qword ptr [rax]
0x1451c57cb: cmp rdx, -1
0x1451c57cf: je 0x1451c5821
0x1451c57d1: test rdx, rdx
0x1451c57d4: jne 0x1451c5812
0x1451c57d6: jmp 0x1451c5821
0x1451c57d8: mov byte ptr [rbp + 0x30f], 1
0x1451c57df: mov byte ptr [rbp + 0x30e], 1
0x1451c57e6: mov rcx, rbx
0x1451c57e9: mov edx, edi
0x1451c57eb: mov r8d, dword ptr [rbp + 0x380]
0x1451c57f2: call 0x1451a23c0
0x1451c57f7: nop
0x1451c57f8: mov word ptr [rsi], 0xff
0x1451c57fd: mov rax, qword ptr [rbp + 0x3a0]
0x1451c5804: mov rdx, qword ptr [rax]
0x1451c5807: cmp rdx, -1
0x1451c580b: je 0x1451c582b
0x1451c580d: test rdx, rdx
0x1451c5810: je 0x1451c582b
0x1451c5812: mov rcx, qword ptr [rax + 8]
0x1451c5816: mov r8d, 1
0x1451c581c: call 0x1400021d0
0x1451c5821: mov rax, qword ptr [rbp + 0x390]
0x1451c5828: mov r15, qword ptr [rax]
0x1451c582b: cmp r15, -1
0x1451c582f: je 0x1451c5850
0x1451c5831: test r15, r15
0x1451c5834: je 0x1451c5850
0x1451c5836: mov rax, qword ptr [rbp + 0x390]
0x1451c583d: mov rcx, qword ptr [rax + 8]
0x1451c5841: mov r8d, 1
0x1451c5847: mov rdx, r15
0x1451c584a: call 0x1400021d0
0x1451c584f: nop
0x1451c5850: add rsp, 0x398
0x1451c5857: pop rbx
0x1451c5858: pop rdi
0x1451c5859: pop rsi
0x1451c585a: pop r12
0x1451c585c: pop r13
0x1451c585e: pop r14
0x1451c5860: pop r15
0x1451c5862: pop rbp
0x1451c5863: ret
0x1451c5864: add rax, r14
0x1451c5867: mov rcx, qword ptr [rax - 8]
0x1451c586b: mov qword ptr [rbp + 0x2b0], rcx
0x1451c5872: movups xmm0, xmmword ptr [rax - 0x18]
0x1451c5876: movaps xmmword ptr [rbp + 0x2a0], xmm0
0x1451c587d: movups xmm0, xmmword ptr [rax - 0x58]
0x1451c5881: movups xmm1, xmmword ptr [rax - 0x48]
0x1451c5885: movups xmm2, xmmword ptr [rax - 0x38]
0x1451c5889: movups xmm3, xmmword ptr [rax - 0x28]
0x1451c588d: movaps xmmword ptr [rbp + 0x290], xmm3
0x1451c5894: movaps xmmword ptr [rbp + 0x280], xmm2
0x1451c589b: movaps xmmword ptr [rbp + 0x270], xmm1
0x1451c58a2: movaps xmmword ptr [rbp + 0x260], xmm0
0x1451c58a9: movaps xmm0, xmmword ptr [rbp + 0x100]
0x1451c58b0: movaps xmm1, xmmword ptr [rbp + 0x110]
0x1451c58b7: movaps xmm2, xmmword ptr [rbp + 0x120]
0x1451c58be: movaps xmm3, xmmword ptr [rbp + 0x130]
0x1451c58c5: movups xmmword ptr [rax - 0x58], xmm0
0x1451c58c9: movups xmmword ptr [rax - 0x48], xmm1
0x1451c58cd: movups xmmword ptr [rax - 0x38], xmm2
0x1451c58d1: movups xmmword ptr [rax - 0x28], xmm3
0x1451c58d5: movaps xmm0, xmmword ptr [rbp + 0x140]
0x1451c58dc: movups xmmword ptr [rax - 0x18], xmm0
0x1451c58e0: mov rcx, qword ptr [rbp + 0x150]
0x1451c58e7: mov qword ptr [rax - 8], rcx
0x1451c58eb: cmp qword ptr [rbp + 0x260], -1
0x1451c58f3: je 0x1451c59b4
0x1451c58f9: lea rcx, [rbp + 0x260]
0x1451c5900: call 0x1451ba1a0
0x1451c5905: jmp 0x1451c59b4
0x1451c590a: movzx r9d, byte ptr [rax + r8]
0x1451c590f: test r9b, r9b
0x1451c5912: jns 0x1451c5a23
0x1451c5918: and r9b, 1
0x1451c591c: lea r10, [r8 - 0x10]
0x1451c5920: and r10, rdx
0x1451c5923: mov byte ptr [rax + r8], cl
0x1451c5927: mov byte ptr [rax + r10 + 0x10], cl
0x1451c592c: movzx ecx, r9b
0x1451c5930: movd xmm0, ecx
0x1451c5934: shufpd xmm0, xmmword ptr [rip + 0xd1a5e3], 2
0x1451c593d: movdqu xmm1, xmmword ptr [r15 + 0x89f0]
0x1451c5946: psubq xmm1, xmm0
0x1451c594a: movdqu xmmword ptr [r15 + 0x89f0], xmm1
0x1451c5953: neg r8
0x1451c5956: lea rcx, [r8 + r8*2]
0x1451c595a: shl rcx, 5
0x1451c595e: mov dword ptr [rax + rcx - 0x60], edi
0x1451c5962: mov edx, dword ptr [rbp + 0x380]
0x1451c5968: mov dword ptr [rax + rcx - 0x5c], edx
0x1451c596c: movaps xmm0, xmmword ptr [rbp + 0x100]
0x1451c5973: movaps xmm1, xmmword ptr [rbp + 0x110]
0x1451c597a: movaps xmm2, xmmword ptr [rbp + 0x120]
0x1451c5981: movaps xmm3, xmmword ptr [rbp + 0x130]
0x1451c5988: movups xmmword ptr [rax + rcx - 0x58], xmm0
0x1451c598d: movups xmmword ptr [rax + rcx - 0x48], xmm1
0x1451c5992: movups xmmword ptr [rax + rcx - 0x38], xmm2
0x1451c5997: movups xmmword ptr [rax + rcx - 0x28], xmm3
0x1451c599c: movaps xmm0, xmmword ptr [rbp + 0x140]
0x1451c59a3: movups xmmword ptr [rax + rcx - 0x18], xmm0
0x1451c59a8: mov rdx, qword ptr [rbp + 0x150]
0x1451c59af: mov qword ptr [rax + rcx - 8], rdx
0x1451c59b4: mov rax, qword ptr [rbp + 0x2c8]
0x1451c59bb: inc qword ptr [rax]
0x1451c59be: mov rax, qword ptr [rbp + 0x2d0]
0x1451c59c5: dec qword ptr [rax]
0x1451c59c8: lea rcx, [rbp + 0x2d0]
0x1451c59cf: jne 0x1451c59e5
0x1451c59d1: mov byte ptr [rbp + 0x30f], 0
0x1451c59d8: mov byte ptr [rbp + 0x30e], 0
0x1451c59df: call 0x145074f00
0x1451c59e4: nop
0x1451c59e5: xor r14d, r14d
0x1451c59e8: xor r12d, r12d
0x1451c59eb: jmp 0x1451c5357
0x1451c59f0: mov qword ptr [rbp + 0x2d8], r13
0x1451c59f7: lea rcx, [rip + 0x1ac79ba]
0x1451c59fe: call 0x145eb7200
0x1451c5a03: nop
0x1451c5a04: jmp 0x1451c5a7b
0x1451c5a06: lea rcx, [r15 + 0x89e0]
0x1451c5a0d: mov edx, 1
0x1451c5a12: mov r8, r13
0x1451c5a15: mov r9b, 1
0x1451c5a18: call 0x145e80970
0x1451c5a1d: nop
0x1451c5a1e: jmp 0x1451c55d5
0x1451c5a23: movdqa xmm0, xmmword ptr [rax]
0x1451c5a27: pmovmskb r8d, xmm0
0x1451c5a2c: tzcnt r8d, r8d
0x1451c5a31: movzx r9d, byte ptr [rax + r8]
0x1451c5a36: jmp 0x1451c5918
0x1451c5a3b: mov byte ptr [rbp + 0x30f], 1
0x1451c5a42: mov byte ptr [rbp + 0x30e], 1
0x1451c5a49: lea rcx, [rip + 0x1ac2390]
0x1451c5a50: lea r8, [rip + 0x1ac2991]
0x1451c5a57: mov edx, 0xe
0x1451c5a5c: call 0x145eb7280
0x1451c5a61: nop
0x1451c5a62: jmp 0x1451c5a7b
0x1451c5a64: mov byte ptr [rbp + 0x30d], 1
0x1451c5a6b: mov ecx, 1
0x1451c5a70: mov edx, 0x11
0x1451c5a75: call 0x145eb6fcb
0x1451c5a7a: nop
0x1451c5a7b: ud2
