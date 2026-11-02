140367ba0: 56 push rsi
140367ba1: 4883ec60 sub rsp, 0x60
140367ba5: 488d15645ca905 lea rdx, [rip + 0x5a95c64]
140367bac: 488d742420 lea rsi, [rsp + 0x20]
140367bb1: 41b807000000 mov r8d, 7
140367bb7: 4889f1 mov rcx, rsi
140367bba: e8b15d8505 call 0x145bbd970
140367bbf: 488b542420 mov rdx, qword ptr [rsp + 0x20]
140367bc4: 4883faff cmp rdx, -1
140367bc8: 0f84b5000000 je 0x140367c83
140367bce: 4883fafe cmp rdx, -2
140367bd2: 0f8597000000 jne 0x140367c6f
140367bd8: 488b4c2430 mov rcx, qword ptr [rsp + 0x30]
140367bdd: 488b442438 mov rax, qword ptr [rsp + 0x38]
140367be2: 4883f803 cmp rax, 3
140367be6: 744d je 0x140367c35
140367be8: 4883f805 cmp rax, 5
140367bec: 7430 je 0x140367c1e
140367bee: 4883f806 cmp rax, 6
140367bf2: 7571 jne 0x140367c65
140367bf4: b878696e70 mov eax, 0x706e6978
140367bf9: 3301 xor eax, dword ptr [rcx]
140367bfb: 0fb75104 movzx edx, word ptr [rcx + 4]
140367bff: 81f275740000 xor edx, 0x7475
140367c05: 09c2 or edx, eax
140367c07: 755c jne 0x140367c65
140367c09: b001 mov al, 1
140367c0b: 488b542428 mov rdx, qword ptr [rsp + 0x28]
140367c10: 4885d2 test rdx, rdx
140367c13: 0f8580010000 jne 0x140367d99
140367c19: e935010000 jmp 0x140367d53
140367c1e: b867696c72 mov eax, 0x726c6967
140367c23: 3301 xor eax, dword ptr [rcx]
140367c25: 0fb65104 movzx edx, byte ptr [rcx + 4]
140367c29: 83f273 xor edx, 0x73
140367c2c: 09c2 or edx, eax
140367c2e: 7535 jne 0x140367c65
140367c30: e92c010000 jmp 0x140367d61
140367c35: 0fb701 movzx eax, word ptr [rcx]
140367c38: 3577670000 xor eax, 0x6777
140367c3d: 0fb65102 movzx edx, byte ptr [rcx + 2]
140367c41: 83f269 xor edx, 0x69
140367c44: 6609c2 or dx, ax
140367c47: 0f8414010000 je 0x140367d61
140367c4d: 0fb701 movzx eax, word ptr [rcx]
140367c50: 356f660000 xor eax, 0x666f
140367c55: 0fb65102 movzx edx, byte ptr [rcx + 2]
140367c59: 83f266 xor edx, 0x66
140367c5c: 6609c2 or dx, ax
140367c5f: 0f8428010000 je 0x140367d8d
140367c65: 488d742428 lea rsi, [rsp + 0x28]
140367c6a: 488b542428 mov rdx, qword ptr [rsp + 0x28]
140367c6f: 4885d2 test rdx, rdx
140367c72: 740f je 0x140367c83
140367c74: 488b4e08 mov rcx, qword ptr [rsi + 8]
140367c78: 41b801000000 mov r8d, 1
140367c7e: e84da5c9ff call 0x1400021d0
140367c83: 488d0d435aa905 lea rcx, [rip + 0x5a95a43]
140367c8a: ff15282ca305 call qword ptr [rip + 0x5a32c28]
140367c90: 4885c0 test rax, rax
140367c93: 0f84c0000000 je 0x140367d59
140367c99: 488d15375aa905 lea rdx, [rip + 0x5a95a37]
140367ca0: 4889c1 mov rcx, rax
140367ca3: ff15572ca305 call qword ptr [rip + 0x5a32c57]
140367ca9: 4885c0 test rax, rax
140367cac: 0f84a7000000 je 0x140367d59
140367cb2: 488b05ef52d107 mov rax, qword ptr [rip + 0x7d152ef]
140367cb9: 488b08 mov rcx, qword ptr [rax]
140367cbc: b001 mov al, 1
140367cbe: 4883f902 cmp rcx, 2
140367cc2: 0f878b000000 ja 0x140367d53
140367cc8: 0fb6151194cd07 movzx edx, byte ptr [rip + 0x7cd9411]
140367ccf: 0fb6ca movzx ecx, dl
140367cd2: 448d41ff lea r8d, [rcx - 1]
140367cd6: 4183f802 cmp r8d, 2
140367cda: 0f838f000000 jae 0x140367d6f
140367ce0: 488b0de993cd07 mov rcx, qword ptr [rip + 0x7cd93e9]
140367ce7: e8e45b8f04 call 0x144c5d8d0
140367cec: 84c0 test al, al
140367cee: 7461 je 0x140367d51
140367cf0: 488b0dd993cd07 mov rcx, qword ptr [rip + 0x7cd93d9]
140367cf7: 488d4130 lea rax, [rcx + 0x30]
140367cfb: 488d15155ba905 lea rdx, [rip + 0x5a95b15]
140367d02: 4889542450 mov qword ptr [rsp + 0x50], rdx
140367d07: 48c744245861000000 mov qword ptr [rsp + 0x58], 0x61
140367d10: 488d542450 lea rdx, [rsp + 0x50]
140367d15: 4889542440 mov qword ptr [rsp + 0x40], rdx
140367d1a: 488d15cf5aa905 lea rdx, [rip + 0x5a95acf]
140367d21: 4889542448 mov qword ptr [rsp + 0x48], rdx
140367d26: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140367d2f: 488d542440 lea rdx, [rsp + 0x40]
140367d34: 4889542428 mov qword ptr [rsp + 0x28], rdx
140367d39: 48c744243001000000 mov qword ptr [rsp + 0x30], 1
140367d42: 4889442438 mov qword ptr [rsp + 0x38], rax
140367d47: 488d542420 lea rdx, [rsp + 0x20]
140367d4c: e89f738f04 call 0x144c5f0f0
140367d51: b001 mov al, 1
140367d53: 4883c460 add rsp, 0x60
140367d57: 5e pop rsi
140367d58: c3 ret
140367d59: 31c0 xor eax, eax
140367d5b: 4883c460 add rsp, 0x60
140367d5f: 5e pop rsi
140367d60: c3 ret
140367d61: 31c0 xor eax, eax
140367d63: 488b542428 mov rdx, qword ptr [rsp + 0x28]
140367d68: 4885d2 test rdx, rdx
140367d6b: 752c jne 0x140367d99
140367d6d: ebe4 jmp 0x140367d53
140367d6f: 85c9 test ecx, ecx
140367d71: 74e0 je 0x140367d53
140367d73: 488d0d5693cd07 lea rcx, [rip + 0x7cd9356]
140367d7a: e8a1d49d05 call 0x145d45220
140367d7f: 89c2 mov edx, eax
140367d81: b001 mov al, 1
140367d83: 84d2 test dl, dl
140367d85: 0f8555ffffff jne 0x140367ce0
140367d8b: ebc6 jmp 0x140367d53
140367d8d: b002 mov al, 2
140367d8f: 488b542428 mov rdx, qword ptr [rsp + 0x28]
140367d94: 4885d2 test rdx, rdx
140367d97: 74ba je 0x140367d53
140367d99: 41b801000000 mov r8d, 1
140367d9f: 89c6 mov esi, eax
140367da1: e82aa4c9ff call 0x1400021d0
140367da6: 89f0 mov eax, esi
140367da8: 4883c460 add rsp, 0x60
140367dac: 5e pop rsi
140367dad: c3 ret
