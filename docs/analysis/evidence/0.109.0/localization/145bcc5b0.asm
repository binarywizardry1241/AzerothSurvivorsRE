; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145bcc5b0..0x145bcc629 SHA256 39fe79165544d241cb2156f5b873bf56367e65f59a67ff15ebd40076fe6de318
0x145bcc5b0: push rbp
0x145bcc5b1: push r14
0x145bcc5b3: push rsi
0x145bcc5b4: push rdi
0x145bcc5b5: push rbx
0x145bcc5b6: sub rsp, 0x20
0x145bcc5ba: lea rbp, [rsp + 0x20]
0x145bcc5bf: mov rsi, r8
0x145bcc5c2: mov rdi, rcx
0x145bcc5c5: test r8, r8
0x145bcc5c8: je 0x145bcc5f7
0x145bcc5ca: mov rbx, rdx
0x145bcc5cd: call 0x140002200
0x145bcc5d2: mov edx, 1
0x145bcc5d7: mov rcx, rsi
0x145bcc5da: call 0x1400021c0
0x145bcc5df: test rax, rax
0x145bcc5e2: je 0x145bcc61a
0x145bcc5e4: mov r14, rax
0x145bcc5e7: mov rcx, rax
0x145bcc5ea: mov rdx, rbx
0x145bcc5ed: mov r8, rsi
0x145bcc5f0: call 0x145bfa0e7
0x145bcc5f5: jmp 0x145bcc5fd
0x145bcc5f7: mov r14d, 1
0x145bcc5fd: mov qword ptr [rdi], rsi
0x145bcc600: mov qword ptr [rdi + 8], r14
0x145bcc604: mov qword ptr [rdi + 0x10], rsi
0x145bcc608: mov byte ptr [rdi + 0x18], 0
0x145bcc60c: mov rax, rdi
0x145bcc60f: add rsp, 0x20
0x145bcc613: pop rbx
0x145bcc614: pop rdi
0x145bcc615: pop rsi
0x145bcc616: pop r14
0x145bcc618: pop rbp
0x145bcc619: ret
0x145bcc61a: mov ecx, 1
0x145bcc61f: mov rdx, rsi
0x145bcc622: call 0x145d992bb
0x145bcc627: ud2
