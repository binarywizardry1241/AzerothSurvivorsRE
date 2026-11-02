0000000145b44670 55                             push rbp
0000000145b44671 4157                           push r15
0000000145b44673 4156                           push r14
0000000145b44675 4155                           push r13
0000000145b44677 4154                           push r12
0000000145b44679 56                             push rsi
0000000145b4467a 57                             push rdi
0000000145b4467b 53                             push rbx
0000000145b4467c 4881ec98010000                 sub rsp, 0x198
0000000145b44683 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145b4468b 440f29bd00010000               movaps xmmword ptr [rbp + 0x100], xmm15
0000000145b44693 440f29b5f0000000               movaps xmmword ptr [rbp + 0xf0], xmm14
0000000145b4469b 440f29ade0000000               movaps xmmword ptr [rbp + 0xe0], xmm13
0000000145b446a3 440f29a5d0000000               movaps xmmword ptr [rbp + 0xd0], xmm12
0000000145b446ab 440f299dc0000000               movaps xmmword ptr [rbp + 0xc0], xmm11
0000000145b446b3 440f2995b0000000               movaps xmmword ptr [rbp + 0xb0], xmm10
0000000145b446bb 440f298da0000000               movaps xmmword ptr [rbp + 0xa0], xmm9
0000000145b446c3 440f298590000000               movaps xmmword ptr [rbp + 0x90], xmm8
0000000145b446cb 0f29bd80000000                 movaps xmmword ptr [rbp + 0x80], xmm7
0000000145b446d2 0f297570                       movaps xmmword ptr [rbp + 0x70], xmm6
0000000145b446d6 48c74568feffffff               mov qword ptr [rbp + 0x68], 0xfffffffffffffffe
0000000145b446de 48894dc0                       mov qword ptr [rbp - 0x40], rcx
0000000145b446e2 48c745f800000000               mov qword ptr [rbp - 8], 0
0000000145b446ea 48c7450008000000               mov qword ptr [rbp], 8
0000000145b446f2 48c7450800000000               mov qword ptr [rbp + 8], 0
0000000145b446fa 4c8b5208                       mov r10, qword ptr [rdx + 8]
0000000145b446fe 488b4210                       mov rax, qword ptr [rdx + 0x10]
0000000145b44702 48c1e004                       shl rax, 4
0000000145b44706 4c01d0                         add rax, r10
0000000145b44709 488945b8                       mov qword ptr [rbp - 0x48], rax
0000000145b4470d f30f10358b3a6500               movss xmm6, dword ptr [rip + 0x653a8b]
0000000145b44715 f30f103d433b6500               movss xmm7, dword ptr [rip + 0x653b43]
0000000145b4471d f3440f100546416500             movss xmm8, dword ptr [rip + 0x654146]
0000000145b44726 f3440f100d013b6500             movss xmm9, dword ptr [rip + 0x653b01]
0000000145b4472f f3440f1015cc3a6500             movss xmm10, dword ptr [rip + 0x653acc]
0000000145b44738 be00000000                     mov esi, 0
0000000145b4473d eb05                           jmp 0x145b44744
0000000145b4473f 90                             nop
0000000145b44740 4c8b55b0                       mov r10, qword ptr [rbp - 0x50]
0000000145b44744 4c3b55b8                       cmp r10, qword ptr [rbp - 0x48]
0000000145b44748 0f8403050000                   je 0x145b44c51
0000000145b4474e 498b02                         mov rax, qword ptr [r10]
0000000145b44751 410fb64a08                     movzx ecx, byte ptr [r10 + 8]
0000000145b44756 4c8b4020                       mov r8, qword ptr [rax + 0x20]
0000000145b4475a 4d85c0                         test r8, r8
0000000145b4475d 7451                           je 0x145b447b0
0000000145b4475f 0fb6909a000000                 movzx edx, byte ptr [rax + 0x9a]
0000000145b44766 84d2                           test dl, dl
0000000145b44768 0f8455050000                   je 0x145b44cc3
0000000145b4476e 0fb6c9                         movzx ecx, cl
0000000145b44771 440fb6ca                       movzx r9d, dl
0000000145b44775 38d1                           cmp cl, dl
0000000145b44777 440f42c9                       cmovb r9d, ecx
0000000145b4477b 488b5028                       mov rdx, qword ptr [rax + 0x28]
0000000145b4477f 41fec9                         dec r9b
0000000145b44782 84c9                           test cl, cl
0000000145b44784 410fb6c9                       movzx ecx, r9b
0000000145b44788 41b900000000                   mov r9d, 0
0000000145b4478e 410f44c9                       cmove ecx, r9d
0000000145b44792 0fb6c9                         movzx ecx, cl
0000000145b44795 4839ca                         cmp rdx, rcx
0000000145b44798 0f8666050000                   jbe 0x145b44d04
0000000145b4479e f3450f102488                   movss xmm12, dword ptr [r8 + rcx*4]
0000000145b447a4 eb16                           jmp 0x145b447bc
0000000145b447a6 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145b447b0 0fb6c9                         movzx ecx, cl
0000000145b447b3 450f57e4                       xorps xmm12, xmm12
0000000145b447b7 f3440f2ae1                     cvtsi2ss xmm12, ecx
0000000145b447bc 498d4a10                       lea rcx, [r10 + 0x10]
0000000145b447c0 48894db0                       mov qword ptr [rbp - 0x50], rcx
0000000145b447c4 488b5860                       mov rbx, qword ptr [rax + 0x60]
0000000145b447c8 488b4068                       mov rax, qword ptr [rax + 0x68]
0000000145b447cc 48c1e006                       shl rax, 6
0000000145b447d0 4801d8                         add rax, rbx
0000000145b447d3 488945a8                       mov qword ptr [rbp - 0x58], rax
0000000145b447d7 4c8955c8                       mov qword ptr [rbp - 0x38], r10
0000000145b447db eb7d                           jmp 0x145b4485a
0000000145b447dd 0f1f00                         nop dword ptr [rax]
0000000145b447e0 4883c340                       add rbx, 0x40
0000000145b447e4 488b4500                       mov rax, qword ptr [rbp]
0000000145b447e8 488d0cf6                       lea rcx, [rsi + rsi*8]
0000000145b447ec 488b55a0                       mov rdx, qword ptr [rbp - 0x60]
0000000145b447f0 488914c8                       mov qword ptr [rax + rcx*8], rdx
0000000145b447f4 40887cc808                     mov byte ptr [rax + rcx*8 + 8], dil
0000000145b447f9 44887cc809                     mov byte ptr [rax + rcx*8 + 9], r15b
0000000145b447fe 66448974c80a                   mov word ptr [rax + rcx*8 + 0xa], r14w
0000000145b44804 f3440f115cc80c                 movss dword ptr [rax + rcx*8 + 0xc], xmm11
0000000145b4480b 44886cc810                     mov byte ptr [rax + rcx*8 + 0x10], r13b
0000000145b44810 8b5558                         mov edx, dword ptr [rbp + 0x58]
0000000145b44813 448b455b                       mov r8d, dword ptr [rbp + 0x5b]
0000000145b44817 8954c811                       mov dword ptr [rax + rcx*8 + 0x11], edx
0000000145b4481b 448944c814                     mov dword ptr [rax + rcx*8 + 0x14], r8d
0000000145b44820 4c8964c818                     mov qword ptr [rax + rcx*8 + 0x18], r12
0000000145b44825 488b5528                       mov rdx, qword ptr [rbp + 0x28]
0000000145b44829 488954c820                     mov qword ptr [rax + rcx*8 + 0x20], rdx
0000000145b4482e f3440f116cc828                 movss dword ptr [rax + rcx*8 + 0x28], xmm13
0000000145b44835 0fb65563                       movzx edx, byte ptr [rbp + 0x63]
0000000145b44839 8854c82c                       mov byte ptr [rax + rcx*8 + 0x2c], dl
0000000145b4483d 0f284530                       movaps xmm0, xmmword ptr [rbp + 0x30]
0000000145b44841 0f1144c82d                     movups xmmword ptr [rax + rcx*8 + 0x2d], xmm0
0000000145b44846 0f10453b                       movups xmm0, xmmword ptr [rbp + 0x3b]
0000000145b4484a 0f1144c838                     movups xmmword ptr [rax + rcx*8 + 0x38], xmm0
0000000145b4484f 48ffc6                         inc rsi
0000000145b44852 48897508                       mov qword ptr [rbp + 8], rsi
0000000145b44856 4c8b55c8                       mov r10, qword ptr [rbp - 0x38]
0000000145b4485a 483b5da8                       cmp rbx, qword ptr [rbp - 0x58]
0000000145b4485e 0f84dcfeffff                   je 0x145b44740
0000000145b44864 498b02                         mov rax, qword ptr [r10]
0000000145b44867 488945a0                       mov qword ptr [rbp - 0x60], rax
0000000145b4486b 0fb63b                         movzx edi, byte ptr [rbx]
0000000145b4486e 8d47db                         lea eax, [rdi - 0x25]
0000000145b44871 83ff25                         cmp edi, 0x25
0000000145b44874 0fb6c0                         movzx eax, al
0000000145b44877 b902000000                     mov ecx, 2
0000000145b4487c 0f42c1                         cmovb eax, ecx
0000000145b4487f 84c0                           test al, al
0000000145b44881 744d                           je 0x145b448d0
0000000145b44883 0fb6c0                         movzx eax, al
0000000145b44886 83f801                         cmp eax, 1
0000000145b44889 7565                           jne 0x145b448f0
0000000145b4488b 440fb66b08                     movzx r13d, byte ptr [rbx + 8]
0000000145b44890 8b430c                         mov eax, dword ptr [rbx + 0xc]
0000000145b44893 894513                         mov dword ptr [rbp + 0x13], eax
0000000145b44896 8b4309                         mov eax, dword ptr [rbx + 9]
0000000145b44899 894510                         mov dword ptr [rbp + 0x10], eax
0000000145b4489c 4c8b6310                       mov r12, qword ptr [rbx + 0x10]
0000000145b448a0 488b4318                       mov rax, qword ptr [rbx + 0x18]
0000000145b448a4 48894528                       mov qword ptr [rbp + 0x28], rax
0000000145b448a8 0fb64324                       movzx eax, byte ptr [rbx + 0x24]
0000000145b448ac 884563                         mov byte ptr [rbp + 0x63], al
0000000145b448af f3440f106b20                   movss xmm13, dword ptr [rbx + 0x20]
0000000145b448b5 f3450f59ec                     mulss xmm13, xmm12
0000000145b448ba 40b726                         mov dil, 0x26
0000000145b448bd e95a030000                     jmp 0x145b44c1c
0000000145b448c2 66666666662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b448d0 440fb66b08                     movzx r13d, byte ptr [rbx + 8]
0000000145b448d5 f3440f105b04                   movss xmm11, dword ptr [rbx + 4]
0000000145b448db f3450f59dc                     mulss xmm11, xmm12
0000000145b448e0 40b725                         mov dil, 0x25
0000000145b448e3 e934030000                     jmp 0x145b44c1c
0000000145b448e8 0f1f840000000000               nop dword ptr [rax + rax]
0000000145b448f0 440fb65301                     movzx r10d, byte ptr [rbx + 1]
0000000145b448f5 440fb77302                     movzx r14d, word ptr [rbx + 2]
0000000145b448fa f3440f105b04                   movss xmm11, dword ptr [rbx + 4]
0000000145b44900 4c8b6b08                       mov r13, qword ptr [rbx + 8]
0000000145b44904 4c8b6310                       mov r12, qword ptr [rbx + 0x10]
0000000145b44908 488b4b18                       mov rcx, qword ptr [rbx + 0x18]
0000000145b4490c 48894d28                       mov qword ptr [rbp + 0x28], rcx
0000000145b44910 f3440f106b20                   movss xmm13, dword ptr [rbx + 0x20]
0000000145b44916 0fb64b24                       movzx ecx, byte ptr [rbx + 0x24]
0000000145b4491a 884d63                         mov byte ptr [rbp + 0x63], cl
0000000145b4491d 488d4b25                       lea rcx, [rbx + 0x25]
0000000145b44921 488b55c8                       mov rdx, qword ptr [rbp - 0x38]
0000000145b44925 8b5208                         mov edx, dword ptr [rdx + 8]
0000000145b44928 80fa01                         cmp dl, 1
0000000145b4492b 83d200                         adc edx, 0
0000000145b4492e 83ff24                         cmp edi, 0x24
0000000145b44931 776c                           ja 0x145b4499f
0000000145b44933 0fb6d2                         movzx edx, dl
0000000145b44936 0f57c0                         xorps xmm0, xmm0
0000000145b44939 f30f2ac2                       cvtsi2ss xmm0, edx
0000000145b4493d 66410f6ecd                     movd xmm1, r13d
0000000145b44942 4c89ea                         mov rdx, r13
0000000145b44945 48c1ea20                       shr rdx, 0x20
0000000145b44949 4189f8                         mov r8d, edi
0000000145b4494c 4c8d0d890fb401                 lea r9, [rip + 0x1b40f89]
0000000145b44953 4f630481                       movsxd r8, dword ptr [r9 + r8*4]
0000000145b44957 4d01c8                         add r8, r9
0000000145b4495a 41ffe0                         jmp r8
0000000145b4495d 8b5107                         mov edx, dword ptr [rcx + 7]
0000000145b44960 895537                         mov dword ptr [rbp + 0x37], edx
0000000145b44963 488b09                         mov rcx, qword ptr [rcx]
0000000145b44966 48894d30                       mov qword ptr [rbp + 0x30], rcx
0000000145b4496a e96a010000                     jmp 0x145b44ad9
0000000145b4496f 8b5107                         mov edx, dword ptr [rcx + 7]
0000000145b44972 895537                         mov dword ptr [rbp + 0x37], edx
0000000145b44975 488b09                         mov rcx, qword ptr [rcx]
0000000145b44978 48894d30                       mov qword ptr [rbp + 0x30], rcx
0000000145b4497c f3440f59d8                     mulss xmm11, xmm0
0000000145b44981 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b44985 4489d2                         mov edx, r10d
0000000145b44988 e925020000                     jmp 0x145b44bb2
0000000145b4498d 8b510f                         mov edx, dword ptr [rcx + 0xf]
0000000145b44990 89553f                         mov dword ptr [rbp + 0x3f], edx
0000000145b44993 0f1009                         movups xmm1, xmmword ptr [rcx]
0000000145b44996 0f294d30                       movaps xmmword ptr [rbp + 0x30], xmm1
0000000145b4499a e91d010000                     jmp 0x145b44abc
0000000145b4499f 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b449a3 0f1001                         movups xmm0, xmmword ptr [rcx]
0000000145b449a6 0f10490b                       movups xmm1, xmmword ptr [rcx + 0xb]
0000000145b449aa 0f294530                       movaps xmmword ptr [rbp + 0x30], xmm0
0000000145b449ae 0f114d3b                       movups xmmword ptr [rbp + 0x3b], xmm1
0000000145b449b2 4489d2                         mov edx, r10d
0000000145b449b5 e9fd010000                     jmp 0x145b44bb7
0000000145b449ba 0f28ce                         movaps xmm1, xmm6
0000000145b449bd f30f5fc8                       maxss xmm1, xmm0
0000000145b449c1 0f28c7                         movaps xmm0, xmm7
0000000145b449c4 f30f5dc1                       minss xmm0, xmm1
0000000145b449c8 0f57c9                         xorps xmm1, xmm1
0000000145b449cb f30f5fc8                       maxss xmm1, xmm0
0000000145b449cf 410f28c0                       movaps xmm0, xmm8
0000000145b449d3 f30f5dc1                       minss xmm0, xmm1
0000000145b449d7 f30f2cd0                       cvttss2si edx, xmm0
0000000145b449db 440fb77564                     movzx r14d, word ptr [rbp + 0x64]
0000000145b449e0 450f28df                       movaps xmm11, xmm15
0000000145b449e4 e97c010000                     jmp 0x145b44b65
0000000145b449e9 8b5107                         mov edx, dword ptr [rcx + 7]
0000000145b449ec 895537                         mov dword ptr [rbp + 0x37], edx
0000000145b449ef 488b09                         mov rcx, qword ptr [rcx]
0000000145b449f2 48894d30                       mov qword ptr [rbp + 0x30], rcx
0000000145b449f6 f3440f59d8                     mulss xmm11, xmm0
0000000145b449fb 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b449ff 4489e0                         mov eax, r12d
0000000145b44a02 48b900000000ffffffff           movabs rcx, 0xffffffff00000000
0000000145b44a0c 4489d2                         mov edx, r10d
0000000145b44a0f 4c8b6520                       mov r12, qword ptr [rbp + 0x20]
0000000145b44a13 4921cc                         and r12, rcx
0000000145b44a16 4909c4                         or r12, rax
0000000145b44a19 e994010000                     jmp 0x145b44bb2
0000000145b44a1e f3440f59d8                     mulss xmm11, xmm0
0000000145b44a23 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b44a27 eb2d                           jmp 0x145b44a56
0000000145b44a29 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b44a2d 0fb711                         movzx edx, word ptr [rcx]
0000000145b44a30 66895530                       mov word ptr [rbp + 0x30], dx
0000000145b44a34 0fb64902                       movzx ecx, byte ptr [rcx + 2]
0000000145b44a38 884d32                         mov byte ptr [rbp + 0x32], cl
0000000145b44a3b f3440f59d8                     mulss xmm11, xmm0
0000000145b44a40 e967010000                     jmp 0x145b44bac
0000000145b44a45 f30f59c8                       mulss xmm1, xmm0
0000000145b44a49 f30f114d58                     movss dword ptr [rbp + 0x58], xmm1
0000000145b44a4e 89555c                         mov dword ptr [rbp + 0x5c], edx
0000000145b44a51 66410f7ecd                     movd r13d, xmm1
0000000145b44a56 0fb64567                       movzx eax, byte ptr [rbp + 0x67]
0000000145b44a5a 89c2                           mov edx, eax
0000000145b44a5c eb1c                           jmp 0x145b44a7a
0000000145b44a5e f30f5fc6                       maxss xmm0, xmm6
0000000145b44a62 660fefc9                       pxor xmm1, xmm1
0000000145b44a66 f30f5fc8                       maxss xmm1, xmm0
0000000145b44a6a 410f28c0                       movaps xmm0, xmm8
0000000145b44a6e f30f5dc1                       minss xmm0, xmm1
0000000145b44a72 f30f2cd0                       cvttss2si edx, xmm0
0000000145b44a76 44896d58                       mov dword ptr [rbp + 0x58], r13d
0000000145b44a7a 440fb77564                     movzx r14d, word ptr [rbp + 0x64]
0000000145b44a7f 488b4518                       mov rax, qword ptr [rbp + 0x18]
0000000145b44a83 48894528                       mov qword ptr [rbp + 0x28], rax
0000000145b44a87 450f28ee                       movaps xmm13, xmm14
0000000145b44a8b 0fb64562                       movzx eax, byte ptr [rbp + 0x62]
0000000145b44a8f 884563                         mov byte ptr [rbp + 0x63], al
0000000145b44a92 e920010000                     jmp 0x145b44bb7
0000000145b44a97 8b5107                         mov edx, dword ptr [rcx + 7]
0000000145b44a9a 895537                         mov dword ptr [rbp + 0x37], edx
0000000145b44a9d 488b09                         mov rcx, qword ptr [rcx]
0000000145b44aa0 48894d30                       mov qword ptr [rbp + 0x30], rcx
0000000145b44aa4 f30f59c8                       mulss xmm1, xmm0
0000000145b44aa8 f30f114d58                     movss dword ptr [rbp + 0x58], xmm1
0000000145b44aad eb53                           jmp 0x145b44b02
0000000145b44aaf 8b5107                         mov edx, dword ptr [rcx + 7]
0000000145b44ab2 895537                         mov dword ptr [rbp + 0x37], edx
0000000145b44ab5 488b09                         mov rcx, qword ptr [rcx]
0000000145b44ab8 48894d30                       mov qword ptr [rbp + 0x30], rcx
0000000145b44abc f3440f59d8                     mulss xmm11, xmm0
0000000145b44ac1 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b44ac5 e9e2000000                     jmp 0x145b44bac
0000000145b44aca 0f1009                         movups xmm1, xmmword ptr [rcx]
0000000145b44acd 0f10510b                       movups xmm2, xmmword ptr [rcx + 0xb]
0000000145b44ad1 0f11553b                       movups xmmword ptr [rbp + 0x3b], xmm2
0000000145b44ad5 0f294d30                       movaps xmmword ptr [rbp + 0x30], xmm1
0000000145b44ad9 f3440f59d8                     mulss xmm11, xmm0
0000000145b44ade 44896d58                       mov dword ptr [rbp + 0x58], r13d
0000000145b44ae2 e9c5000000                     jmp 0x145b44bac
0000000145b44ae7 448b4107                       mov r8d, dword ptr [rcx + 7]
0000000145b44aeb 44894537                       mov dword ptr [rbp + 0x37], r8d
0000000145b44aef 488b09                         mov rcx, qword ptr [rcx]
0000000145b44af2 48894d30                       mov qword ptr [rbp + 0x30], rcx
0000000145b44af6 f30f59c8                       mulss xmm1, xmm0
0000000145b44afa f30f114d58                     movss dword ptr [rbp + 0x58], xmm1
0000000145b44aff 89555c                         mov dword ptr [rbp + 0x5c], edx
0000000145b44b02 66410f7ecd                     movd r13d, xmm1
0000000145b44b07 e9a0000000                     jmp 0x145b44bac
0000000145b44b0c 448b410f                       mov r8d, dword ptr [rcx + 0xf]
0000000145b44b10 4489453f                       mov dword ptr [rbp + 0x3f], r8d
0000000145b44b14 0f1009                         movups xmm1, xmmword ptr [rcx]
0000000145b44b17 0f294d30                       movaps xmmword ptr [rbp + 0x30], xmm1
0000000145b44b1b 4183fdff                       cmp r13d, -1
0000000145b44b1f 745d                           je 0x145b44b7e
0000000145b44b21 4c896d58                       mov qword ptr [rbp + 0x58], r13
0000000145b44b25 4489e0                         mov eax, r12d
0000000145b44b28 48b900000000ffffffff           movabs rcx, 0xffffffff00000000
0000000145b44b32 4c8b6520                       mov r12, qword ptr [rbp + 0x20]
0000000145b44b36 4921cc                         and r12, rcx
0000000145b44b39 4909c4                         or r12, rax
0000000145b44b3c f3440f59d8                     mulss xmm11, xmm0
0000000145b44b41 eb69                           jmp 0x145b44bac
0000000145b44b43 f3410f58c1                     addss xmm0, xmm9
0000000145b44b48 f3410f59c2                     mulss xmm0, xmm10
0000000145b44b4d f30f58c6                       addss xmm0, xmm6
0000000145b44b51 f30f5fc6                       maxss xmm0, xmm6
0000000145b44b55 f3440f59d8                     mulss xmm11, xmm0
0000000145b44b5a 0fb64567                       movzx eax, byte ptr [rbp + 0x67]
0000000145b44b5e 89c2                           mov edx, eax
0000000145b44b60 440fb77564                     movzx r14d, word ptr [rbp + 0x64]
0000000145b44b65 488b4518                       mov rax, qword ptr [rbp + 0x18]
0000000145b44b69 48894528                       mov qword ptr [rbp + 0x28], rax
0000000145b44b6d 450f28ee                       movaps xmm13, xmm14
0000000145b44b71 0fb64562                       movzx eax, byte ptr [rbp + 0x62]
0000000145b44b75 884563                         mov byte ptr [rbp + 0x63], al
0000000145b44b78 4c8b6520                       mov r12, qword ptr [rbp + 0x20]
0000000145b44b7c eb39                           jmp 0x145b44bb7
0000000145b44b7e 660f6eca                       movd xmm1, edx
0000000145b44b82 f30f59c8                       mulss xmm1, xmm0
0000000145b44b86 c74558ffffffff                 mov dword ptr [rbp + 0x58], 0xffffffff
0000000145b44b8d f30f114d5c                     movss dword ptr [rbp + 0x5c], xmm1
0000000145b44b92 4489e0                         mov eax, r12d
0000000145b44b95 48b900000000ffffffff           movabs rcx, 0xffffffff00000000
0000000145b44b9f 4c8b6520                       mov r12, qword ptr [rbp + 0x20]
0000000145b44ba3 4921cc                         and r12, rcx
0000000145b44ba6 4909c4                         or r12, rax
0000000145b44ba9 41b5ff                         mov r13b, 0xff
0000000145b44bac 0fb64567                       movzx eax, byte ptr [rbp + 0x67]
0000000145b44bb0 89c2                           mov edx, eax
0000000145b44bb2 440fb77564                     movzx r14d, word ptr [rbp + 0x64]
0000000145b44bb7 488d4d59                       lea rcx, [rbp + 0x59]
0000000145b44bbb 8b01                           mov eax, dword ptr [rcx]
0000000145b44bbd 8b4903                         mov ecx, dword ptr [rcx + 3]
0000000145b44bc0 894d13                         mov dword ptr [rbp + 0x13], ecx
0000000145b44bc3 894510                         mov dword ptr [rbp + 0x10], eax
0000000145b44bc6 0fb74530                       movzx eax, word ptr [rbp + 0x30]
0000000145b44bca 668945d0                       mov word ptr [rbp - 0x30], ax
0000000145b44bce 0fb64532                       movzx eax, byte ptr [rbp + 0x32]
0000000145b44bd2 8845d2                         mov byte ptr [rbp - 0x2e], al
0000000145b44bd5 8b4533                         mov eax, dword ptr [rbp + 0x33]
0000000145b44bd8 8945d3                         mov dword ptr [rbp - 0x2d], eax
0000000145b44bdb 8b4537                         mov eax, dword ptr [rbp + 0x37]
0000000145b44bde 8945d7                         mov dword ptr [rbp - 0x29], eax
0000000145b44be1 8b453b                         mov eax, dword ptr [rbp + 0x3b]
0000000145b44be4 8945db                         mov dword ptr [rbp - 0x25], eax
0000000145b44be7 0fb6453f                       movzx eax, byte ptr [rbp + 0x3f]
0000000145b44beb 8845df                         mov byte ptr [rbp - 0x21], al
0000000145b44bee 0f10453b                       movups xmm0, xmmword ptr [rbp + 0x3b]
0000000145b44bf2 0f1145db                       movups xmmword ptr [rbp - 0x25], xmm0
0000000145b44bf6 4189d7                         mov r15d, edx
0000000145b44bf9 885567                         mov byte ptr [rbp + 0x67], dl
0000000145b44bfc 6644897564                     mov word ptr [rbp + 0x64], r14w
0000000145b44c01 450f28fb                       movaps xmm15, xmm11
0000000145b44c05 488b4528                       mov rax, qword ptr [rbp + 0x28]
0000000145b44c09 48894518                       mov qword ptr [rbp + 0x18], rax
0000000145b44c0d 450f28f5                       movaps xmm14, xmm13
0000000145b44c11 0fb64563                       movzx eax, byte ptr [rbp + 0x63]
0000000145b44c15 884562                         mov byte ptr [rbp + 0x62], al
0000000145b44c18 4c896520                       mov qword ptr [rbp + 0x20], r12
0000000145b44c1c 8b4510                         mov eax, dword ptr [rbp + 0x10]
0000000145b44c1f 8b4d13                         mov ecx, dword ptr [rbp + 0x13]
0000000145b44c22 894d5b                         mov dword ptr [rbp + 0x5b], ecx
0000000145b44c25 894558                         mov dword ptr [rbp + 0x58], eax
0000000145b44c28 0f2845d0                       movaps xmm0, xmmword ptr [rbp - 0x30]
0000000145b44c2c 0f294530                       movaps xmmword ptr [rbp + 0x30], xmm0
0000000145b44c30 0f1045db                       movups xmm0, xmmword ptr [rbp - 0x25]
0000000145b44c34 0f11453b                       movups xmmword ptr [rbp + 0x3b], xmm0
0000000145b44c38 483b75f8                       cmp rsi, qword ptr [rbp - 8]
0000000145b44c3c 0f859efbffff                   jne 0x145b447e0
0000000145b44c42 488d4df8                       lea rcx, [rbp - 8]
0000000145b44c46 e855784a00                     call 0x145fec4a0
0000000145b44c4b 90                             nop
0000000145b44c4c e98ffbffff                     jmp 0x145b447e0
0000000145b44c51 488b4d08                       mov rcx, qword ptr [rbp + 8]
0000000145b44c55 488b45c0                       mov rax, qword ptr [rbp - 0x40]
0000000145b44c59 48894810                       mov qword ptr [rax + 0x10], rcx
0000000145b44c5d 0f1045f8                       movups xmm0, xmmword ptr [rbp - 8]
0000000145b44c61 0f1100                         movups xmmword ptr [rax], xmm0
0000000145b44c64 0f287570                       movaps xmm6, xmmword ptr [rbp + 0x70]
0000000145b44c68 0f28bd80000000                 movaps xmm7, xmmword ptr [rbp + 0x80]
0000000145b44c6f 440f288590000000               movaps xmm8, xmmword ptr [rbp + 0x90]
0000000145b44c77 440f288da0000000               movaps xmm9, xmmword ptr [rbp + 0xa0]
0000000145b44c7f 440f2895b0000000               movaps xmm10, xmmword ptr [rbp + 0xb0]
0000000145b44c87 440f289dc0000000               movaps xmm11, xmmword ptr [rbp + 0xc0]
0000000145b44c8f 440f28a5d0000000               movaps xmm12, xmmword ptr [rbp + 0xd0]
0000000145b44c97 440f28ade0000000               movaps xmm13, xmmword ptr [rbp + 0xe0]
0000000145b44c9f 440f28b5f0000000               movaps xmm14, xmmword ptr [rbp + 0xf0]
0000000145b44ca7 440f28bd00010000               movaps xmm15, xmmword ptr [rbp + 0x100]
0000000145b44caf 4881c498010000                 add rsp, 0x198
0000000145b44cb6 5b                             pop rbx
0000000145b44cb7 5f                             pop rdi
0000000145b44cb8 5e                             pop rsi
0000000145b44cb9 415c                           pop r12
0000000145b44cbb 415d                           pop r13
0000000145b44cbd 415e                           pop r14
0000000145b44cbf 415f                           pop r15
0000000145b44cc1 5d                             pop rbp
0000000145b44cc2 c3                             ret
0000000145b44cc3 c6455801                       mov byte ptr [rbp + 0x58], 1
0000000145b44cc7 c645d000                       mov byte ptr [rbp - 0x30], 0
0000000145b44ccb 488d4558                       lea rax, [rbp + 0x58]
0000000145b44ccf 48894530                       mov qword ptr [rbp + 0x30], rax
0000000145b44cd3 488d05f68092fa                 lea rax, [rip - 0x56d7f0a]
0000000145b44cda 48894538                       mov qword ptr [rbp + 0x38], rax
0000000145b44cde 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145b44ce2 48894d40                       mov qword ptr [rbp + 0x40], rcx
0000000145b44ce6 48894548                       mov qword ptr [rbp + 0x48], rax
0000000145b44cea 488d0d4405b401                 lea rcx, [rip + 0x1b40544]
0000000145b44cf1 4c8d059816b201                 lea r8, [rip + 0x1b21698]
0000000145b44cf8 488d5530                       lea rdx, [rbp + 0x30]
0000000145b44cfc e82ff96400                     call 0x146194630
0000000145b44d01 90                             nop
0000000145b44d02 eb0d                           jmp 0x145b44d11
0000000145b44d04 4c8d059d16b201                 lea r8, [rip + 0x1b2169d]
0000000145b44d0b e843f76400                     call 0x146194453
0000000145b44d10 90                             nop
0000000145b44d11 0f0b                           ud2
