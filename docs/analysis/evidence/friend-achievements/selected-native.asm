; remote-abandoned-filter
145c22718 4d89f9 mov r9, r15
145c2271b 0f1f440000 nop dword ptr [rax + rax]
145c22720 4180b98309000001 cmp byte ptr [r9 + 0x983], 1
145c22728 7516 jne 0x145c22740
145c2272a 4981c190090000 add r9, 0x990
145c22731 4939d9 cmp r9, rbx
145c22734 75ea jne 0x145c22720
145c22736 e98e030000 jmp 0x145c22ac9
145c2273b 0f1f440000 nop dword ptr [rax + rax]
145c22740 4d8db990090000 lea r15, [r9 + 0x990]
145c22747 4c893a mov qword ptr [rdx], r15

; tick-store-members
145b7d4d0 450fb6c2 movzx r8d, r10b
145b7d4d4 49c1e028 shl r8, 0x28
145b7d4d8 0fb6c9 movzx ecx, cl
145b7d4db 48c1e120 shl rcx, 0x20
145b7d4df 4c09c1 or rcx, r8
145b7d4e2 4809d1 or rcx, rdx
145b7d4e5 488908 mov qword ptr [rax], rcx
145b7d4e8 48c745b001000000 mov qword ptr [rbp - 0x50], 1
145b7d4f0 498b842490090000 mov rax, qword ptr [r12 + 0x990]
145b7d4f8 4869cf90090000 imul rcx, rdi, 0x990
145b7d4ff 4801c1 add rcx, rax
145b7d502 48898530090000 mov qword ptr [rbp + 0x930], rax
145b7d509 48898d38090000 mov qword ptr [rbp + 0x938], rcx
145b7d510 488d857f130000 lea rax, [rbp + 0x137f]
145b7d517 48898540090000 mov qword ptr [rbp + 0x940], rax
145b7d51e 488d4da0 lea rcx, [rbp - 0x60]
145b7d522 488d9530090000 lea rdx, [rbp + 0x930]
145b7d529 e8b2510a00 call 0x145c226e0
145b7d52e 90 nop
145b7d52f 488b45b0 mov rax, qword ptr [rbp - 0x50]
145b7d533 48898540090000 mov qword ptr [rbp + 0x940], rax
145b7d53a 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
145b7d53e 0f298530090000 movaps xmmword ptr [rbp + 0x930], xmm0
145b7d545 498db424900a0000 lea rsi, [r12 + 0xa90]
145b7d54d 498b9424900a0000 mov rdx, qword ptr [r12 + 0xa90]
145b7d555 4885d2 test rdx, rdx
145b7d558 7417 je 0x145b7d571
145b7d55a 498b8c24980a0000 mov rcx, qword ptr [r12 + 0xa98]
145b7d562 48c1e203 shl rdx, 3
145b7d566 41b804000000 mov r8d, 4
145b7d56c e85f4c48fa call 0x1400021d0
145b7d571 488b8540090000 mov rax, qword ptr [rbp + 0x940]
145b7d578 48894610 mov qword ptr [rsi + 0x10], rax
145b7d57c 0f288530090000 movaps xmm0, xmmword ptr [rbp + 0x930]
145b7d583 0f1106 movups xmmword ptr [rsi], xmm0

; abandon-mark
145ba6204 4889f9 mov rcx, rdi
145ba6207 c687880c0000ff mov byte ptr [rdi + 0xc88], 0xff
145ba620e c687770c000001 mov byte ptr [rdi + 0xc77], 1
145ba6215 e8c6fdfeff call 0x145b95fe0
145ba621a 80fb03 cmp bl, 3
145ba621d 0f92c0 setb al
145ba6220 4883c428 add rsp, 0x28
145ba6224 5b pop rbx
145ba6225 5f pop rdi
145ba6226 5e pop rsi
145ba6227 415e pop r14
145ba6229 c3 ret

