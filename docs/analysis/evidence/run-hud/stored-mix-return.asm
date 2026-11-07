144c84f18 893e mov dword ptr [rsi], edi
144c84f1a 0f117604 movups xmmword ptr [rsi + 4], xmm6
144c84f1e 4889f0 mov rax, rsi
144c84f21 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
144c84f26 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
144c84f2b 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
144c84f31 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
144c84f37 440f28542470 movaps xmm10, xmmword ptr [rsp + 0x70]
144c84f3d 440f289c2480000000 movaps xmm11, xmmword ptr [rsp + 0x80]
144c84f46 440f28a42490000000 movaps xmm12, xmmword ptr [rsp + 0x90]
144c84f4f 4881c4a8000000 add rsp, 0xa8
144c84f56 5f pop rdi
144c84f57 5e pop rsi
144c84f58 c3 ret
