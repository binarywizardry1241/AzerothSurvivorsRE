;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1458edff0..0x1458ee116 SHA256 c3d2719dd2df0b6454d2045932e26c402b214f36ba7fa981eec111b9ef1362ed
0x1458edff0: push rsi
0x1458edff1: push rdi
0x1458edff2: sub rsp, 0x58
0x1458edff6: movapd xmmword ptr [rsp + 0x40], xmm6
0x1458edffc: mov rsi, rcx
0x1458edfff: movq rax, xmm1
0x1458ee004: movq qword ptr [rsp + 0x30], xmm1
0x1458ee00a: movabs rdi, 0x7fffffffffffffff
0x1458ee014: and rax, rdi
0x1458ee017: movabs rcx, 0x7ff0000000000000
0x1458ee021: cmp rax, rcx
0x1458ee024: jl 0x1458ee05e
0x1458ee026: call 0x140002200
0x1458ee02b: mov ecx, 1
0x1458ee030: mov edx, 1
0x1458ee035: call 0x1400021c0
0x1458ee03a: test rax, rax
0x1458ee03d: je 0x1458ee105
0x1458ee043: mov byte ptr [rax], 0x30
0x1458ee046: mov qword ptr [rsi], 1
0x1458ee04d: mov qword ptr [rsi + 8], rax
0x1458ee051: mov qword ptr [rsi + 0x10], 1
0x1458ee059: jmp 0x1458ee0f6
0x1458ee05e: movdqa xmm6, xmm1
0x1458ee062: movdqa xmm0, xmm1
0x1458ee066: call 0x145bfa159
0x1458ee06b: ucomisd xmm6, xmm0
0x1458ee06f: jne 0x1458ee0cc
0x1458ee071: jp 0x1458ee0cc
0x1458ee073: movapd xmm0, xmmword ptr [rip + 0x5b57e5]
0x1458ee07b: andpd xmm0, xmm6
0x1458ee07f: movsd xmm1, qword ptr [rip + 0x12a47b9]
0x1458ee087: ucomisd xmm1, xmm0
0x1458ee08b: jbe 0x1458ee0cc
0x1458ee08d: cvttsd2si rax, xmm6
0x1458ee092: ucomisd xmm6, qword ptr [rip + 0x4def06]
0x1458ee09a: cmova rax, rdi
0x1458ee09e: xor ecx, ecx
0x1458ee0a0: ucomisd xmm6, xmm6
0x1458ee0a4: cmovnp rcx, rax
0x1458ee0a8: mov qword ptr [rsp + 0x38], rcx
0x1458ee0ad: lea rax, [rsp + 0x38]
0x1458ee0b2: mov qword ptr [rsp + 0x20], rax
0x1458ee0b7: lea rax, [rip + 0x2f17e2]
0x1458ee0be: mov qword ptr [rsp + 0x28], rax
0x1458ee0c3: lea rdx, [rip + 0x1303996]
0x1458ee0ca: jmp 0x1458ee0e9
0x1458ee0cc: lea rax, [rsp + 0x30]
0x1458ee0d1: mov qword ptr [rsp + 0x20], rax
0x1458ee0d6: lea rax, [rip + 0x2f0393]
0x1458ee0dd: mov qword ptr [rsp + 0x28], rax
0x1458ee0e2: lea rdx, [rip + 0x15e2597]
0x1458ee0e9: lea r8, [rsp + 0x20]
0x1458ee0ee: mov rcx, rsi
0x1458ee0f1: call 0x145bcce30
0x1458ee0f6: mov rax, rsi
0x1458ee0f9: movaps xmm6, xmmword ptr [rsp + 0x40]
0x1458ee0fe: add rsp, 0x58
0x1458ee102: pop rdi
0x1458ee103: pop rsi
0x1458ee104: ret
0x1458ee105: mov ecx, 1
0x1458ee10a: mov edx, 1
0x1458ee10f: call 0x145d992bb
0x1458ee114: ud2
