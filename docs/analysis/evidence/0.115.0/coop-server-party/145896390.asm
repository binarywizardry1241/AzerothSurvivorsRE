145896390 push rbp
145896391 push r15
145896393 push r14
145896395 push r13
145896397 push r12
145896399 push rsi
14589639a push rdi
14589639b push rbx
14589639c sub rsp, 0x918
1458963a3 lea rbp, [rsp + 0x80]
1458963ab mov qword ptr [rbp + 0x890], 0xfffffffffffffffe
1458963b6 cmp dword ptr [rcx + 0xc58], 3
1458963bd jne 0x1458964b2
1458963c3 mov rdi, rdx
1458963c6 mov rsi, rcx
1458963c9 mov rbx, qword ptr [rcx + 0xc98]
1458963d0 cmp rdx, rbx
1458963d3 jae 0x1458964c6
1458963d9 mov r12, qword ptr [rsi + 0xc90]
1458963e0 imul r13, rdi, 0x478
1458963e7 lea r14, [r12 + r13]
1458963eb mov r15, qword ptr [r12 + r13]
1458963ef lea rdx, [r12 + r13]
1458963f3 add rdx, 8
1458963f7 lea rcx, [rbp - 0x58]
1458963fb mov r8d, 0x470
145896401 call 0x145d145fb
145896406 lea rdx, [r12 + r13]
14589640a add rdx, 0x478
145896411 mov rax, rdi
145896414 not rax
145896417 add rax, rbx
14589641a imul r8, rax, 0x478
145896421 mov rcx, r14
145896424 call 0x145d14607
145896429 dec rbx
14589642c mov qword ptr [rsi + 0xc98], rbx
145896433 cmp r15, 2
145896437 je 0x1458964c6
14589643d mov qword ptr [rbp + 0x418], r15
145896444 lea rcx, [rbp + 0x420]
14589644b lea rdx, [rbp - 0x58]
14589644f mov r8d, 0x470
145896455 call 0x145d145fb
14589645a cmp dword ptr [rsi + 0x10], 2
14589645e setne al
145896461 test al, r15b
145896464 je 0x145896477
145896466 lea rcx, [rsi + 0x10]
14589646a mov rdx, qword ptr [rbp + 0x420]
145896471 call 0x1459011a0
145896476 nop
145896477 mov rcx, rsi
14589647a call 0x145892b40
14589647f nop
145896480 mov qword ptr [rsp + 0x20], 0
145896489 lea rdx, [rip + 0x17970d0]
145896490 mov r8d, 4
145896496 mov r9d, 1
14589649c mov rcx, rsi
14589649f call 0x145893140
1458964a4 nop
1458964a5 lea rcx, [rbp + 0x418]
1458964ac call 0x145871b60
1458964b1 nop
1458964b2 add rsp, 0x918
1458964b9 pop rbx
1458964ba pop rdi
1458964bb pop rsi
1458964bc pop r12
1458964be pop r13
1458964c0 pop r14
1458964c2 pop r15
1458964c4 pop rbp
1458964c5 ret
1458964c6 lea r8, [rip + 0x179711b]
1458964cd mov rcx, rdi
1458964d0 mov rdx, rbx
1458964d3 call 0x145eb709b
1458964d8 ud2
