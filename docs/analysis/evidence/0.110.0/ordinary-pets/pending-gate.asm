1458fb585: 410f2efa ucomiss xmm7, xmm10
1458fb589: 762a jbe 0x1458fb5b5
1458fb58b: 0fb68d1b010000 movzx ecx, byte ptr [rbp + 0x11b]
1458fb592: 88442428 mov byte ptr [rsp + 0x28], al
1458fb596: 884c2420 mov byte ptr [rsp + 0x20], cl
1458fb59a: c644243000 mov byte ptr [rsp + 0x30], 0
1458fb59f: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1458fb5a6: 4889fa mov rdx, rdi
1458fb5a9: 0f28d7 movaps xmm2, xmm7
1458fb5ac: 4189d9 mov r9d, ebx
1458fb5af: e8fce30300 call 0x1459399b0
1458fb5b4: 90 nop
1458fb5b5: 80bdb000000000 cmp byte ptr [rbp + 0xb0], 0
1458fb5bc: 0f8404010000 je 0x1458fb6c6
1458fb5c2: 448bbd00010000 mov r15d, dword ptr [rbp + 0x100]
1458fb5c9: 4183ff05 cmp r15d, 5
1458fb5cd: 7405 je 0x1458fb5d4
1458fb5cf: 0f57c0 xorps xmm0, xmm0
1458fb5d2: eb08 jmp 0x1458fb5dc
1458fb5d4: f30f108504010000 movss xmm0, dword ptr [rbp + 0x104]
1458fb5dc: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1458fb5e3: 8b81cc040000 mov eax, dword ptr [rcx + 0x4cc]
1458fb5e9: 83f803 cmp eax, 3
1458fb5ec: ba03000000 mov edx, 3
1458fb5f1: 0f43c2 cmovae eax, edx
1458fb5f4: 4c8b8178050000 mov r8, qword ptr [rcx + 0x578]
1458fb5fb: 4d85c0 test r8, r8
1458fb5fe: 0f8493000000 je 0x1458fb697
1458fb604: f30f109db4000000 movss xmm3, dword ptr [rbp + 0xb4]
1458fb60c: f30f108db8000000 movss xmm1, dword ptr [rbp + 0xb8]
1458fb614: 8b95bc000000 mov edx, dword ptr [rbp + 0xbc]
1458fb61a: ffc0 inc eax
1458fb61c: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1458fb623: 488b8970050000 mov rcx, qword ptr [rcx + 0x570]
1458fb62a: 4d69c0d8010000 imul r8, r8, 0x1d8
1458fb631: eb1d jmp 0x1458fb650
1458fb633: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458fb640: 4881c1d8010000 add rcx, 0x1d8
1458fb647: 4981c028feffff add r8, -0x1d8
1458fb64e: 7447 je 0x1458fb697
1458fb650: 4839b9f0000000 cmp qword ptr [rcx + 0xf0], rdi
1458fb657: 75e7 jne 0x1458fb640
1458fb659: 83b9b000000001 cmp dword ptr [rcx + 0xb0], 1
1458fb660: 74de je 0x1458fb640
1458fb662: 440fb6851b010000 movzx r8d, byte ptr [rbp + 0x11b]
1458fb66a: f3440f11442450 movss dword ptr [rsp + 0x50], xmm8
1458fb671: 4889442448 mov qword ptr [rsp + 0x48], rax
1458fb676: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
1458fb67c: 89542428 mov dword ptr [rsp + 0x28], edx
1458fb680: f30f114c2420 movss dword ptr [rsp + 0x20], xmm1
1458fb686: 48c744243800000000 mov qword ptr [rsp + 0x38], 0
1458fb68f: 89da mov edx, ebx
1458fb691: e8dac80900 call 0x145997f70
1458fb696: 90 nop
1458fb697: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1458fb69e: 4889fa mov rdx, rdi
1458fb6a1: 4189d8 mov r8d, ebx
1458fb6a4: 41b101 mov r9b, 1
1458fb6a7: e804d40400 call 0x145948ab0
1458fb6ac: 90 nop
1458fb6ad: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1458fb6b4: 4889fa mov rdx, rdi
1458fb6b7: 4189d8 mov r8d, ebx
1458fb6ba: e8d1de0400 call 0x145949590
1458fb6bf: 90 nop
1458fb6c0: 4183ff05 cmp r15d, 5
1458fb6c4: 741e je 0x1458fb6e4
1458fb6c6: 895c2420 mov dword ptr [rsp + 0x20], ebx
1458fb6ca: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1458fb6d1: 4889fa mov rdx, rdi
1458fb6d4: 4c8d8500010000 lea r8, [rbp + 0x100]
1458fb6db: 0f28df movaps xmm3, xmm7
1458fb6de: e81d9e0200 call 0x145925500
