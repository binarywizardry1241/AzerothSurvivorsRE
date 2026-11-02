145f94210: 56 push rsi
145f94211: 57 push rdi
145f94212: 4883ec48 sub rsp, 0x48
145f94216: 4889ce mov rsi, rcx
145f94219: 488b11 mov rdx, qword ptr [rcx]
145f9421c: 488d0412 lea rax, [rdx + rdx]
145f94220: 4883f805 cmp rax, 5
145f94224: bf04000000 mov edi, 4
145f94229: 480f43f8 cmovae rdi, rax
145f9422d: 4c8b4108 mov r8, qword ptr [rcx + 8]
145f94231: 48c744242818000000 mov qword ptr [rsp + 0x28], 0x18
145f9423a: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
145f94243: 488d4c2430 lea rcx, [rsp + 0x30]
145f94248: 4989f9 mov r9, rdi
145f9424b: e8b0030000 call 0x145f94600
145f94250: 837c243001 cmp dword ptr [rsp + 0x30], 1
145f94255: 7413 je 0x145f9426a
145f94257: 488b442438 mov rax, qword ptr [rsp + 0x38]
145f9425c: 48894608 mov qword ptr [rsi + 8], rax
145f94260: 48893e mov qword ptr [rsi], rdi
145f94263: 4883c448 add rsp, 0x48
145f94267: 5f pop rdi
145f94268: 5e pop rsi
145f94269: c3 ret
145f9426a: 488b4c2438 mov rcx, qword ptr [rsp + 0x38]
145f9426f: 488b542440 mov rdx, qword ptr [rsp + 0x40]
145f94274: e8c26a1a00 call 0x14613ad3b
145f94279: 0f0b ud2
