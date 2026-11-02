14084ff50: push      r15
14084ff52: push      r14
14084ff54: push      r12
14084ff56: push      rsi
14084ff57: push      rdi
14084ff58: push      rbp
14084ff59: push      rbx
14084ff5a: sub       rsp, 0x20
14084ff5e: mov       rdi, qword ptr [rsp + 0x80]
14084ff66: mov       r12, qword ptr [rdx]
14084ff69: mov       r14, qword ptr [r8]
14084ff6c: mov       r15, qword ptr [r8 + 0x10]
14084ff70: mov       ebp, dword ptr [r8 + 0x1c]
14084ff74: mov       rbx, qword ptr [r9]
14084ff77: mov       eax, dword ptr [rip + 0x77f428b]
14084ff7d: test      eax, eax
14084ff7f: jne       0x140850085
14084ff85: mov       cl, 1
14084ff87: xor       eax, eax
14084ff89: lock cmpxchg byte ptr [rip + 0x77f4247], cl
14084ff91: jne       0x1408500a3
14084ff97: mov       rsi, qword ptr [rip + 0x783aa4a]
14084ff9e: mov       rax, qword ptr [rsi]
14084ffa1: shl       rax, 1
14084ffa4: test      rax, rax
14084ffa7: jne       0x1408500b4
14084ffad: xor       eax, eax
14084ffaf: movzx     ecx, byte ptr [rip + 0x77f4223]
14084ffb6: cmp       byte ptr [r12], 1
14084ffbb: jne       0x1408500cd
14084ffc1: test      byte ptr [rip + 0x77f4214], 1
14084ffc8: je        0x1408500cd
14084ffce: mov       edx, dword ptr [rip + 0x77f4210]
14084ffd4: mov       ecx, dword ptr [rip + 0x77f4206]
14084ffda: mov       r8d, 1
14084ffe0: cmp       dword ptr [rdi], 1
14084ffe3: jne       0x1408500d5
14084ffe9: cmp       dword ptr [rdi + 4], ecx
14084ffec: jne       0x1408500d5
14084fff2: cmp       dword ptr [rdi + 8], edx
14084fff5: jne       0x1408500d5
14084fffb: mov       r8d, dword ptr [rdi + 0xc]
14084ffff: inc       r8d
140850002: mov       edx, 0xffffffff
140850007: cmovne    edx, r8d
14085000b: mov       dword ptr [rdi + 0xc], edx
14085000e: cmp       edx, 3
140850011: jb        0x1408500f7
140850017: test      r14, r14
14085001a: je        0x140850027
14085001c: cmp       dword ptr [r14], ecx
14085001f: je        0x140850027
140850021: mov       dword ptr [r15], ebp
140850024: mov       dword ptr [r14], ecx
140850027: mov       byte ptr [rip + 0x77f41d7], 1
14085002e: mov       cl, 1
140850030: cmp       byte ptr [rip + 0x77f41cf], 0
140850037: jne       0x140850100
14085003d: cmp       edx, 0x12
140850040: setb      cl
140850043: test      rbx, rbx
140850046: sete      dl
140850049: or        dl, cl
14085004b: jne       0x1408500fe
140850051: cmp       byte ptr [rbx + 0x3c], 1
140850055: jne       0x1408500fe
14085005b: cmp       byte ptr [rbx + 0x3d], 1
14085005f: jne       0x1408500fe
140850065: cmp       qword ptr [rbx + 0x10], 0
14085006a: jne       0x1408500fe
140850070: cmp       qword ptr [rbx + 0x18], 0
140850075: jne       0x1408500fe
14085007b: cmp       qword ptr [rbx + 0x28], 0
140850080: sete      cl
140850083: jmp       0x140850100
140850085: lea       rcx, [rip + 0x77f414c]
14085008c: call      0x145c273e2
140850091: mov       cl, 1
140850093: xor       eax, eax
140850095: lock cmpxchg byte ptr [rip + 0x77f413b], cl
14085009d: je        0x14084ff97
1408500a3: lea       rcx, [rip + 0x77f412e]
1408500aa: call      0x145d97960
1408500af: jmp       0x14084ff97
1408500b4: call      0x145d986f0
1408500b9: xor       al, 1
1408500bb: movzx     ecx, byte ptr [rip + 0x77f4117]
1408500c2: cmp       byte ptr [r12], 1
1408500c7: je        0x14084ffc1
1408500cd: cmp       byte ptr [rdi], 0
1408500d0: je        0x1408500e7
1408500d2: xor       r8d, r8d
1408500d5: mov       dword ptr [rdi], r8d
1408500d8: mov       dword ptr [rdi + 4], ecx
1408500db: mov       dword ptr [rdi + 8], edx
1408500de: mov       dword ptr [rdi + 0xc], 0
1408500e5: jmp       0x1408500f7
1408500e7: mov       ecx, dword ptr [rdi + 0xc]
1408500ea: inc       ecx
1408500ec: mov       edx, 0xffffffff
1408500f1: cmovne    edx, ecx
1408500f4: mov       dword ptr [rdi + 0xc], edx
1408500f7: mov       byte ptr [rip + 0x77f4107], 0
1408500fe: xor       ecx, ecx
140850100: mov       byte ptr [rip + 0x77f4100], cl
140850106: test      al, al
140850108: jne       0x140850115
14085010a: mov       rax, qword ptr [rsi]
14085010d: shl       rax, 1
140850110: test      rax, rax
140850113: jne       0x14085014a
140850115: xor       eax, eax
140850117: xchg      byte ptr [rip + 0x77f40bb], al
14085011d: cmp       al, 2
14085011f: je        0x140850130
140850121: add       rsp, 0x20
140850125: pop       rbx
140850126: pop       rbp
140850127: pop       rdi
140850128: pop       rsi
140850129: pop       r12
14085012b: pop       r14
14085012d: pop       r15
14085012f: ret
140850130: lea       rcx, [rip + 0x77f40a1]
140850137: add       rsp, 0x20
14085013b: pop       rbx
14085013c: pop       rbp
14085013d: pop       rdi
14085013e: pop       rsi
14085013f: pop       r12
140850141: pop       r14
140850143: pop       r15
140850145: jmp       0x145d97a20
14085014a: call      0x145d986f0
14085014f: test      al, al
140850151: jne       0x140850115
140850153: mov       byte ptr [rip + 0x77f407f], 1
14085015a: jmp       0x140850115
