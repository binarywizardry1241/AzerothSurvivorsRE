1458eef30 55 push rbp
1458eef31 56 push rsi
1458eef32 57 push rdi
1458eef33 53 push rbx
1458eef34 4881ec98000000 sub rsp, 0x98
1458eef3b 488dac2480000000 lea rbp, [rsp + 0x80]
1458eef43 48c74510feffffff mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
1458eef4b 4c89ce mov rsi, r9
1458eef4e 4c89c7 mov rdi, r8
1458eef51 48894db0 mov qword ptr [rbp - 0x50], rcx
1458eef55 488955b8 mov qword ptr [rbp - 0x48], rdx
1458eef59 488d4de8 lea rcx, [rbp - 0x18]
1458eef5d e80e020000 call 0x1458ef170
1458eef62 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458eef66 4883f8ff cmp rax, -1
1458eef6a 0f8427010000 je 0x1458ef097
1458eef70 488945e0 mov qword ptr [rbp - 0x20], rax
1458eef74 488b55f0 mov rdx, qword ptr [rbp - 0x10]
1458eef78 488b5df8 mov rbx, qword ptr [rbp - 8]
1458eef7c c645e801 mov byte ptr [rbp - 0x18], 1
1458eef80 488d4de8 lea rcx, [rbp - 0x18]
1458eef84 488955d8 mov qword ptr [rbp - 0x28], rdx
1458eef88 4989d8 mov r8, rbx
1458eef8b e8b0f12b00 call 0x145bae140
1458eef90 90 nop
1458eef91 4885c0 test rax, rax
1458eef94 7427 je 0x1458eefbd
1458eef96 89c1 mov ecx, eax
1458eef98 83e103 and ecx, 3
1458eef9b 8d51fe lea edx, [rcx - 2]
1458eef9e 83fa02 cmp edx, 2
1458eefa1 721a jb 0x1458eefbd
1458eefa3 4885c9 test rcx, rcx
1458eefa6 7415 je 0x1458eefbd
1458eefa8 48ffc8 dec rax
1458eefab 488d4df0 lea rcx, [rbp - 0x10]
1458eefaf 488945f0 mov qword ptr [rbp - 0x10], rax
1458eefb3 c645e803 mov byte ptr [rbp - 0x18], 3
1458eefb7 e804082f00 call 0x145bdf7c0
1458eefbc 90 nop
1458eefbd 488d45b0 lea rax, [rbp - 0x50]
1458eefc1 488945e8 mov qword ptr [rbp - 0x18], rax
1458eefc5 488d05f43071fa lea rax, [rip - 0x58ecf0c]
1458eefcc 488945f0 mov qword ptr [rbp - 0x10], rax
1458eefd0 488d1596395e01 lea rdx, [rip + 0x15e3996]
1458eefd7 488d4dc0 lea rcx, [rbp - 0x40]
1458eefdb 4c8d45e8 lea r8, [rbp - 0x18]
1458eefdf e84cde2d00 call 0x145bcce30
1458eefe4 90 nop
1458eefe5 4c8b4dc8 mov r9, qword ptr [rbp - 0x38]
1458eefe9 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458eefed 4889442420 mov qword ptr [rsp + 0x20], rax
1458eeff2 488d4de8 lea rcx, [rbp - 0x18]
1458eeff6 488b55d8 mov rdx, qword ptr [rbp - 0x28]
1458eeffa 4989d8 mov r8, rbx
1458eeffd 4c894d08 mov qword ptr [rbp + 8], r9
1458ef001 e83a7d2b00 call 0x145ba6d40
1458ef006 90 nop
1458ef007 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458ef00b 4885d2 test rdx, rdx
1458ef00e 740f je 0x1458ef01f
1458ef010 41b801000000 mov r8d, 1
1458ef016 488b4d08 mov rcx, qword ptr [rbp + 8]
1458ef01a e8b13171fa call 0x1400021d0
1458ef01f 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1458ef023 488b55f8 mov rdx, qword ptr [rbp - 8]
1458ef027 48894d08 mov qword ptr [rbp + 8], rcx
1458ef02b 4989f8 mov r8, rdi
1458ef02e 4989f1 mov r9, rsi
1458ef031 e81ae72c00 call 0x145bbd750
1458ef036 90 nop
1458ef037 4889c6 mov rsi, rax
1458ef03a 488b55e8 mov rdx, qword ptr [rbp - 0x18]
1458ef03e 4885d2 test rdx, rdx
1458ef041 740f je 0x1458ef052
1458ef043 41b801000000 mov r8d, 1
1458ef049 488b4d08 mov rcx, qword ptr [rbp + 8]
1458ef04d e87e3171fa call 0x1400021d0
1458ef052 4885f6 test rsi, rsi
1458ef055 7427 je 0x1458ef07e
1458ef057 89f0 mov eax, esi
1458ef059 83e003 and eax, 3
1458ef05c 8d48fe lea ecx, [rax - 2]
1458ef05f 83f902 cmp ecx, 2
1458ef062 721a jb 0x1458ef07e
1458ef064 4885c0 test rax, rax
1458ef067 7415 je 0x1458ef07e
1458ef069 48ffce dec rsi
1458ef06c 488d4df0 lea rcx, [rbp - 0x10]
1458ef070 488975f0 mov qword ptr [rbp - 0x10], rsi
1458ef074 c645e803 mov byte ptr [rbp - 0x18], 3
1458ef078 e843072f00 call 0x145bdf7c0
1458ef07d 90 nop
1458ef07e 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458ef082 4885d2 test rdx, rdx
1458ef085 7410 je 0x1458ef097
1458ef087 41b801000000 mov r8d, 1
1458ef08d 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458ef091 e83a3171fa call 0x1400021d0
1458ef096 90 nop
1458ef097 4881c498000000 add rsp, 0x98
1458ef09e 5b pop rbx
1458ef09f 5f pop rdi
1458ef0a0 5e pop rsi
1458ef0a1 5d pop rbp
1458ef0a2 c3 ret
