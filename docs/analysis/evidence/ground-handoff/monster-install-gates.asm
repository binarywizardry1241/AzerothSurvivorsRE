141188d94: test dword ptr [rbp + 0x5b4], 0x1000
141188d9e: jne 0x141188eba
141188da4: mov rax, qword ptr [rdi]
141188da7: sub rax, rdx
141188daa: cmp rax, 0x17
141188dae: jbe 0x14118909c
141188db4: movzx edx, byte ptr [rbp + 0x616]
141188dbb: xor dl, 1
141188dbe: mov rax, qword ptr [rdi + 8]
141188dc2: lea rcx, [rip - 0x81d469]
141188dc9: mov qword ptr [rax + r14 + 0x18], rcx
141188dce: mov rcx, qword ptr [rbp + 0x600]
141188dd5: mov qword ptr [rax + r14 + 0x20], rcx
141188dda: mov qword ptr [rax + r14 + 0x28], rbx
141188ddf: add r14, 0x30
141188de3: mov qword ptr [rdi + 0x10], r14
141188de7: cmp dword ptr [rbp + 0x5fc], 0
141188dee: setne al
141188df1: test al, dl
141188df3: je 0x141188e03
141188df5: cmp qword ptr [rbp + 0x548], 2
141188dfd: jae 0x141188f24
