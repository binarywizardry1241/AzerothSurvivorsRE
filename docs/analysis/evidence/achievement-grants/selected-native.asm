; feat-grant: 0x1459b5e40..0x1459b63a6
1459b5e40: 55  push rbp
1459b5e41: 4157  push r15
1459b5e43: 4156  push r14
1459b5e45: 4155  push r13
1459b5e47: 4154  push r12
1459b5e49: 56  push rsi
1459b5e4a: 57  push rdi
1459b5e4b: 53  push rbx
1459b5e4c: 4881ec18010000  sub rsp, 0x118
1459b5e53: 488dac2480000000  lea rbp, [rsp + 0x80]
1459b5e5b: 0f29b580000000  movaps xmmword ptr [rbp + 0x80], xmm6
1459b5e62: 48c74578feffffff  mov qword ptr [rbp + 0x78], 0xfffffffffffffffe
1459b5e6a: 4c89c3  mov rbx, r8
1459b5e6d: 4889d6  mov rsi, rdx
1459b5e70: 48894d20  mov qword ptr [rbp + 0x20], rcx
1459b5e74: 48c7455000000000  mov qword ptr [rbp + 0x50], 0
1459b5e7c: 48c7455808000000  mov qword ptr [rbp + 0x58], 8
1459b5e84: 48c7456000000000  mov qword ptr [rbp + 0x60], 0
1459b5e8c: 488b0545726e02  mov rax, qword ptr [rip + 0x26e7245]
1459b5e93: 4883f80d  cmp rax, 0xd
1459b5e97: b90d000000  mov ecx, 0xd
1459b5e9c: 480f42c8  cmovb rcx, rax
1459b5ea0: c1e105  shl ecx, 5
1459b5ea3: 488d05e6476e02  lea rax, [rip + 0x26e47e6]
1459b5eaa: 4c8d3408  lea r14, [rax + rcx]
1459b5eae: 8b440118  mov eax, dword ptr [rcx + rax + 0x18]
1459b5eb2: 85c0  test eax, eax
1459b5eb4: 0f85de040000  jne 0x1459b6398
1459b5eba: 4d6b7e1070  imul r15, qword ptr [r14 + 0x10], 0x70
1459b5ebf: 4d8b7608  mov r14, qword ptr [r14 + 8]
1459b5ec3: 4d01f7  add r15, r14
1459b5ec6: 488b4b38  mov rcx, qword ptr [rbx + 0x38]
1459b5eca: 488b4340  mov rax, qword ptr [rbx + 0x40]
1459b5ece: 48baf0ffffffffffff1f  movabs rdx, 0x1ffffffffffffff0
1459b5ed8: 4821c2  and rdx, rax
1459b5edb: 4189c0  mov r8d, eax
1459b5ede: 4183e00f  and r8d, 0xf
1459b5ee2: 4c8b6320  mov r12, qword ptr [rbx + 0x20]
1459b5ee6: 488b4328  mov rax, qword ptr [rbx + 0x28]
1459b5eea: 48894528  mov qword ptr [rbp + 0x28], rax
1459b5eee: 488d048500000000  lea rax, [rax*4]
1459b5ef6: 488d0440  lea rax, [rax + rax*2]
1459b5efa: 488945d0  mov qword ptr [rbp - 0x30], rax
1459b5efe: 488b4308  mov rax, qword ptr [rbx + 8]
1459b5f02: 48894508  mov qword ptr [rbp + 8], rax
1459b5f06: 488b4310  mov rax, qword ptr [rbx + 0x10]
1459b5f0a: 440fb64b58  movzx r9d, byte ptr [rbx + 0x58]
1459b5f0f: 44884d77  mov byte ptr [rbp + 0x77], r9b
1459b5f13: 440fb64b5a  movzx r9d, byte ptr [rbx + 0x5a]
1459b5f18: 44884d72  mov byte ptr [rbp + 0x72], r9b
1459b5f1c: 837b5400  cmp dword ptr [rbx + 0x54], 0
1459b5f20: 0f944573  sete byte ptr [rbp + 0x73]
1459b5f24: 440fb64b59  movzx r9d, byte ptr [rbx + 0x59]
1459b5f29: 44884d74  mov byte ptr [rbp + 0x74], r9b
1459b5f2d: f30f107348  movss xmm6, dword ptr [rbx + 0x48]
1459b5f32: f30f1005da958801  movss xmm0, dword ptr [rip + 0x18895da]
1459b5f3a: 0f2ec6  ucomiss xmm0, xmm6
1459b5f3d: 448b4b50  mov r9d, dword ptr [rbx + 0x50]
1459b5f41: 44894d48  mov dword ptr [rbp + 0x48], r9d
1459b5f45: 448b4b4c  mov r9d, dword ptr [rbx + 0x4c]
1459b5f49: 44894d4c  mov dword ptr [rbp + 0x4c], r9d
1459b5f4d: 0f934575  setae byte ptr [rbp + 0x75]
1459b5f51: 41c1e002  shl r8d, 2
1459b5f55: 4c894500  mov qword ptr [rbp], r8
1459b5f59: 48c1e003  shl rax, 3
1459b5f5d: 48894510  mov qword ptr [rbp + 0x10], rax
1459b5f61: 48894df0  mov qword ptr [rbp - 0x10], rcx
1459b5f65: 488955f8  mov qword ptr [rbp - 8], rdx
1459b5f69: 488d0491  lea rax, [rcx + rdx*4]
1459b5f6d: 48894518  mov qword ptr [rbp + 0x18], rax
1459b5f71: 488975d8  mov qword ptr [rbp - 0x28], rsi
1459b5f75: 4c897de0  mov qword ptr [rbp - 0x20], r15
1459b5f79: 4c8965e8  mov qword ptr [rbp - 0x18], r12
1459b5f7d: eb11  jmp 0x1459b5f90
1459b5f7f: 488b4558  mov rax, qword ptr [rbp + 0x58]
1459b5f83: 48891cf8  mov qword ptr [rax + rdi*8], rbx
1459b5f87: 48ffc7  inc rdi
1459b5f8a: 48897d60  mov qword ptr [rbp + 0x60], rdi
1459b5f8e: 6690  nop
1459b5f90: 4d39fe  cmp r14, r15
1459b5f93: 0f84d1030000  je 0x1459b636a
1459b5f99: 4d89f3  mov r11, r14
1459b5f9c: 4983c670  add r14, 0x70
1459b5fa0: 41807b4809  cmp byte ptr [r11 + 0x48], 9
1459b5fa5: 75e9  jne 0x1459b5f90
1459b5fa7: 410fb6534c  movzx edx, byte ptr [r11 + 0x4c]
1459b5fac: 410fb7434d  movzx eax, word ptr [r11 + 0x4d]
1459b5fb1: 894568  mov dword ptr [rbp + 0x68], eax
1459b5fb4: 410fb6434f  movzx eax, byte ptr [r11 + 0x4f]
1459b5fb9: 894544  mov dword ptr [rbp + 0x44], eax
1459b5fbc: 418b4350  mov eax, dword ptr [r11 + 0x50]
1459b5fc0: 89456c  mov dword ptr [rbp + 0x6c], eax
1459b5fc3: 458b5354  mov r10d, dword ptr [r11 + 0x54]
1459b5fc7: 498b7b08  mov rdi, qword ptr [r11 + 8]
1459b5fcb: 4d8b6b10  mov r13, qword ptr [r11 + 0x10]
1459b5fcf: 488b9eb8000000  mov rbx, qword ptr [rsi + 0xb8]
1459b5fd6: 4885db  test rbx, rbx
1459b5fd9: 0f84c7000000  je 0x1459b60a6
1459b5fdf: 4c89e8  mov rax, r13
1459b5fe2: 4989fd  mov r13, rdi
1459b5fe5: 4c895dc8  mov qword ptr [rbp - 0x38], r11
1459b5fe9: 488bbeb0000000  mov rdi, qword ptr [rsi + 0xb0]
1459b5ff0: 4883fb01  cmp rbx, 1
1459b5ff4: 44895540  mov dword ptr [rbp + 0x40], r10d
1459b5ff8: 885576  mov byte ptr [rbp + 0x76], dl
1459b5ffb: 4c896d38  mov qword ptr [rbp + 0x38], r13
1459b5fff: 7508  jne 0x1459b6009
1459b6001: 4531ff  xor r15d, r15d
1459b6004: 4989c5  mov r13, rax
1459b6007: eb4c  jmp 0x1459b6055
1459b6009: 4531ff  xor r15d, r15d
1459b600c: 4989c5  mov r13, rax
1459b600f: 90  nop
1459b6010: 4d89fe  mov r14, r15
1459b6013: 4989dc  mov r12, rbx
1459b6016: 49d1ec  shr r12, 1
1459b6019: 4d01e7  add r15, r12
1459b601c: 4b8d047f  lea rax, [r15 + r15*2]
1459b6020: 488b4cc708  mov rcx, qword ptr [rdi + rax*8 + 8]
1459b6025: 4c8b44c710  mov r8, qword ptr [rdi + rax*8 + 0x10]
1459b602a: 4c89c6  mov rsi, r8
1459b602d: 4c29ee  sub rsi, r13
1459b6030: 4d0f43c5  cmovae r8, r13
1459b6034: 488b5538  mov rdx, qword ptr [rbp + 0x38]
1459b6038: e8aa432500  call 0x145c0a3e7
1459b603d: 4898  cdqe
1459b603f: 85c0  test eax, eax
1459b6041: 480f45f0  cmovne rsi, rax
1459b6045: 4885f6  test rsi, rsi
1459b6048: 4d0f4ffe  cmovg r15, r14
1459b604c: 4c29e3  sub rbx, r12
1459b604f: 4883fb01  cmp rbx, 1
1459b6053: 77bb  ja 0x1459b6010
1459b6055: 4b8d047f  lea rax, [r15 + r15*2]
1459b6059: 488b4cc708  mov rcx, qword ptr [rdi + rax*8 + 8]
1459b605e: 4c8b44c710  mov r8, qword ptr [rdi + rax*8 + 0x10]
1459b6063: 4c89c6  mov rsi, r8
1459b6066: 4c29ee  sub rsi, r13
1459b6069: 4d0f43c5  cmovae r8, r13
1459b606d: 488b7d38  mov rdi, qword ptr [rbp + 0x38]
1459b6071: 4889fa  mov rdx, rdi
1459b6074: e86e432500  call 0x145c0a3e7
1459b6079: 4898  cdqe
1459b607b: 85c0  test eax, eax
1459b607d: 480f45f0  cmovne rsi, rax
1459b6081: 4885f6  test rsi, rsi
1459b6084: 488b75d8  mov rsi, qword ptr [rbp - 0x28]
1459b6088: 4c8b7de0  mov r15, qword ptr [rbp - 0x20]
1459b608c: 4c8b5dc8  mov r11, qword ptr [rbp - 0x38]
1459b6090: 4d8d7370  lea r14, [r11 + 0x70]
1459b6094: 4c8b65e8  mov r12, qword ptr [rbp - 0x18]
1459b6098: 448b5540  mov r10d, dword ptr [rbp + 0x40]
1459b609c: 0fb65576  movzx edx, byte ptr [rbp + 0x76]
1459b60a0: 0f84eafeffff  je 0x1459b5f90
1459b60a6: 89d0  mov eax, edx
1459b60a8: 2c08  sub al, 8
1459b60aa: 0fb6c0  movzx eax, al
1459b60ad: b907000000  mov ecx, 7
1459b60b2: 0f42c1  cmovb eax, ecx
1459b60b5: 0fb6c0  movzx eax, al
1459b60b8: 488d0d65d48801  lea rcx, [rip + 0x188d465]
1459b60bf: 48630481  movsxd rax, dword ptr [rcx + rax*4]
1459b60c3: 4801c8  add rax, rcx
1459b60c6: ffe0  jmp rax
1459b60c8: 8b456c  mov eax, dword ptr [rbp + 0x6c]
1459b60cb: 39454c  cmp dword ptr [rbp + 0x4c], eax
1459b60ce: 0f93c0  setae al
1459b60d1: e91e010000  jmp 0x1459b61f4
1459b60d6: 0fb64573  movzx eax, byte ptr [rbp + 0x73]
1459b60da: 807d7700  cmp byte ptr [rbp + 0x77], 0
1459b60de: 0f84acfeffff  je 0x1459b5f90
1459b60e4: e90b010000  jmp 0x1459b61f4
1459b60e9: 807d7700  cmp byte ptr [rbp + 0x77], 0
1459b60ed: 0f849dfeffff  je 0x1459b5f90
1459b60f3: 8b456c  mov eax, dword ptr [rbp + 0x6c]
1459b60f6: 0f57c0  xorps xmm0, xmm0
1459b60f9: f3480f2ac0  cvtsi2ss xmm0, rax
1459b60fe: 0f2ef0  ucomiss xmm6, xmm0
1459b6101: 0f93c0  setae al
1459b6104: e9eb000000  jmp 0x1459b61f4
1459b6109: 0fb64574  movzx eax, byte ptr [rbp + 0x74]
1459b610d: 807d7700  cmp byte ptr [rbp + 0x77], 0
1459b6111: 0f8479feffff  je 0x1459b5f90
1459b6117: e9d8000000  jmp 0x1459b61f4
1459b611c: 4489d3  mov ebx, r10d
1459b611f: 885576  mov byte ptr [rbp + 0x76], dl
1459b6122: 80fa07  cmp dl, 7
1459b6125: 488b55f0  mov rdx, qword ptr [rbp - 0x10]
1459b6129: 4c8b45f8  mov r8, qword ptr [rbp - 8]
1459b612d: 4c8b4d00  mov r9, qword ptr [rbp]
1459b6131: 4c8b5518  mov r10, qword ptr [rbp + 0x18]
1459b6135: 0f8549010000  jne 0x1459b6284
1459b613b: 660f6ec3  movd xmm0, ebx
1459b613f: 660f70c000  pshufd xmm0, xmm0, 0
1459b6144: 31c0  xor eax, eax
1459b6146: 662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b6150: 4939c0  cmp r8, rax
1459b6153: 0f8411010000  je 0x1459b626a
1459b6159: f30f6f0c82  movdqu xmm1, xmmword ptr [rdx + rax*4]
1459b615e: f30f6f548210  movdqu xmm2, xmmword ptr [rdx + rax*4 + 0x10]
1459b6164: f30f6f5c8220  movdqu xmm3, xmmword ptr [rdx + rax*4 + 0x20]
1459b616a: f30f6f648230  movdqu xmm4, xmmword ptr [rdx + rax*4 + 0x30]
1459b6170: 660f76d0  pcmpeqd xmm2, xmm0
1459b6174: 660f76c8  pcmpeqd xmm1, xmm0
1459b6178: 660f6bca  packssdw xmm1, xmm2
1459b617c: 660f76d8  pcmpeqd xmm3, xmm0
1459b6180: 660f76e0  pcmpeqd xmm4, xmm0
1459b6184: 660f6bdc  packssdw xmm3, xmm4
1459b6188: 660f63cb  packsswb xmm1, xmm3
1459b618c: 660fd7c9  pmovmskb ecx, xmm1
1459b6190: 4883c010  add rax, 0x10
1459b6194: 85c9  test ecx, ecx
1459b6196: 74b8  je 0x1459b6150
1459b6198: e9f3fdffff  jmp 0x1459b5f90
1459b619d: 0fb64575  movzx eax, byte ptr [rbp + 0x75]
1459b61a1: 837d4803  cmp dword ptr [rbp + 0x48], 3
1459b61a5: 0f86e5fdffff  jbe 0x1459b5f90
1459b61ab: eb47  jmp 0x1459b61f4
1459b61ad: 0fb64572  movzx eax, byte ptr [rbp + 0x72]
1459b61b1: 807d7700  cmp byte ptr [rbp + 0x77], 0
1459b61b5: 0f84d5fdffff  je 0x1459b5f90
1459b61bb: eb37  jmp 0x1459b61f4
1459b61bd: 488b4d10  mov rcx, qword ptr [rbp + 0x10]
1459b61c1: 488b5508  mov rdx, qword ptr [rbp + 8]
1459b61c5: 448b4d6c  mov r9d, dword ptr [rbp + 0x6c]
1459b61c9: 0f1f8000000000  nop dword ptr [rax]
1459b61d0: 4889c8  mov rax, rcx
1459b61d3: 4885c9  test rcx, rcx
1459b61d6: 7416  je 0x1459b61ee
1459b61d8: 4989d0  mov r8, rdx
1459b61db: 4883c208  add rdx, 8
1459b61df: 488d48f8  lea rcx, [rax - 8]
1459b61e3: 453908  cmp dword ptr [r8], r9d
1459b61e6: 75e8  jne 0x1459b61d0
1459b61e8: 45395004  cmp dword ptr [r8 + 4], r10d
1459b61ec: 75e2  jne 0x1459b61d0
1459b61ee: 4885c0  test rax, rax
1459b61f1: 0f95c0  setne al
1459b61f4: 84c0  test al, al
1459b61f6: 0f8494fdffff  je 0x1459b5f90
1459b61fc: 4c89db  mov rbx, r11
1459b61ff: e8ec1f2000  call 0x145bb81f0
1459b6204: 90  nop
1459b6205: 894530  mov dword ptr [rbp + 0x30], eax
1459b6208: 895534  mov dword ptr [rbp + 0x34], edx
1459b620b: 488d4db0  lea rcx, [rbp - 0x50]
1459b620f: 488d5530  lea rdx, [rbp + 0x30]
1459b6213: 41b800803ed5  mov r8d, 0xd53e8000
1459b6219: 41b9deb19d01  mov r9d, 0x19db1de
1459b621f: e87c1f2000  call 0x145bb81a0
1459b6224: 90  nop
1459b6225: 807db000  cmp byte ptr [rbp - 0x50], 0
1459b6229: 7506  jne 0x1459b6231
1459b622b: 488b45b8  mov rax, qword ptr [rbp - 0x48]
1459b622f: eb02  jmp 0x1459b6233
1459b6231: 31c0  xor eax, eax
1459b6233: 4889442420  mov qword ptr [rsp + 0x20], rax
1459b6238: 41b901000000  mov r9d, 1
1459b623e: 4889f1  mov rcx, rsi
1459b6241: 4889fa  mov rdx, rdi
1459b6244: 4d89e8  mov r8, r13
1459b6247: e8b4bcf1ff  call 0x1458d1f00
1459b624c: 90  nop
1459b624d: 488b7d60  mov rdi, qword ptr [rbp + 0x60]
1459b6251: 483b7d50  cmp rdi, qword ptr [rbp + 0x50]
1459b6255: 0f8524fdffff  jne 0x1459b5f7f
1459b625b: 488d4d50  lea rcx, [rbp + 0x50]
1459b625f: e8cc762500  call 0x145c0d930
1459b6264: 90  nop
1459b6265: e915fdffff  jmp 0x1459b5f7f
1459b626a: 31c0  xor eax, eax
1459b626c: 0f1f4000  nop dword ptr [rax]
1459b6270: 4939c1  cmp r9, rax
1459b6273: 740f  je 0x1459b6284
1459b6275: 41391c02  cmp dword ptr [r10 + rax], ebx
1459b6279: 488d4004  lea rax, [rax + 4]
1459b627d: 75f1  jne 0x1459b6270
1459b627f: e90cfdffff  jmp 0x1459b5f90
1459b6284: 48837d2800  cmp qword ptr [rbp + 0x28], 0
1459b6289: 0fb64576  movzx eax, byte ptr [rbp + 0x76]
1459b628d: 0f84fdfcffff  je 0x1459b5f90
1459b6293: 4189da  mov r10d, ebx
1459b6296: 0fb6c0  movzx eax, al
1459b6299: 8b4d44  mov ecx, dword ptr [rbp + 0x44]
1459b629c: c1e110  shl ecx, 0x10
1459b629f: 014d68  add dword ptr [rbp + 0x68], ecx
1459b62a2: 89c0  mov eax, eax
1459b62a4: 31c9  xor ecx, ecx
1459b62a6: eb26  jmp 0x1459b62ce
1459b62a8: 8b5568  mov edx, dword ptr [rbp + 0x68]
1459b62ab: 4138540c08  cmp byte ptr [r12 + rcx + 8], dl
1459b62b0: 0f8446ffffff  je 0x1459b61fc
1459b62b6: 662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b62c0: 4883c10c  add rcx, 0xc
1459b62c4: 48394dd0  cmp qword ptr [rbp - 0x30], rcx
1459b62c8: 0f84c2fcffff  je 0x1459b5f90
1459b62ce: 4539140c  cmp dword ptr [r12 + rcx], r10d
1459b62d2: 75ec  jne 0x1459b62c0
1459b62d4: 410fb6540c09  movzx edx, byte ptr [r12 + rcx + 9]
1459b62da: 4c8d0d63d28801  lea r9, [rip + 0x188d263]
1459b62e1: 4d630481  movsxd r8, dword ptr [r9 + rax*4]
1459b62e5: 4d01c8  add r8, r9
1459b62e8: 41ffe0  jmp r8
1459b62eb: 80fa02  cmp dl, 2
1459b62ee: 74d0  je 0x1459b62c0
1459b62f0: 8b556c  mov edx, dword ptr [rbp + 0x6c]
1459b62f3: 4139540c04  cmp dword ptr [r12 + rcx + 4], edx
1459b62f8: 75c6  jne 0x1459b62c0
1459b62fa: e9fdfeffff  jmp 0x1459b61fc
1459b62ff: 80fa02  cmp dl, 2
1459b6302: 75bc  jne 0x1459b62c0
1459b6304: e9f3feffff  jmp 0x1459b61fc
1459b6309: 80fa02  cmp dl, 2
1459b630c: 74b2  je 0x1459b62c0
1459b630e: 41837c0c0400  cmp dword ptr [r12 + rcx + 4], 0
1459b6314: 7592  jne 0x1459b62a8
1459b6316: eba8  jmp 0x1459b62c0
1459b6318: 80fa01  cmp dl, 1
1459b631b: 75a3  jne 0x1459b62c0
1459b631d: 41807c0c0800  cmp byte ptr [r12 + rcx + 8], 0
1459b6323: 759b  jne 0x1459b62c0
1459b6325: e9d2feffff  jmp 0x1459b61fc
1459b632a: 41807c0c0a00  cmp byte ptr [r12 + rcx + 0xa], 0
1459b6330: 748e  je 0x1459b62c0
1459b6332: e9c5feffff  jmp 0x1459b61fc
1459b6337: 80fa02  cmp dl, 2
1459b633a: 7484  je 0x1459b62c0
1459b633c: 418b540c04  mov edx, dword ptr [r12 + rcx + 4]
1459b6341: 81fa44010000  cmp edx, 0x144
1459b6347: 0f84affeffff  je 0x1459b61fc
1459b634d: 81fad3010000  cmp edx, 0x1d3
1459b6353: 0f84a3feffff  je 0x1459b61fc
1459b6359: 81fabd510000  cmp edx, 0x51bd
1459b635f: 0f855bffffff  jne 0x1459b62c0
1459b6365: e992feffff  jmp 0x1459b61fc
1459b636a: 488b4d60  mov rcx, qword ptr [rbp + 0x60]
1459b636e: 488b4520  mov rax, qword ptr [rbp + 0x20]
1459b6372: 48894810  mov qword ptr [rax + 0x10], rcx
1459b6376: 0f104550  movups xmm0, xmmword ptr [rbp + 0x50]
1459b637a: 0f1100  movups xmmword ptr [rax], xmm0
1459b637d: 0f28b580000000  movaps xmm6, xmmword ptr [rbp + 0x80]
1459b6384: 4881c418010000  add rsp, 0x118
1459b638b: 5b  pop rbx
1459b638c: 5f  pop rdi
1459b638d: 5e  pop rsi
1459b638e: 415c  pop r12
1459b6390: 415d  pop r13
1459b6392: 415e  pop r14
1459b6394: 415f  pop r15
1459b6396: 5d  pop rbp
1459b6397: c3  ret
1459b6398: 4c89f1  mov rcx, r14
1459b639b: e88a813d00  call 0x145d8e52a
1459b63a0: 90  nop
1459b63a1: e914fbffff  jmp 0x1459b5eba

