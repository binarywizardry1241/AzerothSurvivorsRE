14029c700 push r15
14029c702 push r14
14029c704 push r13
14029c706 push r12
14029c708 push rsi
14029c709 push rdi
14029c70a push rbp
14029c70b push rbx
14029c70c sub rsp, 0x5e8
14029c713 movaps xmmword ptr [rsp + 0x5d0], xmm15
14029c71c movaps xmmword ptr [rsp + 0x5c0], xmm14
14029c725 movaps xmmword ptr [rsp + 0x5b0], xmm13
14029c72e movaps xmmword ptr [rsp + 0x5a0], xmm12
14029c737 movaps xmmword ptr [rsp + 0x590], xmm11
14029c740 movaps xmmword ptr [rsp + 0x580], xmm10
14029c749 movaps xmmword ptr [rsp + 0x570], xmm9
14029c752 movaps xmmword ptr [rsp + 0x560], xmm8
14029c75b movaps xmmword ptr [rsp + 0x550], xmm7
14029c763 movaps xmmword ptr [rsp + 0x540], xmm6
14029c76b mov r14, rdx
14029c76e mov r15, rcx
14029c771 mov r13, qword ptr [rcx]
14029c774 mov rax, qword ptr [rcx + 0x28]
14029c778 mov qword ptr [rsp + 0x2e8], r13
14029c780 lea rsi, [rsp + 0x2f0]
14029c788 movups xmm0, xmmword ptr [rcx + 8]
14029c78c movups xmmword ptr [rsp + 0x2f0], xmm0
14029c794 movups xmm0, xmmword ptr [rcx + 0x18]
14029c798 movups xmmword ptr [rsp + 0x300], xmm0
14029c7a0 mov qword ptr [rsp + 0x310], rax
14029c7a8 mov rcx, qword ptr [rdx]
14029c7ab mov rax, qword ptr [rdx + 8]
14029c7af mov rax, qword ptr [rax]
14029c7b2 cmp rax, qword ptr [rcx + 0x88]
14029c7b9 jae 0x14029caff
14029c7bf mov qword ptr [rsp + 0x320], r15
14029c7c7 mov qword ptr [rsp + 0x328], rcx
14029c7cf mov rbp, qword ptr [rcx + 0x80]
14029c7d6 mov qword ptr [rsp + 0x318], rax
14029c7de imul rdi, rax, 0x70
14029c7e2 lea rbx, [rdi + rbp]
14029c7e6 mov r15, qword ptr [r14 + 0x10]
14029c7ea movzx ecx, byte ptr [rbp + rdi + 0x6f]
14029c7ef call 0x145808f40
14029c7f4 mov r8, qword ptr [rax + 0x60]
14029c7f8 mov r9, qword ptr [rax + 0x68]
14029c7fc lea r12, [rsp + 0xd0]
14029c804 mov rcx, r12
14029c807 mov rdx, r15
14029c80a call 0x1400de550
14029c80f lea r15, [rsp + 0x330]
14029c817 mov rcx, r15
14029c81a mov rdx, r12
14029c81d call 0x142674550
14029c822 mov rax, qword ptr [rip + 0x5c29f87]
14029c829 mov qword ptr [rsp + 0xe0], rax
14029c831 movups xmm9, xmmword ptr [rip + 0x5c29f67]
14029c839 movaps xmmword ptr [rsp + 0xd0], xmm9
14029c842 movups xmm0, xmmword ptr [rip + 0x5c29f6f]
14029c849 movups xmmword ptr [rsp + 0xe8], xmm0
14029c851 mov rax, qword ptr [rip + 0x5c29f70]
14029c858 mov qword ptr [rsp + 0xf8], rax
14029c860 mov rax, qword ptr [rip + 0x5c29f79]
14029c867 mov qword ptr [rsp + 0x110], rax
14029c86f movups xmm11, xmmword ptr [rip + 0x5c29f59]
14029c877 movaps xmmword ptr [rsp + 0x100], xmm11
14029c880 movups xmm0, xmmword ptr [rip + 0x5c29f61]
14029c887 movups xmmword ptr [rsp + 0x118], xmm0
14029c88f mov rax, qword ptr [rip + 0x5c29f62]
14029c896 mov qword ptr [rsp + 0x128], rax
14029c89e movups xmmword ptr [rsp + 0x3b8], xmm9
14029c8a7 movups xmmword ptr [rsp + 0x3e8], xmm11
14029c8b0 mov rax, qword ptr [rsp + 0xe0]
14029c8b8 mov qword ptr [rsp + 0x3c8], rax
14029c8c0 mov rax, qword ptr [rsp + 0xe8]
14029c8c8 mov qword ptr [rsp + 0x3d0], rax
14029c8d0 mov rax, qword ptr [rsp + 0xf0]
14029c8d8 mov qword ptr [rsp + 0x3d8], rax
14029c8e0 mov rax, qword ptr [rsp + 0xf8]
14029c8e8 mov qword ptr [rsp + 0x3e0], rax
14029c8f0 movaps xmm0, xmmword ptr [rsp + 0x110]
14029c8f8 movups xmmword ptr [rsp + 0x3f8], xmm0
14029c900 mov rax, qword ptr [rsp + 0x120]
14029c908 mov qword ptr [rsp + 0x408], rax
14029c910 mov rax, qword ptr [rsp + 0x128]
14029c918 mov qword ptr [rsp + 0x410], rax
14029c920 xorps xmm0, xmm0
14029c923 movups xmmword ptr [rsp + 0x428], xmm0
14029c92b movups xmmword ptr [rsp + 0x418], xmm0
14029c933 mov qword ptr [rsp + 0x438], 0
14029c93f movaps xmm1, xmmword ptr [rip + 0x5c604ea]
14029c946 movups xmmword ptr [rsp + 0x440], xmm1
14029c94e movups xmmword ptr [rsp + 0x460], xmm0
14029c956 movups xmmword ptr [rsp + 0x450], xmm0
14029c95e movups xmm13, xmmword ptr [rip + 0x5c29f02]
14029c966 movups xmmword ptr [rsp + 0x480], xmm13
14029c96f movups xmm14, xmmword ptr [rip + 0x5c29ee1]
14029c977 movups xmmword ptr [rsp + 0x470], xmm14
14029c980 movups xmm15, xmmword ptr [rip + 0x5c29f00]
14029c988 movups xmmword ptr [rsp + 0x4a0], xmm15
14029c991 movups xmm6, xmmword ptr [rip + 0x5c29ee0]
14029c998 movups xmmword ptr [rsp + 0x490], xmm6
14029c9a0 movups xmm7, xmmword ptr [rip + 0x5c29f01]
14029c9a7 movups xmmword ptr [rsp + 0x4c0], xmm7
14029c9af movups xmm8, xmmword ptr [rip + 0x5c29ee1]
14029c9b7 movups xmmword ptr [rsp + 0x4b0], xmm8
14029c9c0 movups xmm10, xmmword ptr [rip + 0x5c29f00]
14029c9c8 movups xmmword ptr [rsp + 0x4e0], xmm10
14029c9d1 movups xmm12, xmmword ptr [rip + 0x5c29edf]
14029c9d9 movups xmmword ptr [rsp + 0x4d0], xmm12
14029c9e2 movaps xmm0, xmmword ptr [rip + 0x5c05647]
14029c9e9 movups xmmword ptr [rsp + 0x4f0], xmm0
14029c9f1 mov dword ptr [rsp + 0x500], 1
14029c9fc mov qword ptr [rsp + 0x504], 0
14029ca08 mov byte ptr [rsp + 0x50c], 1
14029ca10 mov qword ptr [rsp + 0x516], 0
14029ca1c mov qword ptr [rsp + 0x510], 0
14029ca28 movzx eax, word ptr [rip + 0x5c29edb]
14029ca2f mov word ptr [rsp + 0x522], ax
14029ca37 mov eax, dword ptr [rip + 0x5c29ec9]
14029ca3d mov dword ptr [rsp + 0x51e], eax
14029ca44 movzx eax, word ptr [rip + 0x5c29ec5]
14029ca4b mov word ptr [rsp + 0x528], ax
14029ca53 mov r12d, dword ptr [rip + 0x5c29eb2]
14029ca5a mov dword ptr [rsp + 0x524], r12d
14029ca62 mov dword ptr [rsp + 0x532], 0
14029ca6d mov qword ptr [rsp + 0x52a], 0
14029ca79 lea rcx, [rsp + 0xd8]
14029ca81 mov r8d, 0x208
14029ca87 mov rdx, r15
14029ca8a call 0x145cf998b
14029ca8f mov qword ptr [rsp + 0xd0], r13
14029ca97 lea rcx, [rsp + 0x70]
14029ca9c lea r8, [rsp + 0xd0]
14029caa4 mov rdx, rsi
14029caa7 call 0x140278f50
14029caac cmp qword ptr [rbp + rdi + 0x58], 0
14029cab2 mov r13, rsi
14029cab5 je 0x14029cb93
14029cabb mov r14, qword ptr [r14 + 0x18]
14029cabf lea r15, [rsp + 0xd0]
14029cac7 mov rcx, r15
14029caca mov rdx, rbx
14029cacd call 0x145cccba0
14029cad2 mov r9, qword ptr [rbx + 0x50]
14029cad6 mov rax, qword ptr [rbx + 0x58]
14029cada mov qword ptr [rsp + 0x20], rax
14029cadf mov dword ptr [rsp + 0x28], 0x41880000
14029cae7 lea rcx, [rsp + 0x2e8]
14029caef mov rdx, r14
14029caf2 mov r8, r15
14029caf5 call 0x140038a60
14029cafa jmp 0x14029cd15
14029caff mov rdi, qword ptr [r14 + 0x18]
14029cb03 lea rcx, [rip + 0x5c6450c] # 145f01016 b"Open slothasn't unlocked this zoneKickyouhost (you)Public lobbies of this version. Click one to join.Refreshcoop-lobbiesWho can find itPrivate: by code onlyPublic: in the listHost "
14029cb0a mov edx, 9
14029cb0f call 0x145895670
14029cb14 mov rbx, rdx
14029cb17 test rdx, rdx
14029cb1a jns 0x14029cb2c
14029cb1c xor r12d, r12d
14029cb1f mov rcx, r12
14029cb22 mov rdx, rbx
14029cb25 call 0x145e9bd8b
14029cb2a ud2
14029cb2c je 0x14029d3a6
14029cb32 mov rbp, r15
14029cb35 mov r15, rax
14029cb38 call 0x140002200
14029cb3d mov r12d, 1
14029cb43 mov edx, 1
14029cb48 mov rcx, rbx
14029cb4b call 0x1400021c0
14029cb50 test rax, rax
14029cb53 je 0x14029dacd
14029cb59 mov r14, rax
14029cb5c mov rcx, rax
14029cb5f mov rdx, r15
14029cb62 mov r8, rbx
14029cb65 call 0x145cf998b
14029cb6a mov r15, rbp
14029cb6d cmp byte ptr [rdi], 1
14029cb70 jne 0x14029d3b5
14029cb76 mov eax, dword ptr [rdi + 1]
14029cb79 mov ecx, dword ptr [rdi + 4]
14029cb7c mov dword ptr [rsp + 0x5b], ecx
14029cb80 mov dword ptr [rsp + 0x58], eax
14029cb84 mov rax, qword ptr [rdi + 8]
14029cb88 movzx ecx, byte ptr [rdi + 0x10]
14029cb8c mov dl, 1
14029cb8e jmp 0x14029d3cd
14029cb93 mov r14, qword ptr [r14 + 0x18]
14029cb97 cmp byte ptr [rbx + 0x6d], 0
14029cb9b je 0x14029cba6
14029cb9d movups xmm0, xmmword ptr [rip + 0x5c60e18]
14029cba4 jmp 0x14029cbad
14029cba6 movups xmm0, xmmword ptr [rip + 0x5c60ff7]
14029cbad movaps xmmword ptr [rsp + 0x40], xmm0
14029cbb2 mov dword ptr [rsp + 0x50], 0x3f800000
14029cbba lea rcx, [rsp + 0x330]
14029cbc2 mov rdx, rbx
14029cbc5 call 0x145cccba0
14029cbca cmp byte ptr [r14], 1
14029cbce jne 0x14029cbed
14029cbd0 mov eax, dword ptr [r14 + 1]
14029cbd4 mov ecx, dword ptr [r14 + 4]
14029cbd8 mov dword ptr [rsp + 0x3b], ecx
14029cbdc mov dword ptr [rsp + 0x38], eax
14029cbe0 mov rax, qword ptr [r14 + 8]
14029cbe4 movzx edx, byte ptr [r14 + 0x10]
14029cbe9 mov cl, 1
14029cbeb jmp 0x14029cbfd
14029cbed mov rax, qword ptr [r14 + 8]
14029cbf1 lock inc qword ptr [rax]
14029cbf5 jle 0x14029d8a1
14029cbfb xor ecx, ecx
14029cbfd mov r8, qword ptr [rsp + 0x340]
14029cc05 mov qword ptr [rsp + 0xe8], r8
14029cc0d movups xmm0, xmmword ptr [rsp + 0x330]
14029cc15 movups xmmword ptr [rsp + 0xd8], xmm0
14029cc1d mov r8d, dword ptr [rsp + 0x38]
14029cc22 mov r9d, dword ptr [rsp + 0x3b]
14029cc27 mov dword ptr [rsp + 0x109], r8d
14029cc2f mov dword ptr [rsp + 0x10c], r9d
14029cc37 movaps xmm0, xmmword ptr [rsp + 0x40]
14029cc3c movups xmmword ptr [rsp + 0x71], xmm0
14029cc41 mov r8d, dword ptr [rsp + 0x50]
14029cc46 mov dword ptr [rsp + 0x81], r8d
14029cc4e mov r8, qword ptr [rsp + 0x2e8]
14029cc56 mov qword ptr [rsp + 0xf0], 0
14029cc62 mov qword ptr [rsp + 0xf8], 4
14029cc6e mov qword ptr [rsp + 0x100], 0
14029cc7a mov byte ptr [rsp + 0x108], cl
14029cc81 mov qword ptr [rsp + 0x110], rax
14029cc89 mov qword ptr [rsp + 0x118], rdx
14029cc91 mov dword ptr [rsp + 0x120], 0x41880000
14029cc9c mov word ptr [rsp + 0x124], 0x190
14029cca6 mov byte ptr [rsp + 0x126], 1
14029ccae mov rax, qword ptr [rsp + 0x7d]
14029ccb3 mov qword ptr [rsp + 0x134], rax
14029ccbb movups xmm0, xmmword ptr [rsp + 0x70]
14029ccc0 movups xmmword ptr [rsp + 0x127], xmm0
14029ccc8 mov eax, dword ptr [rip + 0x5c32c0a]
14029ccce mov dword ptr [rsp + 0x14c], eax
14029ccd5 movups xmm0, xmmword ptr [rip + 0x5c32bec]
14029ccdc movups xmmword ptr [rsp + 0x13c], xmm0
14029cce4 movsd xmm0, qword ptr [rip + 0x5c053e4]
14029ccec movsd qword ptr [rsp + 0x150], xmm0
14029ccf5 mov qword ptr [rsp + 0xd0], r8
14029ccfd lea rcx, [rsp + 0x330]
14029cd05 lea r8, [rsp + 0xd0]
14029cd0d mov rdx, r13
14029cd10 call 0x140278cc0
14029cd15 lea rdx, [rbx + 0x18]
14029cd19 lea rcx, [rsp + 0x330]
14029cd21 call 0x145cccba0
14029cd26 cmp byte ptr [r14], 1
14029cd2a jne 0x14029cd49
14029cd2c mov eax, dword ptr [r14 + 1]
14029cd30 mov ecx, dword ptr [r14 + 4]
14029cd34 mov dword ptr [rsp + 0x43], ecx
14029cd38 mov dword ptr [rsp + 0x40], eax
14029cd3c mov rax, qword ptr [r14 + 8]
14029cd40 movzx edx, byte ptr [r14 + 0x10]
14029cd45 mov cl, 1
14029cd47 jmp 0x14029cd59
14029cd49 mov rax, qword ptr [r14 + 8]
14029cd4d lock inc qword ptr [rax]
14029cd51 jle 0x14029d8a1
14029cd57 xor ecx, ecx
14029cd59 mov r8, qword ptr [rsp + 0x340]
14029cd61 mov qword ptr [rsp + 0xe8], r8
14029cd69 movups xmm0, xmmword ptr [rsp + 0x330]
14029cd71 movups xmmword ptr [rsp + 0xd8], xmm0
14029cd79 mov r8d, dword ptr [rsp + 0x40]
14029cd7e mov r9d, dword ptr [rsp + 0x43]
14029cd83 mov dword ptr [rsp + 0x109], r8d
14029cd8b mov dword ptr [rsp + 0x10c], r9d
14029cd93 movups xmm0, xmmword ptr [rip + 0x5c60bf2]
14029cd9a movups xmmword ptr [rsp + 0x71], xmm0
14029cd9f mov dword ptr [rsp + 0x81], 0x3f800000
14029cdaa mov r8, qword ptr [rsp + 0x2e8]
14029cdb2 mov qword ptr [rsp + 0xf0], 0
14029cdbe mov qword ptr [rsp + 0xf8], 4
14029cdca mov qword ptr [rsp + 0x100], 0
14029cdd6 mov byte ptr [rsp + 0x108], cl
14029cddd mov qword ptr [rsp + 0x110], rax
14029cde5 mov qword ptr [rsp + 0x118], rdx
14029cded mov dword ptr [rsp + 0x120], 0x41500000
14029cdf8 mov word ptr [rsp + 0x124], 0x190
14029ce02 mov byte ptr [rsp + 0x126], 1
14029ce0a mov rax, qword ptr [rsp + 0x7d]
14029ce0f mov qword ptr [rsp + 0x134], rax
14029ce17 movups xmm0, xmmword ptr [rsp + 0x70]
14029ce1c movups xmmword ptr [rsp + 0x127], xmm0
14029ce24 mov esi, dword ptr [rip + 0x5c32aae]
14029ce2a mov dword ptr [rsp + 0x14c], esi
14029ce31 movups xmm0, xmmword ptr [rip + 0x5c32a90]
14029ce38 movups xmmword ptr [rsp + 0x13c], xmm0
14029ce40 movsd xmm0, qword ptr [rip + 0x5c05288]
14029ce48 movsd qword ptr [rsp + 0x150], xmm0
14029ce51 mov qword ptr [rsp + 0xd0], r8
14029ce59 lea rcx, [rsp + 0x330]
14029ce61 lea r8, [rsp + 0xd0]
14029ce69 mov rdx, r13
14029ce6c call 0x140278cc0
14029ce71 movzx ecx, byte ptr [rbx + 0x6f]
14029ce75 call 0x145808f40
14029ce7a mov rdx, qword ptr [rax + 0x50]
14029ce7e mov r8, qword ptr [rax + 0x58]
14029ce82 mov rcx, r8
14029ce85 sub rcx, rdx
14029ce88 sub rcx, r8
14029ce8b xor r9d, r9d
14029ce8e jmp 0x14029cea0
14029ce90 inc r9
14029ce93 add r9, rcx
14029ce96 cmp r10d, 0x23
14029ce9a jne 0x14029cf2f
14029cea0 cmp r9, r8
14029cea3 je 0x14029cf2c
14029cea9 mov rax, r9
14029ceac add r9, rdx
14029ceaf movzx edi, byte ptr [r9]
14029ceb3 movzx r10d, dil
14029ceb7 test r10b, r10b
14029ceba jns 0x14029ce90
14029cebc mov r11d, r10d
14029cebf and r11d, 0x1f
14029cec3 movzx ebp, byte ptr [r9 + 1]
14029cec8 and ebp, 0x3f
14029cecb cmp r10b, 0xdf
14029cecf jbe 0x14029cf09
14029ced1 movzx r10d, byte ptr [r9 + 2]
14029ced6 shl ebp, 6
14029ced9 and r10d, 0x3f
14029cedd or r10d, ebp
14029cee0 cmp dil, 0xf0
14029cee4 jb 0x14029cf1c
14029cee6 movzx edi, byte ptr [r9 + 3]
14029ceeb add r9, 4
14029ceef and r11d, 7
14029cef3 shl r11d, 0x12
14029cef7 shl r10d, 6
14029cefb and edi, 0x3f
14029cefe or edi, r10d
14029cf01 or edi, r11d
14029cf04 mov r10d, edi
14029cf07 jmp 0x14029ce93
14029cf09 add r9, 2
14029cf0d shl r11d, 6
14029cf11 or r11d, ebp
14029cf14 mov r10d, r11d
14029cf17 jmp 0x14029ce93
14029cf1c add r9, 3
14029cf20 shl r11d, 0xc
14029cf24 or r10d, r11d
14029cf27 jmp 0x14029ce93
14029cf2c mov rax, r8
14029cf2f sub r8, rax
14029cf32 add rdx, rax
14029cf35 lea rcx, [rsp + 0xd0]
14029cf3d call 0x14001fdc0
14029cf42 cmp dword ptr [rsp + 0xd0], 1
14029cf4a jne 0x14029cf55
14029cf4c movups xmm0, xmmword ptr [rip + 0x5c33811]
14029cf53 jmp 0x14029cf5d
14029cf55 movups xmm0, xmmword ptr [rsp + 0xd4]
14029cf5d movaps xmmword ptr [rsp + 0x40], xmm0
14029cf62 lea rdx, [rbx + 0x30]
14029cf66 lea rcx, [rsp + 0x330]
14029cf6e call 0x145cccba0
14029cf73 cmp byte ptr [r14], 1
14029cf77 jne 0x14029cf96
14029cf79 mov eax, dword ptr [r14 + 1]
14029cf7d mov ecx, dword ptr [r14 + 4]
14029cf81 mov dword ptr [rsp + 0x73], ecx
14029cf85 mov dword ptr [rsp + 0x70], eax
14029cf89 mov rax, qword ptr [r14 + 8]
14029cf8d movzx edx, byte ptr [r14 + 0x10]
14029cf92 mov cl, 1
14029cf94 jmp 0x14029cfa6
14029cf96 mov rax, qword ptr [r14 + 8]
14029cf9a lock inc qword ptr [rax]
14029cf9e jle 0x14029d8a1
14029cfa4 xor ecx, ecx
14029cfa6 mov r8, qword ptr [rsp + 0x340]
14029cfae mov qword ptr [rsp + 0xe8], r8
14029cfb6 movups xmm0, xmmword ptr [rsp + 0x330]
14029cfbe movups xmmword ptr [rsp + 0xd8], xmm0
14029cfc6 mov r8d, dword ptr [rsp + 0x70]
14029cfcb mov r9d, dword ptr [rsp + 0x73]
14029cfd0 mov dword ptr [rsp + 0x109], r8d
14029cfd8 mov dword ptr [rsp + 0x10c], r9d
14029cfe0 movaps xmm0, xmmword ptr [rsp + 0x40]
14029cfe5 movups xmmword ptr [rsp + 0x12c], xmm0
14029cfed mov r8, qword ptr [rsp + 0x2e8]
14029cff5 mov qword ptr [rsp + 0xf0], 0
14029d001 mov qword ptr [rsp + 0xf8], 4
14029d00d mov qword ptr [rsp + 0x100], 0
14029d019 mov byte ptr [rsp + 0x108], cl
14029d020 mov qword ptr [rsp + 0x110], rax
14029d028 mov qword ptr [rsp + 0x118], rdx
14029d030 mov dword ptr [rsp + 0x120], 0x41600000
14029d03b mov word ptr [rsp + 0x124], 0x190
14029d045 mov byte ptr [rsp + 0x126], 1
14029d04d mov dword ptr [rsp + 0x128], 0
14029d058 mov dword ptr [rsp + 0x14c], esi
14029d05f movups xmm0, xmmword ptr [rip + 0x5c32862]
14029d066 movups xmmword ptr [rsp + 0x13c], xmm0
14029d06e movsd xmm0, qword ptr [rip + 0x5c0505a]
14029d076 movsd qword ptr [rsp + 0x150], xmm0
14029d07f mov qword ptr [rsp + 0xd0], r8
14029d087 lea rcx, [rsp + 0x330]
14029d08f lea r8, [rsp + 0xd0]
14029d097 mov rdx, r13
14029d09a call 0x140278cc0
14029d09f mov eax, dword ptr [rbx + 0x68]
14029d0a2 mov dword ptr [rsp + 0x38], eax
14029d0a6 mov rax, qword ptr [rip + 0x5c29703]
14029d0ad mov qword ptr [rsp + 0x80], rax
14029d0b5 movaps xmmword ptr [rsp + 0x70], xmm9
14029d0bb mov rax, qword ptr [rip + 0x5c29706]
14029d0c2 mov qword ptr [rsp + 0x98], rax
14029d0ca movups xmm0, xmmword ptr [rip + 0x5c296e7]
14029d0d1 movups xmmword ptr [rsp + 0x88], xmm0
14029d0d9 movaps xmmword ptr [rsp + 0xa0], xmm11
14029d0e2 mov rax, qword ptr [rip + 0x5c296f7]
14029d0e9 mov qword ptr [rsp + 0xb0], rax
14029d0f1 movups xmm0, xmmword ptr [rip + 0x5c296f0]
14029d0f8 movups xmmword ptr [rsp + 0xb8], xmm0
14029d100 mov rax, qword ptr [rip + 0x5c296f1]
14029d107 mov qword ptr [rsp + 0xc8], rax
14029d10f movaps xmmword ptr [rsp + 0x330], xmm9
14029d118 movaps xmmword ptr [rsp + 0x360], xmm11
14029d121 mov rax, qword ptr [rsp + 0x80]
14029d129 mov qword ptr [rsp + 0x340], rax
14029d131 mov rax, qword ptr [rsp + 0x88]
14029d139 mov qword ptr [rsp + 0x348], rax
14029d141 mov rax, qword ptr [rsp + 0x90]
14029d149 mov qword ptr [rsp + 0x350], rax
14029d151 mov rax, qword ptr [rsp + 0x98]
14029d159 mov qword ptr [rsp + 0x358], rax
14029d161 mov rax, qword ptr [rsp + 0xb0]
14029d169 mov qword ptr [rsp + 0x370], rax
14029d171 mov rax, qword ptr [rsp + 0xb8]
14029d179 mov qword ptr [rsp + 0x378], rax
14029d181 movaps xmm0, xmmword ptr [rsp + 0xc0]
14029d189 movaps xmmword ptr [rsp + 0x380], xmm0
14029d191 xorps xmm9, xmm9
14029d195 movaps xmmword ptr [rsp + 0x3d0], xmm9
14029d19e movaps xmmword ptr [rsp + 0x3c0], xmm9
14029d1a7 movaps xmmword ptr [rsp + 0x3b0], xmm9
14029d1b0 movaps xmmword ptr [rsp + 0x3a0], xmm9
14029d1b9 movaps xmmword ptr [rsp + 0x390], xmm9
14029d1c2 mov qword ptr [rsp + 0x3e0], 0
14029d1ce movups xmmword ptr [rsp + 0x3f8], xmm13
14029d1d7 movups xmmword ptr [rsp + 0x3e8], xmm14
14029d1e0 movups xmmword ptr [rsp + 0x418], xmm15
14029d1e9 movups xmmword ptr [rsp + 0x408], xmm6
14029d1f1 movups xmmword ptr [rsp + 0x438], xmm7
14029d1f9 movups xmmword ptr [rsp + 0x428], xmm8
14029d202 movups xmmword ptr [rsp + 0x458], xmm10
14029d20b movups xmmword ptr [rsp + 0x448], xmm12
14029d214 mov dword ptr [rsp + 0x252], 0
14029d21f mov qword ptr [rsp + 0x24a], 0
14029d22b mov rdi, qword ptr [rsp + 0x2e8]
14029d233 lea rcx, [rsp + 0xd8]
14029d23b lea rdx, [rsp + 0x330]
14029d243 mov r8d, 0x138
14029d249 call 0x145cf998b
14029d24e movaps xmm6, xmmword ptr [rip + 0x5c04ddb]
14029d255 movups xmmword ptr [rsp + 0x210], xmm6
14029d25d mov dword ptr [rsp + 0x220], 1
14029d268 mov qword ptr [rsp + 0x224], 0
14029d274 mov byte ptr [rsp + 0x22c], 1
14029d27c mov qword ptr [rsp + 0x230], 0
14029d288 mov dword ptr [rsp + 0x238], 0x3f800000
14029d293 mov word ptr [rsp + 0x23c], 0
14029d29d mov eax, dword ptr [rip + 0x5c29663]
14029d2a3 mov dword ptr [rsp + 0x23e], eax
14029d2aa movzx eax, word ptr [rip + 0x5c29659]
14029d2b1 mov word ptr [rsp + 0x242], ax
14029d2b9 mov dword ptr [rsp + 0x244], r12d
14029d2c1 movzx eax, word ptr [rip + 0x5c29648]
14029d2c8 mov word ptr [rsp + 0x248], ax
14029d2d0 mov word ptr [rsp + 0x258], 0x102
14029d2da mov qword ptr [rsp + 0xd0], rdi
14029d2e2 lea r15, [rsp + 0x70]
14029d2e7 lea r8, [rsp + 0xd0]
14029d2ef mov rcx, r15
14029d2f2 mov rdx, r13
14029d2f5 call 0x140266490
14029d2fa lea r8, [rsp + 0x38]
14029d2ff mov rcx, r15
14029d302 mov rdx, r14
14029d305 call 0x14029a760
14029d30a cmp byte ptr [rbx + 0x6e], 0
14029d30e jne 0x14029d600
14029d314 lea rcx, [rip + 0x5c63d04] # 145f0101f b"hasn't unlocked this zoneKickyouhost (you)Public lobbies of this version. Click one to join.Refreshcoop-lobbiesWho can find itPrivate: by code onlyPublic: in the listHost the lobby"
14029d31b mov edx, 0x19
14029d320 call 0x145895670
14029d325 mov r15, rdx
14029d328 test rdx, rdx
14029d32b jns 0x14029d33c
14029d32d xor ebp, ebp
14029d32f mov rcx, rbp
14029d332 mov rdx, r15
14029d335 call 0x145e9bd8b
14029d33a ud2
14029d33c je 0x14029d4d8
14029d342 mov edi, esi
14029d344 mov rsi, r13
14029d347 mov r13, rax
14029d34a call 0x140002200
14029d34f mov ebp, 1
14029d354 mov edx, 1
14029d359 mov rcx, r15
14029d35c call 0x1400021c0
14029d361 test rax, rax
14029d364 je 0x14029d32f
14029d366 mov r12, rax
14029d369 mov rcx, rax
14029d36c mov rdx, r13
14029d36f mov r8, r15
14029d372 call 0x145cf998b
14029d377 mov r13, rsi
14029d37a mov esi, edi
14029d37c cmp byte ptr [r14], 1
14029d380 jne 0x14029d4e8
14029d386 mov eax, dword ptr [r14 + 1]
14029d38a mov ecx, dword ptr [r14 + 4]
14029d38e mov dword ptr [rsp + 0x63], ecx
14029d392 mov dword ptr [rsp + 0x60], eax
14029d396 mov rax, qword ptr [r14 + 8]
14029d39a movzx ecx, byte ptr [r14 + 0x10]
14029d39f mov dl, 1
14029d3a1 jmp 0x14029d4f8
14029d3a6 mov r14d, 1
14029d3ac cmp byte ptr [rdi], 1
14029d3af je 0x14029cb76
14029d3b5 mov rax, qword ptr [rdi + 8]
14029d3b9 lock inc qword ptr [rax]
14029d3bd jle 0x14029d8a1
14029d3c3 mov r13, qword ptr [rsp + 0x2e8]
14029d3cb xor edx, edx
14029d3cd movups xmm0, xmmword ptr [rip + 0x5c63c20]
14029d3d4 movups xmmword ptr [rsp + 0x71], xmm0
14029d3d9 mov dword ptr [rsp + 0x81], 0x3f0ccccd
14029d3e4 mov qword ptr [rsp + 0xd8], rbx
14029d3ec mov qword ptr [rsp + 0xe0], r14
14029d3f4 mov qword ptr [rsp + 0xe8], rbx
14029d3fc mov qword ptr [rsp + 0xf0], 0
14029d408 mov qword ptr [rsp + 0xf8], 4
14029d414 mov qword ptr [rsp + 0x100], 0
14029d420 mov byte ptr [rsp + 0x108], dl
14029d427 mov edx, dword ptr [rsp + 0x58]
14029d42b mov r8d, dword ptr [rsp + 0x5b]
14029d430 mov dword ptr [rsp + 0x109], edx
14029d437 mov dword ptr [rsp + 0x10c], r8d
14029d43f mov qword ptr [rsp + 0x110], rax
14029d447 mov qword ptr [rsp + 0x118], rcx
14029d44f mov dword ptr [rsp + 0x120], 0x41700000
14029d45a mov word ptr [rsp + 0x124], 0x190
14029d464 mov byte ptr [rsp + 0x126], 1
14029d46c movups xmm0, xmmword ptr [rsp + 0x70]
14029d471 movups xmmword ptr [rsp + 0x127], xmm0
14029d479 mov rax, qword ptr [rsp + 0x7d]
14029d47e mov qword ptr [rsp + 0x134], rax
14029d486 mov eax, dword ptr [rip + 0x5c3244c]
14029d48c mov dword ptr [rsp + 0x14c], eax
14029d493 movups xmm0, xmmword ptr [rip + 0x5c3242e]
14029d49a movups xmmword ptr [rsp + 0x13c], xmm0
14029d4a2 movsd xmm0, qword ptr [rip + 0x5c04c26]
14029d4aa movsd qword ptr [rsp + 0x150], xmm0
14029d4b3 mov qword ptr [rsp + 0xd0], r13
14029d4bb lea rcx, [rsp + 0x330]
14029d4c3 lea r8, [rsp + 0xd0]
14029d4cb mov rdx, rsi
14029d4ce call 0x140278cc0
14029d4d3 jmp 0x14029da5e
14029d4d8 mov r12d, 1
14029d4de cmp byte ptr [r14], 1
14029d4e2 je 0x14029d386
14029d4e8 mov rax, qword ptr [r14 + 8]
14029d4ec lock inc qword ptr [rax]
14029d4f0 jle 0x14029d8a1
14029d4f6 xor edx, edx
14029d4f8 movups xmm0, xmmword ptr [rip + 0x5c604a9]
14029d4ff movups xmmword ptr [rsp + 0x71], xmm0
14029d504 mov dword ptr [rsp + 0x81], 0x3f800000
14029d50f mov r8, qword ptr [rsp + 0x2e8]
14029d517 mov qword ptr [rsp + 0xd8], r15
14029d51f mov qword ptr [rsp + 0xe0], r12
14029d527 mov qword ptr [rsp + 0xe8], r15
14029d52f mov qword ptr [rsp + 0xf0], 0
14029d53b mov qword ptr [rsp + 0xf8], 4
14029d547 mov qword ptr [rsp + 0x100], 0
14029d553 mov byte ptr [rsp + 0x108], dl
14029d55a mov edx, dword ptr [rsp + 0x60]
14029d55e mov r9d, dword ptr [rsp + 0x63]
14029d563 mov dword ptr [rsp + 0x109], edx
14029d56a mov dword ptr [rsp + 0x10c], r9d
14029d572 mov qword ptr [rsp + 0x110], rax
14029d57a mov qword ptr [rsp + 0x118], rcx
14029d582 mov dword ptr [rsp + 0x120], 0x41500000
14029d58d mov word ptr [rsp + 0x124], 0x190
14029d597 mov byte ptr [rsp + 0x126], 1
14029d59f movups xmm0, xmmword ptr [rsp + 0x70]
14029d5a4 movups xmmword ptr [rsp + 0x127], xmm0
14029d5ac mov rax, qword ptr [rsp + 0x7d]
14029d5b1 mov qword ptr [rsp + 0x134], rax
14029d5b9 movups xmm0, xmmword ptr [rip + 0x5c32308]
14029d5c0 movups xmmword ptr [rsp + 0x13c], xmm0
14029d5c8 mov dword ptr [rsp + 0x14c], esi
14029d5cf movsd xmm0, qword ptr [rip + 0x5c04af9]
14029d5d7 movsd qword ptr [rsp + 0x150], xmm0
14029d5e0 mov qword ptr [rsp + 0xd0], r8
14029d5e8 lea rcx, [rsp + 0x330]
14029d5f0 lea r8, [rsp + 0xd0]
14029d5f8 mov rdx, r13
14029d5fb call 0x140278cc0
14029d600 movaps xmmword ptr [rsp + 0x3d0], xmm9
14029d609 movaps xmmword ptr [rsp + 0x3c0], xmm9
14029d612 movaps xmmword ptr [rsp + 0x3b0], xmm9
14029d61b movaps xmmword ptr [rsp + 0x3a0], xmm9
14029d624 movaps xmmword ptr [rsp + 0x390], xmm9
14029d62d mov qword ptr [rsp + 0x3e0], 0
14029d639 mov word ptr [rsp + 0x254], 0
14029d643 mov dword ptr [rsp + 0x250], 0
14029d64e movups xmm0, xmmword ptr [rip + 0x5c60433]
14029d655 movups xmmword ptr [rsp + 0x3e8], xmm0
14029d65d movups xmm0, xmmword ptr [rip + 0x5c60434]
14029d664 movups xmmword ptr [rsp + 0x3f8], xmm0
14029d66c movups xmm0, xmmword ptr [rip + 0x5c60435]
14029d673 movups xmmword ptr [rsp + 0x408], xmm0
14029d67b movups xmm0, xmmword ptr [rip + 0x5c60436]
14029d682 movups xmmword ptr [rsp + 0x418], xmm0
14029d68a movups xmm0, xmmword ptr [rip + 0x5c60447]
14029d691 movups xmmword ptr [rsp + 0x438], xmm0
14029d699 movups xmm0, xmmword ptr [rip + 0x5c60428]
14029d6a0 movups xmmword ptr [rsp + 0x428], xmm0
14029d6a8 movups xmm0, xmmword ptr [rip + 0x5c60449]
14029d6af movups xmmword ptr [rsp + 0x458], xmm0
14029d6b7 movups xmm0, xmmword ptr [rip + 0x5c6042a]
14029d6be movups xmmword ptr [rsp + 0x448], xmm0
14029d6c6 movups xmm0, xmmword ptr [rip + 0x5c60303]
14029d6cd movaps xmmword ptr [rsp + 0x330], xmm0
14029d6d5 mov qword ptr [rsp + 0x340], 0
14029d6e1 movups xmm0, xmmword ptr [rip + 0x5c60300]
14029d6e8 movups xmmword ptr [rsp + 0x348], xmm0
14029d6f0 mov qword ptr [rsp + 0x358], 0
14029d6fc movups xmm0, xmmword ptr [rip + 0x5c602fd]
14029d703 movaps xmmword ptr [rsp + 0x360], xmm0
14029d70b mov qword ptr [rsp + 0x370], 0
14029d717 movups xmm0, xmmword ptr [rip + 0x5c602fa]
14029d71e movups xmmword ptr [rsp + 0x378], xmm0
14029d726 mov qword ptr [rsp + 0x388], 0
14029d732 mov rdi, qword ptr [rsp + 0x2e8]
14029d73a lea rcx, [rsp + 0xd8]
14029d742 lea rdx, [rsp + 0x330]
14029d74a mov r8d, 0x138
14029d750 call 0x145cf998b
14029d755 movups xmmword ptr [rsp + 0x210], xmm6
14029d75d mov dword ptr [rsp + 0x220], 1
14029d768 mov qword ptr [rsp + 0x224], 0
14029d774 mov byte ptr [rsp + 0x22c], 1
14029d77c movsd xmm0, qword ptr [rip + 0x5c2dfdc]
14029d784 movsd qword ptr [rsp + 0x230], xmm0
14029d78d mov dword ptr [rsp + 0x238], 0x3f800000
14029d798 mov word ptr [rsp + 0x23c], 0
14029d7a2 mov dword ptr [rsp + 0x23e], 0x10000
14029d7ad mov word ptr [rsp + 0x242], 0
14029d7b7 mov dword ptr [rsp + 0x244], 0x10000
14029d7c2 mov word ptr [rsp + 0x248], 0
14029d7cc mov dword ptr [rsp + 0x24a], 0
14029d7d7 mov word ptr [rsp + 0x24e], 0
14029d7e1 mov qword ptr [rsp + 0xd0], rdi
14029d7e9 lea rcx, [rsp + 0x70]
14029d7ee lea r8, [rsp + 0xd0]
14029d7f6 mov rdx, r13
14029d7f9 call 0x1402628b0
14029d7fe mov rax, qword ptr [rsp + 0x328]
14029d806 cmp qword ptr [rax + 0x40], 4
14029d80b jne 0x14029d870
14029d80d mov rax, qword ptr [rax + 0x38]
14029d811 cmp dword ptr [rax], 0x74736f68
14029d817 jne 0x14029d870
14029d819 cmp byte ptr [rbx + 0x6c], 0
14029d81d jne 0x14029d870
14029d81f mov rax, qword ptr [rsp + 0x318]
14029d827 mov qword ptr [rsp + 0xd8], rax
14029d82f mov byte ptr [rsp + 0xd0], 9
14029d837 lea rcx, [rip + 0x5c637fa] # 145f01038 b'Kickyouhost (you)Public lobbies of this version. Click one to join.Refreshcoop-lobbiesWho can find itPrivate: by code onlyPublic: in the listHost the lobbyMax playersJoinrarityName'
14029d83e mov edx, 4
14029d843 call 0x145895670
14029d848 mov qword ptr [rsp + 0x20], rdx
14029d84d mov dword ptr [rsp + 0x28], 0x41500000
14029d855 lea rcx, [rsp + 0x2e8]
14029d85d lea r8, [rsp + 0xd0]
14029d865 mov rdx, r14
14029d868 mov r9, rax
14029d86b call 0x14003b350
14029d870 movzx eax, byte ptr [rbx + 0x6d]
14029d874 cmp byte ptr [rbx + 0x6c], 0
14029d878 je 0x14029d8a3
14029d87a test al, al
14029d87c je 0x14029d8c2
14029d87e lea rcx, [rip + 0x5c637ba] # 145f0103f b'host (you)Public lobbies of this version. Click one to join.Refreshcoop-lobbiesWho can find itPrivate: by code onlyPublic: in the listHost the lobbyMax playersJoinrarityNamespellte'
14029d885 mov edx, 0xa
14029d88a call 0x145895670
14029d88f mov rbx, rdx
14029d892 test rdx, rdx
14029d895 jns 0x14029d8db
14029d897 xor ecx, ecx
14029d899 mov rdx, rbx
14029d89c call 0x145e9bd8b
14029d8a1 ud2
14029d8a3 test al, al
14029d8a5 je 0x14029d925
14029d8a7 lea rcx, [rip + 0x5c6378e] # 145f0103c b'youhost (you)Public lobbies of this version. Click one to join.Refreshcoop-lobbiesWho can find itPrivate: by code onlyPublic: in the listHost the lobbyMax playersJoinrarityNamespel'
14029d8ae mov edx, 3
14029d8b3 call 0x145895670
14029d8b8 mov rbx, rdx
14029d8bb test rdx, rdx
14029d8be js 0x14029d897
14029d8c0 jmp 0x14029d8db
14029d8c2 lea rcx, [rip + 0x5c6038e] # 145efdc57 b'hostend.againend.endlessmenu.character_selectmenu.main_menuBack to the lobbyLeave the party'
14029d8c9 mov edx, 4
14029d8ce call 0x145895670
14029d8d3 mov rbx, rdx
14029d8d6 test rdx, rdx
14029d8d9 js 0x14029d897
14029d8db je 0x14029d925
14029d8dd mov r12, rax
14029d8e0 call 0x140002200
14029d8e5 mov edx, 1
14029d8ea mov rcx, rbx
14029d8ed call 0x1400021c0
14029d8f2 mov ecx, 1
14029d8f7 test rax, rax
14029d8fa je 0x14029cb22
14029d900 mov r15, rax
14029d903 mov rcx, rax
14029d906 mov rdx, r12
14029d909 mov r8, rbx
14029d90c call 0x145cf998b
14029d911 cmp byte ptr [r14], 1
14029d915 je 0x14029d933
14029d917 mov rax, qword ptr [r14 + 8]
14029d91b lock inc qword ptr [rax]
14029d91f jle 0x14029d8a1
14029d921 xor edx, edx
14029d923 jmp 0x14029d94e
14029d925 mov r15d, 1
14029d92b xor ebx, ebx
14029d92d cmp byte ptr [r14], 1
14029d931 jne 0x14029d917
14029d933 mov eax, dword ptr [r14 + 1]
14029d937 mov ecx, dword ptr [r14 + 4]
14029d93b mov dword ptr [rsp + 0x6b], ecx
14029d93f mov dword ptr [rsp + 0x68], eax
14029d943 mov rax, qword ptr [r14 + 8]
14029d947 movzx ecx, byte ptr [r14 + 0x10]
14029d94c mov dl, 1
14029d94e movups xmm0, xmmword ptr [rip + 0x5c6039b]
14029d955 movups xmmword ptr [rsp + 0x71], xmm0
14029d95a mov dword ptr [rsp + 0x81], 0x3f800000
14029d965 mov r8, qword ptr [rsp + 0x2e8]
14029d96d mov qword ptr [rsp + 0xd8], rbx
14029d975 mov qword ptr [rsp + 0xe0], r15
14029d97d mov qword ptr [rsp + 0xe8], rbx
14029d985 mov qword ptr [rsp + 0xf0], 0
14029d991 mov qword ptr [rsp + 0xf8], 4
14029d99d mov qword ptr [rsp + 0x100], 0
14029d9a9 mov byte ptr [rsp + 0x108], dl
14029d9b0 mov edx, dword ptr [rsp + 0x68]
14029d9b4 mov r9d, dword ptr [rsp + 0x6b]
14029d9b9 mov dword ptr [rsp + 0x109], edx
14029d9c0 mov dword ptr [rsp + 0x10c], r9d
14029d9c8 mov qword ptr [rsp + 0x110], rax
14029d9d0 mov qword ptr [rsp + 0x118], rcx
14029d9d8 mov dword ptr [rsp + 0x120], 0x41500000
14029d9e3 mov word ptr [rsp + 0x124], 0x190
14029d9ed mov byte ptr [rsp + 0x126], 1
14029d9f5 movups xmm0, xmmword ptr [rsp + 0x70]
14029d9fa movups xmmword ptr [rsp + 0x127], xmm0
14029da02 mov rax, qword ptr [rsp + 0x7d]
14029da07 mov qword ptr [rsp + 0x134], rax
14029da0f movups xmm0, xmmword ptr [rip + 0x5c31eb2]
14029da16 movups xmmword ptr [rsp + 0x13c], xmm0
14029da1e mov dword ptr [rsp + 0x14c], esi
14029da25 movsd xmm0, qword ptr [rip + 0x5c046a3]
14029da2d movsd qword ptr [rsp + 0x150], xmm0
14029da36 mov qword ptr [rsp + 0xd0], r8
14029da3e lea rcx, [rsp + 0x330]
14029da46 lea r8, [rsp + 0xd0]
14029da4e mov rdx, r13
14029da51 call 0x140278cc0
14029da56 mov r15, qword ptr [rsp + 0x320]
14029da5e mov rax, r15
14029da61 movaps xmm6, xmmword ptr [rsp + 0x540]
14029da69 movaps xmm7, xmmword ptr [rsp + 0x550]
14029da71 movaps xmm8, xmmword ptr [rsp + 0x560]
14029da7a movaps xmm9, xmmword ptr [rsp + 0x570]
14029da83 movaps xmm10, xmmword ptr [rsp + 0x580]
14029da8c movaps xmm11, xmmword ptr [rsp + 0x590]
14029da95 movaps xmm12, xmmword ptr [rsp + 0x5a0]
14029da9e movaps xmm13, xmmword ptr [rsp + 0x5b0]
14029daa7 movaps xmm14, xmmword ptr [rsp + 0x5c0]
14029dab0 movaps xmm15, xmmword ptr [rsp + 0x5d0]
14029dab9 add rsp, 0x5e8
14029dac0 pop rbx
14029dac1 pop rbp
14029dac2 pop rdi
14029dac3 pop rsi
14029dac4 pop r12
14029dac6 pop r13
14029dac8 pop r14
14029daca pop r15
14029dacc ret
14029dacd mov rcx, r12
14029dad0 mov rdx, rbx
14029dad3 call 0x145e9bd8b
14029dad8 ud2