; any-and-dispatch
145b3376a 488b01 mov rax, qword ptr [rcx]
145b3376d 4989c1 mov r9, rax
145b33770 4983e903 sub r9, 3
145b33774 41ba03000000 mov r10d, 3
145b3377a 4d0f43d1 cmovae r10, r9
145b3377e 4c8d0ddbedaa01 lea r9, [rip + 0x1aaeddb]
145b33785 4f631491 movsxd r10, dword ptr [r9 + r10*4]
145b33789 4d01ca add r10, r9
145b3378c 41ffe2 jmp r10
145b3378f 4983f802 cmp r8, 2
145b33793 0f93c0 setae al
145b33796 e928010000 jmp 0x145b338c3

; history-won-gate
145b15737 80bdd501000000 cmp byte ptr [rbp + 0x1d5], 0
145b1573e 0f8499010000 je 0x145b158dd

; history-context-and-count
145b15825 4883bd78010000ff cmp qword ptr [rbp + 0x178], -1
145b1582d 0f84aa000000 je 0x145b158dd
145b15833 4883bd8801000002 cmp qword ptr [rbp + 0x188], 2
145b1583b 0f829c000000 jb 0x145b158dd

; boss-event-members-a
145b43039 498b5508 mov rdx, qword ptr [r13 + 8]
145b4303d 4d8b4510 mov r8, qword ptr [r13 + 0x10]
145b43041 488d4dc0 lea rcx, [rbp - 0x40]
145b43045 e81607ffff call 0x145b33760
145b4304a 90 nop
145b4304b 84c0 test al, al
145b4304d 4989db mov r11, rbx

; boss-event-members-b
145b434ba 488b5608 mov rdx, qword ptr [rsi + 8]
145b434be 4c8b4610 mov r8, qword ptr [rsi + 0x10]
145b434c2 488d4dc0 lea rcx, [rbp - 0x40]
145b434c6 e89502ffff call 0x145b33760
145b434cb 90 nop
145b434cc 84c0 test al, al
145b434ce 4189d9 mov r9d, ebx

; victory-members
145b43621 488d4dc0 lea rcx, [rbp - 0x40]
145b43625 488b5560 mov rdx, qword ptr [rbp + 0x60]
145b43629 4c8b4568 mov r8, qword ptr [rbp + 0x68]
145b4362d e82e01ffff call 0x145b33760
145b43632 90 nop
145b43633 83bda400000000 cmp dword ptr [rbp + 0xa4], 0
145b4363a 0f95c1 setne cl
145b4363d 84c0 test al, al
145b4363f 0f84cbf7ffff je 0x145b42e10
145b43645 208de6000000 and byte ptr [rbp + 0xe6], cl

; context-cached-vector
145b84fad 80ba850c000001 cmp byte ptr [rdx + 0xc85], 1
145b84fb4 7548 jne 0x145b84ffe
145b84fb6 4883ba9809000000 cmp qword ptr [rdx + 0x998], 0
145b84fbe 743e je 0x145b84ffe
145b84fc0 4c8bb2a00a0000 mov r14, qword ptr [rdx + 0xaa0]

; context-members-copy
145b85019 4989cf mov r15, rcx
145b8501c 488bba980a0000 mov rdi, qword ptr [rdx + 0xa98]
145b85023 4885f6 test rsi, rsi
145b85026 4989d4 mov r12, rdx
145b85029 0f84a0000000 je 0x145b850cf
145b8502f e8ccd147fa call 0x140002200
145b85034 bb04000000 mov ebx, 4
145b85039 ba04000000 mov edx, 4
145b8503e 4889f1 mov rcx, rsi
145b85041 e87ad147fa call 0x1400021c0
145b85046 4885c0 test rax, rax
145b85049 74a6 je 0x145b84ff1
145b8504b 4989c5 mov r13, rax
145b8504e 4c8975f8 mov qword ptr [rbp - 8], r14
145b85052 4c89e2 mov rdx, r12
145b85055 4d85f6 test r14, r14
145b85058 7411 je 0x145b8506b
145b8505a 4c89e9 mov rcx, r13
145b8505d 4889fa mov rdx, rdi
145b85060 4989f0 mov r8, rsi
145b85063 e873f14000 call 0x145f941db
145b85068 4c89e2 mov rdx, r12

