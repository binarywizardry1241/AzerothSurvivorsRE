; Azeroth Survivors 0.113.2, SHA-256 58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb
; Exact PE exception-directory function [0x145c30ed0,0x145c31e46); 3958 bytes
; Slice SHA-256 1b975d1a9cd321fc62c3be28bd738baef36a68736b5d68dd430d51465fcbcfcc
; Static disassembly; REA/Ghidra Evidence ev_e00d6bf1c877653be7c7a4d90742e2a588bc4b8a9a97e64250de0cfc4a6395cc
; Imported raw function slice; external data and callees are outside the import.
145c30ed0: 55 push rbp
145c30ed1: 4157 push r15
145c30ed3: 4156 push r14
145c30ed5: 4155 push r13
145c30ed7: 4154 push r12
145c30ed9: 56 push rsi
145c30eda: 57 push rdi
145c30edb: 53 push rbx
145c30edc: 4881ec48010000 sub rsp, 0x148
145c30ee3: 488dac2480000000 lea rbp, [rsp + 0x80]
145c30eeb: 48c785c0000000feffffff mov qword ptr [rbp + 0xc0], 0xfffffffffffffffe
145c30ef6: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
145c30efd: 4c8985b0000000 mov qword ptr [rbp + 0xb0], r8
145c30f04: 4983f811 cmp r8, 0x11
145c30f08: 0f86c60c0000 jbe 0x145c31bd4
145c30f0e: 4989d4 mov r12, rdx
145c30f11: 0fb602 movzx eax, byte ptr [rdx]
145c30f14: 440fb64201 movzx r8d, byte ptr [rdx + 1]
145c30f19: 0fb67202 movzx esi, byte ptr [rdx + 2]
145c30f1d: 4088b5bd000000 mov byte ptr [rbp + 0xbd], sil
145c30f24: 0fb74a03 movzx ecx, word ptr [rdx + 3]
145c30f28: 48894de8 mov qword ptr [rbp - 0x18], rcx
145c30f2c: 0fb74a05 movzx ecx, word ptr [rdx + 5]
145c30f30: 0fb65207 movzx edx, byte ptr [rdx + 7]
145c30f34: 8895be000000 mov byte ptr [rbp + 0xbe], dl
145c30f3a: 0fb6d2 movzx edx, dl
145c30f3d: 488955e0 mov qword ptr [rbp - 0x20], rdx
145c30f41: 450fb674240c movzx r14d, byte ptr [r12 + 0xc]
145c30f47: 410fb65c240d movzx ebx, byte ptr [r12 + 0xd]
145c30f4d: c1e308 shl ebx, 8
145c30f50: 468d1c33 lea r11d, [rbx + r14]
145c30f54: 44895d1c mov dword ptr [rbp + 0x1c], r11d
145c30f58: 450fb654240e movzx r10d, byte ptr [r12 + 0xe]
145c30f5e: 450fb64c240f movzx r9d, byte ptr [r12 + 0xf]
145c30f64: 41c1e108 shl r9d, 8
145c30f68: 4c894d60 mov qword ptr [rbp + 0x60], r9
145c30f6c: 4c8955f0 mov qword ptr [rbp - 0x10], r10
145c30f70: 438d3c11 lea edi, [r9 + r10]
145c30f74: 897d18 mov dword ptr [rbp + 0x18], edi
145c30f77: 450fb64c2410 movzx r9d, byte ptr [r12 + 0x10]
145c30f7d: 44888d9f000000 mov byte ptr [rbp + 0x9f], r9b
145c30f84: 83fe0b cmp esi, 0xb
145c30f87: 0f87890c0000 ja 0x145c31c16
145c30f8d: 41ba0e0e0000 mov r10d, 0xe0e
145c30f93: 410fa3f2 bt r10d, esi
145c30f97: 0f83790c0000 jae 0x145c31c16
145c30f9d: 450fb6542411 movzx r10d, byte ptr [r12 + 0x11]
145c30fa3: 448895bf000000 mov byte ptr [rbp + 0xbf], r10b
145c30faa: 448d56ff lea r10d, [rsi - 1]
145c30fae: 44895568 mov dword ptr [rbp + 0x68], r10d
145c30fb2: 4189f2 mov r10d, esi
145c30fb5: 4183ca08 or r10d, 8
145c30fb9: 4183fa0b cmp r10d, 0xb
145c30fbd: 48899da8000000 mov qword ptr [rbp + 0xa8], rbx
145c30fc4: 4c897550 mov qword ptr [rbp + 0x50], r14
145c30fc8: 753e jne 0x145c31008
145c30fca: 4180f908 cmp r9b, 8
145c30fce: 8b5d68 mov ebx, dword ptr [rbp + 0x68]
145c30fd1: 0f85c60b0000 jne 0x145c31b9d
145c30fd7: f6c3f7 test bl, 0xf7
145c30fda: 410f94c1 sete r9b
145c30fde: 4180f801 cmp r8b, 1
145c30fe2: 410f95c0 setne r8b
145c30fe6: 4584c8 test r8b, r9b
145c30fe9: 0f85840c0000 jne 0x145c31c73
145c30fef: 41be01000000 mov r14d, 1
145c30ff5: f6c3f7 test bl, 0xf7
145c30ff8: 0f858a000000 jne 0x145c31088
145c30ffe: 83fa20 cmp edx, 0x20
145c31001: 7668 jbe 0x145c3106b
145c31003: e91d0d0000 jmp 0x145c31d25
145c31008: 450fb6c9 movzx r9d, r9b
145c3100c: 4183f908 cmp r9d, 8
145c31010: 7437 je 0x145c31049
145c31012: 4183f918 cmp r9d, 0x18
145c31016: 7415 je 0x145c3102d
145c31018: 4183f920 cmp r9d, 0x20
145c3101c: 8b5d68 mov ebx, dword ptr [rbp + 0x68]
145c3101f: 0f85780b0000 jne 0x145c31b9d
145c31025: 41be04000000 mov r14d, 4
145c3102b: eb09 jmp 0x145c31036
145c3102d: 41be03000000 mov r14d, 3
145c31033: 8b5d68 mov ebx, dword ptr [rbp + 0x68]
145c31036: f6c3f7 test bl, 0xf7
145c31039: 0f845e0b0000 je 0x145c31b9d
145c3103f: 4180f801 cmp r8b, 1
145c31043: 410f95c0 setne r8b
145c31047: eb3f jmp 0x145c31088
145c31049: 8b5d68 mov ebx, dword ptr [rbp + 0x68]
145c3104c: f6c3f7 test bl, 0xf7
145c3104f: 0f85480b0000 jne 0x145c31b9d
145c31055: 4180f801 cmp r8b, 1
145c31059: 0f85140c0000 jne 0x145c31c73
145c3105f: 4531c0 xor r8d, r8d
145c31062: 83fa20 cmp edx, 0x20
145c31065: 0f87ba0c0000 ja 0x145c31d25
145c3106b: 41be01000000 mov r14d, 1
145c31071: 4189d1 mov r9d, edx
145c31074: 49ba0080010101000000 movabs r10, 0x101018000
145c3107e: 4d0fa3ca bt r10, r9
145c31082: 0f839d0c0000 jae 0x145c31d25
145c31088: 458d8bffdfffff lea r9d, [r11 - 0x2001]
145c3108f: 4181f900e0ffff cmp r9d, 0xffffe000
145c31096: 0f82d00a0000 jb 0x145c31b6c
145c3109c: 448d8fffdfffff lea r9d, [rdi - 0x2001]
145c310a3: 4181f900e0ffff cmp r9d, 0xffffe000
145c310aa: 0f82bc0a0000 jb 0x145c31b6c
145c310b0: 83c207 add edx, 7
145c310b3: c1ea03 shr edx, 3
145c310b6: 48895538 mov qword ptr [rbp + 0x38], rdx
145c310ba: 480fafca imul rcx, rdx
145c310be: 4531c9 xor r9d, r9d
145c310c1: 4584c0 test r8b, r8b
145c310c4: ba00000000 mov edx, 0
145c310c9: 48895528 mov qword ptr [rbp + 0x28], rdx
145c310cd: 490f45c9 cmovne rcx, r9
145c310d1: 4c8d3c01 lea r15, [rcx + rax]
145c310d5: 4983c712 add r15, 0x12
145c310d9: ba01000000 mov edx, 1
145c310de: 48895540 mov qword ptr [rbp + 0x40], rdx
145c310e2: f6c3f7 test bl, 0xf7
145c310e5: 751c jne 0x145c31103
145c310e7: 4c39bdb0000000 cmp qword ptr [rbp + 0xb0], r15
145c310ee: 0f826c0b0000 jb 0x145c31c60
145c310f4: 4883c012 add rax, 0x12
145c310f8: 4c01e0 add rax, r12
145c310fb: 48894d28 mov qword ptr [rbp + 0x28], rcx
145c310ff: 48894540 mov qword ptr [rbp + 0x40], rax
145c31103: 4c29bdb0000000 sub qword ptr [rbp + 0xb0], r15
145c3110a: 0f82260b0000 jb 0x145c31c36
145c31110: 4c895d00 mov qword ptr [rbp], r11
145c31114: 4489d9 mov ecx, r11d
145c31117: 48897df8 mov qword ptr [rbp - 8], rdi
145c3111b: 89f8 mov eax, edi
145c3111d: 48894548 mov qword ptr [rbp + 0x48], rax
145c31121: 48894d30 mov qword ptr [rbp + 0x30], rcx
145c31125: 480fafc1 imul rax, rcx
145c31129: 4c89f3 mov rbx, r14
145c3112c: 48894520 mov qword ptr [rbp + 0x20], rax
145c31130: 480fafd8 imul rbx, rax
145c31134: e8c7103dfa call 0x140002200
145c31139: ba01000000 mov edx, 1
145c3113e: 4889d9 mov rcx, rbx
145c31141: e87a103dfa call 0x1400021c0
145c31146: 4885c0 test rax, rax
145c31149: 0f84d80c0000 je 0x145c31e27
145c3114f: 4889c7 mov rdi, rax
145c31152: 8d46fc lea eax, [rsi - 4]
145c31155: 4d01fc add r12, r15
145c31158: 48895d70 mov qword ptr [rbp + 0x70], rbx
145c3115c: 48897d78 mov qword ptr [rbp + 0x78], rdi
145c31160: 48c7858000000000000000 mov qword ptr [rbp + 0x80], 0
145c3116b: 3cfc cmp al, 0xfc
145c3116d: 0f876a010000 ja 0x145c312dd
145c31173: 4c89a590000000 mov qword ptr [rbp + 0x90], r12
145c3117a: 31f6 xor esi, esi
145c3117c: 4531ff xor r15d, r15d
145c3117f: 4839de cmp rsi, rbx
145c31182: 7215 jb 0x145c31199
145c31184: 4839f3 cmp rbx, rsi
145c31187: 480f43de cmovae rbx, rsi
145c3118b: e968010000 jmp 0x145c312f8
145c31190: 4c8b7d58 mov r15, qword ptr [rbp + 0x58]
145c31194: 4839de cmp rsi, rbx
145c31197: 73eb jae 0x145c31184
145c31199: 4c3bbdb0000000 cmp r15, qword ptr [rbp + 0xb0]
145c311a0: 0f8347090000 jae 0x145c31aed
145c311a6: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145c311ad: 460fb62c39 movzx r13d, byte ptr [rcx + r15]
145c311b2: 4489e8 mov eax, r13d
145c311b5: 49ffc7 inc r15
145c311b8: 4183e57f and r13d, 0x7f
145c311bc: 49ffc5 inc r13
145c311bf: 84c0 test al, al
145c311c1: 785d js 0x145c31220
145c311c3: 4d0fafee imul r13, r14
145c311c7: 4f8d242f lea r12, [r15 + r13]
145c311cb: 4c3ba5b0000000 cmp r12, qword ptr [rbp + 0xb0]
145c311d2: 0f874a090000 ja 0x145c31b22
145c311d8: 488b4570 mov rax, qword ptr [rbp + 0x70]
145c311dc: 4829f0 sub rax, rsi
145c311df: 4939c5 cmp r13, rax
145c311e2: 0f87c6000000 ja 0x145c312ae
145c311e8: 4c03bd90000000 add r15, qword ptr [rbp + 0x90]
145c311ef: 488d0c37 lea rcx, [rdi + rsi]
145c311f3: 4c89fa mov rdx, r15
145c311f6: 4d89e8 mov r8, r13
145c311f9: e88d870c00 call 0x145cf998b
145c311fe: 4c01ee add rsi, r13
145c31201: 4889b580000000 mov qword ptr [rbp + 0x80], rsi
145c31208: 4d89e7 mov r15, r12
145c3120b: 4839de cmp rsi, rbx
145c3120e: 7289 jb 0x145c31199
145c31210: e96fffffff jmp 0x145c31184
145c31215: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c31220: 4b8d0437 lea rax, [r15 + r14]
145c31224: 483b85b0000000 cmp rax, qword ptr [rbp + 0xb0]
145c3122b: 0f8705090000 ja 0x145c31b36
145c31231: 48894558 mov qword ptr [rbp + 0x58], rax
145c31235: 4901cf add r15, rcx
145c31238: 4531e4 xor r12d, r12d
145c3123b: 4d39ec cmp r12, r13
145c3123e: 0f834cffffff jae 0x145c31190
145c31244: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c31250: 488b4570 mov rax, qword ptr [rbp + 0x70]
145c31254: 4829f0 sub rax, rsi
145c31257: 4939c6 cmp r14, rax
145c3125a: 7726 ja 0x145c31282
145c3125c: 49ffc4 inc r12
145c3125f: 488d0c37 lea rcx, [rdi + rsi]
145c31263: 4c89fa mov rdx, r15
145c31266: 4d89f0 mov r8, r14
145c31269: e81d870c00 call 0x145cf998b
145c3126e: 4c01f6 add rsi, r14
145c31271: 4889b580000000 mov qword ptr [rbp + 0x80], rsi
145c31278: 4d39ec cmp r12, r13
145c3127b: 72d3 jb 0x145c31250
145c3127d: e90effffff jmp 0x145c31190
145c31282: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145c3128b: 41b901000000 mov r9d, 1
145c31291: 488d4d70 lea rcx, [rbp + 0x70]
145c31295: 4889f2 mov rdx, rsi
145c31298: 4d89f0 mov r8, r14
145c3129b: e8008b0c00 call 0x145cf9da0
145c312a0: 90 nop
145c312a1: 488b7d78 mov rdi, qword ptr [rbp + 0x78]
145c312a5: 488bb580000000 mov rsi, qword ptr [rbp + 0x80]
145c312ac: ebae jmp 0x145c3125c
145c312ae: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145c312b7: 41b901000000 mov r9d, 1
145c312bd: 488d4d70 lea rcx, [rbp + 0x70]
145c312c1: 4889f2 mov rdx, rsi
145c312c4: 4d89e8 mov r8, r13
145c312c7: e8d48a0c00 call 0x145cf9da0
145c312cc: 90 nop
145c312cd: 488b7d78 mov rdi, qword ptr [rbp + 0x78]
145c312d1: 488bb580000000 mov rsi, qword ptr [rbp + 0x80]
145c312d8: e90bffffff jmp 0x145c311e8
145c312dd: 483b9db0000000 cmp rbx, qword ptr [rbp + 0xb0]
145c312e4: 0f875f090000 ja 0x145c31c49
145c312ea: 4889f9 mov rcx, rdi
145c312ed: 4c89e2 mov rdx, r12
145c312f0: 4989d8 mov r8, rbx
145c312f3: e893860c00 call 0x145cf998b
145c312f8: 48899d80000000 mov qword ptr [rbp + 0x80], rbx
145c312ff: 488b4520 mov rax, qword ptr [rbp + 0x20]
145c31303: 4c8d248500000000 lea r12, [rax*4]
145c3130b: 4885c0 test rax, rax
145c3130e: 488b7538 mov rsi, qword ptr [rbp + 0x38]
145c31312: 742d je 0x145c31341
145c31314: e8e70e3dfa call 0x140002200
145c31319: ba01000000 mov edx, 1
145c3131e: 4c89e1 mov rcx, r12
145c31321: e8ca0e3dfa call 0x1400021f0
145c31326: 48898590000000 mov qword ptr [rbp + 0x90], rax
145c3132d: 4885c0 test rax, rax
145c31330: 0f84000b0000 je 0x145c31e36
145c31336: 837df800 cmp dword ptr [rbp - 8], 0
145c3133a: 751b jne 0x145c31357
145c3133c: e92e070000 jmp 0x145c31a6f
145c31341: b801000000 mov eax, 1
145c31346: 48898590000000 mov qword ptr [rbp + 0x90], rax
145c3134d: 837df800 cmp dword ptr [rbp - 8], 0
145c31351: 0f8418070000 je 0x145c31a6f
145c31357: 837d0000 cmp dword ptr [rbp], 0
145c3135b: 0f840e070000 je 0x145c31a6f
145c31361: 488b4560 mov rax, qword ptr [rbp + 0x60]
145c31365: 0b45f0 or eax, dword ptr [rbp - 0x10]
145c31368: 48894560 mov qword ptr [rbp + 0x60], rax
145c3136c: f64568f7 test byte ptr [rbp + 0x68], 0xf7
145c31370: 4c89a5b0000000 mov qword ptr [rbp + 0xb0], r12
145c31377: 0f8400010000 je 0x145c3147d
145c3137d: 4183fe01 cmp r14d, 1
145c31381: 0f8446030000 je 0x145c316cd
145c31387: 4183fe03 cmp r14d, 3
145c3138b: 0f85ed030000 jne 0x145c3177e
145c31391: f685bf00000010 test byte ptr [rbp + 0xbf], 0x10
145c31398: 0f853f050000 jne 0x145c318dd
145c3139e: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
145c313a5: 034d50 add ecx, dword ptr [rbp + 0x50]
145c313a8: 89c8 mov eax, ecx
145c313aa: c1e002 shl eax, 2
145c313ad: 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
145c313b4: 488d1449 lea rdx, [rcx + rcx*2]
145c313b8: 41b903000000 mov r9d, 3
145c313be: 4531db xor r11d, r11d
145c313c1: 4c8b8590000000 mov r8, qword ptr [rbp + 0x90]
145c313c8: 0f1f840000000000 nop dword ptr [rax + rax]
145c313d0: 4d89da mov r10, r11
145c313d3: 49f7d2 not r10
145c313d6: 4c035548 add r10, qword ptr [rbp + 0x48]
145c313da: f685bf00000020 test byte ptr [rbp + 0xbf], 0x20
145c313e1: 4d0f45d3 cmovne r10, r11
145c313e5: 49ffc3 inc r11
145c313e8: 4989d6 mov r14, rdx
145c313eb: 4d0faff2 imul r14, r10
145c313ef: 488d4f02 lea rcx, [rdi + 2]
145c313f3: 4e8d3c31 lea r15, [rcx + r14]
145c313f7: 31f6 xor esi, esi
145c313f9: 4c89c9 mov rcx, r9
145c313fc: 0f1f4000 nop dword ptr [rax]
145c31400: 4c39e1 cmp rcx, r12
145c31403: 0f83b7050000 jae 0x145c319c0
145c31409: 4d8d2436 lea r12, [r14 + rsi]
145c3140d: 4983c402 add r12, 2
145c31411: 4939dc cmp r12, rbx
145c31414: 0f832a090000 jae 0x145c31d44
145c3141a: 4d8d2436 lea r12, [r14 + rsi]
145c3141e: 49ffc4 inc r12
145c31421: 4939dc cmp r12, rbx
145c31424: 0f8336090000 jae 0x145c31d60
145c3142a: 4d8d2436 lea r12, [r14 + rsi]
145c3142e: 4939dc cmp r12, rbx
145c31431: 0f833e090000 jae 0x145c31d75
145c31437: 450fb62437 movzx r12d, byte ptr [r15 + rsi]
145c3143c: 450fb76c37fe movzx r13d, word ptr [r15 + rsi - 2]
145c31442: 6641c1c508 rol r13w, 8
145c31447: 45886408fd mov byte ptr [r8 + rcx - 3], r12b
145c3144c: 6645896c08fe mov word ptr [r8 + rcx - 2], r13w
145c31452: 41c60408ff mov byte ptr [r8 + rcx], 0xff
145c31457: 4883c104 add rcx, 4
145c3145b: 4883c603 add rsi, 3
145c3145f: 4839f2 cmp rdx, rsi
145c31462: 4c8ba5b0000000 mov r12, qword ptr [rbp + 0xb0]
145c31469: 7595 jne 0x145c31400
145c3146b: 4901c1 add r9, rax
145c3146e: 4c3b5d60 cmp r11, qword ptr [rbp + 0x60]
145c31472: 0f8558ffffff jne 0x145c313d0
145c31478: e9f2050000 jmp 0x145c31a6f
145c3147d: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
145c31484: 034d50 add ecx, dword ptr [rbp + 0x50]
145c31487: 89c8 mov eax, ecx
145c31489: c1e002 shl eax, 2
145c3148c: 48894558 mov qword ptr [rbp + 0x58], rax
145c31490: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
145c31497: 4c8d4003 lea r8, [rax + 3]
145c3149b: 48ffc9 dec rcx
145c3149e: 31c0 xor eax, eax
145c314a0: 4531db xor r11d, r11d
145c314a3: 31d2 xor edx, edx
145c314a5: 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
145c314ac: 48895568 mov qword ptr [rbp + 0x68], rdx
145c314b0: 4989c7 mov r15, rax
145c314b3: 49f7d7 not r15
145c314b6: 4c037d48 add r15, qword ptr [rbp + 0x48]
145c314ba: f685bf00000020 test byte ptr [rbp + 0xbf], 0x20
145c314c1: 4c0f45f8 cmovne r15, rax
145c314c5: 48ffc0 inc rax
145c314c8: 48894520 mov qword ptr [rbp + 0x20], rax
145c314cc: 4c0faf7d30 imul r15, qword ptr [rbp + 0x30]
145c314d1: 4989cc mov r12, rcx
145c314d4: 31c9 xor ecx, ecx
145c314d6: 4531ed xor r13d, r13d
145c314d9: e995000000 jmp 0x145c31573
145c314de: 6690 nop
145c314e0: 80bdbe00000010 cmp byte ptr [rbp + 0xbe], 0x10
145c314e7: 400f95c6 setne sil
145c314eb: 488b4540 mov rax, qword ptr [rbp + 0x40]
145c314ef: 460fb61408 movzx r10d, byte ptr [rax + r9]
145c314f4: 420fb6440801 movzx eax, byte ptr [rax + r9 + 1]
145c314fa: 89c2 mov edx, eax
145c314fc: c1e208 shl edx, 8
145c314ff: 4189d1 mov r9d, edx
145c31502: 4409d2 or edx, r10d
145c31505: 664585c9 test r9w, r9w
145c31509: 410f98c1 sets r9b
145c3150d: 4108f1 or r9b, sil
145c31510: 41f6d9 neg r9b
145c31513: 8d3400 lea esi, [rax + rax]
145c31516: 4080e6f8 and sil, 0xf8
145c3151a: c0e804 shr al, 4
145c3151d: 2407 and al, 7
145c3151f: 4008f0 or al, sil
145c31522: c1ea05 shr edx, 5
145c31525: 89d6 mov esi, edx
145c31527: 4080e61c and sil, 0x1c
145c3152b: c0e203 shl dl, 3
145c3152e: 40c0ee02 shr sil, 2
145c31532: 4008d6 or sil, dl
145c31535: 428d14d500000000 lea edx, [r10*8]
145c3153d: 4180e21c and r10b, 0x1c
145c31541: 41c0ea02 shr r10b, 2
145c31545: 4108d2 or r10b, dl
145c31548: 41884408fd mov byte ptr [r8 + rcx - 3], al
145c3154d: 41887408fe mov byte ptr [r8 + rcx - 2], sil
145c31552: 45885408ff mov byte ptr [r8 + rcx - 1], r10b
145c31557: 45880c08 mov byte ptr [r8 + rcx], r9b
145c3155b: 4883c104 add rcx, 4
145c3155f: 49ffcc dec r12
145c31562: 49ffc5 inc r13
145c31565: 48394d58 cmp qword ptr [rbp + 0x58], rcx
145c31569: 488b7538 mov rsi, qword ptr [rbp + 0x38]
145c3156d: 0f84b7000000 je 0x145c3162a
145c31573: f685bf00000010 test byte ptr [rbp + 0xbf], 0x10
145c3157a: 4c89e0 mov rax, r12
145c3157d: 490f44c5 cmove rax, r13
145c31581: 4c01f8 add rax, r15
145c31584: 490fafc6 imul rax, r14
145c31588: 4839d8 cmp rax, rbx
145c3158b: 0f8369080000 jae 0x145c31dfa
145c31591: 440fb60c07 movzx r9d, byte ptr [rdi + rax]
145c31596: 4c2b4de8 sub r9, qword ptr [rbp - 0x18]
145c3159a: 4c0fafce imul r9, rsi
145c3159e: 4c89ca mov rdx, r9
145c315a1: 4801f2 add rdx, rsi
145c315a4: 0f82b2000000 jb 0x145c3165c
145c315aa: 483b5528 cmp rdx, qword ptr [rbp + 0x28]
145c315ae: 0f87a8000000 ja 0x145c3165c
145c315b4: 498d040b lea rax, [r11 + rcx]
145c315b8: 4883c003 add rax, 3
145c315bc: 483b85b0000000 cmp rax, qword ptr [rbp + 0xb0]
145c315c3: 0f8338050000 jae 0x145c31b01
145c315c9: 83fe02 cmp esi, 2
145c315cc: 0f840effffff je 0x145c314e0
145c315d2: 83fe04 cmp esi, 4
145c315d5: 7529 jne 0x145c31600
145c315d7: 488b5540 mov rdx, qword ptr [rbp + 0x40]
145c315db: 460fb6140a movzx r10d, byte ptr [rdx + r9]
145c315e0: 420fb6740a01 movzx esi, byte ptr [rdx + r9 + 1]
145c315e6: 420fb6440a02 movzx eax, byte ptr [rdx + r9 + 2]
145c315ec: 460fb64c0a03 movzx r9d, byte ptr [rdx + r9 + 3]
145c315f2: e951ffffff jmp 0x145c31548
145c315f7: 660f1f840000000000 nop word ptr [rax + rax]
145c31600: 80bdbe00000011 cmp byte ptr [rbp + 0xbe], 0x11
145c31607: 0f8202080000 jb 0x145c31e0f
145c3160d: 488b5540 mov rdx, qword ptr [rbp + 0x40]
145c31611: 420fb6440a02 movzx eax, byte ptr [rdx + r9 + 2]
145c31617: 460fb6140a movzx r10d, byte ptr [rdx + r9]
145c3161c: 420fb6740a01 movzx esi, byte ptr [rdx + r9 + 1]
145c31622: 41b1ff mov r9b, 0xff
145c31625: e91effffff jmp 0x145c31548
145c3162a: 488b4558 mov rax, qword ptr [rbp + 0x58]
145c3162e: 488b5568 mov rdx, qword ptr [rbp + 0x68]
145c31632: 4829c2 sub rdx, rax
145c31635: 4901c0 add r8, rax
145c31638: 4901c3 add r11, rax
145c3163b: 488b4520 mov rax, qword ptr [rbp + 0x20]
145c3163f: 483b4560 cmp rax, qword ptr [rbp + 0x60]
145c31643: 4c8ba5b0000000 mov r12, qword ptr [rbp + 0xb0]
145c3164a: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
145c31651: 0f8555feffff jne 0x145c314ac
145c31657: e913040000 jmp 0x145c31a6f
145c3165c: 4889f9 mov rcx, rdi
145c3165f: 4801c1 add rcx, rax
145c31662: 48894d08 mov qword ptr [rbp + 8], rcx
145c31666: 488d0553940a00 lea rax, [rip + 0xa9453]
145c3166d: 48894510 mov qword ptr [rbp + 0x10], rax
145c31671: 488d15b0d97501 lea rdx, [rip + 0x175d9b0]
145c31678: 488d4dc8 lea rcx, [rbp - 0x38]
145c3167c: 4c8d4508 lea r8, [rbp + 8]
145c31680: e85bb00900 call 0x145ccc6e0
145c31685: 90 nop
145c31686: 488d4dc8 lea rcx, [rbp - 0x38]
145c3168a: e851182500 call 0x145e82ee0
145c3168f: 90 nop
145c31690: 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
145c31697: 488901 mov qword ptr [rcx], rax
145c3169a: 48c74108ffffffff mov qword ptr [rcx + 8], 0xffffffffffffffff
145c316a2: 41b801000000 mov r8d, 1
145c316a8: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145c316af: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
145c316b6: e8150b3dfa call 0x1400021d0
145c316bb: 488b5570 mov rdx, qword ptr [rbp + 0x70]
145c316bf: 4885d2 test rdx, rdx
145c316c2: 0f85d7030000 jne 0x145c31a9f
145c316c8: e9e0030000 jmp 0x145c31aad
145c316cd: f685bf00000010 test byte ptr [rbp + 0xbf], 0x10
145c316d4: 0f8503030000 jne 0x145c319dd
145c316da: 488bb5a8000000 mov rsi, qword ptr [rbp + 0xa8]
145c316e1: 037550 add esi, dword ptr [rbp + 0x50]
145c316e4: c1e602 shl esi, 2
145c316e7: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
145c316ee: 488d5003 lea rdx, [rax + 3]
145c316f2: 41b803000000 mov r8d, 3
145c316f8: 4531d2 xor r10d, r10d
145c316fb: 4531c9 xor r9d, r9d
145c316fe: 6690 nop
145c31700: 4c89d1 mov rcx, r10
145c31703: 48f7d1 not rcx
145c31706: 48034d48 add rcx, qword ptr [rbp + 0x48]
145c3170a: f685bf00000020 test byte ptr [rbp + 0xbf], 0x20
145c31711: 490f45ca cmovne rcx, r10
145c31715: 49ffc2 inc r10
145c31718: 480faf4d30 imul rcx, qword ptr [rbp + 0x30]
145c3171d: 31c0 xor eax, eax
145c3171f: 4989f6 mov r14, rsi
145c31722: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c31730: 4839d9 cmp rcx, rbx
145c31733: 0f8377050000 jae 0x145c31cb0
145c31739: 4d8d1c00 lea r11, [r8 + rax]
145c3173d: 4d39e3 cmp r11, r12
145c31740: 0f8388030000 jae 0x145c31ace
145c31746: 440fb61c0f movzx r11d, byte ptr [rdi + rcx]
145c3174b: 44885c02fd mov byte ptr [rdx + rax - 3], r11b
145c31750: 44885c02fe mov byte ptr [rdx + rax - 2], r11b
145c31755: 44885c02ff mov byte ptr [rdx + rax - 1], r11b
145c3175a: c60402ff mov byte ptr [rdx + rax], 0xff
145c3175e: 4883c004 add rax, 4
145c31762: 48ffc1 inc rcx
145c31765: 4939c6 cmp r14, rax
145c31768: 75c6 jne 0x145c31730
145c3176a: 4d29f1 sub r9, r14
145c3176d: 4c01f2 add rdx, r14
145c31770: 4d01f0 add r8, r14
145c31773: 4c3b5560 cmp r10, qword ptr [rbp + 0x60]
145c31777: 7587 jne 0x145c31700
145c31779: e9f1020000 jmp 0x145c31a6f
145c3177e: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
145c31785: 034d50 add ecx, dword ptr [rbp + 0x50]
145c31788: 89c8 mov eax, ecx
145c3178a: c1e002 shl eax, 2
145c3178d: 48894558 mov qword ptr [rbp + 0x58], rax
145c31791: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
145c31798: 4c8d4803 lea r9, [rax + 3]
145c3179c: 488d41ff lea rax, [rcx - 1]
145c317a0: 48894540 mov qword ptr [rbp + 0x40], rax
145c317a4: 31c0 xor eax, eax
145c317a6: 31f6 xor esi, esi
145c317a8: 31c9 xor ecx, ecx
145c317aa: 660f1f440000 nop word ptr [rax + rax]
145c317b0: 48894d38 mov qword ptr [rbp + 0x38], rcx
145c317b4: 4989ff mov r15, rdi
145c317b7: 4989c4 mov r12, rax
145c317ba: 49f7d4 not r12
145c317bd: 4c036548 add r12, qword ptr [rbp + 0x48]
145c317c1: f685bf00000020 test byte ptr [rbp + 0xbf], 0x20
145c317c8: 4c0f45e0 cmovne r12, rax
145c317cc: 48ffc0 inc rax
145c317cf: 48894528 mov qword ptr [rbp + 0x28], rax
145c317d3: 4c0faf6530 imul r12, qword ptr [rbp + 0x30]
145c317d8: 4c8b6d40 mov r13, qword ptr [rbp + 0x40]
145c317dc: 31c9 xor ecx, ecx
145c317de: 4531d2 xor r10d, r10d
145c317e1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c317f0: f685bf00000010 test byte ptr [rbp + 0xbf], 0x10
145c317f7: 4c89e8 mov rax, r13
145c317fa: 490f44c2 cmove rax, r10
145c317fe: 488d140e lea rdx, [rsi + rcx]
145c31802: 4883c203 add rdx, 3
145c31806: 483b95b0000000 cmp rdx, qword ptr [rbp + 0xb0]
145c3180d: 0f83a9000000 jae 0x145c318bc
145c31813: 4c01e0 add rax, r12
145c31816: 490fafc6 imul rax, r14
145c3181a: 488d5002 lea rdx, [rax + 2]
145c3181e: 4839da cmp rdx, rbx
145c31821: 0f839e040000 jae 0x145c31cc5
145c31827: 488d5001 lea rdx, [rax + 1]
145c3182b: 4839da cmp rdx, rbx
145c3182e: 0f83a9040000 jae 0x145c31cdd
145c31834: 4839d8 cmp rax, rbx
145c31837: 0f83b8040000 jae 0x145c31cf5
145c3183d: 488d5003 lea rdx, [rax + 3]
145c31841: 4889df mov rdi, rbx
145c31844: 4839da cmp rdx, rbx
145c31847: 0f83c0040000 jae 0x145c31d0d
145c3184d: 410fb6540702 movzx edx, byte ptr [r15 + rax + 2]
145c31853: 450fb65c0701 movzx r11d, byte ptr [r15 + rax + 1]
145c31859: 410fb61c07 movzx ebx, byte ptr [r15 + rax]
145c3185e: 410fb6440703 movzx eax, byte ptr [r15 + rax + 3]
145c31864: 41885409fd mov byte ptr [r9 + rcx - 3], dl
145c31869: 45885c09fe mov byte ptr [r9 + rcx - 2], r11b
145c3186e: 41885c09ff mov byte ptr [r9 + rcx - 1], bl
145c31873: 41880409 mov byte ptr [r9 + rcx], al
145c31877: 4883c104 add rcx, 4
145c3187b: 49ffcd dec r13
145c3187e: 49ffc2 inc r10
145c31881: 48394d58 cmp qword ptr [rbp + 0x58], rcx
145c31885: 4889fb mov rbx, rdi
145c31888: 0f8562ffffff jne 0x145c317f0
145c3188e: 488b4558 mov rax, qword ptr [rbp + 0x58]
145c31892: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
145c31896: 4829c1 sub rcx, rax
145c31899: 4901c1 add r9, rax
145c3189c: 4801c6 add rsi, rax
145c3189f: 488b4528 mov rax, qword ptr [rbp + 0x28]
145c318a3: 483b4560 cmp rax, qword ptr [rbp + 0x60]
145c318a7: 4c89ff mov rdi, r15
145c318aa: 4c8ba5b0000000 mov r12, qword ptr [rbp + 0xb0]
145c318b1: 0f85f9feffff jne 0x145c317b0
145c318b7: e9b3010000 jmp 0x145c31a6f
145c318bc: 482b4d38 sub rcx, qword ptr [rbp + 0x38]
145c318c0: 488d5104 lea rdx, [rcx + 4]
145c318c4: 4c8d0dfdd67501 lea r9, [rip + 0x175d6fd]
145c318cb: 4c8b85b0000000 mov r8, qword ptr [rbp + 0xb0]
145c318d2: e859aa2600 call 0x145e9c330
145c318d7: 90 nop
145c318d8: e967050000 jmp 0x145c31e44
145c318dd: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
145c318e4: 034d50 add ecx, dword ptr [rbp + 0x50]
145c318e7: 89c8 mov eax, ecx
145c318e9: c1e002 shl eax, 2
145c318ec: 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
145c318f3: 488d1449 lea rdx, [rcx + rcx*2]
145c318f7: 41b903000000 mov r9d, 3
145c318fd: 4531db xor r11d, r11d
145c31900: 4c8b8590000000 mov r8, qword ptr [rbp + 0x90]
145c31907: 660f1f840000000000 nop word ptr [rax + rax]
145c31910: 4d89da mov r10, r11
145c31913: 49f7d2 not r10
145c31916: 4c035548 add r10, qword ptr [rbp + 0x48]
145c3191a: f685bf00000020 test byte ptr [rbp + 0xbf], 0x20
145c31921: 4d0f45d3 cmovne r10, r11
145c31925: 49ffc3 inc r11
145c31928: 49ffc2 inc r10
145c3192b: 4989d6 mov r14, rdx
145c3192e: 4d0faff2 imul r14, r10
145c31932: 488d4fff lea rcx, [rdi - 1]
145c31936: 4e8d3c31 lea r15, [rcx + r14]
145c3193a: 31f6 xor esi, esi
145c3193c: 4c89c9 mov rcx, r9
145c3193f: 90 nop
145c31940: 4c39e1 cmp rcx, r12
145c31943: 737b jae 0x145c319c0
145c31945: 4d8d2436 lea r12, [r14 + rsi]
145c31949: 49ffcc dec r12
145c3194c: 4939dc cmp r12, rbx
145c3194f: 0f8380040000 jae 0x145c31dd5
145c31955: 4d8d2436 lea r12, [r14 + rsi]
145c31959: 4983c4fe add r12, -2
145c3195d: 4939dc cmp r12, rbx
145c31960: 0f8349040000 jae 0x145c31daf
145c31966: 4d8d2436 lea r12, [r14 + rsi]
145c3196a: 4983c4fd add r12, -3
145c3196e: 4939dc cmp r12, rbx
145c31971: 0f830f040000 jae 0x145c31d86
145c31977: 450fb76437fe movzx r12d, word ptr [r15 + rsi - 2]
145c3197d: 6641c1c408 rol r12w, 8
145c31982: 450fb62c37 movzx r13d, byte ptr [r15 + rsi]
145c31987: 45886c08fd mov byte ptr [r8 + rcx - 3], r13b
145c3198c: 6645896408fe mov word ptr [r8 + rcx - 2], r12w
145c31992: 41c60408ff mov byte ptr [r8 + rcx], 0xff
145c31997: 4883c104 add rcx, 4
145c3199b: 4883c6fd add rsi, -3
145c3199f: 4989d4 mov r12, rdx
145c319a2: 4901f4 add r12, rsi
145c319a5: 4c8ba5b0000000 mov r12, qword ptr [rbp + 0xb0]
145c319ac: 7592 jne 0x145c31940
145c319ae: 4901c1 add r9, rax
145c319b1: 4c3b5d60 cmp r11, qword ptr [rbp + 0x60]
145c319b5: 0f8555ffffff jne 0x145c31910
145c319bb: e9af000000 jmp 0x145c31a6f
145c319c0: 4883c1fd add rcx, -3
145c319c4: 488d5104 lea rdx, [rcx + 4]
145c319c8: 4c8d0d81d57501 lea r9, [rip + 0x175d581]
145c319cf: 4d89e0 mov r8, r12
145c319d2: e859a92600 call 0x145e9c330
145c319d7: 90 nop
145c319d8: e967040000 jmp 0x145c31e44
145c319dd: 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
145c319e4: 035550 add edx, dword ptr [rbp + 0x50]
145c319e7: 4989d6 mov r14, rdx
145c319ea: c1e202 shl edx, 2
145c319ed: 41b803000000 mov r8d, 3
145c319f3: 4531c9 xor r9d, r9d
145c319f6: 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
145c319fd: 0f1f00 nop dword ptr [rax]
145c31a00: 4c89c9 mov rcx, r9
145c31a03: 48f7d1 not rcx
145c31a06: 48034d48 add rcx, qword ptr [rbp + 0x48]
145c31a0a: f685bf00000020 test byte ptr [rbp + 0xbf], 0x20
145c31a11: 490f45c9 cmovne rcx, r9
145c31a15: 49ffc1 inc r9
145c31a18: 48ffc1 inc rcx
145c31a1b: 480faf4d30 imul rcx, qword ptr [rbp + 0x30]
145c31a20: 48ffc9 dec rcx
145c31a23: 4d89f2 mov r10, r14
145c31a26: 4c89c0 mov rax, r8
145c31a29: 0f1f8000000000 nop dword ptr [rax]
145c31a30: 4839d9 cmp rcx, rbx
145c31a33: 0f8377020000 jae 0x145c31cb0
145c31a39: 4c39e0 cmp rax, r12
145c31a3c: 0f8386000000 jae 0x145c31ac8
145c31a42: 440fb61c0f movzx r11d, byte ptr [rdi + rcx]
145c31a47: 44885c06fd mov byte ptr [rsi + rax - 3], r11b
145c31a4c: 44885c06fe mov byte ptr [rsi + rax - 2], r11b
145c31a51: 44885c06ff mov byte ptr [rsi + rax - 1], r11b
145c31a56: c60406ff mov byte ptr [rsi + rax], 0xff
145c31a5a: 4883c004 add rax, 4
145c31a5e: 48ffc9 dec rcx
145c31a61: 49ffca dec r10
145c31a64: 75ca jne 0x145c31a30
145c31a66: 4901d0 add r8, rdx
145c31a69: 4c3b4d60 cmp r9, qword ptr [rbp + 0x60]
145c31a6d: 7591 jne 0x145c31a00
145c31a6f: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
145c31a76: 4c896008 mov qword ptr [rax + 8], r12
145c31a7a: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145c31a81: 48894810 mov qword ptr [rax + 0x10], rcx
145c31a85: 4c896018 mov qword ptr [rax + 0x18], r12
145c31a89: 488b4d00 mov rcx, qword ptr [rbp]
145c31a8d: 8908 mov dword ptr [rax], ecx
145c31a8f: 488b4df8 mov rcx, qword ptr [rbp - 8]
145c31a93: 894804 mov dword ptr [rax + 4], ecx
145c31a96: 488b5570 mov rdx, qword ptr [rbp + 0x70]
145c31a9a: 4885d2 test rdx, rdx
145c31a9d: 740e je 0x145c31aad
145c31a9f: 41b801000000 mov r8d, 1
145c31aa5: 4889f9 mov rcx, rdi
145c31aa8: e823073dfa call 0x1400021d0
145c31aad: 488b85a0000000 mov rax, qword ptr [rbp + 0xa0]
145c31ab4: 4881c448010000 add rsp, 0x148
145c31abb: 5b pop rbx
145c31abc: 5f pop rdi
145c31abd: 5e pop rsi
145c31abe: 415c pop r12
145c31ac0: 415d pop r13
145c31ac2: 415e pop r14
145c31ac4: 415f pop r15
145c31ac6: 5d pop rbp
145c31ac7: c3 ret
145c31ac8: 4883c0fd add rax, -3
145c31acc: eb03 jmp 0x145c31ad1
145c31ace: 4c29c8 sub rax, r9
145c31ad1: 488d5004 lea rdx, [rax + 4]
145c31ad5: 4c8d0d14d47501 lea r9, [rip + 0x175d414]
145c31adc: 4889c1 mov rcx, rax
145c31adf: 4d89e0 mov r8, r12
145c31ae2: e849a82600 call 0x145e9c330
145c31ae7: 90 nop
145c31ae8: e957030000 jmp 0x145c31e44
145c31aed: 488d0d5dd57501 lea rcx, [rip + 0x175d55d]
145c31af4: ba19000000 mov edx, 0x19
145c31af9: e892142500 call 0x145e82f90
145c31afe: 90 nop
145c31aff: eb47 jmp 0x145c31b48
145c31b01: 482b4d68 sub rcx, qword ptr [rbp + 0x68]
145c31b05: 488d5104 lea rdx, [rcx + 4]
145c31b09: 4c8d0d00d57501 lea r9, [rip + 0x175d500]
145c31b10: 4c8b85b0000000 mov r8, qword ptr [rbp + 0xb0]
145c31b17: e814a82600 call 0x145e9c330
145c31b1c: 90 nop
145c31b1d: e922030000 jmp 0x145c31e44
145c31b22: 488d0d41d57501 lea rcx, [rip + 0x175d541]
145c31b29: ba1d000000 mov edx, 0x1d
145c31b2e: e85d142500 call 0x145e82f90
145c31b33: 90 nop
145c31b34: eb12 jmp 0x145c31b48
145c31b36: 488d0d4ad57501 lea rcx, [rip + 0x175d54a]
145c31b3d: ba16000000 mov edx, 0x16
145c31b42: e849142500 call 0x145e82f90
145c31b47: 90 nop
145c31b48: 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
145c31b4f: 488901 mov qword ptr [rcx], rax
145c31b52: 48c74108ffffffff mov qword ptr [rcx + 8], 0xffffffffffffffff
145c31b5a: 488b5570 mov rdx, qword ptr [rbp + 0x70]
145c31b5e: 4885d2 test rdx, rdx
145c31b61: 0f8538ffffff jne 0x145c31a9f
145c31b67: e941ffffff jmp 0x145c31aad
145c31b6c: 488d451c lea rax, [rbp + 0x1c]
145c31b70: 48894570 mov qword ptr [rbp + 0x70], rax
145c31b74: 488d0515c60a00 lea rax, [rip + 0xac615]
145c31b7b: 48894578 mov qword ptr [rbp + 0x78], rax
145c31b7f: 488d4d18 lea rcx, [rbp + 0x18]
145c31b83: 48898d80000000 mov qword ptr [rbp + 0x80], rcx
145c31b8a: 48898588000000 mov qword ptr [rbp + 0x88], rax
145c31b91: 488d0d3ed57501 lea rcx, [rip + 0x175d53e]
145c31b98: e9f3000000 jmp 0x145c31c90
145c31b9d: 488d859f000000 lea rax, [rbp + 0x9f]
145c31ba4: 48894570 mov qword ptr [rbp + 0x70], rax
145c31ba8: 488d05118f0a00 lea rax, [rip + 0xa8f11]
145c31baf: 48894578 mov qword ptr [rbp + 0x78], rax
145c31bb3: 488d8dbd000000 lea rcx, [rbp + 0xbd]
145c31bba: 48898d80000000 mov qword ptr [rbp + 0x80], rcx
145c31bc1: 48898588000000 mov qword ptr [rbp + 0x88], rax
145c31bc8: 488d0d94d57501 lea rcx, [rip + 0x175d594]
145c31bcf: e9bc000000 jmp 0x145c31c90
145c31bd4: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
145c31bdb: 48894508 mov qword ptr [rbp + 8], rax
145c31bdf: 488d4508 lea rax, [rbp + 8]
145c31be3: 48894570 mov qword ptr [rbp + 0x70], rax
145c31be7: 488d0592d40a00 lea rax, [rip + 0xad492]
145c31bee: 48894578 mov qword ptr [rbp + 0x78], rax
145c31bf2: 488d1563d27501 lea rdx, [rip + 0x175d263]
145c31bf9: 488d75b0 lea rsi, [rbp - 0x50]
145c31bfd: 4c8d4570 lea r8, [rbp + 0x70]
145c31c01: 4889f1 mov rcx, rsi
145c31c04: e8d7aa0900 call 0x145ccc6e0
145c31c09: 4889f1 mov rcx, rsi
145c31c0c: e8cf122500 call 0x145e82ee0
145c31c11: e983000000 jmp 0x145c31c99
145c31c16: 40887508 mov byte ptr [rbp + 8], sil
145c31c1a: 488d4508 lea rax, [rbp + 8]
145c31c1e: 48894570 mov qword ptr [rbp + 0x70], rax
145c31c22: 488d05978e0a00 lea rax, [rip + 0xa8e97]
145c31c29: 48894578 mov qword ptr [rbp + 0x78], rax
145c31c2d: 488d0d6cd27501 lea rcx, [rip + 0x175d26c]
145c31c34: eb5a jmp 0x145c31c90
145c31c36: 488d0d60d47501 lea rcx, [rip + 0x175d460]
145c31c3d: ba20000000 mov edx, 0x20
145c31c42: e849132500 call 0x145e82f90
145c31c47: eb50 jmp 0x145c31c99
145c31c49: 488d0d6bd27501 lea rcx, [rip + 0x175d26b]
145c31c50: ba19000000 mov edx, 0x19
145c31c55: e836132500 call 0x145e82f90
145c31c5a: 90 nop
145c31c5b: e9e8feffff jmp 0x145c31b48
145c31c60: 488d0d56d47501 lea rcx, [rip + 0x175d456]
145c31c67: ba19000000 mov edx, 0x19
145c31c6c: e81f132500 call 0x145e82f90
145c31c71: eb26 jmp 0x145c31c99
145c31c73: 488d85bd000000 lea rax, [rbp + 0xbd]
145c31c7a: 48894570 mov qword ptr [rbp + 0x70], rax
145c31c7e: 488d053b8e0a00 lea rax, [rip + 0xa8e3b]
145c31c85: 48894578 mov qword ptr [rbp + 0x78], rax
145c31c89: 488d0d93d47501 lea rcx, [rip + 0x175d493]
145c31c90: 488d5570 lea rdx, [rbp + 0x70]
145c31c94: e867722600 call 0x145e98f00
145c31c99: 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
145c31ca0: 488901 mov qword ptr [rcx], rax
145c31ca3: 48c74108ffffffff mov qword ptr [rcx + 8], 0xffffffffffffffff
145c31cab: e9fdfdffff jmp 0x145c31aad
145c31cb0: 4c8d0521d27501 lea r8, [rip + 0x175d221]
145c31cb7: 4889da mov rdx, rbx
145c31cba: e864a42600 call 0x145e9c123
145c31cbf: 90 nop
145c31cc0: e97f010000 jmp 0x145c31e44
145c31cc5: 4c8d059cd27501 lea r8, [rip + 0x175d29c]
145c31ccc: 4889d1 mov rcx, rdx
145c31ccf: 4889da mov rdx, rbx
145c31cd2: e84ca42600 call 0x145e9c123
145c31cd7: 90 nop
145c31cd8: e967010000 jmp 0x145c31e44
145c31cdd: 4c8d059cd27501 lea r8, [rip + 0x175d29c]
145c31ce4: 4889d1 mov rcx, rdx
145c31ce7: 4889da mov rdx, rbx
145c31cea: e834a42600 call 0x145e9c123
145c31cef: 90 nop
145c31cf0: e94f010000 jmp 0x145c31e44
145c31cf5: 4c8d059cd27501 lea r8, [rip + 0x175d29c]
145c31cfc: 4889c1 mov rcx, rax
145c31cff: 4889da mov rdx, rbx
145c31d02: e81ca42600 call 0x145e9c123
145c31d07: 90 nop
145c31d08: e937010000 jmp 0x145c31e44
145c31d0d: 4c8d059cd27501 lea r8, [rip + 0x175d29c]
145c31d14: 4889d1 mov rcx, rdx
145c31d17: 4889fa mov rdx, rdi
145c31d1a: e804a42600 call 0x145e9c123
145c31d1f: 90 nop
145c31d20: e91f010000 jmp 0x145c31e44
145c31d25: 488d45e0 lea rax, [rbp - 0x20]
145c31d29: 48894570 mov qword ptr [rbp + 0x70], rax
145c31d2d: 488d054cd30a00 lea rax, [rip + 0xad34c]
145c31d34: 48894578 mov qword ptr [rbp + 0x78], rax
145c31d38: 488d0db9d37501 lea rcx, [rip + 0x175d3b9]
145c31d3f: e94cffffff jmp 0x145c31c90
145c31d44: 4889da mov rdx, rbx
145c31d47: 4c0faf95a8000000 imul r10, qword ptr [rbp + 0xa8]
145c31d4f: 4b8d0452 lea rax, [r10 + r10*2]
145c31d53: 488d0c06 lea rcx, [rsi + rax]
145c31d57: 4883c102 add rcx, 2
145c31d5b: e98b000000 jmp 0x145c31deb
145c31d60: 4c0faf95a8000000 imul r10, qword ptr [rbp + 0xa8]
145c31d68: 4b8d0452 lea rax, [r10 + r10*2]
145c31d6c: 488d0c06 lea rcx, [rsi + rax]
145c31d70: 48ffc1 inc rcx
145c31d73: eb4e jmp 0x145c31dc3
145c31d75: 4c0faf95a8000000 imul r10, qword ptr [rbp + 0xa8]
145c31d7d: 4b8d0c52 lea rcx, [r10 + r10*2]
145c31d81: 4801f1 add rcx, rsi
145c31d84: eb14 jmp 0x145c31d9a
145c31d86: 4c0faf95a8000000 imul r10, qword ptr [rbp + 0xa8]
145c31d8e: 4b8d0452 lea rax, [r10 + r10*2]
145c31d92: 488d0c06 lea rcx, [rsi + rax]
145c31d96: 4883c1fd add rcx, -3
145c31d9a: 4c8d0597d17501 lea r8, [rip + 0x175d197]
145c31da1: 4889da mov rdx, rbx
145c31da4: e87aa32600 call 0x145e9c123
145c31da9: 90 nop
145c31daa: e995000000 jmp 0x145c31e44
145c31daf: 4c0faf95a8000000 imul r10, qword ptr [rbp + 0xa8]
145c31db7: 4b8d0452 lea rax, [r10 + r10*2]
145c31dbb: 488d0c06 lea rcx, [rsi + rax]
145c31dbf: 4883c1fe add rcx, -2
145c31dc3: 4c8d0556d17501 lea r8, [rip + 0x175d156]
145c31dca: 4889da mov rdx, rbx
145c31dcd: e851a32600 call 0x145e9c123
145c31dd2: 90 nop
145c31dd3: eb6f jmp 0x145c31e44
145c31dd5: 4889da mov rdx, rbx
145c31dd8: 4c0faf95a8000000 imul r10, qword ptr [rbp + 0xa8]
145c31de0: 4b8d0452 lea rax, [r10 + r10*2]
145c31de4: 488d0c06 lea rcx, [rsi + rax]
145c31de8: 48ffc9 dec rcx
145c31deb: 4c8d0516d17501 lea r8, [rip + 0x175d116]
145c31df2: e82ca32600 call 0x145e9c123
145c31df7: 90 nop
145c31df8: eb4a jmp 0x145c31e44
145c31dfa: 4c8d05dfd17501 lea r8, [rip + 0x175d1df]
145c31e01: 4889c1 mov rcx, rax
145c31e04: 4889da mov rdx, rbx
145c31e07: e817a32600 call 0x145e9c123
145c31e0c: 90 nop
145c31e0d: eb35 jmp 0x145c31e44
145c31e0f: 4c8d05e2d17501 lea r8, [rip + 0x175d1e2]
145c31e16: b902000000 mov ecx, 2
145c31e1b: 488b5538 mov rdx, qword ptr [rbp + 0x38]
145c31e1f: e8ffa22600 call 0x145e9c123
145c31e24: 90 nop
145c31e25: eb1d jmp 0x145c31e44
145c31e27: b901000000 mov ecx, 1
145c31e2c: 4889da mov rdx, rbx
145c31e2f: e8579f2600 call 0x145e9bd8b
145c31e34: 0f0b ud2
145c31e36: b901000000 mov ecx, 1
145c31e3b: 4c89e2 mov rdx, r12
145c31e3e: e8489f2600 call 0x145e9bd8b
145c31e43: 90 nop
145c31e44: 0f0b ud2
