145bdb210: push      rbp
145bdb211: sub       rsp, 0x40
145bdb215: lea       rbp, [rsp + 0x40]
145bdb21a: movzx     ecx, byte ptr [rcx]
145bdb21d: mov       eax, 3
145bdb222: mov       r8d, ecx
145bdb225: cmp       cl, 0xa
145bdb228: jb        0x145bdb25c
145bdb22a: movzx     eax, cl
145bdb22d: lea       r8d, [rax + rax*4]
145bdb231: lea       r8d, [rax + r8*8]
145bdb235: shr       r8d, 0xc
145bdb239: imul      eax, r8d, 0x64
145bdb23d: mov       r9d, ecx
145bdb240: sub       r9b, al
145bdb243: movzx     eax, r9b
145bdb247: lea       r9, [rip + 0x169337c]
145bdb24e: movzx     eax, word ptr [r9 + rax*2]
145bdb253: mov       word ptr [rbp - 2], ax
145bdb257: mov       eax, 1
145bdb25c: test      r8b, r8b
145bdb25f: sete      r9b
145bdb263: test      cl, cl
145bdb265: setne     cl
145bdb268: test      cl, r9b
145bdb26b: jne       0x145bdb285
145bdb26d: movzx     ecx, r8b
145bdb271: lea       r8, [rip + 0x1693352]
145bdb278: movzx     ecx, byte ptr [r8 + rcx*2 + 1]
145bdb27e: mov       byte ptr [rbp + rax - 4], cl
145bdb282: dec       rax
145bdb285: mov       ecx, 3
145bdb28a: sub       rcx, rax
145bdb28d: add       rax, rbp
145bdb290: add       rax, -3
145bdb294: mov       qword ptr [rsp + 0x28], rcx
145bdb299: mov       qword ptr [rsp + 0x20], rax
145bdb29e: mov       r8d, 1
145bdb2a4: mov       rcx, rdx
145bdb2a7: mov       dl, 1
145bdb2a9: xor       r9d, r9d
145bdb2ac: call      0x145bd1dd0
145bdb2b1: nop
145bdb2b2: add       rsp, 0x40
145bdb2b6: pop       rbp
145bdb2b7: ret
