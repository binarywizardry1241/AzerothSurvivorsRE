14581c690 push rbp
14581c691 push r15
14581c693 push r14
14581c695 push r13
14581c697 push r12
14581c699 push rsi
14581c69a push rdi
14581c69b push rbx
14581c69c sub rsp, 0xf8
14581c6a3 lea rbp, [rsp + 0x80]
14581c6ab mov qword ptr [rbp + 0x70], 0xfffffffffffffffe
14581c6b3 mov rdi, rdx
14581c6b6 mov rsi, rcx
14581c6b9 mov qword ptr [rbp + 0x58], 0
14581c6c1 mov qword ptr [rbp + 0x60], 1
14581c6c9 mov rax, qword ptr [rdx]
14581c6cc movabs rcx, 0x8000000000000000
14581c6d6 xor rcx, rax
14581c6d9 test rax, rax
14581c6dc mov eax, 3
14581c6e1 cmovs rax, rcx
14581c6e5 mov qword ptr [rbp + 0x68], 0
14581c6ed lea rcx, [rip + 0x14aea58]
14581c6f4 movsxd rax, dword ptr [rcx + rax*4]
14581c6f8 add rax, rcx
14581c6fb jmp rax
14581c6fd lea rcx, [rbp + 0x58]
14581c701 mov dl, 1
14581c703 call 0x145b79d30
14581c708 nop
14581c709 mov edx, dword ptr [rdi + 0x38]
14581c70c mov rcx, rax
14581c70f call 0x145b79ed0
14581c714 nop
14581c715 mov rdx, qword ptr [rdi + 0x10]
14581c719 mov r8, qword ptr [rdi + 0x18]
14581c71d mov rcx, rax
14581c720 call 0x145b79dd0
14581c725 nop
14581c726 mov rdx, qword ptr [rdi + 0x28]
14581c72a mov r8, qword ptr [rdi + 0x30]
14581c72e mov rcx, rax
14581c731 call 0x145b79dd0
14581c736 nop
14581c737 jmp 0x14581d4f9
14581c73c lea rcx, [rbp + 0x58]
14581c740 mov dl, 0x11
14581c742 call 0x145b79d30
14581c747 nop
14581c748 mov rbx, qword ptr [rdi + 0x18]
14581c74c mov rcx, rax
14581c74f mov edx, ebx
14581c751 call 0x145b79ed0
14581c756 nop
14581c757 mov r14, qword ptr [rdi + 0x10]
14581c75b imul rbx, rbx, 0x98
14581c762 add rbx, r14
14581c765 lea rdi, [rbp + 0x58]
14581c769 nop dword ptr [rax]
14581c770 cmp r14, rbx
14581c773 je 0x14581d4f9
14581c779 mov rdx, qword ptr [r14 + 0x88]
14581c780 mov rcx, rdi
14581c783 call 0x145b79f30
14581c788 nop
14581c789 mov rdx, qword ptr [r14 + 8]
14581c78d mov r8, qword ptr [r14 + 0x10]
14581c791 mov rcx, rax
14581c794 call 0x145b79dd0
14581c799 nop
14581c79a movzx edx, byte ptr [r14 + 0x95]
14581c7a2 mov rcx, rax
14581c7a5 call 0x145b79d30
14581c7aa nop
14581c7ab movzx edx, byte ptr [r14 + 0x96]
14581c7b3 mov rcx, rax
14581c7b6 call 0x145b79d30
14581c7bb nop
14581c7bc cmp qword ptr [r14 + 0x18], -1
14581c7c1 je 0x14581c7e0
14581c7c3 mov rcx, rdi
14581c7c6 mov dl, 1
14581c7c8 call 0x145b79d30
14581c7cd nop
14581c7ce lea rcx, [r14 + 0x18]
14581c7d2 mov rdx, rdi
14581c7d5 call 0x145b7c260
14581c7da nop
14581c7db jmp 0x14581c7eb
14581c7dd nop dword ptr [rax]
14581c7e0 mov rcx, rdi
14581c7e3 xor edx, edx
14581c7e5 call 0x145b79d30
14581c7ea nop
14581c7eb mov edx, dword ptr [r14 + 0x90]
14581c7f2 mov rcx, rdi
14581c7f5 call 0x145b79ed0
14581c7fa nop
14581c7fb movzx edx, byte ptr [r14 + 0x94]
14581c803 add r14, 0x98
14581c80a mov rcx, rax
14581c80d call 0x145b79d30
14581c812 nop
14581c813 jmp 0x14581c770
14581c818 lea rcx, [rbp + 0x58]
14581c81c mov dl, 0xf
14581c81e call 0x145b79d30
14581c823 nop
14581c824 movss xmm1, dword ptr [rdi + 0x68]
14581c829 lea rcx, [rbp + 0x58]
14581c82d call 0x145b79d70
14581c832 nop
14581c833 movzx edx, byte ptr [rdi + 0x8f]
14581c83a mov rcx, rax
14581c83d call 0x145b79d30
14581c842 nop
14581c843 movzx edx, byte ptr [rdi + 0x8c]
14581c84a mov rcx, rax
14581c84d call 0x145b79d30
14581c852 nop
14581c853 mov edx, dword ptr [rdi + 0x6c]
14581c856 mov rcx, rax
14581c859 call 0x145b79ed0
14581c85e nop
14581c85f movzx edx, byte ptr [rdi + 0x8d]
14581c866 mov rcx, rax
14581c869 call 0x145b79d30
14581c86e nop
14581c86f mov edx, dword ptr [rdi + 0x70]
14581c872 lea rcx, [rbp + 0x58]
14581c876 call 0x145b79ed0
14581c87b nop
14581c87c mov edx, dword ptr [rdi + 0x74]
14581c87f mov rcx, rax
14581c882 call 0x145b79ed0
14581c887 nop
14581c888 mov edx, dword ptr [rdi + 0x78]
14581c88b mov rcx, rax
14581c88e call 0x145b79ed0
14581c893 nop
14581c894 mov edx, dword ptr [rdi + 0x7c]
14581c897 mov rcx, rax
14581c89a call 0x145b79ed0
14581c89f nop
14581c8a0 mov edx, dword ptr [rdi + 0x80]
14581c8a6 mov rcx, rax
14581c8a9 call 0x145b79ed0
14581c8ae nop
14581c8af movss xmm1, dword ptr [rdi + 0x84]
14581c8b7 lea rcx, [rbp + 0x58]
14581c8bb call 0x145b79d70
14581c8c0 nop
14581c8c1 movss xmm1, dword ptr [rdi + 0x88]
14581c8c9 mov rcx, rax
14581c8cc call 0x145b79d70
14581c8d1 nop
14581c8d2 movzx edx, byte ptr [rdi + 0x8e]
14581c8d9 mov rcx, rax
14581c8dc call 0x145b79d30
14581c8e1 nop
14581c8e2 movzx edx, byte ptr [rdi + 0x90]
14581c8e9 mov rcx, rax
14581c8ec call 0x145b79d30
14581c8f1 nop
14581c8f2 mov rdx, qword ptr [rdi + 0x10]
14581c8f6 mov r8, qword ptr [rdi + 0x18]
14581c8fa mov rcx, rax
14581c8fd call 0x145b79dd0
14581c902 nop
14581c903 mov rbx, qword ptr [rdi + 0x30]
14581c907 lea rcx, [rbp + 0x58]
14581c90b mov edx, ebx
14581c90d call 0x145b79ed0
14581c912 nop
14581c913 test rbx, rbx
14581c916 je 0x14581c955
14581c918 mov r15, qword ptr [rdi + 0x28]
14581c91c lea r12, [r15 + rbx*8]
14581c920 lea rbx, [rbp + 0x58]
14581c924 nop word ptr cs:[rax + rax]
14581c930 mov edx, dword ptr [r15]
14581c933 mov r14d, dword ptr [r15 + 4]
14581c937 mov rcx, rbx
14581c93a call 0x145b79ed0
14581c93f nop
14581c940 mov rcx, rax
14581c943 mov edx, r14d
14581c946 call 0x145b79ed0
14581c94b nop
14581c94c add r15, 8
14581c950 cmp r15, r12
14581c953 jne 0x14581c930
14581c955 mov rbx, qword ptr [rdi + 0x48]
14581c959 lea rcx, [rbp + 0x58]
14581c95d mov edx, ebx
14581c95f call 0x145b79ed0
14581c964 nop
14581c965 test rbx, rbx
14581c968 je 0x14581c9cc
14581c96a mov r14, qword ptr [rdi + 0x40]
14581c96e lea rax, [rbx + rbx*2]
14581c972 lea r15, [r14 + rax*4]
14581c976 lea rbx, [rbp + 0x58]
14581c97a nop word ptr [rax + rax]
14581c980 mov edx, dword ptr [r14]
14581c983 mov rcx, rbx
14581c986 call 0x145b79ed0
14581c98b nop
14581c98c mov edx, dword ptr [r14 + 4]
14581c990 mov rcx, rax
14581c993 call 0x145b79ed0
14581c998 nop
14581c999 movzx edx, byte ptr [r14 + 8]
14581c99e mov rcx, rax
14581c9a1 call 0x145b79d30
14581c9a6 nop
14581c9a7 movzx edx, byte ptr [r14 + 9]
14581c9ac mov rcx, rax
14581c9af call 0x145b79d30
14581c9b4 nop
14581c9b5 movzx edx, byte ptr [r14 + 0xa]
14581c9ba mov rcx, rax
14581c9bd call 0x145b79d30
14581c9c2 nop
14581c9c3 add r14, 0xc
14581c9c7 cmp r14, r15
14581c9ca jne 0x14581c980
14581c9cc mov rbx, qword ptr [rdi + 0x60]
14581c9d0 lea rcx, [rbp + 0x58]
14581c9d4 mov edx, ebx
14581c9d6 call 0x145b79ed0
14581c9db nop
14581c9dc test rbx, rbx
14581c9df je 0x14581d4f9
14581c9e5 mov r14, qword ptr [rdi + 0x58]
14581c9e9 lea rbx, [r14 + rbx*4]
14581c9ed lea rdi, [rbp + 0x58]
14581c9f1 nop word ptr cs:[rax + rax]
14581ca00 mov edx, dword ptr [r14]
14581ca03 mov rcx, rdi
14581ca06 call 0x145b79ed0
14581ca0b nop
14581ca0c add r14, 4
14581ca10 cmp r14, rbx
14581ca13 jne 0x14581ca00
14581ca15 jmp 0x14581d4f9
14581ca1a lea rcx, [rbp + 0x58]
14581ca1e mov dl, 0xc
14581ca20 call 0x145b79d30
14581ca25 nop
14581ca26 mov rbx, qword ptr [rdi + 0x18]
14581ca2a mov rcx, rax
14581ca2d mov edx, ebx
14581ca2f call 0x145b79ed0
14581ca34 nop
14581ca35 mov r14, qword ptr [rdi + 0x10]
14581ca39 lea rax, [rbx + rbx*2]
14581ca3d lea rbx, [r14 + rax*4]
14581ca41 lea rdi, [rbp + 0x58]
14581ca45 nop word ptr cs:[rax + rax]
14581ca50 cmp r14, rbx
14581ca53 je 0x14581d4f9
14581ca59 mov edx, dword ptr [r14]
14581ca5c mov rcx, rdi
14581ca5f call 0x145b79ed0
14581ca64 nop
14581ca65 movss xmm1, dword ptr [r14 + 4]
14581ca6b mov rcx, rax
14581ca6e call 0x145b79d70
14581ca73 nop
14581ca74 movzx edx, byte ptr [r14 + 8]
14581ca79 add r14, 0xc
14581ca7d mov rcx, rax
14581ca80 call 0x145b79d30
14581ca85 nop
14581ca86 jmp 0x14581ca50
14581ca88 lea rcx, [rbp + 0x58]
14581ca8c mov dl, 5
14581ca8e call 0x145b79d30
14581ca93 nop
14581ca94 mov rdx, qword ptr [rdi + 0x10]
14581ca98 mov r8, qword ptr [rdi + 0x18]
14581ca9c mov rcx, rax
14581ca9f call 0x145b79dd0
14581caa4 nop
14581caa5 jmp 0x14581d4f9
14581caaa lea rcx, [rbp + 0x58]
14581caae mov dl, 0xd
14581cab0 call 0x145b79d30
14581cab5 nop
14581cab6 mov rbx, qword ptr [rdi + 0x18]
14581caba mov rcx, rax
14581cabd mov edx, ebx
14581cabf call 0x145b79ed0
14581cac4 nop
14581cac5 mov r14, qword ptr [rdi + 0x10]
14581cac9 lea rbx, [r14 + rbx*4]
14581cacd lea rdi, [rbp + 0x58]
14581cad1 cmp r14, rbx
14581cad4 je 0x14581d4f9
14581cada nop word ptr [rax + rax]
14581cae0 mov edx, dword ptr [r14]
14581cae3 mov rcx, rdi
14581cae6 call 0x145b79ed0
14581caeb nop
14581caec add r14, 4
14581caf0 cmp r14, rbx
14581caf3 jne 0x14581cae0
14581caf5 jmp 0x14581d4f9
14581cafa lea rcx, [rbp + 0x58]
14581cafe mov dl, 0xa
14581cb00 call 0x145b79d30
14581cb05 nop
14581cb06 mov rdx, qword ptr [rdi + 0x10]
14581cb0a mov r8, qword ptr [rdi + 0x18]
14581cb0e mov rcx, rax
14581cb11 call 0x145b79dd0
14581cb16 nop
14581cb17 jmp 0x14581d4f9
14581cb1c lea rcx, [rbp + 0x58]
14581cb20 mov dl, 3
14581cb22 call 0x145b79d30
14581cb27 nop
14581cb28 mov rdx, qword ptr [rdi + 0x10]
14581cb2c mov r8, qword ptr [rdi + 0x18]
14581cb30 mov rcx, rax
14581cb33 call 0x145b79dd0
14581cb38 nop
14581cb39 jmp 0x14581d4f9
14581cb3e lea rcx, [rbp + 0x58]
14581cb42 mov dl, 0x10
14581cb44 call 0x145b79d30
14581cb49 nop
14581cb4a jmp 0x14581d4f9
14581cb4f lea rcx, [rbp + 0x58]
14581cb53 mov dl, 4
14581cb55 call 0x145b79d30
14581cb5a nop
14581cb5b mov rdx, qword ptr [rdi + 0x180]
14581cb62 lea rcx, [rbp + 0x58]
14581cb66 call 0x145b79f30
14581cb6b nop
14581cb6c mov rdx, qword ptr [rdi + 8]
14581cb70 mov r8, qword ptr [rdi + 0x10]
14581cb74 mov rcx, rax
14581cb77 call 0x145b79dd0
14581cb7c nop
14581cb7d movzx edx, byte ptr [rdi + 0x1db]
14581cb84 mov rcx, rax
14581cb87 call 0x145b79d30
14581cb8c nop
14581cb8d movzx edx, byte ptr [rdi + 0x1dc]
14581cb94 mov rcx, rax
14581cb97 call 0x145b79d30
14581cb9c nop
14581cb9d movzx edx, byte ptr [rdi + 0x1dd]
14581cba4 mov rcx, rax
14581cba7 call 0x145b79d30
14581cbac nop
14581cbad movzx edx, byte ptr [rdi + 0x1de]
14581cbb4 mov r12b, byte ptr [rdi + 0x1df]
14581cbbb mov r15b, byte ptr [rdi + 0x1e0]
14581cbc2 mov r14b, byte ptr [rdi + 0x1e1]
14581cbc9 mov bl, byte ptr [rdi + 0x1e2]
14581cbcf lea rcx, [rbp + 0x58]
14581cbd3 call 0x145b79d30
14581cbd8 nop
14581cbd9 lea rcx, [rbp + 0x58]
14581cbdd mov edx, r12d
14581cbe0 call 0x145b79d30
14581cbe5 nop
14581cbe6 lea rcx, [rbp + 0x58]
14581cbea mov edx, r15d
14581cbed call 0x145b79d30
14581cbf2 nop
14581cbf3 lea rcx, [rbp + 0x58]
14581cbf7 mov edx, r14d
14581cbfa call 0x145b79d30
14581cbff nop
14581cc00 lea rcx, [rbp + 0x58]
14581cc04 mov edx, ebx
14581cc06 call 0x145b79d30
14581cc0b nop
14581cc0c mov edx, dword ptr [rdi + 0x188]
14581cc12 mov r15d, dword ptr [rdi + 0x18c]
14581cc19 mov r14d, dword ptr [rdi + 0x190]
14581cc20 mov ebx, dword ptr [rdi + 0x194]
14581cc26 mov r13d, dword ptr [rdi + 0x198]
14581cc2d mov r12d, dword ptr [rdi + 0x19c]
14581cc34 mov eax, dword ptr [rdi + 0x1a0]
14581cc3a mov dword ptr [rbp + 0x24], eax
14581cc3d mov eax, dword ptr [rdi + 0x1a4]
14581cc43 mov dword ptr [rbp + 0x28], eax
14581cc46 mov eax, dword ptr [rdi + 0x1a8]
14581cc4c mov dword ptr [rbp + 0x2c], eax
14581cc4f mov eax, dword ptr [rdi + 0x1ac]
14581cc55 mov dword ptr [rbp + 0x30], eax
14581cc58 mov eax, dword ptr [rdi + 0x1b0]
14581cc5e mov dword ptr [rbp + 0x34], eax
14581cc61 mov eax, dword ptr [rdi + 0x1b4]
14581cc67 mov dword ptr [rbp + 0x38], eax
14581cc6a mov eax, dword ptr [rdi + 0x1b8]
14581cc70 mov dword ptr [rbp + 0x3c], eax
14581cc73 mov eax, dword ptr [rdi + 0x1bc]
14581cc79 mov dword ptr [rbp + 0x40], eax
14581cc7c mov eax, dword ptr [rdi + 0x1c0]
14581cc82 mov dword ptr [rbp + 0x44], eax
14581cc85 mov eax, dword ptr [rdi + 0x1c4]
14581cc8b mov dword ptr [rbp + 0x48], eax
14581cc8e mov eax, dword ptr [rdi + 0x1c8]
14581cc94 mov dword ptr [rbp + 0x4c], eax
14581cc97 mov eax, dword ptr [rdi + 0x1cc]
14581cc9d mov dword ptr [rbp + 0x50], eax
14581cca0 mov eax, dword ptr [rdi + 0x1d0]
14581cca6 mov dword ptr [rbp + 0x54], eax
14581cca9 lea rcx, [rbp + 0x58]
14581ccad call 0x145b79ed0
14581ccb2 nop
14581ccb3 lea rcx, [rbp + 0x58]
14581ccb7 mov edx, r15d
14581ccba call 0x145b79ed0
14581ccbf nop
14581ccc0 lea rcx, [rbp + 0x58]
14581ccc4 mov edx, r14d
14581ccc7 call 0x145b79ed0
14581cccc nop
14581cccd lea rcx, [rbp + 0x58]
14581ccd1 mov edx, ebx
14581ccd3 call 0x145b79ed0
14581ccd8 nop
14581ccd9 lea rcx, [rbp + 0x58]
14581ccdd mov edx, r13d
14581cce0 call 0x145b79ed0
14581cce5 nop
14581cce6 lea rcx, [rbp + 0x58]
14581ccea mov edx, r12d
14581cced call 0x145b79ed0
14581ccf2 nop
14581ccf3 lea rcx, [rbp + 0x58]
14581ccf7 mov edx, dword ptr [rbp + 0x24]
14581ccfa call 0x145b79ed0
14581ccff nop
14581cd00 lea rcx, [rbp + 0x58]
14581cd04 mov edx, dword ptr [rbp + 0x28]
14581cd07 call 0x145b79ed0
14581cd0c nop
14581cd0d lea rcx, [rbp + 0x58]
14581cd11 mov edx, dword ptr [rbp + 0x2c]
14581cd14 call 0x145b79ed0
14581cd19 nop
14581cd1a lea rcx, [rbp + 0x58]
14581cd1e mov edx, dword ptr [rbp + 0x30]
14581cd21 call 0x145b79ed0
14581cd26 nop
14581cd27 lea rcx, [rbp + 0x58]
14581cd2b mov edx, dword ptr [rbp + 0x34]
14581cd2e call 0x145b79ed0
14581cd33 nop
14581cd34 lea rcx, [rbp + 0x58]
14581cd38 mov edx, dword ptr [rbp + 0x38]
14581cd3b call 0x145b79ed0
14581cd40 nop
14581cd41 lea rcx, [rbp + 0x58]
14581cd45 mov edx, dword ptr [rbp + 0x3c]
14581cd48 call 0x145b79ed0
14581cd4d nop
14581cd4e lea rcx, [rbp + 0x58]
14581cd52 mov edx, dword ptr [rbp + 0x40]
14581cd55 call 0x145b79ed0
14581cd5a nop
14581cd5b lea rcx, [rbp + 0x58]
14581cd5f mov edx, dword ptr [rbp + 0x44]
14581cd62 call 0x145b79ed0
14581cd67 nop
14581cd68 lea rcx, [rbp + 0x58]
14581cd6c mov edx, dword ptr [rbp + 0x48]
14581cd6f call 0x145b79ed0
14581cd74 nop
14581cd75 lea rcx, [rbp + 0x58]
14581cd79 mov edx, dword ptr [rbp + 0x4c]
14581cd7c call 0x145b79ed0
14581cd81 nop
14581cd82 lea rcx, [rbp + 0x58]
14581cd86 mov edx, dword ptr [rbp + 0x50]
14581cd89 call 0x145b79ed0
14581cd8e nop
14581cd8f lea rcx, [rbp + 0x58]
14581cd93 mov edx, dword ptr [rbp + 0x54]
14581cd96 call 0x145b79ed0
14581cd9b nop
14581cd9c movzx eax, byte ptr [rdi + 0xb8]
14581cda3 mov r13d, dword ptr [rdi + 0xc0]
14581cdaa mov ecx, dword ptr [rdi + 0xc4]
14581cdb0 mov dword ptr [rbp + 0x24], ecx
14581cdb3 mov r15d, dword ptr [rdi + 0xc8]
14581cdba mov ecx, dword ptr [rdi + 0xcc]
14581cdc0 mov dword ptr [rbp + 0x28], ecx
14581cdc3 mov r14d, dword ptr [rdi + 0xd0]
14581cdca mov ecx, dword ptr [rdi + 0xd4]
14581cdd0 mov dword ptr [rbp + 0x2c], ecx
14581cdd3 mov r12d, dword ptr [rdi + 0xd8]
14581cdda mov ecx, dword ptr [rdi + 0xdc]
14581cde0 mov dword ptr [rbp + 0x30], ecx
14581cde3 mov ecx, dword ptr [rdi + 0xe0]
14581cde9 mov dword ptr [rbp + 0x38], ecx
14581cdec mov ecx, dword ptr [rdi + 0xe4]
14581cdf2 mov dword ptr [rbp + 0x34], ecx
14581cdf5 and al, 1
14581cdf7 xor ebx, ebx
14581cdf9 cmp al, 1
14581cdfb mov edx, 0
14581ce00 sbb edx, edx
14581ce02 mov eax, dword ptr [rdi + 0xe8]
14581ce08 mov dword ptr [rbp + 0x40], eax
14581ce0b or edx, dword ptr [rdi + 0xbc]
14581ce11 mov eax, dword ptr [rdi + 0xec]
14581ce17 mov dword ptr [rbp + 0x3c], eax
14581ce1a mov eax, dword ptr [rdi + 0xf0]
14581ce20 mov dword ptr [rbp + 0x48], eax
14581ce23 mov eax, dword ptr [rdi + 0xf4]
14581ce29 mov dword ptr [rbp + 0x44], eax
14581ce2c mov eax, dword ptr [rdi + 0xf8]
14581ce32 mov dword ptr [rbp + 0x50], eax
14581ce35 mov eax, dword ptr [rdi + 0xfc]
14581ce3b mov dword ptr [rbp + 0x4c], eax
14581ce3e mov eax, dword ptr [rdi + 0x100]
14581ce44 mov dword ptr [rbp - 0x28], eax
14581ce47 mov eax, dword ptr [rdi + 0x104]
14581ce4d mov dword ptr [rbp + 0x54], eax
14581ce50 mov eax, dword ptr [rdi + 0x108]
14581ce56 mov dword ptr [rbp - 0x20], eax
14581ce59 mov eax, dword ptr [rdi + 0x10c]
14581ce5f mov dword ptr [rbp - 0x24], eax
14581ce62 mov eax, dword ptr [rdi + 0x110]
14581ce68 mov dword ptr [rbp - 0x18], eax
14581ce6b mov eax, dword ptr [rdi + 0x114]
14581ce71 mov dword ptr [rbp - 0x1c], eax
14581ce74 mov eax, dword ptr [rdi + 0x118]
14581ce7a mov dword ptr [rbp - 0x10], eax
14581ce7d mov eax, dword ptr [rdi + 0x11c]
14581ce83 mov dword ptr [rbp - 0x14], eax
14581ce86 mov eax, dword ptr [rdi + 0x120]
14581ce8c mov dword ptr [rbp - 8], eax
14581ce8f mov eax, dword ptr [rdi + 0x124]
14581ce95 mov dword ptr [rbp - 0xc], eax
14581ce98 mov eax, dword ptr [rdi + 0x128]
14581ce9e mov dword ptr [rbp], eax
14581cea1 mov eax, dword ptr [rdi + 0x12c]
14581cea7 mov dword ptr [rbp - 4], eax
14581ceaa mov eax, dword ptr [rdi + 0x130]
14581ceb0 mov dword ptr [rbp + 8], eax
14581ceb3 mov eax, dword ptr [rdi + 0x134]
14581ceb9 mov dword ptr [rbp + 4], eax
14581cebc mov eax, dword ptr [rdi + 0x138]
14581cec2 mov dword ptr [rbp + 0x10], eax
14581cec5 mov eax, dword ptr [rdi + 0x13c]
14581cecb mov dword ptr [rbp + 0xc], eax
14581cece mov eax, dword ptr [rdi + 0x140]
14581ced4 mov dword ptr [rbp + 0x18], eax
14581ced7 mov eax, dword ptr [rdi + 0x144]
14581cedd mov dword ptr [rbp + 0x14], eax
14581cee0 mov eax, dword ptr [rdi + 0x148]
14581cee6 mov dword ptr [rbp + 0x20], eax
14581cee9 mov eax, dword ptr [rdi + 0x14c]
14581ceef mov dword ptr [rbp + 0x1c], eax
14581cef2 lea rcx, [rbp + 0x58]
14581cef6 call 0x145b79ed0
14581cefb nop
14581cefc and r13b, 1
14581cf00 cmp r13b, 1
14581cf04 sbb ebx, ebx
14581cf06 or ebx, dword ptr [rbp + 0x24]
14581cf09 lea rcx, [rbp + 0x58]
14581cf0d mov edx, ebx
14581cf0f call 0x145b79ed0
14581cf14 nop
14581cf15 and r15b, 1
14581cf19 xor ebx, ebx
14581cf1b cmp r15b, 1
14581cf1f mov edx, 0
14581cf24 sbb edx, edx
14581cf26 or edx, dword ptr [rbp + 0x28]
14581cf29 lea rcx, [rbp + 0x58]
14581cf2d call 0x145b79ed0
14581cf32 nop
14581cf33 and r14b, 1
14581cf37 cmp r14b, 1
14581cf3b sbb ebx, ebx
14581cf3d or ebx, dword ptr [rbp + 0x2c]
14581cf40 lea rcx, [rbp + 0x58]
14581cf44 mov edx, ebx
14581cf46 call 0x145b79ed0
14581cf4b nop
14581cf4c and r12b, 1
14581cf50 xor ebx, ebx
14581cf52 cmp r12b, 1
14581cf56 mov edx, 0
14581cf5b sbb edx, edx
14581cf5d or edx, dword ptr [rbp + 0x30]
14581cf60 lea rcx, [rbp + 0x58]
14581cf64 call 0x145b79ed0
14581cf69 nop
14581cf6a mov eax, dword ptr [rbp + 0x38]
14581cf6d and al, 1
14581cf6f cmp al, 1
14581cf71 sbb ebx, ebx
14581cf73 or ebx, dword ptr [rbp + 0x34]
14581cf76 lea rcx, [rbp + 0x58]
14581cf7a mov edx, ebx
14581cf7c call 0x145b79ed0
14581cf81 nop
14581cf82 mov eax, dword ptr [rbp + 0x40]
14581cf85 and al, 1
14581cf87 xor ebx, ebx
14581cf89 cmp al, 1
14581cf8b mov edx, 0
14581cf90 sbb edx, edx
14581cf92 or edx, dword ptr [rbp + 0x3c]
14581cf95 lea rcx, [rbp + 0x58]
14581cf99 call 0x145b79ed0
14581cf9e nop
14581cf9f mov eax, dword ptr [rbp + 0x48]
14581cfa2 and al, 1
14581cfa4 cmp al, 1
14581cfa6 sbb ebx, ebx
14581cfa8 or ebx, dword ptr [rbp + 0x44]
14581cfab lea rcx, [rbp + 0x58]
14581cfaf mov edx, ebx
14581cfb1 call 0x145b79ed0
14581cfb6 nop
14581cfb7 mov eax, dword ptr [rbp + 0x50]
14581cfba and al, 1
14581cfbc xor ebx, ebx
14581cfbe cmp al, 1
14581cfc0 mov edx, 0
14581cfc5 sbb edx, edx
14581cfc7 or edx, dword ptr [rbp + 0x4c]
14581cfca lea rcx, [rbp + 0x58]
14581cfce call 0x145b79ed0
14581cfd3 nop
14581cfd4 mov eax, dword ptr [rbp - 0x28]
14581cfd7 and al, 1
14581cfd9 cmp al, 1
14581cfdb sbb ebx, ebx
14581cfdd or ebx, dword ptr [rbp + 0x54]
14581cfe0 lea rcx, [rbp + 0x58]
14581cfe4 mov edx, ebx
14581cfe6 call 0x145b79ed0
14581cfeb nop
14581cfec mov eax, dword ptr [rbp - 0x20]
14581cfef and al, 1
14581cff1 xor ebx, ebx
14581cff3 cmp al, 1
14581cff5 mov edx, 0
14581cffa sbb edx, edx
14581cffc or edx, dword ptr [rbp - 0x24]
14581cfff lea rcx, [rbp + 0x58]
14581d003 call 0x145b79ed0
14581d008 nop
14581d009 mov eax, dword ptr [rbp - 0x18]
14581d00c and al, 1
14581d00e cmp al, 1
14581d010 sbb ebx, ebx
14581d012 or ebx, dword ptr [rbp - 0x1c]
14581d015 lea rcx, [rbp + 0x58]
14581d019 mov edx, ebx
14581d01b call 0x145b79ed0
14581d020 nop
14581d021 mov eax, dword ptr [rbp - 0x10]
14581d024 and al, 1
14581d026 xor ebx, ebx
14581d028 cmp al, 1
14581d02a mov edx, 0
14581d02f sbb edx, edx
14581d031 or edx, dword ptr [rbp - 0x14]
14581d034 lea rcx, [rbp + 0x58]
14581d038 call 0x145b79ed0
14581d03d nop
14581d03e mov eax, dword ptr [rbp - 8]
14581d041 and al, 1
14581d043 cmp al, 1
14581d045 sbb ebx, ebx
14581d047 or ebx, dword ptr [rbp - 0xc]
14581d04a lea rcx, [rbp + 0x58]
14581d04e mov edx, ebx
14581d050 call 0x145b79ed0
14581d055 nop
14581d056 mov eax, dword ptr [rbp]
14581d059 and al, 1
14581d05b xor ebx, ebx
14581d05d cmp al, 1
14581d05f mov edx, 0
14581d064 sbb edx, edx
14581d066 or edx, dword ptr [rbp - 4]
14581d069 lea rcx, [rbp + 0x58]
14581d06d call 0x145b79ed0
14581d072 nop
14581d073 mov eax, dword ptr [rbp + 8]
14581d076 and al, 1
14581d078 cmp al, 1
14581d07a sbb ebx, ebx
14581d07c or ebx, dword ptr [rbp + 4]
14581d07f lea rcx, [rbp + 0x58]
14581d083 mov edx, ebx
14581d085 call 0x145b79ed0
14581d08a nop
14581d08b mov eax, dword ptr [rbp + 0x10]
14581d08e and al, 1
14581d090 xor ebx, ebx
14581d092 cmp al, 1
14581d094 mov edx, 0
14581d099 sbb edx, edx
14581d09b or edx, dword ptr [rbp + 0xc]
14581d09e lea rcx, [rbp + 0x58]
14581d0a2 call 0x145b79ed0
14581d0a7 nop
14581d0a8 mov eax, dword ptr [rbp + 0x18]
14581d0ab and al, 1
14581d0ad cmp al, 1
14581d0af sbb ebx, ebx
14581d0b1 or ebx, dword ptr [rbp + 0x14]
14581d0b4 lea rcx, [rbp + 0x58]
14581d0b8 mov edx, ebx
14581d0ba call 0x145b79ed0
14581d0bf nop
14581d0c0 mov eax, dword ptr [rbp + 0x20]
14581d0c3 and al, 1
14581d0c5 xor edx, edx
14581d0c7 cmp al, 1
14581d0c9 sbb edx, edx
14581d0cb or edx, dword ptr [rbp + 0x1c]
14581d0ce lea rcx, [rbp + 0x58]
14581d0d2 call 0x145b79ed0
14581d0d7 nop
14581d0d8 mov rdx, qword ptr [rdi + 0x20]
14581d0dc mov r8, qword ptr [rdi + 0x28]
14581d0e0 lea rcx, [rbp + 0x58]
14581d0e4 call 0x145b79dd0
14581d0e9 nop
14581d0ea mov edx, dword ptr [rdi + 0x170]
14581d0f0 lea rcx, [rbp + 0x58]
14581d0f4 call 0x145b79ed0
14581d0f9 nop
14581d0fa mov edx, dword ptr [rdi + 0x174]
14581d100 mov rcx, rax
14581d103 call 0x145b79ed0
14581d108 nop
14581d109 movzx edx, byte ptr [rdi + 0x17e]
14581d110 mov rcx, rax
14581d113 call 0x145b79d30
14581d118 nop
14581d119 movzx edx, byte ptr [rdi + 0x17f]
14581d120 mov rcx, rax
14581d123 call 0x145b79d30
14581d128 nop
14581d129 movss xmm1, dword ptr [rdi + 0x178]
14581d131 mov rcx, rax
14581d134 call 0x145b79d70
14581d139 nop
14581d13a movzx ebx, byte ptr [rdi + 0x158]
14581d141 cmp bl, 0xff
14581d144 je 0x14581d3dc
14581d14a mov rax, qword ptr [rdi + 0x150]
14581d151 mov rdx, qword ptr [rax]
14581d154 mov r8, qword ptr [rax + 8]
14581d158 lea rcx, [rbp + 0x58]
14581d15c call 0x145b79dd0
14581d161 nop
14581d162 mov rcx, rax
14581d165 mov edx, ebx
14581d167 call 0x145b79d30
14581d16c nop
14581d16d jmp 0x14581d3f9
14581d172 lea rcx, [rbp + 0x58]
14581d176 mov dl, 8
14581d178 call 0x145b79d30
14581d17d nop
14581d17e movzx eax, byte ptr [rdi + 8]
14581d182 movzx ebx, byte ptr [rdi + 9]
14581d186 lea rcx, [rip + 0x14ae00b]
14581d18d movsxd rax, dword ptr [rcx + rax*4]
14581d191 add rax, rcx
14581d194 jmp rax
14581d196 lea rcx, [rbp + 0x58]
14581d19a xor edx, edx
14581d19c call 0x145b79d30
14581d1a1 nop
14581d1a2 mov rcx, rax
14581d1a5 mov edx, ebx
14581d1a7 call 0x145b79d30
14581d1ac nop
14581d1ad jmp 0x14581d4f9
14581d1b2 lea rcx, [rbp + 0x58]
14581d1b6 mov dl, 2
14581d1b8 call 0x145b79d30
14581d1bd nop
14581d1be movzx edx, byte ptr [rdi + 8]
14581d1c2 mov rcx, rax
14581d1c5 call 0x145b79d30
14581d1ca nop
14581d1cb movzx edx, byte ptr [rdi + 9]
14581d1cf mov rcx, rax
14581d1d2 call 0x145b79d30
14581d1d7 nop
14581d1d8 jmp 0x14581d4f9
14581d1dd lea rcx, [rbp + 0x58]
14581d1e1 mov dl, 0x12
14581d1e3 call 0x145b79d30
14581d1e8 nop
14581d1e9 jmp 0x14581d4f9
14581d1ee lea rcx, [rbp + 0x58]
14581d1f2 mov dl, 6
14581d1f4 call 0x145b79d30
14581d1f9 nop
14581d1fa jmp 0x14581d4f9
14581d1ff lea rcx, [rbp + 0x58]
14581d203 mov dl, 0xe
14581d205 call 0x145b79d30
14581d20a nop
14581d20b mov rbx, qword ptr [rdi + 0x18]
14581d20f mov rcx, rax
14581d212 mov edx, ebx
14581d214 call 0x145b79ed0
14581d219 nop
14581d21a mov r14, qword ptr [rdi + 0x10]
14581d21e shl rbx, 5
14581d222 add rbx, r14
14581d225 lea rdi, [rbp + 0x58]
14581d229 nop dword ptr [rax]
14581d230 cmp r14, rbx
14581d233 je 0x14581d4f9
14581d239 mov rdx, qword ptr [r14 + 8]
14581d23d mov r8, qword ptr [r14 + 0x10]
14581d241 mov rcx, rdi
14581d244 call 0x145b79dd0
14581d249 nop
14581d24a movzx edx, byte ptr [r14 + 0x18]
14581d24f add r14, 0x20
14581d253 mov rcx, rax
14581d256 call 0x145b79d30
14581d25b nop
14581d25c jmp 0x14581d230
14581d25e lea rcx, [rbp + 0x58]
14581d262 mov dl, 7
14581d264 call 0x145b79d30
14581d269 nop
14581d26a movzx edx, word ptr [rdi + 0x20]
14581d26e mov rcx, rax
14581d271 call 0x145b79e70
14581d276 nop
14581d277 mov rdx, qword ptr [rdi + 0x10]
14581d27b mov r8, qword ptr [rdi + 0x18]
14581d27f mov rcx, rax
14581d282 call 0x145b79dd0
14581d287 nop
14581d288 jmp 0x14581d4f9
14581d28d lea rcx, [rbp + 0x58]
14581d291 mov dl, 0x13
14581d293 call 0x145b79d30
14581d298 nop
14581d299 mov rdx, qword ptr [rdi + 0x10]
14581d29d mov r8, qword ptr [rdi + 0x18]
14581d2a1 mov rcx, rax
14581d2a4 call 0x145b79dd0
14581d2a9 nop
14581d2aa jmp 0x14581d4f9
14581d2af lea rcx, [rbp + 0x58]
14581d2b3 mov dl, 0xb
14581d2b5 call 0x145b79d30
14581d2ba nop
14581d2bb mov rbx, qword ptr [rdi + 0x18]
14581d2bf mov rcx, rax
14581d2c2 mov edx, ebx
14581d2c4 call 0x145b79ed0
14581d2c9 nop
14581d2ca mov r14, qword ptr [rdi + 0x10]
14581d2ce imul rbx, rbx, 0xb0
14581d2d5 add rbx, r14
14581d2d8 lea rdi, [rbp + 0x58]
14581d2dc nop dword ptr [rax]
14581d2e0 cmp r14, rbx
14581d2e3 je 0x14581d4f9
14581d2e9 mov edx, dword ptr [r14 + 0xa8]
14581d2f0 mov rcx, rdi
14581d2f3 call 0x145b79ed0
14581d2f8 nop
14581d2f9 mov rdx, qword ptr [r14 + 8]
14581d2fd mov r8, qword ptr [r14 + 0x10]
14581d301 mov rcx, rax
14581d304 call 0x145b79dd0
14581d309 nop
14581d30a lea r15, [r14 + 0xb0]
14581d311 lea rax, [r14 + 0x48]
14581d315 lea rcx, [r14 + 0x60]
14581d319 lea rdx, [r14 + 0x78]
14581d31d lea r8, [r14 + 0x90]
14581d324 mov qword ptr [rbp - 0x48], rax
14581d328 mov qword ptr [rbp - 0x40], rcx
14581d32c mov qword ptr [rbp - 0x38], rdx
14581d330 mov qword ptr [rbp - 0x30], r8
14581d334 xor r12d, r12d
14581d337 jmp 0x14581d354
14581d339 nop dword ptr [rax]
14581d340 mov edx, 1
14581d345 xor r8d, r8d
14581d348 inc r12
14581d34b mov rcx, rax
14581d34e call 0x145b79dd0
14581d353 nop
14581d354 cmp r12, 4
14581d358 je 0x14581d390
14581d35a mov r13, qword ptr [rbp + r12*8 - 0x48]
14581d35f cmp qword ptr [r13], -1
14581d364 setne dl
14581d367 mov rcx, rdi
14581d36a call 0x145b79d30
14581d36f nop
14581d370 cmp qword ptr [r13], -1
14581d375 je 0x14581d340
14581d377 mov rdx, qword ptr [r13 + 8]
14581d37b mov r8, qword ptr [r13 + 0x10]
14581d37f jmp 0x14581d348
14581d381 nop word ptr cs:[rax + rax]
14581d390 mov rdx, qword ptr [r14 + 0x20]
14581d394 mov r8, qword ptr [r14 + 0x28]
14581d398 mov rcx, rdi
14581d39b call 0x145b79dd0
14581d3a0 nop
14581d3a1 mov rdx, qword ptr [r14 + 0x38]
14581d3a5 mov r8, qword ptr [r14 + 0x40]
14581d3a9 mov rcx, rax
14581d3ac call 0x145b79dd0
14581d3b1 nop
14581d3b2 mov r14, r15
14581d3b5 jmp 0x14581d2e0
14581d3ba lea rcx, [rbp + 0x58]
14581d3be mov dl, 9
14581d3c0 call 0x145b79d30
14581d3c5 nop
14581d3c6 mov rdx, qword ptr [rdi + 0x10]
14581d3ca mov r8, qword ptr [rdi + 0x18]
14581d3ce mov rcx, rax
14581d3d1 call 0x145b79dd0
14581d3d6 nop
14581d3d7 jmp 0x14581d4f9
14581d3dc lea rcx, [rbp + 0x58]
14581d3e0 mov edx, 1
14581d3e5 xor r8d, r8d
14581d3e8 call 0x145b79dd0
14581d3ed nop
14581d3ee mov rcx, rax
14581d3f1 xor edx, edx
14581d3f3 call 0x145b79d30
14581d3f8 nop
14581d3f9 movzx ebx, byte ptr [rdi + 0x168]
14581d400 cmp bl, 0xff
14581d403 je 0x14581d42a
14581d405 mov rax, qword ptr [rdi + 0x160]
14581d40c mov rdx, qword ptr [rax]
14581d40f mov r8, qword ptr [rax + 8]
14581d413 lea rcx, [rbp + 0x58]
14581d417 call 0x145b79dd0
14581d41c nop
14581d41d mov rcx, rax
14581d420 mov edx, ebx
14581d422 call 0x145b79d30
14581d427 nop
14581d428 jmp 0x14581d447
14581d42a lea rcx, [rbp + 0x58]
14581d42e mov edx, 1
14581d433 xor r8d, r8d
14581d436 call 0x145b79dd0
14581d43b nop
14581d43c mov rcx, rax
14581d43f xor edx, edx
14581d441 call 0x145b79d30
14581d446 nop
14581d447 movzx edx, byte ptr [rdi + 0x17c]
14581d44e lea rcx, [rbp + 0x58]
14581d452 call 0x145b79d30
14581d457 nop
14581d458 movzx edx, byte ptr [rdi + 0x17d]
14581d45f mov rcx, rax
14581d462 call 0x145b79d30
14581d467 nop
14581d468 movzx edx, byte ptr [rdi + 0x1d8]
14581d46f lea rcx, [rbp + 0x58]
14581d473 call 0x145b79d30
14581d478 nop
14581d479 movzx edx, byte ptr [rdi + 0x1d9]
14581d480 mov rcx, rax
14581d483 call 0x145b79d30
14581d488 nop
14581d489 movzx edx, byte ptr [rdi + 0x1da]
14581d490 mov rcx, rax
14581d493 call 0x145b79d30
14581d498 nop
14581d499 cmp qword ptr [rdi + 0x48], -1
14581d49e je 0x14581d4bc
14581d4a0 lea rcx, [rbp + 0x58]
14581d4a4 mov dl, 1
14581d4a6 call 0x145b79d30
14581d4ab nop
14581d4ac lea rcx, [rdi + 0x48]
14581d4b0 lea rdx, [rbp + 0x58]
14581d4b4 call 0x145b7c260
14581d4b9 nop
14581d4ba jmp 0x14581d4c8
14581d4bc lea rcx, [rbp + 0x58]
14581d4c0 xor edx, edx
14581d4c2 call 0x145b79d30
14581d4c7 nop
14581d4c8 mov edx, dword ptr [rdi + 0x1d4]
14581d4ce lea rcx, [rbp + 0x58]
14581d4d2 call 0x145b79ed0
14581d4d7 nop
14581d4d8 movzx edx, byte ptr [rdi + 0x1e3]
14581d4df mov rcx, rax
14581d4e2 call 0x145b79d30
14581d4e7 nop
14581d4e8 mov rdx, qword ptr [rdi + 0x38]
14581d4ec mov r8, qword ptr [rdi + 0x40]
14581d4f0 mov rcx, rax
14581d4f3 call 0x145b79dd0
14581d4f8 nop
14581d4f9 mov rax, qword ptr [rbp + 0x68]
14581d4fd mov qword ptr [rsi + 0x10], rax
14581d501 movups xmm0, xmmword ptr [rbp + 0x58]
14581d505 movups xmmword ptr [rsi], xmm0
14581d508 mov rax, rsi
14581d50b add rsp, 0xf8
14581d512 pop rbx
14581d513 pop rdi
14581d514 pop rsi
14581d515 pop r12
14581d517 pop r13
14581d519 pop r14
14581d51b pop r15
14581d51d pop rbp
14581d51e ret
14581d51f lea rcx, [rbp + 0x58]
14581d523 mov dl, 4
14581d525 call 0x145b79d30
14581d52a nop
14581d52b mov rcx, rax
14581d52e xor edx, edx
14581d530 call 0x145b79d30
14581d535 nop
14581d536 jmp 0x14581d4f9
14581d538 lea rcx, [rbp + 0x58]
14581d53c mov dl, 9
14581d53e call 0x145b79d30
14581d543 nop
14581d544 mov rcx, rax
14581d547 mov edx, ebx
14581d549 call 0x145b79d30
14581d54e nop
14581d54f jmp 0x14581d4f9
14581d551 lea rcx, [rbp + 0x58]
14581d555 mov dl, 2
14581d557 call 0x145b79d30
14581d55c nop
14581d55d mov rcx, rax
14581d560 mov edx, ebx
14581d562 call 0x145b79d30
14581d567 nop
14581d568 jmp 0x14581d4f9
14581d56a lea rcx, [rbp + 0x58]
14581d56e mov dl, 3
14581d570 call 0x145b79d30
14581d575 nop
14581d576 mov rcx, rax
14581d579 xor edx, edx
14581d57b call 0x145b79d30
14581d580 nop
14581d581 jmp 0x14581d4f9
14581d586 lea rcx, [rbp + 0x58]
14581d58a mov dl, 7
14581d58c call 0x145b79d30
14581d591 nop
14581d592 mov rcx, rax
14581d595 mov edx, ebx
14581d597 call 0x145b79d30
14581d59c nop
14581d59d jmp 0x14581d4f9
14581d5a2 lea rcx, [rbp + 0x58]
14581d5a6 mov dl, 1
14581d5a8 call 0x145b79d30
14581d5ad nop
14581d5ae mov rcx, rax
14581d5b1 xor edx, edx
14581d5b3 call 0x145b79d30
14581d5b8 nop
14581d5b9 jmp 0x14581d4f9
14581d5be lea rcx, [rbp + 0x58]
14581d5c2 mov dl, 5
14581d5c4 call 0x145b79d30
14581d5c9 nop
14581d5ca mov rcx, rax
14581d5cd xor edx, edx
14581d5cf call 0x145b79d30
14581d5d4 nop
14581d5d5 jmp 0x14581d4f9
14581d5da lea rcx, [rbp + 0x58]
14581d5de mov dl, 6
14581d5e0 call 0x145b79d30
14581d5e5 nop
14581d5e6 mov rcx, rax
14581d5e9 xor edx, edx
14581d5eb call 0x145b79d30
14581d5f0 nop
14581d5f1 jmp 0x14581d4f9
14581d5f6 lea rcx, [rbp + 0x58]
14581d5fa mov dl, 8
14581d5fc call 0x145b79d30
14581d601 nop
14581d602 mov rcx, rax
14581d605 mov edx, ebx
14581d607 call 0x145b79d30
14581d60c nop
14581d60d jmp 0x14581d4f9
