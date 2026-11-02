0x1459a3280: 55 push rbp
0x1459a3281: 4156 push r14
0x1459a3283: 56 push rsi
0x1459a3284: 57 push rdi
0x1459a3285: 53 push rbx
0x1459a3286: 4883ec40 sub rsp, 0x40
0x1459a328a: 488d6c2440 lea rbp, [rsp + 0x40]
0x1459a328f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1459a3297: 4889d7 mov rdi, rdx
0x1459a329a: 4889ce mov rsi, rcx
0x1459a329d: e85eef65fa call 0x140002200
0x1459a32a2: b910000000 mov ecx, 0x10
0x1459a32a7: ba08000000 mov edx, 8
0x1459a32ac: e80fef65fa call 0x1400021c0
0x1459a32b1: 4885c0 test rax, rax
0x1459a32b4: 0f8444010000 je 0x1459a33fe
0x1459a32ba: 488d0dffb88901 lea rcx, [rip + 0x189b8ff]
0x1459a32c1: 488908 mov qword ptr [rax], rcx
0x1459a32c4: 488d0df5ba8901 lea rcx, [rip + 0x189baf5]
0x1459a32cb: 48894808 mov qword ptr [rax + 8], rcx
0x1459a32cf: 48c745e002000000 mov qword ptr [rbp - 0x20], 2
0x1459a32d7: 488945e8 mov qword ptr [rbp - 0x18], rax
0x1459a32db: 48c745f002000000 mov qword ptr [rbp - 0x10], 2
0x1459a32e3: 488b5f10 mov rbx, qword ptr [rdi + 0x10]
0x1459a32e7: 4885db test rbx, rbx
0x1459a32ea: 0f84e9000000 je 0x1459a33d9
0x1459a32f0: 488b7f08 mov rdi, qword ptr [rdi + 8]
0x1459a32f4: 48c1e304 shl rbx, 4
0x1459a32f8: 31c9 xor ecx, ecx
0x1459a32fa: 48ba736f756c5f646576 movabs rdx, 0x7665645f6c756f73
0x1459a3304: 49b86465766f75726572 movabs r8, 0x726572756f766564
0x1459a330e: eb09 jmp 0x1459a3319
0x1459a3310: 4883c110 add rcx, 0x10
0x1459a3314: 4839cb cmp rbx, rcx
0x1459a3317: 7451 je 0x1459a336a
0x1459a3319: 4c8b0c0f mov r9, qword ptr [rdi + rcx]
0x1459a331d: 498379380d cmp qword ptr [r9 + 0x38], 0xd
0x1459a3322: 75ec jne 0x1459a3310
0x1459a3324: 4d8b4930 mov r9, qword ptr [r9 + 0x30]
0x1459a3328: 4d8b11 mov r10, qword ptr [r9]
0x1459a332b: 4931d2 xor r10, rdx
0x1459a332e: 4d8b4905 mov r9, qword ptr [r9 + 5]
0x1459a3332: 4d31c1 xor r9, r8
0x1459a3335: 4d09d1 or r9, r10
0x1459a3338: 75d6 jne 0x1459a3310
0x1459a333a: 807c0f0800 cmp byte ptr [rdi + rcx + 8], 0
0x1459a333f: 7429 je 0x1459a336a
0x1459a3341: 488d4de0 lea rcx, [rbp - 0x20]
0x1459a3345: e8e6a52600 call 0x145c0d930
0x1459a334a: 90 nop
0x1459a334b: 488b45e8 mov rax, qword ptr [rbp - 0x18]
0x1459a334f: 488d0d0abb8901 lea rcx, [rip + 0x189bb0a]
0x1459a3356: 48894810 mov qword ptr [rax + 0x10], rcx
0x1459a335a: 48c745f003000000 mov qword ptr [rbp - 0x10], 3
0x1459a3362: 41be03000000 mov r14d, 3
0x1459a3368: eb06 jmp 0x1459a3370
0x1459a336a: 41be02000000 mov r14d, 2
0x1459a3370: 31c9 xor ecx, ecx
0x1459a3372: 48ba736f756c5f6c696e movabs rdx, 0x6e696c5f6c756f73
0x1459a337c: eb0b jmp 0x1459a3389
0x1459a337e: 6690 nop
0x1459a3380: 4883c110 add rcx, 0x10
0x1459a3384: 4839cb cmp rbx, rcx
0x1459a3387: 7450 je 0x1459a33d9
0x1459a3389: 4c8b040f mov r8, qword ptr [rdi + rcx]
0x1459a338d: 4983783809 cmp qword ptr [r8 + 0x38], 9
0x1459a3392: 75ec jne 0x1459a3380
0x1459a3394: 4d8b4030 mov r8, qword ptr [r8 + 0x30]
0x1459a3398: 4d8b08 mov r9, qword ptr [r8]
0x1459a339b: 4931d1 xor r9, rdx
0x1459a339e: 450fb64008 movzx r8d, byte ptr [r8 + 8]
0x1459a33a3: 4983f06b xor r8, 0x6b
0x1459a33a7: 4d09c8 or r8, r9
0x1459a33aa: 75d4 jne 0x1459a3380
0x1459a33ac: 807c0f0800 cmp byte ptr [rdi + rcx + 8], 0
0x1459a33b1: 7426 je 0x1459a33d9
0x1459a33b3: 4c3b75e0 cmp r14, qword ptr [rbp - 0x20]
0x1459a33b7: 750e jne 0x1459a33c7
0x1459a33b9: 488d4de0 lea rcx, [rbp - 0x20]
0x1459a33bd: e86ea52600 call 0x145c0d930
0x1459a33c2: 90 nop
0x1459a33c3: 488b45e8 mov rax, qword ptr [rbp - 0x18]
0x1459a33c7: 488d0d7ae48701 lea rcx, [rip + 0x187e47a]
0x1459a33ce: 4a890cf0 mov qword ptr [rax + r14*8], rcx
0x1459a33d2: 49ffc6 inc r14
0x1459a33d5: 4c8975f0 mov qword ptr [rbp - 0x10], r14
0x1459a33d9: 488b45f0 mov rax, qword ptr [rbp - 0x10]
0x1459a33dd: 48894610 mov qword ptr [rsi + 0x10], rax
0x1459a33e1: 488b45e0 mov rax, qword ptr [rbp - 0x20]
0x1459a33e5: 488906 mov qword ptr [rsi], rax
0x1459a33e8: 488b45e8 mov rax, qword ptr [rbp - 0x18]
0x1459a33ec: 48894608 mov qword ptr [rsi + 8], rax
0x1459a33f0: 4889f0 mov rax, rsi
0x1459a33f3: 4883c440 add rsp, 0x40
0x1459a33f7: 5b pop rbx
0x1459a33f8: 5f pop rdi
0x1459a33f9: 5e pop rsi
0x1459a33fa: 415e pop r14
0x1459a33fc: 5d pop rbp
0x1459a33fd: c3 ret
0x1459a33fe: b908000000 mov ecx, 8
0x1459a3403: ba10000000 mov edx, 0x10
0x1459a3408: e8c4604000 call 0x145da94d1
0x1459a340d: 0f0b ud2
