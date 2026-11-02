14591a007: 418b5c2410 mov ebx, dword ptr [r12 + 0x10]
14591a00c: b805000000 mov eax, 5
14591a011: 488d0d18222f01 lea rcx, [rip + 0x12f2218]
14591a018: 48631499 movsxd rdx, dword ptr [rcx + rbx*4]
14591a01c: 4801ca add rdx, rcx
14591a01f: 488d0daffd2e01 lea rcx, [rip + 0x12efdaf]
14591a026: ffe2 jmp rdx
14591a028: b804000000 mov eax, 4
14591a02d: 41807c247d00 cmp byte ptr [r12 + 0x7d], 0
14591a033: 488d0de4fa2e01 lea rcx, [rip + 0x12efae4]
14591a03a: 750c jne 0x14591a048
14591a03c: b806000000 mov eax, 6
14591a041: 488d0d92fd2e01 lea rcx, [rip + 0x12efd92]
