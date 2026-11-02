0x145871650: push rbp
0x145871651: push rsi
0x145871652: sub rsp, 0x38
0x145871656: lea rbp, [rsp + 0x30]
0x14587165b: mov qword ptr [rbp], 0xfffffffffffffffe
0x145871663: mov qword ptr [rbp - 8], rcx
0x145871667: mov rax, qword ptr [rcx + 0x128]
0x14587166e: lock dec qword ptr [rax]
0x145871672: jne 0x145871685
0x145871674: mov rax, qword ptr [rbp - 8]
0x145871678: lea rcx, [rax + 0x128]
0x14587167f: call 0x1458209d0
0x145871684: nop
0x145871685: mov rsi, qword ptr [rbp - 8]
0x145871689: mov rdx, qword ptr [rsi]
0x14587168c: test rdx, rdx
0x14587168f: je 0x1458716a0
0x145871691: mov rcx, qword ptr [rsi + 8]
0x145871695: mov r8d, 1
0x14587169b: call 0x1400021d0
0x1458716a0: mov rdx, qword ptr [rsi + 0x30]
0x1458716a4: cmp rdx, -1
0x1458716a8: je 0x1458716be
0x1458716aa: test rdx, rdx
0x1458716ad: je 0x1458716be
0x1458716af: mov rcx, qword ptr [rsi + 0x38]
0x1458716b3: mov r8d, 1
0x1458716b9: call 0x1400021d0
0x1458716be: mov rdx, qword ptr [rsi + 0x48]
0x1458716c2: cmp rdx, -1
0x1458716c6: je 0x14587170f
0x1458716c8: test rdx, rdx
0x1458716cb: je 0x1458716dc
0x1458716cd: mov rcx, qword ptr [rsi + 0x50]
0x1458716d1: mov r8d, 1
0x1458716d7: call 0x1400021d0
0x1458716dc: mov rdx, qword ptr [rsi + 0x60]
0x1458716e0: test rdx, rdx
0x1458716e3: je 0x1458716f4
0x1458716e5: mov rcx, qword ptr [rsi + 0x68]
0x1458716e9: mov r8d, 1
0x1458716ef: call 0x1400021d0
0x1458716f4: mov rdx, qword ptr [rsi + 0x78]
0x1458716f8: test rdx, rdx
0x1458716fb: je 0x14587170f
0x1458716fd: mov rcx, qword ptr [rsi + 0x80]
0x145871704: mov r8d, 1
0x14587170a: call 0x1400021d0
0x14587170f: mov rdx, qword ptr [rsi + 0x18]
0x145871713: test rdx, rdx
0x145871716: je 0x145871727
0x145871718: mov rcx, qword ptr [rsi + 0x20]
0x14587171c: mov r8d, 1
0x145871722: call 0x1400021d0
0x145871727: mov rdx, qword ptr [rsi + 0x98]
0x14587172e: cmp rdx, -1
0x145871732: je 0x1458717a5
0x145871734: test rdx, rdx
0x145871737: je 0x14587174b
0x145871739: mov rcx, qword ptr [rsi + 0xa0]
0x145871740: mov r8d, 1
0x145871746: call 0x1400021d0
0x14587174b: mov rdx, qword ptr [rsi + 0xb0]
0x145871752: test rdx, rdx
0x145871755: je 0x145871769
0x145871757: mov rcx, qword ptr [rsi + 0xb8]
0x14587175e: mov r8d, 1
0x145871764: call 0x1400021d0
0x145871769: mov rdx, qword ptr [rsi + 0xc8]
0x145871770: test rdx, rdx
0x145871773: je 0x145871787
0x145871775: mov rcx, qword ptr [rsi + 0xd0]
0x14587177c: mov r8d, 1
0x145871782: call 0x1400021d0
0x145871787: mov rdx, qword ptr [rsi + 0xe0]
0x14587178e: test rdx, rdx
0x145871791: je 0x1458717a5
0x145871793: mov rcx, qword ptr [rsi + 0xe8]
0x14587179a: mov r8d, 1
0x1458717a0: call 0x1400021d0
0x1458717a5: mov rdx, qword ptr [rsi + 0x110]
0x1458717ac: cmp rdx, -1
0x1458717b0: je 0x1458717cf
0x1458717b2: test rdx, rdx
0x1458717b5: je 0x1458717cf
0x1458717b7: mov rcx, qword ptr [rsi + 0x118]
0x1458717be: mov r8d, 1
0x1458717c4: add rsp, 0x38
0x1458717c8: pop rsi
0x1458717c9: pop rbp
0x1458717ca: jmp 0x1400021d0
0x1458717cf: add rsp, 0x38
0x1458717d3: pop rsi
0x1458717d4: pop rbp
0x1458717d5: ret
