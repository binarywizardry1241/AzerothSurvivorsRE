145b5cd10: 55 push rbp
145b5cd11: 56 push rsi
145b5cd12: 57 push rdi
145b5cd13: 53 push rbx
145b5cd14: 4883ec48 sub rsp, 0x48
145b5cd18: 488d6c2440 lea rbp, [rsp + 0x40]
145b5cd1d: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145b5cd25: 81fa0000f000 cmp edx, 0xf00000
145b5cd2b: 730c jae 0x145b5cd39
145b5cd2d: 48c701ffffffff mov qword ptr [rcx], 0xffffffffffffffff
145b5cd34: e9d8000000 jmp 0x145b5ce11
145b5cd39: 81c2000010ff add edx, 0xff100000
145b5cd3f: 41b001 mov r8b, 1
145b5cd42: 31c0 xor eax, eax
145b5cd44: f0440fb005db999b02 lock cmpxchg byte ptr [rip + 0x29b99db], r8b
145b5cd4d: 755f jne 0x145b5cdae
145b5cd4f: 488b351a9e9b02 mov rsi, qword ptr [rip + 0x29b9e1a]
145b5cd56: 488b06 mov rax, qword ptr [rsi]
145b5cd59: 48d1e0 shl rax, 1
145b5cd5c: 4885c0 test rax, rax
145b5cd5f: 756a jne 0x145b5cdcb
145b5cd61: 31c0 xor eax, eax
145b5cd63: 440fb605be999b02 movzx r8d, byte ptr [rip + 0x29b99be]
145b5cd6b: 483915ce999b02 cmp qword ptr [rip + 0x29b99ce], rdx
145b5cd72: 767b jbe 0x145b5cdef
145b5cd74: 8945fc mov dword ptr [rbp - 4], eax
145b5cd77: 4889cf mov rdi, rcx
145b5cd7a: 488d1452 lea rdx, [rdx + rdx*2]
145b5cd7e: 48c1e203 shl rdx, 3
145b5cd82: 480315af999b02 add rdx, qword ptr [rip + 0x29b99af]
145b5cd89: 488d4de0 lea rcx, [rbp - 0x20]
145b5cd8d: e8dea14000 call 0x145f66f70
145b5cd92: 90 nop
145b5cd93: 488b45f0 mov rax, qword ptr [rbp - 0x10]
145b5cd97: 4889f9 mov rcx, rdi
145b5cd9a: 48894710 mov qword ptr [rdi + 0x10], rax
145b5cd9e: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
145b5cda2: 0f1107 movups xmmword ptr [rdi], xmm0
145b5cda5: 8b45fc mov eax, dword ptr [rbp - 4]
145b5cda8: 84c0 test al, al
145b5cdaa: 744e je 0x145b5cdfa
145b5cdac: eb57 jmp 0x145b5ce05
145b5cdae: 488d0573999b02 lea rax, [rip + 0x29b9973]
145b5cdb5: 4889ce mov rsi, rcx
145b5cdb8: 4889c1 mov rcx, rax
145b5cdbb: 4889d7 mov rdi, rdx
145b5cdbe: e81dc65d00 call 0x1461393e0
145b5cdc3: 4889fa mov rdx, rdi
145b5cdc6: 4889f1 mov rcx, rsi
145b5cdc9: eb84 jmp 0x145b5cd4f
145b5cdcb: 4889cf mov rdi, rcx
145b5cdce: 4889d3 mov rbx, rdx
145b5cdd1: e89ad35d00 call 0x14613a170
145b5cdd6: 4889da mov rdx, rbx
145b5cdd9: 4889f9 mov rcx, rdi
145b5cddc: 3401 xor al, 1
145b5cdde: 440fb60543999b02 movzx r8d, byte ptr [rip + 0x29b9943]
145b5cde6: 48391553999b02 cmp qword ptr [rip + 0x29b9953], rdx
145b5cded: 7785 ja 0x145b5cd74
145b5cdef: 48c701ffffffff mov qword ptr [rcx], 0xffffffffffffffff
145b5cdf6: 84c0 test al, al
145b5cdf8: 750b jne 0x145b5ce05
145b5cdfa: 488b06 mov rax, qword ptr [rsi]
145b5cdfd: 48d1e0 shl rax, 1
145b5ce00: 4885c0 test rax, rax
145b5ce03: 752f jne 0x145b5ce34
145b5ce05: 31c0 xor eax, eax
145b5ce07: 86051b999b02 xchg byte ptr [rip + 0x29b991b], al
145b5ce0d: 3c02 cmp al, 2
145b5ce0f: 740c je 0x145b5ce1d
145b5ce11: 4889c8 mov rax, rcx
145b5ce14: 4883c448 add rsp, 0x48
145b5ce18: 5b pop rbx
145b5ce19: 5f pop rdi
145b5ce1a: 5e pop rsi
145b5ce1b: 5d pop rbp
145b5ce1c: c3 ret
145b5ce1d: 488d0504999b02 lea rax, [rip + 0x29b9904]
145b5ce24: 4889ce mov rsi, rcx
145b5ce27: 4889c1 mov rcx, rax
145b5ce2a: e871c65d00 call 0x1461394a0
145b5ce2f: 4889f0 mov rax, rsi
145b5ce32: ebe0 jmp 0x145b5ce14
145b5ce34: 4889ce mov rsi, rcx
145b5ce37: e834d35d00 call 0x14613a170
145b5ce3c: 4889f1 mov rcx, rsi
145b5ce3f: 84c0 test al, al
145b5ce41: 75c2 jne 0x145b5ce05
145b5ce43: c605df989b0201 mov byte ptr [rip + 0x29b98df], 1
145b5ce4a: ebb9 jmp 0x145b5ce05
