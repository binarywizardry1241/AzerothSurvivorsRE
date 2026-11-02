0x1458ad460: push rbp
0x1458ad461: push rsi
0x1458ad462: sub rsp, 0x68
0x1458ad466: lea rbp, [rsp + 0x60]
0x1458ad46b: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458ad473: mov rsi, rcx
0x1458ad476: lea rcx, [rbp - 0x38]
0x1458ad47a: call 0x145cdaf00
0x1458ad47f: mov rcx, qword ptr [rbp - 0x38]
0x1458ad483: mov rax, qword ptr [rbp - 0x30]
0x1458ad487: test rcx, rcx
0x1458ad48a: je 0x1458ad4ee
0x1458ad48c: mov rdx, qword ptr [rbp - 0x28]
0x1458ad490: cmp rax, qword ptr [rbp - 0x20]
0x1458ad494: je 0x1458ad4a1
0x1458ad496: movzx r9d, word ptr [rax]
0x1458ad49a: cmp r9w, 2
0x1458ad49f: jne 0x1458ad4fe
0x1458ad4a1: mov qword ptr [rbp - 8], rdx
0x1458ad4a5: mov qword ptr [rbp - 0x10], rcx
0x1458ad4a9: lea rdx, [rip + 0x1783098]
0x1458ad4b0: mov r8d, 0xc
0x1458ad4b6: xor ecx, ecx
0x1458ad4b8: call 0x145cb8110
0x1458ad4bd: nop
0x1458ad4be: mov qword ptr [rsi + 8], rax
0x1458ad4c2: mov qword ptr [rsi], 0xffffffffffffffff
0x1458ad4c9: mov rdx, qword ptr [rbp - 8]
0x1458ad4cd: test rdx, rdx
0x1458ad4d0: je 0x1458ad59a
0x1458ad4d6: shl rdx, 5
0x1458ad4da: mov r8d, 4
0x1458ad4e0: mov rcx, qword ptr [rbp - 0x10]
0x1458ad4e4: call 0x1400021d0
0x1458ad4e9: jmp 0x1458ad59a
0x1458ad4ee: mov qword ptr [rsi + 8], rax
0x1458ad4f2: mov qword ptr [rsi], 0xffffffffffffffff
0x1458ad4f9: jmp 0x1458ad59a
0x1458ad4fe: mov r10, qword ptr [rax + 8]
0x1458ad502: movzx r8d, word ptr [rax + 6]
0x1458ad507: mov word ptr [rbp - 0x32], r8w
0x1458ad50c: mov r8d, dword ptr [rax + 2]
0x1458ad510: mov dword ptr [rbp - 0x36], r8d
0x1458ad514: mov word ptr [rbp - 0x38], r9w
0x1458ad519: mov qword ptr [rbp - 0x30], r10
0x1458ad51d: movups xmm0, xmmword ptr [rax + 0x10]
0x1458ad521: movups xmmword ptr [rbp - 0x28], xmm0
0x1458ad525: test rdx, rdx
0x1458ad528: je 0x1458ad539
0x1458ad52a: shl rdx, 5
0x1458ad52e: mov r8d, 4
0x1458ad534: call 0x1400021d0
0x1458ad539: lea rcx, [rbp - 0x38]
0x1458ad53d: mov edx, 5
0x1458ad542: xor r8d, r8d
0x1458ad545: call 0x145cbe620
0x1458ad54a: test al, 1
0x1458ad54c: je 0x1458ad55b
0x1458ad54e: mov qword ptr [rsi + 8], rdx
0x1458ad552: mov qword ptr [rsi], 0xffffffffffffffff
0x1458ad559: jmp 0x1458ad59a
0x1458ad55b: mov qword ptr [rbp - 8], rdx
0x1458ad55f: mov qword ptr [rbp - 0x18], rdx
0x1458ad563: lea rcx, [rbp - 0x18]
0x1458ad567: mov dl, 1
0x1458ad569: call 0x145cbe5a0
0x1458ad56e: nop
0x1458ad56f: test rax, rax
0x1458ad572: jne 0x1458ad585
0x1458ad574: lea rcx, [rbp - 0x18]
0x1458ad578: mov dl, 1
0x1458ad57a: call 0x145cbe6f0
0x1458ad57f: nop
0x1458ad580: test rax, rax
0x1458ad583: je 0x1458ad5a4
0x1458ad585: mov rcx, qword ptr [rbp - 8]
0x1458ad589: mov qword ptr [rsi + 8], rax
0x1458ad58d: mov qword ptr [rsi], 0xffffffffffffffff
0x1458ad594: call qword ptr [rip + 0x60b846]
0x1458ad59a: mov rax, rsi
0x1458ad59d: add rsp, 0x68
0x1458ad5a1: pop rsi
0x1458ad5a2: pop rbp
0x1458ad5a3: ret
0x1458ad5a4: mov qword ptr [rsi], 0
0x1458ad5ab: mov qword ptr [rsi + 8], 1
0x1458ad5b3: xorps xmm0, xmm0
0x1458ad5b6: movups xmmword ptr [rsi + 0x10], xmm0
0x1458ad5ba: mov qword ptr [rsi + 0x20], 1
0x1458ad5c2: mov qword ptr [rsi + 0x28], 0
0x1458ad5ca: mov rax, qword ptr [rbp - 8]
0x1458ad5ce: mov qword ptr [rsi + 0x30], rax
0x1458ad5d2: mov byte ptr [rsi + 0x38], 1
0x1458ad5d6: jmp 0x1458ad59a
