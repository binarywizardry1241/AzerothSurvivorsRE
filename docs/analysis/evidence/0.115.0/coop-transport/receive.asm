0x1458addc0: push rbp
0x1458addc1: push r15
0x1458addc3: push r14
0x1458addc5: push r12
0x1458addc7: push rsi
0x1458addc8: push rdi
0x1458addc9: push rbx
0x1458addca: sub rsp, 0x40
0x1458addce: lea rbp, [rsp + 0x40]
0x1458addd3: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1458adddb: mov rdi, rdx
0x1458addde: mov rsi, rcx
0x1458adde1: mov rcx, rdx
0x1458adde4: call 0x1458ace80
0x1458adde9: mov rax, qword ptr [rdi + 0x10]
0x1458added: cmp rax, 3
0x1458addf1: jbe 0x1458ade12
0x1458addf3: mov r14, qword ptr [rdi + 8]
0x1458addf7: mov r15d, dword ptr [r14]
0x1458addfa: cmp r15, 0x100000
0x1458ade01: jbe 0x1458ade09
0x1458ade03: mov byte ptr [rdi + 0x38], 0
0x1458ade07: jmp 0x1458ade12
0x1458ade09: lea rbx, [r15 + 4]
0x1458ade0d: cmp rax, rbx
0x1458ade10: jae 0x1458ade2b
0x1458ade12: mov qword ptr [rsi], 0xffffffffffffffff
0x1458ade19: mov rax, rsi
0x1458ade1c: add rsp, 0x40
0x1458ade20: pop rbx
0x1458ade21: pop rdi
0x1458ade22: pop rsi
0x1458ade23: pop r12
0x1458ade25: pop r14
0x1458ade27: pop r15
0x1458ade29: pop rbp
0x1458ade2a: ret
0x1458ade2b: test r15d, r15d
0x1458ade2e: je 0x1458ade95
0x1458ade30: call 0x140002200
0x1458ade35: mov edx, 1
0x1458ade3a: mov rcx, r15
0x1458ade3d: call 0x1400021c0
0x1458ade42: test rax, rax
0x1458ade45: je 0x1458adec3
0x1458ade47: mov r12, rax
0x1458ade4a: add r14, 4
0x1458ade4e: mov rcx, rax
0x1458ade51: mov rdx, r14
0x1458ade54: mov r8, r15
0x1458ade57: call 0x145d145fb
0x1458ade5c: mov r8, qword ptr [rdi + 0x10]
0x1458ade60: mov r14, r8
0x1458ade63: sub r14, rbx
0x1458ade66: jb 0x1458adea7
0x1458ade68: mov qword ptr [rdi + 0x10], 0
0x1458ade70: je 0x1458ade88
0x1458ade72: mov rcx, qword ptr [rdi + 8]
0x1458ade76: add rbx, rcx
0x1458ade79: mov rdx, rbx
0x1458ade7c: mov r8, r14
0x1458ade7f: call 0x145d14607
0x1458ade84: mov qword ptr [rdi + 0x10], r14
0x1458ade88: mov qword ptr [rsi], r15
0x1458ade8b: mov qword ptr [rsi + 8], r12
0x1458ade8f: mov qword ptr [rsi + 0x10], r15
0x1458ade93: jmp 0x1458ade19
0x1458ade95: mov r12d, 1
0x1458ade9b: mov r8, qword ptr [rdi + 0x10]
0x1458ade9f: mov r14, r8
0x1458adea2: sub r14, rbx
0x1458adea5: jae 0x1458ade68
0x1458adea7: mov qword ptr [rbp - 0x18], r12
0x1458adeab: mov qword ptr [rbp - 0x10], r15
0x1458adeaf: lea r9, [rip + 0x1a8be8a]
0x1458adeb6: xor ecx, ecx
0x1458adeb8: mov rdx, rbx
0x1458adebb: call 0x145eb7570
0x1458adec0: nop
0x1458adec1: ud2
0x1458adec3: mov ecx, 1
0x1458adec8: mov rdx, r15
0x1458adecb: call 0x145eb6fcb
0x1458aded0: ud2
