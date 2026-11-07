14005ca50: 55 push rbp
14005ca51: 4157 push r15
14005ca53: 4156 push r14
14005ca55: 4155 push r13
14005ca57: 4154 push r12
14005ca59: 56 push rsi
14005ca5a: 57 push rdi
14005ca5b: 53 push rbx
14005ca5c: 4881ec58010000 sub rsp, 0x158
14005ca63: 488dac2480000000 lea rbp, [rsp + 0x80]
14005ca6b: 48c785d0000000feffffff mov qword ptr [rbp + 0xd0], 0xfffffffffffffffe
14005ca76: 4c89cf mov rdi, r9
14005ca79: 4889d6 mov rsi, rdx
14005ca7c: 410fb600 movzx eax, byte ptr [r8]
14005ca80: 41c60001 mov byte ptr [r8], 1
14005ca84: 3c01 cmp al, 1
14005ca86: 0f8430010000 je 0x14005cbbc
14005ca8c: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005ca95: 488d15266ed505 lea rdx, [rip + 0x5d56e26]
14005ca9c: 488d1d1a6dd505 lea rbx, [rip + 0x5d56d1a]
14005caa3: 41b808000000 mov r8d, 8
14005caa9: 4889f1 mov rcx, rsi
14005caac: 4989d9 mov r9, rbx
14005caaf: e83cd25000 call 0x140569cf0
14005cab4: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cabd: 488d15066ed505 lea rdx, [rip + 0x5d56e06]
14005cac4: 41b809000000 mov r8d, 9
14005caca: 4889f1 mov rcx, rsi
14005cacd: 4989d9 mov r9, rbx
14005cad0: e81bd25000 call 0x140569cf0
14005cad5: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cade: 488d15ee6dd505 lea rdx, [rip + 0x5d56dee]
14005cae5: 41b808000000 mov r8d, 8
14005caeb: 4889f1 mov rcx, rsi
14005caee: 4989d9 mov r9, rbx
14005caf1: e8fad15000 call 0x140569cf0
14005caf6: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005caff: 488d15d56dd505 lea rdx, [rip + 0x5d56dd5]
14005cb06: 41b808000000 mov r8d, 8
14005cb0c: 4889f1 mov rcx, rsi
14005cb0f: 4989d9 mov r9, rbx
14005cb12: e8d9d15000 call 0x140569cf0
14005cb17: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cb20: 488d15bc6dd505 lea rdx, [rip + 0x5d56dbc]
14005cb27: 41b80a000000 mov r8d, 0xa
14005cb2d: 4889f1 mov rcx, rsi
14005cb30: 4989d9 mov r9, rbx
14005cb33: e8b8d15000 call 0x140569cf0
14005cb38: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cb41: 488d15a56dd505 lea rdx, [rip + 0x5d56da5]
14005cb48: 41b807000000 mov r8d, 7
14005cb4e: 4889f1 mov rcx, rsi
14005cb51: 4989d9 mov r9, rbx
14005cb54: e897d15000 call 0x140569cf0
14005cb59: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cb62: 488d158b6dd505 lea rdx, [rip + 0x5d56d8b]
14005cb69: 41b808000000 mov r8d, 8
14005cb6f: 4889f1 mov rcx, rsi
14005cb72: 4989d9 mov r9, rbx
14005cb75: e876d15000 call 0x140569cf0
14005cb7a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cb83: 488d15726dd505 lea rdx, [rip + 0x5d56d72]
14005cb8a: 41b809000000 mov r8d, 9
14005cb90: 4889f1 mov rcx, rsi
14005cb93: 4989d9 mov r9, rbx
14005cb96: e855d15000 call 0x140569cf0
14005cb9b: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14005cba4: 488d155a6dd505 lea rdx, [rip + 0x5d56d5a]
14005cbab: 41b807000000 mov r8d, 7
14005cbb1: 4889f1 mov rcx, rsi
14005cbb4: 4989d9 mov r9, rbx
14005cbb7: e834d15000 call 0x140569cf0
14005cbbc: 4c8d05ff6cd505 lea r8, [rip + 0x5d56cff]
14005cbc3: 488d4db0 lea rcx, [rbp - 0x50]
14005cbc7: 41b908000000 mov r9d, 8
14005cbcd: 4889f2 mov rdx, rsi
14005cbd0: e8fb075100 call 0x14056d3d0
14005cbd5: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005cbd9: b301 mov bl, 1
14005cbdb: 41b701 mov r15b, 1
14005cbde: 4883f8ff cmp rax, -1
14005cbe2: 7447 je 0x14005cc2b
14005cbe4: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14005cbeb: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005cbef: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cbf3: 48898dc8000000 mov qword ptr [rbp + 0xc8], rcx
14005cbfa: e8f1c90000 call 0x1400695f0
14005cbff: 90 nop
14005cc00: 4883fa01 cmp rdx, 1
14005cc04: 7507 jne 0x14005cc0d
14005cc06: 803830 cmp byte ptr [rax], 0x30
14005cc09: 410f95c7 setne r15b
14005cc0d: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
14005cc14: 4885d2 test rdx, rdx
14005cc17: 7412 je 0x14005cc2b
14005cc19: 41b801000000 mov r8d, 1
14005cc1f: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14005cc26: e8a555faff call 0x1400021d0
14005cc2b: 4c8d05986cd505 lea r8, [rip + 0x5d56c98]
14005cc32: 488d4db0 lea rcx, [rbp - 0x50]
14005cc36: 41b909000000 mov r9d, 9
14005cc3c: 4889f2 mov rdx, rsi
14005cc3f: e88c075100 call 0x14056d3d0
14005cc44: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005cc48: 4883f8ff cmp rax, -1
14005cc4c: 7446 je 0x14005cc94
14005cc4e: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14005cc55: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005cc59: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cc5d: 48898dc8000000 mov qword ptr [rbp + 0xc8], rcx
14005cc64: e887c90000 call 0x1400695f0
14005cc69: 90 nop
14005cc6a: 4883fa01 cmp rdx, 1
14005cc6e: 7506 jne 0x14005cc76
14005cc70: 803830 cmp byte ptr [rax], 0x30
14005cc73: 0f95c3 setne bl
14005cc76: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
14005cc7d: 4885d2 test rdx, rdx
14005cc80: 7412 je 0x14005cc94
14005cc82: 41b801000000 mov r8d, 1
14005cc88: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14005cc8f: e83c55faff call 0x1400021d0
14005cc94: 4c8d05386cd505 lea r8, [rip + 0x5d56c38]
14005cc9b: 488d4db0 lea rcx, [rbp - 0x50]
14005cc9f: 41b908000000 mov r9d, 8
14005cca5: 4889f2 mov rdx, rsi
14005cca8: e823075100 call 0x14056d3d0
14005ccad: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005ccb1: 41b401 mov r12b, 1
14005ccb4: 41b501 mov r13b, 1
14005ccb7: 4883f8ff cmp rax, -1
14005ccbb: 7447 je 0x14005cd04
14005ccbd: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14005ccc4: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005ccc8: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cccc: 48898dc8000000 mov qword ptr [rbp + 0xc8], rcx
14005ccd3: e818c90000 call 0x1400695f0
14005ccd8: 90 nop
14005ccd9: 4883fa01 cmp rdx, 1
14005ccdd: 7507 jne 0x14005cce6
14005ccdf: 803830 cmp byte ptr [rax], 0x30
14005cce2: 410f95c5 setne r13b
14005cce6: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
14005cced: 4885d2 test rdx, rdx
14005ccf0: 7412 je 0x14005cd04
14005ccf2: 41b801000000 mov r8d, 1
14005ccf8: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14005ccff: e8cc54faff call 0x1400021d0
14005cd04: 4c8d05d06bd505 lea r8, [rip + 0x5d56bd0]
14005cd0b: 488d4db0 lea rcx, [rbp - 0x50]
14005cd0f: 41b908000000 mov r9d, 8
14005cd15: 4889f2 mov rdx, rsi
14005cd18: e8b3065100 call 0x14056d3d0
14005cd1d: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005cd21: 4883f8ff cmp rax, -1
14005cd25: 7447 je 0x14005cd6e
14005cd27: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14005cd2e: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005cd32: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cd36: 48898dc8000000 mov qword ptr [rbp + 0xc8], rcx
14005cd3d: e8aec80000 call 0x1400695f0
14005cd42: 90 nop
14005cd43: 4883fa01 cmp rdx, 1
14005cd47: 7507 jne 0x14005cd50
14005cd49: 803830 cmp byte ptr [rax], 0x30
14005cd4c: 410f95c4 setne r12b
14005cd50: 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
14005cd57: 4885d2 test rdx, rdx
14005cd5a: 7412 je 0x14005cd6e
14005cd5c: 41b801000000 mov r8d, 1
14005cd62: 488b8dc8000000 mov rcx, qword ptr [rbp + 0xc8]
14005cd69: e86254faff call 0x1400021d0
14005cd6e: 4c8d056e6bd505 lea r8, [rip + 0x5d56b6e]
14005cd75: 488d4db0 lea rcx, [rbp - 0x50]
14005cd79: 41b90a000000 mov r9d, 0xa
14005cd7f: 4889f2 mov rdx, rsi
14005cd82: e849065100 call 0x14056d3d0
14005cd87: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005cd8b: 41b601 mov r14b, 1
14005cd8e: c685b800000001 mov byte ptr [rbp + 0xb8], 1
14005cd95: 4883f8ff cmp rax, -1
14005cd99: 744e je 0x14005cde9
14005cd9b: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14005cda2: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005cda6: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cdaa: 48898d98000000 mov qword ptr [rbp + 0x98], rcx
14005cdb1: e83ac80000 call 0x1400695f0
14005cdb6: 90 nop
14005cdb7: b101 mov cl, 1
14005cdb9: 4883fa01 cmp rdx, 1
14005cdbd: 7506 jne 0x14005cdc5
14005cdbf: 803830 cmp byte ptr [rax], 0x30
14005cdc2: 0f95c1 setne cl
14005cdc5: 888db8000000 mov byte ptr [rbp + 0xb8], cl
14005cdcb: 488b95c8000000 mov rdx, qword ptr [rbp + 0xc8]
14005cdd2: 4885d2 test rdx, rdx
14005cdd5: 7412 je 0x14005cde9
14005cdd7: 41b801000000 mov r8d, 1
14005cddd: 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
14005cde4: e8e753faff call 0x1400021d0
14005cde9: 4c8d05fd6ad505 lea r8, [rip + 0x5d56afd]
14005cdf0: 488d4db0 lea rcx, [rbp - 0x50]
14005cdf4: 41b907000000 mov r9d, 7
14005cdfa: 4889f2 mov rdx, rsi
14005cdfd: e8ce055100 call 0x14056d3d0
14005ce02: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005ce06: 4883f8ff cmp rax, -1
14005ce0a: 7447 je 0x14005ce53
14005ce0c: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14005ce13: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005ce17: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005ce1b: 48898d98000000 mov qword ptr [rbp + 0x98], rcx
14005ce22: e8c9c70000 call 0x1400695f0
14005ce27: 90 nop
14005ce28: 4883fa01 cmp rdx, 1
14005ce2c: 7507 jne 0x14005ce35
14005ce2e: 803830 cmp byte ptr [rax], 0x30
14005ce31: 410f95c6 setne r14b
14005ce35: 488b95c8000000 mov rdx, qword ptr [rbp + 0xc8]
14005ce3c: 4885d2 test rdx, rdx
14005ce3f: 7412 je 0x14005ce53
14005ce41: 41b801000000 mov r8d, 1
14005ce47: 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
14005ce4e: e87d53faff call 0x1400021d0
14005ce53: 4c8d059a6ad505 lea r8, [rip + 0x5d56a9a]
14005ce5a: 488d4db0 lea rcx, [rbp - 0x50]
14005ce5e: 41b908000000 mov r9d, 8
14005ce64: 4889f2 mov rdx, rsi
14005ce67: e864055100 call 0x14056d3d0
14005ce6c: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005ce70: c6859800000001 mov byte ptr [rbp + 0x98], 1
14005ce77: c685c800000001 mov byte ptr [rbp + 0xc8], 1
14005ce7e: 4883f8ff cmp rax, -1
14005ce82: 744e je 0x14005ced2
14005ce84: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14005ce8b: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005ce8f: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005ce93: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
14005ce9a: e851c70000 call 0x1400695f0
14005ce9f: 90 nop
14005cea0: b101 mov cl, 1
14005cea2: 4883fa01 cmp rdx, 1
14005cea6: 7506 jne 0x14005ceae
14005cea8: 803830 cmp byte ptr [rax], 0x30
14005ceab: 0f95c1 setne cl
14005ceae: 888dc8000000 mov byte ptr [rbp + 0xc8], cl
14005ceb4: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
14005cebb: 4885d2 test rdx, rdx
14005cebe: 7412 je 0x14005ced2
14005cec0: 41b801000000 mov r8d, 1
14005cec6: 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
14005cecd: e8fe52faff call 0x1400021d0
14005ced2: 4c8d05236ad505 lea r8, [rip + 0x5d56a23]
14005ced9: 488d4db0 lea rcx, [rbp - 0x50]
14005cedd: 41b909000000 mov r9d, 9
14005cee3: 4889f2 mov rdx, rsi
14005cee6: e8e5045100 call 0x14056d3d0
14005ceeb: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005ceef: 4883f8ff cmp rax, -1
14005cef3: 744e je 0x14005cf43
14005cef5: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14005cefc: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005cf00: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cf04: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
14005cf0b: e8e0c60000 call 0x1400695f0
14005cf10: 90 nop
14005cf11: b101 mov cl, 1
14005cf13: 4883fa01 cmp rdx, 1
14005cf17: 7506 jne 0x14005cf1f
14005cf19: 803830 cmp byte ptr [rax], 0x30
14005cf1c: 0f95c1 setne cl
14005cf1f: 888d98000000 mov byte ptr [rbp + 0x98], cl
14005cf25: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
14005cf2c: 4885d2 test rdx, rdx
14005cf2f: 7412 je 0x14005cf43
14005cf31: 41b801000000 mov r8d, 1
14005cf37: 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
14005cf3e: e88d52faff call 0x1400021d0
14005cf43: 4c8d05bb69d505 lea r8, [rip + 0x5d569bb]
14005cf4a: 488d4db0 lea rcx, [rbp - 0x50]
14005cf4e: 41b907000000 mov r9d, 7
14005cf54: 4889f2 mov rdx, rsi
14005cf57: e874045100 call 0x14056d3d0
14005cf5c: 488b45b0 mov rax, qword ptr [rbp - 0x50]
14005cf60: 4883f8ff cmp rax, -1
14005cf64: 0f8492000000 je 0x14005cffc
14005cf6a: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14005cf71: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
14005cf75: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14005cf79: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
14005cf80: e86bc60000 call 0x1400695f0
14005cf85: 90 nop
14005cf86: 41b101 mov r9b, 1
14005cf89: 4883fa01 cmp rdx, 1
14005cf8d: 7507 jne 0x14005cf96
14005cf8f: 803830 cmp byte ptr [rax], 0x30
14005cf92: 410f95c1 setne r9b
14005cf96: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
14005cf9d: 4885d2 test rdx, rdx
14005cfa0: 744a je 0x14005cfec
14005cfa2: 41b801000000 mov r8d, 1
14005cfa8: 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
14005cfaf: 4889b5b0000000 mov qword ptr [rbp + 0xb0], rsi
14005cfb6: 4489f6 mov esi, r14d
14005cfb9: 4989fe mov r14, rdi
14005cfbc: 4489ef mov edi, r13d
14005cfbf: 4589fd mov r13d, r15d
14005cfc2: 4589e7 mov r15d, r12d
14005cfc5: 4189dc mov r12d, ebx
14005cfc8: 4489cb mov ebx, r9d
14005cfcb: e80052faff call 0x1400021d0
14005cfd0: 4189d9 mov r9d, ebx
14005cfd3: 4489e3 mov ebx, r12d
14005cfd6: 4589fc mov r12d, r15d
14005cfd9: 4589ef mov r15d, r13d
14005cfdc: 4189fd mov r13d, edi
14005cfdf: 4c89f7 mov rdi, r14
14005cfe2: 4189f6 mov r14d, esi
14005cfe5: 488bb5b0000000 mov rsi, qword ptr [rbp + 0xb0]
14005cfec: 0fb607 movzx eax, byte ptr [rdi]
14005cfef: 3c02 cmp al, 2
14005cff1: 44888db0000000 mov byte ptr [rbp + 0xb0], r9b
14005cff8: 7513 jne 0x14005d00d
14005cffa: eb1c jmp 0x14005d018
14005cffc: 41b101 mov r9b, 1
14005cfff: 0fb607 movzx eax, byte ptr [rdi]
14005d002: 3c02 cmp al, 2
14005d004: 44888db0000000 mov byte ptr [rbp + 0xb0], r9b
14005d00b: 740b je 0x14005d018
14005d00d: 4430c8 xor al, r9b
14005d010: a801 test al, 1
14005d012: 0f8411010000 je 0x14005d129
14005d018: 44880f mov byte ptr [rdi], r9b
14005d112: 488b4810 mov rcx, qword ptr [rax + 0x10]
14005d116: 8855b4 mov byte ptr [rbp - 0x4c], dl
14005d119: c745b017000000 mov dword ptr [rbp - 0x50], 0x17
14005d120: 488d55b0 lea rdx, [rbp - 0x50]
14005d124: e87745fbff call 0x1400116a0
1400695f0: 56 push rsi
1400695f1: 57 push rdi
1400695f2: 55 push rbp
1400695f3: 53 push rbx
1400695f4: 4889c8 mov rax, rcx
1400695f7: 4c8d0411 lea r8, [rcx + rdx]
1400695fb: 4885d2 test rdx, rdx
1400695fe: 0f843e010000 je 0x140069742
140069604: 4c8b1575140308 mov r10, qword ptr [rip + 0x8031475]
14006960b: 31d2 xor edx, edx
14006960d: 4989c1 mov r9, rax
140069610: eb27 jmp 0x140069639
14006961e: 41f6c301 test r11b, 1
140069622: 0f8421010000 je 0x140069749
140069628: 0f1f840000000000 nop dword ptr [rax + rax]
140069630: 4d39c1 cmp r9, r8
140069633: 0f8400010000 je 0x140069739
140069639: 4c89ce mov rsi, r9
14006963c: 4889d1 mov rcx, rdx
14006963f: 450fb609 movzx r9d, byte ptr [r9]
140069643: 450fb6d9 movzx r11d, r9b
140069647: 4584db test r11b, r11b
14006964a: 7814 js 0x140069660
14006964c: 4c8d4e01 lea r9, [rsi + 1]
140069650: eb6e jmp 0x1400696c0
140069660: 4489da mov edx, r11d
140069663: 83e21f and edx, 0x1f
140069666: 0fb67e01 movzx edi, byte ptr [rsi + 1]
14006966a: 83e73f and edi, 0x3f
14006966d: 4180fbdf cmp r11b, 0xdf
140069671: 7634 jbe 0x1400696a7
1400696a7: 4c8d4e02 lea r9, [rsi + 2]
1400696ab: c1e206 shl edx, 6
1400696ae: 09fa or edx, edi
1400696b0: 4189d3 mov r11d, edx
1400696b3: eb0b jmp 0x1400696c0
1400696c0: 4c89ca mov rdx, r9
1400696c3: 4829f2 sub rdx, rsi
1400696c6: 4801ca add rdx, rcx
1400696c9: 418d73f7 lea esi, [r11 - 9]
1400696cd: 83fe05 cmp esi, 5
1400696d0: 0f825affffff jb 0x140069630
1400696d6: 4183fb20 cmp r11d, 0x20
1400696da: 0f8450ffffff je 0x140069630
1400696e0: 4181fb85000000 cmp r11d, 0x85
1400696e7: 7260 jb 0x140069749
1400696e9: 4489de mov esi, r11d
1400696ec: c1ee08 shr esi, 8
1400696ef: 83fe1f cmp esi, 0x1f
1400696f2: 7f19 jg 0x14006970d
1400696f4: 85f6 test esi, esi
1400696f6: 7433 je 0x14006972b
14006972b: 450fb6db movzx r11d, r11b
14006972f: 470fb61c1a movzx r11d, byte ptr [r10 + r11]
140069734: e9e5feffff jmp 0x14006961e
140069742: 31d2 xor edx, edx
140069744: 4989c1 mov r9, rax
140069747: 31c9 xor ecx, ecx
140069749: 4d39c1 cmp r9, r8
14006974c: 0f840c010000 je 0x14006985e
140069752: 4c8b1527130308 mov r10, qword ptr [rip + 0x8031327]
140069759: eb1e jmp 0x140069779
140069766: f6c301 test bl, 1
140069769: 0f84e9000000 je 0x140069858
14006976f: 90 nop
140069770: 4d39c1 cmp r9, r8
140069773: 0f84e5000000 je 0x14006985e
140069779: 4d89c3 mov r11, r8
14006977c: 410fbe70ff movsx esi, byte ptr [r8 - 1]
140069781: 85f6 test esi, esi
140069783: 781b js 0x1400697a0
140069785: 4d8d43ff lea r8, [r11 - 1]
140069789: 8d7ef7 lea edi, [rsi - 9]
14006978c: 83ff05 cmp edi, 5
14006978f: 72df jb 0x140069770
140069791: eb69 jmp 0x1400697fc
1400697a0: 410fb67bfe movzx edi, byte ptr [r11 - 2]
1400697a5: 4080ffc0 cmp dil, 0xc0
1400697a9: 7d20 jge 0x1400697cb
1400697cb: 4d8d43fe lea r8, [r11 - 2]
1400697cf: 83e71f and edi, 0x1f
1400697d2: eb0f jmp 0x1400697e3
1400697e3: c1e706 shl edi, 6
1400697e6: 4080e63f and sil, 0x3f
1400697ea: 400fb6f6 movzx esi, sil
1400697ee: 09fe or esi, edi
1400697f0: 8d7ef7 lea edi, [rsi - 9]
1400697f3: 83ff05 cmp edi, 5
1400697f6: 0f8274ffffff jb 0x140069770
1400697fc: 83fe20 cmp esi, 0x20
1400697ff: 0f846bffffff je 0x140069770
140069805: 81fe85000000 cmp esi, 0x85
14006980b: 724b jb 0x140069858
14006980d: 89f7 mov edi, esi
14006980f: c1ef08 shr edi, 8
140069812: 83ff1f cmp edi, 0x1f
140069815: 7f17 jg 0x14006982e
140069817: 85ff test edi, edi
140069819: 742f je 0x14006984a
14006984a: 400fb6f6 movzx esi, sil
14006984e: 410fb61c32 movzx ebx, byte ptr [r10 + rsi]
140069853: e90effffff jmp 0x140069766
140069858: 4c29ca sub rdx, r9
14006985b: 4c01da add rdx, r11
14006985e: 4829ca sub rdx, rcx
140069861: 4801c8 add rax, rcx
140069864: 5b pop rbx
140069865: 5d pop rbp
140069866: 5f pop rdi
140069867: 5e pop rsi
140069868: c3 ret
1458af541: 488b8568050000 mov rax, qword ptr [rbp + 0x568]
1458af548: 4883c010 add rax, 0x10
1458af54c: 48898528050000 mov qword ptr [rbp + 0x528], rax
1458bd380: 55 push rbp
1458bd381: 4157 push r15
1458bd383: 4156 push r14
1458bd385: 4155 push r13
1458bd387: 4154 push r12
1458bd389: 56 push rsi
1458bd38a: 57 push rdi
1458bd38b: 53 push rbx
1458bd38c: b8f8210000 mov eax, 0x21f8
1458bd391: e8dac43400 call 0x145c09870
1458bd396: 4829c4 sub rsp, rax
1458bd399: 488dac2480000000 lea rbp, [rsp + 0x80]
1458bd3a1: 48c78570210000feffffff mov qword ptr [rbp + 0x2170], 0xfffffffffffffffe
1458bd3ac: 4989d1 mov r9, rdx
1458bd3af: 8b02 mov eax, dword ptr [rdx]
1458bd3b1: 83e802 sub eax, 2
1458bd3b4: ba0b000000 mov edx, 0xb
1458bd3b9: 0f43d0 cmovae edx, eax
1458bd3bc: 4889ce mov rsi, rcx
1458bd3bf: 488d0566af3401 lea rax, [rip + 0x134af66]
1458bd3c6: 48630c90 movsxd rcx, dword ptr [rax + rdx*4]
1458bd3ca: 4801c1 add rcx, rax
1458bd3cd: ffe1 jmp rcx
1458bdaa4: 410fb64104 movzx eax, byte ptr [r9 + 4]
1458bdaa9: 888695110000 mov byte ptr [rsi + 0x1195], al
1458bdaaf: 837e1002 cmp dword ptr [rsi + 0x10], 2
1458bdab3: 0f84250e0000 je 0x1458be8de
1458bdab9: 8886dc0a0000 mov byte ptr [rsi + 0xadc], al
1458bdabf: e91a0e0000 jmp 0x1458be8de
1458be756: 488d4610 lea rax, [rsi + 0x10]
1458be75a: 48898560210000 mov qword ptr [rbp + 0x2160], rax
1458be761: 833802 cmp dword ptr [rax], 2
1458be764: 740d je 0x1458be773
1458be773: 488d95900a0000 lea rdx, [rbp + 0xa90]
1458be77a: 41b8e00a0000 mov r8d, 0xae0
1458be780: 488b8d60210000 mov rcx, qword ptr [rbp + 0x2160]
1458be787: e84fbc3400 call 0x145c0a3db
1458bfc98: 410fb68595110000 movzx eax, byte ptr [r13 + 0x1195]
1458bfca0: 88858c0a0000 mov byte ptr [rbp + 0xa8c], al
1458bff73: 488d55c0 lea rdx, [rbp - 0x40]
1458bff77: 41b8e00a0000 mov r8d, 0xae0
1458bff7d: 4889f1 mov rcx, rsi
1458bff80: e856a43400 call 0x145c0a3db
1458c28a0: 55 push rbp
1458c28a1: 4157 push r15
1458c28a3: 4156 push r14
1458c28a5: 56 push rsi
1458c28a6: 57 push rdi
1458c28a7: 53 push rbx
1458c28a8: 4881ecc8000000 sub rsp, 0xc8
1458c28af: 488dac2480000000 lea rbp, [rsp + 0x80]
1458c28b7: 0f297d30 movaps xmmword ptr [rbp + 0x30], xmm7
1458c28bb: 0f297520 movaps xmmword ptr [rbp + 0x20], xmm6
1458c28bf: 48c74518feffffff mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
1458c28c7: 4c89cf mov rdi, r9
1458c28ca: 0f28f2 movaps xmm6, xmm2
1458c28cd: 0f28f9 movaps xmm7, xmm1
1458c28d0: 4889ce mov rsi, rcx
1458c28d3: e828f973fa call 0x140002200
1458c28d8: b920000000 mov ecx, 0x20
1458c28dd: ba01000000 mov edx, 1
1458c28e2: e8d9f873fa call 0x1400021c0
1458c28e7: 4885c0 test rax, rax
1458c28ea: 0f8445020000 je 0x1458c2b35
1458c28f0: c70063000000 mov dword ptr [rax], 0x63
1458c28f6: 48c745b020000000 mov qword ptr [rbp - 0x50], 0x20
1458c28fe: 488945b8 mov qword ptr [rbp - 0x48], rax
1458c2902: 66c745c82402 mov word ptr [rbp - 0x38], 0x224
1458c2908: f30f117804 movss dword ptr [rax + 4], xmm7
1458c290d: 48c745c008000000 mov qword ptr [rbp - 0x40], 8
1458c2915: 488b4db0 mov rcx, qword ptr [rbp - 0x50]
1458c2919: 4883e1fc and rcx, 0xfffffffffffffffc
1458c291d: b808000000 mov eax, 8
1458c2922: 4883f908 cmp rcx, 8
1458c2926: 0f8460010000 je 0x1458c2a8c
1458c292c: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1458c2930: f30f113401 movss dword ptr [rcx + rax], xmm6
1458c2935: 4883c004 add rax, 4
1458c2939: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c293d: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c2941: 48894500 mov qword ptr [rbp], rax
1458c2945: 0fb745c8 movzx eax, word ptr [rbp - 0x38]
1458c2949: 66894508 mov word ptr [rbp + 8], ax
1458c294d: 8b45ca mov eax, dword ptr [rbp - 0x36]
1458c2950: 89450a mov dword ptr [rbp + 0xa], eax
1458c2953: 0fb745ce movzx eax, word ptr [rbp - 0x32]
1458c2957: 6689450e mov word ptr [rbp + 0xe], ax
1458c295b: 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
1458c295f: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
1458c2963: 488b5500 mov rdx, qword ptr [rbp]
1458c2967: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458c296b: 4829d0 sub rax, rdx
1458c296e: 4883f803 cmp rax, 3
1458c2972: 0f8641010000 jbe 0x1458c2ab9
1458c2978: 488b45f8 mov rax, qword ptr [rbp - 8]
1458c297c: c7041006000000 mov dword ptr [rax + rdx], 6
1458c2983: 4883c204 add rdx, 4
1458c2987: 48895500 mov qword ptr [rbp], rdx
1458c298b: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
1458c298f: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2993: 488b4500 mov rax, qword ptr [rbp]
1458c2997: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c299b: 8b4508 mov eax, dword ptr [rbp + 8]
1458c299e: 8945e8 mov dword ptr [rbp - 0x18], eax
1458c29a1: 0fb7450c movzx eax, word ptr [rbp + 0xc]
1458c29a5: 668945ec mov word ptr [rbp - 0x14], ax
1458c29a9: 0fb7450e movzx eax, word ptr [rbp + 0xe]
1458c29ad: 668945ee mov word ptr [rbp - 0x12], ax
1458c29b1: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c29b5: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c29b9: 4829d0 sub rax, rdx
1458c29bc: 4883f803 cmp rax, 3
1458c29c0: 0f861b010000 jbe 0x1458c2ae1
1458c29c6: 488b9da0000000 mov rbx, qword ptr [rbp + 0xa0]
1458c29cd: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c29d1: c7041000000000 mov dword ptr [rax + rdx], 0
1458c29d8: 4883c204 add rdx, 4
1458c29dc: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c29e0: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c29e4: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
1458c29e8: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c29ec: 48894500 mov qword ptr [rbp], rax
1458c29f0: 8b45e8 mov eax, dword ptr [rbp - 0x18]
1458c29f3: 894508 mov dword ptr [rbp + 8], eax
1458c29f6: 0fb745ec movzx eax, word ptr [rbp - 0x14]
1458c29fa: 6689450c mov word ptr [rbp + 0xc], ax
1458c29fe: 0fb745ee movzx eax, word ptr [rbp - 0x12]
1458c2a02: 6689450e mov word ptr [rbp + 0xe], ax
1458c2a06: 4c8b7500 mov r14, qword ptr [rbp]
1458c2a0a: 4c8b7df0 mov r15, qword ptr [rbp - 0x10]
1458c2a0e: 4c89f8 mov rax, r15
1458c2a11: 4c29f0 sub rax, r14
1458c2a14: 4839c3 cmp rbx, rax
1458c2a17: 0f87ec000000 ja 0x1458c2b09
1458c2a1d: 4885db test rbx, rbx
1458c2a20: 7412 je 0x1458c2a34
1458c2a22: 488b4df8 mov rcx, qword ptr [rbp - 8]
1458c2a26: 4c01f1 add rcx, r14
1458c2a29: 4889fa mov rdx, rdi
1458c2a2c: 4989d8 mov r8, rbx
1458c2a2f: e8a7793400 call 0x145c0a3db
1458c2a34: 4901de add r14, rbx
1458c2a37: 4c897500 mov qword ptr [rbp], r14
1458c2a3b: 4d39fe cmp r14, r15
1458c2a3e: 750a jne 0x1458c2a4a
1458c2a4a: 488b45f8 mov rax, qword ptr [rbp - 8]
1458c2a4e: 42c6043000 mov byte ptr [rax + r14], 0
1458c2a53: 49ffc6 inc r14
1458c2a56: 4c897500 mov qword ptr [rbp], r14
1458c2a5a: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
1458c2a5e: 0f1106 movups xmmword ptr [rsi], xmm0
1458c2a61: 488b4500 mov rax, qword ptr [rbp]
1458c2a65: 48894610 mov qword ptr [rsi + 0x10], rax
1458c2a69: 488b4508 mov rax, qword ptr [rbp + 8]
1458c2a6d: 48894618 mov qword ptr [rsi + 0x18], rax
1458c2a71: 4889f0 mov rax, rsi
1458c2a74: 0f287520 movaps xmm6, xmmword ptr [rbp + 0x20]
1458c2a78: 0f287d30 movaps xmm7, xmmword ptr [rbp + 0x30]
1458c2a7c: 4881c4c8000000 add rsp, 0xc8
1458c2a83: 5b pop rbx
1458c2a84: 5f pop rdi
1458c2a85: 5e pop rsi
1458c2a86: 415e pop r14
1458c2a88: 415f pop r15
1458c2a8a: 5d pop rbp
1458c2a8b: c3 ret
1458c2b09: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c2b12: 488d4df0 lea rcx, [rbp - 0x10]
1458c2b16: 41b901000000 mov r9d, 1
1458c2b1c: 4c89f2 mov rdx, r14
1458c2b1f: 4989d8 mov r8, rbx
1458c2b22: e849a93400 call 0x145c0d470
1458c2b27: 90 nop
1458c2b28: 4c8b7df0 mov r15, qword ptr [rbp - 0x10]
1458c2b2c: 4c8b7500 mov r14, qword ptr [rbp]
1458c2b30: e9edfeffff jmp 0x1458c2a22
1458fa7d3: c785f40a000001000000 mov dword ptr [rbp + 0xaf4], 1
1459074a2: 4d85c9 test r9, r9
1459074a5: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
1459074ac: 0f8474030000 je 0x145907826
1459074b2: 4983f901 cmp r9, 1
1459074b6: 0f852d020000 jne 0x1459076e9
1459074bc: 31c9 xor ecx, ecx
1459074be: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
1459074c5: 80bfcc0a000000 cmp byte ptr [rdi + 0xacc], 0
1459074cc: 7445 je 0x145907513
1459074ce: 803f00 cmp byte ptr [rdi], 0
1459074d1: 0f84cb000000 je 0x1459075a2
1459074d7: f30f10874c0a0000 movss xmm0, dword ptr [rdi + 0xa4c]
1459074df: 48394f08 cmp qword ptr [rdi + 8], rcx
1459074e3: 0f85c4000000 jne 0x1459075ad
1459074e9: 80bfcd0a000000 cmp byte ptr [rdi + 0xacd], 0
1459074f0: 0f84b7000000 je 0x1459075ad
1459074f6: 0f28c8 movaps xmm1, xmm0
1459074f9: f30f5c8f700a0000 subss xmm1, dword ptr [rdi + 0xa70]
145907501: 0f2e0dc8eb2f01 ucomiss xmm1, dword ptr [rip + 0x12febc8]
145907508: 0f879f000000 ja 0x1459075ad
14590750e: e913030000 jmp 0x145907826
145907513: 48c70701000000 mov qword ptr [rdi], 1
14590751a: 48894f08 mov qword ptr [rdi + 8], rcx
14590751e: 80bfcd0a000000 cmp byte ptr [rdi + 0xacd], 0
145907525: c687cd0a000000 mov byte ptr [rdi + 0xacd], 0
14590752c: 0f84f4020000 je 0x145907826
145907532: f30f16d1 movshdup xmm2, xmm1
145907536: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14590753f: 488d8da0000000 lea rcx, [rbp + 0xa0]
145907546: 41b901000000 mov r9d, 1
14590754c: e84fb3fbff call 0x1458c28a0
145907551: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145907558: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
14590755f: 750d jne 0x14590756e
14590756e: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
145907575: 4889f1 mov rcx, rsi
145907578: 48c1e105 shl rcx, 5
14590757c: 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
145907583: 0f108db0000000 movups xmm1, xmmword ptr [rbp + 0xb0]
14590758a: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14590758f: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145907593: 48ffc6 inc rsi
145907596: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
14590759d: e984020000 jmp 0x145907826
1459075a2: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
1459075a9: f30f1000 movss xmm0, dword ptr [rax]
1459075ad: 48c70701000000 mov qword ptr [rdi], 1
1459075b4: 48894f08 mov qword ptr [rdi + 8], rcx
1459075b8: f30f1187700a0000 movss dword ptr [rdi + 0xa70], xmm0
1459075c0: c687cd0a000001 mov byte ptr [rdi + 0xacd], 1
1459075c7: 4c39c9 cmp rcx, r9
1459075ca: 0f8382100000 jae 0x145908652
1459075d0: 488d3489 lea rsi, [rcx + rcx*4]
1459075d4: 488b8fa8020000 mov rcx, qword ptr [rdi + 0x2a8]
1459075db: 488b97b0020000 mov rdx, qword ptr [rdi + 0x2b0]
1459075e2: e8d917f9ff call 0x145898dc0
1459075e7: 4869c0f0000000 imul rax, rax, 0xf0
1459075ee: 498b4cf610 mov rcx, qword ptr [r14 + rsi*8 + 0x10]
1459075f3: 4a8b942880000000 mov rdx, qword ptr [rax + r13 + 0x80]
1459075fb: 4839d1 cmp rcx, rdx
1459075fe: 0f835f100000 jae 0x145908663
145907604: 4901c5 add r13, rax
145907607: 498b7d78 mov rdi, qword ptr [r13 + 0x78]
14590760b: 488d1c89 lea rbx, [rcx + rcx*4]
14590760f: 48c1e304 shl rbx, 4
145907613: 488d041f lea rax, [rdi + rbx]
145907617: 4883c020 add rax, 0x20
14590761b: 48898500030000 mov qword ptr [rbp + 0x300], rax
145907622: 488d05b7752e00 lea rax, [rip + 0x2e75b7]
145907629: 48898508030000 mov qword ptr [rbp + 0x308], rax
145907630: 488d1591c82d01 lea rdx, [rip + 0x12dc891]
145907637: 488d8da0000000 lea rcx, [rbp + 0xa0]
14590763e: 4c8d8500030000 lea r8, [rbp + 0x300]
145907645: e8e65a2d00 call 0x145bdd130
14590764a: 488b8da8000000 mov rcx, qword ptr [rbp + 0xa8]
145907651: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
145907658: 4c8b7c1f10 mov r15, qword ptr [rdi + rbx + 0x10]
14590765d: 4c8b641f18 mov r12, qword ptr [rdi + rbx + 0x18]
145907662: 48898d10040000 mov qword ptr [rbp + 0x410], rcx
145907669: e862670800 call 0x14598ddd0
14590766e: 90 nop
14590766f: 4889c3 mov rbx, rax
145907672: 4889d7 mov rdi, rdx
145907675: 498d34f6 lea rsi, [r14 + rsi*8]
145907679: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
145907680: 4885d2 test rdx, rdx
145907683: 4c8bb538040000 mov r14, qword ptr [rbp + 0x438]
14590768a: 7412 je 0x14590769e
14590768c: 41b801000000 mov r8d, 1
145907692: 488b8d10040000 mov rcx, qword ptr [rbp + 0x410]
145907699: e832ab6ffa call 0x1400021d0
14590769e: 4885db test rbx, rbx
1459076a1: 4c0f45fb cmovne r15, rbx
1459076a5: 490f44fc cmove rdi, r12
1459076a9: 4c89bd80020000 mov qword ptr [rbp + 0x280], r15
1459076b0: 4889bd88020000 mov qword ptr [rbp + 0x288], rdi
1459076b7: 48833e00 cmp qword ptr [rsi], 0
1459076bb: 488d05fea96ffa lea rax, [rip - 0x5905602]
1459076c2: 488d8d80020000 lea rcx, [rbp + 0x280]
1459076c9: 0f848d000000 je 0x14590775c
1459076cf: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
1459076d6: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
1459076dd: 488d15b4453001 lea rdx, [rip + 0x13045b4]
1459076e4: e988000000 jmp 0x145907771
1459076e9: 498d5628 lea rdx, [r14 + 0x28]
1459076ed: 4883c0d8 add rax, -0x28
1459076f1: 48c1e803 shr rax, 3
1459076f5: 49b8cdcccccccccccccc movabs r8, 0xcccccccccccccccd
1459076ff: 4c0fafc0 imul r8, rax
145907703: 49f7d8 neg r8
145907706: b801000000 mov eax, 1
14590770b: 4531d2 xor r10d, r10d
14590770e: 4d89f3 mov r11, r14
145907711: eb1e jmp 0x145907731
145907713: 498d3c00 lea rdi, [r8 + rax]
145907717: 48ffc7 inc rdi
14590771a: 48ffc0 inc rax
14590771d: 4883c228 add rdx, 0x28
145907721: 4989f3 mov r11, rsi
145907724: 4989ca mov r10, rcx
145907727: 4883ff01 cmp rdi, 1
14590772b: 0f848dfdffff je 0x1459074be
145907731: 418b4b24 mov ecx, dword ptr [r11 + 0x24]
145907735: 8b7224 mov esi, dword ptr [rdx + 0x24]
145907738: 89cf mov edi, ecx
14590773a: c1ff1f sar edi, 0x1f
14590773d: d1ef shr edi, 1
14590773f: 31cf xor edi, ecx
145907741: 89f3 mov ebx, esi
145907743: c1fb1f sar ebx, 0x1f
145907746: d1eb shr ebx, 1
145907748: 31f3 xor ebx, esi
14590774a: 4889d6 mov rsi, rdx
14590774d: 4889c1 mov rcx, rax
145907750: 39df cmp edi, ebx
145907752: 7fbf jg 0x145907713
145907754: 4c89de mov rsi, r11
145907757: 4c89d1 mov rcx, r10
14590775a: ebb7 jmp 0x145907713
14590775c: 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
145907763: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14590776a: 488d1535453001 lea rdx, [rip + 0x1304535]
145907771: 488d8d00030000 lea rcx, [rbp + 0x300]
145907778: 4c8d85a0000000 lea r8, [rbp + 0xa0]
14590777f: e8ac592d00 call 0x145bdd130
145907784: f30f104e18 movss xmm1, dword ptr [rsi + 0x18]
145907789: f30f10561c movss xmm2, dword ptr [rsi + 0x1c]
14590778e: 4c8b8d08030000 mov r9, qword ptr [rbp + 0x308]
145907795: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
14590779c: 4889442420 mov qword ptr [rsp + 0x20], rax
1459077a1: 488d8da0000000 lea rcx, [rbp + 0xa0]
1459077a8: 4c898d10040000 mov qword ptr [rbp + 0x410], r9
1459077af: e8ecb0fbff call 0x1458c28a0
1459077b4: 90 nop
1459077b5: 498bb630060000 mov rsi, qword ptr [r14 + 0x630]
1459077bc: 493bb620060000 cmp rsi, qword ptr [r14 + 0x620]
1459077c3: 750d jne 0x1459077d2
1459077d2: 498b8628060000 mov rax, qword ptr [r14 + 0x628]
1459077d9: 4889f1 mov rcx, rsi
1459077dc: 48c1e105 shl rcx, 5
1459077e0: 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
1459077e7: 0f108db0000000 movups xmm1, xmmword ptr [rbp + 0xb0]
1459077ee: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1459077f3: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1459077f7: 48ffc6 inc rsi
1459077fa: 4989b630060000 mov qword ptr [r14 + 0x630], rsi
145907801: 488b9500030000 mov rdx, qword ptr [rbp + 0x300]
145907808: 4885d2 test rdx, rdx
14590780b: 7412 je 0x14590781f
14590780d: 41b801000000 mov r8d, 1
145907813: 488b8d10040000 mov rcx, qword ptr [rbp + 0x410]
14590781a: e8b1a96ffa call 0x1400021d0
14590781f: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
