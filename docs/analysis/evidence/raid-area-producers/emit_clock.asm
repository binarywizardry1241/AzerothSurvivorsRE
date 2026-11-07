14594be47: e8b4636bfa call 0x140002200
14594be4c: b901000000 mov ecx, 1
14594be51: ba01000000 mov edx, 1
14594be56: e865636bfa call 0x1400021c0
14594be5b: 4885c0 test rax, rax
14594be5e: 488b8d88020000 mov rcx, qword ptr [rbp + 0x288]
14594be65: 488b9590020000 mov rdx, qword ptr [rbp + 0x290]
14594be6c: 4c8b8578020000 mov r8, qword ptr [rbp + 0x278]
14594be73: 4c8b8d80020000 mov r9, qword ptr [rbp + 0x280]
14594be7a: 0f841c0f0000 je 0x14594cd9c
14594be80: c6007b mov byte ptr [rax], 0x7b
14594be83: 48c785e001000001000000 mov qword ptr [rbp + 0x1e0], 1
14594be8e: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14594be95: 48c785f001000001000000 mov qword ptr [rbp + 0x1f0], 1
14594bea0: c685f801000001 mov byte ptr [rbp + 0x1f8], 1
14594bea7: 4c898568020000 mov qword ptr [rbp + 0x268], r8
14594beae: 4c898d60020000 mov qword ptr [rbp + 0x260], r9
14594beb5: 48898d58020000 mov qword ptr [rbp + 0x258], rcx
14594bebc: 48899550020000 mov qword ptr [rbp + 0x250], rdx
14594bec3: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
14594beca: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
14594bed1: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
14594bed8: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14594bedf: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14594bee6: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14594beed: c685a102000000 mov byte ptr [rbp + 0x2a1], 0
14594bef4: c685a002000000 mov byte ptr [rbp + 0x2a0], 0
14594befb: c6859f02000000 mov byte ptr [rbp + 0x29f], 0
14594bf02: 488d05c1478a01 lea rax, [rip + 0x18a47c1]
14594bf09: 4889442420 mov qword ptr [rsp + 0x20], rax
14594bf0e: 48c744242803000000 mov qword ptr [rsp + 0x28], 3
14594bf17: 4c8d050c458a01 lea r8, [rip + 0x18a450c]
14594bf1e: 488d8d80010000 lea rcx, [rbp + 0x180]
14594bf25: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14594bf2c: 41b904000000 mov r9d, 4
14594bf32: e8798af9ff call 0x1458e49b0
14594bf37: 90 nop
14594bf38: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
14594bf40: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
14594bf47: 48898568020000 mov qword ptr [rbp + 0x268], rax
14594bf4e: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
14594bf55: 48898560020000 mov qword ptr [rbp + 0x260], rax
14594bf5c: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
14594bf63: 48898558020000 mov qword ptr [rbp + 0x258], rax
14594bf6a: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
14594bf71: 48898550020000 mov qword ptr [rbp + 0x250], rax
14594bf78: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
14594bf7f: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
14594bf86: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
14594bf8d: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14594bf94: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14594bf9b: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14594bfa2: c685a102000000 mov byte ptr [rbp + 0x2a1], 0
14594bfa9: c685a002000000 mov byte ptr [rbp + 0x2a0], 0
14594bfb0: c6859f02000000 mov byte ptr [rbp + 0x29f], 0
14594bfb7: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14594bfbd: 4c8d0505478a01 lea r8, [rip + 0x18a4705]
14594bfc4: 488d4d10 lea rcx, [rbp + 0x10]
14594bfc8: 488d9580010000 lea rdx, [rbp + 0x180]
14594bfcf: 41b901000000 mov r9d, 1
14594bfd5: e8463af9ff call 0x1458dfa20
14594bfda: 90 nop
14594bfdb: b001 mov al, 1
14594bfdd: 8985d8010000 mov dword ptr [rbp + 0x1d8], eax
14594bfe3: b001 mov al, 1
14594bfe5: 898528020000 mov dword ptr [rbp + 0x228], eax
14594bfeb: f645e801 test byte ptr [rbp - 0x18], 1
14594bfef: 488b9d48020000 mov rbx, qword ptr [rbp + 0x248]
14594bff6: 488b7548 mov rsi, qword ptr [rbp + 0x48]
14594bffa: 0f84d3000000 je 0x14594c0d3
