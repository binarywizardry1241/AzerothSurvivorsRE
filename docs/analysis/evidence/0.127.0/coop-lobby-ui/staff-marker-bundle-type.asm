0x14002cc20: push rbp
0x14002cc21: push r15
0x14002cc23: push r14
0x14002cc25: push rsi
0x14002cc26: push rdi
0x14002cc27: push rbx
0x14002cc28: sub rsp, 0x88
0x14002cc2f: lea rbp, [rsp + 0x80]
0x14002cc37: mov qword ptr [rbp], 0xfffffffffffffffe
0x14002cc3f: mov rsi, rcx
0x14002cc42: mov rax, qword ptr [rcx + 0x18]
0x14002cc46: mov rcx, qword ptr [rcx + 0x20]
0x14002cc4a: movabs r9, 0x2e3026136b966c74
0x14002cc54: xor r10d, r10d
0x14002cc57: movdqa xmm0, xmmword ptr [rip + 0x6204e81]
0x14002cc5f: pcmpeqd xmm1, xmm1
0x14002cc63: movdqa xmm2, xmmword ptr [rip + 0x6204e85]
0x14002cc6b: and r9, rcx
0x14002cc6e: movdqu xmm3, xmmword ptr [rax + r9]
0x14002cc74: movdqa xmm4, xmm3
0x14002cc78: pcmpeqb xmm4, xmm0
0x14002cc7c: pmovmskb r11d, xmm4
0x14002cc81: test r11d, r11d
0x14002cc84: je 0x14002ccc0
0x14002cc86: tzcnt edi, r11d
0x14002cc8b: add rdi, r9
0x14002cc8e: and rdi, rcx
0x14002cc91: neg rdi
0x14002cc94: lea rdi, [rdi + rdi*2]
0x14002cc98: movdqu xmm4, xmmword ptr [rax + rdi*8 - 0x18]
0x14002cc9e: pcmpeqb xmm4, xmm2
0x14002cca2: pmovmskb ebx, xmm4
0x14002cca6: cmp ebx, 0xffff
0x14002ccac: je 0x14002ccdb
0x14002ccae: lea edi, [r11 - 1]
0x14002ccb2: and di, r11w
0x14002ccb6: mov r11d, edi
0x14002ccb9: jne 0x14002cc86
0x14002ccbb: nop dword ptr [rax + rax]
0x14002ccc0: pcmpeqb xmm3, xmm1
0x14002ccc4: pmovmskb r11d, xmm3
0x14002ccc9: test r11d, r11d
0x14002cccc: jne 0x14002cce8
0x14002ccce: add r9, r10
0x14002ccd1: add r9, 0x10
0x14002ccd5: add r10, 0x10
0x14002ccd9: jmp 0x14002cc6b
0x14002ccdb: lea rax, [rax + rdi*8]
0x14002ccdf: mov rdi, qword ptr [rax - 8]
0x14002cce3: jmp 0x14002ce43
0x14002cce8: mov rbx, r8
0x14002cceb: mov r15, rdx
0x14002ccee: mov rcx, rdx
0x14002ccf1: call 0x1402c6340
0x14002ccf6: test rax, rax
0x14002ccf9: je 0x14002cd2a
0x14002ccfb: mov rdi, rax
0x14002ccfe: mov r14, rdx
0x14002cd01: shl rdi, 3
0x14002cd05: call 0x140002200
0x14002cd0a: mov edx, 8
0x14002cd0f: mov rcx, rdi
0x14002cd12: call 0x1400021c0
0x14002cd17: test rax, rax
0x14002cd1a: je 0x14002cecf
0x14002cd20: mov qword ptr [rax], r14
0x14002cd23: mov ecx, 1
0x14002cd28: jmp 0x14002cd31
0x14002cd2a: mov eax, 8
0x14002cd2f: xor ecx, ecx
0x14002cd31: mov qword ptr [rbp - 0x18], rcx
0x14002cd35: mov qword ptr [rbp - 0x10], rax
0x14002cd39: mov qword ptr [rbp - 8], rcx
0x14002cd3d: mov rdi, qword ptr [rsi + 0x10]
0x14002cd41: mov rax, qword ptr [r15 + 0x18]
0x14002cd45: mov qword ptr [rsp + 0x30], rdi
0x14002cd4a: lea rcx, [rbp - 0x18]
0x14002cd4e: mov qword ptr [rsp + 0x28], rcx
0x14002cd53: mov qword ptr [rsp + 0x20], rax
0x14002cd58: lea rdx, [rip + 0x6206d18]
0x14002cd5f: lea rcx, [rbp - 0x40]
0x14002cd63: mov r8d, 0x2b
0x14002cd69: mov r9, rbx
0x14002cd6c: call 0x145097380
0x14002cd71: cmp rdi, qword ptr [rsi]
0x14002cd74: jne 0x14002cd7f
0x14002cd76: mov rcx, rsi
0x14002cd79: call 0x146061fc0
0x14002cd7e: nop 
0x14002cd7f: mov rax, qword ptr [rsi + 8]
0x14002cd83: lea rcx, [rdi + rdi*4]
0x14002cd87: mov rdx, qword ptr [rbp - 0x20]
0x14002cd8b: mov qword ptr [rax + rcx*8 + 0x20], rdx
0x14002cd90: movups xmm0, xmmword ptr [rbp - 0x40]
0x14002cd94: movdqu xmm1, xmmword ptr [rbp - 0x30]
0x14002cd99: movdqu xmmword ptr [rax + rcx*8 + 0x10], xmm1
0x14002cd9f: movups xmmword ptr [rax + rcx*8], xmm0
0x14002cda3: lea rax, [rdi + 1]
0x14002cda7: mov qword ptr [rsi + 0x10], rax
0x14002cdab: mov rbx, qword ptr [rsi + 0x18]
0x14002cdaf: mov r14, qword ptr [rsi + 0x20]
0x14002cdb3: movabs r15, 0x2e3026136b966c74
0x14002cdbd: mov rcx, r14
0x14002cdc0: and rcx, r15
0x14002cdc3: movdqu xmm0, xmmword ptr [rbx + rcx]
0x14002cdc8: pmovmskb eax, xmm0
0x14002cdcc: test eax, eax
0x14002cdce: je 0x14002ce56
0x14002cdd4: tzcnt eax, eax
0x14002cdd8: add rax, rcx
0x14002cddb: and rax, r14
0x14002cdde: movzx ecx, byte ptr [rbx + rax]
0x14002cde2: test cl, cl
0x14002cde4: jns 0x14002ce78
0x14002cdea: mov rdx, qword ptr [rsi + 0x28]
0x14002cdee: test rdx, rdx
0x14002cdf1: setne r8b
0x14002cdf5: and cl, 1
0x14002cdf8: sete r9b
0x14002cdfc: or r9b, r8b
0x14002cdff: je 0x14002ce8d
0x14002ce05: movzx ecx, cl
0x14002ce08: sub rdx, rcx
0x14002ce0b: mov qword ptr [rsi + 0x28], rdx
0x14002ce0f: lea rcx, [rax - 0x10]
0x14002ce13: and rcx, r14
0x14002ce16: mov byte ptr [rbx + rax], 0x17
0x14002ce1a: mov byte ptr [rbx + rcx + 0x10], 0x17
0x14002ce1f: inc qword ptr [rsi + 0x30]
0x14002ce23: neg rax
0x14002ce26: lea rax, [rax + rax*2]
0x14002ce2a: movabs rcx, 0xe5cc29c96b3ff14f
0x14002ce34: mov qword ptr [rbx + rax*8 - 0x18], rcx
0x14002ce39: mov qword ptr [rbx + rax*8 - 0x10], r15
0x14002ce3e: mov qword ptr [rbx + rax*8 - 8], rdi
0x14002ce43: mov rax, rdi
0x14002ce46: add rsp, 0x88
0x14002ce4d: pop rbx
0x14002ce4e: pop rdi
0x14002ce4f: pop rsi
0x14002ce50: pop r14
0x14002ce52: pop r15
0x14002ce54: pop rbp
0x14002ce55: ret 
0x14002ce56: mov edx, 0x10
0x14002ce5b: add rcx, rdx
0x14002ce5e: and rcx, r14
0x14002ce61: movdqu xmm0, xmmword ptr [rbx + rcx]
0x14002ce66: pmovmskb eax, xmm0
0x14002ce6a: add rdx, 0x10
0x14002ce6e: test eax, eax
0x14002ce70: jne 0x14002cdd4
0x14002ce76: jmp 0x14002ce5b
0x14002ce78: movdqa xmm0, xmmword ptr [rbx]
0x14002ce7c: pmovmskb eax, xmm0
0x14002ce80: tzcnt eax, eax
0x14002ce84: movzx ecx, byte ptr [rbx + rax]
0x14002ce88: jmp 0x14002cdea
0x14002ce8d: lea rcx, [rsi + 0x18]
0x14002ce91: lea r8, [rsi + 0x38]
0x14002ce95: mov edx, 1
0x14002ce9a: mov r9b, 1
0x14002ce9d: call 0x1461bb5e0
0x14002cea2: mov rbx, qword ptr [rsi + 0x18]
0x14002cea6: mov r14, qword ptr [rsi + 0x20]
0x14002ceaa: movabs r8, 0x2e3026136b966c74
0x14002ceb4: mov rcx, rbx
0x14002ceb7: mov rdx, r14
0x14002ceba: call 0x14006dd60
0x14002cebf: movzx ecx, byte ptr [rbx + rax]
0x14002cec3: mov rdx, qword ptr [rsi + 0x28]
0x14002cec7: and cl, 1
0x14002ceca: jmp 0x14002ce05
0x14002cecf: mov ecx, 8
0x14002ced4: mov rdx, rdi
0x14002ced7: call 0x14620896b
0x14002cedc: ud2 
