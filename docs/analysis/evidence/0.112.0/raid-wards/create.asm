145916190: 55 push rbp
145916191: 4157 push r15
145916193: 4156 push r14
145916195: 56 push rsi
145916196: 57 push rdi
145916197: 53 push rbx
145916198: 4881ec48020000 sub rsp, 0x248
14591619f: 488dac2480000000 lea rbp, [rsp + 0x80]
1459161a7: 0f29bdb0010000 movaps xmmword ptr [rbp + 0x1b0], xmm7
1459161ae: 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
1459161b5: 48c78598010000feffffff mov qword ptr [rbp + 0x198], 0xfffffffffffffffe
1459161c0: 4c89cb mov rbx, r9
1459161c3: 4889d7 mov rdi, rdx
1459161c6: 4889ce mov rsi, rcx
1459161c9: 4c8bbd20020000 mov r15, qword ptr [rbp + 0x220]
1459161d0: f30f10b528020000 movss xmm6, dword ptr [rbp + 0x228]
1459161d8: 4983f80b cmp r8, 0xb
1459161dc: b80b000000 mov eax, 0xb
1459161e1: 490f42c0 cmovb rax, r8
1459161e5: c1e005 shl eax, 5
1459161e8: 488d0d29ed2d01 lea rcx, [rip + 0x12ded29]
1459161ef: 448b440810 mov r8d, dword ptr [rax + rcx + 0x10]
1459161f4: 448b4c0814 mov r9d, dword ptr [rax + rcx + 0x14]
1459161f9: 8b96780a0000 mov edx, dword ptr [rsi + 0xa78]
1459161ff: ffc2 inc edx
145916201: 8996780a0000 mov dword ptr [rsi + 0xa78], edx
145916207: 4589c2 mov r10d, r8d
14591620a: 4181e2ffffff00 and r10d, 0xffffff
145916211: 49c1e218 shl r10, 0x18
145916215: 81e2ffffff00 and edx, 0xffffff
14591621b: 4c09d2 or rdx, r10
14591621e: 49be00000000000030f1 movabs r14, 0xf130000000000000
145916228: 4909d6 or r14, rdx
14591622b: f30f5f352d704900 maxss xmm6, dword ptr [rip + 0x49702d]
145916233: f30f107c0818 movss xmm7, dword ptr [rax + rcx + 0x18]
145916239: 4c897c2438 mov qword ptr [rsp + 0x38], r15
14591623e: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
145916244: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14591624a: c644243000 mov byte ptr [rsp + 0x30], 0
14591624f: 4889f1 mov rcx, rsi
145916252: 4c89f2 mov rdx, r14
145916255: e816630200 call 0x14593c570
14591625a: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
145916261: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
145916268: e8532bf8ff call 0x145898dc0
14591626d: 4869c0f0000000 imul rax, rax, 0xf0
145916274: 488d0db5c32d01 lea rcx, [rip + 0x12dc3b5]
14591627b: 488b440878 mov rax, qword ptr [rax + rcx + 0x78]
145916280: f30f10864c0a0000 movss xmm0, dword ptr [rsi + 0xa4c]
145916288: f30f105028 movss xmm2, dword ptr [rax + 0x28]
14591628d: f30f105838 movss xmm3, dword ptr [rax + 0x38]
145916292: f30f5915664e4a00 mulss xmm2, dword ptr [rip + 0x4a4e66]
14591629a: f30f5815aa282f01 addss xmm2, dword ptr [rip + 0x12f28aa]
1459162a2: f30f1025ba6f4900 movss xmm4, dword ptr [rip + 0x496fba]
1459162aa: f30f59e3 mulss xmm4, xmm3
1459162ae: 0f57c9 xorps xmm1, xmm1
1459162b1: 0f118d08010000 movups xmmword ptr [rbp + 0x108], xmm1
1459162b8: 0f118df8000000 movups xmmword ptr [rbp + 0xf8], xmm1
1459162bf: 0f118de8000000 movups xmmword ptr [rbp + 0xe8], xmm1
1459162c6: 0f118dd8000000 movups xmmword ptr [rbp + 0xd8], xmm1
1459162cd: 4c89b5b0000000 mov qword ptr [rbp + 0xb0], r14
1459162d4: 48c745d8ffffffff mov qword ptr [rbp - 0x28], 0xffffffffffffffff
1459162dc: f30f119d28010000 movss dword ptr [rbp + 0x128], xmm3
1459162e4: f30f11952c010000 movss dword ptr [rbp + 0x12c], xmm2
1459162ec: 418b4708 mov eax, dword ptr [r15 + 8]
1459162f0: 89853c010000 mov dword ptr [rbp + 0x13c], eax
1459162f6: 498b07 mov rax, qword ptr [r15]
1459162f9: 48898534010000 mov qword ptr [rbp + 0x134], rax
145916300: 498b07 mov rax, qword ptr [r15]
145916303: 48898540010000 mov qword ptr [rbp + 0x140], rax
14591630a: 418b4708 mov eax, dword ptr [r15 + 8]
14591630e: 898548010000 mov dword ptr [rbp + 0x148], eax
145916314: f30f11854c010000 movss dword ptr [rbp + 0x14c], xmm0
14591631c: c7855001000000000000 mov dword ptr [rbp + 0x150], 0
145916326: f30f118554010000 movss dword ptr [rbp + 0x154], xmm0
14591632e: f30f11a558010000 movss dword ptr [rbp + 0x158], xmm4
145916336: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
14591633e: 0f118dc0000000 movups xmmword ptr [rbp + 0xc0], xmm1
145916345: 48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
145916350: 0f118d5c010000 movups xmmword ptr [rbp + 0x15c], xmm1
145916357: 0f118d6c010000 movups xmmword ptr [rbp + 0x16c], xmm1
14591635e: 48c745c808000000 mov qword ptr [rbp - 0x38], 8
145916366: 48c745d000000000 mov qword ptr [rbp - 0x30], 0
14591636e: c7857c01000000000000 mov dword ptr [rbp + 0x17c], 0
145916378: c7457000000000 mov dword ptr [rbp + 0x70], 0
14591637f: c7457800000000 mov dword ptr [rbp + 0x78], 0
145916386: 48c74518ffffffff mov qword ptr [rbp + 0x18], 0xffffffffffffffff
14591638e: c7858000000000000000 mov dword ptr [rbp + 0x80], 0
145916398: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
1459163a3: 0f118d80010000 movups xmmword ptr [rbp + 0x180], xmm1
1459163aa: c6859001000000 mov byte ptr [rbp + 0x190], 0
1459163b1: f30f11b518010000 movss dword ptr [rbp + 0x118], xmm6
1459163b9: f30f11b51c010000 movss dword ptr [rbp + 0x11c], xmm6
1459163c1: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
1459163cc: f30f11bd30010000 movss dword ptr [rbp + 0x130], xmm7
1459163d4: 0f100b movups xmm1, xmmword ptr [rbx]
1459163d7: 0f118d90000000 movups xmmword ptr [rbp + 0x90], xmm1
1459163de: 4889bda0000000 mov qword ptr [rbp + 0xa0], rdi
1459163e5: f30f108d30020000 movss xmm1, dword ptr [rbp + 0x230]
1459163ed: 0f2815dcaf4900 movaps xmm2, xmmword ptr [rip + 0x49afdc]
1459163f4: f30f10d1 movss xmm2, xmm1
1459163f8: f30f12c0 movsldup xmm0, xmm0
1459163fc: 0f58c2 addps xmm0, xmm2
1459163ff: 0f1385a8000000 movlps qword ptr [rbp + 0xa8], xmm0
145916406: 488bbe70050000 mov rdi, qword ptr [rsi + 0x570]
14591640d: 483bbe60050000 cmp rdi, qword ptr [rsi + 0x560]
145916414: 750d jne 0x145916423
145916416: 488d8e60050000 lea rcx, [rsi + 0x560]
14591641d: e83e6d4700 call 0x145d8d160
145916422: 90 nop
145916423: 4869cfd8010000 imul rcx, rdi, 0x1d8
14591642a: 48038e68050000 add rcx, qword ptr [rsi + 0x568]
145916431: 488d55c0 lea rdx, [rbp - 0x40]
145916435: 41b8d8010000 mov r8d, 0x1d8
14591643b: e89b3f2f00 call 0x145c0a3db
145916440: 48ffc7 inc rdi
145916443: 4889be70050000 mov qword ptr [rsi + 0x570], rdi
14591644a: 0f28b5a0010000 movaps xmm6, xmmword ptr [rbp + 0x1a0]
145916451: 0f28bdb0010000 movaps xmm7, xmmword ptr [rbp + 0x1b0]
145916458: 4881c448020000 add rsp, 0x248
14591645f: 5b pop rbx
145916460: 5f pop rdi
145916461: 5e pop rsi
145916462: 415e pop r14
145916464: 415f pop r15
145916466: 5d pop rbp
145916467: c3 ret