; utc-duration: 0x145bb81a0..0x145bb81f0
145bb81a0: 488b02  mov rax, qword ptr [rdx]
145bb81a3: 4589c0  mov r8d, r8d
145bb81a6: 49c1e120  shl r9, 0x20
145bb81aa: 4d09c8  or r8, r9
145bb81ad: 4531c9  xor r9d, r9d
145bb81b0: 4889c2  mov rdx, rax
145bb81b3: 4c29c2  sub rdx, r8
145bb81b6: 410f9cc1  setl r9b
145bb81ba: 4929c0  sub r8, rax
145bb81bd: 4c0f4cc2  cmovl r8, rdx
145bb81c1: 48babd427ae5d594bfd6  movabs rdx, 0xd6bf94d5e57a42bd
145bb81cb: 4c89c0  mov rax, r8
145bb81ce: 48f7e2  mul rdx
145bb81d1: 48c1ea17  shr rdx, 0x17
145bb81d5: 69c280969800  imul eax, edx, 0x989680
145bb81db: 4129c0  sub r8d, eax
145bb81de: 416bc064  imul eax, r8d, 0x64
145bb81e2: 48895108  mov qword ptr [rcx + 8], rdx
145bb81e6: 894110  mov dword ptr [rcx + 0x10], eax
145bb81e9: 4c8909  mov qword ptr [rcx], r9
145bb81ec: 4889c8  mov rax, rcx
145bb81ef: c3  ret

; save-grant: 0x1458d1f00..0x1458d2112
1458d1f00: 55  push rbp
1458d1f01: 4157  push r15
1458d1f03: 4156  push r14
1458d1f05: 4155  push r13
1458d1f07: 4154  push r12
1458d1f09: 56  push rsi
1458d1f0a: 57  push rdi
1458d1f0b: 53  push rbx
1458d1f0c: 4883ec48  sub rsp, 0x48
1458d1f10: 488d6c2440  lea rbp, [rsp + 0x40]
1458d1f15: 48c74500feffffff  mov qword ptr [rbp], 0xfffffffffffffffe
1458d1f1d: 4c89cf  mov rdi, r9
1458d1f20: 4c89c6  mov rsi, r8
1458d1f23: 4989d6  mov r14, rdx
1458d1f26: 4889cb  mov rbx, rcx
1458d1f29: e8327f0000  call 0x1458d9e60
1458d1f2e: 4189c5  mov r13d, eax
1458d1f31: 4084f8  test al, dil
1458d1f34: 0f849d010000  je 0x1458d20d7
1458d1f3a: 488bbbd0000000  mov rdi, qword ptr [rbx + 0xd0]
1458d1f41: 4989ff  mov r15, rdi
1458d1f44: 4885ff  test rdi, rdi
1458d1f47: 0f84cd000000  je 0x1458d201a
1458d1f4d: 4c89f0  mov rax, r14
1458d1f50: 44886dff  mov byte ptr [rbp - 1], r13b
1458d1f54: 4989f6  mov r14, rsi
1458d1f57: 48895df0  mov qword ptr [rbp - 0x10], rbx
1458d1f5b: 4c8bbbc8000000  mov r15, qword ptr [rbx + 0xc8]
1458d1f62: 4883ff01  cmp rdi, 1
1458d1f66: 48897de0  mov qword ptr [rbp - 0x20], rdi
1458d1f6a: 488945e8  mov qword ptr [rbp - 0x18], rax
1458d1f6e: 7505  jne 0x1458d1f75
1458d1f70: 4531e4  xor r12d, r12d
1458d1f73: eb53  jmp 0x1458d1fc8
1458d1f75: 4531e4  xor r12d, r12d
1458d1f78: 4989fd  mov r13, rdi
1458d1f7b: 0f1f440000  nop dword ptr [rax + rax]
1458d1f80: 4c89e3  mov rbx, r12
1458d1f83: 4c89ee  mov rsi, r13
1458d1f86: 48d1ee  shr rsi, 1
1458d1f89: 4901f4  add r12, rsi
1458d1f8c: 4c89e0  mov rax, r12
1458d1f8f: 48c1e005  shl rax, 5
1458d1f93: 498b4c0708  mov rcx, qword ptr [r15 + rax + 8]
1458d1f98: 4d8b440710  mov r8, qword ptr [r15 + rax + 0x10]
1458d1f9d: 4c89c7  mov rdi, r8
1458d1fa0: 4c29f7  sub rdi, r14
1458d1fa3: 4d0f43c6  cmovae r8, r14
1458d1fa7: 488b55e8  mov rdx, qword ptr [rbp - 0x18]
1458d1fab: e837843300  call 0x145c0a3e7
1458d1fb0: 4898  cdqe
1458d1fb2: 85c0  test eax, eax
1458d1fb4: 480f45f8  cmovne rdi, rax
1458d1fb8: 4885ff  test rdi, rdi
1458d1fbb: 4c0f4fe3  cmovg r12, rbx
1458d1fbf: 4929f5  sub r13, rsi
1458d1fc2: 4983fd01  cmp r13, 1
1458d1fc6: 77b8  ja 0x1458d1f80
1458d1fc8: 4c89e0  mov rax, r12
1458d1fcb: 48c1e005  shl rax, 5
1458d1fcf: 498b4c0708  mov rcx, qword ptr [r15 + rax + 8]
1458d1fd4: 4d8b440710  mov r8, qword ptr [r15 + rax + 0x10]
1458d1fd9: 4d89c7  mov r15, r8
1458d1fdc: 4d29f7  sub r15, r14
1458d1fdf: 4d0f43c6  cmovae r8, r14
1458d1fe3: 488b7de8  mov rdi, qword ptr [rbp - 0x18]
1458d1fe7: 4889fa  mov rdx, rdi
1458d1fea: e8f8833300  call 0x145c0a3e7
1458d1fef: 4898  cdqe
1458d1ff1: 85c0  test eax, eax
1458d1ff3: 4c0f45f8  cmovne r15, rax
1458d1ff7: 4d85ff  test r15, r15
1458d1ffa: 488b5df0  mov rbx, qword ptr [rbp - 0x10]
1458d1ffe: 440fb66dff  movzx r13d, byte ptr [rbp - 1]
1458d2003: 0f84ce000000  je 0x1458d20d7
1458d2009: 4c89f6  mov rsi, r14
1458d200c: 4989fe  mov r14, rdi
1458d200f: 49c1ef3f  shr r15, 0x3f
1458d2013: 4d01e7  add r15, r12
1458d2016: 488b7de0  mov rdi, qword ptr [rbp - 0x20]
1458d201a: 4c8da3c0000000  lea r12, [rbx + 0xc0]
1458d2021: 4885f6  test rsi, rsi
1458d2024: 790f  jns 0x1458d2035
1458d2026: 31ff  xor edi, edi
1458d2028: 4889f9  mov rcx, rdi
1458d202b: 4889f2  mov rdx, rsi
1458d202e: e8b8744d00  call 0x145da94eb
1458d2033: 0f0b  ud2
1458d2035: 0f84b0000000  je 0x1458d20eb
1458d203b: e8c00173fa  call 0x140002200
1458d2040: bf01000000  mov edi, 1
1458d2045: ba01000000  mov edx, 1
1458d204a: 4889f1  mov rcx, rsi
1458d204d: e86e0173fa  call 0x1400021c0
1458d2052: 4885c0  test rax, rax
1458d2055: 74d1  je 0x1458d2028
1458d2057: 488945f0  mov qword ptr [rbp - 0x10], rax
1458d205b: 4889c1  mov rcx, rax
1458d205e: 4c89f2  mov rdx, r14
1458d2061: 4989f0  mov r8, rsi
1458d2064: e872833300  call 0x145c0a3db
1458d2069: 488bbbd0000000  mov rdi, qword ptr [rbx + 0xd0]
1458d2070: 488975e8  mov qword ptr [rbp - 0x18], rsi
1458d2074: 4c39ff  cmp rdi, r15
1458d2077: 0f8280000000  jb 0x1458d20fd
1458d207d: 493b3c24  cmp rdi, qword ptr [r12]
1458d2081: 7509  jne 0x1458d208c
1458d2083: 4c89e1  mov rcx, r12
1458d2086: e845bb3300  call 0x145c0dbd0
1458d208b: 90  nop
1458d208c: 4c8b6570  mov r12, qword ptr [rbp + 0x70]
1458d2090: 4d89fe  mov r14, r15
1458d2093: 49c1e605  shl r14, 5
1458d2097: 4c03b3c8000000  add r14, qword ptr [rbx + 0xc8]
1458d209e: 4989f8  mov r8, rdi
1458d20a1: 4d29f8  sub r8, r15
1458d20a4: 7610  jbe 0x1458d20b6
1458d20a6: 498d4e20  lea rcx, [r14 + 0x20]
1458d20aa: 49c1e005  shl r8, 5
1458d20ae: 4c89f2  mov rdx, r14
1458d20b1: e837833300  call 0x145c0a3ed
1458d20b6: 488b45e8  mov rax, qword ptr [rbp - 0x18]
1458d20ba: 498906  mov qword ptr [r14], rax
1458d20bd: 488b4df0  mov rcx, qword ptr [rbp - 0x10]
1458d20c1: 49894e08  mov qword ptr [r14 + 8], rcx
1458d20c5: 49894610  mov qword ptr [r14 + 0x10], rax
1458d20c9: 4d896618  mov qword ptr [r14 + 0x18], r12
1458d20cd: 48ffc7  inc rdi
1458d20d0: 4889bbd0000000  mov qword ptr [rbx + 0xd0], rdi
1458d20d7: 4489e8  mov eax, r13d
1458d20da: 4883c448  add rsp, 0x48
1458d20de: 5b  pop rbx
1458d20df: 5f  pop rdi
1458d20e0: 5e  pop rsi
1458d20e1: 415c  pop r12
1458d20e3: 415d  pop r13
1458d20e5: 415e  pop r14
1458d20e7: 415f  pop r15
1458d20e9: 5d  pop rbp
1458d20ea: c3  ret
1458d20eb: b801000000  mov eax, 1
1458d20f0: 488945f0  mov qword ptr [rbp - 0x10], rax
1458d20f4: 488975e8  mov qword ptr [rbp - 0x18], rsi
1458d20f8: 4c39ff  cmp rdi, r15
1458d20fb: 7380  jae 0x1458d207d
1458d20fd: 4c8d055c643301  lea r8, [rip + 0x133645c]
1458d2104: 4c89f9  mov rcx, r15
1458d2107: 4889fa  mov rdx, rdi
1458d210a: e825744d00  call 0x145da9534
1458d210f: 90  nop
1458d2110: 0f0b  ud2

; earned-insert: 0x1458d9e60..0x1458da02e
1458d9e60: 55  push rbp
1458d9e61: 4157  push r15
1458d9e63: 4156  push r14
1458d9e65: 4155  push r13
1458d9e67: 4154  push r12
1458d9e69: 56  push rsi
1458d9e6a: 57  push rdi
1458d9e6b: 53  push rbx
1458d9e6c: 4883ec48  sub rsp, 0x48
1458d9e70: 488d6c2440  lea rbp, [rsp + 0x40]
1458d9e75: 48c74500feffffff  mov qword ptr [rbp], 0xfffffffffffffffe
1458d9e7d: 4c89c6  mov rsi, r8
1458d9e80: 4989cf  mov r15, rcx
1458d9e83: 4c8b81b0000000  mov r8, qword ptr [rcx + 0xb0]
1458d9e8a: 4c8bb1b8000000  mov r14, qword ptr [rcx + 0xb8]
1458d9e91: 4d89f5  mov r13, r14
1458d9e94: 4d85f6  test r14, r14
1458d9e97: 4989d4  mov r12, rdx
1458d9e9a: 4c8945f8  mov qword ptr [rbp - 8], r8
1458d9e9e: 0f84ab000000  je 0x1458d9f4f
1458d9ea4: 4c897df0  mov qword ptr [rbp - 0x10], r15
1458d9ea8: 4889f7  mov rdi, rsi
1458d9eab: 4983fe01  cmp r14, 1
1458d9eaf: 4c8975e8  mov qword ptr [rbp - 0x18], r14
1458d9eb3: 7504  jne 0x1458d9eb9
1458d9eb5: 31db  xor ebx, ebx
1458d9eb7: eb56  jmp 0x1458d9f0f
1458d9eb9: 31db  xor ebx, ebx
1458d9ebb: 0f1f440000  nop dword ptr [rax + rax]
1458d9ec0: 4989dd  mov r13, rbx
1458d9ec3: 4c89f6  mov rsi, r14
1458d9ec6: 48d1ee  shr rsi, 1
1458d9ec9: 4801f3  add rbx, rsi
1458d9ecc: 488d045b  lea rax, [rbx + rbx*2]
1458d9ed0: 498b4cc008  mov rcx, qword ptr [r8 + rax*8 + 8]
1458d9ed5: 488b55f8  mov rdx, qword ptr [rbp - 8]
1458d9ed9: 4c8b44c210  mov r8, qword ptr [rdx + rax*8 + 0x10]
1458d9ede: 4d89c7  mov r15, r8
1458d9ee1: 4929ff  sub r15, rdi
1458d9ee4: 4c0f43c7  cmovae r8, rdi
1458d9ee8: 4c89e2  mov rdx, r12
1458d9eeb: e8f7043300  call 0x145c0a3e7
1458d9ef0: 4c8b45f8  mov r8, qword ptr [rbp - 8]
1458d9ef4: 4c89e2  mov rdx, r12
1458d9ef7: 4898  cdqe
1458d9ef9: 85c0  test eax, eax
1458d9efb: 4c0f45f8  cmovne r15, rax
1458d9eff: 4d85ff  test r15, r15
1458d9f02: 490f4fdd  cmovg rbx, r13
1458d9f06: 4929f6  sub r14, rsi
1458d9f09: 4983fe01  cmp r14, 1
1458d9f0d: 77b1  ja 0x1458d9ec0
1458d9f0f: 488d045b  lea rax, [rbx + rbx*2]
1458d9f13: 498b4cc008  mov rcx, qword ptr [r8 + rax*8 + 8]
1458d9f18: 4d8b44c010  mov r8, qword ptr [r8 + rax*8 + 0x10]
1458d9f1d: 4d89c5  mov r13, r8
1458d9f20: 4929fd  sub r13, rdi
1458d9f23: 4c0f43c7  cmovae r8, rdi
1458d9f27: e8bb043300  call 0x145c0a3e7
1458d9f2c: 4898  cdqe
1458d9f2e: 85c0  test eax, eax
1458d9f30: 4c0f45e8  cmovne r13, rax
1458d9f34: 4d85ed  test r13, r13
1458d9f37: 7474  je 0x1458d9fad
1458d9f39: 4889fe  mov rsi, rdi
1458d9f3c: 49c1ed3f  shr r13, 0x3f
1458d9f40: 4901dd  add r13, rbx
1458d9f43: 4c8b7df0  mov r15, qword ptr [rbp - 0x10]
1458d9f47: 4c8b75e8  mov r14, qword ptr [rbp - 0x18]
1458d9f4b: 4c8b45f8  mov r8, qword ptr [rbp - 8]
1458d9f4f: 498d9fa8000000  lea rbx, [r15 + 0xa8]
1458d9f56: 4885f6  test rsi, rsi
1458d9f59: 7910  jns 0x1458d9f6b
1458d9f5b: 4531f6  xor r14d, r14d
1458d9f5e: 4c89f1  mov rcx, r14
1458d9f61: 4889f2  mov rdx, rsi
1458d9f64: e882f54c00  call 0x145da94eb
1458d9f69: 0f0b  ud2
1458d9f6b: 7444  je 0x1458d9fb1
1458d9f6d: 4c89f7  mov rdi, r14
1458d9f70: e88b8272fa  call 0x140002200
1458d9f75: 41be01000000  mov r14d, 1
1458d9f7b: ba01000000  mov edx, 1
1458d9f80: 4889f1  mov rcx, rsi
1458d9f83: e8388272fa  call 0x1400021c0
1458d9f88: 4885c0  test rax, rax
1458d9f8b: 74d1  je 0x1458d9f5e
1458d9f8d: 488945f0  mov qword ptr [rbp - 0x10], rax
1458d9f91: 4889c1  mov rcx, rax
1458d9f94: 4c89e2  mov rdx, r12
1458d9f97: 4989f0  mov r8, rsi
1458d9f9a: e83c043300  call 0x145c0a3db
1458d9f9f: 4989fe  mov r14, rdi
1458d9fa2: 4c8b45f8  mov r8, qword ptr [rbp - 8]
1458d9fa6: 4c3b33  cmp r14, qword ptr [rbx]
1458d9fa9: 7414  je 0x1458d9fbf
1458d9fab: eb2a  jmp 0x1458d9fd7
1458d9fad: 31c0  xor eax, eax
1458d9faf: eb6c  jmp 0x1458da01d
1458d9fb1: b801000000  mov eax, 1
1458d9fb6: 488945f0  mov qword ptr [rbp - 0x10], rax
1458d9fba: 4c3b33  cmp r14, qword ptr [rbx]
1458d9fbd: 7518  jne 0x1458d9fd7
1458d9fbf: 488975f8  mov qword ptr [rbp - 8], rsi
1458d9fc3: 4889d9  mov rcx, rbx
1458d9fc6: e8d5393300  call 0x145c0d9a0
1458d9fcb: 90  nop
1458d9fcc: 4d8b87b0000000  mov r8, qword ptr [r15 + 0xb0]
1458d9fd3: 488b75f8  mov rsi, qword ptr [rbp - 8]
1458d9fd7: 4a8d046d00000000  lea rax, [r13*2]
1458d9fdf: 4c01e8  add rax, r13
1458d9fe2: 498d3cc0  lea rdi, [r8 + rax*8]
1458d9fe6: 4c89f0  mov rax, r14
1458d9fe9: 4c29e8  sub rax, r13
1458d9fec: 7614  jbe 0x1458da002
1458d9fee: 488d4f18  lea rcx, [rdi + 0x18]
1458d9ff2: 48c1e003  shl rax, 3
1458d9ff6: 4c8d0440  lea r8, [rax + rax*2]
1458d9ffa: 4889fa  mov rdx, rdi
1458d9ffd: e8eb033300  call 0x145c0a3ed
1458da002: 488937  mov qword ptr [rdi], rsi
1458da005: 488b45f0  mov rax, qword ptr [rbp - 0x10]
1458da009: 48894708  mov qword ptr [rdi + 8], rax
1458da00d: 48897710  mov qword ptr [rdi + 0x10], rsi
1458da011: 49ffc6  inc r14
1458da014: 4d89b7b8000000  mov qword ptr [r15 + 0xb8], r14
1458da01b: b001  mov al, 1
1458da01d: 4883c448  add rsp, 0x48
1458da021: 5b  pop rbx
1458da022: 5f  pop rdi
1458da023: 5e  pop rsi
1458da024: 415c  pop r12
1458da026: 415d  pop r13
1458da028: 415e  pop r14
1458da02a: 415f  pop r15
1458da02c: 5d  pop rbp
1458da02d: c3  ret

