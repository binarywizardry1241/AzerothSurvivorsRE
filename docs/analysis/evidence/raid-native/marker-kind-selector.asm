145952157: 418b5c2410 mov ebx, dword ptr [r12 + 0x10]
14595215c: b805000000 mov eax, 5
145952161: 488d0d3cac8d01 lea rcx, [rip + 0x18dac3c]
145952168: 48631499 movsxd rdx, dword ptr [rcx + rbx*4]
14595216c: 4801ca add rdx, rcx
14595216f: 488d0d27888d01 lea rcx, [rip + 0x18d8827]
145952176: ffe2 jmp rdx
