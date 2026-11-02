0000000145c572f7 4c8bb5e0000000                 mov r14, qword ptr [rbp + 0xe0]
0000000145c572fe 80fb01                         cmp bl, 1
0000000145c57301 0f859a000000                   jne 0x145c573a1
0000000145c57307 48833fff                       cmp qword ptr [rdi], -1
0000000145c5730b 0f8490000000                   je 0x145c573a1
0000000145c57311 48b80300000000000080           movabs rax, 0x8000000000000003
0000000145c5731b 4939c6                         cmp r14, rax
0000000145c5731e 7569                           jne 0x145c57389
0000000145c57320 488b8520030000                 mov rax, qword ptr [rbp + 0x320]
0000000145c57327 8a9840010000                   mov bl, byte ptr [rax + 0x140]
0000000145c5732d c6804101000001                 mov byte ptr [rax + 0x141], 1
0000000145c57334 488b8830010000                 mov rcx, qword ptr [rax + 0x130]
0000000145c5733b 488b8038010000                 mov rax, qword ptr [rax + 0x138]
0000000145c57342 488b4030                       mov rax, qword ptr [rax + 0x30]
0000000145c57346 c6853603000001                 mov byte ptr [rbp + 0x336], 1
0000000145c5734d c6853503000001                 mov byte ptr [rbp + 0x335], 1
0000000145c57354 c6853403000001                 mov byte ptr [rbp + 0x334], 1
0000000145c5735b c6853303000001                 mov byte ptr [rbp + 0x333], 1
0000000145c57362 c6853203000001                 mov byte ptr [rbp + 0x332], 1
0000000145c57369 c6853103000001                 mov byte ptr [rbp + 0x331], 1
0000000145c57370 ffd0                           call rax
0000000145c57372 90                             nop
0000000145c57373 84db                           test bl, bl
0000000145c57375 742a                           je 0x145c573a1
0000000145c57377 488d8de0000000                 lea rcx, [rbp + 0xe0]
0000000145c5737e e86db3ffff                     call 0x145c526f0
0000000145c57383 90                             nop
0000000145c57384 e94b1b0000                     jmp 0x145c58ed4
0000000145c57389 488b8520030000                 mov rax, qword ptr [rbp + 0x320]
0000000145c57390 c6804001000001                 mov byte ptr [rax + 0x140], 1
0000000145c57397 c78028010000ffffffff           mov dword ptr [rax + 0x128], 0xffffffff
