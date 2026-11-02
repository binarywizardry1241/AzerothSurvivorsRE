1459eabc0 4156 push r14
1459eabc2 56 push rsi
1459eabc3 57 push rdi
1459eabc4 53 push rbx
1459eabc5 4883ec28 sub rsp, 0x28
1459eabc9 4885d2 test rdx, rdx
1459eabcc 7478 je 0x1459eac46
1459eabce 4989d2 mov r10, rdx
1459eabd1 4989c9 mov r9, rcx
1459eabd4 4889d0 mov rax, rdx
1459eabd7 48c1e820 shr rax, 0x20
1459eabdb 4d8b18 mov r11, qword ptr [r8]
1459eabde 756a jne 0x1459eac4a
1459eabe0 410fbdca bsr ecx, r10d
1459eabe4 f7d1 not ecx
1459eabe6 4489d0 mov eax, r10d
1459eabe9 d3e0 shl eax, cl
1459eabeb ffc8 dec eax
1459eabed 498b7818 mov rdi, qword ptr [r8 + 0x18]
1459eabf1 498b7008 mov rsi, qword ptr [r8 + 8]
1459eabf5 498b4810 mov rcx, qword ptr [r8 + 0x10]
1459eabf9 0f1f8000000000 nop dword ptr [rax]
1459eac00 498d143b lea rdx, [r11 + rdi]
1459eac04 48c1c217 rol rdx, 0x17
1459eac08 4c01da add rdx, r11
1459eac0b 4889f3 mov rbx, rsi
1459eac0e 48c1e311 shl rbx, 0x11
1459eac12 4c31d9 xor rcx, r11
1459eac15 4831f7 xor rdi, rsi
1459eac18 4831ce xor rsi, rcx
1459eac1b 4931fb xor r11, rdi
1459eac1e 48c1c72d rol rdi, 0x2d
1459eac22 4831d9 xor rcx, rbx
1459eac25 48c1ea20 shr rdx, 0x20
1459eac29 490fafd2 imul rdx, r10
1459eac2d 39d0 cmp eax, edx
1459eac2f 72cf jb 0x1459eac00
1459eac31 4d8918 mov qword ptr [r8], r11
1459eac34 49897818 mov qword ptr [r8 + 0x18], rdi
1459eac38 49897008 mov qword ptr [r8 + 8], rsi
1459eac3c 49894810 mov qword ptr [r8 + 0x10], rcx
1459eac40 48c1ea20 shr rdx, 0x20
1459eac44 eb66 jmp 0x1459eacac
1459eac46 31c0 xor eax, eax
1459eac48 eb6b jmp 0x1459eacb5
1459eac4a 490fbdca bsr rcx, r10
1459eac4e f7d1 not ecx
1459eac50 4c89d6 mov rsi, r10
1459eac53 48d3e6 shl rsi, cl
1459eac56 48ffce dec rsi
1459eac59 498b5818 mov rbx, qword ptr [r8 + 0x18]
1459eac5d 498b7808 mov rdi, qword ptr [r8 + 8]
1459eac61 498b4810 mov rcx, qword ptr [r8 + 0x10]
1459eac65 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459eac70 498d041b lea rax, [r11 + rbx]
1459eac74 48c1c017 rol rax, 0x17
1459eac78 4c01d8 add rax, r11
1459eac7b 4989fe mov r14, rdi
1459eac7e 49c1e611 shl r14, 0x11
1459eac82 4c31d9 xor rcx, r11
1459eac85 4831fb xor rbx, rdi
1459eac88 4931db xor r11, rbx
1459eac8b 48c1c32d rol rbx, 0x2d
1459eac8f 4831cf xor rdi, rcx
1459eac92 49f7e2 mul r10
1459eac95 4c31f1 xor rcx, r14
1459eac98 4839c6 cmp rsi, rax
1459eac9b 72d3 jb 0x1459eac70
1459eac9d 4d8918 mov qword ptr [r8], r11
1459eaca0 49895818 mov qword ptr [r8 + 0x18], rbx
1459eaca4 49897808 mov qword ptr [r8 + 8], rdi
1459eaca8 49894810 mov qword ptr [r8 + 0x10], rcx
1459eacac 4c39d2 cmp rdx, r10
1459eacaf 730e jae 0x1459eacbf
1459eacb1 498d04d1 lea rax, [r9 + rdx*8]
1459eacb5 4883c428 add rsp, 0x28
1459eacb9 5b pop rbx
1459eacba 5f pop rdi
1459eacbb 5e pop rsi
1459eacbc 415e pop r14
1459eacbe c3 ret
1459eacbf 4c8d05ca9c8501 lea r8, [rip + 0x1859cca]
1459eacc6 4889d1 mov rcx, rdx
1459eacc9 4c89d2 mov rdx, r10
1459eaccc e8b2eb3b00 call 0x145da9883
1459eacd1 0f0b ud2