; lethal-attribution: 0x14593f4a6..0x14593f677
14593f4a6: 4983ffff  cmp r15, -1
14593f4aa: 4889b550010000  mov qword ptr [rbp + 0x150], rsi
14593f4b1: 0f84c0010000  je 0x14593f677
14593f4b7: 450f2ee3  ucomiss xmm12, xmm11
14593f4bb: 0f82b6010000  jb 0x14593f677
14593f4c1: 8b8560010000  mov eax, dword ptr [rbp + 0x160]
14593f4c7: 3da63e0000  cmp eax, 0x3ea6
14593f4cc: 741e  je 0x14593f4ec
14593f4ce: 3d6a370000  cmp eax, 0x376a
14593f4d3: 7410  je 0x14593f4e5
14593f4d5: 89c6  mov esi, eax
14593f4d7: 3dbc140000  cmp eax, 0x14bc
14593f4dc: 7513  jne 0x14593f4f1
14593f4de: bea7500000  mov esi, 0x50a7
14593f4e3: eb0c  jmp 0x14593f4f1
14593f4e5: be32080000  mov esi, 0x832
14593f4ea: eb05  jmp 0x14593f4f1
14593f4ec: be9d200000  mov esi, 0x209d
14593f4f1: 4989fd  mov r13, rdi
14593f4f4: 488bbf08070000  mov rdi, qword ptr [rdi + 0x708]
14593f4fb: 493bbdf8060000  cmp rdi, qword ptr [r13 + 0x6f8]
14593f502: 750c  jne 0x14593f510
14593f504: 498d8df8060000  lea rcx, [r13 + 0x6f8]
14593f50b: e8606f2d00  call 0x145c16470
14593f510: 498b8500070000  mov rax, qword ptr [r13 + 0x700]
14593f517: 899d58010000  mov dword ptr [rbp + 0x158], ebx
14593f51d: 891cf8  mov dword ptr [rax + rdi*8], ebx
14593f520: 8974f804  mov dword ptr [rax + rdi*8 + 4], esi
14593f524: 48ffc7  inc rdi
14593f527: 4989bd08070000  mov qword ptr [r13 + 0x708], rdi
14593f52e: 450fb6a5ad010000  movzx r12d, byte ptr [r13 + 0x1ad]
14593f536: 31db  xor ebx, ebx
14593f538: 41be00000000  mov r14d, 0
14593f53e: 4584e4  test r12b, r12b
14593f541: 4c89ef  mov rdi, r13
14593f544: 0f85a2000000  jne 0x14593f5ec
14593f54a: 448b8d60010000  mov r9d, dword ptr [rbp + 0x160]
14593f551: 4585c9  test r9d, r9d
14593f554: 0f8484000000  je 0x14593f5de
14593f55a: b8ed000000  mov eax, 0xed
14593f55f: 488d0d4a692b01  lea rcx, [rip + 0x12b694a]
14593f566: baa4000000  mov edx, 0xa4
14593f56b: 0f57c0  xorps xmm0, xmm0
14593f56e: eb06  jmp 0x14593f576
14593f570: 4805f0000000  add rax, 0xf0
14593f576: 44398c0853ffffff  cmp dword ptr [rax + rcx - 0xad], r9d
14593f57e: 7527  jne 0x14593f5a7
14593f580: 807c088700  cmp byte ptr [rax + rcx - 0x79], 0
14593f585: 7520  jne 0x14593f5a7
14593f587: 440fb6440888  movzx r8d, byte ptr [rax + rcx - 0x78]
14593f58d: 4183f807  cmp r8d, 7
14593f591: 7714  ja 0x14593f5a7
14593f593: 440fa3c2  bt edx, r8d
14593f597: 730e  jae 0x14593f5a7
14593f599: f30f108c0857ffffff  movss xmm1, dword ptr [rax + rcx - 0xa9]
14593f5a2: 0f2ec8  ucomiss xmm1, xmm0
14593f5a5: 7732  ja 0x14593f5d9
14593f5a7: 483d6d350000  cmp rax, 0x356d
14593f5ad: 7437  je 0x14593f5e6
14593f5af: 44394c08cb  cmp dword ptr [rax + rcx - 0x35], r9d
14593f5b4: 75ba  jne 0x14593f570
14593f5b6: 807c08ff00  cmp byte ptr [rax + rcx - 1], 0
14593f5bb: 75b3  jne 0x14593f570
14593f5bd: 440fb60408  movzx r8d, byte ptr [rax + rcx]
14593f5c2: 4183f807  cmp r8d, 7
14593f5c6: 77a8  ja 0x14593f570
14593f5c8: 440fa3c2  bt edx, r8d
14593f5cc: 73a2  jae 0x14593f570
14593f5ce: f30f104c08cf  movss xmm1, dword ptr [rax + rcx - 0x31]
14593f5d4: 0f2ec8  ucomiss xmm1, xmm0
14593f5d7: 7697  jbe 0x14593f570
14593f5d9: 41b601  mov r14b, 1
14593f5dc: eb0b  jmp 0x14593f5e9
14593f5de: 41b601  mov r14b, 1
14593f5e1: 4531e4  xor r12d, r12d
14593f5e4: eb37  jmp 0x14593f61d
14593f5e6: 4531f6  xor r14d, r14d
14593f5e9: 4531e4  xor r12d, r12d
14593f5ec: 8b9d60010000  mov ebx, dword ptr [rbp + 0x160]
14593f5f2: 81fba63e0000  cmp ebx, 0x3ea6
14593f5f8: 741e  je 0x14593f618
14593f5fa: 81fb6a370000  cmp ebx, 0x376a
14593f600: 740f  je 0x14593f611
14593f602: 81fbbc140000  cmp ebx, 0x14bc
14593f608: 7513  jne 0x14593f61d
14593f60a: bba7500000  mov ebx, 0x50a7
14593f60f: eb0c  jmp 0x14593f61d
14593f611: bb32080000  mov ebx, 0x832
14593f616: eb05  jmp 0x14593f61d
14593f618: bb9d200000  mov ebx, 0x209d
14593f61d: 488bb720070000  mov rsi, qword ptr [rdi + 0x720]
14593f624: 483bb710070000  cmp rsi, qword ptr [rdi + 0x710]
14593f62b: 750c  jne 0x14593f639
14593f62d: 488d8f10070000  lea rcx, [rdi + 0x710]
14593f634: e8e76c2d00  call 0x145c16320
14593f639: 488b8718070000  mov rax, qword ptr [rdi + 0x718]
14593f640: 488d0c76  lea rcx, [rsi + rsi*2]
14593f644: 8b9558010000  mov edx, dword ptr [rbp + 0x158]
14593f64a: 891488  mov dword ptr [rax + rcx*4], edx
14593f64d: 895c8804  mov dword ptr [rax + rcx*4 + 4], ebx
14593f651: 0fb69580020000  movzx edx, byte ptr [rbp + 0x280]
14593f658: 88548808  mov byte ptr [rax + rcx*4 + 8], dl
14593f65c: 4488648809  mov byte ptr [rax + rcx*4 + 9], r12b
14593f661: 448874880a  mov byte ptr [rax + rcx*4 + 0xa], r14b
14593f666: 48ffc6  inc rsi
14593f669: 4889b720070000  mov qword ptr [rdi + 0x720], rsi
14593f670: 488bb550010000  mov rsi, qword ptr [rbp + 0x150]

; incoming-boss-history: 0x1458ec805..0x1458ec940
1458ec805: 498b8568050000  mov rax, qword ptr [r13 + 0x568]
1458ec80c: 498b8d70050000  mov rcx, qword ptr [r13 + 0x570]
1458ec813: 4c69c1d8010000  imul r8, rcx, 0x1d8
1458ec81a: 31d2  xor edx, edx
1458ec81c: 4989c1  mov r9, rax
1458ec81f: 90  nop
1458ec820: 4939d0  cmp r8, rdx
1458ec823: 0f8417010000  je 0x1458ec940
1458ec829: 4881c2d8010000  add rdx, 0x1d8
1458ec830: 4939b1f0000000  cmp qword ptr [r9 + 0xf0], rsi
1458ec837: 4d8d89d8010000  lea r9, [r9 + 0x1d8]
1458ec83e: 75e0  jne 0x1458ec820
1458ec840: 4883bc1040feffffff  cmp qword ptr [rax + rdx - 0x1c0], -1
1458ec849: 0f84f1000000  je 0x1458ec940
1458ec84f: 488b941058feffff  mov rdx, qword ptr [rax + rdx - 0x1a8]
1458ec857: 448b7a40  mov r15d, dword ptr [rdx + 0x40]
1458ec85b: 498b9530070000  mov rdx, qword ptr [r13 + 0x730]
1458ec862: 498bbd38070000  mov rdi, qword ptr [r13 + 0x738]
1458ec869: 49baf0ffffffffffff1f  movabs r10, 0x1ffffffffffffff0
1458ec873: 4921fa  and r10, rdi
1458ec876: 4e8d0492  lea r8, [rdx + r10*4]
1458ec87a: 4189f9  mov r9d, edi
1458ec87d: 4183e10f  and r9d, 0xf
1458ec881: 66410f6ec7  movd xmm0, r15d
1458ec886: 660f70c000  pshufd xmm0, xmm0, 0
1458ec88b: 4531db  xor r11d, r11d
1458ec88e: 6690  nop
1458ec890: 4d39da  cmp r10, r11
1458ec893: 7445  je 0x1458ec8da
1458ec895: f3420f6f0c9a  movdqu xmm1, xmmword ptr [rdx + r11*4]
1458ec89b: f3420f6f549a10  movdqu xmm2, xmmword ptr [rdx + r11*4 + 0x10]
1458ec8a2: f3420f6f5c9a20  movdqu xmm3, xmmword ptr [rdx + r11*4 + 0x20]
1458ec8a9: f3420f6f649a30  movdqu xmm4, xmmword ptr [rdx + r11*4 + 0x30]
1458ec8b0: 660f76d0  pcmpeqd xmm2, xmm0
1458ec8b4: 660f76c8  pcmpeqd xmm1, xmm0
1458ec8b8: 660f6bca  packssdw xmm1, xmm2
1458ec8bc: 660f76d8  pcmpeqd xmm3, xmm0
1458ec8c0: 660f76e0  pcmpeqd xmm4, xmm0
1458ec8c4: 660f6bdc  packssdw xmm3, xmm4
1458ec8c8: 660f63cb  packsswb xmm1, xmm3
1458ec8cc: 660fd7f1  pmovmskb esi, xmm1
1458ec8d0: 4983c310  add r11, 0x10
1458ec8d4: 85f6  test esi, esi
1458ec8d6: 74b8  je 0x1458ec890
1458ec8d8: eb5f  jmp 0x1458ec939
1458ec8da: 41c1e102  shl r9d, 2
1458ec8de: 4531d2  xor r10d, r10d
1458ec8e1: 6666666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1458ec8f0: 4d39d1  cmp r9, r10
1458ec8f3: 740c  je 0x1458ec901
1458ec8f5: 47393c10  cmp dword ptr [r8 + r10], r15d
1458ec8f9: 4d8d5204  lea r10, [r10 + 4]
1458ec8fd: 75f1  jne 0x1458ec8f0
1458ec8ff: eb38  jmp 0x1458ec939
1458ec901: 493bbd28070000  cmp rdi, qword ptr [r13 + 0x728]
1458ec908: 7513  jne 0x1458ec91d
1458ec90a: 498d8d28070000  lea rcx, [r13 + 0x728]
1458ec911: e87a2d3200  call 0x145c0f690
1458ec916: 498b9530070000  mov rdx, qword ptr [r13 + 0x730]
1458ec91d: 44893cba  mov dword ptr [rdx + rdi*4], r15d
1458ec921: 48ffc7  inc rdi
1458ec924: 4989bd38070000  mov qword ptr [r13 + 0x738], rdi
1458ec92b: 498b8568050000  mov rax, qword ptr [r13 + 0x568]
1458ec932: 498b8d70050000  mov rcx, qword ptr [r13 + 0x570]
1458ec939: 488bb590000000  mov rsi, qword ptr [rbp + 0x90]

; snapshot-gates: 0x1458c02dd..0x1458c0334
1458c02dd: 837a1002  cmp dword ptr [rdx + 0x10], 2
1458c02e1: 7532  jne 0x1458c0315
1458c02e3: 48c701ffffffff  mov qword ptr [rcx], 0xffffffffffffffff
1458c02ea: 0f287510  movaps xmm6, xmmword ptr [rbp + 0x10]
1458c02ee: 0f287d20  movaps xmm7, xmmword ptr [rbp + 0x20]
1458c02f2: 440f284530  movaps xmm8, xmmword ptr [rbp + 0x30]
1458c02f7: 440f284d40  movaps xmm9, xmmword ptr [rbp + 0x40]
1458c02fc: 440f285550  movaps xmm10, xmmword ptr [rbp + 0x50]
1458c0301: 4881c4e8000000  add rsp, 0xe8
1458c0308: 5b  pop rbx
1458c0309: 5f  pop rdi
1458c030a: 5e  pop rsi
1458c030b: 415c  pop r12
1458c030d: 415d  pop r13
1458c030f: 415e  pop r14
1458c0311: 415f  pop r15
1458c0313: 5d  pop rbp
1458c0314: c3  ret
1458c0315: 4881bad0100000ffffff00  cmp qword ptr [rdx + 0x10d0], 0xffffff
1458c0320: 74c1  je 0x1458c02e3
1458c0322: 80bae80a000000  cmp byte ptr [rdx + 0xae8], 0
1458c0329: 75b8  jne 0x1458c02e3
1458c032b: 80baef0a000000  cmp byte ptr [rdx + 0xaef], 0
1458c0332: 74af  je 0x1458c02e3

