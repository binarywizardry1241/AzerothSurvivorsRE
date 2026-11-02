1458f1080: 56 push rsi
1458f1081: 4883ec20 sub rsp, 0x20
1458f1085: 0f2ed1 ucomiss xmm2, xmm1
1458f1088: 0f8638010000 jbe 0x1458f11c6
1458f108e: 0f28da movaps xmm3, xmm2
1458f1091: f30f5cd9 subss xmm3, xmm1
1458f1095: 66410f7eda movd r10d, xmm3
1458f109a: 4489d0 mov eax, r10d
1458f109d: 25ffffff7f and eax, 0x7fffffff
1458f10a2: 3dffff7f7f cmp eax, 0x7f7fffff
1458f10a7: 0f8f33010000 jg 0x1458f11e0
1458f10ad: 4c8b01 mov r8, qword ptr [rcx]
1458f10b0: 488b4108 mov rax, qword ptr [rcx + 8]
1458f10b4: 4c8b4918 mov r9, qword ptr [rcx + 0x18]
1458f10b8: 488b5110 mov rdx, qword ptr [rcx + 0x10]
1458f10bc: 660f7ece movd esi, xmm1
1458f10c0: 81e6ffffff7f and esi, 0x7fffffff
1458f10c6: 66410f7ed3 movd r11d, xmm2
1458f10cb: 4181e3ffffff7f and r11d, 0x7fffffff
1458f10d2: 4181fb0000807f cmp r11d, 0x7f800000
1458f10d9: 410f9cc3 setl r11b
1458f10dd: 81feffff7f7f cmp esi, 0x7f7fffff
1458f10e3: 0f8f7e000000 jg 0x1458f1167
1458f10e9: 4584db test r11b, r11b
1458f10ec: 7479 je 0x1458f1167
1458f10ee: f30f101dcebf4d00 movss xmm3, dword ptr [rip + 0x4dbfce]
1458f10f6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458f1100: 4f8d1c08 lea r11, [r8 + r9]
1458f1104: 49c1c317 rol r11, 0x17
1458f1108: 4d01c3 add r11, r8
1458f110b: 4889c6 mov rsi, rax
1458f110e: 48c1e611 shl rsi, 0x11
1458f1112: 4c31c2 xor rdx, r8
1458f1115: 4931c1 xor r9, rax
1458f1118: 4831d0 xor rax, rdx
1458f111b: 4d31c8 xor r8, r9
1458f111e: 4831f2 xor rdx, rsi
1458f1121: 49c1c12d rol r9, 0x2d
1458f1125: 49c1eb29 shr r11, 0x29
1458f1129: 4181cb0000803f or r11d, 0x3f800000
1458f1130: 66410f6ee3 movd xmm4, r11d
1458f1135: f30f58e3 addss xmm4, xmm3
1458f1139: 66410f6ec2 movd xmm0, r10d
1458f113e: f30f59c4 mulss xmm0, xmm4
1458f1142: f30f58c1 addss xmm0, xmm1
1458f1146: 0f2ed0 ucomiss xmm2, xmm0
1458f1149: 7766 ja 0x1458f11b1
1458f114b: 4589d3 mov r11d, r10d
1458f114e: 4181e3ffffff7f and r11d, 0x7fffffff
1458f1155: 31f6 xor esi, esi
1458f1157: 4181fb0000807f cmp r11d, 0x7f800000
1458f115e: 400f9dc6 setge sil
1458f1162: 4129f2 sub r10d, esi
1458f1165: eb99 jmp 0x1458f1100
1458f1167: 4f8d1408 lea r10, [r8 + r9]
1458f116b: 49c1c217 rol r10, 0x17
1458f116f: 4d01c2 add r10, r8
1458f1172: 4989c3 mov r11, rax
1458f1175: 49c1e311 shl r11, 0x11
1458f1179: 4c31c2 xor rdx, r8
1458f117c: 4931c1 xor r9, rax
1458f117f: 4831d0 xor rax, rdx
1458f1182: 4d31c8 xor r8, r9
1458f1185: 4c31da xor rdx, r11
1458f1188: 49c1c12d rol r9, 0x2d
1458f118c: 49c1ea29 shr r10, 0x29
1458f1190: 4181ca0000803f or r10d, 0x3f800000
1458f1197: 66410f6ec2 movd xmm0, r10d
1458f119c: f30f580520bf4d00 addss xmm0, dword ptr [rip + 0x4dbf20]
1458f11a4: f30f59c3 mulss xmm0, xmm3
1458f11a8: f30f58c1 addss xmm0, xmm1
1458f11ac: 0f2ed0 ucomiss xmm2, xmm0
1458f11af: 76b6 jbe 0x1458f1167
1458f11b1: 4c8901 mov qword ptr [rcx], r8
1458f11b4: 4c894918 mov qword ptr [rcx + 0x18], r9
1458f11b8: 48894108 mov qword ptr [rcx + 8], rax
1458f11bc: 48895110 mov qword ptr [rcx + 0x10], rdx
1458f11c0: 4883c420 add rsp, 0x20
1458f11c4: 5e pop rsi
1458f11c5: c3 ret
1458f11c6: 488d0dd81d5e01 lea rcx, [rip + 0x15e1dd8]
1458f11cd: 4c8d054c1e5e01 lea r8, [rip + 0x15e1e4c]
1458f11d4: ba19000000 mov edx, 0x19
1458f11d9: e832864a00 call 0x145d99810
1458f11de: 0f0b ud2
1458f11e0: 488d0d911d5e01 lea rcx, [rip + 0x15e1d91]
1458f11e7: 4c8d05721d5e01 lea r8, [rip + 0x15e1d72]
1458f11ee: ba2d000000 mov edx, 0x2d
1458f11f3: e818864a00 call 0x145d99810
1458f11f8: 0f0b ud2
