145956e54 f34c0f2cc8 cvttss2si r9, xmm0
145956e59 410f2ec1 ucomiss xmm0, xmm9
145956e5d b800000000 mov eax, 0
145956e62 440f42c8 cmovb r9d, eax
145956e66 410f2ec2 ucomiss xmm0, xmm10
145956e6a b8ffffffff mov eax, 0xffffffff
145956e6f 440f47c8 cmova r9d, eax
145956e73 4180e701 and r15b, 1
145956e77 44887c2420 mov byte ptr [rsp + 0x20], r15b
145956e7c 488d4d60 lea rcx, [rbp + 0x60]
145956e80 488b55f0 mov rdx, qword ptr [rbp - 0x10]
145956e84 4d89e0 mov r8, r12
145956e87 e864ddf6ff call 0x1458c4bf0
