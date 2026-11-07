0x145920470: push r14
0x145920472: push rsi
0x145920473: push rdi
0x145920474: push rbx
0x145920475: sub rsp, 0x38
0x145920479: movaps xmmword ptr [rsp + 0x20], xmm6
0x14592047e: mov edi, edx
0x145920480: mov rsi, rcx
0x145920483: movss xmm6, dword ptr [rip + 0x5bfa25]
0x14592048b: cmp byte ptr [rcx + 0xc41], 0
0x145920492: je 0x14592054b
0x145920498: mov rbx, qword ptr [rsi + 0x9b8]
0x14592049f: mov r14, qword ptr [rsi + 0xb40]
0x1459204a6: cmp rbx, qword ptr [rsi + 0x9a8]
0x1459204ad: jne 0x1459204bb
0x1459204af: lea rcx, [rsi + 0x9a8]
0x1459204b6: call 0x145d151d0
0x1459204bb: mov rax, qword ptr [rsi + 0x9b0]
0x1459204c2: mov rcx, rbx
0x1459204c5: shl rcx, 4
0x1459204c9: mov qword ptr [rax + rcx], r14
0x1459204cd: mov dword ptr [rax + rcx + 8], edi
0x1459204d1: inc rbx
0x1459204d4: mov qword ptr [rsi + 0x9b8], rbx
0x1459204db: cmp byte ptr [rsi + 0xc41], 1
0x1459204e2: jne 0x14592054b
0x1459204e4: mov rcx, qword ptr [rsi + 0x2a8]
0x1459204eb: mov rdx, qword ptr [rsi + 0x2b0]
0x1459204f2: call 0x1458095e0
0x1459204f7: xor ecx, ecx
0x1459204f9: cmp eax, 3
0x1459204fc: setb cl
0x1459204ff: mov rax, qword ptr [rsi + 0xb50]
0x145920506: dec rax
0x145920509: js 0x145920512
0x14592050b: cvtsi2ss xmm0, rax
0x145920510: jmp 0x145920527
0x145920512: mov rdx, rax
0x145920515: shr rdx, 1
0x145920518: and eax, 1
0x14592051b: or rax, rdx
0x14592051e: cvtsi2ss xmm0, rax
0x145920523: addss xmm0, xmm0
0x145920527: lea rax, [rip + 0x171c5a2]
0x14592052e: mulss xmm0, dword ptr [rax + rcx*4]
0x145920533: mulss xmm0, dword ptr [rip + 0x5bfe3d]
0x14592053b: movss xmm6, dword ptr [rip + 0x5bf96d]
0x145920543: addss xmm0, xmm6
0x145920547: divss xmm6, xmm0
0x14592054b: mov eax, edi
0x14592054d: xorps xmm0, xmm0
0x145920550: cvtsi2ss xmm0, rax
0x145920555: mulss xmm0, dword ptr [rsi + 0x4c0]
0x14592055d: mulss xmm0, xmm6
0x145920561: call 0x145d1463d
0x145920566: cvttss2si rax, xmm0
0x14592056b: xor ecx, ecx
0x14592056d: xorps xmm1, xmm1
0x145920570: ucomiss xmm0, xmm1
0x145920573: cmovae ecx, eax
0x145920576: ucomiss xmm0, dword ptr [rip + 0x5e0637]
0x14592057d: mov eax, 0xffffffff
0x145920582: cmovbe eax, ecx
0x145920585: mov ecx, dword ptr [rsi + 0x500]
0x14592058b: add ecx, eax
0x14592058d: mov dword ptr [rsi + 0x500], ecx
0x145920593: add dword ptr [rsi + 0x7ac], eax
0x145920599: imul r8d, ecx, 0x2710
0x1459205a0: add rsi, 0xb20
0x1459205a7: mov rcx, rsi
0x1459205aa: mov dx, 0x498
0x1459205ae: movaps xmm6, xmmword ptr [rsp + 0x20]
0x1459205b3: add rsp, 0x38
0x1459205b7: pop rbx
0x1459205b8: pop rdi
0x1459205b9: pop rsi
0x1459205ba: pop r14
0x1459205bc: jmp 0x1458092f0
