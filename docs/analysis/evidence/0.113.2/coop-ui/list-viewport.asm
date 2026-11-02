14029dd10 push r14
14029dd12 push rsi
14029dd13 push rdi
14029dd14 push rbx
14029dd15 sub rsp, 0x2f8
14029dd1c mov rdi, rdx
14029dd1f mov rsi, rcx
14029dd22 mov r14, qword ptr [rcx]
14029dd25 mov rax, qword ptr [rcx + 0x28]
14029dd29 mov qword ptr [rsp + 0x80], r14
14029dd31 lea rbx, [rsp + 0x88]
14029dd39 movups xmm0, xmmword ptr [rcx + 8]
14029dd3d movups xmmword ptr [rsp + 0x88], xmm0
14029dd45 movups xmm0, xmmword ptr [rcx + 0x18]
14029dd49 movups xmmword ptr [rsp + 0x98], xmm0
14029dd51 mov qword ptr [rsp + 0xa8], rax
14029dd59 movups xmm0, xmmword ptr [rip + 0x5c5fc70]
14029dd60 movaps xmmword ptr [rsp + 0x20], xmm0
14029dd65 mov qword ptr [rsp + 0x30], 0
14029dd6e movups xmm1, xmmword ptr [rip + 0x5c5fc73]
14029dd75 movups xmmword ptr [rsp + 0x38], xmm1
14029dd7a mov qword ptr [rsp + 0x48], 0
14029dd83 movups xmm1, xmmword ptr [rip + 0x5c5fc76]
14029dd8a movaps xmmword ptr [rsp + 0x50], xmm1
14029dd8f mov qword ptr [rsp + 0x60], 0
14029dd98 movups xmm2, xmmword ptr [rip + 0x5c5fc79]
14029dd9f movups xmmword ptr [rsp + 0x68], xmm2
14029dda4 mov qword ptr [rsp + 0x78], 0
14029ddad movaps xmmword ptr [rsp + 0x250], xmm0
14029ddb5 mov rax, qword ptr [rsp + 0x30]
14029ddba mov qword ptr [rsp + 0x260], rax
14029ddc2 mov rax, qword ptr [rsp + 0x38]
14029ddc7 mov qword ptr [rsp + 0x268], rax
14029ddcf mov rax, qword ptr [rsp + 0x40]
14029ddd4 mov qword ptr [rsp + 0x270], rax
14029dddc mov rax, qword ptr [rsp + 0x48]
14029dde1 mov qword ptr [rsp + 0x278], rax
14029dde9 movaps xmmword ptr [rsp + 0x280], xmm1
14029ddf1 mov rax, qword ptr [rsp + 0x60]
14029ddf6 mov qword ptr [rsp + 0x290], rax
14029ddfe mov rax, qword ptr [rsp + 0x68]
14029de03 mov qword ptr [rsp + 0x298], rax
14029de0b movaps xmm0, xmmword ptr [rsp + 0x70]
14029de10 movaps xmmword ptr [rsp + 0x2a0], xmm0
14029de18 xorps xmm0, xmm0
14029de1b movaps xmmword ptr [rsp + 0x2e0], xmm0
14029de23 movaps xmmword ptr [rsp + 0x2d0], xmm0
14029de2b movaps xmmword ptr [rsp + 0x2c0], xmm0
14029de33 movaps xmmword ptr [rsp + 0x2b0], xmm0
14029de3b movups xmmword ptr [rsp + 0x15c], xmm0
14029de43 mov dword ptr [rsp + 0x16c], 0
14029de4e mov dword ptr [rsp + 0x22f], 0
14029de59 mov dword ptr [rsp + 0x232], 0
14029de64 lea rcx, [rsp + 0xb8]
14029de6c lea rdx, [rsp + 0x250]
14029de74 mov r8d, 0xa0
14029de7a call 0x145cf998b
14029de7f mov dword ptr [rsp + 0x158], 1
14029de8a movups xmm0, xmmword ptr [rip + 0x5c5fbf7]
14029de91 movups xmmword ptr [rsp + 0x170], xmm0
14029de99 movups xmm0, xmmword ptr [rip + 0x5c5fbf8]
14029dea0 movups xmmword ptr [rsp + 0x180], xmm0
14029dea8 movups xmm0, xmmword ptr [rip + 0x5c5fbf9]
14029deaf movups xmmword ptr [rsp + 0x190], xmm0
14029deb7 movups xmm0, xmmword ptr [rip + 0x5c5fbfa]
14029debe movups xmmword ptr [rsp + 0x1a0], xmm0
14029dec6 movups xmm0, xmmword ptr [rip + 0x5c5fbfb]
14029decd movups xmmword ptr [rsp + 0x1b0], xmm0
14029ded5 movups xmm0, xmmword ptr [rip + 0x5c5fbfc]
14029dedc movups xmmword ptr [rsp + 0x1c0], xmm0
14029dee4 movups xmm0, xmmword ptr [rip + 0x5c5fbfd]
14029deeb movups xmmword ptr [rsp + 0x1d0], xmm0
14029def3 movups xmm0, xmmword ptr [rip + 0x5c5fbfe]
14029defa movups xmmword ptr [rsp + 0x1e0], xmm0
14029df02 movaps xmm0, xmmword ptr [rip + 0x5c5eea7]
14029df09 movups xmmword ptr [rsp + 0x1f0], xmm0
14029df11 mov dword ptr [rsp + 0x200], 1
14029df1c mov qword ptr [rsp + 0x204], 0
14029df28 mov byte ptr [rsp + 0x20c], 1
14029df30 movsd xmm0, qword ptr [rip + 0x5c2d828]
14029df38 movsd qword ptr [rsp + 0x210], xmm0
14029df41 mov dword ptr [rsp + 0x218], 0x3f800000
14029df4c mov word ptr [rsp + 0x21c], 0x300
14029df56 mov word ptr [rsp + 0x222], 0
14029df60 mov dword ptr [rsp + 0x21e], 0x10000
14029df6b mov dword ptr [rsp + 0x224], 0x10000
14029df76 mov word ptr [rsp + 0x228], 0
14029df80 mov dword ptr [rsp + 0x22a], 0
14029df8b mov byte ptr [rsp + 0x22e], 1
14029df93 lea rax, [rip + 0x5c630e8]
14029df9a mov qword ptr [rsp + 0x238], rax
14029dfa2 mov qword ptr [rsp + 0x240], 0xc
14029dfae mov qword ptr [rsp + 0x248], 0
14029dfba mov qword ptr [rsp + 0xb0], r14
14029dfc2 lea rcx, [rsp + 0x20]
14029dfc7 lea r8, [rsp + 0xb0]
14029dfcf mov rdx, rbx
14029dfd2 call 0x140278760
14029dfd7 mov rdx, qword ptr [rdi]
14029dfda mov r8, qword ptr [rdi + 8]
14029dfde mov r9, qword ptr [rdi + 0x10]
14029dfe2 mov rdi, qword ptr [rsp + 0x20]
14029dfe7 mov rax, qword ptr [rsp + 0x48]
14029dfec mov qword ptr [rsp + 0xb0], rdi
14029dff4 movups xmm0, xmmword ptr [rsp + 0x28]
14029dff9 movups xmmword ptr [rsp + 0xb8], xmm0
14029e001 movups xmm0, xmmword ptr [rsp + 0x38]
14029e006 movups xmmword ptr [rsp + 0xc8], xmm0
14029e00e mov qword ptr [rsp + 0xd8], rax
14029e016 lea rcx, [rsp + 0xb0]
14029e01e call 0x1400384d0
14029e023 lea rcx, [rsp + 0x80]
14029e02b mov rdx, rdi
14029e02e call 0x1401a9660
14029e033 mov rax, rsi
14029e036 add rsp, 0x2f8
14029e03d pop rbx
14029e03e pop rdi
14029e03f pop rsi
14029e040 pop r14
14029e042 ret
