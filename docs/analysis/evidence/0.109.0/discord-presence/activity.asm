;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14006b460..0x14006e9bf SHA256 06ca7be7bf60701e79917d8620417c98a3fc2bbc6f739cd70bc80e10e3ee8f15
0x14006b460: push rbp
0x14006b461: push r15
0x14006b463: push r14
0x14006b465: push r13
0x14006b467: push r12
0x14006b469: push rsi
0x14006b46a: push rdi
0x14006b46b: push rbx
0x14006b46c: sub rsp, 0x2d8
0x14006b473: lea rbp, [rsp + 0x80]
0x14006b47b: movapd xmmword ptr [rbp + 0x240], xmm7
0x14006b483: movapd xmmword ptr [rbp + 0x230], xmm6
0x14006b48b: mov qword ptr [rbp + 0x228], 0xfffffffffffffffe
0x14006b496: mov r14, r9
0x14006b499: mov r13, r8
0x14006b49c: mov ebx, edx
0x14006b49e: mov qword ptr [rbp + 0x88], rcx
0x14006b4a5: call 0x140002200
0x14006b4aa: mov ecx, 0x20
0x14006b4af: mov edx, 8
0x14006b4b4: call 0x1400021c0
0x14006b4b9: test rax, rax
0x14006b4bc: je 0x14006dc40
0x14006b4c2: mov qword ptr [rbp + 0x210], rax
0x14006b4c9: mov qword ptr [rbp + 0xe8], 0
0x14006b4d4: mov qword ptr [rbp + 0xf8], 0
0x14006b4df: call 0x140002200
0x14006b4e4: mov ecx, 5
0x14006b4e9: mov edx, 1
0x14006b4ee: call 0x1400021c0
0x14006b4f3: test rax, rax
0x14006b4f6: je 0x14006e7ce
0x14006b4fc: mov byte ptr [rax + 4], 0x6c
0x14006b500: mov dword ptr [rax], 0x6562616c
0x14006b506: mov qword ptr [rbp + 0x1c0], 5
0x14006b511: mov qword ptr [rbp + 0x1b8], rax
0x14006b518: mov qword ptr [rbp + 0x1c8], rax
0x14006b51f: mov qword ptr [rbp + 0x1d0], 5
0x14006b52a: mov byte ptr [rbp + 0x21b], 1
0x14006b531: lea rcx, [rip + 0x5d63ff7]
0x14006b538: mov edx, 0x14
0x14006b53d: call 0x1458ec450
0x14006b542: nop
0x14006b543: mov rsi, rdx
0x14006b546: test rdx, rdx
0x14006b549: jns 0x14006b566
0x14006b54b: xor r12d, r12d
0x14006b54e: mov byte ptr [rbp + 0x21b], 1
0x14006b555: mov rcx, r12
0x14006b558: mov rdx, rsi
0x14006b55b: call 0x145d992bb
0x14006b560: nop
0x14006b561: jmp 0x14006e97a
0x14006b566: test rsi, rsi
0x14006b569: je 0x14006b59e
0x14006b56b: mov r15, rax
0x14006b56e: call 0x140002200
0x14006b573: mov r12d, 1
0x14006b579: mov edx, 1
0x14006b57e: mov rcx, rsi
0x14006b581: call 0x1400021c0
0x14006b586: test rax, rax
0x14006b589: je 0x14006b54e
0x14006b58b: mov rdi, rax
0x14006b58e: mov rcx, rax
0x14006b591: mov rdx, r15
0x14006b594: mov r8, rsi
0x14006b597: call 0x145bfa0e7
0x14006b59c: jmp 0x14006b5a3
0x14006b59e: mov edi, 1
0x14006b5a3: mov byte ptr [rbp + 0x138], 3
0x14006b5aa: mov qword ptr [rbp + 0x140], rsi
0x14006b5b1: mov qword ptr [rbp + 0x148], rdi
0x14006b5b8: mov qword ptr [rbp + 0x150], rsi
0x14006b5bf: mov byte ptr [rbp + 0x21b], 0
0x14006b5c6: lea rcx, [rbp + 0x1f0]
0x14006b5cd: lea rdx, [rbp + 0xe8]
0x14006b5d4: lea r8, [rbp + 0x1c0]
0x14006b5db: lea r9, [rbp + 0x138]
0x14006b5e2: call 0x140062cb0
0x14006b5e7: nop
0x14006b5e8: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006b5ef: je 0x14006b5fe
0x14006b5f1: lea rcx, [rbp + 0x1f0]
0x14006b5f8: call 0x14005e410
0x14006b5fd: nop
0x14006b5fe: call 0x140002200
0x14006b603: mov ecx, 3
0x14006b608: mov edx, 1
0x14006b60d: call 0x1400021c0
0x14006b612: test rax, rax
0x14006b615: je 0x14006e7e3
0x14006b61b: mov byte ptr [rax + 2], 0x6c
0x14006b61f: mov word ptr [rax], 0x7275
0x14006b624: mov qword ptr [rbp + 0x1c0], 3
0x14006b62f: mov qword ptr [rbp + 0x220], rax
0x14006b636: mov qword ptr [rbp + 0x1c8], rax
0x14006b63d: mov qword ptr [rbp + 0x1d0], 3
0x14006b648: call 0x140002200
0x14006b64d: mov ecx, 0x16
0x14006b652: mov edx, 1
0x14006b657: call 0x1400021c0
0x14006b65c: test rax, rax
0x14006b65f: mov qword ptr [rbp + 0x1b8], rax
0x14006b666: je 0x14006e7f8
0x14006b66c: movups xmm0, xmmword ptr [rip + 0x5d63ed0]
0x14006b673: movups xmmword ptr [rax], xmm0
0x14006b676: movabs rcx, 0x2f6c702e73756874
0x14006b680: mov qword ptr [rax + 0xe], rcx
0x14006b684: mov byte ptr [rbp + 0x138], 3
0x14006b68b: mov qword ptr [rbp + 0x140], 0x16
0x14006b696: mov qword ptr [rbp + 0x148], rax
0x14006b69d: mov qword ptr [rbp + 0x150], 0x16
0x14006b6a8: lea rcx, [rbp + 0x1f0]
0x14006b6af: lea rdx, [rbp + 0xe8]
0x14006b6b6: lea r8, [rbp + 0x1c0]
0x14006b6bd: lea r9, [rbp + 0x138]
0x14006b6c4: call 0x140062cb0
0x14006b6c9: nop
0x14006b6ca: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006b6d1: je 0x14006b6e0
0x14006b6d3: lea rcx, [rbp + 0x1f0]
0x14006b6da: call 0x14005e410
0x14006b6df: nop
0x14006b6e0: mov rcx, qword ptr [rbp + 0x2c0]
0x14006b6e7: mov rax, qword ptr [rbp + 0xf8]
0x14006b6ee: movups xmm0, xmmword ptr [rbp + 0xe8]
0x14006b6f5: movups xmmword ptr [rbp + 0x13f], xmm0
0x14006b6fc: mov qword ptr [rbp + 0x14f], rax
0x14006b703: mov rdx, qword ptr [rbp + 0x210]
0x14006b70a: mov byte ptr [rdx], 5
0x14006b70d: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006b715: mov rax, qword ptr [rbp + 0x147]
0x14006b71c: mov qword ptr [rdx + 0x10], rax
0x14006b720: mov rax, qword ptr [rbp + 0x14f]
0x14006b727: mov qword ptr [rdx + 0x18], rax
0x14006b72b: movupd xmmword ptr [rdx + 1], xmm0
0x14006b730: mov qword ptr [rbp], 1
0x14006b738: mov qword ptr [rbp + 8], rdx
0x14006b73c: mov qword ptr [rbp + 0x10], 1
0x14006b744: mov byte ptr [rbp - 8], 4
0x14006b748: cmp byte ptr [r13 + 0xe8], 0
0x14006b750: je 0x14006b81e
0x14006b756: cmp byte ptr [r13 + 0xc0], 0xff
0x14006b75e: je 0x14006b8ee
0x14006b764: mov qword ptr [rbp + 0x1b8], r13
0x14006b76b: add r13, 0xc0
0x14006b772: mov rax, qword ptr [rip + 0x801ec2f]
0x14006b779: mov rcx, qword ptr [rax + 8]
0x14006b77d: test rcx, rcx
0x14006b780: je 0x14006b923
0x14006b786: mov r14, qword ptr [rax]
0x14006b789: lea r15, [rcx + rcx*8]
0x14006b78d: shl r15, 4
0x14006b791: add r15, r14
0x14006b794: lea rsi, [rip + 0x5d62c55]
0x14006b79b: mov r12, qword ptr [rip + 0x7ff4aee]
0x14006b7a2: jmp 0x14006b7d3
0x14006b7a4: nop word ptr cs:[rax + rax]
0x14006b7b0: mov rcx, rbx
0x14006b7b3: mov r8, rdi
0x14006b7b6: call 0x145bfa0e1
0x14006b7bb: test eax, eax
0x14006b7bd: je 0x14006b926
0x14006b7c3: add r14, 0x90
0x14006b7ca: cmp r14, r15
0x14006b7cd: je 0x14006b923
0x14006b7d3: mov rcx, r14
0x14006b7d6: call 0x14588c140
0x14006b7db: nop
0x14006b7dc: mov rbx, rax
0x14006b7df: mov rdi, rdx
0x14006b7e2: mov edx, 5
0x14006b7e7: mov rcx, rsi
0x14006b7ea: mov r8, r13
0x14006b7ed: call 0x142aeace0
0x14006b7f2: nop
0x14006b7f3: test rax, rax
0x14006b7f6: jne 0x14006b7fb
0x14006b7f8: mov rax, r12
0x14006b7fb: cmp byte ptr [rax], 3
0x14006b7fe: jne 0x14006b810
0x14006b800: mov rdx, qword ptr [rax + 0x10]
0x14006b804: mov rax, qword ptr [rax + 0x18]
0x14006b808: cmp rdi, rax
0x14006b80b: jne 0x14006b7c3
0x14006b80d: jmp 0x14006b7b0
0x14006b80f: nop
0x14006b810: mov edx, 1
0x14006b815: xor eax, eax
0x14006b817: cmp rdi, rax
0x14006b81a: jne 0x14006b7c3
0x14006b81c: jmp 0x14006b7b0
0x14006b81e: mov qword ptr [rcx], 0
0x14006b825: test bl, 1
0x14006b828: je 0x14006b8ee
0x14006b82e: movzx ecx, byte ptr [r14 + 0x38]
0x14006b833: call 0x14588d790
0x14006b838: nop
0x14006b839: mov rsi, rax
0x14006b83c: movzx ecx, byte ptr [r14 + 0x39]
0x14006b841: call 0x14588d770
0x14006b846: nop
0x14006b847: mov rdi, rax
0x14006b84a: mov qword ptr [rbp + 0x98], 0
0x14006b855: mov qword ptr [rbp + 0xa8], 0
0x14006b860: call 0x140002200
0x14006b865: mov ecx, 7
0x14006b86a: mov edx, 1
0x14006b86f: call 0x1400021c0
0x14006b874: test rax, rax
0x14006b877: je 0x14006e80d
0x14006b87d: mov dword ptr [rax + 3], 0x736c6961
0x14006b884: mov dword ptr [rax], 0x61746564
0x14006b88a: mov qword ptr [rbp + 0x1c0], 7
0x14006b895: mov qword ptr [rbp + 0x210], rax
0x14006b89c: mov qword ptr [rbp + 0x1c8], rax
0x14006b8a3: mov qword ptr [rbp + 0x1d0], 7
0x14006b8ae: mov byte ptr [rbp + 0x21a], 1
0x14006b8b5: lea rcx, [rip + 0x5d63c9d]
0x14006b8bc: mov edx, 0xf
0x14006b8c1: call 0x1458ec450
0x14006b8c6: nop
0x14006b8c7: mov rbx, rdx
0x14006b8ca: test rdx, rdx
0x14006b8cd: jns 0x14006b9e2
0x14006b8d3: xor r13d, r13d
0x14006b8d6: mov byte ptr [rbp + 0x21a], 1
0x14006b8dd: mov rcx, r13
0x14006b8e0: mov rdx, rbx
0x14006b8e3: call 0x145d992bb
0x14006b8e8: nop
0x14006b8e9: jmp 0x14006e97a
0x14006b8ee: mov rax, qword ptr [rbp + 0x88]
0x14006b8f5: mov byte ptr [rax], 0xff
0x14006b8f8: lea rcx, [rbp - 8]
0x14006b8fc: call 0x14005e410
0x14006b901: movaps xmm6, xmmword ptr [rbp + 0x230]
0x14006b908: movaps xmm7, xmmword ptr [rbp + 0x240]
0x14006b90f: add rsp, 0x2d8
0x14006b916: pop rbx
0x14006b917: pop rdi
0x14006b918: pop rsi
0x14006b919: pop r12
0x14006b91b: pop r13
0x14006b91d: pop r14
0x14006b91f: pop r15
0x14006b921: pop rbp
0x14006b922: ret
0x14006b923: xor r14d, r14d
0x14006b926: mov rax, qword ptr [rbp + 0x1b8]
0x14006b92d: lea rsi, [rax + 0x60]
0x14006b931: movzx ebx, byte ptr [rax + 0x60]
0x14006b935: movzx r15d, byte ptr [rax + 0xa0]
0x14006b93d: add rax, 0xa0
0x14006b943: mov qword ptr [rbp + 0x1b8], rax
0x14006b94a: cmp r15b, 0xff
0x14006b94e: je 0x14006b992
0x14006b950: lea rcx, [rip + 0x5d63ca8]
0x14006b957: mov edx, 5
0x14006b95c: mov r8, qword ptr [rbp + 0x1b8]
0x14006b963: call 0x142aeace0
0x14006b968: nop
0x14006b969: test rax, rax
0x14006b96c: jne 0x14006b975
0x14006b96e: mov rax, qword ptr [rip + 0x7ff491b]
0x14006b975: cmp byte ptr [rax], 2
0x14006b978: jne 0x14006b992
0x14006b97a: mov rcx, qword ptr [rax + 8]
0x14006b97e: cmp rcx, 2
0x14006b982: je 0x14006ba25
0x14006b988: cmp ecx, 1
0x14006b98b: je 0x14006b9d7
0x14006b98d: jmp 0x14006ba2c
0x14006b992: xorpd xmm6, xmm6
0x14006b996: cmp bl, 0xff
0x14006b999: je 0x14006ba4c
0x14006b99f: lea rcx, [rip + 0x5d63c59]
0x14006b9a6: mov edx, 5
0x14006b9ab: mov r8, rsi
0x14006b9ae: call 0x142aeace0
0x14006b9b3: nop
0x14006b9b4: test rax, rax
0x14006b9b7: jne 0x14006b9c0
0x14006b9b9: mov rax, qword ptr [rip + 0x7ff48d0]
0x14006b9c0: cmp byte ptr [rax], 2
0x14006b9c3: jne 0x14006ba4c
0x14006b9c9: mov rcx, qword ptr [rax + 8]
0x14006b9cd: test rcx, rcx
0x14006b9d0: je 0x14006ba2c
0x14006b9d2: cmp ecx, 1
0x14006b9d5: jne 0x14006ba25
0x14006b9d7: xorps xmm6, xmm6
0x14006b9da: cvtsi2sd xmm6, qword ptr [rax + 0x10]
0x14006b9e0: jmp 0x14006ba4c
0x14006b9e2: test rbx, rbx
0x14006b9e5: je 0x14006c343
0x14006b9eb: mov r12, rax
0x14006b9ee: call 0x140002200
0x14006b9f3: mov r13d, 1
0x14006b9f9: mov edx, 1
0x14006b9fe: mov rcx, rbx
0x14006ba01: call 0x1400021c0
0x14006ba06: test rax, rax
0x14006ba09: je 0x14006b8d6
0x14006ba0f: mov r15, rax
0x14006ba12: mov rcx, rax
0x14006ba15: mov rdx, r12
0x14006ba18: mov r8, rbx
0x14006ba1b: call 0x145bfa0e7
0x14006ba20: jmp 0x14006c349
0x14006ba25: movsd xmm6, qword ptr [rax + 0x10]
0x14006ba2a: jmp 0x14006ba4c
0x14006ba2c: movsd xmm0, qword ptr [rax + 0x10]
0x14006ba31: unpcklps xmm0, xmmword ptr [rip + 0x5d61528]
0x14006ba38: subpd xmm0, xmmword ptr [rip + 0x5d61530]
0x14006ba40: movapd xmm6, xmm0
0x14006ba44: unpckhpd xmm6, xmm0
0x14006ba48: addsd xmm6, xmm0
0x14006ba4c: maxsd xmm6, qword ptr [rip + 0x5d3d26c]
0x14006ba54: cvttsd2si rax, xmm6
0x14006ba59: mov rcx, rax
0x14006ba5c: sar rcx, 0x3f
0x14006ba60: movapd xmm0, xmm6
0x14006ba64: subsd xmm0, qword ptr [rip + 0x5d61514]
0x14006ba6c: cvttsd2si rdx, xmm0
0x14006ba71: and rdx, rcx
0x14006ba74: or rdx, rax
0x14006ba77: xor eax, eax
0x14006ba79: xorpd xmm0, xmm0
0x14006ba7d: ucomisd xmm6, xmm0
0x14006ba81: cmovae rax, rdx
0x14006ba85: ucomisd xmm6, qword ptr [rip + 0x5d614fb]
0x14006ba8d: mov rcx, 0xffffffffffffffff
0x14006ba94: cmovbe rcx, rax
0x14006ba98: mov qword ptr [rbp + 0x28], rcx
0x14006ba9c: lea rcx, [rip + 0x5d63b61]
0x14006baa3: mov edx, 9
0x14006baa8: call 0x1458ec450
0x14006baad: nop
0x14006baae: mov rdi, rax
0x14006bab1: mov r12, rdx
0x14006bab4: cmp r15b, 0xff
0x14006bab8: je 0x14006bafe
0x14006baba: lea rcx, [rip + 0x5d63b4c]
0x14006bac1: mov edx, 5
0x14006bac6: mov r8, qword ptr [rbp + 0x1b8]
0x14006bacd: call 0x142aeace0
0x14006bad2: nop
0x14006bad3: test rax, rax
0x14006bad6: jne 0x14006badf
0x14006bad8: mov rax, qword ptr [rip + 0x7ff47b1]
0x14006badf: cmp byte ptr [rax], 2
0x14006bae2: jne 0x14006bafe
0x14006bae4: mov rcx, qword ptr [rax + 8]
0x14006bae8: cmp rcx, 2
0x14006baec: je 0x14006bb5e
0x14006baee: cmp ecx, 1
0x14006baf1: jne 0x14006bb3c
0x14006baf3: xorps xmm6, xmm6
0x14006baf6: cvtsi2sd xmm6, qword ptr [rax + 0x10]
0x14006bafc: jmp 0x14006bb63
0x14006bafe: xorpd xmm6, xmm6
0x14006bb02: cmp bl, 0xff
0x14006bb05: je 0x14006bb63
0x14006bb07: lea rcx, [rip + 0x5d63aff]
0x14006bb0e: mov edx, 5
0x14006bb13: mov r8, rsi
0x14006bb16: call 0x142aeace0
0x14006bb1b: nop
0x14006bb1c: test rax, rax
0x14006bb1f: jne 0x14006bb28
0x14006bb21: mov rax, qword ptr [rip + 0x7ff4768]
0x14006bb28: cmp byte ptr [rax], 2
0x14006bb2b: jne 0x14006bb63
0x14006bb2d: mov rcx, qword ptr [rax + 8]
0x14006bb31: cmp rcx, 2
0x14006bb35: je 0x14006bb5e
0x14006bb37: cmp ecx, 1
0x14006bb3a: je 0x14006baf3
0x14006bb3c: movsd xmm0, qword ptr [rax + 0x10]
0x14006bb41: unpcklps xmm0, xmmword ptr [rip + 0x5d61418]
0x14006bb48: subpd xmm0, xmmword ptr [rip + 0x5d61420]
0x14006bb50: movapd xmm6, xmm0
0x14006bb54: unpckhpd xmm6, xmm0
0x14006bb58: addsd xmm6, xmm0
0x14006bb5c: jmp 0x14006bb63
0x14006bb5e: movsd xmm6, qword ptr [rax + 0x10]
0x14006bb63: cvttsd2si rax, xmm6
0x14006bb68: mov rcx, rax
0x14006bb6b: sar rcx, 0x3f
0x14006bb6f: movapd xmm0, xmm6
0x14006bb73: subsd xmm0, qword ptr [rip + 0x5d61405]
0x14006bb7b: cvttsd2si rdx, xmm0
0x14006bb80: and rdx, rcx
0x14006bb83: or rdx, rax
0x14006bb86: xor eax, eax
0x14006bb88: xorpd xmm0, xmm0
0x14006bb8c: ucomisd xmm6, xmm0
0x14006bb90: cmovae rax, rdx
0x14006bb94: ucomisd xmm6, qword ptr [rip + 0x5d613ec]
0x14006bb9c: mov rcx, 0xffffffffffffffff
0x14006bba3: cmovbe rcx, rax
0x14006bba7: lea rdx, [rbp + 0x138]
0x14006bbae: mov r8d, 0x14
0x14006bbb4: call 0x145bd3fa0
0x14006bbb9: nop
0x14006bbba: test rdx, rdx
0x14006bbbd: jns 0x14006bbcf
0x14006bbbf: xor edi, edi
0x14006bbc1: mov rcx, rdi
0x14006bbc4: call 0x145d992bb
0x14006bbc9: nop
0x14006bbca: jmp 0x14006e97a
0x14006bbcf: test rdx, rdx
0x14006bbd2: mov qword ptr [rbp + 0x90], rsi
0x14006bbd9: mov byte ptr [rbp + 0x21f], bl
0x14006bbdf: je 0x14006bf6a
0x14006bbe5: mov qword ptr [rbp + 0xe0], r12
0x14006bbec: mov qword ptr [rbp + 0x108], rdi
0x14006bbf3: mov byte ptr [rbp + 0x130], r15b
0x14006bbfa: mov qword ptr [rbp + 0x128], r13
0x14006bc01: mov rsi, rax
0x14006bc04: mov qword ptr [rbp + 0x220], rdx
0x14006bc0b: call 0x140002200
0x14006bc10: mov edi, 1
0x14006bc15: mov edx, 1
0x14006bc1a: mov rcx, qword ptr [rbp + 0x220]
0x14006bc21: call 0x1400021c0
0x14006bc26: mov rdx, qword ptr [rbp + 0x220]
0x14006bc2d: test rax, rax
0x14006bc30: je 0x14006bbc1
0x14006bc32: mov r13, rax
0x14006bc35: mov rcx, rax
0x14006bc38: mov rax, rdx
0x14006bc3b: mov rdx, rsi
0x14006bc3e: mov rsi, rax
0x14006bc41: mov r8, rax
0x14006bc44: call 0x145bfa0e7
0x14006bc49: mov qword ptr [rbp + 0x138], 0
0x14006bc54: mov qword ptr [rbp + 0x140], 1
0x14006bc5f: mov qword ptr [rbp + 0x148], 0
0x14006bc6a: lea rax, [rsi + r13]
0x14006bc6e: mov qword ptr [rbp + 0x210], rax
0x14006bc75: mov r10d, 1
0x14006bc7b: xor r12d, r12d
0x14006bc7e: movabs rbx, 0xaaaaaaaaaaaaaaab
0x14006bc88: lea rcx, [rbp + 0x138]
0x14006bc8f: xor r15d, r15d
0x14006bc92: mov qword ptr [rbp + 0x30], r13
0x14006bc96: jmp 0x14006bccb
0x14006bc98: nop dword ptr [rax + rax]
0x14006bca0: or dl, 0xc0
0x14006bca3: mov byte ptr [r10 + r12], dl
0x14006bca7: mov byte ptr [r10 + r12 + 1], al
0x14006bcac: mov eax, 2
0x14006bcb1: add r12, rax
0x14006bcb4: mov qword ptr [rbp + 0x148], r12
0x14006bcbb: dec rsi
0x14006bcbe: cmp r13, qword ptr [rbp + 0x210]
0x14006bcc5: je 0x14006bf09
0x14006bccb: mov rax, rsi
0x14006bcce: mul rbx
0x14006bcd1: movzx r8d, byte ptr [r13]
0x14006bcd6: movzx edi, r8b
0x14006bcda: test dil, dil
0x14006bcdd: js 0x14006bd00
0x14006bcdf: inc r13
0x14006bce2: sub r15, 1
0x14006bce6: jae 0x14006bd80
0x14006bcec: jmp 0x14006bd8f
0x14006bcf1: nop word ptr cs:[rax + rax]
0x14006bd00: mov eax, edi
0x14006bd02: and eax, 0x1f
0x14006bd05: movzx r9d, byte ptr [r13 + 1]
0x14006bd0a: and r9d, 0x3f
0x14006bd0e: cmp dil, 0xdf
0x14006bd12: jbe 0x14006bd50
0x14006bd14: movzx edi, byte ptr [r13 + 2]
0x14006bd19: shl r9d, 6
0x14006bd1d: and edi, 0x3f
0x14006bd20: or edi, r9d
0x14006bd23: cmp r8b, 0xf0
0x14006bd27: jb 0x14006bd64
0x14006bd29: movzx r8d, byte ptr [r13 + 3]
0x14006bd2e: add r13, 4
0x14006bd32: and eax, 7
0x14006bd35: shl eax, 0x12
0x14006bd38: shl edi, 6
0x14006bd3b: and r8d, 0x3f
0x14006bd3f: or r8d, edi
0x14006bd42: or r8d, eax
0x14006bd45: mov edi, r8d
0x14006bd48: sub r15, 1
0x14006bd4c: jae 0x14006bd80
0x14006bd4e: jmp 0x14006bd8f
0x14006bd50: add r13, 2
0x14006bd54: shl eax, 6
0x14006bd57: or eax, r9d
0x14006bd5a: mov edi, eax
0x14006bd5c: sub r15, 1
0x14006bd60: jae 0x14006bd80
0x14006bd62: jmp 0x14006bd8f
0x14006bd64: add r13, 3
0x14006bd68: shl eax, 0xc
0x14006bd6b: or edi, eax
0x14006bd6d: sub r15, 1
0x14006bd71: jb 0x14006bd8f
0x14006bd73: nop word ptr cs:[rax + rax]
0x14006bd80: shr rdx, 1
0x14006bd83: lea rax, [rdx + rdx*2]
0x14006bd87: mov rdx, rsi
0x14006bd8a: sub rdx, rax
0x14006bd8d: je 0x14006bdb9
0x14006bd8f: cmp edi, 0x80
0x14006bd95: jae 0x14006bde0
0x14006bd97: cmp qword ptr [rbp + 0x138], r12
0x14006bd9e: je 0x14006be8d
0x14006bda4: mov r10, qword ptr [rbp + 0x140]
0x14006bdab: mov byte ptr [r10 + r12], dil
0x14006bdaf: mov eax, 1
0x14006bdb4: jmp 0x14006bcb1
0x14006bdb9: cmp qword ptr [rbp + 0x138], r12
0x14006bdc0: je 0x14006bed9
0x14006bdc6: mov byte ptr [r10 + r12], 0x2c
0x14006bdcb: inc r12
0x14006bdce: mov qword ptr [rbp + 0x148], r12
0x14006bdd5: cmp edi, 0x80
0x14006bddb: jb 0x14006bd97
0x14006bddd: nop dword ptr [rax]
0x14006bde0: cmp edi, 0x10000
0x14006bde6: mov r8d, 4
0x14006bdec: sbb r8, 0
0x14006bdf0: cmp edi, 0x800
0x14006bdf6: mov eax, 2
0x14006bdfb: cmovb r8, rax
0x14006bdff: mov rax, qword ptr [rbp + 0x138]
0x14006be06: sub rax, r12
0x14006be09: cmp r8, rax
0x14006be0c: ja 0x14006beb6
0x14006be12: mov eax, edi
0x14006be14: and al, 0x3f
0x14006be16: or al, 0x80
0x14006be18: mov edx, edi
0x14006be1a: shr edx, 6
0x14006be1d: mov r10, qword ptr [rbp + 0x140]
0x14006be24: cmp edi, 0x800
0x14006be2a: jb 0x14006bca0
0x14006be30: and dl, 0x3f
0x14006be33: or dl, 0x80
0x14006be36: mov r8d, edi
0x14006be39: shr r8d, 0xc
0x14006be3d: cmp edi, 0xffff
0x14006be43: ja 0x14006be61
0x14006be45: or r8b, 0xe0
0x14006be49: mov byte ptr [r10 + r12], r8b
0x14006be4d: mov byte ptr [r10 + r12 + 1], dl
0x14006be52: mov byte ptr [r10 + r12 + 2], al
0x14006be57: mov eax, 3
0x14006be5c: jmp 0x14006bcb1
0x14006be61: and r8b, 0x3f
0x14006be65: or r8b, 0x80
0x14006be69: shr edi, 0x12
0x14006be6c: or dil, 0xf0
0x14006be70: mov byte ptr [r10 + r12], dil
0x14006be74: mov byte ptr [r10 + r12 + 1], r8b
0x14006be79: mov byte ptr [r10 + r12 + 2], dl
0x14006be7e: mov byte ptr [r10 + r12 + 3], al
0x14006be83: mov eax, 4
0x14006be88: jmp 0x14006bcb1
0x14006be8d: mov qword ptr [rsp + 0x20], 1
0x14006be96: mov r8d, 1
0x14006be9c: mov r9d, 1
0x14006bea2: mov rdx, r12
0x14006bea5: call 0x145bfa970
0x14006beaa: lea rcx, [rbp + 0x138]
0x14006beb1: jmp 0x14006bda4
0x14006beb6: mov qword ptr [rsp + 0x20], 1
0x14006bebf: mov r9d, 1
0x14006bec5: mov rdx, r12
0x14006bec8: call 0x145bfa970
0x14006becd: lea rcx, [rbp + 0x138]
0x14006bed4: jmp 0x14006be12
0x14006bed9: mov qword ptr [rsp + 0x20], 1
0x14006bee2: mov r8d, 1
0x14006bee8: mov r9d, 1
0x14006beee: mov rdx, r12
0x14006bef1: call 0x145bfa970
0x14006bef6: lea rcx, [rbp + 0x138]
0x14006befd: mov r10, qword ptr [rbp + 0x140]
0x14006bf04: jmp 0x14006bdc6
0x14006bf09: mov rax, qword ptr [rbp + 0x148]
0x14006bf10: mov qword ptr [rbp + 0x200], rax
0x14006bf17: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006bf1f: movapd xmmword ptr [rbp + 0x1f0], xmm0
0x14006bf27: mov r8d, 1
0x14006bf2d: mov rcx, qword ptr [rbp + 0x30]
0x14006bf31: mov rdx, qword ptr [rbp + 0x220]
0x14006bf38: call 0x1400021d0
0x14006bf3d: mov rsi, qword ptr [rbp + 0x90]
0x14006bf44: movzx ebx, byte ptr [rbp + 0x21f]
0x14006bf4b: mov r13, qword ptr [rbp + 0x128]
0x14006bf52: movzx r15d, byte ptr [rbp + 0x130]
0x14006bf5a: mov rdi, qword ptr [rbp + 0x108]
0x14006bf61: mov r12, qword ptr [rbp + 0xe0]
0x14006bf68: jmp 0x14006bfa7
0x14006bf6a: mov qword ptr [rbp + 0x138], 0
0x14006bf75: mov qword ptr [rbp + 0x140], 1
0x14006bf80: mov rax, qword ptr [rbp + 0x138]
0x14006bf87: mov qword ptr [rbp + 0x1f0], rax
0x14006bf8e: mov rax, qword ptr [rbp + 0x140]
0x14006bf95: mov qword ptr [rbp + 0x1f8], rax
0x14006bf9c: mov qword ptr [rbp + 0x200], 0
0x14006bfa7: lea rax, [rip + 0x5d62cb5]
0x14006bfae: mov qword ptr [rbp + 0x138], rax
0x14006bfb5: mov qword ptr [rbp + 0x140], 1
0x14006bfc0: lea rax, [rbp + 0x1f0]
0x14006bfc7: mov qword ptr [rbp + 0x148], rax
0x14006bfce: lea rax, [rip + 0x5d62683]
0x14006bfd5: mov qword ptr [rbp + 0x150], rax
0x14006bfdc: mov qword ptr [rsp + 0x20], 1
0x14006bfe5: lea rcx, [rbp + 0x98]
0x14006bfec: lea r9, [rbp + 0x138]
0x14006bff3: mov rdx, rdi
0x14006bff6: mov r8, r12
0x14006bff9: call 0x1458ec8b0
0x14006bffe: nop
0x14006bfff: mov rdx, qword ptr [rbp + 0x1f0]
0x14006c006: test rdx, rdx
0x14006c009: je 0x14006c01d
0x14006c00b: mov rcx, qword ptr [rbp + 0x1f8]
0x14006c012: mov r8d, 1
0x14006c018: call 0x1400021d0
0x14006c01d: cmp bl, 0xff
0x14006c020: je 0x14006c059
0x14006c022: lea rcx, [rip + 0x5d635e9]
0x14006c029: mov edx, 5
0x14006c02e: mov r8, rsi
0x14006c031: call 0x142aeace0
0x14006c036: nop
0x14006c037: test rax, rax
0x14006c03a: jne 0x14006c043
0x14006c03c: mov rax, qword ptr [rip + 0x7ff424d]
0x14006c043: cmp byte ptr [rax], 3
0x14006c046: jne 0x14006c08e
0x14006c048: mov rcx, qword ptr [rax + 0x10]
0x14006c04c: mov qword ptr [rbp + 0x128], rcx
0x14006c053: mov rax, qword ptr [rax + 0x18]
0x14006c057: jmp 0x14006c0a1
0x14006c059: mov qword ptr [rbp + 0x130], 0
0x14006c064: mov eax, 5
0x14006c069: mov qword ptr [rbp + 0x210], rax
0x14006c070: lea rax, [rip + 0x5d635a0]
0x14006c077: mov qword ptr [rbp + 0x128], rax
0x14006c07e: mov qword ptr [rbp + 0x220], 0
0x14006c089: jmp 0x14006c117
0x14006c08e: lea rax, [rip + 0x5d63582]
0x14006c095: mov qword ptr [rbp + 0x128], rax
0x14006c09c: mov eax, 5
0x14006c0a1: mov qword ptr [rbp + 0x210], rax
0x14006c0a8: lea rcx, [rip + 0x5d6356d]
0x14006c0af: mov edx, 7
0x14006c0b4: mov r8, rsi
0x14006c0b7: call 0x142aeace0
0x14006c0bc: nop
0x14006c0bd: test rax, rax
0x14006c0c0: jne 0x14006c0c9
0x14006c0c2: mov rax, qword ptr [rip + 0x7ff41c7]
0x14006c0c9: cmp byte ptr [rax], 1
0x14006c0cc: jne 0x14006c0db
0x14006c0ce: movzx eax, byte ptr [rax + 1]
0x14006c0d2: mov qword ptr [rbp + 0x130], rax
0x14006c0d9: jmp 0x14006c0e6
0x14006c0db: mov qword ptr [rbp + 0x130], 0
0x14006c0e6: lea rcx, [rip + 0x5d63536]
0x14006c0ed: mov edx, 4
0x14006c0f2: mov r8, rsi
0x14006c0f5: call 0x142aeace0
0x14006c0fa: nop
0x14006c0fb: test rax, rax
0x14006c0fe: jne 0x14006c107
0x14006c100: mov rax, qword ptr [rip + 0x7ff4189]
0x14006c107: xor ecx, ecx
0x14006c109: cmp byte ptr [rax], 5
0x14006c10c: cmove rcx, rax
0x14006c110: mov qword ptr [rbp + 0x220], rcx
0x14006c117: lea rcx, [rip + 0x5d63509]
0x14006c11e: mov edx, 2
0x14006c123: mov r8, r13
0x14006c126: call 0x142aeace0
0x14006c12b: nop
0x14006c12c: test rax, rax
0x14006c12f: jne 0x14006c138
0x14006c131: mov rax, qword ptr [rip + 0x7ff4158]
0x14006c138: cmp byte ptr [rax], 3
0x14006c13b: jne 0x14006c147
0x14006c13d: mov rcx, qword ptr [rax + 0x10]
0x14006c141: mov rax, qword ptr [rax + 0x18]
0x14006c145: jmp 0x14006c14e
0x14006c147: mov ecx, 1
0x14006c14c: xor eax, eax
0x14006c14e: mov qword ptr [rbp + 0xb0], rcx
0x14006c155: mov qword ptr [rbp + 0xb8], rax
0x14006c15c: lea r12, [rip + 0x5d63436]
0x14006c163: mov edx, 4
0x14006c168: mov rcx, r12
0x14006c16b: mov r8, r13
0x14006c16e: call 0x142aeace0
0x14006c173: nop
0x14006c174: test rax, rax
0x14006c177: jne 0x14006c180
0x14006c179: mov rax, qword ptr [rip + 0x7ff4110]
0x14006c180: cmp byte ptr [rax], 3
0x14006c183: jne 0x14006c1ef
0x14006c185: mov rcx, qword ptr [rax + 0x18]
0x14006c189: test rcx, rcx
0x14006c18c: je 0x14006c1ef
0x14006c18e: mov rax, qword ptr [rax + 0x10]
0x14006c192: mov qword ptr [rbp + 0xe8], rax
0x14006c199: mov qword ptr [rbp + 0xf0], rcx
0x14006c1a0: lea rcx, [rip + 0x5d63482]
0x14006c1a7: mov edx, 0x24
0x14006c1ac: call 0x1458ec450
0x14006c1b1: nop
0x14006c1b2: mov rsi, rax
0x14006c1b5: mov rdi, rdx
0x14006c1b8: lea rcx, [rip + 0x5d63401]
0x14006c1bf: mov edx, 4
0x14006c1c4: mov r8, r13
0x14006c1c7: call 0x142aeace0
0x14006c1cc: nop
0x14006c1cd: test rax, rax
0x14006c1d0: jne 0x14006c1d9
0x14006c1d2: mov rax, qword ptr [rip + 0x7ff40b7]
0x14006c1d9: cmp byte ptr [rax], 3
0x14006c1dc: jne 0x14006c54e
0x14006c1e2: mov rcx, qword ptr [rax + 0x10]
0x14006c1e6: mov rax, qword ptr [rax + 0x18]
0x14006c1ea: jmp 0x14006c555
0x14006c1ef: lea rcx, [rip + 0x5d6347a]
0x14006c1f6: mov edx, 0x1c
0x14006c1fb: call 0x1458ec450
0x14006c200: nop
0x14006c201: mov rsi, rax
0x14006c204: mov r12, rdx
0x14006c207: lea rbx, [rip + 0x5d633b2]
0x14006c20e: mov edx, 4
0x14006c213: mov rcx, rbx
0x14006c216: mov r8, r13
0x14006c219: call 0x142aeace0
0x14006c21e: nop
0x14006c21f: test rax, rax
0x14006c222: jne 0x14006c22b
0x14006c224: mov rax, qword ptr [rip + 0x7ff4065]
0x14006c22b: cmp byte ptr [rax], 3
0x14006c22e: jne 0x14006c23a
0x14006c230: mov rcx, qword ptr [rax + 0x10]
0x14006c234: mov rax, qword ptr [rax + 0x18]
0x14006c238: jmp 0x14006c241
0x14006c23a: mov ecx, 1
0x14006c23f: xor eax, eax
0x14006c241: mov qword ptr [rbp + 0x1c0], rcx
0x14006c248: mov qword ptr [rbp + 0x1c8], rax
0x14006c24f: lea rdi, [rip + 0x5d6219a]
0x14006c256: mov edx, 5
0x14006c25b: mov rcx, rdi
0x14006c25e: mov r8, r13
0x14006c261: call 0x142aeace0
0x14006c266: nop
0x14006c267: test rax, rax
0x14006c26a: jne 0x14006c273
0x14006c26c: mov rax, qword ptr [rip + 0x7ff401d]
0x14006c273: cmp byte ptr [rax], 3
0x14006c276: jne 0x14006c282
0x14006c278: mov rcx, qword ptr [rax + 0x10]
0x14006c27c: mov rax, qword ptr [rax + 0x18]
0x14006c280: jmp 0x14006c289
0x14006c282: mov ecx, 1
0x14006c287: xor eax, eax
0x14006c289: mov qword ptr [rbp + 0x1f0], rcx
0x14006c290: mov qword ptr [rbp + 0x1f8], rax
0x14006c297: lea rax, [rip + 0x5d63361]
0x14006c29e: mov qword ptr [rbp + 0x138], rax
0x14006c2a5: mov qword ptr [rbp + 0x140], 5
0x14006c2b0: lea rax, [rbp + 0x28]
0x14006c2b4: mov qword ptr [rbp + 0x148], rax
0x14006c2bb: lea rax, [rip + 0x5d6338e]
0x14006c2c2: mov qword ptr [rbp + 0x150], rax
0x14006c2c9: mov qword ptr [rbp + 0x158], rbx
0x14006c2d0: mov qword ptr [rbp + 0x160], 4
0x14006c2db: lea rax, [rbp + 0x1c0]
0x14006c2e2: mov qword ptr [rbp + 0x168], rax
0x14006c2e9: lea rax, [rip + 0x5d632b0]
0x14006c2f0: mov qword ptr [rbp + 0x170], rax
0x14006c2f7: mov qword ptr [rbp + 0x178], rdi
0x14006c2fe: mov qword ptr [rbp + 0x180], 5
0x14006c309: lea rcx, [rbp + 0x1f0]
0x14006c310: mov qword ptr [rbp + 0x188], rcx
0x14006c317: mov qword ptr [rbp + 0x190], rax
0x14006c31e: mov qword ptr [rsp + 0x20], 3
0x14006c327: lea rcx, [rbp + 0x70]
0x14006c32b: lea r9, [rbp + 0x138]
0x14006c332: mov rdx, rsi
0x14006c335: mov r8, r12
0x14006c338: call 0x1458ec8b0
0x14006c33d: nop
0x14006c33e: jmp 0x14006c680
0x14006c343: mov r15d, 1
0x14006c349: mov byte ptr [rbp + 0x138], 3
0x14006c350: mov qword ptr [rbp + 0x140], rbx
0x14006c357: mov qword ptr [rbp + 0x148], r15
0x14006c35e: mov qword ptr [rbp + 0x150], rbx
0x14006c365: mov byte ptr [rbp + 0x21a], 0
0x14006c36c: lea rcx, [rbp + 0x1f0]
0x14006c373: lea rdx, [rbp + 0x98]
0x14006c37a: lea r8, [rbp + 0x1c0]
0x14006c381: lea r9, [rbp + 0x138]
0x14006c388: call 0x140062cb0
0x14006c38d: nop
0x14006c38e: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006c395: je 0x14006c3a4
0x14006c397: lea rcx, [rbp + 0x1f0]
0x14006c39e: call 0x14005e410
0x14006c3a3: nop
0x14006c3a4: call 0x140002200
0x14006c3a9: mov ecx, 5
0x14006c3ae: mov edx, 1
0x14006c3b3: call 0x1400021c0
0x14006c3b8: test rax, rax
0x14006c3bb: je 0x14006e861
0x14006c3c1: mov byte ptr [rax + 4], 0x65
0x14006c3c5: mov dword ptr [rax], 0x74617473
0x14006c3cb: mov qword ptr [rbp + 0x110], 5
0x14006c3d6: mov qword ptr [rbp + 0x1b8], rax
0x14006c3dd: mov qword ptr [rbp + 0x118], rax
0x14006c3e4: mov qword ptr [rbp + 0x120], 5
0x14006c3ef: lea rcx, [rip + 0x5d6318a]
0x14006c3f6: mov edx, 0x19
0x14006c3fb: call 0x1458ec450
0x14006c400: nop
0x14006c401: mov rbx, rax
0x14006c404: mov r15, rdx
0x14006c407: mov rcx, rdi
0x14006c40a: call 0x14588c300
0x14006c40f: nop
0x14006c410: mov qword ptr [rbp + 0x70], rax
0x14006c414: mov qword ptr [rbp + 0x78], rdx
0x14006c418: mov rcx, rsi
0x14006c41b: call 0x14588c140
0x14006c420: nop
0x14006c421: mov qword ptr [rbp + 0xc0], rax
0x14006c428: mov qword ptr [rbp + 0xc8], rdx
0x14006c42f: lea rax, [rip + 0x5d63163]
0x14006c436: mov qword ptr [rbp + 0x138], rax
0x14006c43d: mov qword ptr [rbp + 0x140], 4
0x14006c448: mov qword ptr [rbp + 0x148], r14
0x14006c44f: lea rax, [rip + 0x5d62202]
0x14006c456: mov qword ptr [rbp + 0x150], rax
0x14006c45d: lea rax, [rip + 0x5d6315c]
0x14006c464: mov qword ptr [rbp + 0x158], rax
0x14006c46b: mov qword ptr [rbp + 0x160], 4
0x14006c476: lea rax, [rbp + 0x70]
0x14006c47a: mov qword ptr [rbp + 0x168], rax
0x14006c481: lea r12, [rip + 0x5d63118]
0x14006c488: mov qword ptr [rbp + 0x170], r12
0x14006c48f: lea rax, [rip + 0x5d61f5a]
0x14006c496: mov qword ptr [rbp + 0x178], rax
0x14006c49d: mov qword ptr [rbp + 0x180], 5
0x14006c4a8: lea rax, [rbp + 0xc0]
0x14006c4af: mov qword ptr [rbp + 0x188], rax
0x14006c4b6: mov qword ptr [rbp + 0x190], r12
0x14006c4bd: mov qword ptr [rsp + 0x20], 3
0x14006c4c6: lea rcx, [rbp + 0xe8]
0x14006c4cd: lea r9, [rbp + 0x138]
0x14006c4d4: mov rdx, rbx
0x14006c4d7: mov r8, r15
0x14006c4da: call 0x1458ec8b0
0x14006c4df: nop
0x14006c4e0: mov r13, qword ptr [rbp + 0xf0]
0x14006c4e7: mov rdi, qword ptr [rbp + 0xf8]
0x14006c4ee: test rdi, rdi
0x14006c4f1: mov qword ptr [rbp + 0x210], r13
0x14006c4f8: jns 0x14006c515
0x14006c4fa: xor r15d, r15d
0x14006c4fd: mov byte ptr [rbp + 0x1ef], 1
0x14006c504: mov rcx, r15
0x14006c507: mov rdx, rdi
0x14006c50a: call 0x145d992bb
0x14006c50f: nop
0x14006c510: jmp 0x14006e97a
0x14006c515: je 0x14006c83d
0x14006c51b: call 0x140002200
0x14006c520: mov r15d, 1
0x14006c526: mov edx, 1
0x14006c52b: mov rcx, rdi
0x14006c52e: call 0x1400021c0
0x14006c533: test rax, rax
0x14006c536: je 0x14006c4fd
0x14006c538: mov rbx, rax
0x14006c53b: mov rcx, rax
0x14006c53e: mov rdx, r13
0x14006c541: mov r8, rdi
0x14006c544: call 0x145bfa0e7
0x14006c549: jmp 0x14006c842
0x14006c54e: mov ecx, 1
0x14006c553: xor eax, eax
0x14006c555: mov qword ptr [rbp + 0x1c0], rcx
0x14006c55c: mov qword ptr [rbp + 0x1c8], rax
0x14006c563: lea rbx, [rip + 0x5d61e86]
0x14006c56a: mov edx, 5
0x14006c56f: mov rcx, rbx
0x14006c572: mov r8, r13
0x14006c575: call 0x142aeace0
0x14006c57a: nop
0x14006c57b: test rax, rax
0x14006c57e: jne 0x14006c587
0x14006c580: mov rax, qword ptr [rip + 0x7ff3d09]
0x14006c587: cmp byte ptr [rax], 3
0x14006c58a: jne 0x14006c596
0x14006c58c: mov rcx, qword ptr [rax + 0x10]
0x14006c590: mov rax, qword ptr [rax + 0x18]
0x14006c594: jmp 0x14006c59d
0x14006c596: mov ecx, 1
0x14006c59b: xor eax, eax
0x14006c59d: mov qword ptr [rbp + 0x1f0], rcx
0x14006c5a4: mov qword ptr [rbp + 0x1f8], rax
0x14006c5ab: mov qword ptr [rbp + 0x138], r12
0x14006c5b2: mov qword ptr [rbp + 0x140], 4
0x14006c5bd: lea rax, [rbp + 0xe8]
0x14006c5c4: mov qword ptr [rbp + 0x148], rax
0x14006c5cb: lea rax, [rip + 0x5d62fce]
0x14006c5d2: mov qword ptr [rbp + 0x150], rax
0x14006c5d9: lea rcx, [rip + 0x5d6301f]
0x14006c5e0: mov qword ptr [rbp + 0x158], rcx
0x14006c5e7: mov qword ptr [rbp + 0x160], 5
0x14006c5f2: lea rcx, [rbp + 0x28]
0x14006c5f6: mov qword ptr [rbp + 0x168], rcx
0x14006c5fd: lea rcx, [rip + 0x5d6304c]
0x14006c604: mov qword ptr [rbp + 0x170], rcx
0x14006c60b: lea rcx, [rip + 0x5d62fae]
0x14006c612: mov qword ptr [rbp + 0x178], rcx
0x14006c619: mov qword ptr [rbp + 0x180], 4
0x14006c624: lea rcx, [rbp + 0x1c0]
0x14006c62b: mov qword ptr [rbp + 0x188], rcx
0x14006c632: mov qword ptr [rbp + 0x190], rax
0x14006c639: mov qword ptr [rbp + 0x198], rbx
0x14006c640: mov qword ptr [rbp + 0x1a0], 5
0x14006c64b: lea rcx, [rbp + 0x1f0]
0x14006c652: mov qword ptr [rbp + 0x1a8], rcx
0x14006c659: mov qword ptr [rbp + 0x1b0], rax
0x14006c660: mov qword ptr [rsp + 0x20], 4
0x14006c669: lea rcx, [rbp + 0x70]
0x14006c66d: lea r9, [rbp + 0x138]
0x14006c674: mov rdx, rsi
0x14006c677: mov r8, rdi
0x14006c67a: call 0x1458ec8b0
0x14006c67f: nop
0x14006c680: cmp r15b, 0xff
0x14006c684: mov rdx, qword ptr [rbp + 0x210]
0x14006c68b: je 0x14006c789
0x14006c691: mov r15, r13
0x14006c694: lea rcx, [rip + 0x5d62ff1]
0x14006c69b: mov edx, 4
0x14006c6a0: mov r8, qword ptr [rbp + 0x1b8]
0x14006c6a7: call 0x142aeace0
0x14006c6ac: nop
0x14006c6ad: test rax, rax
0x14006c6b0: jne 0x14006c6b9
0x14006c6b2: mov rax, qword ptr [rip + 0x7ff3bd7]
0x14006c6b9: cmp byte ptr [rax], 3
0x14006c6bc: jne 0x14006cce9
0x14006c6c2: cmp qword ptr [rax + 0x18], 7
0x14006c6c7: jne 0x14006cce9
0x14006c6cd: mov rax, qword ptr [rax + 0x10]
0x14006c6d1: mov ecx, 0x74636976
0x14006c6d6: xor ecx, dword ptr [rax]
0x14006c6d8: mov edx, 0x79726f74
0x14006c6dd: xor edx, dword ptr [rax + 3]
0x14006c6e0: or edx, ecx
0x14006c6e2: jne 0x14006cce9
0x14006c6e8: lea rcx, [rip + 0x5d62fa1]
0x14006c6ef: mov edx, 0x1e
0x14006c6f4: call 0x1458ec450
0x14006c6f9: nop
0x14006c6fa: mov r8, rdx
0x14006c6fd: lea rcx, [rip + 0x5d62f23]
0x14006c704: mov qword ptr [rbp + 0x138], rcx
0x14006c70b: mov qword ptr [rbp + 0x140], 2
0x14006c716: lea rcx, [rbp + 0xb0]
0x14006c71d: mov qword ptr [rbp + 0x148], rcx
0x14006c724: lea rcx, [rip + 0x5d62e75]
0x14006c72b: mov qword ptr [rbp + 0x150], rcx
0x14006c732: lea rcx, [rip + 0x5d62ed4]
0x14006c739: mov qword ptr [rbp + 0x158], rcx
0x14006c740: mov qword ptr [rbp + 0x160], 5
0x14006c74b: lea rcx, [rbp + 0x98]
0x14006c752: mov qword ptr [rbp + 0x168], rcx
0x14006c759: lea rcx, [rip + 0x5d61ef8]
0x14006c760: mov qword ptr [rbp + 0x170], rcx
0x14006c767: mov qword ptr [rsp + 0x20], 2
0x14006c770: lea rcx, [rbp + 0x38]
0x14006c774: lea r9, [rbp + 0x138]
0x14006c77b: mov rdx, rax
0x14006c77e: call 0x1458ec8b0
0x14006c783: nop
0x14006c784: jmp 0x14006cd85
0x14006c789: mov r15, r13
0x14006c78c: cmp rdx, 4
0x14006c790: je 0x14006cc74
0x14006c796: cmp rdx, 5
0x14006c79a: je 0x14006cbe4
0x14006c7a0: cmp rdx, 6
0x14006c7a4: mov rbx, qword ptr [rbp + 0x220]
0x14006c7ab: jne 0x14006cc8a
0x14006c7b1: mov eax, 0x73756170
0x14006c7b6: mov rcx, qword ptr [rbp + 0x128]
0x14006c7bd: xor eax, dword ptr [rcx]
0x14006c7bf: movzx ecx, word ptr [rcx + 4]
0x14006c7c3: xor ecx, 0x6465
0x14006c7c9: or ecx, eax
0x14006c7cb: jne 0x14006cc8a
0x14006c7d1: lea rcx, [rip + 0x5d62f5d]
0x14006c7d8: mov edx, 0x19
0x14006c7dd: call 0x1458ec450
0x14006c7e2: nop
0x14006c7e3: mov r8, rdx
0x14006c7e6: lea rcx, [rip + 0x5d62e3a]
0x14006c7ed: mov qword ptr [rbp + 0x138], rcx
0x14006c7f4: mov qword ptr [rbp + 0x140], 2
0x14006c7ff: lea rcx, [rbp + 0xb0]
0x14006c806: mov qword ptr [rbp + 0x148], rcx
0x14006c80d: lea rcx, [rip + 0x5d62d8c]
0x14006c814: mov qword ptr [rbp + 0x150], rcx
0x14006c81b: mov qword ptr [rsp + 0x20], 1
0x14006c824: lea rcx, [rbp + 0x38]
0x14006c828: lea r9, [rbp + 0x138]
0x14006c82f: mov rdx, rax
0x14006c832: call 0x1458ec8b0
0x14006c837: nop
0x14006c838: jmp 0x14006cd85
0x14006c83d: mov ebx, 1
0x14006c842: mov byte ptr [rbp + 0x1f0], 3
0x14006c849: mov qword ptr [rbp + 0x1f8], rdi
0x14006c850: mov qword ptr [rbp + 0x200], rbx
0x14006c857: mov qword ptr [rbp + 0x208], rdi
0x14006c85e: mov byte ptr [rbp + 0x1ef], 0
0x14006c865: lea rcx, [rbp + 0x1c0]
0x14006c86c: lea rdx, [rbp + 0x98]
0x14006c873: lea r8, [rbp + 0x110]
0x14006c87a: lea r9, [rbp + 0x1f0]
0x14006c881: call 0x140062cb0
0x14006c886: nop
0x14006c887: cmp byte ptr [rbp + 0x1c0], 0xff
0x14006c88e: je 0x14006c89d
0x14006c890: lea rcx, [rbp + 0x1c0]
0x14006c897: call 0x14005e410
0x14006c89c: nop
0x14006c89d: mov rdx, qword ptr [rbp + 0xe8]
0x14006c8a4: test rdx, rdx
0x14006c8a7: je 0x14006c8bb
0x14006c8a9: mov r8d, 1
0x14006c8af: mov rcx, qword ptr [rbp + 0x210]
0x14006c8b6: call 0x1400021d0
0x14006c8bb: call 0x140002200
0x14006c8c0: mov ecx, 6
0x14006c8c5: mov edx, 1
0x14006c8ca: call 0x1400021c0
0x14006c8cf: test rax, rax
0x14006c8d2: je 0x14006e876
0x14006c8d8: mov rdi, rax
0x14006c8db: mov word ptr [rax + 4], 0x7374
0x14006c8e1: mov dword ptr [rax], 0x65737361
0x14006c8e7: mov qword ptr [rbp + 0x70], 6
0x14006c8ef: mov qword ptr [rbp + 0x78], rax
0x14006c8f3: mov qword ptr [rbp + 0x80], 6
0x14006c8fe: mov qword ptr [rbp + 0xc0], 0
0x14006c909: mov qword ptr [rbp + 0xd0], 0
0x14006c914: call 0x140002200
0x14006c919: mov ecx, 0xb
0x14006c91e: mov edx, 1
0x14006c923: call 0x1400021c0
0x14006c928: test rax, rax
0x14006c92b: mov qword ptr [rbp + 0x1b8], rdi
0x14006c932: je 0x14006e88b
0x14006c938: movabs rcx, 0x6d695f656772616c
0x14006c942: mov qword ptr [rax], rcx
0x14006c945: mov dword ptr [rax + 7], 0x6567616d
0x14006c94c: mov qword ptr [rbp + 0x1c0], 0xb
0x14006c957: mov qword ptr [rbp + 0x220], rax
0x14006c95e: mov qword ptr [rbp + 0x1c8], rax
0x14006c965: mov qword ptr [rbp + 0x1d0], 0xb
0x14006c970: call 0x140002200
0x14006c975: mov ecx, 4
0x14006c97a: mov edx, 1
0x14006c97f: call 0x1400021c0
0x14006c984: test rax, rax
0x14006c987: mov qword ptr [rbp + 0x210], rax
0x14006c98e: je 0x14006e8a0
0x14006c994: mov dword ptr [rax], 0x6f676f6c
0x14006c99a: mov byte ptr [rbp + 0x138], 3
0x14006c9a1: mov qword ptr [rbp + 0x140], 4
0x14006c9ac: mov qword ptr [rbp + 0x148], rax
0x14006c9b3: mov qword ptr [rbp + 0x150], 4
0x14006c9be: lea rcx, [rbp + 0x1f0]
0x14006c9c5: lea rdx, [rbp + 0xc0]
0x14006c9cc: lea r8, [rbp + 0x1c0]
0x14006c9d3: lea r9, [rbp + 0x138]
0x14006c9da: call 0x140062cb0
0x14006c9df: nop
0x14006c9e0: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006c9e7: je 0x14006c9f6
0x14006c9e9: lea rcx, [rbp + 0x1f0]
0x14006c9f0: call 0x14005e410
0x14006c9f5: nop
0x14006c9f6: call 0x140002200
0x14006c9fb: mov ecx, 0xa
0x14006ca00: mov edx, 1
0x14006ca05: call 0x1400021c0
0x14006ca0a: test rax, rax
0x14006ca0d: je 0x14006e8b5
0x14006ca13: movabs rcx, 0x65745f656772616c
0x14006ca1d: mov qword ptr [rax], rcx
0x14006ca20: mov word ptr [rax + 8], 0x7478
0x14006ca26: mov qword ptr [rbp + 0x1c0], 0xa
0x14006ca31: mov qword ptr [rbp + 0x220], rax
0x14006ca38: mov qword ptr [rbp + 0x1c8], rax
0x14006ca3f: mov qword ptr [rbp + 0x1d0], 0xa
0x14006ca4a: call 0x140002200
0x14006ca4f: mov ecx, 0x11
0x14006ca54: mov edx, 1
0x14006ca59: call 0x1400021c0
0x14006ca5e: test rax, rax
0x14006ca61: mov qword ptr [rbp + 0x210], rax
0x14006ca68: je 0x14006e8ca
0x14006ca6e: movupd xmm0, xmmword ptr [rip + 0x5d62b4e]
0x14006ca76: movupd xmmword ptr [rax], xmm0
0x14006ca7a: mov byte ptr [rax + 0x10], 0x73
0x14006ca7e: mov byte ptr [rbp + 0x138], 3
0x14006ca85: mov qword ptr [rbp + 0x140], 0x11
0x14006ca90: mov qword ptr [rbp + 0x148], rax
0x14006ca97: mov qword ptr [rbp + 0x150], 0x11
0x14006caa2: lea rcx, [rbp + 0x1f0]
0x14006caa9: lea rdx, [rbp + 0xc0]
0x14006cab0: lea r8, [rbp + 0x1c0]
0x14006cab7: lea r9, [rbp + 0x138]
0x14006cabe: call 0x140062cb0
0x14006cac3: nop
0x14006cac4: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006cacb: je 0x14006cada
0x14006cacd: lea rcx, [rbp + 0x1f0]
0x14006cad4: call 0x14005e410
0x14006cad9: nop
0x14006cada: call 0x140002200
0x14006cadf: mov ecx, 0xb
0x14006cae4: mov edx, 1
0x14006cae9: call 0x1400021c0
0x14006caee: test rax, rax
0x14006caf1: je 0x14006e8df
0x14006caf7: movabs rcx, 0x6d695f6c6c616d73
0x14006cb01: mov qword ptr [rax], rcx
0x14006cb04: mov dword ptr [rax + 7], 0x6567616d
0x14006cb0b: mov qword ptr [rbp + 0xe8], 0xb
0x14006cb16: mov qword ptr [rbp + 0x220], rax
0x14006cb1d: mov qword ptr [rbp + 0xf0], rax
0x14006cb24: mov qword ptr [rbp + 0xf8], 0xb
0x14006cb2f: add rsi, 0x10
0x14006cb33: lea rax, [rip + 0x5d629a6]
0x14006cb3a: mov qword ptr [rbp + 0x138], rax
0x14006cb41: lea rax, [rip - 0x6aa88]
0x14006cb48: mov qword ptr [rbp + 0x140], rax
0x14006cb4f: mov qword ptr [rbp + 0x148], rsi
0x14006cb56: mov qword ptr [rbp + 0x150], rax
0x14006cb5d: lea rdx, [rip + 0x5d6298c]
0x14006cb64: lea rcx, [rbp + 0x1c0]
0x14006cb6b: lea r8, [rbp + 0x138]
0x14006cb72: call 0x145bcce30
0x14006cb77: nop
0x14006cb78: mov r15, qword ptr [rbp + 0x1c8]
0x14006cb7f: mov rsi, qword ptr [rbp + 0x1d0]
0x14006cb86: test rsi, rsi
0x14006cb89: mov qword ptr [rbp + 0x210], r15
0x14006cb90: jns 0x14006cbac
0x14006cb92: xor ebx, ebx
0x14006cb94: mov byte ptr [rbp + 0x1ee], 1
0x14006cb9b: mov rcx, rbx
0x14006cb9e: mov rdx, rsi
0x14006cba1: call 0x145d992bb
0x14006cba6: nop
0x14006cba7: jmp 0x14006e97a
0x14006cbac: je 0x14006ce2d
0x14006cbb2: call 0x140002200
0x14006cbb7: mov ebx, 1
0x14006cbbc: mov edx, 1
0x14006cbc1: mov rcx, rsi
0x14006cbc4: call 0x1400021c0
0x14006cbc9: test rax, rax
0x14006cbcc: je 0x14006cb94
0x14006cbce: mov rdi, rax
0x14006cbd1: mov rcx, rax
0x14006cbd4: mov rdx, r15
0x14006cbd7: mov r8, rsi
0x14006cbda: call 0x145bfa0e7
0x14006cbdf: jmp 0x14006ce32
0x14006cbe4: mov eax, 0x64616572
0x14006cbe9: mov rcx, qword ptr [rbp + 0x128]
0x14006cbf0: xor eax, dword ptr [rcx]
0x14006cbf2: movzx ecx, byte ptr [rcx + 4]
0x14006cbf6: xor ecx, 0x79
0x14006cbf9: or ecx, eax
0x14006cbfb: mov rbx, qword ptr [rbp + 0x220]
0x14006cc02: jne 0x14006cc8a
0x14006cc08: lea rcx, [rip + 0x5d62b3f]
0x14006cc0f: mov edx, 0x12
0x14006cc14: call 0x1458ec450
0x14006cc19: nop
0x14006cc1a: mov r8, rdx
0x14006cc1d: lea rcx, [rip + 0x5d62a03]
0x14006cc24: mov qword ptr [rbp + 0x138], rcx
0x14006cc2b: mov qword ptr [rbp + 0x140], 2
0x14006cc36: lea rcx, [rbp + 0xb0]
0x14006cc3d: mov qword ptr [rbp + 0x148], rcx
0x14006cc44: lea rcx, [rip + 0x5d62955]
0x14006cc4b: mov qword ptr [rbp + 0x150], rcx
0x14006cc52: mov qword ptr [rsp + 0x20], 1
0x14006cc5b: lea rcx, [rbp + 0x38]
0x14006cc5f: lea r9, [rbp + 0x138]
0x14006cc66: mov rdx, rax
0x14006cc69: call 0x1458ec8b0
0x14006cc6e: nop
0x14006cc6f: jmp 0x14006cd85
0x14006cc74: mov rax, qword ptr [rbp + 0x128]
0x14006cc7b: cmp dword ptr [rax], 0x64616564
0x14006cc81: mov rbx, qword ptr [rbp + 0x220]
0x14006cc88: je 0x14006cce9
0x14006cc8a: test rbx, rbx
0x14006cc8d: je 0x14006cd94
0x14006cc93: lea rsi, [rip + 0x5d62a6c]
0x14006cc9a: mov edx, 2
0x14006cc9f: mov rcx, rsi
0x14006cca2: mov r8, rbx
0x14006cca5: call 0x142aeace0
0x14006ccaa: nop
0x14006ccab: test rax, rax
0x14006ccae: jne 0x14006ccb7
0x14006ccb0: mov rax, qword ptr [rip + 0x7ff35d9]
0x14006ccb7: xorpd xmm6, xmm6
0x14006ccbb: cmp byte ptr [rax], 2
0x14006ccbe: jne 0x14006d2d6
0x14006ccc4: mov rcx, qword ptr [rax + 8]
0x14006ccc8: cmp rcx, 2
0x14006cccc: je 0x14006d2a7
0x14006ccd2: cmp ecx, 1
0x14006ccd5: jne 0x14006d2ae
0x14006ccdb: xorps xmm6, xmm6
0x14006ccde: cvtsi2sd xmm6, qword ptr [rax + 0x10]
0x14006cce4: jmp 0x14006d2ce
0x14006cce9: lea rcx, [rip + 0x5d62a70]
0x14006ccf0: mov edx, 0x1c
0x14006ccf5: call 0x1458ec450
0x14006ccfa: nop
0x14006ccfb: mov r8, rdx
0x14006ccfe: lea rcx, [rip + 0x5d62922]
0x14006cd05: mov qword ptr [rbp + 0x138], rcx
0x14006cd0c: mov qword ptr [rbp + 0x140], 2
0x14006cd17: lea rcx, [rbp + 0xb0]
0x14006cd1e: mov qword ptr [rbp + 0x148], rcx
0x14006cd25: lea rcx, [rip + 0x5d62874]
0x14006cd2c: mov qword ptr [rbp + 0x150], rcx
0x14006cd33: lea rcx, [rip + 0x5d628d3]
0x14006cd3a: mov qword ptr [rbp + 0x158], rcx
0x14006cd41: mov qword ptr [rbp + 0x160], 5
0x14006cd4c: lea rcx, [rbp + 0x98]
0x14006cd53: mov qword ptr [rbp + 0x168], rcx
0x14006cd5a: lea rcx, [rip + 0x5d618f7]
0x14006cd61: mov qword ptr [rbp + 0x170], rcx
0x14006cd68: mov qword ptr [rsp + 0x20], 2
0x14006cd71: lea rcx, [rbp + 0x38]
0x14006cd75: lea r9, [rbp + 0x138]
0x14006cd7c: mov rdx, rax
0x14006cd7f: call 0x1458ec8b0
0x14006cd84: nop
0x14006cd85: mov dword ptr [rbp + 0x130], 0
0x14006cd8f: jmp 0x14006d4ce
0x14006cd94: cmp rdx, 8
0x14006cd98: jne 0x14006cdb4
0x14006cd9a: movabs rax, 0x676e69736f6f6863
0x14006cda4: mov rcx, qword ptr [rbp + 0x128]
0x14006cdab: cmp qword ptr [rcx], rax
0x14006cdae: je 0x14006da93
0x14006cdb4: cmp byte ptr [rbp + 0x130], 0
0x14006cdbb: je 0x14006cff9
0x14006cdc1: lea rcx, [rip + 0x5d628ff]
0x14006cdc8: mov edx, 0x23
0x14006cdcd: call 0x1458ec450
0x14006cdd2: nop
0x14006cdd3: mov r8, rdx
0x14006cdd6: lea rcx, [rip + 0x5d62830]
0x14006cddd: mov qword ptr [rbp + 0x138], rcx
0x14006cde4: mov qword ptr [rbp + 0x140], 5
0x14006cdef: lea rcx, [rbp + 0x98]
0x14006cdf6: mov qword ptr [rbp + 0x148], rcx
0x14006cdfd: lea rcx, [rip + 0x5d61854]
0x14006ce04: mov qword ptr [rbp + 0x150], rcx
0x14006ce0b: mov qword ptr [rsp + 0x20], 1
0x14006ce14: lea rcx, [rbp + 0x38]
0x14006ce18: lea r9, [rbp + 0x138]
0x14006ce1f: mov rdx, rax
0x14006ce22: call 0x1458ec8b0
0x14006ce27: nop
0x14006ce28: jmp 0x14006d4c6
0x14006ce2d: mov edi, 1
0x14006ce32: mov byte ptr [rbp + 0x138], 3
0x14006ce39: mov qword ptr [rbp + 0x140], rsi
0x14006ce40: mov qword ptr [rbp + 0x148], rdi
0x14006ce47: mov qword ptr [rbp + 0x150], rsi
0x14006ce4e: mov byte ptr [rbp + 0x1ee], 0
0x14006ce55: lea rcx, [rbp + 0x1f0]
0x14006ce5c: lea rdx, [rbp + 0xc0]
0x14006ce63: lea r8, [rbp + 0xe8]
0x14006ce6a: lea r9, [rbp + 0x138]
0x14006ce71: call 0x140062cb0
0x14006ce76: nop
0x14006ce77: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006ce7e: je 0x14006ce8d
0x14006ce80: lea rcx, [rbp + 0x1f0]
0x14006ce87: call 0x14005e410
0x14006ce8c: nop
0x14006ce8d: mov rdx, qword ptr [rbp + 0x1c0]
0x14006ce94: test rdx, rdx
0x14006ce97: je 0x14006ceab
0x14006ce99: mov r8d, 1
0x14006ce9f: mov rcx, qword ptr [rbp + 0x210]
0x14006cea6: call 0x1400021d0
0x14006ceab: call 0x140002200
0x14006ceb0: mov ecx, 0xa
0x14006ceb5: mov edx, 1
0x14006ceba: call 0x1400021c0
0x14006cebf: test rax, rax
0x14006cec2: je 0x14006e8fe
0x14006cec8: movabs rcx, 0x65745f6c6c616d73
0x14006ced2: mov qword ptr [rax], rcx
0x14006ced5: mov word ptr [rax + 8], 0x7478
0x14006cedb: mov qword ptr [rbp + 0x110], 0xa
0x14006cee6: mov qword ptr [rbp + 0x220], rax
0x14006ceed: mov qword ptr [rbp + 0x118], rax
0x14006cef4: mov qword ptr [rbp + 0x120], 0xa
0x14006ceff: lea rcx, [rip + 0x5d626e4]
0x14006cf06: mov edx, 0x11
0x14006cf0b: call 0x1458ec450
0x14006cf10: nop
0x14006cf11: mov rsi, rax
0x14006cf14: mov rdi, rdx
0x14006cf17: mov rcx, qword ptr [r14 + 0x20]
0x14006cf1b: mov rdx, qword ptr [r14 + 0x28]
0x14006cf1f: call 0x14588d200
0x14006cf24: nop
0x14006cf25: mov rcx, rax
0x14006cf28: call 0x14588cd50
0x14006cf2d: nop
0x14006cf2e: mov qword ptr [rbp + 0xb0], rax
0x14006cf35: mov qword ptr [rbp + 0xb8], rdx
0x14006cf3c: lea rax, [rip + 0x5d626b8]
0x14006cf43: mov qword ptr [rbp + 0x138], rax
0x14006cf4a: mov qword ptr [rbp + 0x140], 4
0x14006cf55: lea rax, [rbp + 0xb0]
0x14006cf5c: mov qword ptr [rbp + 0x148], rax
0x14006cf63: mov qword ptr [rbp + 0x150], r12
0x14006cf6a: mov qword ptr [rsp + 0x20], 1
0x14006cf73: lea rcx, [rbp + 0xe8]
0x14006cf7a: lea r9, [rbp + 0x138]
0x14006cf81: mov rdx, rsi
0x14006cf84: mov r8, rdi
0x14006cf87: call 0x1458ec8b0
0x14006cf8c: nop
0x14006cf8d: mov r14, qword ptr [rbp + 0xf0]
0x14006cf94: mov rsi, qword ptr [rbp + 0xf8]
0x14006cf9b: test rsi, rsi
0x14006cf9e: mov qword ptr [rbp + 0x210], r14
0x14006cfa5: jns 0x14006cfc1
0x14006cfa7: xor ebx, ebx
0x14006cfa9: mov byte ptr [rbp + 0x1ed], 1
0x14006cfb0: mov rcx, rbx
0x14006cfb3: mov rdx, rsi
0x14006cfb6: call 0x145d992bb
0x14006cfbb: nop
0x14006cfbc: jmp 0x14006e97a
0x14006cfc1: je 0x14006d09a
0x14006cfc7: call 0x140002200
0x14006cfcc: mov ebx, 1
0x14006cfd1: mov edx, 1
0x14006cfd6: mov rcx, rsi
0x14006cfd9: call 0x1400021c0
0x14006cfde: test rax, rax
0x14006cfe1: je 0x14006cfa9
0x14006cfe3: mov rdi, rax
0x14006cfe6: mov rcx, rax
0x14006cfe9: mov rdx, r14
0x14006cfec: mov r8, rsi
0x14006cfef: call 0x145bfa0e7
0x14006cff4: jmp 0x14006d09f
0x14006cff9: lea rcx, [rip + 0x5d626ae]
0x14006d000: mov edx, 0x19
0x14006d005: call 0x1458ec450
0x14006d00a: nop
0x14006d00b: mov r8, rdx
0x14006d00e: lea rcx, [rip + 0x5d62612]
0x14006d015: mov qword ptr [rbp + 0x138], rcx
0x14006d01c: mov qword ptr [rbp + 0x140], 2
0x14006d027: lea rcx, [rbp + 0xb0]
0x14006d02e: mov qword ptr [rbp + 0x148], rcx
0x14006d035: lea rcx, [rip + 0x5d62564]
0x14006d03c: mov qword ptr [rbp + 0x150], rcx
0x14006d043: lea rcx, [rip + 0x5d625c3]
0x14006d04a: mov qword ptr [rbp + 0x158], rcx
0x14006d051: mov qword ptr [rbp + 0x160], 5
0x14006d05c: lea rcx, [rbp + 0x98]
0x14006d063: mov qword ptr [rbp + 0x168], rcx
0x14006d06a: lea rcx, [rip + 0x5d615e7]
0x14006d071: mov qword ptr [rbp + 0x170], rcx
0x14006d078: mov qword ptr [rsp + 0x20], 2
0x14006d081: lea rcx, [rbp + 0x38]
0x14006d085: lea r9, [rbp + 0x138]
0x14006d08c: mov rdx, rax
0x14006d08f: call 0x1458ec8b0
0x14006d094: nop
0x14006d095: jmp 0x14006d4c6
0x14006d09a: mov edi, 1
0x14006d09f: mov byte ptr [rbp + 0x1f0], 3
0x14006d0a6: mov qword ptr [rbp + 0x1f8], rsi
0x14006d0ad: mov qword ptr [rbp + 0x200], rdi
0x14006d0b4: mov qword ptr [rbp + 0x208], rsi
0x14006d0bb: mov byte ptr [rbp + 0x1ed], 0
0x14006d0c2: lea rcx, [rbp + 0x1c0]
0x14006d0c9: lea rdx, [rbp + 0xc0]
0x14006d0d0: lea r8, [rbp + 0x110]
0x14006d0d7: lea r9, [rbp + 0x1f0]
0x14006d0de: call 0x140062cb0
0x14006d0e3: nop
0x14006d0e4: cmp byte ptr [rbp + 0x1c0], 0xff
0x14006d0eb: je 0x14006d0fa
0x14006d0ed: lea rcx, [rbp + 0x1c0]
0x14006d0f4: call 0x14005e410
0x14006d0f9: nop
0x14006d0fa: mov rdx, qword ptr [rbp + 0xe8]
0x14006d101: test rdx, rdx
0x14006d104: je 0x14006d118
0x14006d106: mov r8d, 1
0x14006d10c: mov rcx, qword ptr [rbp + 0x210]
0x14006d113: call 0x1400021d0
0x14006d118: movupd xmm0, xmmword ptr [rbp + 0xc0]
0x14006d120: movupd xmmword ptr [rbp + 0x140], xmm0
0x14006d128: mov rax, qword ptr [rbp + 0xd0]
0x14006d12f: mov qword ptr [rbp + 0x150], rax
0x14006d136: mov byte ptr [rbp + 0x138], 5
0x14006d13d: mov byte ptr [rbp + 0x1ec], 0
0x14006d144: lea rcx, [rbp + 0x1f0]
0x14006d14b: lea rdx, [rbp + 0x98]
0x14006d152: lea r8, [rbp + 0x70]
0x14006d156: lea r9, [rbp + 0x138]
0x14006d15d: call 0x140062cb0
0x14006d162: nop
0x14006d163: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006d16a: je 0x14006d179
0x14006d16c: lea rcx, [rbp + 0x1f0]
0x14006d173: call 0x14005e410
0x14006d178: nop
0x14006d179: call 0x140002200
0x14006d17e: mov ecx, 7
0x14006d183: mov edx, 1
0x14006d188: call 0x1400021c0
0x14006d18d: test rax, rax
0x14006d190: je 0x14006e922
0x14006d196: mov dword ptr [rax + 3], 0x736e6f74
0x14006d19d: mov dword ptr [rax], 0x74747562
0x14006d1a3: mov qword ptr [rbp + 0x1c0], 7
0x14006d1ae: mov qword ptr [rbp + 0x210], rax
0x14006d1b5: mov qword ptr [rbp + 0x1c8], rax
0x14006d1bc: mov qword ptr [rbp + 0x1d0], 7
0x14006d1c7: lea rax, [rbp - 8]
0x14006d1cb: mov qword ptr [rbp + 0x1f0], rax
0x14006d1d2: mov byte ptr [rbp + 0x21e], 1
0x14006d1d9: lea rcx, [rbp + 0x138]
0x14006d1e0: lea rdx, [rbp + 0x1f0]
0x14006d1e7: call 0x140060380
0x14006d1ec: nop
0x14006d1ed: cmp byte ptr [rbp + 0x138], 0xff
0x14006d1f4: je 0x14006e711
0x14006d1fa: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006d202: movupd xmm1, xmmword ptr [rbp + 0x148]
0x14006d20a: movapd xmmword ptr [rbp + 0x200], xmm1
0x14006d212: movapd xmmword ptr [rbp + 0x1f0], xmm0
0x14006d21a: mov byte ptr [rbp + 0x21e], 0
0x14006d221: lea rcx, [rbp + 0x138]
0x14006d228: lea rdx, [rbp + 0x98]
0x14006d22f: lea r8, [rbp + 0x1c0]
0x14006d236: lea r9, [rbp + 0x1f0]
0x14006d23d: call 0x140062cb0
0x14006d242: nop
0x14006d243: cmp byte ptr [rbp + 0x138], 0xff
0x14006d24a: je 0x14006d259
0x14006d24c: lea rcx, [rbp + 0x138]
0x14006d253: call 0x14005e410
0x14006d258: nop
0x14006d259: mov rax, qword ptr [rbp + 0xa8]
0x14006d260: movups xmm0, xmmword ptr [rbp + 0x98]
0x14006d267: movups xmmword ptr [rbp + 0x13f], xmm0
0x14006d26e: mov qword ptr [rbp + 0x14f], rax
0x14006d275: mov rdx, qword ptr [rbp + 0x88]
0x14006d27c: mov byte ptr [rdx], 5
0x14006d27f: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006d287: mov rax, qword ptr [rbp + 0x147]
0x14006d28e: mov rcx, qword ptr [rbp + 0x14f]
0x14006d295: movupd xmmword ptr [rdx + 1], xmm0
0x14006d29a: mov qword ptr [rdx + 0x10], rax
0x14006d29e: mov qword ptr [rdx + 0x18], rcx
0x14006d2a2: jmp 0x14006b8f8
0x14006d2a7: movsd xmm6, qword ptr [rax + 0x10]
0x14006d2ac: jmp 0x14006d2ce
0x14006d2ae: movsd xmm0, qword ptr [rax + 0x10]
0x14006d2b3: unpcklps xmm0, xmmword ptr [rip + 0x5d5fca6]
0x14006d2ba: subpd xmm0, xmmword ptr [rip + 0x5d5fcae]
0x14006d2c2: movapd xmm6, xmm0
0x14006d2c6: unpckhpd xmm6, xmm0
0x14006d2ca: addsd xmm6, xmm0
0x14006d2ce: mulsd xmm6, qword ptr [rip + 0x5d5fcba]
0x14006d2d6: lea rcx, [rip + 0x5d6242b]
0x14006d2dd: mov edx, 5
0x14006d2e2: mov r8, rbx
0x14006d2e5: call 0x142aeace0
0x14006d2ea: nop
0x14006d2eb: test rax, rax
0x14006d2ee: jne 0x14006d2f7
0x14006d2f0: mov rax, qword ptr [rip + 0x7ff2f99]
0x14006d2f7: cmp byte ptr [rax], 2
0x14006d2fa: jne 0x14006d313
0x14006d2fc: mov rcx, qword ptr [rax + 8]
0x14006d300: cmp rcx, 2
0x14006d304: je 0x14006d31d
0x14006d306: cmp ecx, 1
0x14006d309: jne 0x14006d324
0x14006d30b: cvtsi2sd xmm7, qword ptr [rax + 0x10]
0x14006d311: jmp 0x14006d344
0x14006d313: movsd xmm7, qword ptr [rip + 0x5d3b9a5]
0x14006d31b: jmp 0x14006d34c
0x14006d31d: movsd xmm7, qword ptr [rax + 0x10]
0x14006d322: jmp 0x14006d344
0x14006d324: movsd xmm0, qword ptr [rax + 0x10]
0x14006d329: unpcklps xmm0, xmmword ptr [rip + 0x5d5fc30]
0x14006d330: subpd xmm0, xmmword ptr [rip + 0x5d5fc38]
0x14006d338: movapd xmm7, xmm0
0x14006d33c: unpckhpd xmm7, xmm0
0x14006d340: addsd xmm7, xmm0
0x14006d344: maxsd xmm7, qword ptr [rip + 0x5d3b974]
0x14006d34c: lea rdi, [rip + 0x5d623ba]
0x14006d353: mov edx, 4
0x14006d358: mov rcx, rdi
0x14006d35b: mov r8, rbx
0x14006d35e: call 0x142aeace0
0x14006d363: nop
0x14006d364: test rax, rax
0x14006d367: jne 0x14006d370
0x14006d369: mov rax, qword ptr [rip + 0x7ff2f20]
0x14006d370: cmp byte ptr [rax], 3
0x14006d373: jne 0x14006d391
0x14006d375: mov rbx, qword ptr [rax + 0x10]
0x14006d379: mov r12, qword ptr [rax + 0x18]
0x14006d37d: lea rcx, [rip + 0x5d6238d]
0x14006d384: mov edx, 6
0x14006d389: call 0x1458ec450
0x14006d38e: nop
0x14006d38f: jmp 0x14006d3a9
0x14006d391: lea rcx, [rip + 0x5d62379]
0x14006d398: mov edx, 6
0x14006d39d: call 0x1458ec450
0x14006d3a2: nop
0x14006d3a3: mov rbx, rax
0x14006d3a6: mov r12, rdx
0x14006d3a9: mov qword ptr [rbp + 0x1c0], rbx
0x14006d3b0: mov qword ptr [rbp + 0x1c8], r12
0x14006d3b7: lea rcx, [rip + 0x5d62359]
0x14006d3be: mov edx, 0x1e
0x14006d3c3: call 0x1458ec450
0x14006d3c8: nop
0x14006d3c9: mov rbx, rax
0x14006d3cc: mov r12, rdx
0x14006d3cf: divsd xmm6, xmm7
0x14006d3d3: movsd qword ptr [rbp + 0xe8], xmm6
0x14006d3db: lea rax, [rbp + 0xe8]
0x14006d3e2: mov qword ptr [rbp + 0x1f0], rax
0x14006d3e9: lea rax, [rip + 0x5b71080]
0x14006d3f0: mov qword ptr [rbp + 0x1f8], rax
0x14006d3f7: lea rdx, [rip + 0x5d61252]
0x14006d3fe: lea rcx, [rbp + 0x138]
0x14006d405: lea r13, [rbp + 0x1f0]
0x14006d40c: mov r8, r13
0x14006d40f: call 0x145bcce30
0x14006d414: nop
0x14006d415: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006d41d: movapd xmmword ptr [rbp + 0x1f0], xmm0
0x14006d425: mov rax, qword ptr [rbp + 0x148]
0x14006d42c: mov qword ptr [rbp + 0x200], rax
0x14006d433: mov qword ptr [rbp + 0x138], rdi
0x14006d43a: mov qword ptr [rbp + 0x140], 4
0x14006d445: lea rax, [rbp + 0x1c0]
0x14006d44c: mov qword ptr [rbp + 0x148], rax
0x14006d453: lea rax, [rip + 0x5d62146]
0x14006d45a: mov qword ptr [rbp + 0x150], rax
0x14006d461: mov qword ptr [rbp + 0x158], rsi
0x14006d468: mov qword ptr [rbp + 0x160], 2
0x14006d473: mov qword ptr [rbp + 0x168], r13
0x14006d47a: lea rax, [rip + 0x5d611d7]
0x14006d481: mov qword ptr [rbp + 0x170], rax
0x14006d488: mov qword ptr [rsp + 0x20], 2
0x14006d491: lea rcx, [rbp + 0x38]
0x14006d495: lea r9, [rbp + 0x138]
0x14006d49c: mov rdx, rbx
0x14006d49f: mov r8, r12
0x14006d4a2: call 0x1458ec8b0
0x14006d4a7: nop
0x14006d4a8: mov rdx, qword ptr [rbp + 0x1f0]
0x14006d4af: test rdx, rdx
0x14006d4b2: je 0x14006d4c6
0x14006d4b4: mov rcx, qword ptr [rbp + 0x1f8]
0x14006d4bb: mov r8d, 1
0x14006d4c1: call 0x1400021d0
0x14006d4c6: mov al, 1
0x14006d4c8: mov dword ptr [rbp + 0x130], eax
0x14006d4ce: mov rax, qword ptr [rbp + 0x38]
0x14006d4d2: mov qword ptr [rbp + 0x210], rax
0x14006d4d9: mov rax, qword ptr [rbp + 0x40]
0x14006d4dd: mov qword ptr [rbp + 0x1b8], rax
0x14006d4e4: mov rax, qword ptr [rbp + 0x48]
0x14006d4e8: mov qword ptr [rbp + 0x128], rax
0x14006d4ef: mov qword ptr [rbp + 0x110], 0
0x14006d4fa: mov qword ptr [rbp + 0x120], 0
0x14006d505: call 0x140002200
0x14006d50a: mov ecx, 0xb
0x14006d50f: mov edx, 1
0x14006d514: call 0x1400021c0
0x14006d519: test rax, rax
0x14006d51c: je 0x14006e822
0x14006d522: movabs rcx, 0x6d695f656772616c
0x14006d52c: mov qword ptr [rax], rcx
0x14006d52f: mov dword ptr [rax + 7], 0x6567616d
0x14006d536: mov qword ptr [rbp + 0x1c0], 0xb
0x14006d541: mov qword ptr [rbp + 0x108], rax
0x14006d548: mov qword ptr [rbp + 0x1c8], rax
0x14006d54f: mov qword ptr [rbp + 0x1d0], 0xb
0x14006d55a: call 0x140002200
0x14006d55f: mov ecx, 4
0x14006d564: mov edx, 1
0x14006d569: call 0x1400021c0
0x14006d56e: test rax, rax
0x14006d571: mov qword ptr [rbp + 0x220], rax
0x14006d578: je 0x14006e837
0x14006d57e: mov rsi, r15
0x14006d581: mov dword ptr [rax], 0x6f676f6c
0x14006d587: mov byte ptr [rbp + 0x138], 3
0x14006d58e: mov qword ptr [rbp + 0x140], 4
0x14006d599: mov qword ptr [rbp + 0x148], rax
0x14006d5a0: mov qword ptr [rbp + 0x150], 4
0x14006d5ab: lea rcx, [rbp + 0x1f0]
0x14006d5b2: lea rdx, [rbp + 0x110]
0x14006d5b9: lea r8, [rbp + 0x1c0]
0x14006d5c0: lea r9, [rbp + 0x138]
0x14006d5c7: call 0x140062cb0
0x14006d5cc: nop
0x14006d5cd: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006d5d4: je 0x14006d5e3
0x14006d5d6: lea rcx, [rbp + 0x1f0]
0x14006d5dd: call 0x14005e410
0x14006d5e2: nop
0x14006d5e3: call 0x140002200
0x14006d5e8: mov ecx, 0xa
0x14006d5ed: mov edx, 1
0x14006d5f2: call 0x1400021c0
0x14006d5f7: test rax, rax
0x14006d5fa: je 0x14006e84c
0x14006d600: movabs rcx, 0x65745f656772616c
0x14006d60a: mov qword ptr [rax], rcx
0x14006d60d: mov word ptr [rax + 8], 0x7478
0x14006d613: mov qword ptr [rbp + 0x1c0], 0xa
0x14006d61e: mov qword ptr [rbp + 0x220], rax
0x14006d625: mov qword ptr [rbp + 0x1c8], rax
0x14006d62c: mov qword ptr [rbp + 0x1d0], 0xa
0x14006d637: lea rcx, [rip + 0x5d6213e]
0x14006d63e: mov edx, 8
0x14006d643: mov r8, rsi
0x14006d646: call 0x142aeace0
0x14006d64b: nop
0x14006d64c: test rax, rax
0x14006d64f: jne 0x14006d658
0x14006d651: mov rax, qword ptr [rip + 0x7ff2c38]
0x14006d658: cmp byte ptr [rax], 3
0x14006d65b: jne 0x14006d709
0x14006d661: mov rcx, qword ptr [rax + 0x18]
0x14006d665: test rcx, rcx
0x14006d668: je 0x14006d709
0x14006d66e: mov rax, qword ptr [rax + 0x10]
0x14006d672: mov qword ptr [rbp + 0xe8], rax
0x14006d679: mov qword ptr [rbp + 0xf0], rcx
0x14006d680: lea rax, [rbp + 0xb0]
0x14006d687: mov qword ptr [rbp + 0x138], rax
0x14006d68e: lea rax, [rip - 0x6b5d5]
0x14006d695: mov qword ptr [rbp + 0x140], rax
0x14006d69c: lea rcx, [rbp + 0xe8]
0x14006d6a3: mov qword ptr [rbp + 0x148], rcx
0x14006d6aa: mov qword ptr [rbp + 0x150], rax
0x14006d6b1: lea rdx, [rip + 0x5d620cc]
0x14006d6b8: lea rcx, [rbp + 0x1f0]
0x14006d6bf: lea r8, [rbp + 0x138]
0x14006d6c6: call 0x145bcce30
0x14006d6cb: nop
0x14006d6cc: mov rsi, qword ptr [rbp + 0x1f0]
0x14006d6d3: mov rbx, qword ptr [rbp + 0x1f8]
0x14006d6da: mov r15, qword ptr [rbp + 0x200]
0x14006d6e1: test r15, r15
0x14006d6e4: jns 0x14006e97c
0x14006d6ea: xor ecx, ecx
0x14006d6ec: mov byte ptr [rbp + 0x1eb], 1
0x14006d6f3: mov qword ptr [rbp + 0x20], rbx
0x14006d6f7: mov qword ptr [rbp + 0x18], rsi
0x14006d6fb: mov rdx, r15
0x14006d6fe: call 0x145d992bb
0x14006d703: nop
0x14006d704: jmp 0x14006e97a
0x14006d709: mov rsi, qword ptr [rbp + 0xb8]
0x14006d710: test rsi, rsi
0x14006d713: jns 0x14006d729
0x14006d715: xor r12d, r12d
0x14006d718: mov rcx, r12
0x14006d71b: mov rdx, rsi
0x14006d71e: call 0x145d992bb
0x14006d723: nop
0x14006d724: jmp 0x14006e97a
0x14006d729: je 0x14006d791
0x14006d72b: mov r15, qword ptr [rbp + 0xb0]
0x14006d732: call 0x140002200
0x14006d737: mov r12d, 1
0x14006d73d: mov edx, 1
0x14006d742: mov rcx, rsi
0x14006d745: call 0x1400021c0
0x14006d74a: test rax, rax
0x14006d74d: je 0x14006d718
0x14006d74f: mov rbx, rax
0x14006d752: mov rcx, rax
0x14006d755: mov rdx, r15
0x14006d758: mov r8, rsi
0x14006d75b: call 0x145bfa0e7
0x14006d760: mov r15, rsi
0x14006d763: call 0x140002200
0x14006d768: mov edx, 1
0x14006d76d: mov rcx, r15
0x14006d770: call 0x1400021c0
0x14006d775: test rax, rax
0x14006d778: je 0x14006e8f4
0x14006d77e: mov r12, rax
0x14006d781: mov rcx, rax
0x14006d784: mov rdx, rbx
0x14006d787: mov r8, r15
0x14006d78a: call 0x145bfa0e7
0x14006d78f: jmp 0x14006d7a1
0x14006d791: mov ebx, 1
0x14006d796: xor esi, esi
0x14006d798: xor r15d, r15d
0x14006d79b: mov r12d, 1
0x14006d7a1: mov byte ptr [rbp + 0x138], 3
0x14006d7a8: mov qword ptr [rbp + 0x140], r15
0x14006d7af: mov qword ptr [rbp + 0x148], r12
0x14006d7b6: mov qword ptr [rbp + 0x150], r15
0x14006d7bd: mov byte ptr [rbp + 0x1eb], 0
0x14006d7c4: mov qword ptr [rbp + 0x20], rbx
0x14006d7c8: mov qword ptr [rbp + 0x18], rsi
0x14006d7cc: lea rcx, [rbp + 0x1f0]
0x14006d7d3: lea rdx, [rbp + 0x110]
0x14006d7da: lea r8, [rbp + 0x1c0]
0x14006d7e1: lea r9, [rbp + 0x138]
0x14006d7e8: call 0x140062cb0
0x14006d7ed: nop
0x14006d7ee: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006d7f5: je 0x14006d80c
0x14006d7f7: mov qword ptr [rbp + 0x68], rbx
0x14006d7fb: mov qword ptr [rbp + 0x60], rsi
0x14006d7ff: lea rcx, [rbp + 0x1f0]
0x14006d806: call 0x14005e410
0x14006d80b: nop
0x14006d80c: test rsi, rsi
0x14006d80f: je 0x14006d822
0x14006d811: mov r8d, 1
0x14006d817: mov rcx, rbx
0x14006d81a: mov rdx, rsi
0x14006d81d: call 0x1400021d0
0x14006d822: movupd xmm0, xmmword ptr [rbp + 0x110]
0x14006d82a: movupd xmmword ptr [rbp + 0xf0], xmm0
0x14006d832: mov rax, qword ptr [rbp + 0x120]
0x14006d839: mov qword ptr [rbp + 0x100], rax
0x14006d840: mov byte ptr [rbp + 0xe8], 5
0x14006d847: test r14, r14
0x14006d84a: je 0x14006e013
0x14006d850: lea rax, [r14 + 0x10]
0x14006d854: lea rcx, [rip + 0x5d61c85]
0x14006d85b: mov qword ptr [rbp + 0x138], rcx
0x14006d862: lea rcx, [rip - 0x6b7a9]
0x14006d869: mov qword ptr [rbp + 0x140], rcx
0x14006d870: mov qword ptr [rbp + 0x148], rax
0x14006d877: mov qword ptr [rbp + 0x150], rcx
0x14006d87e: lea rdx, [rip + 0x5d61c6b]
0x14006d885: lea rcx, [rbp + 0x1f0]
0x14006d88c: lea r8, [rbp + 0x138]
0x14006d893: call 0x145bcce30
0x14006d898: nop
0x14006d899: mov r15, qword ptr [rbp + 0x1f8]
0x14006d8a0: mov rsi, qword ptr [rbp + 0x200]
0x14006d8a7: test rsi, rsi
0x14006d8aa: mov qword ptr [rbp + 0x220], r15
0x14006d8b1: jns 0x14006d8c7
0x14006d8b3: xor r13d, r13d
0x14006d8b6: mov rcx, r13
0x14006d8b9: mov rdx, rsi
0x14006d8bc: call 0x145d992bb
0x14006d8c1: nop
0x14006d8c2: jmp 0x14006e97a
0x14006d8c7: je 0x14006d900
0x14006d8c9: call 0x140002200
0x14006d8ce: mov r13d, 1
0x14006d8d4: mov edx, 1
0x14006d8d9: mov rcx, rsi
0x14006d8dc: call 0x1400021c0
0x14006d8e1: test rax, rax
0x14006d8e4: movzx edi, byte ptr [rbp + 0x21f]
0x14006d8eb: je 0x14006d8b6
0x14006d8ed: mov rbx, rax
0x14006d8f0: mov rcx, rax
0x14006d8f3: mov rdx, r15
0x14006d8f6: mov r8, rsi
0x14006d8f9: call 0x145bfa0e7
0x14006d8fe: jmp 0x14006d90c
0x14006d900: mov ebx, 1
0x14006d905: movzx edi, byte ptr [rbp + 0x21f]
0x14006d90c: mov byte ptr [rbp + 0x138], 3
0x14006d913: mov qword ptr [rbp + 0x140], rsi
0x14006d91a: mov qword ptr [rbp + 0x148], rbx
0x14006d921: mov qword ptr [rbp + 0x150], rsi
0x14006d928: mov byte ptr [rbp + 0x1ea], 1
0x14006d92f: lea rcx, [rip + 0x5d61c9f]
0x14006d936: lea r8, [rbp + 0xe8]
0x14006d93d: mov edx, 0xb
0x14006d942: call 0x142aeade0
0x14006d947: nop
0x14006d948: mov rsi, qword ptr [rbp + 0x90]
0x14006d94f: mov qword ptr [rbp + 0x108], rax
0x14006d956: mov rcx, rax
0x14006d959: call 0x14005e410
0x14006d95e: nop
0x14006d95f: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006d967: movupd xmm1, xmmword ptr [rbp + 0x148]
0x14006d96f: mov rax, qword ptr [rbp + 0x108]
0x14006d976: movupd xmmword ptr [rax + 0x10], xmm1
0x14006d97b: movupd xmmword ptr [rax], xmm0
0x14006d97f: mov rdx, qword ptr [rbp + 0x1f0]
0x14006d986: test rdx, rdx
0x14006d989: je 0x14006d99d
0x14006d98b: mov r8d, 1
0x14006d991: mov rcx, qword ptr [rbp + 0x220]
0x14006d998: call 0x1400021d0
0x14006d99d: cmp dil, 0xff
0x14006d9a1: je 0x14006decd
0x14006d9a7: lea rcx, [rip + 0x5d61e4a]
0x14006d9ae: mov edx, 5
0x14006d9b3: mov r8, rsi
0x14006d9b6: call 0x142aeace0
0x14006d9bb: nop
0x14006d9bc: test rax, rax
0x14006d9bf: jne 0x14006d9c8
0x14006d9c1: mov rax, qword ptr [rip + 0x7ff28c8]
0x14006d9c8: cmp byte ptr [rax], 4
0x14006d9cb: jne 0x14006decd
0x14006d9d1: mov rcx, qword ptr [rax + 0x18]
0x14006d9d5: test rcx, rcx
0x14006d9d8: je 0x14006decd
0x14006d9de: mov rsi, qword ptr [rax + 0x10]
0x14006d9e2: cmp rcx, 1
0x14006d9e6: jne 0x14006daff
0x14006d9ec: lea rcx, [rip + 0x5d61d1a]
0x14006d9f3: mov edx, 4
0x14006d9f8: mov r8, rsi
0x14006d9fb: call 0x142aeace0
0x14006da00: nop
0x14006da01: test rax, rax
0x14006da04: jne 0x14006da0d
0x14006da06: mov rax, qword ptr [rip + 0x7ff2883]
0x14006da0d: cmp byte ptr [rax], 3
0x14006da10: mov r8, qword ptr [rbp + 0x90]
0x14006da17: jne 0x14006decd
0x14006da1d: mov rcx, qword ptr [rax + 0x18]
0x14006da21: test rcx, rcx
0x14006da24: je 0x14006decd
0x14006da2a: mov rax, qword ptr [rax + 0x10]
0x14006da2e: mov qword ptr [rbp + 0x110], rax
0x14006da35: mov qword ptr [rbp + 0x118], rcx
0x14006da3c: lea rcx, [rip + 0x5d61dba]
0x14006da43: mov edx, 5
0x14006da48: call 0x142aeace0
0x14006da4d: nop
0x14006da4e: test rax, rax
0x14006da51: jne 0x14006da5a
0x14006da53: mov rax, qword ptr [rip + 0x7ff2836]
0x14006da5a: xorpd xmm6, xmm6
0x14006da5e: cmp byte ptr [rax], 2
0x14006da61: mov r8, qword ptr [rbp + 0x90]
0x14006da68: jne 0x14006dc78
0x14006da6e: mov rcx, qword ptr [rax + 8]
0x14006da72: cmp rcx, 2
0x14006da76: je 0x14006dc51
0x14006da7c: cmp ecx, 1
0x14006da7f: jne 0x14006dc58
0x14006da85: xorps xmm6, xmm6
0x14006da88: cvtsi2sd xmm6, qword ptr [rax + 0x10]
0x14006da8e: jmp 0x14006dc78
0x14006da93: lea rcx, [rip + 0x5d61c50]
0x14006da9a: mov edx, 0x1c
0x14006da9f: call 0x1458ec450
0x14006daa4: nop
0x14006daa5: mov r8, rdx
0x14006daa8: lea rcx, [rip + 0x5d61b5e]
0x14006daaf: mov qword ptr [rbp + 0x138], rcx
0x14006dab6: mov qword ptr [rbp + 0x140], 5
0x14006dac1: lea rcx, [rbp + 0x98]
0x14006dac8: mov qword ptr [rbp + 0x148], rcx
0x14006dacf: lea rcx, [rip + 0x5d60b82]
0x14006dad6: mov qword ptr [rbp + 0x150], rcx
0x14006dadd: mov qword ptr [rsp + 0x20], 1
0x14006dae6: lea rcx, [rbp + 0x38]
0x14006daea: lea r9, [rbp + 0x138]
0x14006daf1: mov rdx, rax
0x14006daf4: call 0x1458ec8b0
0x14006daf9: nop
0x14006dafa: jmp 0x14006d4c6
0x14006daff: lea rax, [rsi + 0x20]
0x14006db03: mov qword ptr [rbp + 0x220], rax
0x14006db0a: dec rcx
0x14006db0d: movabs r15, 0x7ffffffffffffff
0x14006db17: and r15, rcx
0x14006db1a: xor edi, edi
0x14006db1c: lea rbx, [rip + 0x5d6091d]
0x14006db23: movsd xmm6, qword ptr [rip + 0x5d5f435]
0x14006db2b: movapd xmm7, xmmword ptr [rip + 0x5d5f43d]
0x14006db33: jmp 0x14006db64
0x14006db35: xor eax, eax
0x14006db37: mov rcx, r12
0x14006db3a: sar rcx, 0x3f
0x14006db3e: shr rcx, 1
0x14006db41: xor rcx, r12
0x14006db44: mov rdx, rax
0x14006db47: sar rdx, 0x3f
0x14006db4b: shr rdx, 1
0x14006db4e: xor rdx, rax
0x14006db51: cmp rcx, rdx
0x14006db54: cmovle rsi, r13
0x14006db58: inc rdi
0x14006db5b: cmp rdi, r15
0x14006db5e: je 0x14006d9ec
0x14006db64: mov edx, 3
0x14006db69: mov rcx, rbx
0x14006db6c: mov r8, rsi
0x14006db6f: call 0x142aeace0
0x14006db74: nop
0x14006db75: test rax, rax
0x14006db78: jne 0x14006db81
0x14006db7a: mov rax, qword ptr [rip + 0x7ff270f]
0x14006db81: cmp byte ptr [rax], 2
0x14006db84: jne 0x14006dba0
0x14006db86: mov rcx, qword ptr [rax + 8]
0x14006db8a: cmp rcx, 2
0x14006db8e: je 0x14006dba5
0x14006db90: cmp ecx, 1
0x14006db93: jne 0x14006dbac
0x14006db95: xorps xmm0, xmm0
0x14006db98: cvtsi2sd xmm0, qword ptr [rax + 0x10]
0x14006db9e: jmp 0x14006dbc4
0x14006dba0: xor r12d, r12d
0x14006dba3: jmp 0x14006dbc9
0x14006dba5: movsd xmm0, qword ptr [rax + 0x10]
0x14006dbaa: jmp 0x14006dbc4
0x14006dbac: movsd xmm1, qword ptr [rax + 0x10]
0x14006dbb1: unpcklps xmm1, xmm6
0x14006dbb4: subpd xmm1, xmm7
0x14006dbb8: movapd xmm0, xmm1
0x14006dbbc: unpckhpd xmm0, xmm1
0x14006dbc0: addsd xmm0, xmm1
0x14006dbc4: movq r12, xmm0
0x14006dbc9: mov r13, rdi
0x14006dbcc: shl r13, 5
0x14006dbd0: add r13, qword ptr [rbp + 0x220]
0x14006dbd7: mov edx, 3
0x14006dbdc: mov rcx, rbx
0x14006dbdf: mov r8, r13
0x14006dbe2: call 0x142aeace0
0x14006dbe7: nop
0x14006dbe8: test rax, rax
0x14006dbeb: jne 0x14006dbf4
0x14006dbed: mov rax, qword ptr [rip + 0x7ff269c]
0x14006dbf4: cmp byte ptr [rax], 2
0x14006dbf7: jne 0x14006db35
0x14006dbfd: mov rcx, qword ptr [rax + 8]
0x14006dc01: cmp rcx, 2
0x14006dc05: je 0x14006dc17
0x14006dc07: cmp ecx, 1
0x14006dc0a: jne 0x14006dc1e
0x14006dc0c: xorps xmm0, xmm0
0x14006dc0f: cvtsi2sd xmm0, qword ptr [rax + 0x10]
0x14006dc15: jmp 0x14006dc36
0x14006dc17: movsd xmm0, qword ptr [rax + 0x10]
0x14006dc1c: jmp 0x14006dc36
0x14006dc1e: movsd xmm1, qword ptr [rax + 0x10]
0x14006dc23: unpcklps xmm1, xmm6
0x14006dc26: subpd xmm1, xmm7
0x14006dc2a: movapd xmm0, xmm1
0x14006dc2e: unpckhpd xmm0, xmm1
0x14006dc32: addsd xmm0, xmm1
0x14006dc36: movq rax, xmm0
0x14006dc3b: jmp 0x14006db37
0x14006dc40: mov ecx, 8
0x14006dc45: mov edx, 0x20
0x14006dc4a: call 0x145d992a1
0x14006dc4f: ud2
0x14006dc51: movsd xmm6, qword ptr [rax + 0x10]
0x14006dc56: jmp 0x14006dc78
0x14006dc58: movsd xmm0, qword ptr [rax + 0x10]
0x14006dc5d: unpcklps xmm0, xmmword ptr [rip + 0x5d5f2fc]
0x14006dc64: subpd xmm0, xmmword ptr [rip + 0x5d5f304]
0x14006dc6c: movapd xmm6, xmm0
0x14006dc70: unpckhpd xmm6, xmm0
0x14006dc74: addsd xmm6, xmm0
0x14006dc78: lea rcx, [rip + 0x5d61b31]
0x14006dc7f: mov edx, 4
0x14006dc84: call 0x142aeace0
0x14006dc89: nop
0x14006dc8a: test rax, rax
0x14006dc8d: jne 0x14006dc96
0x14006dc8f: mov rax, qword ptr [rip + 0x7ff25fa]
0x14006dc96: cmp byte ptr [rax], 2
0x14006dc99: jne 0x14006dcb5
0x14006dc9b: mov rcx, qword ptr [rax + 8]
0x14006dc9f: cmp rcx, 2
0x14006dca3: je 0x14006dcbf
0x14006dca5: cmp ecx, 1
0x14006dca8: jne 0x14006dcc6
0x14006dcaa: xorps xmm0, xmm0
0x14006dcad: cvtsi2sd xmm0, qword ptr [rax + 0x10]
0x14006dcb3: jmp 0x14006dce6
0x14006dcb5: movsd xmm0, qword ptr [rip + 0x5d3b003]
0x14006dcbd: jmp 0x14006dcee
0x14006dcbf: movsd xmm0, qword ptr [rax + 0x10]
0x14006dcc4: jmp 0x14006dce6
0x14006dcc6: movsd xmm1, qword ptr [rax + 0x10]
0x14006dccb: unpcklps xmm1, xmmword ptr [rip + 0x5d5f28e]
0x14006dcd2: subpd xmm1, xmmword ptr [rip + 0x5d5f296]
0x14006dcda: movapd xmm0, xmm1
0x14006dcde: unpckhpd xmm0, xmm1
0x14006dce2: addsd xmm0, xmm1
0x14006dce6: maxsd xmm0, qword ptr [rip + 0x5d3afd2]
0x14006dcee: divsd xmm6, xmm0
0x14006dcf2: movsd qword ptr [rbp - 0x10], xmm6
0x14006dcf7: ucomisd xmm6, qword ptr [rip + 0x5d5f299]
0x14006dcff: jae 0x14006dd37
0x14006dd01: lea rax, [rbp - 0x10]
0x14006dd05: mov qword ptr [rbp + 0x138], rax
0x14006dd0c: lea rax, [rip + 0x5b7075d]
0x14006dd13: mov qword ptr [rbp + 0x140], rax
0x14006dd1a: lea rdx, [rip + 0x5d6092f]
0x14006dd21: lea rcx, [rbp + 0x1c0]
0x14006dd28: lea r8, [rbp + 0x138]
0x14006dd2f: call 0x145bcce30
0x14006dd34: nop
0x14006dd35: jmp 0x14006dd7e
0x14006dd37: divsd xmm6, qword ptr [rip + 0x5d5f259]
0x14006dd3f: movsd qword ptr [rbp + 0xc0], xmm6
0x14006dd47: lea rax, [rbp + 0xc0]
0x14006dd4e: mov qword ptr [rbp + 0x138], rax
0x14006dd55: lea rax, [rip + 0x5b70714]
0x14006dd5c: mov qword ptr [rbp + 0x140], rax
0x14006dd63: lea rdx, [rip + 0x5d61a98]
0x14006dd6a: lea rcx, [rbp + 0x1c0]
0x14006dd71: lea r8, [rbp + 0x138]
0x14006dd78: call 0x145bcce30
0x14006dd7d: nop
0x14006dd7e: lea r15, [rbp + 0x110]
0x14006dd85: mov qword ptr [rbp + 0x138], r15
0x14006dd8c: lea r12, [rip - 0x6bcd3]
0x14006dd93: mov qword ptr [rbp + 0x140], r12
0x14006dd9a: lea rbx, [rbp + 0x1c0]
0x14006dda1: mov qword ptr [rbp + 0x148], rbx
0x14006dda8: lea rsi, [rip - 0x6bccf]
0x14006ddaf: mov qword ptr [rbp + 0x150], rsi
0x14006ddb6: lea rdx, [rip + 0x5d61a4f]
0x14006ddbd: lea rcx, [rbp + 0x1f0]
0x14006ddc4: lea r8, [rbp + 0x138]
0x14006ddcb: call 0x145bcce30
0x14006ddd0: nop
0x14006ddd1: mov rdi, qword ptr [rbp + 0x1f0]
0x14006ddd8: movupd xmm0, xmmword ptr [rbp + 0x1f8]
0x14006dde0: movapd xmmword ptr [rbp + 0xc0], xmm0
0x14006dde8: mov rdx, qword ptr [rbp + 0x1c0]
0x14006ddef: test rdx, rdx
0x14006ddf2: je 0x14006de06
0x14006ddf4: mov rcx, qword ptr [rbp + 0x1c8]
0x14006ddfb: mov r8d, 1
0x14006de01: call 0x1400021d0
0x14006de06: cmp rdi, -1
0x14006de0a: je 0x14006decd
0x14006de10: mov qword ptr [rbp + 0x1c0], rdi
0x14006de17: movapd xmm0, xmmword ptr [rbp + 0xc0]
0x14006de1f: movupd xmmword ptr [rbp + 0x1c8], xmm0
0x14006de27: mov rcx, r14
0x14006de2a: call 0x14588c140
0x14006de2f: nop
0x14006de30: mov qword ptr [rbp + 0x110], rax
0x14006de37: mov qword ptr [rbp + 0x118], rdx
0x14006de3e: mov qword ptr [rbp + 0x138], r15
0x14006de45: mov qword ptr [rbp + 0x140], r12
0x14006de4c: mov qword ptr [rbp + 0x148], rbx
0x14006de53: mov qword ptr [rbp + 0x150], rsi
0x14006de5a: lea rdx, [rip + 0x5d61929]
0x14006de61: lea rcx, [rbp + 0x1f0]
0x14006de68: lea r8, [rbp + 0x138]
0x14006de6f: call 0x145bcce30
0x14006de74: nop
0x14006de75: mov rdi, qword ptr [rbp + 0x1f0]
0x14006de7c: mov r15, qword ptr [rbp + 0x1f8]
0x14006de83: mov rsi, qword ptr [rbp + 0x200]
0x14006de8a: mov rdx, qword ptr [rbp + 0x1c0]
0x14006de91: test rdx, rdx
0x14006de94: je 0x14006dea8
0x14006de96: mov rcx, qword ptr [rbp + 0x1c8]
0x14006de9d: mov r8d, 1
0x14006dea3: call 0x1400021d0
0x14006dea8: test rsi, rsi
0x14006deab: jns 0x14006e990
0x14006deb1: xor r14d, r14d
0x14006deb4: mov qword ptr [rbp + 0x58], r15
0x14006deb8: mov qword ptr [rbp + 0x50], rdi
0x14006debc: mov rcx, r14
0x14006debf: mov rdx, rsi
0x14006dec2: call 0x145d992bb
0x14006dec7: nop
0x14006dec8: jmp 0x14006e97a
0x14006decd: mov rcx, r14
0x14006ded0: call 0x14588c140
0x14006ded5: nop
0x14006ded6: mov rdi, rdx
0x14006ded9: test rdx, rdx
0x14006dedc: jns 0x14006def1
0x14006dede: xor ebx, ebx
0x14006dee0: mov rcx, rbx
0x14006dee3: mov rdx, rdi
0x14006dee6: call 0x145d992bb
0x14006deeb: nop
0x14006deec: jmp 0x14006e97a
0x14006def1: test rdi, rdi
0x14006def4: je 0x14006df6b
0x14006def6: mov rsi, rax
0x14006def9: call 0x140002200
0x14006defe: mov ebx, 1
0x14006df03: mov edx, 1
0x14006df08: mov rcx, rdi
0x14006df0b: call 0x1400021c0
0x14006df10: test rax, rax
0x14006df13: je 0x14006dee0
0x14006df15: mov r15, rax
0x14006df18: mov rcx, rax
0x14006df1b: mov rdx, rsi
0x14006df1e: mov r8, rdi
0x14006df21: call 0x145bfa0e7
0x14006df26: mov rsi, rdi
0x14006df29: call 0x140002200
0x14006df2e: mov r14d, 1
0x14006df34: mov edx, 1
0x14006df39: mov rcx, rsi
0x14006df3c: call 0x1400021c0
0x14006df41: test rax, rax
0x14006df44: je 0x14006deb4
0x14006df4a: mov rbx, rax
0x14006df4d: mov qword ptr [rbp + 0x220], rdi
0x14006df54: mov rcx, rax
0x14006df57: mov qword ptr [rbp + 0xe0], r15
0x14006df5e: mov rdx, r15
0x14006df61: mov r8, rsi
0x14006df64: call 0x145bfa0e7
0x14006df69: jmp 0x14006df89
0x14006df6b: mov eax, 1
0x14006df70: mov qword ptr [rbp + 0xe0], rax
0x14006df77: mov qword ptr [rbp + 0x220], 0
0x14006df82: xor esi, esi
0x14006df84: mov ebx, 1
0x14006df89: mov byte ptr [rbp + 0x138], 3
0x14006df90: mov qword ptr [rbp + 0x140], rsi
0x14006df97: mov qword ptr [rbp + 0x148], rbx
0x14006df9e: mov qword ptr [rbp + 0x150], rsi
0x14006dfa5: mov byte ptr [rbp + 0x1e9], 1
0x14006dfac: lea rcx, [rip + 0x5d6162d]
0x14006dfb3: lea r8, [rbp + 0xe8]
0x14006dfba: mov edx, 0xa
0x14006dfbf: call 0x142aeade0
0x14006dfc4: nop
0x14006dfc5: mov qword ptr [rbp + 0x108], rax
0x14006dfcc: mov rcx, rax
0x14006dfcf: call 0x14005e410
0x14006dfd4: nop
0x14006dfd5: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006dfdd: movupd xmm1, xmmword ptr [rbp + 0x148]
0x14006dfe5: mov rax, qword ptr [rbp + 0x108]
0x14006dfec: movupd xmmword ptr [rax + 0x10], xmm1
0x14006dff1: movupd xmmword ptr [rax], xmm0
0x14006dff5: mov rdx, qword ptr [rbp + 0x220]
0x14006dffc: test rdx, rdx
0x14006dfff: je 0x14006e013
0x14006e001: mov r8d, 1
0x14006e007: mov rcx, qword ptr [rbp + 0xe0]
0x14006e00e: call 0x1400021d0
0x14006e013: mov qword ptr [rbp + 0x110], 0
0x14006e01e: mov qword ptr [rbp + 0x120], 0
0x14006e029: call 0x140002200
0x14006e02e: mov ecx, 7
0x14006e033: mov edx, 1
0x14006e038: call 0x1400021c0
0x14006e03d: test rax, rax
0x14006e040: je 0x14006e910
0x14006e046: mov dword ptr [rax + 3], 0x736c6961
0x14006e04d: mov dword ptr [rax], 0x61746564
0x14006e053: mov qword ptr [rbp + 0x1c0], 7
0x14006e05e: mov qword ptr [rbp + 0x1c8], rax
0x14006e065: mov qword ptr [rbp + 0x1d0], 7
0x14006e070: mov rsi, qword ptr [rbp + 0x80]
0x14006e077: test rsi, rsi
0x14006e07a: mov qword ptr [rbp + 0x220], rax
0x14006e081: jns 0x14006e09e
0x14006e083: xor r15d, r15d
0x14006e086: mov byte ptr [rbp + 0x1e8], 1
0x14006e08d: mov rcx, r15
0x14006e090: mov rdx, rsi
0x14006e093: call 0x145d992bb
0x14006e098: nop
0x14006e099: jmp 0x14006e97a
0x14006e09e: mov r14, qword ptr [rbp + 0x78]
0x14006e0a2: je 0x14006e0d4
0x14006e0a4: call 0x140002200
0x14006e0a9: mov r15d, 1
0x14006e0af: mov edx, 1
0x14006e0b4: mov rcx, rsi
0x14006e0b7: call 0x1400021c0
0x14006e0bc: test rax, rax
0x14006e0bf: je 0x14006e086
0x14006e0c1: mov rbx, rax
0x14006e0c4: mov rcx, rax
0x14006e0c7: mov rdx, r14
0x14006e0ca: mov r8, rsi
0x14006e0cd: call 0x145bfa0e7
0x14006e0d2: jmp 0x14006e0d9
0x14006e0d4: mov ebx, 1
0x14006e0d9: mov byte ptr [rbp + 0x138], 3
0x14006e0e0: mov qword ptr [rbp + 0x140], rsi
0x14006e0e7: mov qword ptr [rbp + 0x148], rbx
0x14006e0ee: mov qword ptr [rbp + 0x150], rsi
0x14006e0f5: mov byte ptr [rbp + 0x1e8], 0
0x14006e0fc: lea rcx, [rbp + 0x1f0]
0x14006e103: lea rdx, [rbp + 0x110]
0x14006e10a: lea r8, [rbp + 0x1c0]
0x14006e111: lea r9, [rbp + 0x138]
0x14006e118: call 0x140062cb0
0x14006e11d: nop
0x14006e11e: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006e125: je 0x14006e134
0x14006e127: lea rcx, [rbp + 0x1f0]
0x14006e12e: call 0x14005e410
0x14006e133: nop
0x14006e134: call 0x140002200
0x14006e139: mov ecx, 5
0x14006e13e: mov edx, 1
0x14006e143: call 0x1400021c0
0x14006e148: test rax, rax
0x14006e14b: je 0x14006e934
0x14006e151: mov byte ptr [rax + 4], 0x65
0x14006e155: mov dword ptr [rax], 0x74617473
0x14006e15b: mov qword ptr [rbp + 0x1c0], 5
0x14006e166: mov qword ptr [rbp + 0x1c8], rax
0x14006e16d: mov qword ptr [rbp + 0x1d0], 5
0x14006e178: mov rdi, qword ptr [rbp + 0x128]
0x14006e17f: test rdi, rdi
0x14006e182: mov qword ptr [rbp + 0x220], rax
0x14006e189: jns 0x14006e1a5
0x14006e18b: xor ebx, ebx
0x14006e18d: mov byte ptr [rbp + 0x1e7], 1
0x14006e194: mov rcx, rbx
0x14006e197: mov rdx, rdi
0x14006e19a: call 0x145d992bb
0x14006e19f: nop
0x14006e1a0: jmp 0x14006e97a
0x14006e1a5: je 0x14006e1da
0x14006e1a7: call 0x140002200
0x14006e1ac: mov ebx, 1
0x14006e1b1: mov edx, 1
0x14006e1b6: mov rcx, rdi
0x14006e1b9: call 0x1400021c0
0x14006e1be: test rax, rax
0x14006e1c1: je 0x14006e18d
0x14006e1c3: mov rsi, rax
0x14006e1c6: mov rcx, rax
0x14006e1c9: mov rdx, qword ptr [rbp + 0x1b8]
0x14006e1d0: mov r8, rdi
0x14006e1d3: call 0x145bfa0e7
0x14006e1d8: jmp 0x14006e1df
0x14006e1da: mov esi, 1
0x14006e1df: mov byte ptr [rbp + 0x138], 3
0x14006e1e6: mov qword ptr [rbp + 0x140], rdi
0x14006e1ed: mov qword ptr [rbp + 0x148], rsi
0x14006e1f4: mov qword ptr [rbp + 0x150], rdi
0x14006e1fb: mov byte ptr [rbp + 0x1e7], 0
0x14006e202: lea rcx, [rbp + 0x1f0]
0x14006e209: lea rdx, [rbp + 0x110]
0x14006e210: lea r8, [rbp + 0x1c0]
0x14006e217: lea r9, [rbp + 0x138]
0x14006e21e: call 0x140062cb0
0x14006e223: nop
0x14006e224: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006e22b: je 0x14006e23a
0x14006e22d: lea rcx, [rbp + 0x1f0]
0x14006e234: call 0x14005e410
0x14006e239: nop
0x14006e23a: call 0x140002200
0x14006e23f: mov ecx, 6
0x14006e244: mov edx, 1
0x14006e249: call 0x1400021c0
0x14006e24e: test rax, rax
0x14006e251: je 0x14006e946
0x14006e257: mov word ptr [rax + 4], 0x7374
0x14006e25d: mov dword ptr [rax], 0x65737361
0x14006e263: mov qword ptr [rbp + 0x1c0], 6
0x14006e26e: mov qword ptr [rbp + 0x220], rax
0x14006e275: mov qword ptr [rbp + 0x1c8], rax
0x14006e27c: mov qword ptr [rbp + 0x1d0], 6
0x14006e287: lea rax, [rbp + 0xe8]
0x14006e28e: mov qword ptr [rbp + 0x1f0], rax
0x14006e295: mov byte ptr [rbp + 0x21d], 1
0x14006e29c: lea rcx, [rbp + 0x138]
0x14006e2a3: lea rdx, [rbp + 0x1f0]
0x14006e2aa: call 0x140060380
0x14006e2af: nop
0x14006e2b0: cmp byte ptr [rbp + 0x138], 0xff
0x14006e2b7: je 0x14006e750
0x14006e2bd: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006e2c5: movupd xmm1, xmmword ptr [rbp + 0x148]
0x14006e2cd: movapd xmmword ptr [rbp + 0x200], xmm1
0x14006e2d5: movapd xmmword ptr [rbp + 0x1f0], xmm0
0x14006e2dd: mov byte ptr [rbp + 0x21d], 0
0x14006e2e4: lea rcx, [rbp + 0x138]
0x14006e2eb: lea rdx, [rbp + 0x110]
0x14006e2f2: lea r8, [rbp + 0x1c0]
0x14006e2f9: lea r9, [rbp + 0x1f0]
0x14006e300: call 0x140062cb0
0x14006e305: nop
0x14006e306: cmp byte ptr [rbp + 0x138], 0xff
0x14006e30d: je 0x14006e31c
0x14006e30f: lea rcx, [rbp + 0x138]
0x14006e316: call 0x14005e410
0x14006e31b: nop
0x14006e31c: call 0x140002200
0x14006e321: mov ecx, 7
0x14006e326: mov edx, 1
0x14006e32b: call 0x1400021c0
0x14006e330: test rax, rax
0x14006e333: je 0x14006e958
0x14006e339: mov dword ptr [rax + 3], 0x736e6f74
0x14006e340: mov dword ptr [rax], 0x74747562
0x14006e346: mov qword ptr [rbp + 0x1c0], 7
0x14006e351: mov qword ptr [rbp + 0x220], rax
0x14006e358: mov qword ptr [rbp + 0x1c8], rax
0x14006e35f: mov qword ptr [rbp + 0x1d0], 7
0x14006e36a: lea rax, [rbp - 8]
0x14006e36e: mov qword ptr [rbp + 0x1f0], rax
0x14006e375: mov byte ptr [rbp + 0x21c], 1
0x14006e37c: lea rcx, [rbp + 0x138]
0x14006e383: lea rdx, [rbp + 0x1f0]
0x14006e38a: call 0x140060380
0x14006e38f: nop
0x14006e390: cmp byte ptr [rbp + 0x138], 0xff
0x14006e397: je 0x14006e78f
0x14006e39d: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006e3a5: movupd xmm1, xmmword ptr [rbp + 0x148]
0x14006e3ad: movapd xmmword ptr [rbp + 0x200], xmm1
0x14006e3b5: movapd xmmword ptr [rbp + 0x1f0], xmm0
0x14006e3bd: mov byte ptr [rbp + 0x21c], 0
0x14006e3c4: lea rcx, [rbp + 0x138]
0x14006e3cb: lea rdx, [rbp + 0x110]
0x14006e3d2: lea r8, [rbp + 0x1c0]
0x14006e3d9: lea r9, [rbp + 0x1f0]
0x14006e3e0: call 0x140062cb0
0x14006e3e5: nop
0x14006e3e6: cmp byte ptr [rbp + 0x138], 0xff
0x14006e3ed: je 0x14006e3fc
0x14006e3ef: lea rcx, [rbp + 0x138]
0x14006e3f6: call 0x14005e410
0x14006e3fb: nop
0x14006e3fc: movupd xmm0, xmmword ptr [rbp + 0x110]
0x14006e404: movupd xmmword ptr [rbp + 0x1c8], xmm0
0x14006e40c: mov rax, qword ptr [rbp + 0x120]
0x14006e413: mov qword ptr [rbp + 0x1d8], rax
0x14006e41a: mov byte ptr [rbp + 0x1c0], 5
0x14006e421: cmp byte ptr [rbp + 0x130], 0
0x14006e428: je 0x14006e4d2
0x14006e42e: call 0x145ba7ef0
0x14006e433: nop
0x14006e434: mov rbx, qword ptr [rbp + 0x2c0]
0x14006e43b: mov dword ptr [rbp + 0x1f0], eax
0x14006e441: mov dword ptr [rbp + 0x1f4], edx
0x14006e447: lea rcx, [rbp + 0x138]
0x14006e44e: lea rdx, [rbp + 0x1f0]
0x14006e455: mov r8d, 0xd53e8000
0x14006e45b: mov r9d, 0x19db1de
0x14006e461: call 0x145ba7ea0
0x14006e466: nop
0x14006e467: xor eax, eax
0x14006e469: cmp byte ptr [rbp + 0x138], 0
0x14006e470: mov esi, 0
0x14006e475: mov r8, qword ptr [rbp + 0x90]
0x14006e47c: movzx ecx, byte ptr [rbp + 0x21f]
0x14006e483: jne 0x14006e48c
0x14006e485: mov rsi, qword ptr [rbp + 0x140]
0x14006e48c: cmp cl, 0xff
0x14006e48f: je 0x14006e535
0x14006e495: lea rcx, [rip + 0x5d61314]
0x14006e49c: mov edx, 4
0x14006e4a1: call 0x142aeace0
0x14006e4a6: nop
0x14006e4a7: test rax, rax
0x14006e4aa: jne 0x14006e4b3
0x14006e4ac: mov rax, qword ptr [rip + 0x7ff1ddd]
0x14006e4b3: cmp byte ptr [rax], 2
0x14006e4b6: jne 0x14006e4e5
0x14006e4b8: mov rcx, qword ptr [rax + 8]
0x14006e4bc: cmp rcx, 2
0x14006e4c0: je 0x14006e4e9
0x14006e4c2: cmp ecx, 1
0x14006e4c5: jne 0x14006e4f0
0x14006e4c7: xorps xmm0, xmm0
0x14006e4ca: cvtsi2sd xmm0, qword ptr [rax + 0x10]
0x14006e4d0: jmp 0x14006e510
0x14006e4d2: mov rax, qword ptr [rbp + 0x2c0]
0x14006e4d9: mov qword ptr [rax], 0
0x14006e4e0: jmp 0x14006e688
0x14006e4e5: xor eax, eax
0x14006e4e7: jmp 0x14006e535
0x14006e4e9: movsd xmm0, qword ptr [rax + 0x10]
0x14006e4ee: jmp 0x14006e510
0x14006e4f0: movsd xmm1, qword ptr [rax + 0x10]
0x14006e4f5: unpcklps xmm1, xmmword ptr [rip + 0x5d5ea64]
0x14006e4fc: subpd xmm1, xmmword ptr [rip + 0x5d5ea6c]
0x14006e504: movapd xmm0, xmm1
0x14006e508: unpckhpd xmm0, xmm1
0x14006e50c: addsd xmm0, xmm1
0x14006e510: cvttsd2si rax, xmm0
0x14006e515: ucomisd xmm0, qword ptr [rip + 0x5d5ea83]
0x14006e51d: movabs rcx, 0x7fffffffffffffff
0x14006e527: cmovbe rcx, rax
0x14006e52b: xor eax, eax
0x14006e52d: ucomisd xmm0, xmm0
0x14006e531: cmovnp rax, rcx
0x14006e535: sub rsi, rax
0x14006e538: cmp dword ptr [rbx], 1
0x14006e53b: jne 0x14006e557
0x14006e53d: mov rdi, qword ptr [rbx + 8]
0x14006e541: mov rax, rdi
0x14006e544: sub rax, rsi
0x14006e547: mov rcx, rax
0x14006e54a: neg rcx
0x14006e54d: cmovs rcx, rax
0x14006e551: cmp rcx, 4
0x14006e555: jl 0x14006e565
0x14006e557: mov qword ptr [rbx], 1
0x14006e55e: mov qword ptr [rbx + 8], rsi
0x14006e562: mov rdi, rsi
0x14006e565: mov qword ptr [rbp + 0xc0], 0
0x14006e570: mov qword ptr [rbp + 0xd0], 0
0x14006e57b: call 0x140002200
0x14006e580: mov ecx, 5
0x14006e585: mov edx, 1
0x14006e58a: call 0x1400021c0
0x14006e58f: test rax, rax
0x14006e592: je 0x14006e96a
0x14006e598: mov byte ptr [rax + 4], 0x74
0x14006e59c: mov dword ptr [rax], 0x72617473
0x14006e5a2: mov qword ptr [rbp + 0x110], 5
0x14006e5ad: mov qword ptr [rbp + 0x118], rax
0x14006e5b4: mov qword ptr [rbp + 0x120], 5
0x14006e5bf: mov rax, rdi
0x14006e5c2: shr rax, 0x3f
0x14006e5c6: mov byte ptr [rbp + 0x138], 2
0x14006e5cd: mov qword ptr [rbp + 0x140], rax
0x14006e5d4: mov qword ptr [rbp + 0x148], rdi
0x14006e5db: lea rcx, [rbp + 0x1f0]
0x14006e5e2: lea rdx, [rbp + 0xc0]
0x14006e5e9: lea r8, [rbp + 0x110]
0x14006e5f0: lea r9, [rbp + 0x138]
0x14006e5f7: call 0x140062cb0
0x14006e5fc: nop
0x14006e5fd: cmp byte ptr [rbp + 0x1f0], 0xff
0x14006e604: je 0x14006e613
0x14006e606: lea rcx, [rbp + 0x1f0]
0x14006e60d: call 0x14005e410
0x14006e612: nop
0x14006e613: movupd xmm0, xmmword ptr [rbp + 0xc0]
0x14006e61b: movupd xmmword ptr [rbp + 0x140], xmm0
0x14006e623: mov rax, qword ptr [rbp + 0xd0]
0x14006e62a: mov qword ptr [rbp + 0x150], rax
0x14006e631: mov byte ptr [rbp + 0x138], 5
0x14006e638: mov byte ptr [rbp + 0x1e6], 1
0x14006e63f: lea rcx, [rip + 0x5d6116e]
0x14006e646: lea r8, [rbp + 0x1c0]
0x14006e64d: mov edx, 0xa
0x14006e652: call 0x142aeade0
0x14006e657: nop
0x14006e658: mov qword ptr [rbp + 0x220], rax
0x14006e65f: mov rcx, rax
0x14006e662: call 0x14005e410
0x14006e667: nop
0x14006e668: movupd xmm0, xmmword ptr [rbp + 0x138]
0x14006e670: movupd xmm1, xmmword ptr [rbp + 0x148]
0x14006e678: mov rax, qword ptr [rbp + 0x220]
0x14006e67f: movupd xmmword ptr [rax + 0x10], xmm1
0x14006e684: movupd xmmword ptr [rax], xmm0
0x14006e688: movupd xmm0, xmmword ptr [rbp + 0x1c0]
0x14006e690: movupd xmm1, xmmword ptr [rbp + 0x1d0]
0x14006e698: mov rax, qword ptr [rbp + 0x88]
0x14006e69f: movupd xmmword ptr [rax + 0x10], xmm1
0x14006e6a4: movupd xmmword ptr [rax], xmm0
0x14006e6a8: lea rcx, [rbp + 0xe8]
0x14006e6af: call 0x14005e410
0x14006e6b4: nop
0x14006e6b5: mov rdx, qword ptr [rbp + 0x210]
0x14006e6bc: test rdx, rdx
0x14006e6bf: je 0x14006e6d3
0x14006e6c1: mov r8d, 1
0x14006e6c7: mov rcx, qword ptr [rbp + 0x1b8]
0x14006e6ce: call 0x1400021d0
0x14006e6d3: mov rdx, qword ptr [rbp + 0x70]
0x14006e6d7: test rdx, rdx
0x14006e6da: je 0x14006e6ea
0x14006e6dc: mov r8d, 1
0x14006e6e2: mov rcx, r14
0x14006e6e5: call 0x1400021d0
0x14006e6ea: mov rdx, qword ptr [rbp + 0x98]
0x14006e6f1: test rdx, rdx
0x14006e6f4: je 0x14006b8f8
0x14006e6fa: mov rcx, qword ptr [rbp + 0xa0]
0x14006e701: mov r8d, 1
0x14006e707: call 0x1400021d0
0x14006e70c: jmp 0x14006b8f8
0x14006e711: mov rax, qword ptr [rbp + 0x140]
0x14006e718: mov qword ptr [rbp + 0x1f0], rax
0x14006e71f: lea rax, [rip + 0x5d60e42]
0x14006e726: mov qword ptr [rsp + 0x20], rax
0x14006e72b: lea rcx, [rip + 0x5d5fde6]
0x14006e732: lea r9, [rip + 0x5d5fdbf]
0x14006e739: lea r8, [rbp + 0x1f0]
0x14006e740: mov edx, 0x2b
0x14006e745: call 0x145d995d0
0x14006e74a: nop
0x14006e74b: jmp 0x14006e97a
0x14006e750: mov rax, qword ptr [rbp + 0x140]
0x14006e757: mov qword ptr [rbp + 0x1f0], rax
0x14006e75e: lea rax, [rip + 0x5d61033]
0x14006e765: mov qword ptr [rsp + 0x20], rax
0x14006e76a: lea rcx, [rip + 0x5d5fda7]
0x14006e771: lea r9, [rip + 0x5d5fd80]
0x14006e778: lea r8, [rbp + 0x1f0]
0x14006e77f: mov edx, 0x2b
0x14006e784: call 0x145d995d0
0x14006e789: nop
0x14006e78a: jmp 0x14006e97a
0x14006e78f: mov rax, qword ptr [rbp + 0x140]
0x14006e796: mov qword ptr [rbp + 0x1f0], rax
0x14006e79d: lea rax, [rip + 0x5d60ff4]
0x14006e7a4: mov qword ptr [rsp + 0x20], rax
0x14006e7a9: lea rcx, [rip + 0x5d5fd68]
0x14006e7b0: lea r9, [rip + 0x5d5fd41]
0x14006e7b7: lea r8, [rbp + 0x1f0]
0x14006e7be: mov edx, 0x2b
0x14006e7c3: call 0x145d995d0
0x14006e7c8: nop
0x14006e7c9: jmp 0x14006e97a
0x14006e7ce: mov ecx, 1
0x14006e7d3: mov edx, 5
0x14006e7d8: call 0x145d992bb
0x14006e7dd: nop
0x14006e7de: jmp 0x14006e97a
0x14006e7e3: mov ecx, 1
0x14006e7e8: mov edx, 3
0x14006e7ed: call 0x145d992bb
0x14006e7f2: nop
0x14006e7f3: jmp 0x14006e97a
0x14006e7f8: mov ecx, 1
0x14006e7fd: mov edx, 0x16
0x14006e802: call 0x145d992bb
0x14006e807: nop
0x14006e808: jmp 0x14006e97a
0x14006e80d: mov ecx, 1
0x14006e812: mov edx, 7
0x14006e817: call 0x145d992bb
0x14006e81c: nop
0x14006e81d: jmp 0x14006e97a
0x14006e822: mov ecx, 1
0x14006e827: mov edx, 0xb
0x14006e82c: call 0x145d992bb
0x14006e831: nop
0x14006e832: jmp 0x14006e97a
0x14006e837: mov ecx, 1
0x14006e83c: mov edx, 4
0x14006e841: call 0x145d992bb
0x14006e846: nop
0x14006e847: jmp 0x14006e97a
0x14006e84c: mov ecx, 1
0x14006e851: mov edx, 0xa
0x14006e856: call 0x145d992bb
0x14006e85b: nop
0x14006e85c: jmp 0x14006e97a
0x14006e861: mov ecx, 1
0x14006e866: mov edx, 5
0x14006e86b: call 0x145d992bb
0x14006e870: nop
0x14006e871: jmp 0x14006e97a
0x14006e876: mov ecx, 1
0x14006e87b: mov edx, 6
0x14006e880: call 0x145d992bb
0x14006e885: nop
0x14006e886: jmp 0x14006e97a
0x14006e88b: mov ecx, 1
0x14006e890: mov edx, 0xb
0x14006e895: call 0x145d992bb
0x14006e89a: nop
0x14006e89b: jmp 0x14006e97a
0x14006e8a0: mov ecx, 1
0x14006e8a5: mov edx, 4
0x14006e8aa: call 0x145d992bb
0x14006e8af: nop
0x14006e8b0: jmp 0x14006e97a
0x14006e8b5: mov ecx, 1
0x14006e8ba: mov edx, 0xa
0x14006e8bf: call 0x145d992bb
0x14006e8c4: nop
0x14006e8c5: jmp 0x14006e97a
0x14006e8ca: mov ecx, 1
0x14006e8cf: mov edx, 0x11
0x14006e8d4: call 0x145d992bb
0x14006e8d9: nop
0x14006e8da: jmp 0x14006e97a
0x14006e8df: mov ecx, 1
0x14006e8e4: mov edx, 0xb
0x14006e8e9: call 0x145d992bb
0x14006e8ee: nop
0x14006e8ef: jmp 0x14006e97a
0x14006e8f4: mov ecx, 1
0x14006e8f9: jmp 0x14006d6ec
0x14006e8fe: mov ecx, 1
0x14006e903: mov edx, 0xa
0x14006e908: call 0x145d992bb
0x14006e90d: nop
0x14006e90e: jmp 0x14006e97a
0x14006e910: mov ecx, 1
0x14006e915: mov edx, 7
0x14006e91a: call 0x145d992bb
0x14006e91f: nop
0x14006e920: jmp 0x14006e97a
0x14006e922: mov ecx, 1
0x14006e927: mov edx, 7
0x14006e92c: call 0x145d992bb
0x14006e931: nop
0x14006e932: jmp 0x14006e97a
0x14006e934: mov ecx, 1
0x14006e939: mov edx, 5
0x14006e93e: call 0x145d992bb
0x14006e943: nop
0x14006e944: jmp 0x14006e97a
0x14006e946: mov ecx, 1
0x14006e94b: mov edx, 6
0x14006e950: call 0x145d992bb
0x14006e955: nop
0x14006e956: jmp 0x14006e97a
0x14006e958: mov ecx, 1
0x14006e95d: mov edx, 7
0x14006e962: call 0x145d992bb
0x14006e967: nop
0x14006e968: jmp 0x14006e97a
0x14006e96a: mov ecx, 1
0x14006e96f: mov edx, 5
0x14006e974: call 0x145d992bb
0x14006e979: nop
0x14006e97a: ud2
0x14006e97c: jne 0x14006d763
0x14006e982: mov r12d, 1
0x14006e988: xor r15d, r15d
0x14006e98b: jmp 0x14006d7a1
0x14006e990: mov qword ptr [rbp + 0xe0], r15
0x14006e997: mov qword ptr [rbp + 0x220], rdi
0x14006e99e: je 0x14006e9b3
0x14006e9a0: mov rdi, qword ptr [rbp + 0x220]
0x14006e9a7: mov r15, qword ptr [rbp + 0xe0]
0x14006e9ae: jmp 0x14006df29
0x14006e9b3: mov ebx, 1
0x14006e9b8: xor esi, esi
0x14006e9ba: jmp 0x14006df89
