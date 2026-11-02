1401371f4: 488b4210 mov rax, qword ptr [rdx + 0x10]
1401371f8: 48898588000000 mov qword ptr [rbp + 0x88], rax
1401371ff: 4885c0 test rax, rax
140137202: 0f841c040000 je 0x140137624
140137208: 0fb6422c movzx eax, byte ptr [rdx + 0x2c]
14013720c: 4c8d05e19b0406 lea r8, [rip + 0x6049be1]
140137213: 49630480 movsxd rax, dword ptr [r8 + rax*4]
140137217: 4c01c0 add rax, r8
14013721a: ffe0 jmp rax
