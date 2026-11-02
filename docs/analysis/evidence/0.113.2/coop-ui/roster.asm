14003a850 push r15
14003a852 push r14
14003a854 push r13
14003a856 push r12
14003a858 push rsi
14003a859 push rdi
14003a85a push rbp
14003a85b push rbx
14003a85c sub rsp, 0x4b8
14003a863 movaps xmmword ptr [rsp + 0x4a0], xmm15
14003a86c movaps xmmword ptr [rsp + 0x490], xmm14
14003a875 movaps xmmword ptr [rsp + 0x480], xmm13
14003a87e movaps xmmword ptr [rsp + 0x470], xmm12
14003a887 movaps xmmword ptr [rsp + 0x460], xmm11
14003a890 movaps xmmword ptr [rsp + 0x450], xmm10
14003a899 movaps xmmword ptr [rsp + 0x440], xmm9
14003a8a2 movaps xmmword ptr [rsp + 0x430], xmm8
14003a8ab movaps xmmword ptr [rsp + 0x420], xmm7
14003a8b3 movaps xmmword ptr [rsp + 0x410], xmm6
14003a8bb mov rdi, r9
14003a8be mov qword ptr [rsp + 0x90], r8
14003a8c6 mov rsi, rdx
14003a8c9 mov r14, rcx
14003a8cc cmp qword ptr [r9 + 0x58], 0
14003a8d1 mov qword ptr [rsp + 0x38], rdx
14003a8d6 mov qword ptr [rsp + 0x48], r9
14003a8db je 0x14003aaf1
14003a8e1 xorps xmm0, xmm0
14003a8e4 movaps xmmword ptr [rsp + 0x140], xmm0
14003a8ec movaps xmmword ptr [rsp + 0x130], xmm0
14003a8f4 movaps xmmword ptr [rsp + 0x120], xmm0
14003a8fc movaps xmmword ptr [rsp + 0x110], xmm0
14003a904 movaps xmmword ptr [rsp + 0x100], xmm0
14003a90c mov qword ptr [rsp + 0x150], 0
14003a918 movups xmm0, xmmword ptr [rip + 0x5e8bf39]
14003a91f movups xmmword ptr [rsp + 0x158], xmm0
14003a927 movups xmm0, xmmword ptr [rip + 0x5e8bf3a]
14003a92e movups xmmword ptr [rsp + 0x168], xmm0
14003a936 movups xmm0, xmmword ptr [rip + 0x5e8bf3b]
14003a93d movups xmmword ptr [rsp + 0x178], xmm0
14003a945 movups xmm0, xmmword ptr [rip + 0x5e8bf3c]
14003a94c movups xmmword ptr [rsp + 0x188], xmm0
14003a954 movups xmm0, xmmword ptr [rip + 0x5e8bf3d]
14003a95b movups xmmword ptr [rsp + 0x198], xmm0
14003a963 movups xmm0, xmmword ptr [rip + 0x5e8bf3e]
14003a96a movups xmmword ptr [rsp + 0x1a8], xmm0
14003a972 movups xmm0, xmmword ptr [rip + 0x5e8bf4f]
14003a979 movups xmmword ptr [rsp + 0x1c8], xmm0
14003a981 movups xmm0, xmmword ptr [rip + 0x5e8bf30]
14003a988 movups xmmword ptr [rsp + 0x1b8], xmm0
14003a990 movups xmm0, xmmword ptr [rip + 0x5e8be09]
14003a997 movaps xmmword ptr [rsp + 0xa0], xmm0
14003a99f mov qword ptr [rsp + 0xb0], 0
14003a9ab movups xmm0, xmmword ptr [rip + 0x5e8be06]
14003a9b2 movups xmmword ptr [rsp + 0xb8], xmm0
14003a9ba mov qword ptr [rsp + 0xc8], 0
14003a9c6 movups xmm0, xmmword ptr [rip + 0x5e8be03]
14003a9cd movaps xmmword ptr [rsp + 0xd0], xmm0
14003a9d5 mov qword ptr [rsp + 0xe0], 0
14003a9e1 movups xmm0, xmmword ptr [rip + 0x5e8be00]
14003a9e8 movups xmmword ptr [rsp + 0xe8], xmm0
14003a9f0 mov qword ptr [rsp + 0xf8], 0
14003a9fc mov rdi, qword ptr [r14]
14003a9ff lea rsi, [r14 + 8]
14003aa03 lea rcx, [rsp + 0x228]
14003aa0b lea rdx, [rsp + 0xa0]
14003aa13 mov r8d, 0x138
14003aa19 call 0x145cf998b
14003aa1e movaps xmm0, xmmword ptr [rip + 0x5e6760b]
14003aa25 movups xmmword ptr [rsp + 0x360], xmm0
14003aa2d mov dword ptr [rsp + 0x370], 1
14003aa38 movss xmm0, dword ptr [rip + 0x5e67648]
14003aa40 movlps qword ptr [rsp + 0x374], xmm0
14003aa48 mov byte ptr [rsp + 0x37c], 1
14003aa50 mov qword ptr [rsp + 0x380], 0
14003aa5c mov dword ptr [rsp + 0x388], 0x3f800000
14003aa67 mov word ptr [rsp + 0x38c], 0
14003aa71 mov dword ptr [rsp + 0x38e], 0x10000
14003aa7c mov word ptr [rsp + 0x392], 0
14003aa86 mov dword ptr [rsp + 0x394], 0x10000
14003aa91 mov word ptr [rsp + 0x398], 0
14003aa9b mov qword ptr [rsp + 0x39a], 0
14003aaa7 mov dword ptr [rsp + 0x3a2], 0x5000005
14003aab2 mov qword ptr [rsp + 0x220], rdi
14003aaba lea r9, [rip + 0x5eb7b07]
14003aac1 lea rdi, [rsp + 0x50]
14003aac6 lea r8, [rsp + 0x220]
14003aace mov rcx, rdi
14003aad1 mov rdx, rsi
14003aad4 mov rsi, qword ptr [rsp + 0x38]
14003aad9 call 0x1402628b0
14003aade mov rcx, rdi
14003aae1 mov rdi, qword ptr [rsp + 0x48]
14003aae6 mov rdx, rsi
14003aae9 mov r8, rdi
14003aaec call 0x14029c3c0
14003aaf1 mov word ptr [rsp + 0x204], 0
14003aafb mov byte ptr [rsp + 0x1f4], 1
14003ab03 xorps xmm0, xmm0
14003ab06 movups xmmword ptr [rsp + 0x108], xmm0
14003ab0e movups xmmword ptr [rsp + 0x118], xmm0
14003ab16 movabs rax, 0x42c8000000000002
14003ab20 mov qword ptr [rsp + 0x128], rax
14003ab28 mov qword ptr [rsp + 0x100], 0
14003ab34 movaps xmmword ptr [rsp + 0x130], xmm0
14003ab3c movaps xmmword ptr [rsp + 0x140], xmm0
14003ab44 mov qword ptr [rsp + 0x150], 0
14003ab50 mov dword ptr [rsp + 0x218], 0
14003ab5b mov word ptr [rsp + 0x21c], 0
14003ab65 movups xmm0, xmmword ptr [rip + 0x5e8bcec]
14003ab6c movups xmmword ptr [rsp + 0x158], xmm0
14003ab74 movups xmm0, xmmword ptr [rip + 0x5e8bced]
14003ab7b movups xmmword ptr [rsp + 0x168], xmm0
14003ab83 movups xmm0, xmmword ptr [rip + 0x5e8bcee]
14003ab8a movups xmmword ptr [rsp + 0x178], xmm0
14003ab92 movups xmm0, xmmword ptr [rip + 0x5e8bcef]
14003ab99 movups xmmword ptr [rsp + 0x188], xmm0
14003aba1 movups xmm0, xmmword ptr [rip + 0x5e8bd00]
14003aba8 movups xmmword ptr [rsp + 0x1a8], xmm0
14003abb0 movups xmm0, xmmword ptr [rip + 0x5e8bce1]
14003abb7 movups xmmword ptr [rsp + 0x198], xmm0
14003abbf movups xmm0, xmmword ptr [rip + 0x5e8bd02]
14003abc6 movups xmmword ptr [rsp + 0x1c8], xmm0
14003abce movups xmm0, xmmword ptr [rip + 0x5e8bce3]
14003abd5 movups xmmword ptr [rsp + 0x1b8], xmm0
14003abdd mov word ptr [rsp + 0x216], 0
14003abe7 mov dword ptr [rsp + 0x212], 0
14003abf2 mov qword ptr [rsp + 0x1f8], 0
14003abfe mov dword ptr [rsp + 0x200], 0x3f800000
14003ac09 movaps xmm0, xmmword ptr [rip + 0x5e67420]
14003ac10 movups xmmword ptr [rsp + 0x1d8], xmm0
14003ac18 mov dword ptr [rsp + 0x1e8], 1
14003ac23 mov qword ptr [rsp + 0x1ec], 0
14003ac2f movups xmm0, xmmword ptr [rip + 0x5e8bb6a]
14003ac36 movaps xmmword ptr [rsp + 0xa0], xmm0
14003ac3e mov qword ptr [rsp + 0xb0], 0
14003ac4a movups xmm10, xmmword ptr [rip + 0x5e8bb66]
14003ac52 movups xmmword ptr [rsp + 0xb8], xmm10
14003ac5b mov qword ptr [rsp + 0xc8], 0
14003ac67 movups xmm11, xmmword ptr [rip + 0x5e8bb61]
14003ac6f movaps xmmword ptr [rsp + 0xd0], xmm11
14003ac78 mov qword ptr [rsp + 0xe0], 0
14003ac84 movups xmm12, xmmword ptr [rip + 0x5e8bb5c]
14003ac8c movups xmmword ptr [rsp + 0xe8], xmm12
14003ac95 mov qword ptr [rsp + 0xf8], 0
14003aca1 mov word ptr [rsp + 0x20a], 0
14003acab mov dword ptr [rsp + 0x206], 0x10000
14003acb6 mov word ptr [rsp + 0x210], 0
14003acc0 mov dword ptr [rsp + 0x20c], 0x10000
14003accb movups xmm0, xmmword ptr [rip + 0x5e8bc4e]
14003acd2 movaps xmmword ptr [rsp + 0x50], xmm0
14003acd7 mov dword ptr [rsp + 0x60], 0x3f800000
14003acdf lea rcx, [rsp + 0x228]
14003ace7 lea rdx, [rsp + 0xa0]
14003acef lea r8, [rsp + 0x50]
14003acf4 call 0x1400de820
14003acf9 mov rax, qword ptr [r14]
14003acfc lea rdx, [r14 + 8]
14003ad00 mov qword ptr [rsp + 0x220], rax
14003ad08 lea r9, [rip + 0x5eb78b9]
14003ad0f lea rcx, [rsp + 0xa0]
14003ad17 lea r8, [rsp + 0x220]
14003ad1f mov qword ptr [rsp + 0x40], rdx
14003ad24 call 0x140266740
14003ad29 movzx eax, byte ptr [rdi + 0x11a]
14003ad30 test al, al
14003ad32 je 0x14003ad4a
14003ad34 movzx ecx, al
14003ad37 cmp al, 5
14003ad39 mov eax, 5
14003ad3e cmovb eax, ecx
14003ad41 test al, al
14003ad43 jne 0x14003ad54
14003ad45 jmp 0x14003b0f9
14003ad4a mov al, 1
14003ad4c test al, al
14003ad4e je 0x14003b0f9
14003ad54 movzx eax, al
14003ad57 mov qword ptr [rsp + 0x80], rax
14003ad5f lea rbx, [rsp + 0xb8]
14003ad67 lea r13, [rsp + 0x290]
14003ad6f xor ebp, ebp
14003ad71 xorps xmm13, xmm13
14003ad75 movaps xmm14, xmmword ptr [rip + 0x5e672c3]
14003ad7d movaps xmm15, xmmword ptr [rip + 0x5e6733b]
14003ad85 movaps xmm6, xmmword ptr [rip + 0x5e672d4]
14003ad8c movaps xmm7, xmmword ptr [rip + 0x5e672dd]
14003ad93 movss xmm8, dword ptr [rip + 0x5e672ec]
14003ad9c lea r10, [rsp + 0x50]
14003ada1 lea r8, [rsp + 0x220]
14003ada9 movups xmm9, xmmword ptr [rip + 0x5e8bc87]
14003adb1 mov qword ptr [rsp + 0x88], r14
14003adb9 nop dword ptr [rax]
14003adc0 mov qword ptr [rsp + 0x98], rbp
14003adc8 movups xmmword ptr [r13 + 0x10], xmm13
14003adcd movups xmmword ptr [r13], xmm13
14003add2 mov qword ptr [r13 + 0x20], 0
14003adda movups xmmword ptr [r13 + 0x40], xmm13
14003addf movups xmmword ptr [r13 + 0x30], xmm13
14003ade4 movups xmm0, xmmword ptr [rip + 0x5e8b9b5]
14003adeb movaps xmmword ptr [rsp + 0xa0], xmm0
14003adf3 mov qword ptr [rsp + 0xb0], 0
14003adff movups xmmword ptr [rbx], xmm10
14003ae03 mov qword ptr [rbx + 0x10], 0
14003ae0b movups xmmword ptr [rbx + 0x18], xmm11
14003ae10 mov qword ptr [rbx + 0x28], 0
14003ae18 movups xmmword ptr [rbx + 0x30], xmm12
14003ae1d mov qword ptr [rbx + 0x40], 0
14003ae25 mov rax, qword ptr [r14]
14003ae28 movaps xmm0, xmmword ptr [rsp + 0xf0]
14003ae30 lea r9, [rsp + 0x228]
14003ae38 movups xmmword ptr [r9 + 0x50], xmm0
14003ae3d movaps xmm0, xmmword ptr [rsp + 0xe0]
14003ae45 movups xmmword ptr [r9 + 0x40], xmm0
14003ae4a movaps xmm0, xmmword ptr [rsp + 0xa0]
14003ae52 mov rcx, qword ptr [rsp + 0xb0]
14003ae5a mov rdx, qword ptr [rsp + 0xb8]
14003ae62 movaps xmm1, xmmword ptr [rsp + 0xc0]
14003ae6a movaps xmm2, xmmword ptr [rsp + 0xd0]
14003ae72 movups xmmword ptr [r9 + 0x30], xmm2
14003ae77 movups xmmword ptr [r9 + 0x20], xmm1
14003ae7c mov qword ptr [r9 + 0x10], rcx
14003ae80 mov qword ptr [r9 + 0x18], rdx
14003ae84 movups xmmword ptr [r9], xmm0
14003ae88 mov qword ptr [rsp + 0x288], 0
14003ae94 movabs rcx, 0x4230000000000001
14003ae9e mov qword ptr [rsp + 0x2b8], rcx
14003aea6 movups xmm0, xmmword ptr [rip + 0x5e8b9bb]
14003aead movups xmmword ptr [r13 + 0x60], xmm0
14003aeb2 movups xmm0, xmmword ptr [rip + 0x5e8b99f]
14003aeb9 movups xmmword ptr [r13 + 0x50], xmm0
14003aebe movups xmmword ptr [rsp + 0x300], xmm14
14003aec7 movups xmmword ptr [rsp + 0x310], xmm15
14003aed0 movups xmmword ptr [rsp + 0x320], xmm6
14003aed8 movups xmmword ptr [rsp + 0x330], xmm6
14003aee0 movups xmmword ptr [rsp + 0x340], xmm7
14003aee8 movups xmmword ptr [rsp + 0x350], xmm7
14003aef0 movaps xmm0, xmmword ptr [rip + 0x5e67139]
14003aef7 movups xmmword ptr [rsp + 0x360], xmm0
14003aeff mov dword ptr [rsp + 0x370], 1
14003af0a movlps qword ptr [rsp + 0x374], xmm8
14003af13 mov byte ptr [rsp + 0x37c], 1
14003af1b mov qword ptr [rsp + 0x380], 0
14003af27 mov dword ptr [rsp + 0x388], 0x3f800000
14003af32 mov word ptr [rsp + 0x38c], 0
14003af3c mov dword ptr [r13 + 0xfe], 0x10000
14003af47 mov word ptr [r13 + 0x102], 0
14003af51 mov word ptr [r13 + 0x108], 0
14003af5b mov dword ptr [r13 + 0x104], 0x10000
14003af66 mov qword ptr [rsp + 0x39a], 0
14003af72 mov dword ptr [rsp + 0x3a2], 5
14003af7d mov qword ptr [rsp + 0x220], rax
14003af85 mov r15, r10
14003af88 mov rcx, r10
14003af8b mov rdx, qword ptr [rsp + 0x40]
14003af90 mov r12, r8
14003af93 lea r9, [rip + 0x5eb762e]
14003af9a call 0x1402628b0
14003af9f movaps xmmword ptr [rsp + 0x3c0], xmm9
14003afa8 mov dword ptr [rsp + 0x3d0], 0x3f800000
14003afb3 lea rax, [rsp + 0x3d4]
14003afbb movups xmmword ptr [rax], xmm9
14003afbf mov dword ptr [rax + 0x10], 0x3f800000
14003afc6 movups xmmword ptr [rax + 0x14], xmm9
14003afcb mov dword ptr [rax + 0x24], 0x3f800000
14003afd2 movups xmmword ptr [rax + 0x28], xmm9
14003afd7 mov dword ptr [rax + 0x38], 0x3f800000
14003afde mov rsi, qword ptr [rsp + 0x68]
14003afe3 test rsi, rsi
14003afe6 jne 0x14003afed
14003afe8 mov rsi, qword ptr [rsp + 0x70]
14003afed mov rdi, qword ptr [rsp + 0x50]
14003aff2 mov rax, qword ptr [rsi]
14003aff5 mov r14, qword ptr [rsi + 0x10]
14003aff9 sub rax, r14
14003affc cmp rax, 0x67
14003b000 jbe 0x14003b0d4
14003b006 inc rbp
14003b009 mov rax, qword ptr [rsi + 8]
14003b00d lea rcx, [rip + 0x2d682c]
14003b014 mov qword ptr [rax + r14], rcx
14003b018 mov qword ptr [rax + r14 + 8], rdi
14003b01d movaps xmm0, xmmword ptr [rsp + 0x3c0]
14003b025 movaps xmm1, xmmword ptr [rsp + 0x3d0]
14003b02d movaps xmm2, xmmword ptr [rsp + 0x3e0]
14003b035 movaps xmm3, xmmword ptr [rsp + 0x3f0]
14003b03d movups xmmword ptr [rax + r14 + 0x10], xmm0
14003b043 movups xmmword ptr [rax + r14 + 0x20], xmm1
14003b049 movups xmmword ptr [rax + r14 + 0x30], xmm2
14003b04f movups xmmword ptr [rax + r14 + 0x40], xmm3
14003b055 movaps xmm0, xmmword ptr [rsp + 0x400]
14003b05d movups xmmword ptr [rax + r14 + 0x50], xmm0
14003b063 mov byte ptr [rax + r14 + 0x60], 0
14003b069 add r14, 0x68
14003b06d mov qword ptr [rsi + 0x10], r14
14003b071 mov rdi, qword ptr [rsp + 0x48]
14003b076 mov qword ptr [rsp + 0x220], rdi
14003b07e lea rax, [rsp + 0x98]
14003b086 mov qword ptr [rsp + 0x228], rax
14003b08e mov rax, qword ptr [rsp + 0x90]
14003b096 mov qword ptr [rsp + 0x230], rax
14003b09e mov rsi, qword ptr [rsp + 0x38]
14003b0a3 mov qword ptr [rsp + 0x238], rsi
14003b0ab mov rcx, r15
14003b0ae mov rdx, r12
14003b0b1 call 0x14029c700
14003b0b6 mov r8, r12
14003b0b9 mov r10, r15
14003b0bc cmp qword ptr [rsp + 0x80], rbp
14003b0c4 mov r14, qword ptr [rsp + 0x88]
14003b0cc jne 0x14003adc0
14003b0d2 jmp 0x14003b0f9
14003b0d4 mov qword ptr [rsp + 0x20], 1
14003b0dd mov r8d, 0x68
14003b0e3 mov r9d, 1
14003b0e9 mov rcx, rsi
14003b0ec mov rdx, r14
14003b0ef call 0x145cf9da0
14003b0f4 jmp 0x14003b006
14003b0f9 cmp qword ptr [rdi + 0x40], 4
14003b0fe jne 0x14003b10c
14003b100 mov rax, qword ptr [rdi + 0x38]
14003b104 cmp dword ptr [rax], 0x74736f68
14003b10a je 0x14003b135
14003b10c lea rcx, [rip + 0x5e8b890] # 145ec69a3 b'Waiting for the host to enter the zone. Your hero is the one on your picker.Close this window and enter the zone: everyone in the party comes along.'
14003b113 mov edx, 0x4c
14003b118 call 0x145895670
14003b11d mov rdi, rdx
14003b120 test rdx, rdx
14003b123 jns 0x14003b14e
14003b125 xor r14d, r14d
14003b128 mov rcx, r14
14003b12b mov rdx, rdi
14003b12e call 0x145e9bd8b
14003b133 ud2
14003b135 lea rcx, [rip + 0x5e8b8b3] # 145ec69ef b'Close this window and enter the zone: everyone in the party comes along.'
14003b13c mov edx, 0x48
14003b141 call 0x145895670
14003b146 mov rdi, rdx
14003b149 test rdx, rdx
14003b14c js 0x14003b125
14003b14e je 0x14003b1ab
14003b150 mov r15, r14
14003b153 mov rsi, rax
14003b156 call 0x140002200
14003b15b mov r14d, 1
14003b161 mov edx, 1
14003b166 mov rcx, rdi
14003b169 call 0x1400021c0
14003b16e test rax, rax
14003b171 je 0x14003b128
14003b173 mov rbx, rax
14003b176 mov rcx, rax
14003b179 mov rdx, rsi
14003b17c mov r8, rdi
14003b17f call 0x145cf998b
14003b184 mov r14, r15
14003b187 mov rsi, qword ptr [rsp + 0x38]
14003b18c cmp byte ptr [rsi], 1
14003b18f jne 0x14003b1b5
14003b191 mov eax, dword ptr [rsi + 1]
14003b194 mov ecx, dword ptr [rsi + 4]
14003b197 mov dword ptr [rsp + 0x33], ecx
14003b19b mov dword ptr [rsp + 0x30], eax
14003b19f mov rax, qword ptr [rsi + 8]
14003b1a3 movzx ecx, byte ptr [rsi + 0x10]
14003b1a7 mov dl, 1
14003b1a9 jmp 0x14003b1c5
14003b1ab mov ebx, 1
14003b1b0 cmp byte ptr [rsi], 1
14003b1b3 je 0x14003b191
14003b1b5 mov rax, qword ptr [rsi + 8]
14003b1b9 lock inc qword ptr [rax]
14003b1bd jle 0x14003b340
14003b1c3 xor edx, edx
14003b1c5 movups xmm0, xmmword ptr [rip + 0x5e8ad64]
14003b1cc movups xmmword ptr [rsp + 0x51], xmm0
14003b1d1 mov dword ptr [rsp + 0x61], 0x3f800000
14003b1d9 mov r8, qword ptr [r14]
14003b1dc mov qword ptr [rsp + 0x228], rdi
14003b1e4 mov qword ptr [rsp + 0x230], rbx
14003b1ec mov qword ptr [rsp + 0x238], rdi
14003b1f4 mov qword ptr [rsp + 0x240], 0
14003b200 mov qword ptr [rsp + 0x248], 4
14003b20c mov qword ptr [rsp + 0x250], 0
14003b218 mov byte ptr [rsp + 0x258], dl
14003b21f mov edx, dword ptr [rsp + 0x30]
14003b223 mov r9d, dword ptr [rsp + 0x33]
14003b228 mov dword ptr [rsp + 0x259], edx
14003b22f mov dword ptr [rsp + 0x25c], r9d
14003b237 mov qword ptr [rsp + 0x260], rax
14003b23f mov qword ptr [rsp + 0x268], rcx
14003b247 mov dword ptr [rsp + 0x270], 0x41600000
14003b252 mov word ptr [rsp + 0x274], 0x190
14003b25c mov byte ptr [rsp + 0x276], 1
14003b264 movups xmm0, xmmword ptr [rsp + 0x50]
14003b269 movups xmmword ptr [rsp + 0x277], xmm0
14003b271 mov rax, qword ptr [rsp + 0x5d]
14003b276 mov qword ptr [rsp + 0x284], rax
14003b27e mov eax, dword ptr [rip + 0x5e94654]
14003b284 mov dword ptr [rsp + 0x29c], eax
14003b28b movups xmm0, xmmword ptr [rip + 0x5e94636]
14003b292 movups xmmword ptr [rsp + 0x28c], xmm0
14003b29a movsd xmm0, qword ptr [rip + 0x5e66e2e]
14003b2a2 movsd qword ptr [rsp + 0x2a0], xmm0
14003b2ab mov qword ptr [rsp + 0x220], r8
14003b2b3 lea r9, [rip + 0x5eb730e]
14003b2ba lea rcx, [rsp + 0xa0]
14003b2c2 lea r8, [rsp + 0x220]
14003b2ca mov rdx, qword ptr [rsp + 0x40]
14003b2cf call 0x140278cc0
14003b2d4 movaps xmm6, xmmword ptr [rsp + 0x410]
14003b2dc movaps xmm7, xmmword ptr [rsp + 0x420]
14003b2e4 movaps xmm8, xmmword ptr [rsp + 0x430]
14003b2ed movaps xmm9, xmmword ptr [rsp + 0x440]
14003b2f6 movaps xmm10, xmmword ptr [rsp + 0x450]
14003b2ff movaps xmm11, xmmword ptr [rsp + 0x460]
14003b308 movaps xmm12, xmmword ptr [rsp + 0x470]
14003b311 movaps xmm13, xmmword ptr [rsp + 0x480]
14003b31a movaps xmm14, xmmword ptr [rsp + 0x490]
14003b323 movaps xmm15, xmmword ptr [rsp + 0x4a0]
14003b32c add rsp, 0x4b8
14003b333 pop rbx
14003b334 pop rbp
14003b335 pop rdi
14003b336 pop rsi
14003b337 pop r12
14003b339 pop r13
14003b33b pop r14
14003b33d pop r15
14003b33f ret
14003b340 ud2
