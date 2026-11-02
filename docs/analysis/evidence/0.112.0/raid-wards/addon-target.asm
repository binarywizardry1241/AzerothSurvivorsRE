1458e5b10: 55 push rbp
1458e5b11: 4156 push r14
1458e5b13: 56 push rsi
1458e5b14: 57 push rdi
1458e5b15: 53 push rbx
1458e5b16: 4881ece0000000 sub rsp, 0xe0
1458e5b1d: 488dac2480000000 lea rbp, [rsp + 0x80]
1458e5b25: 48c74558feffffff mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
1458e5b2d: 4889ce mov rsi, rcx
1458e5b30: 4d85c0 test r8, r8
1458e5b33: 7456 je 0x1458e5b8b
1458e5b35: 4c3b8268040000 cmp r8, qword ptr [rdx + 0x468]
1458e5b3c: 0f858f000000 jne 0x1458e5bd1
1458e5b42: e8b9c671fa call 0x140002200
1458e5b47: b90b000000 mov ecx, 0xb
1458e5b4c: ba01000000 mov edx, 1
1458e5b51: e86ac671fa call 0x1400021c0
1458e5b56: 4885c0 test rax, rax
1458e5b59: 0f8457030000 je 0x1458e5eb6
1458e5b5f: 48b96b696e643d706c61 movabs rcx, 0x616c703d646e696b
1458e5b69: 488908 mov qword ptr [rax], rcx
1458e5b6c: c7400761796572 mov dword ptr [rax + 7], 0x72657961
1458e5b73: 48c7060b000000 mov qword ptr [rsi], 0xb
1458e5b7a: 48894608 mov qword ptr [rsi + 8], rax
1458e5b7e: 48c746100b000000 mov qword ptr [rsi + 0x10], 0xb
1458e5b86: e900010000 jmp 0x1458e5c8b
1458e5b8b: e870c671fa call 0x140002200
1458e5b90: b909000000 mov ecx, 9
1458e5b95: ba01000000 mov edx, 1
1458e5b9a: e821c671fa call 0x1400021c0
1458e5b9f: 4885c0 test rax, rax
1458e5ba2: 0f84fd020000 je 0x1458e5ea5
1458e5ba8: 48b96b696e643d6e6f6e movabs rcx, 0x6e6f6e3d646e696b
1458e5bb2: 488908 mov qword ptr [rax], rcx
1458e5bb5: c6400865 mov byte ptr [rax + 8], 0x65
1458e5bb9: 48c70609000000 mov qword ptr [rsi], 9
1458e5bc0: 48894608 mov qword ptr [rsi + 8], rax
1458e5bc4: 48c7461009000000 mov qword ptr [rsi + 0x10], 9
1458e5bcc: e9ba000000 jmp 0x1458e5c8b
1458e5bd1: 48c7c028feffff mov rax, 0xfffffffffffffe28
1458e5bd8: 48038268050000 add rax, qword ptr [rdx + 0x568]
1458e5bdf: 48698a70050000d8010000 imul rcx, qword ptr [rdx + 0x570], 0x1d8
1458e5bea: 660f1f440000 nop word ptr [rax + rax]
1458e5bf0: 4885c9 test rcx, rcx
1458e5bf3: 7453 je 0x1458e5c48
1458e5bf5: 488db8d8010000 lea rdi, [rax + 0x1d8]
1458e5bfc: 4881c128feffff add rcx, -0x1d8
1458e5c03: 4c3980c8020000 cmp qword ptr [rax + 0x2c8], r8
1458e5c0a: 4889f8 mov rax, rdi
1458e5c0d: 75e1 jne 0x1458e5bf0
1458e5c0f: 83bfb000000000 cmp dword ptr [rdi + 0xb0], 0
1458e5c16: 0f8480000000 je 0x1458e5c9c
1458e5c1c: 44894520 mov dword ptr [rbp + 0x20], r8d
1458e5c20: 488d4520 lea rax, [rbp + 0x20]
1458e5c24: 488945b0 mov qword ptr [rbp - 0x50], rax
1458e5c28: 488d05b18f3000 lea rax, [rip + 0x308fb1]
1458e5c2f: 488945b8 mov qword ptr [rbp - 0x48], rax
1458e5c33: 488d15b3373201 lea rdx, [rip + 0x13237b3]
1458e5c3a: 4c8d45b0 lea r8, [rbp - 0x50]
1458e5c3e: 4889f1 mov rcx, rsi
1458e5c41: e8ea742f00 call 0x145bdd130
1458e5c46: eb43 jmp 0x1458e5c8b
1458e5c48: e8b3c571fa call 0x140002200
1458e5c4d: b90a000000 mov ecx, 0xa
1458e5c52: ba01000000 mov edx, 1
1458e5c57: e864c571fa call 0x1400021c0
1458e5c5c: 4885c0 test rax, rax
1458e5c5f: 0f8462020000 je 0x1458e5ec7
1458e5c65: 48b96b696e643d6f7468 movabs rcx, 0x68746f3d646e696b
1458e5c6f: 488908 mov qword ptr [rax], rcx
1458e5c72: 66c740086572 mov word ptr [rax + 8], 0x7265
1458e5c78: 48c7060a000000 mov qword ptr [rsi], 0xa
1458e5c7f: 48894608 mov qword ptr [rsi + 8], rax
1458e5c83: 48c746100a000000 mov qword ptr [rsi + 0x10], 0xa
1458e5c8b: 4889f0 mov rax, rsi
1458e5c8e: 4881c4e0000000 add rsp, 0xe0
1458e5c95: 5b pop rbx
1458e5c96: 5f pop rdi
1458e5c97: 5e pop rsi
1458e5c98: 415e pop r14
1458e5c9a: 5d pop rbp
1458e5c9b: c3 ret
1458e5c9c: 48837f18ff cmp qword ptr [rdi + 0x18], -1
1458e5ca1: 741f je 0x1458e5cc2
1458e5ca3: 488b4730 mov rax, qword ptr [rdi + 0x30]
1458e5ca7: 80786400 cmp byte ptr [rax + 0x64], 0
1458e5cab: 7435 je 0x1458e5ce2
1458e5cad: 488d05b6363201 lea rax, [rip + 0x13236b6]
1458e5cb4: 48894540 mov qword ptr [rbp + 0x40], rax
1458e5cb8: 48c7454805000000 mov qword ptr [rbp + 0x48], 5
1458e5cc0: eb33 jmp 0x1458e5cf5
1458e5cc2: 48837f58ff cmp qword ptr [rdi + 0x58], -1
1458e5cc7: 0f8465010000 je 0x1458e5e32
1458e5ccd: 488d057f363201 lea rax, [rip + 0x132367f]
1458e5cd4: 48894540 mov qword ptr [rbp + 0x40], rax
1458e5cd8: 48c7454808000000 mov qword ptr [rbp + 0x48], 8
1458e5ce0: eb13 jmp 0x1458e5cf5
1458e5ce2: 488d057d363201 lea rax, [rip + 0x132367d]
1458e5ce9: 48894540 mov qword ptr [rbp + 0x40], rax
1458e5ced: 48c7454804000000 mov qword ptr [rbp + 0x48], 4
1458e5cf5: 4489453c mov dword ptr [rbp + 0x3c], r8d
1458e5cf9: 4889f9 mov rcx, rdi
1458e5cfc: e81f700b00 call 0x14599cd20
1458e5d01: 48c745b000000000 mov qword ptr [rbp - 0x50], 0
1458e5d09: 48c745b801000000 mov qword ptr [rbp - 0x48], 1
1458e5d11: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1458e5d19: 4885d2 test rdx, rdx
1458e5d1c: 0f8544010000 jne 0x1458e5e66
1458e5d22: 4801c2 add rdx, rax
1458e5d25: 4c8d45b0 lea r8, [rbp - 0x50]
1458e5d29: 4889c1 mov rcx, rax
1458e5d2c: e82f401100 call 0x1459f9d60
1458e5d31: 90 nop
1458e5d32: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458e5d36: 48894530 mov qword ptr [rbp + 0x30], rax
1458e5d3a: 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
1458e5d3e: 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
1458e5d42: f30f108758010000 movss xmm0, dword ptr [rdi + 0x158]
1458e5d4a: 0f57c9 xorps xmm1, xmm1
1458e5d4d: f30f5fc1 maxss xmm0, xmm1
1458e5d51: f30f114538 movss dword ptr [rbp + 0x38], xmm0
1458e5d56: 488d875c010000 lea rax, [rdi + 0x15c]
1458e5d5d: b950000000 mov ecx, 0x50
1458e5d62: 48837f18ff cmp qword ptr [rdi + 0x18], -1
1458e5d67: 7510 jne 0x1458e5d79
1458e5d69: b9a8000000 mov ecx, 0xa8
1458e5d6e: 48837f58ff cmp qword ptr [rdi + 0x58], -1
1458e5d73: 0f84ce000000 je 0x1458e5e47
1458e5d79: 0fb60c0f movzx ecx, byte ptr [rdi + rcx]
1458e5d7d: 884d57 mov byte ptr [rbp + 0x57], cl
1458e5d80: 0fb68fd0010000 movzx ecx, byte ptr [rdi + 0x1d0]
1458e5d87: 884d56 mov byte ptr [rbp + 0x56], cl
1458e5d8a: 488d4d40 lea rcx, [rbp + 0x40]
1458e5d8e: 48894db0 mov qword ptr [rbp - 0x50], rcx
1458e5d92: 488d0d27c371fa lea rcx, [rip - 0x58e3cd9]
1458e5d99: 48894db8 mov qword ptr [rbp - 0x48], rcx
1458e5d9d: 488d4d3c lea rcx, [rbp + 0x3c]
1458e5da1: 48894dc0 mov qword ptr [rbp - 0x40], rcx
1458e5da5: 488d0d348e3000 lea rcx, [rip + 0x308e34]
1458e5dac: 48894dc8 mov qword ptr [rbp - 0x38], rcx
1458e5db0: 488d4d20 lea rcx, [rbp + 0x20]
1458e5db4: 48894dd0 mov qword ptr [rbp - 0x30], rcx
1458e5db8: 488d0d21c371fa lea rcx, [rip - 0x58e3cdf]
1458e5dbf: 48894dd8 mov qword ptr [rbp - 0x28], rcx
1458e5dc3: 488d4d38 lea rcx, [rbp + 0x38]
1458e5dc7: 48894de0 mov qword ptr [rbp - 0x20], rcx
1458e5dcb: 488d0d0e813000 lea rcx, [rip + 0x30810e]
1458e5dd2: 48894de8 mov qword ptr [rbp - 0x18], rcx
1458e5dd6: 488945f0 mov qword ptr [rbp - 0x10], rax
1458e5dda: 48894df8 mov qword ptr [rbp - 8], rcx
1458e5dde: 488d4557 lea rax, [rbp + 0x57]
1458e5de2: 48894500 mov qword ptr [rbp], rax
1458e5de6: 488d0523573000 lea rax, [rip + 0x305723]
1458e5ded: 48894508 mov qword ptr [rbp + 8], rax
1458e5df1: 488d4d56 lea rcx, [rbp + 0x56]
1458e5df5: 48894d10 mov qword ptr [rbp + 0x10], rcx
1458e5df9: 48894518 mov qword ptr [rbp + 0x18], rax
1458e5dfd: 488d15f9353201 lea rdx, [rip + 0x13235f9]
1458e5e04: 4c8d45b0 lea r8, [rbp - 0x50]
1458e5e08: 4889f1 mov rcx, rsi
1458e5e0b: e820732f00 call 0x145bdd130
1458e5e10: 90 nop
1458e5e11: 488b5520 mov rdx, qword ptr [rbp + 0x20]
1458e5e15: 4885d2 test rdx, rdx
1458e5e18: 0f846dfeffff je 0x1458e5c8b
1458e5e1e: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
1458e5e22: 41b801000000 mov r8d, 1
1458e5e28: e8a3c371fa call 0x1400021d0
1458e5e2d: e959feffff jmp 0x1458e5c8b
1458e5e32: 80bfd001000000 cmp byte ptr [rdi + 0x1d0], 0
1458e5e39: 7413 je 0x1458e5e4e
1458e5e3b: 488d051f353201 lea rax, [rip + 0x132351f]
1458e5e42: e96dfeffff jmp 0x1458e5cb4
1458e5e47: 31c9 xor ecx, ecx
1458e5e49: e92fffffff jmp 0x1458e5d7d
1458e5e4e: 488d0506353201 lea rax, [rip + 0x1323506]
1458e5e55: 48894540 mov qword ptr [rbp + 0x40], rax
1458e5e59: 48c7454806000000 mov qword ptr [rbp + 0x48], 6
1458e5e61: e98ffeffff jmp 0x1458e5cf5
1458e5e66: 4989d0 mov r8, rdx
1458e5e69: 49c1e802 shr r8, 2
1458e5e6d: 89d1 mov ecx, edx
1458e5e6f: 83e103 and ecx, 3
1458e5e72: 4883f901 cmp rcx, 1
1458e5e76: 4983d8ff sbb r8, -1
1458e5e7a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458e5e83: 488d4db0 lea rcx, [rbp - 0x50]
1458e5e87: 41b901000000 mov r9d, 1
1458e5e8d: 4889d3 mov rbx, rdx
1458e5e90: 31d2 xor edx, edx
1458e5e92: 4989c6 mov r14, rax
1458e5e95: e8d6753200 call 0x145c0d470
1458e5e9a: 4889da mov rdx, rbx
1458e5e9d: 4c89f0 mov rax, r14
1458e5ea0: e97dfeffff jmp 0x1458e5d22
1458e5ea5: b901000000 mov ecx, 1
1458e5eaa: ba09000000 mov edx, 9
1458e5eaf: e837364c00 call 0x145da94eb
1458e5eb4: 0f0b ud2
1458e5eb6: b901000000 mov ecx, 1
1458e5ebb: ba0b000000 mov edx, 0xb
1458e5ec0: e826364c00 call 0x145da94eb
1458e5ec5: 0f0b ud2
1458e5ec7: b901000000 mov ecx, 1
1458e5ecc: ba0a000000 mov edx, 0xa
1458e5ed1: e815364c00 call 0x145da94eb
1458e5ed6: 0f0b ud2
