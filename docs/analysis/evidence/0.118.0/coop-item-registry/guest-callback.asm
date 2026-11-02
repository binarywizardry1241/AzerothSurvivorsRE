145afd050: 55 push rbp
145afd051: 56 push rsi
145afd052: 4883ec48 sub rsp, 0x48
145afd056: 488d6c2440 lea rbp, [rsp + 0x40]
145afd05b: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145afd063: 4939d0 cmp r8, rdx
145afd066: 4c894df8 mov qword ptr [rbp - 8], r9
145afd06a: 0f8389000000 jae 0x145afd0f9
145afd070: 4889ce mov rsi, rcx
145afd073: 4969c0b0000000 imul rax, r8, 0xb0
145afd07a: 4801c6 add rsi, rax
145afd07d: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
145afd085: 48c745e801000000 mov qword ptr [rbp - 0x18], 1
145afd08d: 48c745f000000000 mov qword ptr [rbp - 0x10], 0
145afd095: 4c8d45e0 lea r8, [rbp - 0x20]
145afd099: 4889f1 mov rcx, rsi
145afd09c: 4c89ca mov rdx, r9
145afd09f: e84ce10500 call 0x145b5b1f0
145afd0a4: 90 nop
145afd0a5: 488b8e90000000 mov rcx, qword ptr [rsi + 0x90]
145afd0ac: 4883c110 add rcx, 0x10
145afd0b0: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
145afd0b4: 4c8b45f0 mov r8, qword ptr [rbp - 0x10]
145afd0b8: e8730c1800 call 0x145c7dd30
145afd0bd: 90 nop
145afd0be: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
145afd0c2: 4885d2 test rdx, rdx
145afd0c5: 740f je 0x145afd0d6
145afd0c7: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
145afd0cb: 41b801000000 mov r8d, 1
145afd0d1: e8fa5050fa call 0x1400021d0
145afd0d6: 488b45f8 mov rax, qword ptr [rbp - 8]
145afd0da: 488b10 mov rdx, qword ptr [rax]
145afd0dd: 4885d2 test rdx, rdx
145afd0e0: 7410 je 0x145afd0f2
145afd0e2: 488b4808 mov rcx, qword ptr [rax + 8]
145afd0e6: 41b801000000 mov r8d, 1
145afd0ec: e8df5050fa call 0x1400021d0
145afd0f1: 90 nop
145afd0f2: 4883c448 add rsp, 0x48
145afd0f6: 5e pop rsi
145afd0f7: 5d pop rbp
145afd0f8: c3 ret
145afd0f9: 488d0588e07d01 lea rax, [rip + 0x17de088]
145afd100: 4c89c1 mov rcx, r8
145afd103: 4989c0 mov r8, rax
145afd106: e8c8df6300 call 0x14613b0d3
145afd10b: 90 nop
145afd10c: 0f0b ud2
