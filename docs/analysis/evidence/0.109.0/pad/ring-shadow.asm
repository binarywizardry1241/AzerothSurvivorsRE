142649b80: 56 push rsi
142649b81: 57 push rdi
142649b82: 53 push rbx
142649b83: 4883ec30 sub rsp, 0x30
142649b87: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
142649b8c: 0f28f3 movaps xmm6, xmm3
142649b8f: 4489c3 mov ebx, r8d
142649b92: 4889d7 mov rdi, rdx
142649b95: 4889ce mov rsi, rcx
142649b98: e863869bfd call 0x140002200
142649b9d: b934000000 mov ecx, 0x34
142649ba2: ba04000000 mov edx, 4
142649ba7: e814869bfd call 0x1400021c0
142649bac: 4885c0 test rax, rax
142649baf: 747b je 0x142649c2c
142649bb1: f30f10842498000000 movss xmm0, dword ptr [rsp + 0x98]
142649bba: 8b8c2490000000 mov ecx, dword ptr [rsp + 0x90]
142649bc1: f30f108c2488000000 movss xmm1, dword ptr [rsp + 0x88]
142649bca: 8b942480000000 mov edx, dword ptr [rsp + 0x80]
142649bd1: f30f10542478 movss xmm2, dword ptr [rsp + 0x78]
142649bd7: 448b442470 mov r8d, dword ptr [rsp + 0x70]
142649bdc: 8918 mov dword ptr [rax], ebx
142649bde: f30f117004 movss dword ptr [rax + 4], xmm6
142649be3: 44894008 mov dword ptr [rax + 8], r8d
142649be7: f30f11500c movss dword ptr [rax + 0xc], xmm2
142649bec: 895010 mov dword ptr [rax + 0x10], edx
142649bef: f30f114814 movss dword ptr [rax + 0x14], xmm1
142649bf4: 894818 mov dword ptr [rax + 0x18], ecx
142649bf7: f30f11401c movss dword ptr [rax + 0x1c], xmm0
142649bfc: 0f1007 movups xmm0, xmmword ptr [rdi]
142649bff: 0f114020 movups xmmword ptr [rax + 0x20], xmm0
142649c03: 8b4f10 mov ecx, dword ptr [rdi + 0x10]
142649c06: 894830 mov dword ptr [rax + 0x30], ecx
142649c09: 48c70601000000 mov qword ptr [rsi], 1
142649c10: 48894608 mov qword ptr [rsi + 8], rax
142649c14: 48c7461001000000 mov qword ptr [rsi + 0x10], 1
142649c1c: 4889f0 mov rax, rsi
142649c1f: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
142649c24: 4883c430 add rsp, 0x30
142649c28: 5b pop rbx
142649c29: 5f pop rdi
142649c2a: 5e pop rsi
142649c2b: c3 ret
142649c2c: b904000000 mov ecx, 4
142649c31: ba34000000 mov edx, 0x34
142649c36: e866f67403 call 0x145d992a1
142649c3b: 0f0b ud2
