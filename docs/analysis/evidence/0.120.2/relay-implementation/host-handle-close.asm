; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145c045b0 55                             push rbp
0000000145c045b1 4157                           push r15
0000000145c045b3 4156                           push r14
0000000145c045b5 4155                           push r13
0000000145c045b7 4154                           push r12
0000000145c045b9 56                             push rsi
0000000145c045ba 57                             push rdi
0000000145c045bb 53                             push rbx
0000000145c045bc 4881ec08010000                 sub rsp, 0x108
0000000145c045c3 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c045cb 48c78580000000feffffff         mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
0000000145c045d6 4889ce                         mov rsi, rcx
0000000145c045d9 4c8b31                         mov r14, qword ptr [rcx]
0000000145c045dc b101                           mov cl, 1
0000000145c045de 31c0                           xor eax, eax
0000000145c045e0 f0410fb04e10                   lock cmpxchg byte ptr [r14 + 0x10], cl
0000000145c045e6 0f85cb010000                   jne 0x145c047b7
0000000145c045ec 4c8b2d85059302                 mov r13, qword ptr [rip + 0x2930585]
0000000145c045f3 498b4500                       mov rax, qword ptr [r13]
0000000145c045f7 48d1e0                         shl rax, 1
0000000145c045fa 4885c0                         test rax, rax
0000000145c045fd 0f85c2010000                   jne 0x145c047c5
0000000145c04603 4531e4                         xor r12d, r12d
0000000145c04606 410fb64611                     movzx eax, byte ptr [r14 + 0x11]
0000000145c0460b 4883c608                       add rsi, 8
0000000145c0460f 4983beb001000000               cmp qword ptr [r14 + 0x1b0], 0
0000000145c04617 0f84cb010000                   je 0x145c047e8
0000000145c0461d 498d8eb8010000                 lea rcx, [r14 + 0x1b8]
0000000145c04624 4889f2                         mov rdx, rsi
0000000145c04627 e8344391fa                     call 0x140518960
0000000145c0462c 4989c0                         mov r8, rax
0000000145c0462f 49c1e839                       shr r8, 0x39
0000000145c04633 498b8e98010000                 mov rcx, qword ptr [r14 + 0x198]
0000000145c0463a 498b96a0010000                 mov rdx, qword ptr [r14 + 0x1a0]
0000000145c04641 66410f6ec0                     movd xmm0, r8d
0000000145c04646 660f60c0                       punpcklbw xmm0, xmm0
0000000145c0464a f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145c0464f 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145c04654 8b3e                           mov edi, dword ptr [rsi]
0000000145c04656 4531c0                         xor r8d, r8d
0000000145c04659 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c0465d 4821d0                         and rax, rdx
0000000145c04660 f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145c04665 660f6fda                       movdqa xmm3, xmm2
0000000145c04669 660f74d8                       pcmpeqb xmm3, xmm0
0000000145c0466d 66440fd7cb                     pmovmskb r9d, xmm3
0000000145c04672 4585c9                         test r9d, r9d
0000000145c04675 7439                           je 0x145c046b0
0000000145c04677 f3450fbcd1                     tzcnt r10d, r9d
0000000145c0467c 4901c2                         add r10, rax
0000000145c0467f 4921d2                         and r10, rdx
0000000145c04682 49f7da                         neg r10
0000000145c04685 4f8d1452                       lea r10, [r10 + r10*2]
0000000145c04689 49c1e204                       shl r10, 4
0000000145c0468d 423b7c11d0                     cmp edi, dword ptr [rcx + r10 - 0x30]
0000000145c04692 743b                           je 0x145c046cf
0000000145c04694 458d51ff                       lea r10d, [r9 - 1]
0000000145c04698 664521ca                       and r10w, r9w
0000000145c0469c 4589d1                         mov r9d, r10d
0000000145c0469f 75d6                           jne 0x145c04677
0000000145c046a1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c046b0 660f74d1                       pcmpeqb xmm2, xmm1
0000000145c046b4 66440fd7ca                     pmovmskb r9d, xmm2
0000000145c046b9 4585c9                         test r9d, r9d
0000000145c046bc 0f8528010000                   jne 0x145c047ea
0000000145c046c2 4c01c0                         add rax, r8
0000000145c046c5 4883c010                       add rax, 0x10
0000000145c046c9 4983c010                       add r8, 0x10
0000000145c046cd eb8e                           jmp 0x145c0465d
0000000145c046cf 4c01d1                         add rcx, r10
0000000145c046d2 8079f801                       cmp byte ptr [rcx - 8], 1
0000000145c046d6 0f850e010000                   jne 0x145c047ea
0000000145c046dc 4489657c                       mov dword ptr [rbp + 0x7c], r12d
0000000145c046e0 4189ff                         mov r15d, edi
0000000145c046e3 897db0                         mov dword ptr [rbp - 0x50], edi
0000000145c046e6 48bb0600000000000080           movabs rbx, 0x8000000000000006
0000000145c046f0 48895da8                       mov qword ptr [rbp - 0x58], rbx
0000000145c046f4 498bbe80010000                 mov rdi, qword ptr [r14 + 0x180]
0000000145c046fb 4c897570                       mov qword ptr [rbp + 0x70], r14
0000000145c046ff 4d8bb688010000                 mov r14, qword ptr [r14 + 0x188]
0000000145c04706 488d4d48                       lea rcx, [rbp + 0x48]
0000000145c0470a 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c0470e e82d672000                     call 0x145e0ae40
0000000145c04713 90                             nop
0000000145c04714 488d5548                       lea rdx, [rbp + 0x48]
0000000145c04718 4889f9                         mov rcx, rdi
0000000145c0471b 41ff5618                       call qword ptr [r14 + 0x18]
0000000145c0471f 90                             nop
0000000145c04720 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c04724 e817f3feff                     call 0x145bf3a40
0000000145c04729 4c8b7570                       mov r14, qword ptr [rbp + 0x70]
0000000145c0472d 49837e78ff                     cmp qword ptr [r14 + 0x78], -1
0000000145c04732 747a                           je 0x145c047ae
0000000145c04734 498d4e18                       lea rcx, [r14 + 0x18]
0000000145c04738 e8e36cffff                     call 0x145bfb420
0000000145c0473d 90                             nop
0000000145c0473e 44897db0                       mov dword ptr [rbp - 0x50], r15d
0000000145c04742 48895da8                       mov qword ptr [rbp - 0x58], rbx
0000000145c04746 488b4570                       mov rax, qword ptr [rbp + 0x70]
0000000145c0474a 48837878ff                     cmp qword ptr [rax + 0x78], -1
0000000145c0474f 7429                           je 0x145c0477a
0000000145c04751 488bb830010000                 mov rdi, qword ptr [rax + 0x130]
0000000145c04758 488b9838010000                 mov rbx, qword ptr [rax + 0x138]
0000000145c0475f 488d4d48                       lea rcx, [rbp + 0x48]
0000000145c04763 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c04767 e8d4662000                     call 0x145e0ae40
0000000145c0476c 90                             nop
0000000145c0476d 488d5548                       lea rdx, [rbp + 0x48]
0000000145c04771 4889f9                         mov rcx, rdi
0000000145c04774 ff5318                         call qword ptr [rbx + 0x18]
0000000145c04777 90                             nop
0000000145c04778 eb27                           jmp 0x145c047a1
0000000145c0477a 488bb880010000                 mov rdi, qword ptr [rax + 0x180]
0000000145c04781 488b9888010000                 mov rbx, qword ptr [rax + 0x188]
0000000145c04788 488d4d48                       lea rcx, [rbp + 0x48]
0000000145c0478c 488d55a8                       lea rdx, [rbp - 0x58]
0000000145c04790 e8ab662000                     call 0x145e0ae40
0000000145c04795 90                             nop
0000000145c04796 488d5548                       lea rdx, [rbp + 0x48]
0000000145c0479a 4889f9                         mov rcx, rdi
0000000145c0479d ff5318                         call qword ptr [rbx + 0x18]
0000000145c047a0 90                             nop
0000000145c047a1 488d4da8                       lea rcx, [rbp - 0x58]
0000000145c047a5 e896f2feff                     call 0x145bf3a40
0000000145c047aa 4c8b7570                       mov r14, qword ptr [rbp + 0x70]
0000000145c047ae 448b657c                       mov r12d, dword ptr [rbp + 0x7c]
0000000145c047b2 4489ff                         mov edi, r15d
0000000145c047b5 eb33                           jmp 0x145c047ea
0000000145c047b7 498d4e10                       lea rcx, [r14 + 0x10]
0000000145c047bb e890bf5400                     call 0x146150750
0000000145c047c0 e927feffff                     jmp 0x145c045ec
0000000145c047c5 e816cd5400                     call 0x1461514e0
0000000145c047ca 4189c4                         mov r12d, eax
0000000145c047cd 4180f401                       xor r12b, 1
0000000145c047d1 410fb64611                     movzx eax, byte ptr [r14 + 0x11]
0000000145c047d6 4883c608                       add rsi, 8
0000000145c047da 4983beb001000000               cmp qword ptr [r14 + 0x1b0], 0
0000000145c047e2 0f8535feffff                   jne 0x145c0461d
0000000145c047e8 8b3e                           mov edi, dword ptr [rsi]
0000000145c047ea 498d8eb8010000                 lea rcx, [r14 + 0x1b8]
0000000145c047f1 4889f2                         mov rdx, rsi
0000000145c047f4 e8674191fa                     call 0x140518960
0000000145c047f9 4989c0                         mov r8, rax
0000000145c047fc 49c1e839                       shr r8, 0x39
0000000145c04800 498b8e98010000                 mov rcx, qword ptr [r14 + 0x198]
0000000145c04807 498b96a0010000                 mov rdx, qword ptr [r14 + 0x1a0]
0000000145c0480e 66410f6ec0                     movd xmm0, r8d
0000000145c04813 660f60c0                       punpcklbw xmm0, xmm0
0000000145c04817 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145c0481c 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145c04821 4531c9                         xor r9d, r9d
0000000145c04824 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c04828 4821d0                         and rax, rdx
0000000145c0482b f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145c04830 660f6fda                       movdqa xmm3, xmm2
0000000145c04834 660f74d8                       pcmpeqb xmm3, xmm0
0000000145c04838 66440fd7d3                     pmovmskb r10d, xmm3
0000000145c0483d 4585d2                         test r10d, r10d
0000000145c04840 742e                           je 0x145c04870
0000000145c04842 f3450fbcda                     tzcnt r11d, r10d
0000000145c04847 4901c3                         add r11, rax
0000000145c0484a 4921d3                         and r11, rdx
0000000145c0484d 4d89d8                         mov r8, r11
0000000145c04850 49f7d8                         neg r8
0000000145c04853 4f8d0440                       lea r8, [r8 + r8*2]
0000000145c04857 49c1e004                       shl r8, 4
0000000145c0485b 423b7c01d0                     cmp edi, dword ptr [rcx + r8 - 0x30]
0000000145c04860 742d                           je 0x145c0488f
0000000145c04862 458d42ff                       lea r8d, [r10 - 1]
0000000145c04866 664521d0                       and r8w, r10w
0000000145c0486a 4589c2                         mov r10d, r8d
0000000145c0486d 75d3                           jne 0x145c04842
0000000145c0486f 90                             nop
0000000145c04870 660f74d1                       pcmpeqb xmm2, xmm1
0000000145c04874 66440fd7c2                     pmovmskb r8d, xmm2
0000000145c04879 4585c0                         test r8d, r8d
0000000145c0487c 0f8559010000                   jne 0x145c049db
0000000145c04882 4c01c8                         add rax, r9
0000000145c04885 4883c010                       add rax, 0x10
0000000145c04889 4983c110                       add r9, 0x10
0000000145c0488d eb99                           jmp 0x145c04828
0000000145c0488f 4901c8                         add r8, rcx
0000000145c04892 49c1e304                       shl r11, 4
0000000145c04896 4f8d0c5b                       lea r9, [r11 + r11*2]
0000000145c0489a 49c1f904                       sar r9, 4
0000000145c0489e 48b8abaaaaaaaaaaaaaa           movabs rax, 0xaaaaaaaaaaaaaaab
0000000145c048a8 490fafc1                       imul rax, r9
0000000145c048ac 4c8d48f0                       lea r9, [rax - 0x10]
0000000145c048b0 4921d1                         and r9, rdx
0000000145c048b3 f3420f6f0409                   movdqu xmm0, xmmword ptr [rcx + r9]
0000000145c048b9 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c048bd 660f74c1                       pcmpeqb xmm0, xmm1
0000000145c048c1 660fd7d0                       pmovmskb edx, xmm0
0000000145c048c5 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145c048ca 660f74c1                       pcmpeqb xmm0, xmm1
0000000145c048ce 66440fd7d0                     pmovmskb r10d, xmm0
0000000145c048d3 6641bb1f00                     mov r11w, 0x1f
0000000145c048d8 66440fbdda                     bsr r11w, dx
0000000145c048dd 4183f30f                       xor r11d, 0xf
0000000145c048e1 4181ca00000100                 or r10d, 0x10000
0000000145c048e8 f3450fbcd2                     tzcnt r10d, r10d
0000000145c048ed 4501da                         add r10d, r11d
0000000145c048f0 b280                           mov dl, 0x80
0000000145c048f2 664183fa0f                     cmp r10w, 0xf
0000000145c048f7 7709                           ja 0x145c04902
0000000145c048f9 49ff86a8010000                 inc qword ptr [r14 + 0x1a8]
0000000145c04900 b2ff                           mov dl, 0xff
0000000145c04902 881401                         mov byte ptr [rcx + rax], dl
0000000145c04905 4288540910                     mov byte ptr [rcx + r9 + 0x10], dl
0000000145c0490a 49ff8eb0010000                 dec qword ptr [r14 + 0x1b0]
0000000145c04911 4d8b78d8                       mov r15, qword ptr [r8 - 0x28]
0000000145c04915 4983ffff                       cmp r15, -1
0000000145c04919 0f84bc000000                   je 0x145c049db
0000000145c0491f 897d6c                         mov dword ptr [rbp + 0x6c], edi
0000000145c04922 4489657c                       mov dword ptr [rbp + 0x7c], r12d
0000000145c04926 498b58e0                       mov rbx, qword ptr [r8 - 0x20]
0000000145c0492a 4d8b68f0                       mov r13, qword ptr [r8 - 0x10]
0000000145c0492e 4d85ed                         test r13, r13
0000000145c04931 747f                           je 0x145c049b2
0000000145c04933 48895d60                       mov qword ptr [rbp + 0x60], rbx
0000000145c04937 4c897570                       mov qword ptr [rbp + 0x70], r14
0000000145c0493b 498b40e8                       mov rax, qword ptr [r8 - 0x18]
0000000145c0493f 31d2                           xor edx, edx
0000000145c04941 4c39f8                         cmp rax, r15
0000000145c04944 4c89f9                         mov rcx, r15
0000000145c04947 480f42ca                       cmovb rcx, rdx
0000000145c0494b 4989c0                         mov r8, rax
0000000145c0494e 4929c8                         sub r8, rcx
0000000145c04951 4c89fb                         mov rbx, r15
0000000145c04954 4c29c3                         sub rbx, r8
0000000145c04957 4f8d3428                       lea r14, [r8 + r13]
0000000145c0495b 4d89ec                         mov r12, r13
0000000145c0495e 4929dc                         sub r12, rbx
0000000145c04961 4c0f42e2                       cmovb r12, rdx
0000000145c04965 4d0f47f7                       cmova r14, r15
0000000145c04969 4d29c6                         sub r14, r8
0000000145c0496c 0f8575020000                   jne 0x145c04be7
0000000145c04972 4c39eb                         cmp rbx, r13
0000000145c04975 4c8b7570                       mov r14, qword ptr [rbp + 0x70]
0000000145c04979 488b5d60                       mov rbx, qword ptr [rbp + 0x60]
0000000145c0497d 7333                           jae 0x145c049b2
0000000145c0497f 488d7b08                       lea rdi, [rbx + 8]
0000000145c04983 eb14                           jmp 0x145c04999
0000000145c04985 66662e0f1f840000000000         nop word ptr cs:[rax + rax]
0000000145c04990 4883c718                       add rdi, 0x18
0000000145c04994 49ffcc                         dec r12
0000000145c04997 7419                           je 0x145c049b2
0000000145c04999 488b57f8                       mov rdx, qword ptr [rdi - 8]
0000000145c0499d 4885d2                         test rdx, rdx
0000000145c049a0 74ee                           je 0x145c04990
0000000145c049a2 488b0f                         mov rcx, qword ptr [rdi]
0000000145c049a5 41b801000000                   mov r8d, 1
0000000145c049ab e820d83ffa                     call 0x1400021d0
0000000145c049b0 ebde                           jmp 0x145c04990
0000000145c049b2 4d85ff                         test r15, r15
0000000145c049b5 448b657c                       mov r12d, dword ptr [rbp + 0x7c]
0000000145c049b9 4c8b2db8019302                 mov r13, qword ptr [rip + 0x29301b8]
0000000145c049c0 8b7d6c                         mov edi, dword ptr [rbp + 0x6c]
0000000145c049c3 7416                           je 0x145c049db
0000000145c049c5 49c1e703                       shl r15, 3
0000000145c049c9 4b8d147f                       lea rdx, [r15 + r15*2]
0000000145c049cd 41b808000000                   mov r8d, 8
0000000145c049d3 4889d9                         mov rcx, rbx
0000000145c049d6 e8f5d73ffa                     call 0x1400021d0
0000000145c049db 498d8ee8010000                 lea rcx, [r14 + 0x1e8]
0000000145c049e2 4889f2                         mov rdx, rsi
0000000145c049e5 e8763f91fa                     call 0x140518960
0000000145c049ea 4989c0                         mov r8, rax
0000000145c049ed 49c1e839                       shr r8, 0x39
0000000145c049f1 498b8ec8010000                 mov rcx, qword ptr [r14 + 0x1c8]
0000000145c049f8 498b96d0010000                 mov rdx, qword ptr [r14 + 0x1d0]
0000000145c049ff 66410f6ec0                     movd xmm0, r8d
0000000145c04a04 660f60c0                       punpcklbw xmm0, xmm0
0000000145c04a08 f20f70c000                     pshuflw xmm0, xmm0, 0
0000000145c04a0d 660f70c044                     pshufd xmm0, xmm0, 0x44
0000000145c04a12 4531c9                         xor r9d, r9d
0000000145c04a15 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c04a19 4821d0                         and rax, rdx
0000000145c04a1c f30f6f1401                     movdqu xmm2, xmmword ptr [rcx + rax]
0000000145c04a21 660f6fda                       movdqa xmm3, xmm2
0000000145c04a25 660f74d8                       pcmpeqb xmm3, xmm0
0000000145c04a29 66440fd7d3                     pmovmskb r10d, xmm3
0000000145c04a2e 4585d2                         test r10d, r10d
0000000145c04a31 742d                           je 0x145c04a60
0000000145c04a33 f3450fbcda                     tzcnt r11d, r10d
0000000145c04a38 4901c3                         add r11, rax
0000000145c04a3b 4921d3                         and r11, rdx
0000000145c04a3e 4d89d8                         mov r8, r11
0000000145c04a41 49f7d8                         neg r8
0000000145c04a44 4d6bc068                       imul r8, r8, 0x68
0000000145c04a48 423b7c0198                     cmp edi, dword ptr [rcx + r8 - 0x68]
0000000145c04a4d 7430                           je 0x145c04a7f
0000000145c04a4f 458d42ff                       lea r8d, [r10 - 1]
0000000145c04a53 664521d0                       and r8w, r10w
0000000145c04a57 4589c2                         mov r10d, r8d
0000000145c04a5a 75d7                           jne 0x145c04a33
0000000145c04a5c 0f1f4000                       nop dword ptr [rax]
0000000145c04a60 660f74d1                       pcmpeqb xmm2, xmm1
0000000145c04a64 66440fd7c2                     pmovmskb r8d, xmm2
0000000145c04a69 4585c0                         test r8d, r8d
0000000145c04a6c 0f853e010000                   jne 0x145c04bb0
0000000145c04a72 4c01c8                         add rax, r9
0000000145c04a75 4883c010                       add rax, 0x10
0000000145c04a79 4983c110                       add r9, 0x10
0000000145c04a7d eb9a                           jmp 0x145c04a19
0000000145c04a7f 4901c8                         add r8, rcx
0000000145c04a82 4d6bcb68                       imul r9, r11, 0x68
0000000145c04a86 49c1f903                       sar r9, 3
0000000145c04a8a 48b8c54eecc44eecc44e           movabs rax, 0x4ec4ec4ec4ec4ec5
0000000145c04a94 490fafc1                       imul rax, r9
0000000145c04a98 4c8d48f0                       lea r9, [rax - 0x10]
0000000145c04a9c 4921d1                         and r9, rdx
0000000145c04a9f f3420f6f0409                   movdqu xmm0, xmmword ptr [rcx + r9]
0000000145c04aa5 660f76c9                       pcmpeqd xmm1, xmm1
0000000145c04aa9 660f74c1                       pcmpeqb xmm0, xmm1
0000000145c04aad 660fd7d0                       pmovmskb edx, xmm0
0000000145c04ab1 f30f6f0401                     movdqu xmm0, xmmword ptr [rcx + rax]
0000000145c04ab6 660f74c1                       pcmpeqb xmm0, xmm1
0000000145c04aba 66440fd7d0                     pmovmskb r10d, xmm0
0000000145c04abf 6641bb1f00                     mov r11w, 0x1f
0000000145c04ac4 66440fbdda                     bsr r11w, dx
0000000145c04ac9 4183f30f                       xor r11d, 0xf
0000000145c04acd 4181ca00000100                 or r10d, 0x10000
0000000145c04ad4 f3450fbcd2                     tzcnt r10d, r10d
0000000145c04ad9 4501da                         add r10d, r11d
0000000145c04adc b280                           mov dl, 0x80
0000000145c04ade 664183fa0f                     cmp r10w, 0xf
0000000145c04ae3 7709                           ja 0x145c04aee
0000000145c04ae5 49ff86d8010000                 inc qword ptr [r14 + 0x1d8]
0000000145c04aec b2ff                           mov dl, 0xff
0000000145c04aee 881401                         mov byte ptr [rcx + rax], dl
0000000145c04af1 4288540910                     mov byte ptr [rcx + r9 + 0x10], dl
0000000145c04af6 49ff8ee0010000                 dec qword ptr [r14 + 0x1e0]
0000000145c04afd 498b70a0                       mov rsi, qword ptr [r8 - 0x60]
0000000145c04b01 4883feff                       cmp rsi, -1
0000000145c04b05 0f84a5000000                   je 0x145c04bb0
0000000145c04b0b 4c897570                       mov qword ptr [rbp + 0x70], r14
0000000145c04b0f 498b78a8                       mov rdi, qword ptr [r8 - 0x58]
0000000145c04b13 4d8b78b8                       mov r15, qword ptr [r8 - 0x48]
0000000145c04b17 4d85ff                         test r15, r15
0000000145c04b1a 7476                           je 0x145c04b92
0000000145c04b1c 4489657c                       mov dword ptr [rbp + 0x7c], r12d
0000000145c04b20 498b40b0                       mov rax, qword ptr [r8 - 0x50]
0000000145c04b24 31d2                           xor edx, edx
0000000145c04b26 4839f0                         cmp rax, rsi
0000000145c04b29 4889f1                         mov rcx, rsi
0000000145c04b2c 480f42ca                       cmovb rcx, rdx
0000000145c04b30 4989c0                         mov r8, rax
0000000145c04b33 4929c8                         sub r8, rcx
0000000145c04b36 4889f3                         mov rbx, rsi
0000000145c04b39 4c29c3                         sub rbx, r8
0000000145c04b3c 4f8d2438                       lea r12, [r8 + r15]
0000000145c04b40 4d89fe                         mov r14, r15
0000000145c04b43 4929de                         sub r14, rbx
0000000145c04b46 4c0f42f2                       cmovb r14, rdx
0000000145c04b4a 4c0f47e6                       cmova r12, rsi
0000000145c04b4e 4d29c4                         sub r12, r8
0000000145c04b51 0f85df000000                   jne 0x145c04c36
0000000145c04b57 4c39fb                         cmp rbx, r15
0000000145c04b5a 448b657c                       mov r12d, dword ptr [rbp + 0x7c]
0000000145c04b5e 4c8b2d13009302                 mov r13, qword ptr [rip + 0x2930013]
0000000145c04b65 732b                           jae 0x145c04b92
0000000145c04b67 488d5f10                       lea rbx, [rdi + 0x10]
0000000145c04b6b eb0c                           jmp 0x145c04b79
0000000145c04b6d 0f1f00                         nop dword ptr [rax]
0000000145c04b70 4883c320                       add rbx, 0x20
0000000145c04b74 49ffce                         dec r14
0000000145c04b77 7419                           je 0x145c04b92
0000000145c04b79 488b53f8                       mov rdx, qword ptr [rbx - 8]
0000000145c04b7d 4885d2                         test rdx, rdx
0000000145c04b80 74ee                           je 0x145c04b70
0000000145c04b82 488b0b                         mov rcx, qword ptr [rbx]
0000000145c04b85 41b801000000                   mov r8d, 1
0000000145c04b8b e840d63ffa                     call 0x1400021d0
0000000145c04b90 ebde                           jmp 0x145c04b70
0000000145c04b92 4885f6                         test rsi, rsi
0000000145c04b95 4c8b7570                       mov r14, qword ptr [rbp + 0x70]
0000000145c04b99 7415                           je 0x145c04bb0
0000000145c04b9b 48c1e605                       shl rsi, 5
0000000145c04b9f 41b808000000                   mov r8d, 8
0000000145c04ba5 4889f9                         mov rcx, rdi
0000000145c04ba8 4889f2                         mov rdx, rsi
0000000145c04bab e820d63ffa                     call 0x1400021d0
0000000145c04bb0 4584e4                         test r12b, r12b
0000000145c04bb3 7510                           jne 0x145c04bc5
0000000145c04bb5 498b4500                       mov rax, qword ptr [r13]
0000000145c04bb9 48d1e0                         shl rax, 1
0000000145c04bbc 4885c0                         test rax, rax
0000000145c04bbf 0f85c3000000                   jne 0x145c04c88
0000000145c04bc5 31c0                           xor eax, eax
0000000145c04bc7 41864610                       xchg byte ptr [r14 + 0x10], al
0000000145c04bcb 3c02                           cmp al, 2
0000000145c04bcd 0f84a4000000                   je 0x145c04c77
0000000145c04bd3 4881c408010000                 add rsp, 0x108
0000000145c04bda 5b                             pop rbx
0000000145c04bdb 5f                             pop rdi
0000000145c04bdc 5e                             pop rsi
0000000145c04bdd 415c                           pop r12
0000000145c04bdf 415d                           pop r13
0000000145c04be1 415e                           pop r14
0000000145c04be3 415f                           pop r15
0000000145c04be5 5d                             pop rbp
0000000145c04be6 c3                             ret
0000000145c04be7 48c1e003                       shl rax, 3
0000000145c04beb 488d0440                       lea rax, [rax + rax*2]
0000000145c04bef 48c1e103                       shl rcx, 3
0000000145c04bf3 488d0c49                       lea rcx, [rcx + rcx*2]
0000000145c04bf7 4829c8                         sub rax, rcx
0000000145c04bfa 488b4d60                       mov rcx, qword ptr [rbp + 0x60]
0000000145c04bfe 488d3c08                       lea rdi, [rax + rcx]
0000000145c04c02 4883c708                       add rdi, 8
0000000145c04c06 eb15                           jmp 0x145c04c1d
0000000145c04c08 0f1f840000000000               nop dword ptr [rax + rax]
0000000145c04c10 4883c718                       add rdi, 0x18
0000000145c04c14 49ffce                         dec r14
0000000145c04c17 0f8455fdffff                   je 0x145c04972
0000000145c04c1d 488b57f8                       mov rdx, qword ptr [rdi - 8]
0000000145c04c21 4885d2                         test rdx, rdx
0000000145c04c24 74ea                           je 0x145c04c10
0000000145c04c26 488b0f                         mov rcx, qword ptr [rdi]
0000000145c04c29 41b801000000                   mov r8d, 1
0000000145c04c2f e89cd53ffa                     call 0x1400021d0
0000000145c04c34 ebda                           jmp 0x145c04c10
0000000145c04c36 48c1e005                       shl rax, 5
0000000145c04c3a 48c1e105                       shl rcx, 5
0000000145c04c3e 4829c8                         sub rax, rcx
0000000145c04c41 4c8d2c07                       lea r13, [rdi + rax]
0000000145c04c45 4983c510                       add r13, 0x10
0000000145c04c49 eb12                           jmp 0x145c04c5d
0000000145c04c4b 0f1f440000                     nop dword ptr [rax + rax]
0000000145c04c50 4983c520                       add r13, 0x20
0000000145c04c54 49ffcc                         dec r12
0000000145c04c57 0f84fafeffff                   je 0x145c04b57
0000000145c04c5d 498b55f8                       mov rdx, qword ptr [r13 - 8]
0000000145c04c61 4885d2                         test rdx, rdx
0000000145c04c64 74ea                           je 0x145c04c50
0000000145c04c66 498b4d00                       mov rcx, qword ptr [r13]
0000000145c04c6a 41b801000000                   mov r8d, 1
0000000145c04c70 e85bd53ffa                     call 0x1400021d0
0000000145c04c75 ebd9                           jmp 0x145c04c50
0000000145c04c77 4983c610                       add r14, 0x10
0000000145c04c7b 4c89f1                         mov rcx, r14
0000000145c04c7e e88dbb5400                     call 0x146150810
0000000145c04c83 e94bffffff                     jmp 0x145c04bd3
0000000145c04c88 e853c85400                     call 0x1461514e0
0000000145c04c8d 84c0                           test al, al
0000000145c04c8f 0f8530ffffff                   jne 0x145c04bc5
0000000145c04c95 41c6461101                     mov byte ptr [r14 + 0x11], 1
0000000145c04c9a e926ffffff                     jmp 0x145c04bc5