; ordinary-eval: 0x1459b47d0..0x1459b5cc5
1459b47d0: 4157  push r15
1459b47d2: 4156  push r14
1459b47d4: 56  push rsi
1459b47d5: 57  push rdi
1459b47d6: 55  push rbp
1459b47d7: 53  push rbx
1459b47d8: 4881ecc8000000  sub rsp, 0xc8
1459b47df: 4889d6  mov rsi, rdx
1459b47e2: 4889c8  mov rax, rcx
1459b47e5: 410fb64848  movzx ecx, byte ptr [r8 + 0x48]
1459b47ea: 488d150bed8801  lea rdx, [rip + 0x188ed0b]
1459b47f1: 48630c8a  movsxd rcx, dword ptr [rdx + rcx*4]
1459b47f5: 4801d1  add rcx, rdx
1459b47f8: ffe1  jmp rcx
1459b47fa: 488b8ee8000000  mov rcx, qword ptr [rsi + 0xe8]
1459b4801: 4885c9  test rcx, rcx
1459b4804: 0f8494140000  je 0x1459b5c9e
1459b480a: 4d8b4050  mov r8, qword ptr [r8 + 0x50]
1459b480e: 4c8b8ee0000000  mov r9, qword ptr [rsi + 0xe0]
1459b4815: 4531d2  xor r10d, r10d
1459b4818: 4883f901  cmp rcx, 1
1459b481c: 7455  je 0x1459b4873
1459b481e: 4889ca  mov rdx, rcx
1459b4821: 6666666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b4830: 4d89d3  mov r11, r10
1459b4833: 4889d6  mov rsi, rdx
1459b4836: 48d1ee  shr rsi, 1
1459b4839: 4901f2  add r10, rsi
1459b483c: 4c89d7  mov rdi, r10
1459b483f: 48c1e704  shl rdi, 4
1459b4843: 31db  xor ebx, ebx
1459b4845: 4d39443908  cmp qword ptr [r9 + rdi + 8], r8
1459b484a: 0f97c3  seta bl
1459b484d: 410fb63c39  movzx edi, byte ptr [r9 + rdi]
1459b4852: 31ed  xor ebp, ebp
1459b4854: 4080ff02  cmp dil, 2
1459b4858: 400f93c5  setae bpl
1459b485c: 4080ff01  cmp dil, 1
1459b4860: 0f44eb  cmove ebp, ebx
1459b4863: 4084ed  test bpl, bpl
1459b4866: 4d0f45d3  cmovne r10, r11
1459b486a: 4829f2  sub rdx, rsi
1459b486d: 4883fa01  cmp rdx, 1
1459b4871: 77bd  ja 0x1459b4830
1459b4873: 49c1e204  shl r10, 4
1459b4877: 43803c1101  cmp byte ptr [r9 + r10], 1
1459b487c: ba01000000  mov edx, 1
1459b4881: 750b  jne 0x1459b488e
1459b4883: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4888: 0f8426080000  je 0x1459b50b4
1459b488e: 4531d2  xor r10d, r10d
1459b4891: 4883f901  cmp rcx, 1
1459b4895: 744d  je 0x1459b48e4
1459b4897: 4989cb  mov r11, rcx
1459b489a: 660f1f440000  nop word ptr [rax + rax]
1459b48a0: 4c89d6  mov rsi, r10
1459b48a3: 4c89df  mov rdi, r11
1459b48a6: 48d1ef  shr rdi, 1
1459b48a9: 4901fa  add r10, rdi
1459b48ac: 4c89d3  mov rbx, r10
1459b48af: 48c1e304  shl rbx, 4
1459b48b3: 31ed  xor ebp, ebp
1459b48b5: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b48ba: 400f97c5  seta bpl
1459b48be: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b48c3: 4531f6  xor r14d, r14d
1459b48c6: 80fb03  cmp bl, 3
1459b48c9: 410f93c6  setae r14b
1459b48cd: 80fb02  cmp bl, 2
1459b48d0: 440f44f5  cmove r14d, ebp
1459b48d4: 4584f6  test r14b, r14b
1459b48d7: 4c0f45d6  cmovne r10, rsi
1459b48db: 4929fb  sub r11, rdi
1459b48de: 4983fb01  cmp r11, 1
1459b48e2: 77bc  ja 0x1459b48a0
1459b48e4: 49c1e204  shl r10, 4
1459b48e8: 43803c1102  cmp byte ptr [r9 + r10], 2
1459b48ed: 750b  jne 0x1459b48fa
1459b48ef: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b48f4: 0f84ba070000  je 0x1459b50b4
1459b48fa: 4531d2  xor r10d, r10d
1459b48fd: 4883f901  cmp rcx, 1
1459b4901: 7451  je 0x1459b4954
1459b4903: 4989cb  mov r11, rcx
1459b4906: 662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b4910: 4c89d6  mov rsi, r10
1459b4913: 4c89df  mov rdi, r11
1459b4916: 48d1ef  shr rdi, 1
1459b4919: 4901fa  add r10, rdi
1459b491c: 4c89d3  mov rbx, r10
1459b491f: 48c1e304  shl rbx, 4
1459b4923: 31ed  xor ebp, ebp
1459b4925: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b492a: 400f97c5  seta bpl
1459b492e: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b4933: 4531f6  xor r14d, r14d
1459b4936: 80fb04  cmp bl, 4
1459b4939: 410f93c6  setae r14b
1459b493d: 80fb03  cmp bl, 3
1459b4940: 440f44f5  cmove r14d, ebp
1459b4944: 4584f6  test r14b, r14b
1459b4947: 4c0f45d6  cmovne r10, rsi
1459b494b: 4929fb  sub r11, rdi
1459b494e: 4983fb01  cmp r11, 1
1459b4952: 77bc  ja 0x1459b4910
1459b4954: 49c1e204  shl r10, 4
1459b4958: 43803c1103  cmp byte ptr [r9 + r10], 3
1459b495d: 750b  jne 0x1459b496a
1459b495f: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4964: 0f844a070000  je 0x1459b50b4
1459b496a: 4531d2  xor r10d, r10d
1459b496d: 4883f901  cmp rcx, 1
1459b4971: 7447  je 0x1459b49ba
1459b4973: 4989cb  mov r11, rcx
1459b4976: 4c89d6  mov rsi, r10
1459b4979: 4c89df  mov rdi, r11
1459b497c: 48d1ef  shr rdi, 1
1459b497f: 4901fa  add r10, rdi
1459b4982: 4c89d3  mov rbx, r10
1459b4985: 48c1e304  shl rbx, 4
1459b4989: 31ed  xor ebp, ebp
1459b498b: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b4990: 400f97c5  seta bpl
1459b4994: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b4999: 4531f6  xor r14d, r14d
1459b499c: 80fb05  cmp bl, 5
1459b499f: 410f93c6  setae r14b
1459b49a3: 80fb04  cmp bl, 4
1459b49a6: 440f44f5  cmove r14d, ebp
1459b49aa: 4584f6  test r14b, r14b
1459b49ad: 4c0f45d6  cmovne r10, rsi
1459b49b1: 4929fb  sub r11, rdi
1459b49b4: 4983fb01  cmp r11, 1
1459b49b8: 77bc  ja 0x1459b4976
1459b49ba: 49c1e204  shl r10, 4
1459b49be: 43803c1104  cmp byte ptr [r9 + r10], 4
1459b49c3: 750b  jne 0x1459b49d0
1459b49c5: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b49ca: 0f84e4060000  je 0x1459b50b4
1459b49d0: 4531d2  xor r10d, r10d
1459b49d3: 4883f901  cmp rcx, 1
1459b49d7: 7447  je 0x1459b4a20
1459b49d9: 4989cb  mov r11, rcx
1459b49dc: 4c89d6  mov rsi, r10
1459b49df: 4c89df  mov rdi, r11
1459b49e2: 48d1ef  shr rdi, 1
1459b49e5: 4901fa  add r10, rdi
1459b49e8: 4c89d3  mov rbx, r10
1459b49eb: 48c1e304  shl rbx, 4
1459b49ef: 31ed  xor ebp, ebp
1459b49f1: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b49f6: 400f97c5  seta bpl
1459b49fa: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b49ff: 4531f6  xor r14d, r14d
1459b4a02: 80fb06  cmp bl, 6
1459b4a05: 410f93c6  setae r14b
1459b4a09: 80fb05  cmp bl, 5
1459b4a0c: 440f44f5  cmove r14d, ebp
1459b4a10: 4584f6  test r14b, r14b
1459b4a13: 4c0f45d6  cmovne r10, rsi
1459b4a17: 4929fb  sub r11, rdi
1459b4a1a: 4983fb01  cmp r11, 1
1459b4a1e: 77bc  ja 0x1459b49dc
1459b4a20: 49c1e204  shl r10, 4
1459b4a24: 43803c1105  cmp byte ptr [r9 + r10], 5
1459b4a29: 750b  jne 0x1459b4a36
1459b4a2b: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4a30: 0f847e060000  je 0x1459b50b4
1459b4a36: 4531d2  xor r10d, r10d
1459b4a39: 4883f901  cmp rcx, 1
1459b4a3d: 7447  je 0x1459b4a86
1459b4a3f: 4989cb  mov r11, rcx
1459b4a42: 4c89d6  mov rsi, r10
1459b4a45: 4c89df  mov rdi, r11
1459b4a48: 48d1ef  shr rdi, 1
1459b4a4b: 4901fa  add r10, rdi
1459b4a4e: 4c89d3  mov rbx, r10
1459b4a51: 48c1e304  shl rbx, 4
1459b4a55: 31ed  xor ebp, ebp
1459b4a57: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b4a5c: 400f97c5  seta bpl
1459b4a60: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b4a65: 4531f6  xor r14d, r14d
1459b4a68: 80fb08  cmp bl, 8
1459b4a6b: 410f93c6  setae r14b
1459b4a6f: 80fb07  cmp bl, 7
1459b4a72: 440f44f5  cmove r14d, ebp
1459b4a76: 4584f6  test r14b, r14b
1459b4a79: 4c0f45d6  cmovne r10, rsi
1459b4a7d: 4929fb  sub r11, rdi
1459b4a80: 4983fb01  cmp r11, 1
1459b4a84: 77bc  ja 0x1459b4a42
1459b4a86: 49c1e204  shl r10, 4
1459b4a8a: 43803c1107  cmp byte ptr [r9 + r10], 7
1459b4a8f: 750b  jne 0x1459b4a9c
1459b4a91: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4a96: 0f8418060000  je 0x1459b50b4
1459b4a9c: 4531d2  xor r10d, r10d
1459b4a9f: 4883f901  cmp rcx, 1
1459b4aa3: 7447  je 0x1459b4aec
1459b4aa5: 4989cb  mov r11, rcx
1459b4aa8: 4c89d6  mov rsi, r10
1459b4aab: 4c89df  mov rdi, r11
1459b4aae: 48d1ef  shr rdi, 1
1459b4ab1: 4901fa  add r10, rdi
1459b4ab4: 4c89d3  mov rbx, r10
1459b4ab7: 48c1e304  shl rbx, 4
1459b4abb: 31ed  xor ebp, ebp
1459b4abd: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b4ac2: 400f97c5  seta bpl
1459b4ac6: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b4acb: 4531f6  xor r14d, r14d
1459b4ace: 80fb09  cmp bl, 9
1459b4ad1: 410f93c6  setae r14b
1459b4ad5: 80fb08  cmp bl, 8
1459b4ad8: 440f44f5  cmove r14d, ebp
1459b4adc: 4584f6  test r14b, r14b
1459b4adf: 4c0f45d6  cmovne r10, rsi
1459b4ae3: 4929fb  sub r11, rdi
1459b4ae6: 4983fb01  cmp r11, 1
1459b4aea: 77bc  ja 0x1459b4aa8
1459b4aec: 49c1e204  shl r10, 4
1459b4af0: 43803c1108  cmp byte ptr [r9 + r10], 8
1459b4af5: 750b  jne 0x1459b4b02
1459b4af7: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4afc: 0f84b2050000  je 0x1459b50b4
1459b4b02: 4531d2  xor r10d, r10d
1459b4b05: 4883f901  cmp rcx, 1
1459b4b09: 7447  je 0x1459b4b52
1459b4b0b: 4989cb  mov r11, rcx
1459b4b0e: 4c89d6  mov rsi, r10
1459b4b11: 4c89df  mov rdi, r11
1459b4b14: 48d1ef  shr rdi, 1
1459b4b17: 4901fa  add r10, rdi
1459b4b1a: 4c89d3  mov rbx, r10
1459b4b1d: 48c1e304  shl rbx, 4
1459b4b21: 31ed  xor ebp, ebp
1459b4b23: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b4b28: 400f97c5  seta bpl
1459b4b2c: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b4b31: 4531f6  xor r14d, r14d
1459b4b34: 80fb0a  cmp bl, 0xa
1459b4b37: 410f93c6  setae r14b
1459b4b3b: 80fb09  cmp bl, 9
1459b4b3e: 440f44f5  cmove r14d, ebp
1459b4b42: 4584f6  test r14b, r14b
1459b4b45: 4c0f45d6  cmovne r10, rsi
1459b4b49: 4929fb  sub r11, rdi
1459b4b4c: 4983fb01  cmp r11, 1
1459b4b50: 77bc  ja 0x1459b4b0e
1459b4b52: 49c1e204  shl r10, 4
1459b4b56: 43803c1109  cmp byte ptr [r9 + r10], 9
1459b4b5b: 750b  jne 0x1459b4b68
1459b4b5d: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4b62: 0f844c050000  je 0x1459b50b4
1459b4b68: 4531d2  xor r10d, r10d
1459b4b6b: 4883f901  cmp rcx, 1
1459b4b6f: 7443  je 0x1459b4bb4
1459b4b71: 4d89d3  mov r11, r10
1459b4b74: 4889ce  mov rsi, rcx
1459b4b77: 48d1ee  shr rsi, 1
1459b4b7a: 4901f2  add r10, rsi
1459b4b7d: 4c89d7  mov rdi, r10
1459b4b80: 48c1e704  shl rdi, 4
1459b4b84: 31db  xor ebx, ebx
1459b4b86: 4d39443908  cmp qword ptr [r9 + rdi + 8], r8
1459b4b8b: 0f97c3  seta bl
1459b4b8e: 410fb63c39  movzx edi, byte ptr [r9 + rdi]
1459b4b93: 31ed  xor ebp, ebp
1459b4b95: 4080ff0c  cmp dil, 0xc
1459b4b99: 400f93c5  setae bpl
1459b4b9d: 4080ff0b  cmp dil, 0xb
1459b4ba1: 0f44eb  cmove ebp, ebx
1459b4ba4: 4084ed  test bpl, bpl
1459b4ba7: 4d0f45d3  cmovne r10, r11
1459b4bab: 4829f1  sub rcx, rsi
1459b4bae: 4883f901  cmp rcx, 1
1459b4bb2: 77bd  ja 0x1459b4b71
1459b4bb4: 49c1e204  shl r10, 4
1459b4bb8: 43803c110b  cmp byte ptr [r9 + r10], 0xb
1459b4bbd: 0f85db100000  jne 0x1459b5c9e
1459b4bc3: b901000000  mov ecx, 1
1459b4bc8: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b4bcd: 0f84d2100000  je 0x1459b5ca5
1459b4bd3: e9c6100000  jmp 0x1459b5c9e
1459b4bd8: 498b5050  mov rdx, qword ptr [r8 + 0x50]
1459b4bdc: 4c8b4668  mov r8, qword ptr [rsi + 0x68]
1459b4be0: 4c8b4e70  mov r9, qword ptr [rsi + 0x70]
1459b4be4: 49c1e105  shl r9, 5
1459b4be8: 31c9  xor ecx, ecx
1459b4bea: 4531d2  xor r10d, r10d
1459b4bed: 0f1f00  nop dword ptr [rax]
1459b4bf0: 4d39d1  cmp r9, r10
1459b4bf3: 7414  je 0x1459b4c09
1459b4bf5: 4d8d5a20  lea r11, [r10 + 0x20]
1459b4bf9: 43807c100401  cmp byte ptr [r8 + r10 + 4], 1
1459b4bff: 4d89da  mov r10, r11
1459b4c02: 75ec  jne 0x1459b4bf0
1459b4c04: 438b4c18e0  mov ecx, dword ptr [r8 + r11 - 0x20]
1459b4c09: 41bb6e000000  mov r11d, 0x6e
1459b4c0f: 41ba02000000  mov r10d, 2
1459b4c15: 66662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b4c20: 418d73e2  lea esi, [r11 - 0x1e]
1459b4c24: 29f1  sub ecx, esi
1459b4c26: 0f820c0c0000  jb 0x1459b5838
1459b4c2c: 418d73f1  lea esi, [r11 - 0xf]
1459b4c30: 29f1  sub ecx, esi
1459b4c32: 0f82060c0000  jb 0x1459b583e
1459b4c38: 4429d9  sub ecx, r11d
1459b4c3b: 0f82000c0000  jb 0x1459b5841
1459b4c41: 4183c32d  add r11d, 0x2d
1459b4c45: 4183c203  add r10d, 3
1459b4c49: 4181fb6b030000  cmp r11d, 0x36b
1459b4c50: 75ce  jne 0x1459b4c20
1459b4c52: 41ba33000000  mov r10d, 0x33
1459b4c58: e9e40b0000  jmp 0x1459b5841
1459b4c5d: 31c9  xor ecx, ecx
1459b4c5f: e94e100000  jmp 0x1459b5cb2
1459b4c64: 4c8b8ee8000000  mov r9, qword ptr [rsi + 0xe8]
1459b4c6b: 4d85c9  test r9, r9
1459b4c6e: 0f842a100000  je 0x1459b5c9e
1459b4c74: 450fb64049  movzx r8d, byte ptr [r8 + 0x49]
1459b4c79: 488b8ee0000000  mov rcx, qword ptr [rsi + 0xe0]
1459b4c80: 4531d2  xor r10d, r10d
1459b4c83: 4983f901  cmp r9, 1
1459b4c87: 7442  je 0x1459b4ccb
1459b4c89: 4c89ca  mov rdx, r9
1459b4c8c: 0f1f4000  nop dword ptr [rax]
1459b4c90: 4d89d3  mov r11, r10
1459b4c93: 4889d6  mov rsi, rdx
1459b4c96: 48d1ee  shr rsi, 1
1459b4c99: 4901f2  add r10, rsi
1459b4c9c: 4c89d7  mov rdi, r10
1459b4c9f: 48c1e704  shl rdi, 4
1459b4ca3: 31db  xor ebx, ebx
1459b4ca5: 48837c390800  cmp qword ptr [rcx + rdi + 8], 0
1459b4cab: 0f95c3  setne bl
1459b4cae: 31ed  xor ebp, ebp
1459b4cb0: 44380439  cmp byte ptr [rcx + rdi], r8b
1459b4cb4: 400f97c5  seta bpl
1459b4cb8: 0f44eb  cmove ebp, ebx
1459b4cbb: 4084ed  test bpl, bpl
1459b4cbe: 4d0f45d3  cmovne r10, r11
1459b4cc2: 4829f2  sub rdx, rsi
1459b4cc5: 4883fa01  cmp rdx, 1
1459b4cc9: 77c5  ja 0x1459b4c90
1459b4ccb: 49c1e204  shl r10, 4
1459b4ccf: ba01000000  mov edx, 1
1459b4cd4: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4cd8: 750c  jne 0x1459b4ce6
1459b4cda: 4a837c110800  cmp qword ptr [rcx + r10 + 8], 0
1459b4ce0: 0f84ce030000  je 0x1459b50b4
1459b4ce6: 4531d2  xor r10d, r10d
1459b4ce9: 4983f901  cmp r9, 1
1459b4ced: 744f  je 0x1459b4d3e
1459b4cef: 4d89cb  mov r11, r9
1459b4cf2: 66666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b4d00: 4c89d6  mov rsi, r10
1459b4d03: 4c89df  mov rdi, r11
1459b4d06: 48d1ef  shr rdi, 1
1459b4d09: 4901fa  add r10, rdi
1459b4d0c: 4c89d3  mov rbx, r10
1459b4d0f: 48c1e304  shl rbx, 4
1459b4d13: 31ed  xor ebp, ebp
1459b4d15: 48837c190802  cmp qword ptr [rcx + rbx + 8], 2
1459b4d1b: 400f93c5  setae bpl
1459b4d1f: 4531f6  xor r14d, r14d
1459b4d22: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4d26: 410f97c6  seta r14b
1459b4d2a: 440f44f5  cmove r14d, ebp
1459b4d2e: 4584f6  test r14b, r14b
1459b4d31: 4c0f45d6  cmovne r10, rsi
1459b4d35: 4929fb  sub r11, rdi
1459b4d38: 4983fb01  cmp r11, 1
1459b4d3c: 77c2  ja 0x1459b4d00
1459b4d3e: 49c1e204  shl r10, 4
1459b4d42: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4d46: 750c  jne 0x1459b4d54
1459b4d48: 4a837c110801  cmp qword ptr [rcx + r10 + 8], 1
1459b4d4e: 0f8460030000  je 0x1459b50b4
1459b4d54: 4531d2  xor r10d, r10d
1459b4d57: 4983f901  cmp r9, 1
1459b4d5b: 7441  je 0x1459b4d9e
1459b4d5d: 4d89cb  mov r11, r9
1459b4d60: 4c89d6  mov rsi, r10
1459b4d63: 4c89df  mov rdi, r11
1459b4d66: 48d1ef  shr rdi, 1
1459b4d69: 4901fa  add r10, rdi
1459b4d6c: 4c89d3  mov rbx, r10
1459b4d6f: 48c1e304  shl rbx, 4
1459b4d73: 31ed  xor ebp, ebp
1459b4d75: 48837c190803  cmp qword ptr [rcx + rbx + 8], 3
1459b4d7b: 400f93c5  setae bpl
1459b4d7f: 4531f6  xor r14d, r14d
1459b4d82: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4d86: 410f97c6  seta r14b
1459b4d8a: 440f44f5  cmove r14d, ebp
1459b4d8e: 4584f6  test r14b, r14b
1459b4d91: 4c0f45d6  cmovne r10, rsi
1459b4d95: 4929fb  sub r11, rdi
1459b4d98: 4983fb01  cmp r11, 1
1459b4d9c: 77c2  ja 0x1459b4d60
1459b4d9e: 49c1e204  shl r10, 4
1459b4da2: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4da6: 750c  jne 0x1459b4db4
1459b4da8: 4a837c110802  cmp qword ptr [rcx + r10 + 8], 2
1459b4dae: 0f8400030000  je 0x1459b50b4
1459b4db4: 4531d2  xor r10d, r10d
1459b4db7: 4983f901  cmp r9, 1
1459b4dbb: 7441  je 0x1459b4dfe
1459b4dbd: 4d89cb  mov r11, r9
1459b4dc0: 4c89d6  mov rsi, r10
1459b4dc3: 4c89df  mov rdi, r11
1459b4dc6: 48d1ef  shr rdi, 1
1459b4dc9: 4901fa  add r10, rdi
1459b4dcc: 4c89d3  mov rbx, r10
1459b4dcf: 48c1e304  shl rbx, 4
1459b4dd3: 31ed  xor ebp, ebp
1459b4dd5: 48837c190804  cmp qword ptr [rcx + rbx + 8], 4
1459b4ddb: 400f93c5  setae bpl
1459b4ddf: 4531f6  xor r14d, r14d
1459b4de2: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4de6: 410f97c6  seta r14b
1459b4dea: 440f44f5  cmove r14d, ebp
1459b4dee: 4584f6  test r14b, r14b
1459b4df1: 4c0f45d6  cmovne r10, rsi
1459b4df5: 4929fb  sub r11, rdi
1459b4df8: 4983fb01  cmp r11, 1
1459b4dfc: 77c2  ja 0x1459b4dc0
1459b4dfe: 49c1e204  shl r10, 4
1459b4e02: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4e06: 750c  jne 0x1459b4e14
1459b4e08: 4a837c110803  cmp qword ptr [rcx + r10 + 8], 3
1459b4e0e: 0f84a0020000  je 0x1459b50b4
1459b4e14: 4531d2  xor r10d, r10d
1459b4e17: 4983f901  cmp r9, 1
1459b4e1b: 7441  je 0x1459b4e5e
1459b4e1d: 4d89cb  mov r11, r9
1459b4e20: 4c89d6  mov rsi, r10
1459b4e23: 4c89df  mov rdi, r11
1459b4e26: 48d1ef  shr rdi, 1
1459b4e29: 4901fa  add r10, rdi
1459b4e2c: 4c89d3  mov rbx, r10
1459b4e2f: 48c1e304  shl rbx, 4
1459b4e33: 31ed  xor ebp, ebp
1459b4e35: 48837c190805  cmp qword ptr [rcx + rbx + 8], 5
1459b4e3b: 400f93c5  setae bpl
1459b4e3f: 4531f6  xor r14d, r14d
1459b4e42: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4e46: 410f97c6  seta r14b
1459b4e4a: 440f44f5  cmove r14d, ebp
1459b4e4e: 4584f6  test r14b, r14b
1459b4e51: 4c0f45d6  cmovne r10, rsi
1459b4e55: 4929fb  sub r11, rdi
1459b4e58: 4983fb01  cmp r11, 1
1459b4e5c: 77c2  ja 0x1459b4e20
1459b4e5e: 49c1e204  shl r10, 4
1459b4e62: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4e66: 750c  jne 0x1459b4e74
1459b4e68: 4a837c110804  cmp qword ptr [rcx + r10 + 8], 4
1459b4e6e: 0f8440020000  je 0x1459b50b4
1459b4e74: 4531d2  xor r10d, r10d
1459b4e77: 4983f901  cmp r9, 1
1459b4e7b: 7441  je 0x1459b4ebe
1459b4e7d: 4d89cb  mov r11, r9
1459b4e80: 4c89d6  mov rsi, r10
1459b4e83: 4c89df  mov rdi, r11
1459b4e86: 48d1ef  shr rdi, 1
1459b4e89: 4901fa  add r10, rdi
1459b4e8c: 4c89d3  mov rbx, r10
1459b4e8f: 48c1e304  shl rbx, 4
1459b4e93: 31ed  xor ebp, ebp
1459b4e95: 48837c190806  cmp qword ptr [rcx + rbx + 8], 6
1459b4e9b: 400f93c5  setae bpl
1459b4e9f: 4531f6  xor r14d, r14d
1459b4ea2: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4ea6: 410f97c6  seta r14b
1459b4eaa: 440f44f5  cmove r14d, ebp
1459b4eae: 4584f6  test r14b, r14b
1459b4eb1: 4c0f45d6  cmovne r10, rsi
1459b4eb5: 4929fb  sub r11, rdi
1459b4eb8: 4983fb01  cmp r11, 1
1459b4ebc: 77c2  ja 0x1459b4e80
1459b4ebe: 49c1e204  shl r10, 4
1459b4ec2: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4ec6: 750c  jne 0x1459b4ed4
1459b4ec8: 4a837c110805  cmp qword ptr [rcx + r10 + 8], 5
1459b4ece: 0f84e0010000  je 0x1459b50b4
1459b4ed4: 4531d2  xor r10d, r10d
1459b4ed7: 4983f901  cmp r9, 1
1459b4edb: 7441  je 0x1459b4f1e
1459b4edd: 4d89cb  mov r11, r9
1459b4ee0: 4c89d6  mov rsi, r10
1459b4ee3: 4c89df  mov rdi, r11
1459b4ee6: 48d1ef  shr rdi, 1
1459b4ee9: 4901fa  add r10, rdi
1459b4eec: 4c89d3  mov rbx, r10
1459b4eef: 48c1e304  shl rbx, 4
1459b4ef3: 31ed  xor ebp, ebp
1459b4ef5: 48837c190807  cmp qword ptr [rcx + rbx + 8], 7
1459b4efb: 400f93c5  setae bpl
1459b4eff: 4531f6  xor r14d, r14d
1459b4f02: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4f06: 410f97c6  seta r14b
1459b4f0a: 440f44f5  cmove r14d, ebp
1459b4f0e: 4584f6  test r14b, r14b
1459b4f11: 4c0f45d6  cmovne r10, rsi
1459b4f15: 4929fb  sub r11, rdi
1459b4f18: 4983fb01  cmp r11, 1
1459b4f1c: 77c2  ja 0x1459b4ee0
1459b4f1e: 49c1e204  shl r10, 4
1459b4f22: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4f26: 750c  jne 0x1459b4f34
1459b4f28: 4a837c110806  cmp qword ptr [rcx + r10 + 8], 6
1459b4f2e: 0f8480010000  je 0x1459b50b4
1459b4f34: 4531d2  xor r10d, r10d
1459b4f37: 4983f901  cmp r9, 1
1459b4f3b: 7441  je 0x1459b4f7e
1459b4f3d: 4d89cb  mov r11, r9
1459b4f40: 4c89d6  mov rsi, r10
1459b4f43: 4c89df  mov rdi, r11
1459b4f46: 48d1ef  shr rdi, 1
1459b4f49: 4901fa  add r10, rdi
1459b4f4c: 4c89d3  mov rbx, r10
1459b4f4f: 48c1e304  shl rbx, 4
1459b4f53: 31ed  xor ebp, ebp
1459b4f55: 48837c190808  cmp qword ptr [rcx + rbx + 8], 8
1459b4f5b: 400f93c5  setae bpl
1459b4f5f: 4531f6  xor r14d, r14d
1459b4f62: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4f66: 410f97c6  seta r14b
1459b4f6a: 440f44f5  cmove r14d, ebp
1459b4f6e: 4584f6  test r14b, r14b
1459b4f71: 4c0f45d6  cmovne r10, rsi
1459b4f75: 4929fb  sub r11, rdi
1459b4f78: 4983fb01  cmp r11, 1
1459b4f7c: 77c2  ja 0x1459b4f40
1459b4f7e: 49c1e204  shl r10, 4
1459b4f82: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4f86: 750c  jne 0x1459b4f94
1459b4f88: 4a837c110807  cmp qword ptr [rcx + r10 + 8], 7
1459b4f8e: 0f8420010000  je 0x1459b50b4
1459b4f94: 4531d2  xor r10d, r10d
1459b4f97: 4983f901  cmp r9, 1
1459b4f9b: 7441  je 0x1459b4fde
1459b4f9d: 4d89cb  mov r11, r9
1459b4fa0: 4c89d6  mov rsi, r10
1459b4fa3: 4c89df  mov rdi, r11
1459b4fa6: 48d1ef  shr rdi, 1
1459b4fa9: 4901fa  add r10, rdi
1459b4fac: 4c89d3  mov rbx, r10
1459b4faf: 48c1e304  shl rbx, 4
1459b4fb3: 31ed  xor ebp, ebp
1459b4fb5: 48837c190809  cmp qword ptr [rcx + rbx + 8], 9
1459b4fbb: 400f93c5  setae bpl
1459b4fbf: 4531f6  xor r14d, r14d
1459b4fc2: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b4fc6: 410f97c6  seta r14b
1459b4fca: 440f44f5  cmove r14d, ebp
1459b4fce: 4584f6  test r14b, r14b
1459b4fd1: 4c0f45d6  cmovne r10, rsi
1459b4fd5: 4929fb  sub r11, rdi
1459b4fd8: 4983fb01  cmp r11, 1
1459b4fdc: 77c2  ja 0x1459b4fa0
1459b4fde: 49c1e204  shl r10, 4
1459b4fe2: 46380411  cmp byte ptr [rcx + r10], r8b
1459b4fe6: 750c  jne 0x1459b4ff4
1459b4fe8: 4a837c110808  cmp qword ptr [rcx + r10 + 8], 8
1459b4fee: 0f84c0000000  je 0x1459b50b4
1459b4ff4: 4531d2  xor r10d, r10d
1459b4ff7: 4983f901  cmp r9, 1
1459b4ffb: 7441  je 0x1459b503e
1459b4ffd: 4d89cb  mov r11, r9
1459b5000: 4c89d6  mov rsi, r10
1459b5003: 4c89df  mov rdi, r11
1459b5006: 48d1ef  shr rdi, 1
1459b5009: 4901fa  add r10, rdi
1459b500c: 4c89d3  mov rbx, r10
1459b500f: 48c1e304  shl rbx, 4
1459b5013: 31ed  xor ebp, ebp
1459b5015: 48837c19080a  cmp qword ptr [rcx + rbx + 8], 0xa
1459b501b: 400f93c5  setae bpl
1459b501f: 4531f6  xor r14d, r14d
1459b5022: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b5026: 410f97c6  seta r14b
1459b502a: 440f44f5  cmove r14d, ebp
1459b502e: 4584f6  test r14b, r14b
1459b5031: 4c0f45d6  cmovne r10, rsi
1459b5035: 4929fb  sub r11, rdi
1459b5038: 4983fb01  cmp r11, 1
1459b503c: 77c2  ja 0x1459b5000
1459b503e: 49c1e204  shl r10, 4
1459b5042: 46380411  cmp byte ptr [rcx + r10], r8b
1459b5046: 7508  jne 0x1459b5050
1459b5048: 4a837c110809  cmp qword ptr [rcx + r10 + 8], 9
1459b504e: 7464  je 0x1459b50b4
1459b5050: 4531d2  xor r10d, r10d
1459b5053: 4983f901  cmp r9, 1
1459b5057: 7441  je 0x1459b509a
1459b5059: 4d89cb  mov r11, r9
1459b505c: 4c89d6  mov rsi, r10
1459b505f: 4c89df  mov rdi, r11
1459b5062: 48d1ef  shr rdi, 1
1459b5065: 4901fa  add r10, rdi
1459b5068: 4c89d3  mov rbx, r10
1459b506b: 48c1e304  shl rbx, 4
1459b506f: 31ed  xor ebp, ebp
1459b5071: 48837c19080b  cmp qword ptr [rcx + rbx + 8], 0xb
1459b5077: 400f93c5  setae bpl
1459b507b: 4531f6  xor r14d, r14d
1459b507e: 44380419  cmp byte ptr [rcx + rbx], r8b
1459b5082: 410f97c6  seta r14b
1459b5086: 440f44f5  cmove r14d, ebp
1459b508a: 4584f6  test r14b, r14b
1459b508d: 4c0f45d6  cmovne r10, rsi
1459b5091: 4929fb  sub r11, rdi
1459b5094: 4983fb01  cmp r11, 1
1459b5098: 77c2  ja 0x1459b505c
1459b509a: 49c1e204  shl r10, 4
1459b509e: 46380411  cmp byte ptr [rcx + r10], r8b
1459b50a2: 0f859b0b0000  jne 0x1459b5c43
1459b50a8: 4a837c11080a  cmp qword ptr [rcx + r10 + 8], 0xa
1459b50ae: 0f858f0b0000  jne 0x1459b5c43
1459b50b4: b901000000  mov ecx, 1
1459b50b9: e9e70b0000  jmp 0x1459b5ca5
1459b50be: 488b8ee8000000  mov rcx, qword ptr [rsi + 0xe8]
1459b50c5: ba01000000  mov edx, 1
1459b50ca: 4885c9  test rcx, rcx
1459b50cd: 0f84d20b0000  je 0x1459b5ca5
1459b50d3: 450fb64849  movzx r9d, byte ptr [r8 + 0x49]
1459b50d8: 4d8b4050  mov r8, qword ptr [r8 + 0x50]
1459b50dc: 4c8b96e0000000  mov r10, qword ptr [rsi + 0xe0]
1459b50e3: 4531db  xor r11d, r11d
1459b50e6: 4883f901  cmp rcx, 1
1459b50ea: 7441  je 0x1459b512d
1459b50ec: 0f1f4000  nop dword ptr [rax]
1459b50f0: 4c89de  mov rsi, r11
1459b50f3: 4889cf  mov rdi, rcx
1459b50f6: 48d1ef  shr rdi, 1
1459b50f9: 4901fb  add r11, rdi
1459b50fc: 4c89db  mov rbx, r11
1459b50ff: 48c1e304  shl rbx, 4
1459b5103: 31ed  xor ebp, ebp
1459b5105: 4d39441a08  cmp qword ptr [r10 + rbx + 8], r8
1459b510a: 400f97c5  seta bpl
1459b510e: 4531f6  xor r14d, r14d
1459b5111: 45380c1a  cmp byte ptr [r10 + rbx], r9b
1459b5115: 410f97c6  seta r14b
1459b5119: 440f44f5  cmove r14d, ebp
1459b511d: 4584f6  test r14b, r14b
1459b5120: 4c0f45de  cmovne r11, rsi
1459b5124: 4829f9  sub rcx, rdi
1459b5127: 4883f901  cmp rcx, 1
1459b512b: 77c3  ja 0x1459b50f0
1459b512d: 49c1e304  shl r11, 4
1459b5131: 47380c1a  cmp byte ptr [r10 + r11], r9b
1459b5135: 0f94c1  sete cl
1459b5138: 4f39441a08  cmp qword ptr [r10 + r11 + 8], r8
1459b513d: 410f94c0  sete r8b
1459b5141: 4120c8  and r8b, cl
1459b5144: 410fb6c8  movzx ecx, r8b
1459b5148: e9580b0000  jmp 0x1459b5ca5
1459b514d: 458b484c  mov r9d, dword ptr [r8 + 0x4c]
1459b5151: 4969c98e000000  imul rcx, r9, 0x8e
1459b5158: 48ba5d8fc2f5285c8f02  movabs rdx, 0x28f5c28f5c28f5d
1459b5162: 4989c0  mov r8, rax
1459b5165: 4889c8  mov rax, rcx
1459b5168: 48f7e2  mul rdx
1459b516b: 4c89c0  mov rax, r8
1459b516e: 4889d1  mov rcx, rdx
1459b5171: 49b8be1e85eb51b81e85  movabs r8, 0x851eb851eb851ebe
1459b517b: 4d0fafc1  imul r8, r9
1459b517f: 49c1c802  ror r8, 2
1459b5183: 49b95c8fc2f5285c8f02  movabs r9, 0x28f5c28f5c28f5c
1459b518d: 31d2  xor edx, edx
1459b518f: 4d39c8  cmp r8, r9
1459b5192: 0f97c2  seta dl
1459b5195: 4801ca  add rdx, rcx
1459b5198: 488b8ea0000000  mov rcx, qword ptr [rsi + 0xa0]
1459b519f: e9010b0000  jmp 0x1459b5ca5
1459b51a4: 488b8ee8000000  mov rcx, qword ptr [rsi + 0xe8]
1459b51ab: ba09000000  mov edx, 9
1459b51b0: 4885c9  test rcx, rcx
1459b51b3: 0f84ec0a0000  je 0x1459b5ca5
1459b51b9: 4d8b4050  mov r8, qword ptr [r8 + 0x50]
1459b51bd: 4c8b8ee0000000  mov r9, qword ptr [rsi + 0xe0]
1459b51c4: 4883f901  cmp rcx, 1
1459b51c8: 0f856d020000  jne 0x1459b543b
1459b51ce: 410fb639  movzx edi, byte ptr [r9]
1459b51d2: 4080ff09  cmp dil, 9
1459b51d6: 0f94c1  sete cl
1459b51d9: 4080ff08  cmp dil, 8
1459b51dd: 410f94c2  sete r10b
1459b51e1: 4080ff07  cmp dil, 7
1459b51e5: 410f94c3  sete r11b
1459b51e9: 4080ff05  cmp dil, 5
1459b51ed: 0f94c3  sete bl
1459b51f0: 4080ff04  cmp dil, 4
1459b51f4: 400f94c6  sete sil
1459b51f8: 4080ff03  cmp dil, 3
1459b51fc: 400f94c5  sete bpl
1459b5200: 4080ff01  cmp dil, 1
1459b5204: 410f94c6  sete r14b
1459b5208: 4080ff02  cmp dil, 2
1459b520c: 410f94c7  sete r15b
1459b5210: 4d394108  cmp qword ptr [r9 + 8], r8
1459b5214: 400f94c7  sete dil
1459b5218: 4120fe  and r14b, dil
1459b521b: 4120ff  and r15b, dil
1459b521e: 450fb6ff  movzx r15d, r15b
1459b5222: 450fb6f6  movzx r14d, r14b
1459b5226: 41c1e610  shl r14d, 0x10
1459b522a: 4509fe  or r14d, r15d
1459b522d: 4020f9  and cl, dil
1459b5230: 4120fa  and r10b, dil
1459b5233: 4020fd  and bpl, dil
1459b5236: 66410f6ec6  movd xmm0, r14d
1459b523b: 400fb6ed  movzx ebp, bpl
1459b523f: 660fc4c502  pinsrw xmm0, ebp, 2
1459b5244: 4020fe  and sil, dil
1459b5247: 400fb6f6  movzx esi, sil
1459b524b: 660fc4c603  pinsrw xmm0, esi, 3
1459b5250: 4020fb  and bl, dil
1459b5253: 0fb6f3  movzx esi, bl
1459b5256: 660fc4c604  pinsrw xmm0, esi, 4
1459b525b: 4120fb  and r11b, dil
1459b525e: 450fb6db  movzx r11d, r11b
1459b5262: 66410fc4c305  pinsrw xmm0, r11d, 5
1459b5268: 450fb6d2  movzx r10d, r10b
1459b526c: 66410fc4c206  pinsrw xmm0, r10d, 6
1459b5272: 0fb6c9  movzx ecx, cl
1459b5275: 660fc4c107  pinsrw xmm0, ecx, 7
1459b527a: 660f71f00f  psllw xmm0, 0xf
1459b527f: 660f63c0  packsswb xmm0, xmm0
1459b5283: 660fd7c8  pmovmskb ecx, xmm0
1459b5287: 0fb6c9  movzx ecx, cl
1459b528a: 69c901020408  imul ecx, ecx, 0x8040201
1459b5290: c1e903  shr ecx, 3
1459b5293: 81e111111111  and ecx, 0x11111111
1459b5299: 4469d111111111  imul r10d, ecx, 0x11111111
1459b52a0: 41c1ea1c  shr r10d, 0x1c
1459b52a4: 4531db  xor r11d, r11d
1459b52a7: e968050000  jmp 0x1459b5814
1459b52ac: 498b5050  mov rdx, qword ptr [r8 + 0x50]
1459b52b0: 488b4e40  mov rcx, qword ptr [rsi + 0x40]
1459b52b4: e9ec090000  jmp 0x1459b5ca5
1459b52b9: 4889c3  mov rbx, rax
1459b52bc: 488d05d5fb2301  lea rax, [rip + 0x123fbd5]
1459b52c3: 4889442450  mov qword ptr [rsp + 0x50], rax
1459b52c8: 4889742458  mov qword ptr [rsp + 0x58], rsi
1459b52cd: 488d0544f72301  lea rax, [rip + 0x123f744]
1459b52d4: 4889442448  mov qword ptr [rsp + 0x48], rax
1459b52d9: c644242f01  mov byte ptr [rsp + 0x2f], 1
1459b52de: 48c744246000000000  mov qword ptr [rsp + 0x60], 0
1459b52e7: 48c784248800000000000000  mov qword ptr [rsp + 0x88], 0
1459b52f3: 488d05b6a68601  lea rax, [rip + 0x186a6b6]
1459b52fa: 48898424b0000000  mov qword ptr [rsp + 0xb0], rax
1459b5302: 488d05d7a68601  lea rax, [rip + 0x186a6d7]
1459b5309: 48898424b8000000  mov qword ptr [rsp + 0xb8], rax
1459b5311: 488d44242f  lea rax, [rsp + 0x2f]
1459b5316: 48898424c0000000  mov qword ptr [rsp + 0xc0], rax
1459b531e: 488d4c2430  lea rcx, [rsp + 0x30]
1459b5323: 488d542460  lea rdx, [rsp + 0x60]
1459b5328: e843e20100  call 0x1459d3570
1459b532d: 488b442430  mov rax, qword ptr [rsp + 0x30]
1459b5332: 488b4c2438  mov rcx, qword ptr [rsp + 0x38]
1459b5337: 488b542440  mov rdx, qword ptr [rsp + 0x40]
1459b533c: 488d1491  lea rdx, [rcx + rdx*4]
1459b5340: 48894c2460  mov qword ptr [rsp + 0x60], rcx
1459b5345: 48894c2468  mov qword ptr [rsp + 0x68], rcx
1459b534a: 4889442470  mov qword ptr [rsp + 0x70], rax
1459b534f: 4889542478  mov qword ptr [rsp + 0x78], rdx
1459b5354: 488d4c2430  lea rcx, [rsp + 0x30]
1459b5359: 488d542460  lea rdx, [rsp + 0x60]
1459b535e: e87d6a0300  call 0x1459ebde0
1459b5363: 488b4c2438  mov rcx, qword ptr [rsp + 0x38]
1459b5368: 488b7c2440  mov rdi, qword ptr [rsp + 0x40]
1459b536d: 4885ff  test rdi, rdi
1459b5370: 0f848f000000  je 0x1459b5405
1459b5376: 488b4638  mov rax, qword ptr [rsi + 0x38]
1459b537a: 488b5640  mov rdx, qword ptr [rsi + 0x40]
1459b537e: 31f6  xor esi, esi
1459b5380: 4531c0  xor r8d, r8d
1459b5383: eb24  jmp 0x1459b53a9
1459b5385: 66662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5390: 4531d2  xor r10d, r10d
1459b5393: 4531db  xor r11d, r11d
1459b5396: 46390c90  cmp dword ptr [rax + r10*4], r9d
1459b539a: 410f94c3  sete r11b
1459b539e: 4c01de  add rsi, r11
1459b53a1: 49ffc0  inc r8
1459b53a4: 4939f8  cmp r8, rdi
1459b53a7: 745e  je 0x1459b5407
1459b53a9: 4989d3  mov r11, rdx
1459b53ac: 4885d2  test rdx, rdx
1459b53af: 74ed  je 0x1459b539e
1459b53b1: 468b0c81  mov r9d, dword ptr [rcx + r8*4]
1459b53b5: 4883fa01  cmp rdx, 1
1459b53b9: 74d5  je 0x1459b5390
1459b53bb: 4989d3  mov r11, rdx
1459b53be: 4531d2  xor r10d, r10d
1459b53c1: 6666666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b53d0: 4d89d6  mov r14, r10
1459b53d3: 4d89df  mov r15, r11
1459b53d6: 49d1ef  shr r15, 1
1459b53d9: 4d01fa  add r10, r15
1459b53dc: 46390c90  cmp dword ptr [rax + r10*4], r9d
1459b53e0: 4d0f47d6  cmova r10, r14
1459b53e4: 4d29fb  sub r11, r15
1459b53e7: 4983fb01  cmp r11, 1
1459b53eb: 77e3  ja 0x1459b53d0
1459b53ed: eba4  jmp 0x1459b5393
1459b53ef: 410fb64849  movzx ecx, byte ptr [r8 + 0x49]
1459b53f4: 498b5050  mov rdx, qword ptr [r8 + 0x50]
1459b53f8: 488b8cce90010000  mov rcx, qword ptr [rsi + rcx*8 + 0x190]
1459b5400: e9a0080000  jmp 0x1459b5ca5
1459b5405: 31f6  xor esi, esi
1459b5407: 488b542430  mov rdx, qword ptr [rsp + 0x30]
1459b540c: 4885d2  test rdx, rdx
1459b540f: 740f  je 0x1459b5420
1459b5411: 48c1e202  shl rdx, 2
1459b5415: 41b804000000  mov r8d, 4
1459b541b: e8b0cd64fa  call 0x1400021d0
1459b5420: 488d4c2448  lea rcx, [rsp + 0x48]
1459b5425: 4889f2  mov rdx, rsi
1459b5428: 4989f8  mov r8, rdi
1459b542b: e8c0fa0300  call 0x1459f4ef0
1459b5430: 4889c1  mov rcx, rax
1459b5433: 4889d8  mov rax, rbx
1459b5436: e96a080000  jmp 0x1459b5ca5
1459b543b: 4531d2  xor r10d, r10d
1459b543e: 4989cb  mov r11, rcx
1459b5441: 6666666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5450: 4c89d6  mov rsi, r10
1459b5453: 4c89df  mov rdi, r11
1459b5456: 48d1ef  shr rdi, 1
1459b5459: 4901fa  add r10, rdi
1459b545c: 4c89d3  mov rbx, r10
1459b545f: 48c1e304  shl rbx, 4
1459b5463: 31ed  xor ebp, ebp
1459b5465: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b546a: 400f97c5  seta bpl
1459b546e: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b5473: 4531f6  xor r14d, r14d
1459b5476: 80fb02  cmp bl, 2
1459b5479: 410f93c6  setae r14b
1459b547d: 80fb01  cmp bl, 1
1459b5480: 440f44f5  cmove r14d, ebp
1459b5484: 4584f6  test r14b, r14b
1459b5487: 4c0f45d6  cmovne r10, rsi
1459b548b: 4929fb  sub r11, rdi
1459b548e: 4983fb01  cmp r11, 1
1459b5492: 77bc  ja 0x1459b5450
1459b5494: 49c1e204  shl r10, 4
1459b5498: 43803c1101  cmp byte ptr [r9 + r10], 1
1459b549d: 410f94c3  sete r11b
1459b54a1: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b54a6: 410f94c2  sete r10b
1459b54aa: 4520da  and r10b, r11b
1459b54ad: 450fb6da  movzx r11d, r10b
1459b54b1: 4531d2  xor r10d, r10d
1459b54b4: 4889ce  mov rsi, rcx
1459b54b7: 660f1f840000000000  nop word ptr [rax + rax]
1459b54c0: 4c89d7  mov rdi, r10
1459b54c3: 4889f3  mov rbx, rsi
1459b54c6: 48d1eb  shr rbx, 1
1459b54c9: 4901da  add r10, rbx
1459b54cc: 4d89d6  mov r14, r10
1459b54cf: 49c1e604  shl r14, 4
1459b54d3: 31ed  xor ebp, ebp
1459b54d5: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b54da: 400f97c5  seta bpl
1459b54de: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b54e3: 4531ff  xor r15d, r15d
1459b54e6: 4180fe03  cmp r14b, 3
1459b54ea: 410f93c7  setae r15b
1459b54ee: 4180fe02  cmp r14b, 2
1459b54f2: 440f44fd  cmove r15d, ebp
1459b54f6: 4584ff  test r15b, r15b
1459b54f9: 4c0f45d7  cmovne r10, rdi
1459b54fd: 4829de  sub rsi, rbx
1459b5500: 4883fe01  cmp rsi, 1
1459b5504: 77ba  ja 0x1459b54c0
1459b5506: 49c1e204  shl r10, 4
1459b550a: 43803c1102  cmp byte ptr [r9 + r10], 2
1459b550f: 0f94c3  sete bl
1459b5512: 4f39441108  cmp qword ptr [r9 + r10 + 8], r8
1459b5517: 410f94c2  sete r10b
1459b551b: 4120da  and r10b, bl
1459b551e: 450fb6d2  movzx r10d, r10b
1459b5522: 4d01da  add r10, r11
1459b5525: 4531db  xor r11d, r11d
1459b5528: 4889ce  mov rsi, rcx
1459b552b: 0f1f440000  nop dword ptr [rax + rax]
1459b5530: 4c89df  mov rdi, r11
1459b5533: 4889f3  mov rbx, rsi
1459b5536: 48d1eb  shr rbx, 1
1459b5539: 4901db  add r11, rbx
1459b553c: 4d89de  mov r14, r11
1459b553f: 49c1e604  shl r14, 4
1459b5543: 31ed  xor ebp, ebp
1459b5545: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b554a: 400f97c5  seta bpl
1459b554e: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b5553: 4531ff  xor r15d, r15d
1459b5556: 4180fe04  cmp r14b, 4
1459b555a: 410f93c7  setae r15b
1459b555e: 4180fe03  cmp r14b, 3
1459b5562: 440f44fd  cmove r15d, ebp
1459b5566: 4584ff  test r15b, r15b
1459b5569: 4c0f45df  cmovne r11, rdi
1459b556d: 4829de  sub rsi, rbx
1459b5570: 4883fe01  cmp rsi, 1
1459b5574: 77ba  ja 0x1459b5530
1459b5576: 49c1e304  shl r11, 4
1459b557a: 43803c1903  cmp byte ptr [r9 + r11], 3
1459b557f: 0f94c3  sete bl
1459b5582: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b5587: 410f94c3  sete r11b
1459b558b: 4120db  and r11b, bl
1459b558e: 450fb6db  movzx r11d, r11b
1459b5592: 4d01da  add r10, r11
1459b5595: 4531db  xor r11d, r11d
1459b5598: 4889ce  mov rsi, rcx
1459b559b: 0f1f440000  nop dword ptr [rax + rax]
1459b55a0: 4c89df  mov rdi, r11
1459b55a3: 4889f3  mov rbx, rsi
1459b55a6: 48d1eb  shr rbx, 1
1459b55a9: 4901db  add r11, rbx
1459b55ac: 4d89de  mov r14, r11
1459b55af: 49c1e604  shl r14, 4
1459b55b3: 31ed  xor ebp, ebp
1459b55b5: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b55ba: 400f97c5  seta bpl
1459b55be: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b55c3: 4531ff  xor r15d, r15d
1459b55c6: 4180fe05  cmp r14b, 5
1459b55ca: 410f93c7  setae r15b
1459b55ce: 4180fe04  cmp r14b, 4
1459b55d2: 440f44fd  cmove r15d, ebp
1459b55d6: 4584ff  test r15b, r15b
1459b55d9: 4c0f45df  cmovne r11, rdi
1459b55dd: 4829de  sub rsi, rbx
1459b55e0: 4883fe01  cmp rsi, 1
1459b55e4: 77ba  ja 0x1459b55a0
1459b55e6: 49c1e304  shl r11, 4
1459b55ea: 43803c1904  cmp byte ptr [r9 + r11], 4
1459b55ef: 0f94c3  sete bl
1459b55f2: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b55f7: 410f94c3  sete r11b
1459b55fb: 4120db  and r11b, bl
1459b55fe: 450fb6db  movzx r11d, r11b
1459b5602: 4d01da  add r10, r11
1459b5605: 4531db  xor r11d, r11d
1459b5608: 4889ce  mov rsi, rcx
1459b560b: 0f1f440000  nop dword ptr [rax + rax]
1459b5610: 4c89df  mov rdi, r11
1459b5613: 4889f3  mov rbx, rsi
1459b5616: 48d1eb  shr rbx, 1
1459b5619: 4901db  add r11, rbx
1459b561c: 4d89de  mov r14, r11
1459b561f: 49c1e604  shl r14, 4
1459b5623: 31ed  xor ebp, ebp
1459b5625: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b562a: 400f97c5  seta bpl
1459b562e: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b5633: 4531ff  xor r15d, r15d
1459b5636: 4180fe06  cmp r14b, 6
1459b563a: 410f93c7  setae r15b
1459b563e: 4180fe05  cmp r14b, 5
1459b5642: 440f44fd  cmove r15d, ebp
1459b5646: 4584ff  test r15b, r15b
1459b5649: 4c0f45df  cmovne r11, rdi
1459b564d: 4829de  sub rsi, rbx
1459b5650: 4883fe01  cmp rsi, 1
1459b5654: 77ba  ja 0x1459b5610
1459b5656: 49c1e304  shl r11, 4
1459b565a: 43803c1905  cmp byte ptr [r9 + r11], 5
1459b565f: 0f94c3  sete bl
1459b5662: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b5667: 410f94c3  sete r11b
1459b566b: 4120db  and r11b, bl
1459b566e: 450fb6db  movzx r11d, r11b
1459b5672: 4d01da  add r10, r11
1459b5675: 4531db  xor r11d, r11d
1459b5678: 4889ce  mov rsi, rcx
1459b567b: 0f1f440000  nop dword ptr [rax + rax]
1459b5680: 4c89df  mov rdi, r11
1459b5683: 4889f3  mov rbx, rsi
1459b5686: 48d1eb  shr rbx, 1
1459b5689: 4901db  add r11, rbx
1459b568c: 4d89de  mov r14, r11
1459b568f: 49c1e604  shl r14, 4
1459b5693: 31ed  xor ebp, ebp
1459b5695: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b569a: 400f97c5  seta bpl
1459b569e: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b56a3: 4531ff  xor r15d, r15d
1459b56a6: 4180fe08  cmp r14b, 8
1459b56aa: 410f93c7  setae r15b
1459b56ae: 4180fe07  cmp r14b, 7
1459b56b2: 440f44fd  cmove r15d, ebp
1459b56b6: 4584ff  test r15b, r15b
1459b56b9: 4c0f45df  cmovne r11, rdi
1459b56bd: 4829de  sub rsi, rbx
1459b56c0: 4883fe01  cmp rsi, 1
1459b56c4: 77ba  ja 0x1459b5680
1459b56c6: 49c1e304  shl r11, 4
1459b56ca: 43803c1907  cmp byte ptr [r9 + r11], 7
1459b56cf: 0f94c3  sete bl
1459b56d2: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b56d7: 410f94c3  sete r11b
1459b56db: 4120db  and r11b, bl
1459b56de: 450fb6db  movzx r11d, r11b
1459b56e2: 4d01da  add r10, r11
1459b56e5: 4531db  xor r11d, r11d
1459b56e8: 4889ce  mov rsi, rcx
1459b56eb: 0f1f440000  nop dword ptr [rax + rax]
1459b56f0: 4c89df  mov rdi, r11
1459b56f3: 4889f3  mov rbx, rsi
1459b56f6: 48d1eb  shr rbx, 1
1459b56f9: 4901db  add r11, rbx
1459b56fc: 4d89de  mov r14, r11
1459b56ff: 49c1e604  shl r14, 4
1459b5703: 31ed  xor ebp, ebp
1459b5705: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b570a: 400f97c5  seta bpl
1459b570e: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b5713: 4531ff  xor r15d, r15d
1459b5716: 4180fe09  cmp r14b, 9
1459b571a: 410f93c7  setae r15b
1459b571e: 4180fe08  cmp r14b, 8
1459b5722: 440f44fd  cmove r15d, ebp
1459b5726: 4584ff  test r15b, r15b
1459b5729: 4c0f45df  cmovne r11, rdi
1459b572d: 4829de  sub rsi, rbx
1459b5730: 4883fe01  cmp rsi, 1
1459b5734: 77ba  ja 0x1459b56f0
1459b5736: 49c1e304  shl r11, 4
1459b573a: 43803c1908  cmp byte ptr [r9 + r11], 8
1459b573f: 0f94c3  sete bl
1459b5742: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b5747: 410f94c3  sete r11b
1459b574b: 4120db  and r11b, bl
1459b574e: 450fb6db  movzx r11d, r11b
1459b5752: 4d01da  add r10, r11
1459b5755: 4531db  xor r11d, r11d
1459b5758: 4889ce  mov rsi, rcx
1459b575b: 0f1f440000  nop dword ptr [rax + rax]
1459b5760: 4c89df  mov rdi, r11
1459b5763: 4889f3  mov rbx, rsi
1459b5766: 48d1eb  shr rbx, 1
1459b5769: 4901db  add r11, rbx
1459b576c: 4d89de  mov r14, r11
1459b576f: 49c1e604  shl r14, 4
1459b5773: 31ed  xor ebp, ebp
1459b5775: 4f39443108  cmp qword ptr [r9 + r14 + 8], r8
1459b577a: 400f97c5  seta bpl
1459b577e: 470fb63431  movzx r14d, byte ptr [r9 + r14]
1459b5783: 4531ff  xor r15d, r15d
1459b5786: 4180fe0a  cmp r14b, 0xa
1459b578a: 410f93c7  setae r15b
1459b578e: 4180fe09  cmp r14b, 9
1459b5792: 440f44fd  cmove r15d, ebp
1459b5796: 4584ff  test r15b, r15b
1459b5799: 4c0f45df  cmovne r11, rdi
1459b579d: 4829de  sub rsi, rbx
1459b57a0: 4883fe01  cmp rsi, 1
1459b57a4: 77ba  ja 0x1459b5760
1459b57a6: 49c1e304  shl r11, 4
1459b57aa: 43803c1909  cmp byte ptr [r9 + r11], 9
1459b57af: 0f94c3  sete bl
1459b57b2: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b57b7: 410f94c3  sete r11b
1459b57bb: 4120db  and r11b, bl
1459b57be: 450fb6db  movzx r11d, r11b
1459b57c2: 4d01da  add r10, r11
1459b57c5: 4531db  xor r11d, r11d
1459b57c8: 0f1f840000000000  nop dword ptr [rax + rax]
1459b57d0: 4c89de  mov rsi, r11
1459b57d3: 4889cf  mov rdi, rcx
1459b57d6: 48d1ef  shr rdi, 1
1459b57d9: 4901fb  add r11, rdi
1459b57dc: 4c89db  mov rbx, r11
1459b57df: 48c1e304  shl rbx, 4
1459b57e3: 31ed  xor ebp, ebp
1459b57e5: 4d39441908  cmp qword ptr [r9 + rbx + 8], r8
1459b57ea: 400f97c5  seta bpl
1459b57ee: 410fb61c19  movzx ebx, byte ptr [r9 + rbx]
1459b57f3: 4531f6  xor r14d, r14d
1459b57f6: 80fb0c  cmp bl, 0xc
1459b57f9: 410f93c6  setae r14b
1459b57fd: 80fb0b  cmp bl, 0xb
1459b5800: 440f44f5  cmove r14d, ebp
1459b5804: 4584f6  test r14b, r14b
1459b5807: 4c0f45de  cmovne r11, rsi
1459b580b: 4829f9  sub rcx, rdi
1459b580e: 4883f901  cmp rcx, 1
1459b5812: 77bc  ja 0x1459b57d0
1459b5814: 49c1e304  shl r11, 4
1459b5818: 43803c190b  cmp byte ptr [r9 + r11], 0xb
1459b581d: 0f94c1  sete cl
1459b5820: 4f39441908  cmp qword ptr [r9 + r11 + 8], r8
1459b5825: 410f94c0  sete r8b
1459b5829: 4120c8  and r8b, cl
1459b582c: 410fb6c8  movzx ecx, r8b
1459b5830: 4c01d1  add rcx, r10
1459b5833: e96d040000  jmp 0x1459b5ca5
1459b5838: 4183c2fe  add r10d, -2
1459b583c: eb03  jmp 0x1459b5841
1459b583e: 41ffca  dec r10d
1459b5841: 31c9  xor ecx, ecx
1459b5843: 4183fa33  cmp r10d, 0x33
1459b5847: 0f93c1  setae cl
1459b584a: 4531d2  xor r10d, r10d
1459b584d: 4531db  xor r11d, r11d
1459b5850: 4d39d9  cmp r9, r11
1459b5853: 7414  je 0x1459b5869
1459b5855: 498d7320  lea rsi, [r11 + 0x20]
1459b5859: 43807c180402  cmp byte ptr [r8 + r11 + 4], 2
1459b585f: 4989f3  mov r11, rsi
1459b5862: 75ec  jne 0x1459b5850
1459b5864: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b5869: be6e000000  mov esi, 0x6e
1459b586e: 41bb02000000  mov r11d, 2
1459b5874: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5880: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5883: 4129fa  sub r10d, edi
1459b5886: 7224  jb 0x1459b58ac
1459b5888: 8d7ef1  lea edi, [rsi - 0xf]
1459b588b: 4129fa  sub r10d, edi
1459b588e: 7222  jb 0x1459b58b2
1459b5890: 4129f2  sub r10d, esi
1459b5893: 7220  jb 0x1459b58b5
1459b5895: 83c62d  add esi, 0x2d
1459b5898: 4183c303  add r11d, 3
1459b589c: 81fe6b030000  cmp esi, 0x36b
1459b58a2: 75dc  jne 0x1459b5880
1459b58a4: 41bb33000000  mov r11d, 0x33
1459b58aa: eb09  jmp 0x1459b58b5
1459b58ac: 4183c3fe  add r11d, -2
1459b58b0: eb03  jmp 0x1459b58b5
1459b58b2: 41ffcb  dec r11d
1459b58b5: 4183fb33  cmp r11d, 0x33
1459b58b9: 4883d9ff  sbb rcx, -1
1459b58bd: 4531d2  xor r10d, r10d
1459b58c0: 4531db  xor r11d, r11d
1459b58c3: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b58d0: 4d39d9  cmp r9, r11
1459b58d3: 7414  je 0x1459b58e9
1459b58d5: 498d7320  lea rsi, [r11 + 0x20]
1459b58d9: 43807c180403  cmp byte ptr [r8 + r11 + 4], 3
1459b58df: 4989f3  mov r11, rsi
1459b58e2: 75ec  jne 0x1459b58d0
1459b58e4: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b58e9: be6e000000  mov esi, 0x6e
1459b58ee: 41bb02000000  mov r11d, 2
1459b58f4: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5900: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5903: 4129fa  sub r10d, edi
1459b5906: 7224  jb 0x1459b592c
1459b5908: 8d7ef1  lea edi, [rsi - 0xf]
1459b590b: 4129fa  sub r10d, edi
1459b590e: 7222  jb 0x1459b5932
1459b5910: 4129f2  sub r10d, esi
1459b5913: 7220  jb 0x1459b5935
1459b5915: 83c62d  add esi, 0x2d
1459b5918: 4183c303  add r11d, 3
1459b591c: 81fe6b030000  cmp esi, 0x36b
1459b5922: 75dc  jne 0x1459b5900
1459b5924: 41bb33000000  mov r11d, 0x33
1459b592a: eb09  jmp 0x1459b5935
1459b592c: 4183c3fe  add r11d, -2
1459b5930: eb03  jmp 0x1459b5935
1459b5932: 41ffcb  dec r11d
1459b5935: 4183fb33  cmp r11d, 0x33
1459b5939: 4883d9ff  sbb rcx, -1
1459b593d: 4531d2  xor r10d, r10d
1459b5940: 4531db  xor r11d, r11d
1459b5943: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5950: 4d39d9  cmp r9, r11
1459b5953: 7414  je 0x1459b5969
1459b5955: 498d7320  lea rsi, [r11 + 0x20]
1459b5959: 43807c180404  cmp byte ptr [r8 + r11 + 4], 4
1459b595f: 4989f3  mov r11, rsi
1459b5962: 75ec  jne 0x1459b5950
1459b5964: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b5969: be6e000000  mov esi, 0x6e
1459b596e: 41bb02000000  mov r11d, 2
1459b5974: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5980: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5983: 4129fa  sub r10d, edi
1459b5986: 7224  jb 0x1459b59ac
1459b5988: 8d7ef1  lea edi, [rsi - 0xf]
1459b598b: 4129fa  sub r10d, edi
1459b598e: 7222  jb 0x1459b59b2
1459b5990: 4129f2  sub r10d, esi
1459b5993: 7220  jb 0x1459b59b5
1459b5995: 83c62d  add esi, 0x2d
1459b5998: 4183c303  add r11d, 3
1459b599c: 81fe6b030000  cmp esi, 0x36b
1459b59a2: 75dc  jne 0x1459b5980
1459b59a4: 41bb33000000  mov r11d, 0x33
1459b59aa: eb09  jmp 0x1459b59b5
1459b59ac: 4183c3fe  add r11d, -2
1459b59b0: eb03  jmp 0x1459b59b5
1459b59b2: 41ffcb  dec r11d
1459b59b5: 4183fb33  cmp r11d, 0x33
1459b59b9: 4883d9ff  sbb rcx, -1
1459b59bd: 4531d2  xor r10d, r10d
1459b59c0: 4531db  xor r11d, r11d
1459b59c3: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b59d0: 4d39d9  cmp r9, r11
1459b59d3: 7414  je 0x1459b59e9
1459b59d5: 498d7320  lea rsi, [r11 + 0x20]
1459b59d9: 43807c180405  cmp byte ptr [r8 + r11 + 4], 5
1459b59df: 4989f3  mov r11, rsi
1459b59e2: 75ec  jne 0x1459b59d0
1459b59e4: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b59e9: be6e000000  mov esi, 0x6e
1459b59ee: 41bb02000000  mov r11d, 2
1459b59f4: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5a00: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5a03: 4129fa  sub r10d, edi
1459b5a06: 7224  jb 0x1459b5a2c
1459b5a08: 8d7ef1  lea edi, [rsi - 0xf]
1459b5a0b: 4129fa  sub r10d, edi
1459b5a0e: 7222  jb 0x1459b5a32
1459b5a10: 4129f2  sub r10d, esi
1459b5a13: 7220  jb 0x1459b5a35
1459b5a15: 83c62d  add esi, 0x2d
1459b5a18: 4183c303  add r11d, 3
1459b5a1c: 81fe6b030000  cmp esi, 0x36b
1459b5a22: 75dc  jne 0x1459b5a00
1459b5a24: 41bb33000000  mov r11d, 0x33
1459b5a2a: eb09  jmp 0x1459b5a35
1459b5a2c: 4183c3fe  add r11d, -2
1459b5a30: eb03  jmp 0x1459b5a35
1459b5a32: 41ffcb  dec r11d
1459b5a35: 4183fb33  cmp r11d, 0x33
1459b5a39: 4883d9ff  sbb rcx, -1
1459b5a3d: 4531d2  xor r10d, r10d
1459b5a40: 4531db  xor r11d, r11d
1459b5a43: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5a50: 4d39d9  cmp r9, r11
1459b5a53: 7414  je 0x1459b5a69
1459b5a55: 498d7320  lea rsi, [r11 + 0x20]
1459b5a59: 43807c180407  cmp byte ptr [r8 + r11 + 4], 7
1459b5a5f: 4989f3  mov r11, rsi
1459b5a62: 75ec  jne 0x1459b5a50
1459b5a64: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b5a69: be6e000000  mov esi, 0x6e
1459b5a6e: 41bb02000000  mov r11d, 2
1459b5a74: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5a80: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5a83: 4129fa  sub r10d, edi
1459b5a86: 7224  jb 0x1459b5aac
1459b5a88: 8d7ef1  lea edi, [rsi - 0xf]
1459b5a8b: 4129fa  sub r10d, edi
1459b5a8e: 7222  jb 0x1459b5ab2
1459b5a90: 4129f2  sub r10d, esi
1459b5a93: 7220  jb 0x1459b5ab5
1459b5a95: 83c62d  add esi, 0x2d
1459b5a98: 4183c303  add r11d, 3
1459b5a9c: 81fe6b030000  cmp esi, 0x36b
1459b5aa2: 75dc  jne 0x1459b5a80
1459b5aa4: 41bb33000000  mov r11d, 0x33
1459b5aaa: eb09  jmp 0x1459b5ab5
1459b5aac: 4183c3fe  add r11d, -2
1459b5ab0: eb03  jmp 0x1459b5ab5
1459b5ab2: 41ffcb  dec r11d
1459b5ab5: 4183fb33  cmp r11d, 0x33
1459b5ab9: 4883d9ff  sbb rcx, -1
1459b5abd: 4531d2  xor r10d, r10d
1459b5ac0: 4531db  xor r11d, r11d
1459b5ac3: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5ad0: 4d39d9  cmp r9, r11
1459b5ad3: 7414  je 0x1459b5ae9
1459b5ad5: 498d7320  lea rsi, [r11 + 0x20]
1459b5ad9: 43807c180408  cmp byte ptr [r8 + r11 + 4], 8
1459b5adf: 4989f3  mov r11, rsi
1459b5ae2: 75ec  jne 0x1459b5ad0
1459b5ae4: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b5ae9: be6e000000  mov esi, 0x6e
1459b5aee: 41bb02000000  mov r11d, 2
1459b5af4: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5b00: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5b03: 4129fa  sub r10d, edi
1459b5b06: 7224  jb 0x1459b5b2c
1459b5b08: 8d7ef1  lea edi, [rsi - 0xf]
1459b5b0b: 4129fa  sub r10d, edi
1459b5b0e: 7222  jb 0x1459b5b32
1459b5b10: 4129f2  sub r10d, esi
1459b5b13: 7220  jb 0x1459b5b35
1459b5b15: 83c62d  add esi, 0x2d
1459b5b18: 4183c303  add r11d, 3
1459b5b1c: 81fe6b030000  cmp esi, 0x36b
1459b5b22: 75dc  jne 0x1459b5b00
1459b5b24: 41bb33000000  mov r11d, 0x33
1459b5b2a: eb09  jmp 0x1459b5b35
1459b5b2c: 4183c3fe  add r11d, -2
1459b5b30: eb03  jmp 0x1459b5b35
1459b5b32: 41ffcb  dec r11d
1459b5b35: 4183fb33  cmp r11d, 0x33
1459b5b39: 4883d9ff  sbb rcx, -1
1459b5b3d: 4531d2  xor r10d, r10d
1459b5b40: 4531db  xor r11d, r11d
1459b5b43: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5b50: 4d39d9  cmp r9, r11
1459b5b53: 7414  je 0x1459b5b69
1459b5b55: 498d7320  lea rsi, [r11 + 0x20]
1459b5b59: 43807c180409  cmp byte ptr [r8 + r11 + 4], 9
1459b5b5f: 4989f3  mov r11, rsi
1459b5b62: 75ec  jne 0x1459b5b50
1459b5b64: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b5b69: be6e000000  mov esi, 0x6e
1459b5b6e: 41bb02000000  mov r11d, 2
1459b5b74: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5b80: 8d7ee2  lea edi, [rsi - 0x1e]
1459b5b83: 4129fa  sub r10d, edi
1459b5b86: 7224  jb 0x1459b5bac
1459b5b88: 8d7ef1  lea edi, [rsi - 0xf]
1459b5b8b: 4129fa  sub r10d, edi
1459b5b8e: 7222  jb 0x1459b5bb2
1459b5b90: 4129f2  sub r10d, esi
1459b5b93: 7220  jb 0x1459b5bb5
1459b5b95: 83c62d  add esi, 0x2d
1459b5b98: 4183c303  add r11d, 3
1459b5b9c: 81fe6b030000  cmp esi, 0x36b
1459b5ba2: 75dc  jne 0x1459b5b80
1459b5ba4: 41bb33000000  mov r11d, 0x33
1459b5baa: eb09  jmp 0x1459b5bb5
1459b5bac: 4183c3fe  add r11d, -2
1459b5bb0: eb03  jmp 0x1459b5bb5
1459b5bb2: 41ffcb  dec r11d
1459b5bb5: 4183fb33  cmp r11d, 0x33
1459b5bb9: 4883d9ff  sbb rcx, -1
1459b5bbd: 4531d2  xor r10d, r10d
1459b5bc0: 4531db  xor r11d, r11d
1459b5bc3: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5bd0: 4d39d9  cmp r9, r11
1459b5bd3: 7414  je 0x1459b5be9
1459b5bd5: 498d7320  lea rsi, [r11 + 0x20]
1459b5bd9: 43807c18040b  cmp byte ptr [r8 + r11 + 4], 0xb
1459b5bdf: 4989f3  mov r11, rsi
1459b5be2: 75ec  jne 0x1459b5bd0
1459b5be4: 458b5430e0  mov r10d, dword ptr [r8 + rsi - 0x20]
1459b5be9: 41b96e000000  mov r9d, 0x6e
1459b5bef: 41b802000000  mov r8d, 2
1459b5bf5: 66662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b5c00: 458d59e2  lea r11d, [r9 - 0x1e]
1459b5c04: 4529da  sub r10d, r11d
1459b5c07: 7227  jb 0x1459b5c30
1459b5c09: 458d59f1  lea r11d, [r9 - 0xf]
1459b5c0d: 4529da  sub r10d, r11d
1459b5c10: 7224  jb 0x1459b5c36
1459b5c12: 4529ca  sub r10d, r9d
1459b5c15: 7222  jb 0x1459b5c39
1459b5c17: 4183c12d  add r9d, 0x2d
1459b5c1b: 4183c003  add r8d, 3
1459b5c1f: 4181f96b030000  cmp r9d, 0x36b
1459b5c26: 75d8  jne 0x1459b5c00
1459b5c28: 41b833000000  mov r8d, 0x33
1459b5c2e: eb09  jmp 0x1459b5c39
1459b5c30: 4183c0fe  add r8d, -2
1459b5c34: eb03  jmp 0x1459b5c39
1459b5c36: 41ffc8  dec r8d
1459b5c39: 4183f833  cmp r8d, 0x33
1459b5c3d: 4883d9ff  sbb rcx, -1
1459b5c41: eb62  jmp 0x1459b5ca5
1459b5c43: 4531d2  xor r10d, r10d
1459b5c46: 4983f901  cmp r9, 1
1459b5c4a: 743b  je 0x1459b5c87
1459b5c4c: 4d89d3  mov r11, r10
1459b5c4f: 4c89ce  mov rsi, r9
1459b5c52: 48d1ee  shr rsi, 1
1459b5c55: 4901f2  add r10, rsi
1459b5c58: 4c89d7  mov rdi, r10
1459b5c5b: 48c1e704  shl rdi, 4
1459b5c5f: 31db  xor ebx, ebx
1459b5c61: 48837c39080c  cmp qword ptr [rcx + rdi + 8], 0xc
1459b5c67: 0f93c3  setae bl
1459b5c6a: 31ed  xor ebp, ebp
1459b5c6c: 44380439  cmp byte ptr [rcx + rdi], r8b
1459b5c70: 400f97c5  seta bpl
1459b5c74: 0f44eb  cmove ebp, ebx
1459b5c77: 4084ed  test bpl, bpl
1459b5c7a: 4d0f45d3  cmovne r10, r11
1459b5c7e: 4929f1  sub r9, rsi
1459b5c81: 4983f901  cmp r9, 1
1459b5c85: 77c5  ja 0x1459b5c4c
1459b5c87: 49c1e204  shl r10, 4
1459b5c8b: 46380411  cmp byte ptr [rcx + r10], r8b
1459b5c8f: 750d  jne 0x1459b5c9e
1459b5c91: 4a837c11080b  cmp qword ptr [rcx + r10 + 8], 0xb
1459b5c97: b901000000  mov ecx, 1
1459b5c9c: 7407  je 0x1459b5ca5
1459b5c9e: ba01000000  mov edx, 1
1459b5ca3: 31c9  xor ecx, ecx
1459b5ca5: 48894808  mov qword ptr [rax + 8], rcx
1459b5ca9: 48895010  mov qword ptr [rax + 0x10], rdx
1459b5cad: b901000000  mov ecx, 1
1459b5cb2: 488908  mov qword ptr [rax], rcx
1459b5cb5: 4881c4c8000000  add rsp, 0xc8
1459b5cbc: 5b  pop rbx
1459b5cbd: 5d  pop rbp
1459b5cbe: 5f  pop rdi
1459b5cbf: 5e  pop rsi
1459b5cc0: 415e  pop r14
1459b5cc2: 415f  pop r15
1459b5cc4: c3  ret

