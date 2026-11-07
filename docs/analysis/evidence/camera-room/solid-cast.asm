; solid-cast 0x1415c70f0..0x1415c730a
1415c70f0: 55 push rbp
1415c70f1: 4157 push r15
1415c70f3: 4156 push r14
1415c70f5: 56 push rsi
1415c70f6: 57 push rdi
1415c70f7: 53 push rbx
1415c70f8: 4881ec48010000 sub rsp, 0x148
1415c70ff: 488dac2480000000 lea rbp, [rsp + 0x80]
1415c7107: 440f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm8
1415c710f: 0f29bda0000000 movaps xmmword ptr [rbp + 0xa0], xmm7
1415c7116: 0f29b590000000 movaps xmmword ptr [rbp + 0x90], xmm6
1415c711d: 48c78588000000feffffff mov qword ptr [rbp + 0x88], 0xfffffffffffffffe
1415c7128: 4588ce mov r14b, r9b
1415c712b: 4c89c3 mov rbx, r8
1415c712e: 4889d6 mov rsi, rdx
1415c7131: 4889cf mov rdi, rcx
1415c7134: 4c8d7d58 lea r15, [rbp + 0x58]
1415c7138: f30f100db0b08104 movss xmm1, dword ptr [rip + 0x481b0b0]
1415c7140: 4c89f9 mov rcx, r15
1415c7143: e8581b6c00 call 0x141c88ca0
1415c7148: c7453005000000 mov dword ptr [rbp + 0x30], 5
1415c714f: 0f103dd228ab04 movups xmm7, xmmword ptr [rip + 0x4ab28d2]
1415c7156: 0f297d10 movaps xmmword ptr [rbp + 0x10], xmm7
1415c715a: 440f1005d628ab04 movups xmm8, xmmword ptr [rip + 0x4ab28d6]
1415c7162: 440f294520 movaps xmmword ptr [rbp + 0x20], xmm8
1415c7167: 8b4608 mov eax, dword ptr [rsi + 8]
1415c716a: 894550 mov dword ptr [rbp + 0x50], eax
1415c716d: 488b06 mov rax, qword ptr [rsi]
1415c7170: 48894548 mov qword ptr [rbp + 0x48], rax
1415c7174: 0f2805356f8b04 movaps xmm0, xmmword ptr [rip + 0x48b6f35]
1415c717b: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
1415c717f: 8b4308 mov eax, dword ptr [rbx + 8]
1415c7182: 894540 mov dword ptr [rbp + 0x40], eax
1415c7185: 488b03 mov rax, qword ptr [rbx]
1415c7188: 48894538 mov qword ptr [rbp + 0x38], rax
1415c718c: 488d4510 lea rax, [rbp + 0x10]
1415c7190: 4889442438 mov qword ptr [rsp + 0x38], rax
1415c7195: 488d4538 lea rax, [rbp + 0x38]
1415c7199: 4889442428 mov qword ptr [rsp + 0x28], rax
1415c719e: 488d45c0 lea rax, [rbp - 0x40]
1415c71a2: 4889442420 mov qword ptr [rsp + 0x20], rax
1415c71a7: c744243000000000 mov dword ptr [rsp + 0x30], 0
1415c71af: 488d4dd0 lea rcx, [rbp - 0x30]
1415c71b3: 4c8d4d48 lea r9, [rbp + 0x48]
1415c71b7: 4889fa mov rdx, rdi
1415c71ba: 4d89f8 mov r8, r15
1415c71bd: e8bea08000 call 0x141dd1280
1415c71c2: 90 nop 
1415c71c3: 448b7dd0 mov r15d, dword ptr [rbp - 0x30]
1415c71c7: f30f1075d8 movss xmm6, dword ptr [rbp - 0x28]
1415c71cc: 488b4558 mov rax, qword ptr [rbp + 0x58]
1415c71d0: f048ff08 lock dec qword ptr [rax]
1415c71d4: 750a jne 0x1415c71e0
1415c71d6: 488d4d58 lea rcx, [rbp + 0x58]
1415c71da: e8a1d1e1fe call 0x1403e4380
1415c71df: 90 nop 
1415c71e0: 488b4568 mov rax, qword ptr [rbp + 0x68]
1415c71e4: f048ff08 lock dec qword ptr [rax]
1415c71e8: 7509 jne 0x1415c71f3
1415c71ea: 488d4d68 lea rcx, [rbp + 0x68]
1415c71ee: e88dd1e1fe call 0x1403e4380
1415c71f3: 4584f6 test r14b, r14b
1415c71f6: 7433 je 0x1415c722b
1415c71f8: 8b4308 mov eax, dword ptr [rbx + 8]
1415c71fb: 894560 mov dword ptr [rbp + 0x60], eax
1415c71fe: 488b03 mov rax, qword ptr [rbx]
1415c7201: 48894558 mov qword ptr [rbp + 0x58], rax
1415c7205: 4c8d75d0 lea r14, [rbp - 0x30]
1415c7209: 488d5558 lea rdx, [rbp + 0x58]
1415c720d: 4c89f1 mov rcx, r14
1415c7210: e82be17203 call 0x144cf5340
1415c7215: 807dd001 cmp byte ptr [rbp - 0x30], 1
1415c7219: 7520 jne 0x1415c723b
1415c721b: 31c0 xor eax, eax
1415c721d: 4585ff test r15d, r15d
1415c7220: 0f858d000000 jne 0x1415c72b3
1415c7226: e9ac000000 jmp 0x1415c72d7
1415c722b: 4585ff test r15d, r15d
1415c722e: 0f85a8000000 jne 0x1415c72dc
1415c7234: 31c0 xor eax, eax
1415c7236: e9a6000000 jmp 0x1415c72e1
1415c723b: 8b45dc mov eax, dword ptr [rbp - 0x24]
1415c723e: 894518 mov dword ptr [rbp + 0x18], eax
1415c7241: 488b45d4 mov rax, qword ptr [rbp - 0x2c]
1415c7245: 48894510 mov qword ptr [rbp + 0x10], rax
1415c7249: f30f1003 movss xmm0, dword ptr [rbx]
1415c724d: f30f59c0 mulss xmm0, xmm0
1415c7251: f20f104b04 movsd xmm1, qword ptr [rbx + 4]
1415c7256: 0f59c9 mulps xmm1, xmm1
1415c7259: f30f58c1 addss xmm0, xmm1
1415c725d: f30f16c9 movshdup xmm1, xmm1
1415c7261: f30f58c8 addss xmm1, xmm0
1415c7265: 0f57c0 xorps xmm0, xmm0
1415c7268: f30f51c1 sqrtss xmm0, xmm1
1415c726c: c745f008000000 mov dword ptr [rbp - 0x10], 8
1415c7273: 0f297dd0 movaps xmmword ptr [rbp - 0x30], xmm7
1415c7277: 440f2945e0 movaps xmmword ptr [rbp - 0x20], xmm8
1415c727c: 4c89742430 mov qword ptr [rsp + 0x30], r14
1415c7281: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1415c7287: c644242801 mov byte ptr [rsp + 0x28], 1
1415c728c: 488d4d58 lea rcx, [rbp + 0x58]
1415c7290: 4c8d4d10 lea r9, [rbp + 0x10]
1415c7294: 4889fa mov rdx, rdi
1415c7297: 4989f0 mov r8, rsi
1415c729a: e881898000 call 0x141dcfc20
1415c729f: 90 nop 
1415c72a0: f30f104560 movss xmm0, dword ptr [rbp + 0x60]
1415c72a5: 31c0 xor eax, eax
1415c72a7: 837d5800 cmp dword ptr [rbp + 0x58], 0
1415c72ab: 0f95c0 setne al
1415c72ae: 4585ff test r15d, r15d
1415c72b1: 7424 je 0x1415c72d7
1415c72b3: 85c0 test eax, eax
1415c72b5: 7425 je 0x1415c72dc
1415c72b7: 0f28ce movaps xmm1, xmm6
1415c72ba: f30f5dc8 minss xmm1, xmm0
1415c72be: 0f28c1 movaps xmm0, xmm1
1415c72c1: f30fc2c103 cmpunordss xmm0, xmm1
1415c72c6: 0f28d0 movaps xmm2, xmm0
1415c72c9: 0f55d1 andnps xmm2, xmm1
1415c72cc: 0f54c6 andps xmm0, xmm6
1415c72cf: 0f56c2 orps xmm0, xmm2
1415c72d2: b801000000 mov eax, 1
1415c72d7: 0f28f0 movaps xmm6, xmm0
1415c72da: eb05 jmp 0x1415c72e1
1415c72dc: b801000000 mov eax, 1
1415c72e1: 0f28c6 movaps xmm0, xmm6
1415c72e4: 0f28b590000000 movaps xmm6, xmmword ptr [rbp + 0x90]
1415c72eb: 0f28bda0000000 movaps xmm7, xmmword ptr [rbp + 0xa0]
1415c72f2: 440f2885b0000000 movaps xmm8, xmmword ptr [rbp + 0xb0]
1415c72fa: 4881c448010000 add rsp, 0x148
1415c7301: 5b pop rbx
1415c7302: 5f pop rdi
1415c7303: 5e pop rsi
1415c7304: 415e pop r14
1415c7306: 415f pop r15
1415c7308: 5d pop rbp
1415c7309: c3 ret 
