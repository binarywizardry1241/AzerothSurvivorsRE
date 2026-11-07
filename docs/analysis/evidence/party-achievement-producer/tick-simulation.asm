145b7db98: 4c89e1 mov rcx, r12
145b7db9b: 4889fa mov rdx, rdi
145b7db9e: e8cd900000 call 0x145b86c70
145b7dba3: 90 nop
145b7dba4: ebba jmp 0x145b7db60
145b7dba6: 4c89e1 mov rcx, r12
145b7dba9: e872a60000 call 0x145b88220
145b7dbae: 90 nop
145b7dbaf: 4983bc249809000000 cmp qword ptr [r12 + 0x998], 0
145b7dbb8: 0f8483010000 je 0x145b7dd41
145b7dbbe: 488b4310 mov rax, qword ptr [rbx + 0x10]
145b7dbc2: 48898540090000 mov qword ptr [rbp + 0x940], rax
145b7dbc9: 0f1003 movups xmm0, xmmword ptr [rbx]
145b7dbcc: 0f298530090000 movaps xmmword ptr [rbp + 0x930], xmm0
145b7dbd3: 49c784248809000000000000 mov qword ptr [r12 + 0x988], 0
145b7dbdf: 49c784249009000008000000 mov qword ptr [r12 + 0x990], 8
145b7dbeb: 49c784249809000000000000 mov qword ptr [r12 + 0x998], 0
145b7dbf7: 4869854009000090090000 imul rax, qword ptr [rbp + 0x940], 0x990
145b7dc02: 488b9538090000 mov rdx, qword ptr [rbp + 0x938]
145b7dc09: 4801d0 add rax, rdx
145b7dc0c: 48898588130000 mov qword ptr [rbp + 0x1388], rax
145b7dc13: 31f6 xor esi, esi
145b7dc15: 488dbd40130000 lea rdi, [rbp + 0x1340]
145b7dc1c: 483b9588130000 cmp rdx, qword ptr [rbp + 0x1388]
145b7dc23: 48899590130000 mov qword ptr [rbp + 0x1390], rdx
145b7dc2a: 7471 je 0x145b7dc9d
145b7dc2c: 0f1f4000 nop dword ptr [rax]
145b7dc30: 48ffc6 inc rsi
145b7dc33: 4c89e1 mov rcx, r12
145b7dc36: e805a50200 call 0x145ba8140
145b7dc3b: 4989b424800b0000 mov qword ptr [r12 + 0xb80], rsi
145b7dc43: 498b8c24e0020000 mov rcx, qword ptr [r12 + 0x2e0]
145b7dc4b: 498b9424e8020000 mov rdx, qword ptr [r12 + 0x2e8]
145b7dc53: 4989f8 mov r8, rdi
145b7dc56: 4d89e1 mov r9, r12
145b7dc59: e88263faff call 0x145b23fe0
145b7dc5e: 90 nop
145b7dc5f: 4c89e1 mov rcx, r12
145b7dc62: e8b9a50000 call 0x145b88220
145b7dc67: 90 nop
145b7dc68: 488b9590130000 mov rdx, qword ptr [rbp + 0x1390]
145b7dc6f: 488d9a90090000 lea rbx, [rdx + 0x990]
145b7dc76: 49c78424800b000000000000 mov qword ptr [r12 + 0xb80], 0
145b7dc82: 4c89e1 mov rcx, r12
145b7dc85: e8b6a40200 call 0x145ba8140
