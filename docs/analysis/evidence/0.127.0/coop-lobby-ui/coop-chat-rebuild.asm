0x1402e4490: push rbp
0x1402e4491: push r15
0x1402e4493: push r14
0x1402e4495: push r13
0x1402e4497: push r12
0x1402e4499: push rsi
0x1402e449a: push rdi
0x1402e449b: push rbx
0x1402e449c: sub rsp, 0x238
0x1402e44a3: lea rbp, [rsp + 0x80]
0x1402e44ab: mov qword ptr [rbp + 0x1b0], 0xfffffffffffffffe
0x1402e44b6: mov rbx, qword ptr [rbp + 0x248]
0x1402e44bd: mov rax, qword ptr [rbp + 0x228]
0x1402e44c4: mov rcx, qword ptr [rbp + 0x240]
0x1402e44cb: mov r10, qword ptr [rbp + 0x238]
0x1402e44d2: mov r11, qword ptr [rbp + 0x230]
0x1402e44d9: mov rsi, qword ptr [rbp + 0x220]
0x1402e44e0: mov rdi, qword ptr [rdx + 0x20]
0x1402e44e4: mov qword ptr [rbp - 0x20], rdi
0x1402e44e8: movups xmm0, xmmword ptr [rdx]
0x1402e44eb: movups xmm1, xmmword ptr [rdx + 0x10]
0x1402e44ef: movaps xmmword ptr [rbp - 0x30], xmm1
0x1402e44f3: movaps xmmword ptr [rbp - 0x40], xmm0
0x1402e44f7: movups xmm0, xmmword ptr [r8]
0x1402e44fb: movups xmm1, xmmword ptr [r8 + 0x10]
0x1402e4500: movups xmmword ptr [rbp - 8], xmm1
0x1402e4504: movups xmmword ptr [rbp - 0x18], xmm0
0x1402e4508: movups xmm0, xmmword ptr [r9]
0x1402e450c: movups xmm1, xmmword ptr [r9 + 0x10]
0x1402e4511: movups xmmword ptr [rbp + 0x18], xmm1
0x1402e4515: movups xmmword ptr [rbp + 8], xmm0
0x1402e4519: movups xmm0, xmmword ptr [rsi]
0x1402e451c: movups xmm1, xmmword ptr [rsi + 0x10]
0x1402e4520: movups xmmword ptr [rbp + 0x88], xmm1
0x1402e4527: movups xmmword ptr [rbp + 0x78], xmm0
0x1402e452b: movups xmm0, xmmword ptr [rax]
0x1402e452e: movups xmm1, xmmword ptr [rax + 0x10]
0x1402e4532: movups xmmword ptr [rbp + 0xa8], xmm1
0x1402e4539: movups xmmword ptr [rbp + 0x98], xmm0
0x1402e4540: movups xmm0, xmmword ptr [r11]
0x1402e4544: movups xmm1, xmmword ptr [r11 + 0x10]
0x1402e4549: movups xmmword ptr [rbp + 0x28], xmm0
0x1402e454d: movups xmmword ptr [rbp + 0x38], xmm1
0x1402e4551: movups xmm0, xmmword ptr [r10]
0x1402e4555: movups xmmword ptr [rbp + 0x48], xmm0
0x1402e4559: mov rdx, qword ptr [r10 + 0x10]
0x1402e455d: mov qword ptr [rbp + 0x58], rdx
0x1402e4561: mov rdx, qword ptr [rcx + 0x10]
0x1402e4565: mov qword ptr [rbp + 0x70], rdx
0x1402e4569: movups xmm0, xmmword ptr [rcx]
0x1402e456c: movaps xmmword ptr [rbp + 0x60], xmm0
0x1402e4570: mov qword ptr [rbp + 0xb8], rbx
0x1402e4577: cmp qword ptr [rbp + 0x98], 0
0x1402e457f: je 0x1402e53f2
0x1402e4585: movups xmm0, xmmword ptr [rax]
0x1402e4588: movups xmm1, xmmword ptr [rax + 0x10]
0x1402e458c: movaps xmmword ptr [rbp - 0x50], xmm1
0x1402e4590: movaps xmmword ptr [rbp - 0x60], xmm0
0x1402e4594: mov rbx, qword ptr [rbp + 0x48]
0x1402e4598: mov r10, qword ptr [rbp + 0x50]
0x1402e459c: mov eax, dword ptr [rbp + 0x5c]
0x1402e459f: mov dword ptr [rbp + 0x14c], eax
0x1402e45a5: mov rsi, qword ptr [rbx + 0xf8]
0x1402e45ac: mov rax, qword ptr [rbx + 0x100]
0x1402e45b3: lea r11, [rsi + rax*4]
0x1402e45b7: movzx eax, byte ptr [rbx + 0x108]
0x1402e45be: mov byte ptr [rbp + 0x160], al
0x1402e45c4: test al, al
0x1402e45c6: je 0x1402e47c4
0x1402e45cc: mov r13d, 8
0x1402e45d2: xor edx, edx
0x1402e45d4: xor r14d, r14d
0x1402e45d7: xor r15d, r15d
0x1402e45da: mov qword ptr [rbp + 0x168], 0
0x1402e45e5: mov qword ptr [rbp + 0x178], 0
0x1402e45f0: mov dword ptr [rbp + 0x198], 0
0x1402e45fa: xor r9d, r9d
0x1402e45fd: mov qword ptr [rbp + 0x190], rax
0x1402e4604: cmp r14d, r9d
0x1402e4607: jne 0x1402e4704
0x1402e460d: xor edi, edi
0x1402e460f: mov eax, 8
0x1402e4614: cmp rsi, r11
0x1402e4617: je 0x1402e4a04
0x1402e461d: mov r8, qword ptr [r10 + 0x1a8]
0x1402e4624: nop word ptr cs:[rax + rax]
0x1402e4630: mov r9d, dword ptr [rsi]
0x1402e4633: lea r15, [r9 + r9*8]
0x1402e4637: mov r9, qword ptr [r8 + r15*8 + 0x10]
0x1402e463c: test r9, r9
0x1402e463f: jne 0x1402e4650
0x1402e4641: add rsi, 4
0x1402e4645: cmp rsi, r11
0x1402e4648: jne 0x1402e4630
0x1402e464a: jmp 0x1402e4a01
0x1402e464f: nop 
0x1402e4650: lea r8, [r8 + r15*8]
0x1402e4654: mov rax, qword ptr [rbx + 0x110]
0x1402e465b: xor r14d, r14d
0x1402e465e: mov rdx, qword ptr [r8 + 0x38]
0x1402e4662: cmp rax, qword ptr [r8 + 0x40]
0x1402e4666: jae 0x1402e4696
0x1402e4668: mov rax, qword ptr [rdx + rax*8]
0x1402e466c: test rax, rax
0x1402e466f: je 0x1402e4696
0x1402e4671: mov rdi, qword ptr [r8 + 0x18]
0x1402e4675: not rax
0x1402e4678: lea rax, [rax + rax*2]
0x1402e467c: shl rax, 4
0x1402e4680: mov rax, qword ptr [rdi + rax + 0x10]
0x1402e4685: mov qword ptr [rbp + 0x178], rax
0x1402e468c: mov al, 1
0x1402e468e: mov dword ptr [rbp + 0x198], eax
0x1402e4694: jmp 0x1402e46a0
0x1402e4696: mov dword ptr [rbp + 0x198], 0
0x1402e46a0: add rsi, 4
0x1402e46a4: mov rdi, qword ptr [rbx + 0x118]
0x1402e46ab: mov r15, qword ptr [rbx + 0x120]
0x1402e46b2: mov rdi, qword ptr [rdx + rdi*8]
0x1402e46b6: mov r13, qword ptr [r8 + 8]
0x1402e46ba: mov r12, qword ptr [r8 + 0x18]
0x1402e46be: not rdi
0x1402e46c1: lea rdi, [rdi + rdi*2]
0x1402e46c5: shl rdi, 4
0x1402e46c9: mov rax, qword ptr [r12 + rdi + 0x10]
0x1402e46ce: mov qword ptr [rbp + 0x168], rax
0x1402e46d5: mov rax, qword ptr [r12 + rdi + 0x28]
0x1402e46da: mov qword ptr [rbp + 0x150], rax
0x1402e46e1: mov rdx, qword ptr [rdx + r15*8]
0x1402e46e5: not rdx
0x1402e46e8: lea rdx, [rdx + rdx*2]
0x1402e46ec: shl rdx, 4
0x1402e46f0: mov r15, qword ptr [r12 + rdx + 0x10]
0x1402e46f5: mov rax, qword ptr [r12 + rdx + 0x28]
0x1402e46fa: mov qword ptr [rbp + 0x158], rax
0x1402e4701: mov edx, r9d
0x1402e4704: mov r12d, r14d
0x1402e4707: mov rdi, qword ptr [r13 + r12*8]
0x1402e470c: test edi, edi
0x1402e470e: je 0x1402e47a0
0x1402e4714: lea rcx, [r12 + r12*2]
0x1402e4718: mov rax, qword ptr [rbp + 0x178]
0x1402e471f: lea rax, [rax + rcx*8]
0x1402e4723: test byte ptr [rbp + 0x198], 1
0x1402e472a: mov r8d, 0
0x1402e4730: cmove rax, r8
0x1402e4734: mov qword ptr [rbp + 0x180], rax
0x1402e473b: mov rax, qword ptr [rbp + 0x168]
0x1402e4742: lea rax, [rax + rcx*4]
0x1402e4746: mov qword ptr [rbp + 0x1a8], rax
0x1402e474d: mov rax, qword ptr [rbp + 0x150]
0x1402e4754: lea rax, [rax + r12*4]
0x1402e4758: mov qword ptr [rbp + 0x188], rax
0x1402e475f: shl rcx, 7
0x1402e4763: add rcx, r15
0x1402e4766: mov rax, qword ptr [rbp + 0x158]
0x1402e476d: lea rax, [rax + r12*4]
0x1402e4771: mov qword ptr [rbp + 0x170], rax
0x1402e4778: mov rax, rdi
0x1402e477b: shr rax, 0x20
0x1402e477f: mov qword ptr [rbp + 0x190], rax
0x1402e4786: inc r14d
0x1402e4789: test edi, edi
0x1402e478b: je 0x1402e4604
0x1402e4791: jmp 0x1402e47ad
0x1402e4793: nop word ptr cs:[rax + rax]
0x1402e47a0: xor edi, edi
0x1402e47a2: inc r14d
0x1402e47a5: test edi, edi
0x1402e47a7: je 0x1402e4604
0x1402e47ad: mov eax, 8
0x1402e47b2: cmp byte ptr [rbp + 0x160], 0
0x1402e47b9: jne 0x1402e4a4f
0x1402e47bf: jmp 0x1402e4abb
0x1402e47c4: mov eax, 8
0x1402e47c9: xor edx, edx
0x1402e47cb: xor r14d, r14d
0x1402e47ce: xor r9d, r9d
0x1402e47d1: mov qword ptr [rbp + 0x168], 0
0x1402e47dc: mov qword ptr [rbp + 0x178], 0
0x1402e47e7: mov dword ptr [rbp + 0x198], 0
0x1402e47f1: xor r12d, r12d
0x1402e47f4: mov qword ptr [rbp + 0x190], r8
0x1402e47fb: cmp r14d, r12d
0x1402e47fe: jne 0x1402e4943
0x1402e4804: xor edi, edi
0x1402e4806: mov r13d, 8
0x1402e480c: cmp rsi, r11
0x1402e480f: je 0x1402e4a04
0x1402e4815: mov r8, qword ptr [r10 + 0x108]
0x1402e481c: nop dword ptr [rax]
0x1402e4820: mov r9d, dword ptr [rsi]
0x1402e4823: lea r9, [r9 + r9*4]
0x1402e4827: shl r9, 5
0x1402e482b: mov r12, qword ptr [r8 + r9 + 0x58]
0x1402e4830: test r12, r12
0x1402e4833: jne 0x1402e4850
0x1402e4835: add rsi, 4
0x1402e4839: cmp rsi, r11
0x1402e483c: jne 0x1402e4820
0x1402e483e: jmp 0x1402e4a12
0x1402e4843: nop word ptr cs:[rax + rax]
0x1402e4850: add r8, r9
0x1402e4853: mov eax, dword ptr [r8 + 0x94]
0x1402e485a: lea rax, [rax + rax*8]
0x1402e485e: shl rax, 3
0x1402e4862: add rax, qword ptr [r10 + 0x1a8]
0x1402e4869: mov rdx, qword ptr [rbx + 0x110]
0x1402e4870: xor r14d, r14d
0x1402e4873: cmp rdx, qword ptr [r8 + 0x88]
0x1402e487a: jae 0x1402e48c4
0x1402e487c: mov r9, qword ptr [r8 + 0x80]
0x1402e4883: cmp qword ptr [r9 + rdx*8], 0
0x1402e4888: je 0x1402e48c4
0x1402e488a: mov r9b, 1
0x1402e488d: mov dword ptr [rbp + 0x198], r9d
0x1402e4894: cmp rdx, qword ptr [rax + 0x40]
0x1402e4898: jae 0x1402e48d0
0x1402e489a: mov r9, qword ptr [rax + 0x38]
0x1402e489e: mov rdx, qword ptr [r9 + rdx*8]
0x1402e48a2: test rdx, rdx
0x1402e48a5: je 0x1402e48d0
0x1402e48a7: mov r9, qword ptr [rax + 0x18]
0x1402e48ab: not rdx
0x1402e48ae: lea rdx, [rdx + rdx*2]
0x1402e48b2: shl rdx, 4
0x1402e48b6: mov rdx, qword ptr [r9 + rdx + 0x10]
0x1402e48bb: mov qword ptr [rbp + 0x178], rdx
0x1402e48c2: jmp 0x1402e48db
0x1402e48c4: mov dword ptr [rbp + 0x198], 0
0x1402e48ce: jmp 0x1402e48db
0x1402e48d0: mov qword ptr [rbp + 0x178], 0
0x1402e48db: add rsi, 4
0x1402e48df: mov rdx, qword ptr [rax + 0x18]
0x1402e48e3: mov rax, qword ptr [rax + 0x38]
0x1402e48e7: mov r9, qword ptr [rbx + 0x118]
0x1402e48ee: mov rdi, qword ptr [rbx + 0x120]
0x1402e48f5: mov r9, qword ptr [rax + r9*8]
0x1402e48f9: not r9
0x1402e48fc: lea r9, [r9 + r9*2]
0x1402e4900: shl r9, 4
0x1402e4904: mov r15, qword ptr [rdx + r9 + 0x10]
0x1402e4909: mov qword ptr [rbp + 0x168], r15
0x1402e4910: mov r9, qword ptr [rdx + r9 + 0x28]
0x1402e4915: mov qword ptr [rbp + 0x150], r9
0x1402e491c: mov rax, qword ptr [rax + rdi*8]
0x1402e4920: not rax
0x1402e4923: lea rax, [rax + rax*2]
0x1402e4927: shl rax, 4
0x1402e492b: mov r9, qword ptr [rdx + rax + 0x10]
0x1402e4930: mov rax, qword ptr [rdx + rax + 0x28]
0x1402e4935: mov qword ptr [rbp + 0x158], rax
0x1402e493c: mov rax, qword ptr [r8 + 0x50]
0x1402e4940: mov edx, r12d
0x1402e4943: mov r8d, r14d
0x1402e4946: shl r8, 4
0x1402e494a: mov rdi, qword ptr [rax + r8]
0x1402e494e: test edi, edi
0x1402e4950: je 0x1402e49e0
0x1402e4956: add r8, rax
0x1402e4959: mov r8d, dword ptr [r8 + 8]
0x1402e495d: not r8d
0x1402e4960: lea rcx, [r8 + r8*2]
0x1402e4964: mov r15, qword ptr [rbp + 0x178]
0x1402e496b: lea r13, [r15 + rcx*8]
0x1402e496f: test byte ptr [rbp + 0x198], 1
0x1402e4976: mov r15d, 0
0x1402e497c: cmove r13, r15
0x1402e4980: mov qword ptr [rbp + 0x180], r13
0x1402e4987: mov r15, qword ptr [rbp + 0x168]
0x1402e498e: lea r13, [r15 + rcx*4]
0x1402e4992: mov qword ptr [rbp + 0x1a8], r13
0x1402e4999: mov r15, qword ptr [rbp + 0x150]
0x1402e49a0: lea r13, [r15 + r8*4]
0x1402e49a4: mov qword ptr [rbp + 0x188], r13
0x1402e49ab: shl rcx, 7
0x1402e49af: add rcx, r9
0x1402e49b2: mov r15, qword ptr [rbp + 0x158]
0x1402e49b9: lea r8, [r15 + r8*4]
0x1402e49bd: mov qword ptr [rbp + 0x170], r8
0x1402e49c4: mov r8, rdi
0x1402e49c7: shr r8, 0x20
0x1402e49cb: mov qword ptr [rbp + 0x190], r8
0x1402e49d2: inc r14d
0x1402e49d5: test edi, edi
0x1402e49d7: je 0x1402e47fb
0x1402e49dd: jmp 0x1402e49ed
0x1402e49df: nop 
0x1402e49e0: xor edi, edi
0x1402e49e2: inc r14d
0x1402e49e5: test edi, edi
0x1402e49e7: je 0x1402e47fb
0x1402e49ed: mov r13d, 8
0x1402e49f3: cmp byte ptr [rbp + 0x160], 0
0x1402e49fa: jne 0x1402e4a4f
0x1402e49fc: jmp 0x1402e4abb
0x1402e4a01: mov rsi, r11
0x1402e4a04: cmp byte ptr [rbp + 0x160], 0
0x1402e4a0b: jne 0x1402e4a4f
0x1402e4a0d: jmp 0x1402e4abb
0x1402e4a12: mov rsi, r11
0x1402e4a15: cmp byte ptr [rbp + 0x160], 0
0x1402e4a1c: jne 0x1402e4a4f
0x1402e4a1e: jmp 0x1402e4abb
0x1402e4a23: nop word ptr cs:[rax + rax]
0x1402e4a30: lea rax, [rax + r8*8]
0x1402e4a34: mov r13, qword ptr [rax + 8]
0x1402e4a38: xor r14d, r14d
0x1402e4a3b: mov eax, r14d
0x1402e4a3e: inc r14d
0x1402e4a41: mov r8d, dword ptr [r13 + rax*8]
0x1402e4a46: test r8, r8
0x1402e4a49: jne 0x1402e4ae9
0x1402e4a4f: cmp r14d, edx
0x1402e4a52: jne 0x1402e4a3b
0x1402e4a54: nop word ptr cs:[rax + rax]
0x1402e4a60: cmp rsi, r11
0x1402e4a63: je 0x1402e4ae6
0x1402e4a69: mov edx, dword ptr [rsi]
0x1402e4a6b: add rsi, 4
0x1402e4a6f: mov rax, qword ptr [r10 + 0x1a8]
0x1402e4a76: lea r8, [rdx + rdx*8]
0x1402e4a7a: mov rdx, qword ptr [rax + r8*8 + 0x10]
0x1402e4a7f: test rdx, rdx
0x1402e4a82: je 0x1402e4a60
0x1402e4a84: jmp 0x1402e4a30
0x1402e4a86: nop word ptr cs:[rax + rax]
0x1402e4a90: add rax, r8
0x1402e4a93: mov r8, qword ptr [rbx + 0x110]
0x1402e4a9a: cmp r8, qword ptr [rax + 0x88]
0x1402e4aa1: mov rax, qword ptr [rax + 0x50]
0x1402e4aa5: xor r14d, r14d
0x1402e4aa8: mov r8d, r14d
0x1402e4aab: shl r8, 4
0x1402e4aaf: inc r14d
0x1402e4ab2: mov r8d, dword ptr [rax + r8]
0x1402e4ab6: test r8, r8
0x1402e4ab9: jne 0x1402e4ae9
0x1402e4abb: cmp r14d, edx
0x1402e4abe: jne 0x1402e4aa8
0x1402e4ac0: cmp rsi, r11
0x1402e4ac3: je 0x1402e4ae6
0x1402e4ac5: mov edx, dword ptr [rsi]
0x1402e4ac7: add rsi, 4
0x1402e4acb: mov rax, qword ptr [r10 + 0x108]
0x1402e4ad2: lea r8, [rdx + rdx*4]
0x1402e4ad6: shl r8, 5
0x1402e4ada: mov rdx, qword ptr [rax + r8 + 0x58]
0x1402e4adf: test rdx, rdx
0x1402e4ae2: je 0x1402e4ac0
0x1402e4ae4: jmp 0x1402e4a90
0x1402e4ae6: xor r8d, r8d
0x1402e4ae9: test edi, edi
0x1402e4aeb: je 0x1402e4b85
0x1402e4af1: test r8, r8
0x1402e4af4: jne 0x1402e4b85
0x1402e4afa: mov r9, qword ptr [rbp - 0x18]
0x1402e4afe: movss xmm0, dword ptr [rip + 0x5f92cda]
0x1402e4b06: cmp qword ptr [r9 + 0x50], 0
0x1402e4b0b: je 0x1402e4c23
0x1402e4b11: mov rax, qword ptr [r9 + 0x18]
0x1402e4b15: mov rdx, qword ptr [r9 + 0x20]
0x1402e4b19: cmp rdx, 4
0x1402e4b1d: je 0x1402e5406
0x1402e4b23: cmp rdx, 6
0x1402e4b27: je 0x1402e4bdb
0x1402e4b2d: cmp rdx, 7
0x1402e4b31: jne 0x1402e4c23
0x1402e4b37: mov edx, 0x74736f68
0x1402e4b3c: xor edx, dword ptr [rax]
0x1402e4b3e: mov r8d, 0x676e6974
0x1402e4b44: xor r8d, dword ptr [rax + 3]
0x1402e4b48: or r8d, edx
0x1402e4b4b: je 0x1402e4c1b
0x1402e4b51: mov edx, dword ptr [rax]
0x1402e4b53: bswap edx
0x1402e4b55: mov r8d, 0x6a6f696e
0x1402e4b5b: cmp edx, 0x6a6f696e
0x1402e4b61: jne 0x1402e4c08
0x1402e4b67: mov edx, dword ptr [rax + 3]
0x1402e4b6a: bswap edx
0x1402e4b6c: mov r8d, 0x6e696e67
0x1402e4b72: xor eax, eax
0x1402e4b74: cmp edx, 0x6e696e67
0x1402e4b7a: jne 0x1402e4c08
0x1402e4b80: jmp 0x1402e4c17
0x1402e4b85: mov rax, qword ptr [rbp + 0x248]
0x1402e4b8c: mov rdx, qword ptr [rax]
0x1402e4b8f: cmp rdx, -1
0x1402e4b93: je 0x1402e4bcf
0x1402e4b95: test rdx, rdx
0x1402e4b98: je 0x1402e4bb0
0x1402e4b9a: mov rcx, qword ptr [rax + 8]
0x1402e4b9e: mov r8d, 1
0x1402e4ba4: call 0x1400021d0
0x1402e4ba9: mov rax, qword ptr [rbp + 0x248]
0x1402e4bb0: mov rdx, qword ptr [rax + 0x28]
0x1402e4bb4: test rdx, rdx
0x1402e4bb7: je 0x1402e4bcf
0x1402e4bb9: mov rcx, qword ptr [rax + 0x30]
0x1402e4bbd: mov r8d, 1
0x1402e4bc3: call 0x1400021d0
0x1402e4bc8: mov rax, qword ptr [rbp + 0x248]
0x1402e4bcf: mov qword ptr [rax], 0xffffffffffffffff
0x1402e4bd6: jmp 0x1402e53f2
0x1402e4bdb: mov edx, dword ptr [rax]
0x1402e4bdd: bswap edx
0x1402e4bdf: mov r8d, 0x6a6f696e
0x1402e4be5: cmp edx, 0x6a6f696e
0x1402e4beb: jne 0x1402e4c08
0x1402e4bed: movzx eax, word ptr [rax + 4]
0x1402e4bf1: rol ax, 8
0x1402e4bf5: movzx edx, ax
0x1402e4bf8: mov r8d, 0x6564
0x1402e4bfe: xor eax, eax
0x1402e4c00: cmp edx, 0x6564
0x1402e4c06: je 0x1402e4c17
0x1402e4c08: xor eax, eax
0x1402e4c0a: cmp edx, r8d
0x1402e4c0d: setae al
0x1402e4c10: lea eax, [rax*2 - 1]
0x1402e4c17: test eax, eax
0x1402e4c19: jne 0x1402e4c23
0x1402e4c1b: movss xmm0, dword ptr [rip + 0x5f92bc1]
0x1402e4c23: mov rdx, qword ptr [rbp + 0x1a8]
0x1402e4c2a: movss xmm1, dword ptr [rdx]
0x1402e4c2e: ucomiss xmm1, xmm0
0x1402e4c31: jne 0x1402e4c45
0x1402e4c33: jp 0x1402e4c45
0x1402e4c35: movss xmm1, dword ptr [rdx + 4]
0x1402e4c3a: ucomiss xmm1, dword ptr [rip + 0x5f92ba7]
0x1402e4c41: jne 0x1402e4c45
0x1402e4c43: jnp 0x1402e4c8c
0x1402e4c45: mov eax, dword ptr [rbp + 0x14c]
0x1402e4c4b: mov r8, qword ptr [rbp + 0x188]
0x1402e4c52: mov dword ptr [r8], eax
0x1402e4c55: movss dword ptr [rdx], xmm0
0x1402e4c59: mov dword ptr [rdx + 4], 0x442a0000
0x1402e4c60: mov dword ptr [rcx + 0x88], 1
0x1402e4c6a: movss dword ptr [rcx + 0x8c], xmm0
0x1402e4c72: mov rdx, qword ptr [rbp + 0x170]
0x1402e4c79: mov dword ptr [rdx], eax
0x1402e4c7b: movabs rax, 0x442a000000000001
0x1402e4c85: mov qword ptr [rcx + 0x90], rax
0x1402e4c8c: mov qword ptr [rbp + 0x198], r9
0x1402e4c93: mov rbx, qword ptr [r9 + 0x1a8]
0x1402e4c9a: mov rsi, qword ptr [rbp + 8]
0x1402e4c9e: movzx eax, byte ptr [rsi + 0x30]
0x1402e4ca2: mov byte ptr [rbp + 0x1a8], al
0x1402e4ca8: lea rdx, [rsi + 0x18]
0x1402e4cac: lea rcx, [rbp + 0xc8]
0x1402e4cb3: call 0x146034930
0x1402e4cb8: movzx eax, byte ptr [rsi + 0x38]
0x1402e4cbc: mov byte ptr [rbp + 0x188], al
0x1402e4cc2: lea rcx, [rbp + 0x118]
0x1402e4cc9: mov rdx, rsi
0x1402e4ccc: call 0x146034930
0x1402e4cd1: nop 
0x1402e4cd2: mov rsi, qword ptr [rbp + 0xc8]
0x1402e4cd9: mov r14, qword ptr [rbp + 0xd0]
0x1402e4ce0: mov r12, qword ptr [rbp + 0xd8]
0x1402e4ce7: mov rax, qword ptr [rbp + 0x118]
0x1402e4cee: mov qword ptr [rbp + 0x160], rax
0x1402e4cf5: mov rax, qword ptr [rbp + 0x120]
0x1402e4cfc: mov qword ptr [rbp + 0x170], rax
0x1402e4d03: mov r15, qword ptr [rbp + 0x128]
0x1402e4d0a: mov r8, qword ptr [rbp + 0x248]
0x1402e4d11: mov r13, qword ptr [r8]
0x1402e4d14: cmp qword ptr [rbp + 0x180], 0
0x1402e4d1c: je 0x1402e4de6
0x1402e4d22: mov rax, qword ptr [rbp + 0x180]
0x1402e4d29: cmp qword ptr [rax + 0x10], 0
0x1402e4d2e: je 0x1402e4de6
0x1402e4d34: cmp r13, -1
0x1402e4d38: je 0x1402e4de6
0x1402e4d3e: cmp qword ptr [r8 + 0x18], rbx
0x1402e4d42: jne 0x1402e4dec
0x1402e4d48: movzx eax, byte ptr [rbp + 0x1a8]
0x1402e4d4f: cmp byte ptr [r8 + 0x20], al
0x1402e4d53: jne 0x1402e4dec
0x1402e4d59: cmp qword ptr [r8 + 0x10], r12
0x1402e4d5d: jne 0x1402e4dec
0x1402e4d63: mov rcx, qword ptr [r8 + 8]
0x1402e4d67: mov rdx, r14
0x1402e4d6a: mov r8, r12
0x1402e4d6d: call 0x146061721
0x1402e4d72: mov r8, qword ptr [rbp + 0x248]
0x1402e4d79: test eax, eax
0x1402e4d7b: jne 0x1402e4dec
0x1402e4d7d: movzx eax, byte ptr [rbp + 0x188]
0x1402e4d84: cmp byte ptr [r8 + 0x21], al
0x1402e4d88: jne 0x1402e4dec
0x1402e4d8a: cmp qword ptr [r8 + 0x38], r15
0x1402e4d8e: jne 0x1402e4dec
0x1402e4d90: mov rcx, qword ptr [r8 + 0x30]
0x1402e4d94: mov rdx, qword ptr [rbp + 0x170]
0x1402e4d9b: mov r8, r15
0x1402e4d9e: call 0x146061721
0x1402e4da3: mov r8, qword ptr [rbp + 0x248]
0x1402e4daa: test eax, eax
0x1402e4dac: jne 0x1402e4dec
0x1402e4dae: test rsi, rsi
0x1402e4db1: je 0x1402e4dc4
0x1402e4db3: mov r8d, 1
0x1402e4db9: mov rcx, r14
0x1402e4dbc: mov rdx, rsi
0x1402e4dbf: call 0x1400021d0
0x1402e4dc4: mov rdx, qword ptr [rbp + 0x160]
0x1402e4dcb: test rdx, rdx
0x1402e4dce: je 0x1402e53f2
0x1402e4dd4: mov r8d, 1
0x1402e4dda: mov rcx, qword ptr [rbp + 0x170]
0x1402e4de1: jmp 0x1402e53ec
0x1402e4de6: cmp r13, -1
0x1402e4dea: je 0x1402e4e29
0x1402e4dec: test r13, r13
0x1402e4def: je 0x1402e4e0a
0x1402e4df1: mov rcx, qword ptr [r8 + 8]
0x1402e4df5: mov r8d, 1
0x1402e4dfb: mov rdx, r13
0x1402e4dfe: call 0x1400021d0
0x1402e4e03: mov r8, qword ptr [rbp + 0x248]
0x1402e4e0a: mov rdx, qword ptr [r8 + 0x28]
0x1402e4e0e: test rdx, rdx
0x1402e4e11: je 0x1402e4e29
0x1402e4e13: mov rcx, qword ptr [r8 + 0x30]
0x1402e4e17: mov r8d, 1
0x1402e4e1d: call 0x1400021d0
0x1402e4e22: mov r8, qword ptr [rbp + 0x248]
0x1402e4e29: mov eax, edi
0x1402e4e2b: mov rcx, qword ptr [rbp + 0x190]
0x1402e4e32: shl rcx, 0x20
0x1402e4e36: or rcx, rax
0x1402e4e39: mov qword ptr [rbp + 0x190], rcx
0x1402e4e40: mov qword ptr [r8], rsi
0x1402e4e43: mov qword ptr [r8 + 8], r14
0x1402e4e47: mov qword ptr [r8 + 0x10], r12
0x1402e4e4b: lea r14, [rbp + 8]
0x1402e4e4f: mov qword ptr [r8 + 0x18], rbx
0x1402e4e53: movzx eax, byte ptr [rbp + 0x1a8]
0x1402e4e5a: mov byte ptr [r8 + 0x20], al
0x1402e4e5e: movzx eax, byte ptr [rbp + 0x188]
0x1402e4e65: mov byte ptr [r8 + 0x21], al
0x1402e4e69: mov rax, qword ptr [rbp + 0x160]
0x1402e4e70: mov qword ptr [r8 + 0x28], rax
0x1402e4e74: mov rax, qword ptr [rbp + 0x170]
0x1402e4e7b: mov qword ptr [r8 + 0x30], rax
0x1402e4e7f: mov qword ptr [r8 + 0x38], r15
0x1402e4e83: mov rax, qword ptr [rbp + 0x60]
0x1402e4e87: mov rcx, qword ptr [rbp + 0x68]
0x1402e4e8b: mov rdx, qword ptr [rax + 0xf8]
0x1402e4e92: mov r8, qword ptr [rax + 0x100]
0x1402e4e99: lea r8, [rdx + r8*4]
0x1402e4e9d: cmp byte ptr [rax + 0x108], 0
0x1402e4ea4: je 0x1402e505c
0x1402e4eaa: mov esi, 8
0x1402e4eaf: xor edi, edi
0x1402e4eb1: xor r13d, r13d
0x1402e4eb4: xor r11d, r11d
0x1402e4eb7: cmp r13d, r11d
0x1402e4eba: jne 0x1402e4f22
0x1402e4ebc: nop dword ptr [rax]
0x1402e4ec0: cmp rdx, r8
0x1402e4ec3: je 0x1402e5259
0x1402e4ec9: mov r11d, dword ptr [rdx]
0x1402e4ecc: add rdx, 4
0x1402e4ed0: mov r10, qword ptr [rcx + 0x1a8]
0x1402e4ed7: lea rsi, [r11 + r11*8]
0x1402e4edb: mov r11, qword ptr [r10 + rsi*8 + 0x10]
0x1402e4ee0: test r11, r11
0x1402e4ee3: je 0x1402e4ec0
0x1402e4ee5: lea r10, [r10 + rsi*8]
0x1402e4ee9: mov rsi, qword ptr [rax + 0x110]
0x1402e4ef0: cmp rsi, qword ptr [r10 + 0x40]
0x1402e4ef4: jae 0x1402e4f19
0x1402e4ef6: mov rdi, qword ptr [r10 + 0x38]
0x1402e4efa: mov rsi, qword ptr [rdi + rsi*8]
0x1402e4efe: test rsi, rsi
0x1402e4f01: je 0x1402e4f19
0x1402e4f03: mov rdi, qword ptr [r10 + 0x18]
0x1402e4f07: not rsi
0x1402e4f0a: lea rsi, [rsi + rsi*2]
0x1402e4f0e: shl rsi, 4
0x1402e4f12: mov rdi, qword ptr [rdi + rsi + 0x10]
0x1402e4f17: jmp 0x1402e4f1b
0x1402e4f19: xor edi, edi
0x1402e4f1b: mov rsi, qword ptr [r10 + 8]
0x1402e4f1f: xor r13d, r13d
0x1402e4f22: mov r15d, r13d
0x1402e4f25: inc r13d
0x1402e4f28: mov r10, qword ptr [rsi + r15*8]
0x1402e4f2c: mov rbx, r10
0x1402e4f2f: shr rbx, 0x20
0x1402e4f33: test r10d, r10d
0x1402e4f36: cmovne r9d, ebx
0x1402e4f3a: je 0x1402e4eb7
0x1402e4f40: je 0x1402e4eb7
0x1402e4f46: mov rbx, qword ptr [rbp + 0x198]
0x1402e4f4d: cmp qword ptr [rbx + 0x50], 0
0x1402e4f52: je 0x1402e4eb7
0x1402e4f58: mov rbx, qword ptr [rbp + 0x198]
0x1402e4f5f: mov r12, qword ptr [rbx + 0x18]
0x1402e4f63: mov rbx, qword ptr [rbx + 0x20]
0x1402e4f67: cmp rbx, 7
0x1402e4f6b: je 0x1402e4fb3
0x1402e4f6d: cmp rbx, 6
0x1402e4f71: je 0x1402e4f90
0x1402e4f73: cmp rbx, 4
0x1402e4f77: jne 0x1402e4eb7
0x1402e4f7d: cmp dword ptr [r12], 0x7466656c
0x1402e4f85: jne 0x1402e4eb7
0x1402e4f8b: jmp 0x1402e501b
0x1402e4f90: mov ebx, dword ptr [r12]
0x1402e4f94: mov dword ptr [rbp + 0x1a8], ebx
0x1402e4f9a: mov ebx, 0x6e696f6a
0x1402e4f9f: xor dword ptr [rbp + 0x1a8], ebx
0x1402e4fa5: movzx ebx, word ptr [r12 + 4]
0x1402e4fab: xor ebx, 0x6465
0x1402e4fb1: jmp 0x1402e500f
0x1402e4fb3: mov ebx, dword ptr [r12]
0x1402e4fb7: mov dword ptr [rbp + 0x1a8], ebx
0x1402e4fbd: mov ebx, 0x74736f68
0x1402e4fc2: xor dword ptr [rbp + 0x1a8], ebx
0x1402e4fc8: mov ebx, dword ptr [r12 + 3]
0x1402e4fcd: mov qword ptr [rbp + 0x188], r12
0x1402e4fd4: mov r12d, 0x676e6974
0x1402e4fda: xor ebx, r12d
0x1402e4fdd: mov r12, qword ptr [rbp + 0x188]
0x1402e4fe4: or ebx, dword ptr [rbp + 0x1a8]
0x1402e4fea: je 0x1402e501b
0x1402e4fec: mov ebx, dword ptr [r12]
0x1402e4ff0: mov dword ptr [rbp + 0x1a8], ebx
0x1402e4ff6: mov ebx, 0x6e696f6a
0x1402e4ffb: xor dword ptr [rbp + 0x1a8], ebx
0x1402e5001: mov ebx, dword ptr [r12 + 3]
0x1402e5006: mov r12d, 0x676e696e
0x1402e500c: xor ebx, r12d
0x1402e500f: or ebx, dword ptr [rbp + 0x1a8]
0x1402e5015: jne 0x1402e4eb7
0x1402e501b: mov rbx, qword ptr [rbp + 0x198]
0x1402e5022: cmp qword ptr [rbx + 0x158], 0
0x1402e502a: je 0x1402e4eb7
0x1402e5030: shl r15, 4
0x1402e5034: mov rbx, rdi
0x1402e5037: add rbx, r15
0x1402e503a: mov rbx, qword ptr [rbx]
0x1402e503d: mov r15, r14
0x1402e5040: mov r14, qword ptr [rbp + 0x198]
0x1402e5047: cmp rbx, qword ptr [r14 + 0x198]
0x1402e504e: mov r14, r15
0x1402e5051: jne 0x1402e4eb7
0x1402e5057: jmp 0x1402e5246
0x1402e505c: mov r11d, 8
0x1402e5062: xor r15d, r15d
0x1402e5065: xor edi, edi
0x1402e5067: xor r13d, r13d
0x1402e506a: jmp 0x1402e507a
0x1402e506c: xor r10d, r10d
0x1402e506f: inc edi
0x1402e5071: test r10d, r10d
0x1402e5074: jne 0x1402e5140
0x1402e507a: cmp edi, r13d
0x1402e507d: jne 0x1402e510c
0x1402e5083: nop word ptr cs:[rax + rax]
0x1402e5090: cmp rdx, r8
0x1402e5093: je 0x1402e5259
0x1402e5099: mov r11d, dword ptr [rdx]
0x1402e509c: add rdx, 4
0x1402e50a0: mov r10, qword ptr [rcx + 0x108]
0x1402e50a7: lea r11, [r11 + r11*4]
0x1402e50ab: shl r11, 5
0x1402e50af: mov r13, qword ptr [r10 + r11 + 0x58]
0x1402e50b4: test r13, r13
0x1402e50b7: je 0x1402e5090
0x1402e50b9: add r10, r11
0x1402e50bc: mov r11d, dword ptr [r10 + 0x94]
0x1402e50c3: mov rdi, qword ptr [rcx + 0x1a8]
0x1402e50ca: lea rbx, [r11 + r11*8]
0x1402e50ce: mov r11, qword ptr [rax + 0x110]
0x1402e50d5: cmp r11, qword ptr [rdi + rbx*8 + 0x40]
0x1402e50da: jae 0x1402e5103
0x1402e50dc: lea rdi, [rdi + rbx*8]
0x1402e50e0: mov rbx, qword ptr [rdi + 0x38]
0x1402e50e4: mov r11, qword ptr [rbx + r11*8]
0x1402e50e8: test r11, r11
0x1402e50eb: je 0x1402e5103
0x1402e50ed: mov rdi, qword ptr [rdi + 0x18]
0x1402e50f1: not r11
0x1402e50f4: lea r11, [r11 + r11*2]
0x1402e50f8: shl r11, 4
0x1402e50fc: mov r15, qword ptr [rdi + r11 + 0x10]
0x1402e5101: jmp 0x1402e5106
0x1402e5103: xor r15d, r15d
0x1402e5106: mov r11, qword ptr [r10 + 0x50]
0x1402e510a: xor edi, edi
0x1402e510c: mov ebx, edi
0x1402e510e: shl rbx, 4
0x1402e5112: mov r10, qword ptr [r11 + rbx]
0x1402e5116: test r10d, r10d
0x1402e5119: je 0x1402e506c
0x1402e511f: add rbx, r11
0x1402e5122: mov esi, dword ptr [rbx + 8]
0x1402e5125: not esi
0x1402e5127: shl rsi, 4
0x1402e512b: add rsi, r15
0x1402e512e: mov r9, r10
0x1402e5131: shr r9, 0x20
0x1402e5135: inc edi
0x1402e5137: test r10d, r10d
0x1402e513a: je 0x1402e507a
0x1402e5140: mov rbx, qword ptr [rbp + 0x198]
0x1402e5147: cmp qword ptr [rbx + 0x50], 0
0x1402e514c: je 0x1402e507a
0x1402e5152: mov rbx, qword ptr [rbp + 0x198]
0x1402e5159: mov r12, qword ptr [rbx + 0x18]
0x1402e515d: mov rbx, qword ptr [rbx + 0x20]
0x1402e5161: cmp rbx, 4
0x1402e5165: je 0x1402e5208
0x1402e516b: cmp rbx, 6
0x1402e516f: je 0x1402e51d9
0x1402e5171: cmp rbx, 7
0x1402e5175: jne 0x1402e507a
0x1402e517b: mov ebx, dword ptr [r12]
0x1402e517f: mov dword ptr [rbp + 0x1a8], ebx
0x1402e5185: mov ebx, 0x74736f68
0x1402e518a: xor dword ptr [rbp + 0x1a8], ebx
0x1402e5190: mov ebx, dword ptr [r12 + 3]
0x1402e5195: mov qword ptr [rbp + 0x188], r12
0x1402e519c: mov r12d, 0x676e6974
0x1402e51a2: xor ebx, r12d
0x1402e51a5: mov r12, qword ptr [rbp + 0x188]
0x1402e51ac: or ebx, dword ptr [rbp + 0x1a8]
0x1402e51b2: je 0x1402e5216
0x1402e51b4: mov ebx, dword ptr [r12]
0x1402e51b8: mov dword ptr [rbp + 0x1a8], ebx
0x1402e51be: mov ebx, 0x6e696f6a
0x1402e51c3: xor dword ptr [rbp + 0x1a8], ebx
0x1402e51c9: mov ebx, dword ptr [r12 + 3]
0x1402e51ce: mov r12d, 0x676e696e
0x1402e51d4: xor ebx, r12d
0x1402e51d7: jmp 0x1402e51fa
0x1402e51d9: mov ebx, dword ptr [r12]
0x1402e51dd: mov dword ptr [rbp + 0x1a8], ebx
0x1402e51e3: mov ebx, 0x6e696f6a
0x1402e51e8: xor dword ptr [rbp + 0x1a8], ebx
0x1402e51ee: movzx ebx, word ptr [r12 + 4]
0x1402e51f4: xor ebx, 0x6465
0x1402e51fa: or ebx, dword ptr [rbp + 0x1a8]
0x1402e5200: jne 0x1402e507a
0x1402e5206: jmp 0x1402e5216
0x1402e5208: cmp dword ptr [r12], 0x7466656c
0x1402e5210: jne 0x1402e507a
0x1402e5216: mov rbx, qword ptr [rbp + 0x198]
0x1402e521d: cmp qword ptr [rbx + 0x158], 0
0x1402e5225: je 0x1402e507a
0x1402e522b: mov rbx, qword ptr [rsi]
0x1402e522e: mov r14, qword ptr [rbp + 0x198]
0x1402e5235: cmp rbx, qword ptr [r14 + 0x198]
0x1402e523c: lea r14, [rbp + 8]
0x1402e5240: jne 0x1402e507a
0x1402e5246: mov eax, r10d
0x1402e5249: shl r9, 0x20
0x1402e524d: or r9, rax
0x1402e5250: mov qword ptr [rbp + 0x110], r9
0x1402e5257: jmp 0x1402e5263
0x1402e5259: mov dword ptr [rbp + 0x110], 0
0x1402e5263: mov qword ptr [rbp + 0x118], 1
0x1402e526e: mov rax, qword ptr [rbp + 0x180]
0x1402e5275: mov qword ptr [rbp + 0x120], rax
0x1402e527c: mov qword ptr [rbp + 0x128], 0
0x1402e5287: mov qword ptr [rbp + 0x138], 0
0x1402e5292: lea rcx, [rbp + 0xf8]
0x1402e5299: lea rdx, [rbp + 0x118]
0x1402e52a0: call 0x1401005f0
0x1402e52a5: mov rax, qword ptr [rbp - 0x20]
0x1402e52a9: mov qword ptr [rbp + 0xf0], rax
0x1402e52b0: movaps xmm0, xmmword ptr [rbp - 0x30]
0x1402e52b4: movups xmmword ptr [rbp + 0xe0], xmm0
0x1402e52bb: mov r15, qword ptr [rbp - 0x40]
0x1402e52bf: mov r13, qword ptr [rbp - 0x38]
0x1402e52c3: mov rax, qword ptr [rbp + 0x190]
0x1402e52ca: mov qword ptr [rbp + 0xc8], rax
0x1402e52d1: mov qword ptr [rbp + 0xd0], r15
0x1402e52d8: mov qword ptr [rbp + 0xd8], r13
0x1402e52df: lea rax, [rbp - 0x60]
0x1402e52e3: mov qword ptr [rbp + 0x118], rax
0x1402e52ea: lea rax, [rbp - 0x18]
0x1402e52ee: mov qword ptr [rbp + 0x120], rax
0x1402e52f5: lea rax, [rbp + 0x28]
0x1402e52f9: mov qword ptr [rbp + 0x128], rax
0x1402e5300: lea rax, [rbp + 0x110]
0x1402e5307: mov qword ptr [rbp + 0x130], rax
0x1402e530e: mov qword ptr [rbp + 0x138], r14
0x1402e5315: lea rax, [rbp + 0x78]
0x1402e5319: mov qword ptr [rbp + 0x140], rax
0x1402e5320: mov byte ptr [rbp + 0x1a7], 1
0x1402e5327: lea rcx, [rbp + 0xc8]
0x1402e532e: lea rdx, [rbp + 0x118]
0x1402e5335: call 0x14033bd80
0x1402e533a: nop 
0x1402e533b: mov rax, qword ptr [rbp + 0xf8]
0x1402e5342: mov qword ptr [rbp + 0x180], rax
0x1402e5349: mov rax, qword ptr [rbp + 0x100]
0x1402e5350: mov qword ptr [rbp + 0x190], rax
0x1402e5357: mov rbx, qword ptr [rbp + 0x108]
0x1402e535e: test rbx, rbx
0x1402e5361: je 0x1402e53cf
0x1402e5363: lea r14, [rbp - 0x30]
0x1402e5367: shl rbx, 3
0x1402e536b: lea r12, [rbp + 0x130]
0x1402e5372: xor esi, esi
0x1402e5374: lea rdi, [rbp + 0x118]
0x1402e537b: nop dword ptr [rax + rax]
0x1402e5380: mov rax, qword ptr [rbp + 0x190]
0x1402e5387: mov rax, qword ptr [rax + rsi]
0x1402e538b: test eax, eax
0x1402e538d: je 0x1402e53cf
0x1402e538f: mov rcx, qword ptr [r14 + 0x10]
0x1402e5393: mov qword ptr [r12 + 0x10], rcx
0x1402e5398: movups xmm0, xmmword ptr [r14]
0x1402e539c: movups xmmword ptr [r12], xmm0
0x1402e53a1: mov qword ptr [rbp + 0x118], rax
0x1402e53a8: mov qword ptr [rbp + 0x120], r15
0x1402e53af: mov qword ptr [rbp + 0x128], r13
0x1402e53b6: mov rcx, rdi
0x1402e53b9: lea rdx, [rip + 0x5f93b90]
0x1402e53c0: call 0x1450b3990
0x1402e53c5: nop 
0x1402e53c6: add rsi, 8
0x1402e53ca: cmp rbx, rsi
0x1402e53cd: jne 0x1402e5380
0x1402e53cf: mov rdx, qword ptr [rbp + 0x180]
0x1402e53d6: test rdx, rdx
0x1402e53d9: je 0x1402e53f2
0x1402e53db: shl rdx, 3
0x1402e53df: mov r8d, 8
0x1402e53e5: mov rcx, qword ptr [rbp + 0x190]
0x1402e53ec: call 0x1400021d0
0x1402e53f1: nop 
0x1402e53f2: add rsp, 0x238
0x1402e53f9: pop rbx
0x1402e53fa: pop rdi
0x1402e53fb: pop rsi
0x1402e53fc: pop r12
0x1402e53fe: pop r13
0x1402e5400: pop r14
0x1402e5402: pop r15
0x1402e5404: pop rbp
0x1402e5405: ret 
0x1402e5406: mov eax, dword ptr [rax]
0x1402e5408: bswap eax
0x1402e540a: cmp eax, 0x6c656675
0x1402e540f: setae dl
0x1402e5412: cmp eax, 0x6c656674
0x1402e5417: sbb dl, 0
0x1402e541a: movsx eax, dl
0x1402e541d: test eax, eax
0x1402e541f: jne 0x1402e4c23
0x1402e5425: jmp 0x1402e4c1b
