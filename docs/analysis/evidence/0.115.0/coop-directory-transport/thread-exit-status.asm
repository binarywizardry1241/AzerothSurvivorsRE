0x1458b1940: push rbp
0x1458b1941: push rsi
0x1458b1942: sub rsp, 0x48
0x1458b1946: lea rbp, [rsp + 0x40]
0x1458b194b: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458b1953: mov r8, rcx
0x1458b1956: mov rcx, qword ptr [rcx + 0x28]
0x1458b195a: mov rdx, qword ptr [r8 + 0x30]
0x1458b195e: lea r9, [r8 + 0x10]
0x1458b1962: mov rsi, qword ptr [r8 + 0x38]
0x1458b1966: add rsi, 0x10
0x1458b196a: mov rax, qword ptr [r8 + 0x40]
0x1458b196e: add rax, 0x10
0x1458b1972: mov qword ptr [rsp + 0x28], rax
0x1458b1977: mov qword ptr [rsp + 0x20], rsi
0x1458b197c: mov qword ptr [rbp - 8], r8
0x1458b1980: call 0x14586a9c0
0x1458b1985: nop
0x1458b1986: mov al, 2
0x1458b1988: xchg byte ptr [rsi], al
0x1458b198a: mov rcx, qword ptr [rbp - 8]
0x1458b198e: call 0x1458afc50
0x1458b1993: nop
0x1458b1994: add rsp, 0x48
0x1458b1998: pop rsi
0x1458b1999: pop rbp
0x1458b199a: ret