; account-grant: 0x1459b6410..0x1459b69bc
1459b6410: 55  push rbp
1459b6411: 4157  push r15
1459b6413: 4156  push r14
1459b6415: 4155  push r13
1459b6417: 4154  push r12
1459b6419: 56  push rsi
1459b641a: 57  push rdi
1459b641b: 53  push rbx
1459b641c: 4881eca8000000  sub rsp, 0xa8
1459b6423: 488dac2480000000  lea rbp, [rsp + 0x80]
1459b642b: 48c74520feffffff  mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
1459b6433: 4989ce  mov r14, rcx
1459b6436: 488b7a28  mov rdi, qword ptr [rdx + 0x28]
1459b643a: 4989ff  mov r15, rdi
1459b643d: 49c1e704  shl r15, 4
1459b6441: 4889f8  mov rax, rdi
1459b6444: 48c1e83c  shr rax, 0x3c
1459b6448: 0f95c0  setne al
1459b644b: 48b9f8ffffffffffff7f  movabs rcx, 0x7ffffffffffffff8
1459b6455: 4939cf  cmp r15, rcx
1459b6458: 0f97c1  seta cl
1459b645b: 08c1  or cl, al
1459b645d: 7410  je 0x1459b646f
1459b645f: 4531e4  xor r12d, r12d
1459b6462: 4c89e1  mov rcx, r12
1459b6465: 4c89fa  mov rdx, r15
1459b6468: e87e303f00  call 0x145da94eb
1459b646d: 0f0b  ud2
1459b646f: 4c8945c8  mov qword ptr [rbp - 0x38], r8
1459b6473: 48895518  mov qword ptr [rbp + 0x18], rdx
1459b6477: 488b7220  mov rsi, qword ptr [rdx + 0x20]
1459b647b: 4d85ff  test r15, r15
1459b647e: 4c8975d0  mov qword ptr [rbp - 0x30], r14
1459b6482: 4c894dd8  mov qword ptr [rbp - 0x28], r9
1459b6486: 742f  je 0x1459b64b7
1459b6488: e873bd64fa  call 0x140002200
1459b648d: 41bc08000000  mov r12d, 8
1459b6493: ba08000000  mov edx, 8
1459b6498: 4c89f9  mov rcx, r15
1459b649b: e820bd64fa  call 0x1400021c0
1459b64a0: 48894510  mov qword ptr [rbp + 0x10], rax
1459b64a4: 4885c0  test rax, rax
1459b64a7: 74b9  je 0x1459b6462
1459b64a9: 48897d00  mov qword ptr [rbp], rdi
1459b64ad: 4885ff  test rdi, rdi
1459b64b0: 751f  jne 0x1459b64d1
1459b64b2: e997010000  jmp 0x1459b664e
1459b64b7: b808000000  mov eax, 8
1459b64bc: 48894510  mov qword ptr [rbp + 0x10], rax
1459b64c0: 48c7450000000000  mov qword ptr [rbp], 0
1459b64c8: 4885ff  test rdi, rdi
1459b64cb: 0f847d010000  je 0x1459b664e
1459b64d1: 488b7d10  mov rdi, qword ptr [rbp + 0x10]
1459b64d5: 4889f9  mov rcx, rdi
1459b64d8: 4889f2  mov rdx, rsi
1459b64db: 4d89f8  mov r8, r15
1459b64de: e8f83e2500  call 0x145c0a3db
1459b64e3: 4901ff  add r15, rdi
1459b64e6: 488b4518  mov rax, qword ptr [rbp + 0x18]
1459b64ea: 4805d8000000  add rax, 0xd8
1459b64f0: 48894508  mov qword ptr [rbp + 8], rax
1459b64f4: 4c897df8  mov qword ptr [rbp - 8], r15
1459b64f8: eb1a  jmp 0x1459b6514
1459b64fa: 660f1f440000  nop word ptr [rax + rax]
1459b6500: 4c89f7  mov rdi, r14
1459b6503: 4883c710  add rdi, 0x10
1459b6507: 4c8b7df8  mov r15, qword ptr [rbp - 8]
1459b650b: 4c39ff  cmp rdi, r15
1459b650e: 0f843a010000  je 0x1459b664e
1459b6514: 4989fe  mov r14, rdi
1459b6517: 488b4708  mov rax, qword ptr [rdi + 8]
1459b651b: 4883f801  cmp rax, 1
1459b651f: 4889c3  mov rbx, rax
1459b6522: 4883d3ff  adc rbx, -1
1459b6526: 4883fb0c  cmp rbx, 0xc
1459b652a: b90c000000  mov ecx, 0xc
1459b652f: 480f43d9  cmovae rbx, rcx
1459b6533: 4883f802  cmp rax, 2
1459b6537: 488b7518  mov rsi, qword ptr [rbp + 0x18]
1459b653b: 72c3  jb 0x1459b6500
1459b653d: 450fb62e  movzx r13d, byte ptr [r14]
1459b6541: 4c8ba6e8000000  mov r12, qword ptr [rsi + 0xe8]
1459b6548: 31ff  xor edi, edi
1459b654a: eb21  jmp 0x1459b656d
1459b654c: 0f1f4000  nop dword ptr [rax]
1459b6550: 44882e  mov byte ptr [rsi], r13b
1459b6553: 48897e08  mov qword ptr [rsi + 8], rdi
1459b6557: 49ffc4  inc r12
1459b655a: 488b7518  mov rsi, qword ptr [rbp + 0x18]
1459b655e: 4c89a6e8000000  mov qword ptr [rsi + 0xe8], r12
1459b6565: 48ffc7  inc rdi
1459b6568: 4839df  cmp rdi, rbx
1459b656b: 7493  je 0x1459b6500
1459b656d: 488b86e0000000  mov rax, qword ptr [rsi + 0xe0]
1459b6574: 4d89e7  mov r15, r12
1459b6577: 4d85e4  test r12, r12
1459b657a: 0f8489000000  je 0x1459b6609
1459b6580: 4983fc01  cmp r12, 1
1459b6584: 750a  jne 0x1459b6590
1459b6586: 4531ff  xor r15d, r15d
1459b6589: eb53  jmp 0x1459b65de
1459b658b: 0f1f440000  nop dword ptr [rax + rax]
1459b6590: 4c89e1  mov rcx, r12
1459b6593: 4531ff  xor r15d, r15d
1459b6596: 662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b65a0: 4c89fa  mov rdx, r15
1459b65a3: 4989c8  mov r8, rcx
1459b65a6: 49d1e8  shr r8, 1
1459b65a9: 4d01c7  add r15, r8
1459b65ac: 4d89f9  mov r9, r15
1459b65af: 49c1e104  shl r9, 4
1459b65b3: 4531d2  xor r10d, r10d
1459b65b6: 4a397c0808  cmp qword ptr [rax + r9 + 8], rdi
1459b65bb: 410f97c2  seta r10b
1459b65bf: 4531db  xor r11d, r11d
1459b65c2: 46382c08  cmp byte ptr [rax + r9], r13b
1459b65c6: 410f97c3  seta r11b
1459b65ca: 450f44da  cmove r11d, r10d
1459b65ce: 4584db  test r11b, r11b
1459b65d1: 4c0f45fa  cmovne r15, rdx
1459b65d5: 4c29c1  sub rcx, r8
1459b65d8: 4883f901  cmp rcx, 1
1459b65dc: 77c2  ja 0x1459b65a0
1459b65de: 4c89f9  mov rcx, r15
1459b65e1: 48c1e104  shl rcx, 4
1459b65e5: 44382c08  cmp byte ptr [rax + rcx], r13b
1459b65e9: 7505  jne 0x1459b65f0
1459b65eb: 48397c0808  cmp qword ptr [rax + rcx + 8], rdi
1459b65f0: 0f97c1  seta cl
1459b65f3: 80d900  sbb cl, 0
1459b65f6: 84c9  test cl, cl
1459b65f8: 0f8467ffffff  je 0x1459b6565
1459b65fe: 31d2  xor edx, edx
1459b6600: 80f9ff  cmp cl, 0xff
1459b6603: 0f94c2  sete dl
1459b6606: 4901d7  add r15, rdx
1459b6609: 488b4d08  mov rcx, qword ptr [rbp + 8]
1459b660d: 4c3b21  cmp r12, qword ptr [rcx]
1459b6610: 7511  jne 0x1459b6623
1459b6612: 488b4d08  mov rcx, qword ptr [rbp + 8]
1459b6616: e895762500  call 0x145c0dcb0
1459b661b: 90  nop
1459b661c: 488b86e0000000  mov rax, qword ptr [rsi + 0xe0]
1459b6623: 4c89fe  mov rsi, r15
1459b6626: 48c1e604  shl rsi, 4
1459b662a: 4801c6  add rsi, rax
1459b662d: 4d89e0  mov r8, r12
1459b6630: 4d29f8  sub r8, r15
1459b6633: 0f8617ffffff  jbe 0x1459b6550
1459b6639: 488d4e10  lea rcx, [rsi + 0x10]
1459b663d: 49c1e004  shl r8, 4
1459b6641: 4889f2  mov rdx, rsi
1459b6644: e8a43d2500  call 0x145c0a3ed
1459b6649: e902ffffff  jmp 0x1459b6550
1459b664e: 488b5500  mov rdx, qword ptr [rbp]
1459b6652: 4885d2  test rdx, rdx
1459b6655: 7413  je 0x1459b666a
1459b6657: 48c1e204  shl rdx, 4
1459b665b: 41b808000000  mov r8d, 8
1459b6661: 488b4d10  mov rcx, qword ptr [rbp + 0x10]
1459b6665: e866bb64fa  call 0x1400021d0
1459b666a: 4c8b5d18  mov r11, qword ptr [rbp + 0x18]
1459b666e: 4d8b4310  mov r8, qword ptr [r11 + 0x10]
1459b6672: 4d85c0  test r8, r8
1459b6675: 4c8b65d8  mov r12, qword ptr [rbp - 0x28]
1459b6679: 4c8b75d0  mov r14, qword ptr [rbp - 0x30]
1459b667d: 7417  je 0x1459b6696
1459b667f: 498b4b08  mov rcx, qword ptr [r11 + 8]
1459b6683: 4489c2  mov edx, r8d
1459b6686: 83e203  and edx, 3
1459b6689: 4983f804  cmp r8, 4
1459b668d: 7311  jae 0x1459b66a0
1459b668f: 4531c9  xor r9d, r9d
1459b6692: 31c0  xor eax, eax
1459b6694: eb5d  jmp 0x1459b66f3
1459b6696: 31c0  xor eax, eax
1459b6698: 4531c9  xor r9d, r9d
1459b669b: e910010000  jmp 0x1459b67b0
1459b66a0: 4d89c2  mov r10, r8
1459b66a3: 4983e2fc  and r10, 0xfffffffffffffffc
1459b66a7: 4c8d99d0000000  lea r11, [rcx + 0xd0]
1459b66ae: 4531c9  xor r9d, r9d
1459b66b1: 31c0  xor eax, eax
1459b66b3: 666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b66c0: 418bb358ffffff  mov esi, dword ptr [r11 - 0xa8]
1459b66c7: 418b7b90  mov edi, dword ptr [r11 - 0x70]
1459b66cb: 4801c6  add rsi, rax
1459b66ce: 418b5bc8  mov ebx, dword ptr [r11 - 0x38]
1459b66d2: 4801fb  add rbx, rdi
1459b66d5: 4801f3  add rbx, rsi
1459b66d8: 418b03  mov eax, dword ptr [r11]
1459b66db: 4801d8  add rax, rbx
1459b66de: 4983c104  add r9, 4
1459b66e2: 4981c3e0000000  add r11, 0xe0
1459b66e9: 4d39ca  cmp r10, r9
1459b66ec: 75d2  jne 0x1459b66c0
1459b66ee: 4885d2  test rdx, rdx
1459b66f1: 742d  je 0x1459b6720
1459b66f3: 4d6bc938  imul r9, r9, 0x38
1459b66f7: 4901c9  add r9, rcx
1459b66fa: 4983c128  add r9, 0x28
1459b66fe: 4c6bd238  imul r10, rdx, 0x38
1459b6702: 4531db  xor r11d, r11d
1459b6705: 66662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b6710: 438b3419  mov esi, dword ptr [r9 + r11]
1459b6714: 4801f0  add rax, rsi
1459b6717: 4983c338  add r11, 0x38
1459b671b: 4d39da  cmp r10, r11
1459b671e: 75f0  jne 0x1459b6710
1459b6720: 4983f804  cmp r8, 4
1459b6724: 7308  jae 0x1459b672e
1459b6726: 4531d2  xor r10d, r10d
1459b6729: 4531c9  xor r9d, r9d
1459b672c: eb58  jmp 0x1459b6786
1459b672e: 4d89c3  mov r11, r8
1459b6731: 4983e3fc  and r11, 0xfffffffffffffffc
1459b6735: 488db1d4000000  lea rsi, [rcx + 0xd4]
1459b673c: 4531d2  xor r10d, r10d
1459b673f: 4531c9  xor r9d, r9d
1459b6742: 66666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b6750: 8bbe58ffffff  mov edi, dword ptr [rsi - 0xa8]
1459b6756: 8b5e90  mov ebx, dword ptr [rsi - 0x70]
1459b6759: 4c01cf  add rdi, r9
1459b675c: 448b7ec8  mov r15d, dword ptr [rsi - 0x38]
1459b6760: 4901df  add r15, rbx
1459b6763: 4901ff  add r15, rdi
1459b6766: 448b0e  mov r9d, dword ptr [rsi]
1459b6769: 4d01f9  add r9, r15
1459b676c: 4983c204  add r10, 4
1459b6770: 4881c6e0000000  add rsi, 0xe0
1459b6777: 4d39d3  cmp r11, r10
1459b677a: 75d4  jne 0x1459b6750
1459b677c: 41f6c003  test r8b, 3
1459b6780: 0f841f020000  je 0x1459b69a5
1459b6786: 4d6bc238  imul r8, r10, 0x38
1459b678a: 4c01c1  add rcx, r8
1459b678d: 4883c12c  add rcx, 0x2c
1459b6791: 486bd238  imul rdx, rdx, 0x38
1459b6795: 4531c0  xor r8d, r8d
1459b6798: 4c8b5d18  mov r11, qword ptr [rbp + 0x18]
1459b679c: 0f1f4000  nop dword ptr [rax]
1459b67a0: 468b1401  mov r10d, dword ptr [rcx + r8]
1459b67a4: 4d01d1  add r9, r10
1459b67a7: 4983c038  add r8, 0x38
1459b67ab: 4c39c2  cmp rdx, r8
1459b67ae: 75f0  jne 0x1459b67a0
1459b67b0: 498b8bb0010000  mov rcx, qword ptr [r11 + 0x1b0]
1459b67b7: 498b93b8010000  mov rdx, qword ptr [r11 + 0x1b8]
1459b67be: 4839c8  cmp rax, rcx
1459b67c1: 480f47c8  cmova rcx, rax
1459b67c5: 4939d1  cmp r9, rdx
1459b67c8: 490f47d1  cmova rdx, r9
1459b67cc: 49898bb0010000  mov qword ptr [r11 + 0x1b0], rcx
1459b67d3: 498993b8010000  mov qword ptr [r11 + 0x1b8], rdx
1459b67da: 48c745e000000000  mov qword ptr [rbp - 0x20], 0
1459b67e2: 48c745e808000000  mov qword ptr [rbp - 0x18], 8
1459b67ea: 48c745f000000000  mov qword ptr [rbp - 0x10], 0
1459b67f2: 488b05df686e02  mov rax, qword ptr [rip + 0x26e68df]
1459b67f9: 4883f80d  cmp rax, 0xd
1459b67fd: b90d000000  mov ecx, 0xd
1459b6802: 480f42c8  cmovb rcx, rax
1459b6806: c1e105  shl ecx, 5
1459b6809: 488d05803e6e02  lea rax, [rip + 0x26e3e80]
1459b6810: 488d3408  lea rsi, [rax + rcx]
1459b6814: 8b440118  mov eax, dword ptr [rcx + rax + 0x18]
1459b6818: 85c0  test eax, eax
1459b681a: 0f858e010000  jne 0x1459b69ae
1459b6820: 486b461070  imul rax, qword ptr [rsi + 0x10], 0x70
1459b6825: 488b5e08  mov rbx, qword ptr [rsi + 8]
1459b6829: 4801d8  add rax, rbx
1459b682c: 48894510  mov qword ptr [rbp + 0x10], rax
1459b6830: eb1d  jmp 0x1459b684f
1459b6832: 66666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459b6840: 488b45e8  mov rax, qword ptr [rbp - 0x18]
1459b6844: 4c893cf0  mov qword ptr [rax + rsi*8], r15
1459b6848: 48ffc6  inc rsi
1459b684b: 488975f0  mov qword ptr [rbp - 0x10], rsi
1459b684f: 4c8b4d18  mov r9, qword ptr [rbp + 0x18]
1459b6853: 483b5d10  cmp rbx, qword ptr [rbp + 0x10]
1459b6857: 0f8424010000  je 0x1459b6981
1459b685d: 4989df  mov r15, rbx
1459b6860: 4883c370  add rbx, 0x70
1459b6864: 498bb9b8000000  mov rdi, qword ptr [r9 + 0xb8]
1459b686b: 4885ff  test rdi, rdi
1459b686e: 0f84aa000000  je 0x1459b691e
1459b6874: 4d8b6708  mov r12, qword ptr [r15 + 8]
1459b6878: 4c897df8  mov qword ptr [rbp - 8], r15
1459b687c: 4d8b7f10  mov r15, qword ptr [r15 + 0x10]
1459b6880: 4d8bb1b0000000  mov r14, qword ptr [r9 + 0xb0]
1459b6887: 31db  xor ebx, ebx
1459b6889: 4883ff01  cmp rdi, 1
1459b688d: 7447  je 0x1459b68d6
1459b688f: 90  nop
1459b6890: 48895d08  mov qword ptr [rbp + 8], rbx
1459b6894: 4989fd  mov r13, rdi
1459b6897: 49d1ed  shr r13, 1
1459b689a: 4c01eb  add rbx, r13
1459b689d: 488d045b  lea rax, [rbx + rbx*2]
1459b68a1: 498b4cc608  mov rcx, qword ptr [r14 + rax*8 + 8]
1459b68a6: 4d8b44c610  mov r8, qword ptr [r14 + rax*8 + 0x10]
1459b68ab: 4c89c6  mov rsi, r8
1459b68ae: 4c29fe  sub rsi, r15
1459b68b1: 4d0f43c7  cmovae r8, r15
1459b68b5: 4c89e2  mov rdx, r12
1459b68b8: e82a3b2500  call 0x145c0a3e7
1459b68bd: 4898  cdqe
1459b68bf: 85c0  test eax, eax
1459b68c1: 480f45f0  cmovne rsi, rax
1459b68c5: 4885f6  test rsi, rsi
1459b68c8: 480f4f5d08  cmovg rbx, qword ptr [rbp + 8]
1459b68cd: 4c29ef  sub rdi, r13
1459b68d0: 4883ff01  cmp rdi, 1
1459b68d4: 77ba  ja 0x1459b6890
1459b68d6: 488d045b  lea rax, [rbx + rbx*2]
1459b68da: 498b4cc608  mov rcx, qword ptr [r14 + rax*8 + 8]
1459b68df: 498b44c610  mov rax, qword ptr [r14 + rax*8 + 0x10]
1459b68e4: 4889c6  mov rsi, rax
1459b68e7: 4c29fe  sub rsi, r15
1459b68ea: 4c0f42f8  cmovb r15, rax
1459b68ee: 4c89e2  mov rdx, r12
1459b68f1: 4d89f8  mov r8, r15
1459b68f4: e8ee3a2500  call 0x145c0a3e7
1459b68f9: 4898  cdqe
1459b68fb: 85c0  test eax, eax
1459b68fd: 480f45f0  cmovne rsi, rax
1459b6901: 4885f6  test rsi, rsi
1459b6904: 4c8b75d0  mov r14, qword ptr [rbp - 0x30]
1459b6908: 4c8b65d8  mov r12, qword ptr [rbp - 0x28]
1459b690c: 4c8b4d18  mov r9, qword ptr [rbp + 0x18]
1459b6910: 4c8b7df8  mov r15, qword ptr [rbp - 8]
1459b6914: 498d5f70  lea rbx, [r15 + 0x70]
1459b6918: 0f8435ffffff  je 0x1459b6853
1459b691e: 488d4db0  lea rcx, [rbp - 0x50]
1459b6922: 4c89ca  mov rdx, r9
1459b6925: 4d89f8  mov r8, r15
1459b6928: e8a3deffff  call 0x1459b47d0
1459b692d: 90  nop
1459b692e: 837db001  cmp dword ptr [rbp - 0x50], 1
1459b6932: 4c8b4d18  mov r9, qword ptr [rbp + 0x18]
1459b6936: 0f8517ffffff  jne 0x1459b6853
1459b693c: 488b45c0  mov rax, qword ptr [rbp - 0x40]
1459b6940: 483945b8  cmp qword ptr [rbp - 0x48], rax
1459b6944: 0f8209ffffff  jb 0x1459b6853
1459b694a: 498b5708  mov rdx, qword ptr [r15 + 8]
1459b694e: 4d8b4710  mov r8, qword ptr [r15 + 0x10]
1459b6952: 4c89642420  mov qword ptr [rsp + 0x20], r12
1459b6957: 4c89c9  mov rcx, r9
1459b695a: 4c8b4dc8  mov r9, qword ptr [rbp - 0x38]
1459b695e: e89db5f1ff  call 0x1458d1f00
1459b6963: 90  nop
1459b6964: 488b75f0  mov rsi, qword ptr [rbp - 0x10]
1459b6968: 483b75e0  cmp rsi, qword ptr [rbp - 0x20]
1459b696c: 0f85cefeffff  jne 0x1459b6840
1459b6972: 488d4de0  lea rcx, [rbp - 0x20]
1459b6976: e8b56f2500  call 0x145c0d930
1459b697b: 90  nop
1459b697c: e9bffeffff  jmp 0x1459b6840
1459b6981: 488b45f0  mov rax, qword ptr [rbp - 0x10]
1459b6985: 49894610  mov qword ptr [r14 + 0x10], rax
1459b6989: 0f1045e0  movups xmm0, xmmword ptr [rbp - 0x20]
1459b698d: 410f1106  movups xmmword ptr [r14], xmm0
1459b6991: 4881c4a8000000  add rsp, 0xa8
1459b6998: 5b  pop rbx
1459b6999: 5f  pop rdi
1459b699a: 5e  pop rsi
1459b699b: 415c  pop r12
1459b699d: 415d  pop r13
1459b699f: 415e  pop r14
1459b69a1: 415f  pop r15
1459b69a3: 5d  pop rbp
1459b69a4: c3  ret
1459b69a5: 4c8b5d18  mov r11, qword ptr [rbp + 0x18]
1459b69a9: e902feffff  jmp 0x1459b67b0
1459b69ae: 4889f1  mov rcx, rsi
1459b69b1: e8747b3d00  call 0x145d8e52a
1459b69b6: 90  nop
1459b69b7: e964feffff  jmp 0x1459b6820

