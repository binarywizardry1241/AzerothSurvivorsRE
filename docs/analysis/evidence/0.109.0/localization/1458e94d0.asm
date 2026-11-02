; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458e94d0..0x1458e969e SHA256 39171e12d49d85d40a8a17bf9d79d250dd7c56972b98a03baccdec1cbf7571ef
0x1458e94d0: push rbp
0x1458e94d1: push r14
0x1458e94d3: push rsi
0x1458e94d4: push rdi
0x1458e94d5: push rbx
0x1458e94d6: sub rsp, 0xa0
0x1458e94dd: lea rbp, [rsp + 0x80]
0x1458e94e5: mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
0x1458e94ed: mov rsi, rcx
0x1458e94f0: mov r14, qword ptr [rdx + 8]
0x1458e94f4: mov rdi, qword ptr [rdx + 0x10]
0x1458e94f8: cmp rdi, r14
0x1458e94fb: jae 0x1458e951c
0x1458e94fd: mov rbx, qword ptr [rdx]
0x1458e9500: movzx eax, byte ptr [rbx + rdi]
0x1458e9504: inc rdi
0x1458e9507: mov qword ptr [rdx + 0x10], rdi
0x1458e950b: cmp al, r8b
0x1458e950e: jne 0x1458e9526
0x1458e9510: mov qword ptr [rsi], 0xffffffffffffffff
0x1458e9517: jmp 0x1458e9690
0x1458e951c: inc rdi
0x1458e951f: mov qword ptr [rdx + 0x10], rdi
0x1458e9523: mov rbx, qword ptr [rdx]
0x1458e9526: movzx eax, r8b
0x1458e952a: mov dword ptr [rbp - 0x30], eax
0x1458e952d: lea rax, [rbp - 0x30]
0x1458e9531: mov qword ptr [rbp - 0x18], rax
0x1458e9535: lea rax, [rip + 0x2f6fc4]
0x1458e953c: mov qword ptr [rbp - 0x10], rax
0x1458e9540: lea rdx, [rip + 0x1308194]
0x1458e9547: lea rcx, [rbp - 0x48]
0x1458e954b: lea r8, [rbp - 0x18]
0x1458e954f: call 0x145bcce30
0x1458e9554: mov rcx, qword ptr [rbp - 0x40]
0x1458e9558: mov rax, qword ptr [rbp - 0x38]
0x1458e955c: mov qword ptr [rbp - 0x58], rcx
0x1458e9560: mov qword ptr [rbp - 0x50], rax
0x1458e9564: cmp r14, rdi
0x1458e9567: cmovb rdi, r14
0x1458e956b: test rdi, rdi
0x1458e956e: mov qword ptr [rbp + 0x10], rcx
0x1458e9572: je 0x1458e9583
0x1458e9574: cmp rdi, 4
0x1458e9578: jae 0x1458e958a
0x1458e957a: xor eax, eax
0x1458e957c: xor ecx, ecx
0x1458e957e: jmp 0x1458e9612
0x1458e9583: xor ecx, ecx
0x1458e9585: jmp 0x1458e9626
0x1458e958a: mov rax, rdi
0x1458e958d: and rax, 0xfffffffffffffffc
0x1458e9591: pxor xmm0, xmm0
0x1458e9595: xor ecx, ecx
0x1458e9597: movdqa xmm1, xmmword ptr [rip + 0x7782d1]
0x1458e959f: movdqa xmm3, xmmword ptr [rip + 0x4b3eb9]
0x1458e95a7: pxor xmm2, xmm2
0x1458e95ab: nop dword ptr [rax + rax]
0x1458e95b0: movzx edx, word ptr [rbx + rcx]
0x1458e95b4: movd xmm4, edx
0x1458e95b8: movzx edx, word ptr [rbx + rcx + 2]
0x1458e95bd: movd xmm5, edx
0x1458e95c1: pcmpeqb xmm4, xmm1
0x1458e95c5: punpcklbw xmm4, xmm4
0x1458e95c9: pshuflw xmm4, xmm4, 0xd4
0x1458e95ce: pshufd xmm4, xmm4, 0xd4
0x1458e95d3: pand xmm4, xmm3
0x1458e95d7: paddq xmm2, xmm4
0x1458e95db: pcmpeqb xmm5, xmm1
0x1458e95df: punpcklbw xmm5, xmm5
0x1458e95e3: pshuflw xmm4, xmm5, 0xd4
0x1458e95e8: pshufd xmm4, xmm4, 0xd4
0x1458e95ed: pand xmm4, xmm3
0x1458e95f1: paddq xmm0, xmm4
0x1458e95f5: add rcx, 4
0x1458e95f9: cmp rax, rcx
0x1458e95fc: jne 0x1458e95b0
0x1458e95fe: paddq xmm0, xmm2
0x1458e9602: pshufd xmm1, xmm0, 0xee
0x1458e9607: paddq xmm1, xmm0
0x1458e960b: movq rcx, xmm1
0x1458e9610: jmp 0x1458e9621
0x1458e9612: xor edx, edx
0x1458e9614: cmp byte ptr [rbx + rax], 0xa
0x1458e9618: sete dl
0x1458e961b: add rcx, rdx
0x1458e961e: inc rax
0x1458e9621: cmp rdi, rax
0x1458e9624: jne 0x1458e9612
0x1458e9626: inc rcx
0x1458e9629: mov qword ptr [rbp + 8], rcx
0x1458e962d: lea rax, [rbp + 8]
0x1458e9631: mov qword ptr [rbp - 0x18], rax
0x1458e9635: lea rax, [rip + 0x2f6194]
0x1458e963c: mov qword ptr [rbp - 0x10], rax
0x1458e9640: lea rax, [rbp - 0x58]
0x1458e9644: mov qword ptr [rbp - 8], rax
0x1458e9648: lea rax, [rip - 0x58e758f]
0x1458e964f: mov qword ptr [rbp], rax
0x1458e9653: lea rdx, [rip + 0x1308075]
0x1458e965a: lea rcx, [rbp - 0x30]
0x1458e965e: lea r8, [rbp - 0x18]
0x1458e9662: call 0x145bcce30
0x1458e9667: nop
0x1458e9668: mov rax, qword ptr [rbp - 0x20]
0x1458e966c: mov qword ptr [rsi + 0x10], rax
0x1458e9670: movups xmm0, xmmword ptr [rbp - 0x30]
0x1458e9674: movups xmmword ptr [rsi], xmm0
0x1458e9677: mov rdx, qword ptr [rbp - 0x48]
0x1458e967b: test rdx, rdx
0x1458e967e: je 0x1458e9690
0x1458e9680: mov r8d, 1
0x1458e9686: mov rcx, qword ptr [rbp + 0x10]
0x1458e968a: call 0x1400021d0
0x1458e968f: nop
0x1458e9690: add rsp, 0xa0
0x1458e9697: pop rbx
0x1458e9698: pop rdi
0x1458e9699: pop rsi
0x1458e969a: pop r14
0x1458e969c: pop rbp
0x1458e969d: ret
