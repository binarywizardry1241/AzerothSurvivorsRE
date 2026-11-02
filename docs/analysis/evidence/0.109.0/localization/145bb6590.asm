; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145bb6590..0x145bb6639 SHA256 9771bc05860639b9fef522400d75ab7b98d9400c340867ecc2fadfd9f7e1cc2a
0x145bb6590: push rbp
0x145bb6591: push rsi
0x145bb6592: push rdi
0x145bb6593: sub rsp, 0x70
0x145bb6597: lea rbp, [rsp + 0x70]
0x145bb659c: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145bb65a4: mov rsi, rdx
0x145bb65a7: mov rdi, rcx
0x145bb65aa: lea rax, [rip + 0x16b2315]
0x145bb65b1: mov qword ptr [rbp - 0x48], rax
0x145bb65b5: mov qword ptr [rbp - 0x40], 6
0x145bb65bd: call 0x145bb6220
0x145bb65c2: test al, al
0x145bb65c4: jne 0x145bb65ed
0x145bb65c6: lea rax, [rip + 0x24d6c0b]
0x145bb65cd: mov qword ptr [rbp - 0x18], rax
0x145bb65d1: lea rax, [rbp - 0x18]
0x145bb65d5: mov qword ptr [rbp - 0x38], rax
0x145bb65d9: lea rcx, [rbp - 0x38]
0x145bb65dd: mov rdx, rdi
0x145bb65e0: mov r8, rsi
0x145bb65e3: call 0x145bc30b0
0x145bb65e8: test rax, rax
0x145bb65eb: jne 0x145bb65f5
0x145bb65ed: add rsp, 0x70
0x145bb65f1: pop rdi
0x145bb65f2: pop rsi
0x145bb65f3: pop rbp
0x145bb65f4: ret
0x145bb65f5: mov qword ptr [rbp - 0x10], rax
0x145bb65f9: lea rax, [rbp - 0x48]
0x145bb65fd: mov qword ptr [rbp - 0x38], rax
0x145bb6601: lea rax, [rip + 0x9918]
0x145bb6608: mov qword ptr [rbp - 0x30], rax
0x145bb660c: lea rax, [rbp - 0x10]
0x145bb6610: mov qword ptr [rbp - 0x28], rax
0x145bb6614: lea rax, [rip + 0x274d5]
0x145bb661b: mov qword ptr [rbp - 0x20], rax
0x145bb661f: lea rcx, [rip + 0x16b054a]
0x145bb6626: lea r8, [rip + 0x16b05ab]
0x145bb662d: lea rdx, [rbp - 0x38]
0x145bb6631: call 0x145d99830
0x145bb6636: nop
0x145bb6637: ud2