; legendary-selector: 0x1459f4ef0..0x1459f5271
1459f4ef0: 4157  push r15
1459f4ef2: 4156  push r14
1459f4ef4: 4155  push r13
1459f4ef6: 4154  push r12
1459f4ef8: 56  push rsi
1459f4ef9: 57  push rdi
1459f4efa: 55  push rbp
1459f4efb: 53  push rbx
1459f4efc: 4881ecd8000000  sub rsp, 0xd8
1459f4f03: 660f7fb424c0000000  movdqa xmmword ptr [rsp + 0xc0], xmm6
1459f4f0c: 4c89c6  mov rsi, r8
1459f4f0f: 4889d7  mov rdi, rdx
1459f4f12: 4c8b39  mov r15, qword ptr [rcx]
1459f4f15: 488b4108  mov rax, qword ptr [rcx + 8]
1459f4f19: 4939c7  cmp r15, rax
1459f4f1c: 0f8429030000  je 0x1459f524b
1459f4f22: 4c8b7110  mov r14, qword ptr [rcx + 0x10]
1459f4f26: 4c29f8  sub rax, r15
1459f4f29: 48c1e804  shr rax, 4
1459f4f2d: 48b9398ee3388ee3388e  movabs rcx, 0x8e38e38e38e38e39
1459f4f37: 480fafc8  imul rcx, rax
1459f4f3b: 48894c2448  mov qword ptr [rsp + 0x48], rcx
1459f4f40: 31ed  xor ebp, ebp
1459f4f42: 660f6f35f6383c00  movdqa xmm6, xmmword ptr [rip + 0x3c38f6]
1459f4f4a: 4c89742450  mov qword ptr [rsp + 0x50], r14
1459f4f4f: eb63  jmp 0x1459f4fb4
1459f4f51: 6666666666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459f4f60: 0f57d2  xorps xmm2, xmm2
1459f4f63: f3480f2ad0  cvtsi2ss xmm2, rax
1459f4f68: 0f57db  xorps xmm3, xmm3
1459f4f6b: f3480f2ad9  cvtsi2ss xmm3, rcx
1459f4f70: 0f14d3  unpcklps xmm2, xmm3
1459f4f73: 0f14c1  unpcklps xmm0, xmm1
1459f4f76: 0f5ec2  divps xmm0, xmm2
1459f4f79: 0f28c8  movaps xmm1, xmm0
1459f4f7c: 660f72e11f  psrad xmm1, 0x1f
1459f4f81: 660f72d101  psrld xmm1, 1
1459f4f86: 660fefc8  pxor xmm1, xmm0
1459f4f8a: 660f70c155  pshufd xmm0, xmm1, 0x55
1459f4f8f: 660f66c8  pcmpgtd xmm1, xmm0
1459f4f93: 660f7ec8  movd eax, xmm1
1459f4f97: a801  test al, 1
1459f4f99: 480f44f3  cmove rsi, rbx
1459f4f9d: 490f44fe  cmove rdi, r14
1459f4fa1: 48ffc5  inc rbp
1459f4fa4: 483b6c2448  cmp rbp, qword ptr [rsp + 0x48]
1459f4fa9: 4c8b742450  mov r14, qword ptr [rsp + 0x50]
1459f4fae: 0f8497020000  je 0x1459f524b
1459f4fb4: 488d04ed00000000  lea rax, [rbp*8]
1459f4fbc: 4801e8  add rax, rbp
1459f4fbf: 48c1e004  shl rax, 4
1459f4fc3: 410fb684078c000000  movzx eax, byte ptr [r15 + rax + 0x8c]
1459f4fcc: 8844242f  mov byte ptr [rsp + 0x2f], al
1459f4fd0: 48c744245800000000  mov qword ptr [rsp + 0x58], 0
1459f4fd9: 48c784248000000000000000  mov qword ptr [rsp + 0x80], 0
1459f4fe5: 488d05c4a98201  lea rax, [rip + 0x182a9c4]
1459f4fec: 48898424a8000000  mov qword ptr [rsp + 0xa8], rax
1459f4ff4: 488d05e5a98201  lea rax, [rip + 0x182a9e5]
1459f4ffb: 48898424b0000000  mov qword ptr [rsp + 0xb0], rax
1459f5003: 488d44242f  lea rax, [rsp + 0x2f]
1459f5008: 48898424b8000000  mov qword ptr [rsp + 0xb8], rax
1459f5010: 488d5c2430  lea rbx, [rsp + 0x30]
1459f5015: 4889d9  mov rcx, rbx
1459f5018: 4c8d642458  lea r12, [rsp + 0x58]
1459f501d: 4c89e2  mov rdx, r12
1459f5020: e84be5fdff  call 0x1459d3570
1459f5025: 488b442430  mov rax, qword ptr [rsp + 0x30]
1459f502a: 488b4c2438  mov rcx, qword ptr [rsp + 0x38]
1459f502f: 488b542440  mov rdx, qword ptr [rsp + 0x40]
1459f5034: 488d1491  lea rdx, [rcx + rdx*4]
1459f5038: 48894c2458  mov qword ptr [rsp + 0x58], rcx
1459f503d: 48894c2460  mov qword ptr [rsp + 0x60], rcx
1459f5042: 4889442468  mov qword ptr [rsp + 0x68], rax
1459f5047: 4889542470  mov qword ptr [rsp + 0x70], rdx
1459f504c: 4889d9  mov rcx, rbx
1459f504f: 4c89e2  mov rdx, r12
1459f5052: e8896dffff  call 0x1459ebde0
1459f5057: 488b4c2438  mov rcx, qword ptr [rsp + 0x38]
1459f505c: 488b5c2440  mov rbx, qword ptr [rsp + 0x40]
1459f5061: 4885db  test rbx, rbx
1459f5064: 742a  je 0x1459f5090
1459f5066: 498b4640  mov rax, qword ptr [r14 + 0x40]
1459f506a: 4885c0  test rax, rax
1459f506d: 7431  je 0x1459f50a0
1459f506f: 498b5638  mov rdx, qword ptr [r14 + 0x38]
1459f5073: 4883f801  cmp rax, 1
1459f5077: 7537  jne 0x1459f50b0
1459f5079: 8b02  mov eax, dword ptr [rdx]
1459f507b: 4883fb04  cmp rbx, 4
1459f507f: 0f8380000000  jae 0x1459f5105
1459f5085: 31d2  xor edx, edx
1459f5087: 4531f6  xor r14d, r14d
1459f508a: e9aa010000  jmp 0x1459f5239
1459f508f: 90  nop
1459f5090: 4531f6  xor r14d, r14d
1459f5093: e9d8000000  jmp 0x1459f5170
1459f5098: 0f1f840000000000  nop dword ptr [rax + rax]
1459f50a0: 4989c6  mov r14, rax
1459f50a3: e9c8000000  jmp 0x1459f5170
1459f50a8: 0f1f840000000000  nop dword ptr [rax + rax]
1459f50b0: 4531c0  xor r8d, r8d
1459f50b3: 4531f6  xor r14d, r14d
1459f50b6: 662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459f50c0: 468b0c81  mov r9d, dword ptr [rcx + r8*4]
1459f50c4: 4989c2  mov r10, rax
1459f50c7: 4531db  xor r11d, r11d
1459f50ca: 660f1f440000  nop word ptr [rax + rax]
1459f50d0: 4d89dc  mov r12, r11
1459f50d3: 4d89d5  mov r13, r10
1459f50d6: 49d1ed  shr r13, 1
1459f50d9: 4d01eb  add r11, r13
1459f50dc: 46390c9a  cmp dword ptr [rdx + r11*4], r9d
1459f50e0: 4d0f47dc  cmova r11, r12
1459f50e4: 4d29ea  sub r10, r13
1459f50e7: 4983fa01  cmp r10, 1
1459f50eb: 77e3  ja 0x1459f50d0
1459f50ed: 4531d2  xor r10d, r10d
1459f50f0: 46390c9a  cmp dword ptr [rdx + r11*4], r9d
1459f50f4: 410f94c2  sete r10b
1459f50f8: 4d01d6  add r14, r10
1459f50fb: 49ffc0  inc r8
1459f50fe: 4939d8  cmp r8, rbx
1459f5101: 75bd  jne 0x1459f50c0
1459f5103: eb6b  jmp 0x1459f5170
1459f5105: 4889da  mov rdx, rbx
1459f5108: 4883e2fc  and rdx, 0xfffffffffffffffc
1459f510c: 660f6ec0  movd xmm0, eax
1459f5110: 660f70c800  pshufd xmm1, xmm0, 0
1459f5115: 660fefc0  pxor xmm0, xmm0
1459f5119: 4531c0  xor r8d, r8d
1459f511c: 660fefd2  pxor xmm2, xmm2
1459f5120: f3420f7e1c81  movq xmm3, qword ptr [rcx + r8*4]
1459f5126: f3420f7e648108  movq xmm4, qword ptr [rcx + r8*4 + 8]
1459f512d: 660f76d9  pcmpeqd xmm3, xmm1
1459f5131: 660f70dbd4  pshufd xmm3, xmm3, 0xd4
1459f5136: 660fdbde  pand xmm3, xmm6
1459f513a: 660fd4d3  paddq xmm2, xmm3
1459f513e: 660f76e1  pcmpeqd xmm4, xmm1
1459f5142: 660f70dcd4  pshufd xmm3, xmm4, 0xd4
1459f5147: 660fdbde  pand xmm3, xmm6
1459f514b: 660fd4c3  paddq xmm0, xmm3
1459f514f: 4983c004  add r8, 4
1459f5153: 4c39c2  cmp rdx, r8
1459f5156: 75c8  jne 0x1459f5120
1459f5158: 660fd4c2  paddq xmm0, xmm2
1459f515c: 660f70c8ee  pshufd xmm1, xmm0, 0xee
1459f5161: 660fd4c8  paddq xmm1, xmm0
1459f5165: 66490f7ece  movq r14, xmm1
1459f516a: e9c1000000  jmp 0x1459f5230
1459f516f: 90  nop
1459f5170: 488b542430  mov rdx, qword ptr [rsp + 0x30]
1459f5175: 4885d2  test rdx, rdx
1459f5178: 740f  je 0x1459f5189
1459f517a: 48c1e202  shl rdx, 2
1459f517e: 41b804000000  mov r8d, 4
1459f5184: e847d060fa  call 0x1400021d0
1459f5189: 4885ff  test rdi, rdi
1459f518c: 7812  js 0x1459f51a0
1459f518e: 0f57c0  xorps xmm0, xmm0
1459f5191: f3480f2ac7  cvtsi2ss xmm0, rdi
1459f5196: eb22  jmp 0x1459f51ba
1459f5198: 0f1f840000000000  nop dword ptr [rax + rax]
1459f51a0: 4889f8  mov rax, rdi
1459f51a3: 48d1e8  shr rax, 1
1459f51a6: 89f9  mov ecx, edi
1459f51a8: 83e101  and ecx, 1
1459f51ab: 4809c1  or rcx, rax
1459f51ae: 0f57c0  xorps xmm0, xmm0
1459f51b1: f3480f2ac1  cvtsi2ss xmm0, rcx
1459f51b6: f30f58c0  addss xmm0, xmm0
1459f51ba: 4883fe01  cmp rsi, 1
1459f51be: 4889f0  mov rax, rsi
1459f51c1: 4883d000  adc rax, 0
1459f51c5: 4d85f6  test r14, r14
1459f51c8: 7816  js 0x1459f51e0
1459f51ca: 0f57c9  xorps xmm1, xmm1
1459f51cd: f3490f2ace  cvtsi2ss xmm1, r14
1459f51d2: eb27  jmp 0x1459f51fb
1459f51d4: 6666662e0f1f840000000000  nop word ptr cs:[rax + rax]
1459f51e0: 4c89f1  mov rcx, r14
1459f51e3: 48d1e9  shr rcx, 1
1459f51e6: 4489f2  mov edx, r14d
1459f51e9: 83e201  and edx, 1
1459f51ec: 4809ca  or rdx, rcx
1459f51ef: 0f57c9  xorps xmm1, xmm1
1459f51f2: f3480f2aca  cvtsi2ss xmm1, rdx
1459f51f7: f30f58c9  addss xmm1, xmm1
1459f51fb: 4883fb01  cmp rbx, 1
1459f51ff: 4889d9  mov rcx, rbx
1459f5202: 4883d100  adc rcx, 0
1459f5206: 4885c0  test rax, rax
1459f5209: 0f8951fdffff  jns 0x1459f4f60
1459f520f: 4889c2  mov rdx, rax
1459f5212: 48d1ea  shr rdx, 1
1459f5215: 83e001  and eax, 1
1459f5218: 4809d0  or rax, rdx
1459f521b: 0f57d2  xorps xmm2, xmm2
1459f521e: f3480f2ad0  cvtsi2ss xmm2, rax
1459f5223: f30f58d2  addss xmm2, xmm2
1459f5227: e93cfdffff  jmp 0x1459f4f68
1459f522c: 0f1f4000  nop dword ptr [rax]
1459f5230: 4839d3  cmp rbx, rdx
1459f5233: 0f8437ffffff  je 0x1459f5170
1459f5239: 4531c0  xor r8d, r8d
1459f523c: 3b0491  cmp eax, dword ptr [rcx + rdx*4]
1459f523f: 410f94c0  sete r8b
1459f5243: 4d01c6  add r14, r8
1459f5246: 48ffc2  inc rdx
1459f5249: ebe5  jmp 0x1459f5230
1459f524b: 4889f8  mov rax, rdi
1459f524e: 4889f2  mov rdx, rsi
1459f5251: 0f28b424c0000000  movaps xmm6, xmmword ptr [rsp + 0xc0]
1459f5259: 4881c4d8000000  add rsp, 0xd8
1459f5260: 5b  pop rbx
1459f5261: 5d  pop rbp
1459f5262: 5f  pop rdi
1459f5263: 5e  pop rsi
1459f5264: 415c  pop r12
1459f5266: 415d  pop r13
1459f5268: 415e  pop r14
1459f526a: 415f  pop r15
1459f526c: c3  ret
1459f526d: cc  int3
1459f526e: cc  int3
1459f526f: cc  int3
1459f5270: 55  push rbp