; tick-member-admission
145b7d14c 498bbc2498090000 mov rdi, qword ptr [r12 + 0x998]
145b7d154 488d34fd08000000 lea rsi, [rdi*8 + 8]
145b7d15c e89f5048fa call 0x140002200
145b7d161 ba04000000 mov edx, 4
145b7d166 4889f1 mov rcx, rsi
145b7d169 e8525048fa call 0x1400021c0
145b7d16e 4885c0 test rax, rax
145b7d171 0f8489430000 je 0x145b81500
145b7d177 488d4f01 lea rcx, [rdi + 1]
145b7d17b 48894da0 mov qword ptr [rbp - 0x60], rcx
145b7d17f 488945a8 mov qword ptr [rbp - 0x58], rax
145b7d183 48c745b000000000 mov qword ptr [rbp - 0x50], 0
145b7d18b 4180bc24770c000000 cmp byte ptr [r12 + 0xc77], 0
145b7d194 0f8556030000 jne 0x145b7d4f0

; description-together
145b3e268 488d0d289ba901 lea rcx, [rip + 0x1a99b28]
145b3e26f be38000000 mov esi, 0x38
145b3e274 ba38000000 mov edx, 0x38
145b3e279 48898d380e0000 mov qword ptr [rbp + 0xe38], rcx
145b3e280 e82bb8feff call 0x145b29ab0
145b3e285 488995100e0000 mov qword ptr [rbp + 0xe10], rdx

; description-odds
145b3e42a 488d0d169ba901 lea rcx, [rip + 0x1a99b16]
145b3e431 be66000000 mov esi, 0x66
145b3e436 ba66000000 mov edx, 0x66
145b3e43b 48898d980d0000 mov qword ptr [rbp + 0xd98], rcx
145b3e442 e869b6feff call 0x145b29ab0
145b3e447 488995b00c0000 mov qword ptr [rbp + 0xcb0], rdx

; description-bump
145b3e556 488d0d199ba901 lea rcx, [rip + 0x1a99b19]
145b3e55d be4b000000 mov esi, 0x4b
145b3e562 ba4b000000 mov edx, 0x4b
145b3e567 48898de80c0000 mov qword ptr [rbp + 0xce8], rcx
145b3e56e e83db5feff call 0x145b29ab0
145b3e573 488995f00c0000 mov qword ptr [rbp + 0xcf0], rdx

; description-team
145b3e5ec 488d0d069ba901 lea rcx, [rip + 0x1a99b06]
145b3e5f3 be4d000000 mov esi, 0x4d
145b3e5f8 ba4d000000 mov edx, 0x4d
145b3e5fd 48898d080d0000 mov qword ptr [rbp + 0xd08], rcx
145b3e604 e8a7b4feff call 0x145b29ab0
145b3e609 488995100d0000 mov qword ptr [rbp + 0xd10], rdx

; description-dragonslayers
145b3e844 488d0d349ba901 lea rcx, [rip + 0x1a99b34]
145b3e84b be42000000 mov esi, 0x42
145b3e850 ba42000000 mov edx, 0x42
145b3e855 48898dd80b0000 mov qword ptr [rbp + 0xbd8], rcx
145b3e85c e84fb2feff call 0x145b29ab0
145b3e861 488995e00b0000 mov qword ptr [rbp + 0xbe0], rdx

; description-oldgods
145b3e95e 4c8d3d9a9ba901 lea r15, [rip + 0x1a99b9a]
145b3e965 bf62000000 mov edi, 0x62
145b3e96a ba62000000 mov edx, 0x62
145b3e96f 4c89f9 mov rcx, r15
145b3e972 e839b1feff call 0x145b29ab0
145b3e977 488995100c0000 mov qword ptr [rbp + 0xc10], rdx

; description-end
145b3e9b2 488d3de39ba901 lea rdi, [rip + 0x1a99be3]
145b3e9b9 41bc56000000 mov r12d, 0x56
145b3e9bf ba56000000 mov edx, 0x56
145b3e9c4 4889f9 mov rcx, rdi
145b3e9c7 e8e4b0feff call 0x145b29ab0
145b3e9cc 90 nop
