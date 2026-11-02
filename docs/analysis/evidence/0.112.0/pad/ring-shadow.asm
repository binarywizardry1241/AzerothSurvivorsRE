1426554b0: 56 push rsi
1426554b1: 57 push rdi
1426554b2: 53 push rbx
1426554b3: 4883ec30 sub rsp, 0x30
1426554b7: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1426554bc: 0f28f3 movaps xmm6, xmm3
1426554bf: 4489c3 mov ebx, r8d
1426554c2: 4889d7 mov rdi, rdx
1426554c5: 4889ce mov rsi, rcx
1426554c8: e833cd9afd call 0x140002200
1426554cd: b934000000 mov ecx, 0x34
1426554d2: ba04000000 mov edx, 4
1426554d7: e8e4cc9afd call 0x1400021c0
1426554dc: 4885c0 test rax, rax
1426554df: 747b je 0x14265555c
1426554e1: f30f10842498000000 movss xmm0, dword ptr [rsp + 0x98]
1426554ea: 8b8c2490000000 mov ecx, dword ptr [rsp + 0x90]
1426554f1: f30f108c2488000000 movss xmm1, dword ptr [rsp + 0x88]
1426554fa: 8b942480000000 mov edx, dword ptr [rsp + 0x80]
142655501: f30f10542478 movss xmm2, dword ptr [rsp + 0x78]
142655507: 448b442470 mov r8d, dword ptr [rsp + 0x70]
14265550c: 8918 mov dword ptr [rax], ebx
14265550e: f30f117004 movss dword ptr [rax + 4], xmm6
142655513: 44894008 mov dword ptr [rax + 8], r8d
142655517: f30f11500c movss dword ptr [rax + 0xc], xmm2
14265551c: 895010 mov dword ptr [rax + 0x10], edx
14265551f: f30f114814 movss dword ptr [rax + 0x14], xmm1
142655524: 894818 mov dword ptr [rax + 0x18], ecx
142655527: f30f11401c movss dword ptr [rax + 0x1c], xmm0
14265552c: 0f1007 movups xmm0, xmmword ptr [rdi]
14265552f: 0f114020 movups xmmword ptr [rax + 0x20], xmm0
142655533: 8b4f10 mov ecx, dword ptr [rdi + 0x10]
142655536: 894830 mov dword ptr [rax + 0x30], ecx
142655539: 48c70601000000 mov qword ptr [rsi], 1
142655540: 48894608 mov qword ptr [rsi + 8], rax
142655544: 48c7461001000000 mov qword ptr [rsi + 0x10], 1
14265554c: 4889f0 mov rax, rsi
14265554f: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
142655554: 4883c430 add rsp, 0x30
142655558: 5b pop rbx
142655559: 5f pop rdi
14265555a: 5e pop rsi
14265555b: c3 ret
14265555c: b904000000 mov ecx, 4
142655561: ba34000000 mov edx, 0x34
142655566: e8663f7503 call 0x145da94d1
14265556b: 0f0b ud2