; legendary-filter: 0x1459ebde0..0x1459ebecf
1459ebde0: 55  push rbp
1459ebde1: 4157  push r15
1459ebde3: 4156  push r14
1459ebde5: 4155  push r13
1459ebde7: 4154  push r12
1459ebde9: 56  push rsi
1459ebdea: 57  push rdi
1459ebdeb: 53  push rbx
1459ebdec: 4881ecb8000000  sub rsp, 0xb8
1459ebdf3: 488dac2480000000  lea rbp, [rsp + 0x80]
1459ebdfb: 48c74530feffffff  mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
1459ebe03: 48894d10  mov qword ptr [rbp + 0x10], rcx
1459ebe07: 488b4210  mov rax, qword ptr [rdx + 0x10]
1459ebe0b: 48894518  mov qword ptr [rbp + 0x18], rax
1459ebe0f: 4c8b2a  mov r13, qword ptr [rdx]
1459ebe12: 4c8b6208  mov r12, qword ptr [rdx + 8]
1459ebe16: 48895528  mov qword ptr [rbp + 0x28], rdx
1459ebe1a: 488b7218  mov rsi, qword ptr [rdx + 0x18]
1459ebe1e: 4c896d20  mov qword ptr [rbp + 0x20], r13
1459ebe22: 4939f4  cmp r12, rsi
1459ebe25: 7476  je 0x1459ebe9d
1459ebe27: 4c8b6d20  mov r13, qword ptr [rbp + 0x20]
1459ebe2b: eb0c  jmp 0x1459ebe39
1459ebe2d: 0f1f00  nop dword ptr [rax]
1459ebe30: 4983c404  add r12, 4
1459ebe34: 4939f4  cmp r12, rsi
1459ebe37: 7464  je 0x1459ebe9d
1459ebe39: 418b1c24  mov ebx, dword ptr [r12]
1459ebe3d: 488d4da0  lea rcx, [rbp - 0x60]
1459ebe41: 89da  mov edx, ebx
1459ebe43: e878a5faff  call 0x1459963c0
1459ebe48: 90  nop
1459ebe49: 488b55a0  mov rdx, qword ptr [rbp - 0x60]
1459ebe4d: 4883faff  cmp rdx, -1
1459ebe51: 74dd  je 0x1459ebe30
1459ebe53: 4c8b75b8  mov r14, qword ptr [rbp - 0x48]
1459ebe57: 4c8b7dc0  mov r15, qword ptr [rbp - 0x40]
1459ebe5b: 488b7dd0  mov rdi, qword ptr [rbp - 0x30]
1459ebe5f: 4885d2  test rdx, rdx
1459ebe62: 740f  je 0x1459ebe73
1459ebe64: 488b4da8  mov rcx, qword ptr [rbp - 0x58]
1459ebe68: 41b801000000  mov r8d, 1
1459ebe6e: e85d6361fa  call 0x1400021d0
1459ebe73: 4d85f6  test r14, r14
1459ebe76: 7415  je 0x1459ebe8d
1459ebe78: 49c1e603  shl r14, 3
1459ebe7c: 41b804000000  mov r8d, 4
1459ebe82: 4c89f9  mov rcx, r15
1459ebe85: 4c89f2  mov rdx, r14
1459ebe88: e8436361fa  call 0x1400021d0
1459ebe8d: 4883ff04  cmp rdi, 4
1459ebe91: 759d  jne 0x1459ebe30
1459ebe93: 41895d00  mov dword ptr [r13], ebx
1459ebe97: 4983c504  add r13, 4
1459ebe9b: eb93  jmp 0x1459ebe30
1459ebe9d: 488b5520  mov rdx, qword ptr [rbp + 0x20]
1459ebea1: 4929d5  sub r13, rdx
1459ebea4: 49c1ed02  shr r13, 2
1459ebea8: 488b4510  mov rax, qword ptr [rbp + 0x10]
1459ebeac: 488b4d18  mov rcx, qword ptr [rbp + 0x18]
1459ebeb0: 488908  mov qword ptr [rax], rcx
1459ebeb3: 48895008  mov qword ptr [rax + 8], rdx
1459ebeb7: 4c896810  mov qword ptr [rax + 0x10], r13
1459ebebb: 4881c4b8000000  add rsp, 0xb8
1459ebec2: 5b  pop rbx
1459ebec3: 5f  pop rdi
1459ebec4: 5e  pop rsi
1459ebec5: 415c  pop r12
1459ebec7: 415d  pop r13
1459ebec9: 415e  pop r14
1459ebecb: 415f  pop r15
1459ebecd: 5d  pop rbp
1459ebece: c3  ret
