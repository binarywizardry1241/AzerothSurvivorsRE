0x140063ff0: 55 push rbp
0x140063ff1: 56 push rsi
0x140063ff2: 4883ec78 sub rsp, 0x78
0x140063ff6: 488d6c2470 lea rbp, [rsp + 0x70]
0x140063ffb: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
0x140064003: 4889ce mov rsi, rcx
0x140064006: e8e53eb405 call 0x145ba7ef0
0x14006400b: 8945e0 mov dword ptr [rbp - 0x20], eax
0x14006400e: 8955e4 mov dword ptr [rbp - 0x1c], edx
0x140064011: 488d4db0 lea rcx, [rbp - 0x50]
0x140064015: 488d55e0 lea rdx, [rbp - 0x20]
0x140064019: 41b800803ed5 mov r8d, 0xd53e8000
0x14006401f: 41b9deb19d01 mov r9d, 0x19db1de
0x140064025: e8763eb405 call 0x145ba7ea0
0x14006402a: 807db000 cmp byte ptr [rbp - 0x50], 0
0x14006402e: 740c je 0x14006403c
0x140064030: 48b8127c4a7fb979379e movabs rax, 0x9e3779b97f4a7c12
0x14006403a: eb1b jmp 0x140064057
0x14006403c: 48694db800ca9a3b imul rcx, qword ptr [rbp - 0x48], 0x3b9aca00
0x140064044: 8b45c0 mov eax, dword ptr [rbp - 0x40]
0x140064047: 4801c1 add rcx, rax
0x14006404a: 48b8157c4a7fb979379e movabs rax, 0x9e3779b97f4a7c15
0x140064054: 4831c8 xor rax, rcx
0x140064057: 4889c1 mov rcx, rax
0x14006405a: 48c1e10d shl rcx, 0xd
0x14006405e: 4831c1 xor rcx, rax
0x140064061: 4889c8 mov rax, rcx
0x140064064: 48c1e807 shr rax, 7
0x140064068: 4831c8 xor rax, rcx
0x14006406b: 4889c1 mov rcx, rax
0x14006406e: 48c1e111 shl rcx, 0x11
0x140064072: 4831c1 xor rcx, rax
0x140064075: 49b8cdcccccccccccccc movabs r8, 0xcccccccccccccccd
0x14006407f: 4889c8 mov rax, rcx
0x140064082: 49f7e0 mul r8
0x140064085: c1ea02 shr edx, 2
0x140064088: 83e2fc and edx, 0xfffffffc
0x14006408b: 8d0492 lea eax, [rdx + rdx*4]
0x14006408e: 4889ca mov rdx, rcx
0x140064091: 48c1e20d shl rdx, 0xd
0x140064095: 4831ca xor rdx, rcx
0x140064098: 4189ca mov r10d, ecx
0x14006409b: 4129c2 sub r10d, eax
0x14006409e: 41c1e204 shl r10d, 4
0x1400640a2: 4989d1 mov r9, rdx
0x1400640a5: 49c1e907 shr r9, 7
0x1400640a9: 4931d1 xor r9, rdx
0x1400640ac: 4c89c8 mov rax, r9
0x1400640af: 48c1e011 shl rax, 0x11
0x1400640b3: 4c31c8 xor rax, r9
0x1400640b6: 4889c1 mov rcx, rax
0x1400640b9: 48c1e10d shl rcx, 0xd
0x1400640bd: 4831c1 xor rcx, rax
0x1400640c0: 4889c8 mov rax, rcx
0x1400640c3: 48c1e807 shr rax, 7
0x1400640c7: 4831c8 xor rax, rcx
0x1400640ca: 4889c1 mov rcx, rax
0x1400640cd: 48c1e111 shl rcx, 0x11
0x1400640d1: 4831c1 xor rcx, rax
0x1400640d4: 4889c8 mov rax, rcx
0x1400640d7: 49f7e0 mul r8
0x1400640da: 488d0517a9d605 lea rax, [rip + 0x5d6a917]
0x1400640e1: 4c01d0 add rax, r10
0x1400640e4: c1ea02 shr edx, 2
0x1400640e7: 83e2fe and edx, 0xfffffffe
0x1400640ea: 8d1492 lea edx, [rdx + rdx*4]
0x1400640ed: 29d1 sub ecx, edx
0x1400640ef: 4183e10f and r9d, 0xf
0x1400640f3: 41c1e104 shl r9d, 4
0x1400640f7: 488d1562aad605 lea rdx, [rip + 0x5d6aa62]
0x1400640fe: 4c01ca add rdx, r9
0x140064101: c1e104 shl ecx, 4
0x140064104: 4c8d0565abd605 lea r8, [rip + 0x5d6ab65]
0x14006410b: 4901c8 add r8, rcx
0x14006410e: 488945b0 mov qword ptr [rbp - 0x50], rax
0x140064112: 488d05a7dff9ff lea rax, [rip - 0x62059]
0x140064119: 488945b8 mov qword ptr [rbp - 0x48], rax
0x14006411d: 488955c0 mov qword ptr [rbp - 0x40], rdx
0x140064121: 488945c8 mov qword ptr [rbp - 0x38], rax
0x140064125: 4c8945d0 mov qword ptr [rbp - 0x30], r8
0x140064129: 488945d8 mov qword ptr [rbp - 0x28], rax
0x14006412d: 488d15dcabd605 lea rdx, [rip + 0x5d6abdc]
0x140064134: 488d4de0 lea rcx, [rbp - 0x20]
0x140064138: 4c8d45b0 lea r8, [rbp - 0x50]
0x14006413c: e8ef8cb605 call 0x145bcce30
0x140064141: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
0x140064145: 488b45f0 mov rax, qword ptr [rbp - 0x10]
0x140064149: 4801c8 add rax, rcx
0x14006414c: 48894df8 mov qword ptr [rbp - 8], rcx
0x140064150: 48894db0 mov qword ptr [rbp - 0x50], rcx
0x140064154: 488945b8 mov qword ptr [rbp - 0x48], rax
0x140064158: 48c745c00c000000 mov qword ptr [rbp - 0x40], 0xc
0x140064160: 488d55b0 lea rdx, [rbp - 0x50]
0x140064164: 4889f1 mov rcx, rsi
0x140064167: e834ed2100 call 0x140282ea0
0x14006416c: 90 nop
0x14006416d: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x140064171: 4885d2 test rdx, rdx
0x140064174: 7410 je 0x140064186
0x140064176: 41b801000000 mov r8d, 1
0x14006417c: 488b4df8 mov rcx, qword ptr [rbp - 8]
0x140064180: e84be0f9ff call 0x1400021d0
0x140064185: 90 nop
0x140064186: 4883c478 add rsp, 0x78
0x14006418a: 5e pop rsi
0x14006418b: 5d pop rbp
0x14006418c: c3 ret
