140017b60 push rbp
140017b61 push r15
140017b63 push r14
140017b65 push r13
140017b67 push r12
140017b69 push rsi
140017b6a push rdi
140017b6b push rbx
140017b6c sub rsp, 0xc38
140017b73 lea rbp, [rsp + 0x80]
140017b7b mov qword ptr [rbp + 0xbb0], 0xfffffffffffffffe
140017b86 lea rcx, [rbp - 0x58]
140017b8a call 0x1404f7650
140017b8f mov rax, qword ptr [rbp - 0x58]
140017b93 cmp rax, -1
140017b97 je 0x1400182ae
140017b9d mov qword ptr [rbp + 0xb80], rax
140017ba4 mov rax, qword ptr [rbp - 0x50]
140017ba8 mov qword ptr [rbp + 0xb88], rax
140017baf mov rax, qword ptr [rbp - 0x48]
140017bb3 mov qword ptr [rbp + 0xb68], rax
140017bba lea rcx, [rbp - 0x58]
140017bbe call 0x145cb3990
140017bc3 nop
140017bc4 mov rax, qword ptr [rbp - 0x58]
140017bc8 cmp rax, -1
140017bcc je 0x140017f8b
140017bd2 mov qword ptr [rbp + 0xba0], rax
140017bd9 mov rcx, qword ptr [rbp - 0x50]
140017bdd mov rdx, qword ptr [rbp - 0x48]
140017be1 mov qword ptr [rbp + 0xb90], rcx
140017be8 call 0x145ca62e0
140017bed nop
140017bee test rax, rax
140017bf1 je 0x140017fcb
140017bf7 mov r8, rdx
140017bfa mov qword ptr [rsp + 0x20], 0xe
140017c03 lea r9, [rip + 0x5e88cae] # 145ea08b8 b'benilla-config.cargo\\registry\\src\\index.crates.io-1949cf8c6b5b557f\\image-0.25.10\\src\\io\\encoder.rs'
140017c0a lea rcx, [rbp - 0x58]
140017c0e mov rdx, rax
140017c11 call 0x145ca61b0
140017c16 nop
140017c17 mov rbx, qword ptr [rbp - 0x58]
140017c1b mov r14, qword ptr [rbp - 0x50]
140017c1f mov rsi, qword ptr [rbp - 0x48]
140017c23 mov rdx, qword ptr [rbp + 0xba0]
140017c2a test rdx, rdx
140017c2d mov rdi, qword ptr [rbp + 0xb80]
140017c34 je 0x140017c48
140017c36 mov r8d, 1
140017c3c mov rcx, qword ptr [rbp + 0xb90]
140017c43 call 0x1400021d0
140017c48 cmp rbx, -1
140017c4c je 0x140018293
140017c52 mov qword ptr [rbp + 0xb70], rbx
140017c59 lea rcx, [rbp + 0xaa0]
140017c60 mov qword ptr [rbp + 0xb10], r14
140017c67 mov rdx, r14
140017c6a mov r8, rsi
140017c6d call 0x145ca5900
140017c72 nop
140017c73 lea rcx, [rbp + 0xb20]
140017c7a mov rdx, qword ptr [rbp + 0xb88]
140017c81 mov r8, qword ptr [rbp + 0xb68]
140017c88 call 0x145ca5900
140017c8d nop
140017c8e mov rsi, qword ptr [rbp + 0xaa8]
140017c95 mov rdi, qword ptr [rbp + 0xb28]
140017c9c cmp rsi, rdi
140017c9f jne 0x140017cf8
140017ca1 movzx eax, byte ptr [rbp + 0xad8]
140017ca8 cmp al, byte ptr [rbp + 0xb58]
140017cae jne 0x140017cf8
140017cb0 cmp byte ptr [rbp + 0xad9], 2
140017cb7 jne 0x140017cf8
140017cb9 cmp byte ptr [rbp + 0xb59], 2
140017cc0 jne 0x140017cf8
140017cc2 cmp byte ptr [rbp + 0xab0], 3
140017cc9 setb al
140017ccc cmp byte ptr [rbp + 0xb30], 3
140017cd3 setb cl
140017cd6 xor cl, al
140017cd8 jne 0x140017cf8
140017cda mov rdx, qword ptr [rbp + 0xb20]
140017ce1 mov rcx, qword ptr [rbp + 0xaa0]
140017ce8 mov r8, rsi
140017ceb call 0x145cf9991
140017cf0 test eax, eax
140017cf2 je 0x140017e27
140017cf8 mov rcx, qword ptr [rbp + 0xaa0]
140017cff movzx eax, byte ptr [rbp + 0xab0]
140017d06 cmp al, 0xff
140017d08 je 0x140017d34
140017d0a mov rdx, qword ptr [rbp + 0xad0]
140017d11 mov qword ptr [rbp + 0xa2f], rdx
140017d18 movups xmm0, xmmword ptr [rbp + 0xab1]
140017d1f movups xmm1, xmmword ptr [rbp + 0xac1]
140017d26 movaps xmmword ptr [rbp + 0xa20], xmm1
140017d2d movaps xmmword ptr [rbp + 0xa10], xmm0
140017d34 movzx edx, byte ptr [rbp + 0xada]
140017d3b movzx r8d, word ptr [rbp + 0xad8]
140017d43 mov qword ptr [rbp + 0x6d8], rcx
140017d4a mov qword ptr [rbp + 0x6e0], rsi
140017d51 mov byte ptr [rbp + 0x6e8], al
140017d57 movaps xmm0, xmmword ptr [rbp + 0xa10]
140017d5e movaps xmm1, xmmword ptr [rbp + 0xa20]
140017d65 movups xmmword ptr [rbp + 0x6e9], xmm0
140017d6c movups xmmword ptr [rbp + 0x6f9], xmm1
140017d73 mov rax, qword ptr [rbp + 0xa2f]
140017d7a mov qword ptr [rbp + 0x708], rax
140017d81 mov word ptr [rbp + 0x710], r8w
140017d89 mov byte ptr [rbp + 0x712], dl
140017d8f mov rcx, qword ptr [rbp + 0xb20]
140017d96 movzx eax, byte ptr [rbp + 0xb30]
140017d9d cmp al, 0xff
140017d9f je 0x140017dcb
140017da1 mov rdx, qword ptr [rbp + 0xb50]
140017da8 mov qword ptr [rbp + 0xaff], rdx
140017daf movups xmm0, xmmword ptr [rbp + 0xb31]
140017db6 movups xmm1, xmmword ptr [rbp + 0xb41]
140017dbd movaps xmmword ptr [rbp + 0xaf0], xmm1
140017dc4 movaps xmmword ptr [rbp + 0xae0], xmm0
140017dcb movzx edx, byte ptr [rbp + 0xb5a]
140017dd2 movzx r8d, word ptr [rbp + 0xb58]
140017dda mov qword ptr [rbp - 0x58], rcx
140017dde mov qword ptr [rbp - 0x50], rdi
140017de2 mov byte ptr [rbp - 0x48], al
140017de5 movaps xmm0, xmmword ptr [rbp + 0xae0]
140017dec movaps xmm1, xmmword ptr [rbp + 0xaf0]
140017df3 movups xmmword ptr [rbp - 0x47], xmm0
140017df7 movups xmmword ptr [rbp - 0x37], xmm1
140017dfb mov rax, qword ptr [rbp + 0xaff]
140017e02 mov qword ptr [rbp - 0x28], rax
140017e06 mov word ptr [rbp - 0x20], r8w
140017e0b mov byte ptr [rbp - 0x1e], dl
140017e0e lea rcx, [rbp + 0x6d8]
140017e15 lea rdx, [rbp - 0x58]
140017e19 call 0x140011280
140017e1e nop
140017e1f test al, al
140017e21 je 0x14001826e
140017e27 lea rcx, [rbp - 0x58]
140017e2b mov rdx, qword ptr [rbp + 0xb88]
140017e32 mov r8, qword ptr [rbp + 0xb68]
140017e39 call 0x145cb6350
140017e3e nop
140017e3f cmp dword ptr [rbp - 0x58], 2
140017e43 jne 0x14001826e
140017e49 mov rax, qword ptr [rbp - 0x50]
140017e4d mov ecx, eax
140017e4f and ecx, 3
140017e52 lea edx, [rcx - 2]
140017e55 cmp edx, 2
140017e58 jb 0x140017e74
140017e5a test rcx, rcx
140017e5d je 0x140017e74
140017e5f dec rax
140017e62 lea rcx, [rbp - 0x50]
140017e66 mov qword ptr [rbp - 0x50], rax
140017e6a mov byte ptr [rbp - 0x58], 3
140017e6e call 0x145cdf070
140017e73 nop
140017e74 call 0x140002200
140017e79 mov ecx, 0x20
140017e7e mov edx, 8
140017e83 call 0x1400021c0
140017e88 mov qword ptr [rbp + 0xba0], rax
140017e8f test rax, rax
140017e92 je 0x140019484
140017e98 mov qword ptr [rsp + 0x20], 0xe
140017ea1 lea rdx, [rip + 0x5e89a20]
140017ea8 lea r9, [rip + 0x5e88a09] # 145ea08b8 b'benilla-config.cargo\\registry\\src\\index.crates.io-1949cf8c6b5b557f\\image-0.25.10\\src\\io\\encoder.rs'
140017eaf lea rcx, [rbp - 0x58]
140017eb3 mov r8d, 0xe
140017eb9 call 0x145ca61b0
140017ebe nop
140017ebf movups xmm0, xmmword ptr [rbp - 0x58]
140017ec3 movups xmm1, xmmword ptr [rbp - 0x48]
140017ec7 mov rax, qword ptr [rbp + 0xba0]
140017ece movups xmmword ptr [rax + 0x10], xmm1
140017ed2 movups xmmword ptr [rax], xmm0
140017ed5 mov qword ptr [rbp + 0xae0], 1
140017ee0 mov qword ptr [rbp + 0xae8], rax
140017ee7 mov qword ptr [rbp + 0xaf0], 1
140017ef2 mov qword ptr [rsp + 0x20], 7
140017efb lea rdx, [rip + 0x5e899c6]
140017f02 lea r9, [rip + 0x5e899a7]
140017f09 lea rcx, [rbp + 0xb20]
140017f10 mov r8d, 0xe
140017f16 call 0x145ca61b0
140017f1b nop
140017f1c mov rdx, qword ptr [rbp + 0xb28]
140017f23 mov r8, qword ptr [rbp + 0xb30]
140017f2a mov qword ptr [rsp + 0x20], 9
140017f33 lea r9, [rip + 0x5e8997d]
140017f3a lea rcx, [rbp + 0xaa0]
140017f41 mov qword ptr [rbp + 0xba0], rdx
140017f48 call 0x145ca61b0
140017f4d nop
140017f4e mov rdx, qword ptr [rbp + 0xaa8]
140017f55 mov r8, qword ptr [rbp + 0xab0]
140017f5c lea rcx, [rbp - 0x58]
140017f60 mov qword ptr [rbp + 0xb90], rdx
140017f67 call 0x145cb6440
140017f6c nop
140017f6d cmp dword ptr [rbp - 0x58], 2
140017f71 jne 0x140017fee
140017f73 mov rax, qword ptr [rbp - 0x50]
140017f77 mov qword ptr [rbp + 0x6e0], rax
140017f7e mov qword ptr [rbp + 0x6d8], 2
140017f89 jmp 0x140018004
140017f8b mov rax, qword ptr [rbp - 0x50]
140017f8f mov ecx, eax
140017f91 and ecx, 3
140017f94 lea edx, [rcx - 2]
140017f97 cmp edx, 2
140017f9a jb 0x140017fbf
140017f9c test rcx, rcx
140017f9f je 0x140017fbf
140017fa1 dec rax
140017fa4 lea rcx, [rbp + 0x6e0]
140017fab mov qword ptr [rbp + 0x6e0], rax
140017fb2 mov byte ptr [rbp + 0x6d8], 3
140017fb9 call 0x145cdf070
140017fbe nop
140017fbf mov rdi, qword ptr [rbp + 0xb80]
140017fc6 jmp 0x140018293
140017fcb mov rbx, 0xffffffffffffffff
140017fd2 mov rdx, qword ptr [rbp + 0xba0]
140017fd9 test rdx, rdx
140017fdc mov rdi, qword ptr [rbp + 0xb80]
140017fe3 jne 0x140017c36
140017fe9 jmp 0x140017c48
140017fee lea rcx, [rbp + 0x6d8]
140017ff5 lea rdx, [rbp - 0x58]
140017ff9 mov r8d, 0x270
140017fff call 0x145cf998b
140018004 mov rdx, qword ptr [rbp + 0xaa0]
14001800b test rdx, rdx
14001800e je 0x140018022
140018010 mov r8d, 1
140018016 mov rcx, qword ptr [rbp + 0xb90]
14001801d call 0x1400021d0
140018022 cmp dword ptr [rbp + 0x6d8], 2
140018029 je 0x1400180e3
14001802f lea rcx, [rbp + 0x468]
140018036 lea rdx, [rbp + 0x6d8]
14001803d mov r8d, 0x270
140018043 call 0x145cf998b
140018048 mov qword ptr [rbp - 0x58], 0
140018050 mov qword ptr [rbp + 0x208], 0
14001805b lea rcx, [rbp + 0xaa0]
140018062 lea rdx, [rbp - 0x58]
140018066 call 0x14007ef10
14001806b nop
14001806c mov rsi, qword ptr [rbp + 0xaa8]
140018073 mov rdi, qword ptr [rbp + 0xab0]
14001807a cmp rdi, 2
14001807e jae 0x140019499
140018084 mov rbx, qword ptr [rbp + 0xaa0]
14001808b mov r14, rdi
14001808e shl r14, 5
140018092 lea rax, [rsi + r14]
140018096 mov qword ptr [rbp - 0x58], rsi
14001809a mov qword ptr [rbp - 0x48], rbx
14001809e mov qword ptr [rbp - 0x50], rsi
1400180a2 mov qword ptr [rbp - 0x40], rax
1400180a6 mov r15d, 1
1400180ac test rdi, rdi
1400180af jne 0x1400194c8
1400180b5 add r15, rdi
1400180b8 mov qword ptr [rbp + 0xaf0], r15
1400180bf test rbx, rbx
1400180c2 je 0x1400180d9
1400180c4 shl rbx, 5
1400180c8 mov r8d, 8
1400180ce mov rcx, rsi
1400180d1 mov rdx, rbx
1400180d4 call 0x1400021d0
1400180d9 cmp qword ptr [rbp + 0x6d8], 2
1400180e1 jne 0x1400180f0
1400180e3 lea rcx, [rbp + 0x6d8]
1400180ea call 0x1400031a0
1400180ef nop
1400180f0 mov rdx, qword ptr [rbp + 0xb20]
1400180f7 test rdx, rdx
1400180fa je 0x14001810f
1400180fc mov r8d, 1
140018102 mov rcx, qword ptr [rbp + 0xba0]
140018109 call 0x1400021d0
14001810e nop
14001810f lea rcx, [rbp + 0xae0]
140018116 call 0x1400657b0
14001811b nop
14001811c mov r15, qword ptr [rbp + 0xaf0]
140018123 mov qword ptr [rbp + 0x9d0], r15
14001812a movups xmm0, xmmword ptr [rbp + 0xae0]
140018131 movaps xmmword ptr [rbp + 0x9c0], xmm0
140018138 test r15, r15
14001813b je 0x14001824c
140018141 mov rdi, qword ptr [rbp + 0x9c8]
140018148 mov qword ptr [rbp + 0x9f8], 0
140018153 mov qword ptr [rbp + 0xa08], 0
14001815e mov rax, r15
140018161 shl rax, 5
140018165 add rax, rdi
140018168 mov qword ptr [rbp + 0x9e0], rax
14001816f lea rsi, [rbp + 0x9f8]
140018176 mov qword ptr [rbp + 0xa58], rdi
14001817d cmp rdi, qword ptr [rbp + 0x9e0]
140018184 je 0x1400181b9
140018186 nop word ptr cs:[rax + rax]
140018190 mov rcx, qword ptr [rdi + 8]
140018194 mov rdx, qword ptr [rdi + 0x10]
140018198 mov qword ptr [rsp + 0x20], rsi
14001819d mov r8d, 1
1400181a3 xor r9d, r9d
1400181a6 call 0x140017550
1400181ab nop
1400181ac add rdi, 0x20
1400181b0 cmp rdi, qword ptr [rbp + 0x9e0]
1400181b7 jne 0x140018190
1400181b9 mov qword ptr [rsp + 0x20], 4
1400181c2 lea r9, [rip + 0x5e89774] # 145ea193d b'partconfig.tomla file has a copycrates\\wenilla-rogue-app\\src\\legacy_config.rs'
1400181c9 lea rcx, [rbp + 0x968]
1400181d0 mov rdx, qword ptr [rbp + 0xb88]
1400181d7 mov r8, qword ptr [rbp + 0xb68]
1400181de call 0x145ca5fd0
1400181e3 nop
1400181e4 mov rdx, qword ptr [rbp + 0x970]
1400181eb mov r8, qword ptr [rbp + 0x978]
1400181f2 lea rcx, [rbp - 0x58]
1400181f6 mov qword ptr [rbp + 0xb78], rdx
1400181fd mov qword ptr [rbp + 0xa78], r8
140018204 call 0x145cb6350
140018209 nop
14001820a cmp dword ptr [rbp - 0x58], 2
14001820e jne 0x1400182c2
140018214 mov rax, qword ptr [rbp - 0x50]
140018218 mov ecx, eax
14001821a and ecx, 3
14001821d lea edx, [rcx - 2]
140018220 cmp edx, 2
140018223 jb 0x1400182de
140018229 test rcx, rcx
14001822c je 0x1400182de
140018232 dec rax
140018235 lea rcx, [rbp - 0x50]
140018239 mov qword ptr [rbp - 0x50], rax
14001823d mov byte ptr [rbp - 0x58], 3
140018241 call 0x145cdf070
140018246 nop
140018247 jmp 0x1400182de
14001824c mov rdx, qword ptr [rbp + 0x9c0]
140018253 test rdx, rdx
140018256 je 0x14001826e
140018258 mov rcx, qword ptr [rbp + 0x9c8]
14001825f shl rdx, 5
140018263 mov r8d, 8
140018269 call 0x1400021d0
14001826e mov rdx, qword ptr [rbp + 0xb70]
140018275 test rdx, rdx
140018278 mov rdi, qword ptr [rbp + 0xb80]
14001827f mov rcx, qword ptr [rbp + 0xb10]
140018286 je 0x140018293
140018288 mov r8d, 1
14001828e call 0x1400021d0
140018293 test rdi, rdi
140018296 je 0x1400182ae
140018298 mov r8d, 1
14001829e mov rcx, qword ptr [rbp + 0xb88]
1400182a5 mov rdx, rdi
1400182a8 call 0x1400021d0
1400182ad nop
1400182ae add rsp, 0xc38
1400182b5 pop rbx
1400182b6 pop rdi
1400182b7 pop rsi
1400182b8 pop r12
1400182ba pop r13
1400182bc pop r14
1400182be pop r15
1400182c0 pop rbp
1400182c1 ret
1400182c2 mov rcx, qword ptr [rbp + 0xb78]
1400182c9 mov rdx, qword ptr [rbp + 0xa78]
1400182d0 call 0x145cb5f90
1400182d5 nop
1400182d6 mov r14, rax
1400182d9 test rax, rax
1400182dc jne 0x140018306
1400182de mov byte ptr [rbp - 0x58], 1
1400182e2 lea rcx, [rbp - 0x58]
1400182e6 mov rdx, qword ptr [rbp + 0xb78]
1400182ed mov r8, qword ptr [rbp + 0xa78]
1400182f4 call 0x145cad750
1400182f9 nop
1400182fa mov r14, rax
1400182fd test rax, rax
140018300 je 0x14001844e
140018306 mov rdx, qword ptr [rbp + 0x968]
14001830d test rdx, rdx
140018310 je 0x140018325
140018312 mov r8d, 1
140018318 mov rcx, qword ptr [rbp + 0xb78]
14001831f call 0x1400021d0
140018324 nop
140018325 lea rcx, [rbp + 0x9f8]
14001832c call 0x1401279a0
140018331 nop
140018332 mov qword ptr [rbp + 0xb20], r14
140018339 mov rax, qword ptr [rbp + 0xb88]
140018340 mov qword ptr [rbp + 0x6d8], rax
140018347 mov rax, qword ptr [rbp + 0xb68]
14001834e mov qword ptr [rbp + 0x6e0], rax
140018355 lea rax, [rbp + 0x6d8]
14001835c mov qword ptr [rbp - 0x58], rax
140018360 lea rax, [rip + 0x5ca7229]
140018367 mov qword ptr [rbp - 0x50], rax
14001836b lea rax, [rbp + 0xb20]
140018372 mov qword ptr [rbp - 0x48], rax
140018376 lea rax, [rip + 0x5cc5023]
14001837d mov qword ptr [rbp - 0x40], rax
140018381 lea rcx, [rip + 0x5e8957b]
140018388 lea rdx, [rbp - 0x58]
14001838c call 0x145cb5ba0
140018391 nop
140018392 mov rax, qword ptr [rbp + 0xb20]
140018399 mov ecx, eax
14001839b and ecx, 3
14001839e lea edx, [rcx - 2]
1400183a1 cmp edx, 2
1400183a4 jb 0x1400183c0
1400183a6 test rcx, rcx
1400183a9 je 0x1400183c0
1400183ab dec rax
1400183ae lea rcx, [rbp - 0x50]
1400183b2 mov qword ptr [rbp - 0x50], rax
1400183b6 mov byte ptr [rbp - 0x58], 3
1400183ba call 0x145cdf070
1400183bf nop
1400183c0 mov rdi, qword ptr [rbp + 0xb80]
1400183c7 mov rbx, qword ptr [rbp + 0xb70]
1400183ce mov r14, qword ptr [rbp + 0xb10]
1400183d5 mov rax, qword ptr [rbp + 0xa58]
1400183dc lea rsi, [rax + 8]
1400183e0 jmp 0x1400183f9
1400183e2 nop word ptr cs:[rax + rax]
1400183f0 add rsi, 0x20
1400183f4 dec r15
1400183f7 je 0x140018412
1400183f9 mov rdx, qword ptr [rsi - 8]
1400183fd test rdx, rdx
140018400 je 0x1400183f0
140018402 mov rcx, qword ptr [rsi]
140018405 mov r8d, 1
14001840b call 0x1400021d0
140018410 jmp 0x1400183f0
140018412 mov rdx, qword ptr [rbp + 0x9c0]
140018419 test rdx, rdx
14001841c je 0x140018434
14001841e shl rdx, 5
140018422 mov r8d, 8
140018428 mov rcx, qword ptr [rbp + 0xa58]
14001842f call 0x1400021d0
140018434 test rbx, rbx
140018437 je 0x140018293
14001843d mov r8d, 1
140018443 mov rcx, r14
140018446 mov rdx, rbx
140018449 jmp 0x14001828e
14001844e mov rax, qword ptr [rbp + 0x9f8]
140018455 xor ecx, ecx
140018457 mov rsi, rax
14001845a test rax, rax
14001845d setne cl
140018460 mov qword ptr [rbp + 0xa50], rcx
140018467 je 0x140018470
140018469 mov rsi, qword ptr [rbp + 0xa08]
140018470 mov rbx, qword ptr [rbp + 0xa00]
140018477 xor edx, edx
140018479 lea r12, [rbp + 0x6d8]
140018480 lea r13, [rbp - 0x58]
140018484 mov qword ptr [rbp + 0x9a0], r15
14001848b jmp 0x140018496
14001848d xor eax, eax
14001848f mov rdx, qword ptr [rbp + 0xa48]
140018496 sub rsi, 1
14001849a jb 0x140019283
1400184a0 test rdx, rdx
1400184a3 jne 0x1400184ea
1400184a5 test byte ptr [rbp + 0xa50], 1
1400184ac je 0x1400184ea
1400184ae mov ecx, 1
1400184b3 mov qword ptr [rbp + 0xa50], rcx
1400184ba test rbx, rbx
1400184bd je 0x140018516
1400184bf mov rcx, rbx
1400184c2 and rcx, 7
1400184c6 je 0x14001851b
1400184c8 mov r8, rax
1400184cb xor edx, edx
1400184cd nop dword ptr [rax]
1400184d0 mov r8, qword ptr [r8 + 0x278]
1400184d7 inc rdx
1400184da cmp rcx, rdx
1400184dd jne 0x1400184d0
1400184df mov rax, rbx
1400184e2 sub rax, rdx
1400184e5 mov rdx, r8
1400184e8 jmp 0x140018521
1400184ea test byte ptr [rbp + 0xa50], 1
1400184f1 je 0x140019442
1400184f7 mov qword ptr [rbp + 0x9e8], rsi
1400184fe movzx ecx, word ptr [rdx + 0x272]
140018505 cmp rbx, rcx
140018508 jae 0x140018590
14001850e mov rdi, rdx
140018511 jmp 0x1400185b6
140018516 mov rdx, rax
140018519 jmp 0x14001856e
14001851b mov rdx, rax
14001851e mov rax, rbx
140018521 cmp rbx, 8
140018525 jb 0x14001856e
140018527 nop word ptr [rax + rax]
140018530 mov rcx, qword ptr [rdx + 0x278]
140018537 mov rcx, qword ptr [rcx + 0x278]
14001853e mov rcx, qword ptr [rcx + 0x278]
140018545 mov rcx, qword ptr [rcx + 0x278]
14001854c mov rcx, qword ptr [rcx + 0x278]
140018553 mov rcx, qword ptr [rcx + 0x278]
14001855a mov rcx, qword ptr [rcx + 0x278]
140018561 mov rdx, qword ptr [rcx + 0x278]
140018568 add rax, -8
14001856c jne 0x140018530
14001856e xor ebx, ebx
140018570 xor eax, eax
140018572 mov qword ptr [rbp + 0x9e8], rsi
140018579 movzx ecx, word ptr [rdx + 0x272]
140018580 cmp rbx, rcx
140018583 jb 0x14001850e
140018585 nop word ptr cs:[rax + rax]
140018590 mov rdi, qword ptr [rdx + 0x160]
140018597 test rdi, rdi
14001859a je 0x140019524
1400185a0 inc rax
1400185a3 movzx ebx, word ptr [rdx + 0x270]
1400185aa mov rdx, rdi
1400185ad cmp bx, word ptr [rdi + 0x272]
1400185b4 jae 0x140018590
1400185b6 test rax, rax
1400185b9 je 0x140018607
1400185bb lea rcx, [rdi + rbx*8]
1400185bf add rcx, 0x280
1400185c6 mov rdx, rax
1400185c9 and rdx, 7
1400185cd je 0x14001861b
1400185cf xor r8d, r8d
1400185d2 nop word ptr cs:[rax + rax]
1400185e0 mov r9, qword ptr [rcx]
1400185e3 lea rcx, [r9 + 0x278]
1400185ea inc r8
1400185ed cmp rdx, r8
1400185f0 jne 0x1400185e0
1400185f2 mov qword ptr [rbp + 0xa48], r9
1400185f9 mov rdx, rax
1400185fc sub rdx, r8
1400185ff cmp rax, 8
140018603 jae 0x140018630
140018605 jmp 0x140018678
140018607 lea rax, [rbx + 1]
14001860b mov qword ptr [rbp + 0xa70], rax
140018612 mov qword ptr [rbp + 0xa48], rdi
140018619 jmp 0x140018683
14001861b mov rdx, rax
14001861e cmp rax, 8
140018622 jb 0x140018678
140018624 nop word ptr cs:[rax + rax]
140018630 mov rax, qword ptr [rcx]
140018633 mov rax, qword ptr [rax + 0x278]
14001863a mov rax, qword ptr [rax + 0x278]
140018641 mov rax, qword ptr [rax + 0x278]
140018648 mov rax, qword ptr [rax + 0x278]
14001864f mov rax, qword ptr [rax + 0x278]
140018656 mov rax, qword ptr [rax + 0x278]
14001865d mov rax, qword ptr [rax + 0x278]
140018664 lea rcx, [rax + 0x278]
14001866b add rdx, -8
14001866f jne 0x140018630
140018671 mov qword ptr [rbp + 0xa48], rax
140018678 mov qword ptr [rbp + 0xa70], 0
140018683 lea rax, [rbx + rbx*2]
140018687 mov rsi, rax
14001868a mov rdx, qword ptr [rdi + rax*8 + 0x178]
140018692 cmp rdx, 2
140018696 jae 0x140019227
14001869c shl rbx, 5
1400186a0 add rbx, rdi
1400186a3 mov r9, qword ptr [rbx + 8]
1400186a7 mov rax, qword ptr [rbx + 0x10]
1400186ab mov qword ptr [rsp + 0x20], rax
1400186b0 lea rcx, [rbp + 0x948]
1400186b7 mov rdx, qword ptr [rbp + 0xb78]
1400186be mov r8, qword ptr [rbp + 0xa78]
1400186c5 call 0x145ca61b0
1400186ca nop
1400186cb mov rcx, qword ptr [rbp + 0x950]
1400186d2 mov rdx, qword ptr [rbp + 0x958]
1400186d9 mov qword ptr [rbp + 0xb18], rcx
1400186e0 mov qword ptr [rbp + 0x9f0], rdx
1400186e7 call 0x145ca62e0
1400186ec nop
1400186ed test rax, rax
1400186f0 je 0x140018711
1400186f2 mov r8, rdx
1400186f5 mov byte ptr [rbp - 0x58], 1
1400186f9 mov rcx, r13
1400186fc mov rdx, rax
1400186ff call 0x145cad750
140018704 nop
140018705 mov r14, rax
140018708 test rax, rax
14001870b jne 0x14001941b
140018711 mov rdx, qword ptr [rbx + 8]
140018715 mov r8, qword ptr [rbx + 0x10]
140018719 lea rcx, [rbp + 0xaa0]
140018720 call 0x145ca5900
140018725 nop
140018726 mov r8d, 0xb
14001872c lea rcx, [rbp + 0xb20]
140018733 lea rdx, [rip + 0x5e89207] # 145ea1941 b'config.tomla file has a copycrates\\wenilla-rogue-app\\src\\legacy_config.rs'
14001873a call 0x145ca5900
14001873f nop
140018740 lea rax, [rdi + rsi*8]
140018744 add rax, 0x168
14001874a mov qword ptr [rbp + 0xa38], rax
140018751 mov r14, qword ptr [rbp + 0xaa8]
140018758 mov rdi, qword ptr [rbp + 0xb28]
14001875f cmp r14, rdi
140018762 jne 0x1400187c6
140018764 movzx ebx, byte ptr [rbp + 0xab0]
14001876b movzx eax, byte ptr [rbp + 0xad8]
140018772 cmp al, byte ptr [rbp + 0xb58]
140018778 jne 0x1400187cd
14001877a cmp byte ptr [rbp + 0xad9], 2
140018781 jne 0x1400187cd
140018783 cmp byte ptr [rbp + 0xb59], 2
14001878a jne 0x1400187cd
14001878c cmp bl, 3
14001878f setb al
140018792 cmp byte ptr [rbp + 0xb30], 3
140018799 setb cl
14001879c xor cl, al
14001879e jne 0x1400187cd
1400187a0 mov rdx, qword ptr [rbp + 0xb20]
1400187a7 mov rcx, qword ptr [rbp + 0xaa0]
1400187ae mov r8, r14
1400187b1 call 0x145cf9991
1400187b6 test eax, eax
1400187b8 jne 0x1400187cd
1400187ba mov rbx, qword ptr [rbp + 0xa38]
1400187c1 jmp 0x1400188f2
1400187c6 movzx ebx, byte ptr [rbp + 0xab0]
1400187cd cmp bl, 0xff
1400187d0 je 0x1400187f9
1400187d2 lea rcx, [rbp + 0xab1]
1400187d9 mov rax, qword ptr [rcx + 0x1f]
1400187dd mov qword ptr [rbp + 0xa2f], rax
1400187e4 movups xmm0, xmmword ptr [rcx]
1400187e7 movups xmm1, xmmword ptr [rcx + 0x10]
1400187eb movaps xmmword ptr [rbp + 0xa20], xmm1
1400187f2 movaps xmmword ptr [rbp + 0xa10], xmm0
1400187f9 mov rax, qword ptr [rbp + 0xaa0]
140018800 movzx ecx, byte ptr [rbp + 0xada]
140018807 movzx edx, word ptr [rbp + 0xad8]
14001880e mov qword ptr [rbp + 0x6d8], rax
140018815 mov qword ptr [rbp + 0x6e0], r14
14001881c mov byte ptr [rbp + 0x6e8], bl
140018822 mov rax, qword ptr [rbp + 0xa2f]
140018829 lea r8, [rbp + 0x6e9]
140018830 mov qword ptr [r8 + 0x1f], rax
140018834 movaps xmm0, xmmword ptr [rbp + 0xa10]
14001883b movaps xmm1, xmmword ptr [rbp + 0xa20]
140018842 movups xmmword ptr [r8 + 0x10], xmm1
140018847 movups xmmword ptr [r8], xmm0
14001884b mov word ptr [rbp + 0x710], dx
140018852 mov byte ptr [rbp + 0x712], cl
140018858 movzx eax, byte ptr [rbp + 0xb30]
14001885f cmp al, 0xff
140018861 je 0x14001888a
140018863 lea rdx, [rbp + 0xb31]
14001886a mov rcx, qword ptr [rdx + 0x1f]
14001886e mov qword ptr [rbp + 0xaff], rcx
140018875 movups xmm0, xmmword ptr [rdx]
140018878 movups xmm1, xmmword ptr [rdx + 0x10]
14001887c movaps xmmword ptr [rbp + 0xaf0], xmm1
140018883 movaps xmmword ptr [rbp + 0xae0], xmm0
14001888a mov rcx, qword ptr [rbp + 0xb20]
140018891 movzx edx, byte ptr [rbp + 0xb5a]
140018898 movzx r8d, word ptr [rbp + 0xb58]
1400188a0 mov qword ptr [rbp - 0x58], rcx
1400188a4 mov qword ptr [rbp - 0x50], rdi
1400188a8 mov byte ptr [rbp - 0x48], al
1400188ab mov rax, qword ptr [rbp + 0xaff]
1400188b2 lea rcx, [rbp - 0x47]
1400188b6 mov qword ptr [rcx + 0x1f], rax
1400188ba movaps xmm0, xmmword ptr [rbp + 0xae0]
1400188c1 movaps xmm1, xmmword ptr [rbp + 0xaf0]
1400188c8 movups xmmword ptr [rcx + 0x10], xmm1
1400188cc movups xmmword ptr [rcx], xmm0
1400188cf mov word ptr [rbp - 0x20], r8w
1400188d4 mov byte ptr [rbp - 0x1e], dl
1400188d7 mov rcx, r12
1400188da mov rdx, r13
1400188dd call 0x140011280
1400188e2 nop
1400188e3 mov rbx, qword ptr [rbp + 0xa38]
1400188ea test al, al
1400188ec je 0x140018fab
1400188f2 mov rcx, qword ptr [rbx + 8]
1400188f6 mov rax, qword ptr [rbx + 0x10]
1400188fa mov qword ptr [rbp + 0x9a8], 0
140018905 mov qword ptr [rbp + 0x9b8], 0
140018910 mov qword ptr [rbp + 0xa80], 0
14001891b mov qword ptr [rbp + 0xa88], 1
140018926 mov qword ptr [rbp + 0xa90], 0
140018931 lea rax, [rax + rax*4]
140018935 lea rax, [rcx + rax*8]
140018939 mov qword ptr [rbp + 0x998], rax
140018940 cmp rcx, qword ptr [rbp + 0x998]
140018947 je 0x140018dab
14001894d mov rdx, qword ptr [rcx + 0x10]
140018951 mov qword ptr [rbp + 0x988], rcx
140018958 mov r8, qword ptr [rcx + 0x18]
14001895c mov byte ptr [rbp + 0xbaf], 1
140018963 mov rcx, r13
140018966 call 0x145cbcb20
14001896b nop
14001896c mov rax, qword ptr [rbp - 0x58]
140018970 cmp rax, -1
140018974 je 0x140018e8a
14001897a mov qword ptr [rbp + 0xa68], rax
140018981 mov rdx, qword ptr [rbp - 0x50]
140018985 mov rsi, qword ptr [rbp - 0x48]
140018989 mov rcx, r13
14001898c mov qword ptr [rbp + 0xa60], rdx
140018993 mov r8, rsi
140018996 call 0x141452c30
14001899b nop
14001899c cmp dword ptr [rbp - 0x58], 2
1400189a0 jne 0x140018ed2
1400189a6 mov qword ptr [rbp + 0x990], rsi
1400189ad lea rcx, [rbp - 0x47]
1400189b1 mov rax, qword ptr [rcx + 7]
1400189b5 mov qword ptr [rbp + 0xa20], rax
1400189bc movups xmm0, xmmword ptr [rcx - 9]
1400189c0 movaps xmmword ptr [rbp + 0xa10], xmm0
1400189c7 mov rbx, qword ptr [rbp + 0xa10]
1400189ce test rbx, rbx
1400189d1 je 0x140018cbd
1400189d7 mov r13, qword ptr [rbp + 0xa18]
1400189de lea rax, [rbx + 0x168]
1400189e5 movzx ecx, word ptr [rbx + 0x272]
1400189ec lea r15, [rbx - 8]
1400189f0 mov qword ptr [rbp + 0xba0], rcx
1400189f7 lea ecx, [rcx*8]
1400189fe lea r14, [rcx + rcx*2]
140018a02 mov rsi, 0xffffffffffffffff
140018a09 nop dword ptr [rax]
140018a10 test r14, r14
140018a13 je 0x140018a70
140018a15 lea r12, [rax + 0x18]
140018a19 mov rdx, qword ptr [rax + 8]
140018a1d mov r8, qword ptr [rax + 0x10]
140018a21 mov rdi, r8
140018a24 sub rdi, 5
140018a28 mov eax, 5
140018a2d cmovae r8, rax
140018a31 neg rdi
140018a34 lea rcx, [rip + 0x5e88e85]
140018a3b call 0x145cf9991
140018a40 cdqe
140018a42 test eax, eax
140018a44 cmovne rdi, rax
140018a48 test rdi, rdi
140018a4b sets al
140018a4e setg cl
140018a51 sub cl, al
140018a53 add r15, 0x20
140018a57 inc rsi
140018a5a add r14, -0x18
140018a5e mov rax, r12
140018a61 cmp cl, 1
140018a64 je 0x140018a10
140018a66 movzx eax, cl
140018a69 test eax, eax
140018a6b je 0x140018a90
140018a6d jmp 0x140018a77
140018a6f nop
140018a70 mov rsi, qword ptr [rbp + 0xba0]
140018a77 sub r13, 1
140018a7b jb 0x140018cbd
140018a81 mov rbx, qword ptr [rbx + rsi*8 + 0x278]
140018a89 jmp 0x1400189de
140018a8e nop
140018a90 cmp byte ptr [r15 - 0x18], 6
140018a95 jne 0x140018cbd
140018a9b cmp qword ptr [r15], 0
140018a9f je 0x140018ad0
140018aa1 mov rdx, qword ptr [r15 - 0x10]
140018aa5 test rdx, rdx
140018aa8 je 0x140019472
140018aae mov r8, qword ptr [r15 - 8]
140018ab2 lea r12, [rbp - 0x58]
140018ab6 mov rcx, r12
140018ab9 call 0x140109f20
140018abe nop
140018abf lea r15, [rbp + 0x6d8]
140018ac6 mov rcx, qword ptr [rbp - 0x58]
140018aca mov rax, qword ptr [rbp - 0x48]
140018ace jmp 0x140018adf
140018ad0 xor eax, eax
140018ad2 xor ecx, ecx
140018ad4 lea r15, [rbp + 0x6d8]
140018adb lea r12, [rbp - 0x58]
140018adf mov rdx, qword ptr [rbp - 0x50]
140018ae3 xor r8d, r8d
140018ae6 test rcx, rcx
140018ae9 setne r8b
140018aed cmove rax, rcx
140018af1 mov qword ptr [rbp - 0x58], r8
140018af5 mov qword ptr [rbp - 0x50], 0
140018afd mov qword ptr [rbp - 0x48], rcx
140018b01 mov qword ptr [rbp - 0x40], rdx
140018b05 mov qword ptr [rbp - 0x38], r8
140018b09 mov qword ptr [rbp - 0x30], 0
140018b11 mov qword ptr [rbp - 0x28], rcx
140018b15 mov qword ptr [rbp - 0x20], rdx
140018b19 mov qword ptr [rbp - 0x18], rax
140018b1d lea rdi, [rbp + 0xaa0]
140018b24 lea rbx, [rbp + 0xb20]
140018b2b lea r14, [rbp + 0xab1]
140018b32 lea r13, [rbp + 0x9a8]
140018b39 jmp 0x140018b50
140018b3b lea rcx, [rbp + 0x6e0]
140018b42 call 0x140106a90
140018b47 nop
140018b48 nop dword ptr [rax + rax]
140018b50 mov rcx, r15
140018b53 mov rdx, r12
140018b56 call 0x14011dad0
140018b5b nop
140018b5c mov rax, qword ptr [rbp + 0x6d8]
140018b63 test rax, rax
140018b66 je 0x140018cb4
140018b6c mov rcx, qword ptr [rbp + 0x6e8]
140018b73 lea r8, [rcx + rcx*2]
140018b77 mov rdx, qword ptr [rax + r8*8 + 0x168]
140018b7f cmp rdx, -1
140018b83 je 0x140018cb4
140018b89 lea r8, [rax + r8*8]
140018b8d add r8, 0x168
140018b94 shl rcx, 5
140018b98 mov qword ptr [rbp + 0xaa0], rdx
140018b9f movups xmm0, xmmword ptr [r8 + 8]
140018ba4 movups xmmword ptr [r14 - 9], xmm0
140018ba9 movups xmm0, xmmword ptr [rax + rcx]
140018bad movups xmm1, xmmword ptr [rax + rcx + 0x10]
140018bb2 movaps xmmword ptr [rbp + 0xb30], xmm1
140018bb9 movaps xmmword ptr [rbp + 0xb20], xmm0
140018bc0 mov rcx, r15
140018bc3 mov rdx, r13
140018bc6 mov r8, rdi
140018bc9 mov r9, rbx
140018bcc call 0x14011d480
140018bd1 nop
140018bd2 movzx eax, byte ptr [rbp + 0x6d8]
140018bd9 cmp eax, 4
140018bdc jg 0x140018c20
140018bde lea ecx, [rax - 1]
140018be1 cmp ecx, 4
140018be4 jb 0x140018b50
140018bea test eax, eax
140018bec jne 0x140018b3b
140018bf2 mov rdx, qword ptr [rbp + 0x6e0]
140018bf9 test rdx, rdx
140018bfc je 0x140018b50
140018c02 mov rcx, qword ptr [rbp + 0x6e8]
140018c09 mov r8d, 1
140018c0f call 0x1400021d0
140018c14 jmp 0x140018b50
140018c19 nop dword ptr [rax]
140018c20 cmp eax, 5
140018c23 je 0x140018c35
140018c25 cmp eax, 0xff
140018c2a je 0x140018b50
140018c30 jmp 0x140018b3b
140018c35 mov rcx, qword ptr [rbp + 0x6e8]
140018c3c mov rax, qword ptr [rbp + 0x6f0]
140018c43 mov qword ptr [rbp + 0xb90], rax
140018c4a mov qword ptr [rbp + 0xa40], rcx
140018c51 mov qword ptr [rbp + 0xba0], 0
140018c5c nop dword ptr [rax]
140018c60 mov rax, qword ptr [rbp + 0xba0]
140018c67 cmp qword ptr [rbp + 0xb90], rax
140018c6e je 0x140018c89
140018c70 inc rax
140018c73 mov qword ptr [rbp + 0xba0], rax
140018c7a lea rsi, [rcx + 0x20]
140018c7e call 0x140069270
140018c83 nop
140018c84 mov rcx, rsi
140018c87 jmp 0x140018c60
140018c89 mov rdx, qword ptr [rbp + 0x6e0]
140018c90 test rdx, rdx
140018c93 je 0x140018b50
140018c99 shl rdx, 5
140018c9d mov r8d, 8
140018ca3 mov rcx, qword ptr [rbp + 0xa40]
140018caa call 0x1400021d0
140018caf jmp 0x140018b50
140018cb4 mov rcx, r12
140018cb7 call 0x14012e030
140018cbc nop
140018cbd mov qword ptr [rbp - 0x58], 0
140018cc5 mov rcx, qword ptr [rbp + 0x990]
140018ccc mov qword ptr [rbp - 0x50], rcx
140018cd0 mov rax, qword ptr [rbp + 0xa60]
140018cd7 mov qword ptr [rbp - 0x48], rax
140018cdb mov qword ptr [rbp - 0x40], rcx
140018cdf mov qword ptr [rbp - 0x38], 0
140018ce7 mov qword ptr [rbp - 0x30], rcx
140018ceb movabs rax, 0xa0000000a
140018cf5 mov qword ptr [rbp - 0x28], rax
140018cf9 mov byte ptr [rbp - 0x20], 1
140018cfd mov word ptr [rbp - 0x18], 0
140018d03 mov byte ptr [rbp - 0x10], 0
140018d07 lea r12, [rbp + 0x6d8]
140018d0e mov rcx, r12
140018d11 lea r13, [rbp - 0x58]
140018d15 mov rdx, r13
140018d18 call 0x14009e3c0
140018d1d nop
140018d1e mov rdx, qword ptr [rbp + 0xa80]
140018d25 test rdx, rdx
140018d28 mov r15, qword ptr [rbp + 0x9a0]
140018d2f je 0x140018d43
140018d31 mov rcx, qword ptr [rbp + 0xa88]
140018d38 mov r8d, 1
140018d3e call 0x1400021d0
140018d43 mov rax, qword ptr [rbp + 0x6e8]
140018d4a mov qword ptr [rbp + 0xa90], rax
140018d51 movups xmm0, xmmword ptr [rbp + 0x6d8]
140018d58 movaps xmmword ptr [rbp + 0xa80], xmm0
140018d5f lea rcx, [rbp + 0xa10]
140018d66 call 0x140106a90
140018d6b nop
140018d6c mov rbx, qword ptr [rbp + 0xa38]
140018d73 mov rcx, qword ptr [rbp + 0x988]
140018d7a add rcx, 0x28
140018d7e mov rdx, qword ptr [rbp + 0xa68]
140018d85 test rdx, rdx
140018d88 je 0x140018940
140018d8e mov r8d, 1
140018d94 mov rsi, rcx
140018d97 mov rcx, qword ptr [rbp + 0xa60]
140018d9e call 0x1400021d0
140018da3 mov rcx, rsi
140018da6 jmp 0x140018940
140018dab mov qword ptr [rbp + 0xaa0], 0
140018db6 mov qword ptr [rbp + 0xab0], 0
140018dc1 call 0x140002200
140018dc6 mov ecx, 5
140018dcb mov edx, 1
140018dd0 call 0x1400021c0
140018dd5 test rax, rax
140018dd8 sete byte ptr [rbp + 0xba0]
140018ddf je 0x140019533
140018de5 mov byte ptr [rax + 4], 0x73
140018de9 mov dword ptr [rax], 0x72617663
140018def mov qword ptr [rbp + 0xb20], 5
140018dfa mov qword ptr [rbp + 0xb28], rax
140018e01 mov qword ptr [rbp + 0xb30], 5
140018e0c mov rax, qword ptr [rbp + 0x9b8]
140018e13 lea rcx, [rbp - 0x47]
140018e17 mov qword ptr [rcx + 7], rax
140018e1b movups xmm0, xmmword ptr [rbp + 0x9a8]
140018e22 movups xmmword ptr [rcx - 9], xmm0
140018e26 mov byte ptr [rbp - 0x58], 6
140018e2a mov rcx, r12
140018e2d lea rdx, [rbp + 0xaa0]
140018e34 lea r8, [rbp + 0xb20]
140018e3b mov r9, r13
140018e3e call 0x14011d480
140018e43 nop
140018e44 movzx eax, byte ptr [rbp + 0x6d8]
140018e4b cmp eax, 4
140018e4e jg 0x14001901d
140018e54 lea ecx, [rax - 1]
140018e57 cmp ecx, 4
140018e5a jb 0x140019068
140018e60 test eax, eax
140018e62 jne 0x140019029
140018e68 mov rdx, qword ptr [rbp + 0x6e0]
140018e6f test rdx, rdx
140018e72 je 0x140019068
140018e78 mov rcx, qword ptr [rbp + 0x6e8]
140018e7f mov r8d, 1
140018e85 jmp 0x140019062
140018e8a mov rax, qword ptr [rbp - 0x50]
140018e8e mov ecx, eax
140018e90 and ecx, 3
140018e93 lea edx, [rcx - 2]
140018e96 cmp edx, 2
140018e99 jb 0x140018f7f
140018e9f test rcx, rcx
140018ea2 je 0x140018f7f
140018ea8 dec rax
140018eab mov qword ptr [rbp + 0x6e0], rax
140018eb2 mov byte ptr [rbp + 0x6d8], 3
140018eb9 mov byte ptr [rbp + 0xbaf], 1
140018ec0 lea rcx, [rbp + 0x6e0]
140018ec7 call 0x145cdf070
140018ecc nop
140018ecd jmp 0x140018f7f
140018ed2 mov rdx, qword ptr [rbp - 0x40]
140018ed6 test rdx, rdx
140018ed9 je 0x140018eea
140018edb mov rcx, qword ptr [rbp - 0x38]
140018edf mov r8d, 1
140018ee5 call 0x1400021d0
140018eea mov rdx, qword ptr [rbp - 0x10]
140018eee test rdx, rdx
140018ef1 jle 0x140018f02
140018ef3 mov rcx, qword ptr [rbp - 8]
140018ef7 mov r8d, 1
140018efd call 0x1400021d0
140018f02 mov r14, qword ptr [rbp - 0x20]
140018f06 mov rsi, qword ptr [rbp - 0x18]
140018f0a test rsi, rsi
140018f0d lea r12, [rbp + 0x6d8]
140018f14 je 0x140018f42
140018f16 lea rdi, [r14 + 8]
140018f1a jmp 0x140018f29
140018f1c nop dword ptr [rax]
140018f20 add rdi, 0x18
140018f24 dec rsi
140018f27 je 0x140018f42
140018f29 mov rdx, qword ptr [rdi - 8]
140018f2d test rdx, rdx
140018f30 je 0x140018f20
140018f32 mov rcx, qword ptr [rdi]
140018f35 mov r8d, 1
140018f3b call 0x1400021d0
140018f40 jmp 0x140018f20
140018f42 mov rax, qword ptr [rbp - 0x28]
140018f46 test rax, rax
140018f49 je 0x140018f61
140018f4b shl rax, 3
140018f4f lea rdx, [rax + rax*2]
140018f53 mov r8d, 8
140018f59 mov rcx, r14
140018f5c call 0x1400021d0
140018f61 mov rdx, qword ptr [rbp + 0xa68]
140018f68 test rdx, rdx
140018f6b je 0x140018f7f
140018f6d mov r8d, 1
140018f73 mov rcx, qword ptr [rbp + 0xa60]
140018f7a call 0x1400021d0
140018f7f mov rdx, qword ptr [rbp + 0xa80]
140018f86 test rdx, rdx
140018f89 je 0x140018f9e
140018f8b mov rcx, qword ptr [rbp + 0xa88]
140018f92 mov r8d, 1
140018f98 call 0x1400021d0
140018f9d nop
140018f9e lea rcx, [rbp + 0x9a8]
140018fa5 call 0x140106a90
140018faa nop
140018fab mov rax, qword ptr [rbx + 0x10]
140018faf test rax, rax
140018fb2 je 0x140019454
140018fb8 mov rdx, qword ptr [rbx + 8]
140018fbc lea rax, [rax + rax*4]
140018fc0 mov rcx, qword ptr [rdx + rax*8 - 0x18]
140018fc5 mov rdx, qword ptr [rdx + rax*8 - 0x10]
140018fca mov r8, qword ptr [rbp + 0xb18]
140018fd1 mov r9, qword ptr [rbp + 0x9f0]
140018fd8 call 0x145cb6080
140018fdd nop
140018fde cmp rax, 1
140018fe2 mov rsi, qword ptr [rbp + 0x9e8]
140018fe9 mov rbx, qword ptr [rbp + 0xa70]
140018ff0 je 0x140019418
140018ff6 mov rdx, qword ptr [rbp + 0x948]
140018ffd test rdx, rdx
140019000 je 0x14001848d
140019006 mov r8d, 1
14001900c mov rcx, qword ptr [rbp + 0xb18]
140019013 call 0x1400021d0
140019018 jmp 0x14001848d
14001901d cmp eax, 5
140019020 je 0x140019038
140019022 cmp eax, 0xff
140019027 je 0x140019068
140019029 lea rcx, [rbp + 0x6e0]
140019030 call 0x140106a90
140019035 nop
140019036 jmp 0x140019068
140019038 lea rcx, [rbp + 0x6e0]
14001903f call 0x140090370
140019044 nop
140019045 mov rdx, qword ptr [rbp + 0x6e0]
14001904c test rdx, rdx
14001904f je 0x140019068
140019051 mov rcx, qword ptr [rbp + 0x6e8]
140019058 shl rdx, 5
14001905c mov r8d, 8
140019062 call 0x1400021d0
140019067 nop
140019068 mov rcx, r13
14001906b lea rdx, [rbp + 0xaa0]
140019072 call 0x14022b520
140019077 nop
140019078 mov rdx, qword ptr [rbp - 0x50]
14001907c cmp dword ptr [rbp - 0x58], 1
140019080 jne 0x1400190b2
140019082 movabs rax, 0x8000000000000005
14001908c cmp rdx, rax
14001908f jl 0x1400191ec
140019095 test rdx, rdx
140019098 je 0x1400191ec
14001909e mov rcx, qword ptr [rbp - 0x48]
1400190a2 mov r8d, 1
1400190a8 call 0x1400021d0
1400190ad jmp 0x1400191ec
1400190b2 lea rax, [rbp - 0x47]
1400190b6 movups xmm0, xmmword ptr [rax - 1]
1400190ba movaps xmmword ptr [rbp + 0xb20], xmm0
1400190c1 cmp rdx, -1
1400190c5 je 0x1400191ec
1400190cb movaps xmm0, xmmword ptr [rbp + 0xb20]
1400190d2 lea rax, [rbp + 0x6e0]
1400190d9 movups xmmword ptr [rax], xmm0
1400190dc mov qword ptr [rbp + 0x6d8], rdx
1400190e3 lea rax, [rbp + 0xa80]
1400190ea mov qword ptr [rbp - 0x58], rax
1400190ee lea rax, [rip - 0x17015]
1400190f5 mov qword ptr [rbp - 0x50], rax
1400190f9 mov qword ptr [rbp - 0x48], r12
1400190fd mov qword ptr [rbp - 0x40], rax
140019101 lea rcx, [rbp + 0xae0]
140019108 lea rdx, [rip + 0x5e887b6]
14001910f mov r8, r13
140019112 call 0x145ccc6e0
140019117 nop
140019118 mov rdx, qword ptr [rbp + 0x6d8]
14001911f test rdx, rdx
140019122 je 0x140019136
140019124 mov rcx, qword ptr [rbp + 0x6e0]
14001912b mov r8d, 1
140019131 call 0x1400021d0
140019136 mov rsi, qword ptr [rbp + 0xae0]
14001913d mov rdi, qword ptr [rbp + 0xae8]
140019144 mov r14, qword ptr [rbp + 0xaf0]
14001914b mov byte ptr [rbp + 0xbaf], 0
140019152 lea rcx, [rbp + 0xaa0]
140019159 call 0x140106a90
14001915e nop
14001915f mov rdx, qword ptr [rbp + 0xa80]
140019166 test rdx, rdx
140019169 je 0x14001917d
14001916b mov rcx, qword ptr [rbp + 0xa88]
140019172 mov r8d, 1
140019178 call 0x1400021d0
14001917d cmp rsi, -1
140019181 je 0x140018fab
140019187 mov qword ptr [rbp + 0xba0], rsi
14001918e mov rcx, qword ptr [rbp + 0xb18]
140019195 mov rdx, qword ptr [rbp + 0x9f0]
14001919c mov qword ptr [rbp + 0xb90], rdi
1400191a3 mov r8, rdi
1400191a6 mov r9, r14
1400191a9 call 0x145cbcfe0
1400191ae nop
1400191af mov r14, rax
1400191b2 mov rdx, qword ptr [rbp + 0xba0]
1400191b9 test rdx, rdx
1400191bc mov rsi, qword ptr [rbp + 0x9e8]
1400191c3 mov rbx, qword ptr [rbp + 0xa70]
1400191ca je 0x1400191de
1400191cc mov r8d, 1
1400191d2 mov rcx, qword ptr [rbp + 0xb90]
1400191d9 call 0x1400021d0
1400191de test r14, r14
1400191e1 je 0x140018ff6
1400191e7 jmp 0x14001941b
1400191ec mov byte ptr [rbp + 0xbaf], 0
1400191f3 lea rcx, [rbp + 0xaa0]
1400191fa call 0x140106a90
1400191ff nop
140019200 mov rdx, qword ptr [rbp + 0xa80]
140019207 test rdx, rdx
14001920a je 0x140018fab
140019210 mov rcx, qword ptr [rbp + 0xa88]
140019217 mov r8d, 1
14001921d call 0x1400021d0
140019222 jmp 0x140018fab
140019227 mov rcx, qword ptr [rdi + rsi*8 + 0x170]
14001922f cmp rdx, 0x15
140019233 jae 0x140019271
140019235 lea rax, [rdx + rdx*4]
140019239 lea rax, [rcx + rax*8]
14001923d mov qword ptr [rbp + 0xb90], rax
140019244 mov qword ptr [rbp + 0xba0], rcx
14001924b lea r14, [rcx + 0x28]
14001924f mov rcx, qword ptr [rbp + 0xba0]
140019256 mov rdx, r14
140019259 call 0x140024c10
14001925e nop
14001925f add r14, 0x28
140019263 cmp r14, qword ptr [rbp + 0xb90]
14001926a jne 0x14001924f
14001926c jmp 0x14001869c
140019271 lea r8, [rbp + 0xb9f]
140019278 call 0x140099370
14001927d nop
14001927e jmp 0x14001869c
140019283 mov rcx, qword ptr [rbp + 0xb78]
14001928a mov rdx, qword ptr [rbp + 0xa78]
140019291 mov r8, qword ptr [rbp + 0xb88]
140019298 mov r9, qword ptr [rbp + 0xb68]
14001929f call 0x145cb6180
1400192a4 nop
1400192a5 mov r14, rax
1400192a8 test rax, rax
1400192ab jne 0x140018306
1400192b1 mov rsi, qword ptr [rbp + 0xa08]
1400192b8 mov rdx, qword ptr [rbp + 0x968]
1400192bf test rdx, rdx
1400192c2 je 0x1400192d7
1400192c4 mov r8d, 1
1400192ca mov rcx, qword ptr [rbp + 0xb78]
1400192d1 call 0x1400021d0
1400192d6 nop
1400192d7 lea rcx, [rbp + 0x9f8]
1400192de call 0x1401279a0
1400192e3 nop
1400192e4 mov qword ptr [rbp + 0xae0], rsi
1400192eb lea rcx, [rbp + 0x6d8]
1400192f2 mov rdx, qword ptr [rbp + 0xa58]
1400192f9 mov r8, qword ptr [rbp + 0x9e0]
140019300 call 0x1400869c0
140019305 nop
140019306 mov rsi, qword ptr [rbp + 0x6e0]
14001930d mov r8, qword ptr [rbp + 0x6e8]
140019314 mov qword ptr [rsp + 0x20], 2
14001931d lea r9, [rip + 0x5e885b2]
140019324 lea rcx, [rbp - 0x58]
140019328 mov rdx, rsi
14001932b call 0x140161890
140019330 nop
140019331 mov rax, qword ptr [rbp - 0x48]
140019335 mov qword ptr [rbp + 0xb30], rax
14001933c movups xmm0, xmmword ptr [rbp - 0x58]
140019340 movaps xmmword ptr [rbp + 0xb20], xmm0
140019347 mov rax, qword ptr [rbp + 0xb88]
14001934e mov qword ptr [rbp + 0xaa0], rax
140019355 mov rax, qword ptr [rbp + 0xb68]
14001935c mov qword ptr [rbp + 0xaa8], rax
140019363 lea rax, [rbp + 0xae0]
14001936a mov qword ptr [rbp - 0x58], rax
14001936e lea rax, [rip + 0x5cc5d0b]
140019375 mov qword ptr [rbp - 0x50], rax
140019379 lea rax, [rbp + 0xb20]
140019380 mov qword ptr [rbp - 0x48], rax
140019384 lea rax, [rip - 0x172ab]
14001938b mov qword ptr [rbp - 0x40], rax
14001938f lea rax, [rbp + 0xaa0]
140019396 mov qword ptr [rbp - 0x38], rax
14001939a lea rax, [rip + 0x5ca61ef]
1400193a1 mov qword ptr [rbp - 0x30], rax
1400193a5 lea rcx, [rip + 0x5e8852c]
1400193ac lea rdx, [rbp - 0x58]
1400193b0 call 0x145cb5ab0
1400193b5 nop
1400193b6 mov qword ptr [rbp + 0xba0], rsi
1400193bd mov rdx, qword ptr [rbp + 0xb20]
1400193c4 test rdx, rdx
1400193c7 je 0x1400193dc
1400193c9 mov rcx, qword ptr [rbp + 0xb28]
1400193d0 mov r8d, 1
1400193d6 call 0x1400021d0
1400193db nop
1400193dc lea rcx, [rbp + 0x6d8]
1400193e3 call 0x140090110
1400193e8 nop
1400193e9 mov rax, qword ptr [rbp + 0x6d8]
1400193f0 test rax, rax
1400193f3 je 0x1400183c0
1400193f9 shl rax, 3
1400193fd lea rdx, [rax + rax*2]
140019401 mov r8d, 8
140019407 mov rcx, qword ptr [rbp + 0xba0]
14001940e call 0x1400021d0
140019413 jmp 0x1400183c0
140019418 mov r14, rdx
14001941b mov rdx, qword ptr [rbp + 0x948]
140019422 test rdx, rdx
140019425 je 0x140018306
14001942b mov r8d, 1
140019431 mov rcx, qword ptr [rbp + 0xb18]
140019438 call 0x1400021d0
14001943d jmp 0x140018306
140019442 lea rcx, [rip + 0x5e883b7]
140019449 call 0x145e9c080
14001944e nop
14001944f jmp 0x140019543
140019454 lea rcx, [rip + 0x5e884f1] # 145ea194c b'a file has a copycrates\\wenilla-rogue-app\\src\\legacy_config.rs'
14001945b lea r8, [rip + 0x5e8852e]
140019462 mov edx, 0x11
140019467 call 0x145e9c040
14001946c nop
14001946d jmp 0x140019543
140019472 lea rcx, [rip + 0x5ebbe57]
140019479 call 0x145e9c080
14001947e nop
14001947f jmp 0x140019543
140019484 mov ecx, 8
140019489 mov edx, 0x20
14001948e call 0x145e9bd71
140019493 nop
140019494 jmp 0x140019543
140019499 cmp rdi, 0x15
14001949d jae 0x140019545
1400194a3 mov byte ptr [rbp + 0xbae], 1
1400194aa lea r9, [rbp + 0xb9f]
1400194b1 mov r8d, 1
1400194b7 mov rcx, rsi
1400194ba mov rdx, rdi
1400194bd call 0x140026750
1400194c2 nop
1400194c3 jmp 0x140018084
1400194c8 mov qword ptr [rsp + 0x20], 0x20
1400194d1 lea rcx, [rbp + 0xae0]
1400194d8 mov edx, 1
1400194dd mov r9d, 8
1400194e3 mov r8, rdi
1400194e6 call 0x145cf9da0
1400194eb nop
1400194ec mov r15, qword ptr [rbp + 0xaf0]
1400194f3 mov rcx, r15
1400194f6 shl rcx, 5
1400194fa add rcx, qword ptr [rbp + 0xae8]
140019501 mov rdx, rsi
140019504 mov r8, r14
140019507 call 0x145cf998b
14001950c add r15, rdi
14001950f mov qword ptr [rbp + 0xaf0], r15
140019516 test rbx, rbx
140019519 jne 0x1400180c4
14001951f jmp 0x1400180d9
140019524 lea rcx, [rip + 0x5e87375]
14001952b call 0x145e9c080
140019530 nop
140019531 jmp 0x140019543
140019533 mov ecx, 1
140019538 mov edx, 5
14001953d call 0x145e9bd8b
140019542 nop
140019543 ud2
140019545 mov byte ptr [rbp + 0xbae], 1
14001954c lea r8, [rbp + 0xb9f]
140019553 mov rcx, rsi
140019556 mov rdx, rdi
140019559 call 0x14580ca00
14001955e nop
14001955f jmp 0x140018084
