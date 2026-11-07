000000014013aef3: mov r15, qword ptr [rbp + 0x390]
000000014013aefa: cmp byte ptr [r15], 1
000000014013aefe: jne 0x14013af22
000000014013af00: mov eax, dword ptr [r15 + 1]
000000014013af04: mov ecx, dword ptr [r15 + 4]
000000014013af08: mov dword ptr [rbp + 0x3bb], ecx
000000014013af0e: mov dword ptr [rbp + 0x3b8], eax
000000014013af14: mov rsi, qword ptr [r15 + 8]
000000014013af18: movzx edi, byte ptr [r15 + 0x10]
000000014013af1d: mov r14b, 1
000000014013af20: jmp 0x14013af33
000000014013af22: mov rsi, qword ptr [r15 + 8]
000000014013af26: lock inc qword ptr [rsi]
000000014013af2a: jle 0x14013b127
000000014013af30: xor r14d, r14d
000000014013af33: movups xmm0, xmmword ptr [rip + 0x5c9980e]
000000014013af3a: movups xmmword ptr [rbp + 0x37c], xmm0
000000014013af41: mov dword ptr [rbp + 0x38c], 0x3f800000
000000014013af4b: xorps xmm0, xmm0
000000014013af4e: movups xmmword ptr [rbp + 0x178], xmm0
000000014013af55: lea rcx, [rbp - 0x50]
000000014013af59: lea rdx, [rip + 0x5c98ec8]
000000014013af60: mov r8d, 0x180
000000014013af66: call 0x145bf293b
000000014013af6b: mov r12, qword ptr [rbp + 0x398]
000000014013af72: mov rbx, qword ptr [r12]
000000014013af76: add r12, 8
000000014013af7a: mov qword ptr [rbp + 0x168], 0
000000014013af85: mov qword ptr [rbp + 0x170], 1
000000014013af90: mov qword ptr [rbp + 0x188], 4
000000014013af9b: mov qword ptr [rbp + 0x190], 0
000000014013afa6: mov byte ptr [rbp + 0x198], r14b
000000014013afad: mov eax, dword ptr [rbp + 0x3b8]
000000014013afb3: mov ecx, dword ptr [rbp + 0x3bb]
000000014013afb9: mov dword ptr [rbp + 0x19c], ecx
000000014013afbf: mov dword ptr [rbp + 0x199], eax
000000014013afc5: mov qword ptr [rbp + 0x1a0], rsi
000000014013afcc: mov qword ptr [rbp + 0x1a8], rdi
000000014013afd3: mov dword ptr [rbp + 0x1b0], 0x41700000
000000014013afdd: mov word ptr [rbp + 0x1b4], 0x190
000000014013afe6: mov byte ptr [rbp + 0x1b6], 1
000000014013afed: mov rax, qword ptr [rbp + 0x388]
000000014013aff4: mov qword ptr [rbp + 0x1c4], rax
000000014013affb: movups xmm0, xmmword ptr [rbp + 0x37b]
000000014013b002: movups xmmword ptr [rbp + 0x1b7], xmm0
000000014013b009: movups xmm0, xmmword ptr [rip + 0x5c98d44]
000000014013b010: movups xmmword ptr [rbp + 0x1cc], xmm0
000000014013b017: mov dword ptr [rbp + 0x1dc], 0x3f59999a
000000014013b021: movsd xmm0, qword ptr [rip + 0x5c5c7e7]
000000014013b029: movsd qword ptr [rbp + 0x1e0], xmm0
000000014013b031: mov word ptr [rbp + 0x1e8], 1
000000014013b03a: lea rcx, [rbp + 0x1ea]
000000014013b041: lea rdx, [rbp - 0x56]
000000014013b045: mov r8d, 0x186
000000014013b04b: call 0x145bf293b
000000014013b050: mov qword ptr [rbp + 0x160], rbx
000000014013b057: mov byte ptr [rbp + 0x3ef], 1
000000014013b05e: lea r9, [rip + 0x5c95fdb]
000000014013b065: lea rcx, [rbp + 0x130]
000000014013b06c: lea r8, [rbp + 0x160]
000000014013b073: mov rdx, r12
000000014013b076: call 0x1402221b0
000000014013b07b: nop
000000014013b07c: mov rax, qword ptr [rbp + 0x3d0]
000000014013b083: mov qword ptr [rbp + 0x170], rax
000000014013b08a: movups xmm0, xmmword ptr [rbp + 0x3c0]
000000014013b091: movaps xmmword ptr [rbp + 0x160], xmm0
000000014013b098: mov qword ptr [rbp + 0x178], r15
000000014013b09f: mov byte ptr [rbp + 0x3ef], 0
000000014013b0a6: lea rcx, [rbp + 0x130]
000000014013b0ad: lea rdx, [rbp + 0x160]
000000014013b0b4: call 0x14024a220
