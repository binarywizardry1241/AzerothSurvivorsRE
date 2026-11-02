;0.119.0 #170. Target SHA-256 6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f
;Shared instructions remain canonical in docs/analysis/evidence/0.119.0/friend-achievements/selected-native.asm
;description-lookup
145b3e6cd 488d0d1e9ba901 lea rcx, [rip + 0x1a99b1e]
145b3e6d4 be0f000000 mov esi, 0xf
145b3e6d9 ba0f000000 mov edx, 0xf
145b3e6de 48898d380d0000 mov qword ptr [rbp + 0xd38], rcx
145b3e6e5 e8c6b3feff call 0x145b29ab0
145b3e6ea 488995400d0000 mov qword ptr [rbp + 0xd40], rdx
145b3e6f1 4885c0 test rax, rax
145b3e6f4 488b8d380d0000 mov rcx, qword ptr [rbp + 0xd38]
145b3e6fb 480f45c8 cmovne rcx, rax
145b3e6ff 48898d380d0000 mov qword ptr [rbp + 0xd38], rcx
145b3e706 488b85400d0000 mov rax, qword ptr [rbp + 0xd40]
145b3e70d 480f44c6 cmove rax, rsi
145b3e711 488985400d0000 mov qword ptr [rbp + 0xd40], rax
145b3e718 488d0de29aa901 lea rcx, [rip + 0x1a99ae2]
145b3e71f be65000000 mov esi, 0x65
145b3e724 ba65000000 mov edx, 0x65
145b3e729 48898d480d0000 mov qword ptr [rbp + 0xd48], rcx
145b3e730 e87bb3feff call 0x145b29ab0
145b3e735 488995500d0000 mov qword ptr [rbp + 0xd50], rdx
145b3e73c 4885c0 test rax, rax
145b3e73f 488b8d480d0000 mov rcx, qword ptr [rbp + 0xd48]
145b3e746 480f45c8 cmovne rcx, rax
145b3e74a 48898d480d0000 mov qword ptr [rbp + 0xd48], rcx
145b3e751 488b85500d0000 mov rax, qword ptr [rbp + 0xd50]
145b3e758 480f44c6 cmove rax, rsi
145b3e75c 488985500d0000 mov qword ptr [rbp + 0xd50], rax
;descriptor
145b3eef6 488d057793a901 lea rax, [rip + 0x1a99377]
145b3eefd 488985d8030000 mov qword ptr [rbp + 0x3d8], rax
145b3ef04 48c785e00300000d000000 mov qword ptr [rbp + 0x3e0], 0xd
145b3ef0f 488b85380d0000 mov rax, qword ptr [rbp + 0xd38]
145b3ef16 488985e8030000 mov qword ptr [rbp + 0x3e8], rax
145b3ef1d 488b85400d0000 mov rax, qword ptr [rbp + 0xd40]
145b3ef24 488985f0030000 mov qword ptr [rbp + 0x3f0], rax
145b3ef2b 488b85480d0000 mov rax, qword ptr [rbp + 0xd48]
145b3ef32 488985f8030000 mov qword ptr [rbp + 0x3f8], rax
145b3ef39 488b85500d0000 mov rax, qword ptr [rbp + 0xd50]
145b3ef40 48898500040000 mov qword ptr [rbp + 0x400], rax
145b3ef47 488d053393a901 lea rax, [rip + 0x1a99333]
145b3ef4e 48898508040000 mov qword ptr [rbp + 0x408], rax
145b3ef55 48c7851004000011000000 mov qword ptr [rbp + 0x410], 0x11
145b3ef60 c7851804000032000000 mov dword ptr [rbp + 0x418], 0x32
145b3ef6a c6852004000009 mov byte ptr [rbp + 0x420], 9
145b3ef71 c6852104000000 mov byte ptr [rbp + 0x421], 0
145b3ef78 c78524040000e2030000 mov dword ptr [rbp + 0x424], 0x3e2
145b3ef82 488d05e792a901 lea rax, [rip + 0x1a992e7]
145b3ef89 48898528040000 mov qword ptr [rbp + 0x428], rax
145b3ef90 48c7853004000001000000 mov qword ptr [rbp + 0x430], 1
145b3ef9b 48c7853804000001000000 mov qword ptr [rbp + 0x438], 1
145b3efa6 488d05b992a901 lea rax, [rip + 0x1a992b9]
145b3efad 48898540040000 mov qword ptr [rbp + 0x440], rax
145b3efb4 48c785480400000a000000 mov qword ptr [rbp + 0x448], 0xa
145b3efbf c6855004000001 mov byte ptr [rbp + 0x450], 1
;condition-load
145b42e19 4c89e0 mov rax, r12
145b42e1c 4981c498000000 add r12, 0x98
145b42e23 488985c8000000 mov qword ptr [rbp + 0xc8], rax
145b42e2a 440fb65048 movzx r10d, byte ptr [rax + 0x48]
145b42e2f 4183fa0a cmp r10d, 0xa
145b42e33 73db jae 0x145b42e10
145b42e35 488b85c8000000 mov rax, qword ptr [rbp + 0xc8]
145b42e3c 0fb64849 movzx ecx, byte ptr [rax + 0x49]
145b42e40 888de6000000 mov byte ptr [rbp + 0xe6], cl
145b42e46 0fb6484a movzx ecx, byte ptr [rax + 0x4a]
145b42e4a 888dde000000 mov byte ptr [rbp + 0xde], cl
145b42e50 448b484c mov r9d, dword ptr [rax + 0x4c]
145b42e54 4c8b5850 mov r11, qword ptr [rax + 0x50]
145b42e58 4c8b4058 mov r8, qword ptr [rax + 0x58]
145b42e5c 0f104070 movups xmm0, xmmword ptr [rax + 0x70]
145b42e60 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
145b42e64 f30f6f4060 movdqu xmm0, xmmword ptr [rax + 0x60]
145b42e69 660f7f45c0 movdqa xmmword ptr [rbp - 0x40], xmm0
;condition-dispatch
145b42f72 4489d0 mov eax, r10d
145b42f75 488d0d34f6a901 lea rcx, [rip + 0x1a9f634]
145b42f7c 48630481 movsxd rax, dword ptr [rcx + rax*4]
145b42f80 4801c8 add rax, rcx
145b42f83 ffe0 jmp rax
;boss-event-arm
145b42faa 48837d1000 cmp qword ptr [rbp + 0x10], 0
145b42faf 0f94c0 sete al
145b42fb2 48837d08ff cmp qword ptr [rbp + 8], -1
145b42fb7 0f94c1 sete cl
145b42fba 0fb695e6000000 movzx edx, byte ptr [rbp + 0xe6]
145b42fc1 2295e4000000 and dl, byte ptr [rbp + 0xe4]
145b42fc7 08c1 or cl, al
145b42fc9 08d1 or cl, dl
145b42fcb f6c101 test cl, 1
145b42fce 0f853cfeffff jne 0x145b42e10
145b42fd4 4d85c0 test r8, r8
145b42fd7 0f84ae040000 je 0x145b4348b
145b42fdd 4589c2 mov r10d, r8d
145b42fe0 4183e20f and r10d, 0xf
145b42fe4 48b8f0ffffffffffff1f movabs rax, 0x1ffffffffffffff0
145b42fee 4921c0 and r8, rax
145b42ff1 4b8d3483 lea rsi, [r11 + r8*4]
145b42ff5 41c1e202 shl r10d, 2
145b42ff9 4c8bad88000000 mov r13, qword ptr [rbp + 0x88]
145b43000 4c896550 mov qword ptr [rbp + 0x50], r12
145b43004 4889b5c0000000 mov qword ptr [rbp + 0xc0], rsi
145b4300b eb14 jmp 0x145b43021
145b4300d 0f1f00 nop dword ptr [rax]
145b43010 4983c528 add r13, 0x28
145b43014 4c3bad80000000 cmp r13, qword ptr [rbp + 0x80]
145b4301b 0f84effdffff je 0x145b42e10
145b43021 45394d18 cmp dword ptr [r13 + 0x18], r9d
145b43025 75e9 jne 0x145b43010
145b43027 4d89f4 mov r12, r14
145b4302a 4989ff mov r15, rdi
145b4302d 4c89d7 mov rdi, r10
145b43030 4d89c6 mov r14, r8
145b43033 4489ce mov esi, r9d
145b43036 4c89db mov rbx, r11
145b43050 4189f1 mov r9d, esi
145b43053 4d89f0 mov r8, r14
145b43056 4989fa mov r10, rdi
145b43059 4c89ff mov rdi, r15
145b4305c 4d89e6 mov r14, r12
145b4305f 4c8b6550 mov r12, qword ptr [rbp + 0x50]
145b43063 488bb5c0000000 mov rsi, qword ptr [rbp + 0xc0]
145b4306a 74a4 je 0x145b43010
145b4306c 41807d2102 cmp byte ptr [r13 + 0x21], 2
145b43071 749d je 0x145b43010
145b43073 418b451c mov eax, dword ptr [r13 + 0x1c]
145b43077 660f6ec0 movd xmm0, eax
145b4307b 660f70c000 pshufd xmm0, xmm0, 0
145b43080 31c9 xor ecx, ecx
145b43082 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145b43090 4939c8 cmp r8, rcx
145b43093 7448 je 0x145b430dd
145b43095 f3410f6f0c8b movdqu xmm1, xmmword ptr [r11 + rcx*4]
145b4309b f3410f6f548b10 movdqu xmm2, xmmword ptr [r11 + rcx*4 + 0x10]
145b430a2 f3410f6f5c8b20 movdqu xmm3, xmmword ptr [r11 + rcx*4 + 0x20]
145b430a9 f3410f6f648b30 movdqu xmm4, xmmword ptr [r11 + rcx*4 + 0x30]
145b430b0 660f76d0 pcmpeqd xmm2, xmm0
145b430b4 660f76c8 pcmpeqd xmm1, xmm0
145b430b8 660f6bca packssdw xmm1, xmm2
145b430bc 660f76d8 pcmpeqd xmm3, xmm0
145b430c0 660f76e0 pcmpeqd xmm4, xmm0
145b430c4 660f6bdc packssdw xmm3, xmm4
145b430c8 660f63cb packsswb xmm1, xmm3
145b430cc 660fd7d1 pmovmskb edx, xmm1
145b430d0 4883c110 add rcx, 0x10
145b430d4 85d2 test edx, edx
145b430d6 74b8 je 0x145b43090
145b430d8 e94f010000 jmp 0x145b4322c
145b430dd 31c9 xor ecx, ecx
145b430df 90 nop
145b430e0 4939ca cmp r10, rcx
145b430e3 0f8427ffffff je 0x145b43010
145b430e9 39040e cmp dword ptr [rsi + rcx], eax
145b430ec 488d4904 lea rcx, [rcx + 4]
145b430f0 75ee jne 0x145b430e0
145b430f2 e935010000 jmp 0x145b4322c
;composition-count
145b337cf 4983f805 cmp r8, 5
145b337d3 0f85e8000000 jne 0x145b338c1
145b337d9 0fb65918 movzx ebx, byte ptr [rcx + 0x18]
145b337dd 4885c0 test rax, rax
145b337e0 0f84da010000 je 0x145b339c0
145b337e6 488b7108 mov rsi, qword ptr [rcx + 8]
145b337ea 488b7910 mov rdi, qword ptr [rcx + 0x10]
145b337ee 83f801 cmp eax, 1
145b337f1 0f8423010000 je 0x145b3391a
;bladestorm-members
145b3391a 0fb64204 movzx eax, byte ptr [rdx + 4]
145b3391e 4883ff0b cmp rdi, 0xb
145b33922 0f84c7000000 je 0x145b339ef
145b33928 4883ff0a cmp rdi, 0xa
145b3392c 7593 jne 0x145b338c1
145b3392e 38d8 cmp al, bl
145b33930 758f jne 0x145b338c1
145b33932 440fb64205 movzx r8d, byte ptr [rdx + 5]
145b33937 49b9626c61646573746f movabs r9, 0x6f74736564616c62
145b33941 4c330e xor r9, qword ptr [rsi]
145b33944 440fb75608 movzx r10d, word ptr [rsi + 8]
145b33949 4981f2726d0000 xor r10, 0x6d72
145b33950 4c89c8 mov rax, r9
145b33953 4c09d0 or rax, r10
145b33956 0f94c1 sete cl
145b33959 41d2e8 shr r8b, cl
145b3395c 31c0 xor eax, eax
145b3395e 4d09ca or r10, r9
145b33961 0f855cffffff jne 0x145b338c3
145b33967 41f6c001 test r8b, 1
145b3396b 0f8452ffffff je 0x145b338c3
145b33971 385a0c cmp byte ptr [rdx + 0xc], bl
145b33974 0f8547ffffff jne 0x145b338c1
145b3397a f6420d02 test byte ptr [rdx + 0xd], 2
145b3397e 0f843dffffff je 0x145b338c1
145b33984 385a14 cmp byte ptr [rdx + 0x14], bl
145b33987 0f8534ffffff jne 0x145b338c1
145b3398d f6421502 test byte ptr [rdx + 0x15], 2
145b33991 0f842affffff je 0x145b338c1
145b33997 385a1c cmp byte ptr [rdx + 0x1c], bl
145b3399a 0f8521ffffff jne 0x145b338c1
145b339a0 f6421d02 test byte ptr [rdx + 0x1d], 2
145b339a4 0f8417ffffff je 0x145b338c1
145b339aa 385a24 cmp byte ptr [rdx + 0x24], bl
145b339ad 0f850effffff jne 0x145b338c1
145b339b3 0fb64225 movzx eax, byte ptr [rdx + 0x25]
145b339b7 2402 and al, 2
145b339b9 d0e8 shr al, 1
145b339bb e903ffffff jmp 0x145b338c3
