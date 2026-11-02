00000001402c75a0 push rbp
00000001402c75a1 push r15
00000001402c75a3 push r14
00000001402c75a5 push r13
00000001402c75a7 push r12
00000001402c75a9 push rsi
00000001402c75aa push rdi
00000001402c75ab push rbx
00000001402c75ac sub rsp, 0x718
00000001402c75b3 lea rbp, [rsp + 0x80]
00000001402c75bb movaps xmmword ptr [rbp + 0x680], xmm14
00000001402c75c3 movaps xmmword ptr [rbp + 0x670], xmm13
00000001402c75cb movaps xmmword ptr [rbp + 0x660], xmm12
00000001402c75d3 movaps xmmword ptr [rbp + 0x650], xmm11
00000001402c75db movaps xmmword ptr [rbp + 0x640], xmm10
00000001402c75e3 movaps xmmword ptr [rbp + 0x630], xmm9
00000001402c75eb movaps xmmword ptr [rbp + 0x620], xmm8
00000001402c75f3 movaps xmmword ptr [rbp + 0x610], xmm7
00000001402c75fa movaps xmmword ptr [rbp + 0x600], xmm6
00000001402c7601 mov qword ptr [rbp + 0x5f8], 0xfffffffffffffffe
00000001402c760c mov rdi, rdx
00000001402c760f mov rsi, qword ptr [rcx]
00000001402c7612 mov rax, qword ptr [rcx + 0x28]
00000001402c7616 mov qword ptr [rbp + 0x288], rsi
00000001402c761d movups xmm0, xmmword ptr [rcx + 8]
00000001402c7621 movups xmmword ptr [rbp + 0x290], xmm0
00000001402c7628 mov qword ptr [rbp + 0x5d8], rcx
00000001402c762f movups xmm0, xmmword ptr [rcx + 0x18]
00000001402c7633 movups xmmword ptr [rbp + 0x2a0], xmm0
00000001402c763a mov qword ptr [rbp + 0x2b0], rax
00000001402c7641 mov word ptr [rbp + 0x444], 0
00000001402c764a mov byte ptr [rbp + 0x434], 1
00000001402c7651 xorps xmm0, xmm0
00000001402c7654 movups xmmword ptr [rbp + 0x348], xmm0
00000001402c765b movups xmmword ptr [rbp + 0x358], xmm0
00000001402c7662 movaps xmm1, xmmword ptr [rip + 0x5c35607]
00000001402c7669 movups xmmword ptr [rbp + 0x368], xmm1
00000001402c7670 mov qword ptr [rbp + 0x340], 0
00000001402c767b movups xmmword ptr [rbp + 0x378], xmm0
00000001402c7682 movups xmmword ptr [rbp + 0x388], xmm0
00000001402c7689 mov dword ptr [rbp + 0x458], 0
00000001402c7693 mov word ptr [rbp + 0x45c], 0
00000001402c769c movups xmm7, xmmword ptr [rip + 0x5c363e5]
00000001402c76a3 movups xmmword ptr [rbp + 0x398], xmm7
00000001402c76aa movups xmm8, xmmword ptr [rip + 0x5c363e6]
00000001402c76b2 movups xmmword ptr [rbp + 0x3a8], xmm8
00000001402c76ba movups xmm9, xmmword ptr [rip + 0x5c363e6]
00000001402c76c2 movups xmmword ptr [rbp + 0x3b8], xmm9
00000001402c76ca movups xmm10, xmmword ptr [rip + 0x5c363e6]
00000001402c76d2 movups xmmword ptr [rbp + 0x3c8], xmm10
00000001402c76da movaps xmm0, xmmword ptr [rip + 0x5bda97f]
00000001402c76e1 movups xmmword ptr [rbp + 0x3d8], xmm0
00000001402c76e8 movups xmmword ptr [rbp + 0x3e8], xmm0
00000001402c76ef movaps xmm0, xmmword ptr [rip + 0x5bda9ca]
00000001402c76f6 movups xmmword ptr [rbp + 0x3f8], xmm0
00000001402c76fd movups xmmword ptr [rbp + 0x408], xmm0
00000001402c7704 mov byte ptr [rbp + 0x456], 0
00000001402c770b mov dword ptr [rbp + 0x452], 0
00000001402c7715 mov qword ptr [rbp + 0x438], 0
00000001402c7720 mov dword ptr [rbp + 0x440], 0
00000001402c772a movaps xmm0, xmmword ptr [rip + 0x5bda8ff]
00000001402c7731 movups xmmword ptr [rbp + 0x418], xmm0
00000001402c7738 mov dword ptr [rbp + 0x428], 1
00000001402c7742 mov qword ptr [rbp + 0x42c], 0
00000001402c774d mov byte ptr [rbp + 0x457], 0
00000001402c7754 movups xmm11, xmmword ptr [rip + 0x5c36274]
00000001402c775c movaps xmmword ptr [rbp + 0x2e0], xmm11
00000001402c7764 mov qword ptr [rbp + 0x2f0], 0
00000001402c776f movups xmm12, xmmword ptr [rip + 0x5c36271]
00000001402c7777 movups xmmword ptr [rbp + 0x2f8], xmm12
00000001402c777f mov qword ptr [rbp + 0x308], 0
00000001402c778a movups xmm13, xmmword ptr [rip + 0x5c3626e]
00000001402c7792 movaps xmmword ptr [rbp + 0x310], xmm13
00000001402c779a mov qword ptr [rbp + 0x320], 0
00000001402c77a5 movups xmm14, xmmword ptr [rip + 0x5c3626b]
00000001402c77ad movups xmmword ptr [rbp + 0x328], xmm14
00000001402c77b5 mov qword ptr [rbp + 0x338], 0
00000001402c77c0 mov word ptr [rbp + 0x44a], 0
00000001402c77c9 mov dword ptr [rbp + 0x446], 0x10000
00000001402c77d3 mov word ptr [rbp + 0x450], 0
00000001402c77dc mov dword ptr [rbp + 0x44c], 0x10000
00000001402c77e6 movups xmm6, xmmword ptr [rip + 0x5c36503]
00000001402c77ed movaps xmmword ptr [rbp + 0x540], xmm6
00000001402c77f4 mov dword ptr [rbp + 0x550], 0x3f800000
00000001402c77fe movups xmmword ptr [rbp + 0x554], xmm6
00000001402c7805 mov dword ptr [rbp + 0x564], 0x3f800000
00000001402c780f movups xmmword ptr [rbp + 0x568], xmm6
00000001402c7816 mov dword ptr [rbp + 0x578], 0x3f800000
00000001402c7820 movups xmmword ptr [rbp + 0x57c], xmm6
00000001402c7827 mov dword ptr [rbp + 0x58c], 0x3f800000
00000001402c7831 mov rax, qword ptr [rdx]
00000001402c7834 mov rbx, qword ptr [rdx + 8]
00000001402c7838 mov r14, qword ptr [rax]
00000001402c783b mov rcx, qword ptr [rbx + 0x30]
00000001402c783f mov rdx, qword ptr [rbx + 0x38]
00000001402c7843 call 0x145808f60
00000001402c7848 nop
00000001402c7849 mov r8, qword ptr [rax + 0x20]
00000001402c784d mov r9, qword ptr [rax + 0x28]
00000001402c7851 lea rcx, [rbp + 0x30]
00000001402c7855 mov rdx, r14
00000001402c7858 call 0x1400de550
00000001402c785d nop
00000001402c785e lea rcx, [rbp - 0x58]
00000001402c7862 lea rdx, [rbp + 0x30]
00000001402c7866 call 0x142674550
00000001402c786b nop
00000001402c786c lea r14, [rbp + 0x290]
00000001402c7873 lea r15, [rbp + 0x30]
00000001402c7877 lea rdx, [rbp + 0x2e0]
00000001402c787e mov r8d, 0x180
00000001402c7884 mov rcx, r15
00000001402c7887 call 0x145cf998b
00000001402c788c movaps xmm0, xmmword ptr [rbp + 0x540]
00000001402c7893 movaps xmm1, xmmword ptr [rbp + 0x550]
00000001402c789a movaps xmm2, xmmword ptr [rbp + 0x560]
00000001402c78a1 movaps xmm3, xmmword ptr [rbp + 0x570]
00000001402c78a8 movups xmmword ptr [rbp + 0x1b0], xmm0
00000001402c78af movups xmmword ptr [rbp + 0x1c0], xmm1
00000001402c78b6 movups xmmword ptr [rbp + 0x1d0], xmm2
00000001402c78bd movups xmmword ptr [rbp + 0x1e0], xmm3
00000001402c78c4 movaps xmm0, xmmword ptr [rbp + 0x580]
00000001402c78cb movups xmmword ptr [rbp + 0x1f0], xmm0
00000001402c78d2 lea rcx, [rbp + 0x200]
00000001402c78d9 lea rdx, [rbp - 0x58]
00000001402c78dd mov r8d, 0x88
00000001402c78e3 call 0x145cf998b
00000001402c78e8 lea rcx, [rbp + 0x2e8]
00000001402c78ef mov r8d, 0x258
00000001402c78f5 mov rdx, r15
00000001402c78f8 call 0x145cf998b
00000001402c78fd mov qword ptr [rbp + 0x2e0], rsi
00000001402c7904 lea rcx, [rbp - 0x58]
00000001402c7908 lea r8, [rbp + 0x2e0]
00000001402c790f mov rdx, r14
00000001402c7912 call 0x140264950
