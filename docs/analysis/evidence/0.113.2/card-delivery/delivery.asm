1400dd4a0: push rbp
1400dd4a1: push rsi
1400dd4a2: push rdi
1400dd4a3: push rbx
1400dd4a4: sub rsp, 0x48
1400dd4a8: lea rbp, [rsp + 0x40]
1400dd4ad: mov qword ptr [rbp], 0xfffffffffffffffe
1400dd4b5: mov qword ptr [rbp - 0x10], rdx
1400dd4b9: mov byte ptr [rbp - 1], 1
1400dd4bd: call 0x140cf3150
1400dd4c2: nop
1400dd4c3: mov ebx, edx
1400dd4c5: mov rsi, qword ptr [rax + 0x38]
1400dd4c9: cmp rsi, qword ptr [rax + 0x28]
1400dd4cd: mov qword ptr [rbp - 0x18], rax
1400dd4d1: jne 0x1400dd4e8
1400dd4d3: mov eax, ebx
1400dd4d5: and al, 1
1400dd4d7: mov byte ptr [rbp - 2], al
1400dd4da: mov rcx, qword ptr [rbp - 0x18]
1400dd4de: add rcx, 0x28
1400dd4e2: call 0x145cfebb0
1400dd4e7: nop
1400dd4e8: imul rcx, rsi, 0xe8
1400dd4ef: mov rdi, qword ptr [rbp - 0x18]
1400dd4f3: add rcx, qword ptr [rdi + 0x30]
1400dd4f7: mov r8d, 0xe8
1400dd4fd: mov rdx, qword ptr [rbp - 0x10]
1400dd501: call 0x145cf998b
1400dd506: inc rsi
1400dd509: mov qword ptr [rdi + 0x38], rsi
1400dd50d: test bl, 1
1400dd510: mov rsi, rdi
1400dd513: jne 0x1400dd527
1400dd515: mov rax, qword ptr [rip + 0x810d4dc]
1400dd51c: mov rax, qword ptr [rax]
1400dd51f: shl rax, 1
1400dd522: test rax, rax
1400dd525: jne 0x1400dd547
1400dd527: xor eax, eax
1400dd529: xchg byte ptr [rsi], al
1400dd52b: cmp al, 2
1400dd52d: je 0x1400dd538
1400dd52f: add rsp, 0x48
1400dd533: pop rbx
1400dd534: pop rdi
1400dd535: pop rsi
1400dd536: pop rbp
1400dd537: ret
1400dd538: mov byte ptr [rbp - 1], 0
1400dd53c: mov rcx, rsi
1400dd53f: call 0x145e9a4f0
1400dd544: nop
1400dd545: jmp 0x1400dd52f
1400dd547: mov byte ptr [rbp - 1], 0
1400dd54b: call 0x145e9b1c0
1400dd550: nop
1400dd551: test al, al
1400dd553: jne 0x1400dd527
1400dd555: mov byte ptr [rsi + 1], 1
1400dd559: jmp 0x1400dd527
14586b5f5: mov rdx, qword ptr [r14 + 0x1668]
14586b5fc: mov rax, qword ptr [r14 + 0x1670]
14586b603: lea rcx, [rbp + 0x7d0]
14586b60a: call qword ptr [rax + 0x28]
14586b60d: mov rax, qword ptr [rbp + 0x7d0]
14586b614: mov rdx, qword ptr [rbp + 0x7d8]
14586b61b: imul rdi, qword ptr [rbp + 0x7e0], 0xe8
14586b626: add rdi, rdx
14586b629: mov qword ptr [rbp + 0xe80], rdx
14586b630: mov qword ptr [rbp + 0xe88], rdx
14586b637: mov qword ptr [rbp + 0xf38], rax
14586b63e: mov qword ptr [rbp + 0xe90], rax
14586b645: mov qword ptr [rbp + 0xe98], rdi
14586b64c: lea r12, [rbp + 0x18c]
14586b653: lea rax, [r14 + 0x1510]
14586b65a: mov qword ptr [rbp + 0xf78], rax
14586b661: lea rax, [r14 + 0x10]
14586b665: mov qword ptr [rbp + 0xf68], rax
14586b66c: lea rax, [r14 + 0x1630]
14586b673: mov qword ptr [rbp + 0xf40], rax
14586b67a: lea rax, [r14 + 0x1550]
14586b681: mov qword ptr [rbp + 0xef0], rax
14586b688: lea r13, [rbp + 0x188]
14586b68f: mov qword ptr [rbp + 0xf20], rdx
14586b696: jmp 0x14586b6ab
14586b698: nop dword ptr [rax + rax]
14586b6a0: mov rcx, r13
14586b6a3: call 0x145860920
14586b6a8: mov rdx, r15
14586b6ab: cmp rdx, rdi
14586b6ae: je 0x14586c25b
14586b6b4: lea r15, [rdx + 0xe8]
14586b6bb: mov qword ptr [rbp + 0xe88], r15
14586b6c2: mov esi, dword ptr [rdx]
14586b6c4: cmp esi, -1
14586b6c7: je 0x14586c25e
14586b6cd: add rdx, 4
14586b6d1: mov dword ptr [rbp + 0x188], esi
14586b6d7: mov r8d, 0xe4
14586b6dd: mov rcx, r12
14586b6e0: call 0x145cf998b
14586b6e5: mov byte ptr [rbp + 0xf56], 1
14586b6ec: mov rcx, qword ptr [rbp + 0xfa0]
14586b6f3: mov rdx, r13
14586b6f6: call 0x1458849b0
14586b6fb: nop
14586b6fc: test al, al
14586b6fe: jne 0x14586b6a0
14586b700: sub esi, 2
14586b703: mov eax, 0xb
14586b708: cmovb esi, eax
14586b70b: lea eax, [rsi - 0x12]
14586b70e: cmp eax, 5
14586b711: jae 0x14586b7e0
14586b7e0: cmp esi, 0x1a
14586b7e3: ja 0x14586bda0
14586b7e9: mov eax, 0x5803e00
14586b7ee: bt eax, esi
14586b7f1: jae 0x14586bda0
14586bda0: mov byte ptr [rbp + 0xf56], 0
14586bda7: mov rcx, qword ptr [rbp + 0xfa0]
14586bdae: mov rdx, r13
14586bdb1: call 0x14587df60
14586bdb6: nop
14586bdb7: mov rdx, r15
14586bdba: jmp 0x14586b6ab
14587df8c: mov qword ptr [rbp + 0x2520], rdx
14587df93: mov eax, dword ptr [rdx]
14587df95: sub eax, 2
14587df98: mov edx, 0xb
14587df9d: cmovae edx, eax
14587dfa0: mov rsi, rcx
14587dfa3: lea rax, [rip + 0x179a67e]
14587dfaa: mov qword ptr [rbp + 0x2508], rdx
14587dfb1: movsxd rcx, dword ptr [rax + rdx*4]
14587dfb5: add rcx, rax
14587dfb8: jmp rcx
14587e30c: cmp dword ptr [rsi + 0x10], 2
14587e310: je 0x14587dfba
14587e316: add rsi, 0x10
14587e31a: mov rax, qword ptr [rbp + 0x2520]
14587e321: mov rdx, qword ptr [rax + 8]
14587e325: mov rcx, rsi
14587e328: call 0x14596f110
14587e32d: nop
14587e32e: jmp 0x14587dfba
14587e42e: cmp dword ptr [rsi + 0x10], 2
14587e432: je 0x14587dfba
14587e438: add rsi, 0x10
14587e43c: mov rcx, rsi
14587e43f: call 0x1459729a0
14587e444: nop
14587e445: jmp 0x14587dfba
14596f15c: cmp byte ptr [rcx + 0xc12], 2
14596f163: jne 0x145971254
14596f169: cmp rdx, qword ptr [rcx + 0x660]
14596f170: jae 0x145971254
14596f176: movzx eax, byte ptr [rcx + 0xc10]
14596f17d: mov byte ptr [rbp + 0x29f], al
14596f183: cmp al, 0xff
14596f185: je 0x145971254
14597116b: mov rcx, r12
14597116e: call 0x1458fe070
145971173: nop
145971174: mov rcx, qword ptr [rbp + 0x2a8]
14597117b: movzx edx, byte ptr [rbp + 0x29f]
145971182: call 0x145966b20
1459729a0: push rsi
1459729a1: push rbx
1459729a2: sub rsp, 0x28
1459729a6: cmp byte ptr [rcx + 0xc12], 2
1459729ad: jne 0x145972a87
