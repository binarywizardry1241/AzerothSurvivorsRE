145ada7f0 add rdx, -3
145ada7f4 cmp rdx, 0xe
145ada7f8 ja 0x145adaad0
145ada7fe lea rax, [rip + 0x17feda7]
145ada805 movsxd rdx, dword ptr [rax + rdx*4]
145ada809 add rdx, rax
145ada80c jmp rdx
145ada80e movzx eax, word ptr [rcx]
145ada811 xor eax, 0x776f
145ada816 movzx ecx, byte ptr [rcx + 2]
145ada81a xor ecx, 0x6c
145ada81d or cx, ax
145ada820 jne 0x145adaad0
145ada826 lea rax, [rip + 0x17f5aeb]
145ada82d ret
145ada82e mov eax, 0x6163616d
145ada833 xor eax, dword ptr [rcx]
145ada835 movzx edx, byte ptr [rcx + 4]
145ada839 xor edx, 0x77
145ada83c or edx, eax
145ada83e je 0x145adaad3
145ada844 mov eax, 0x6c656877
145ada849 xor eax, dword ptr [rcx]
145ada84b movzx edx, byte ptr [rcx + 4]
145ada84f xor edx, 0x70
145ada852 or edx, eax
145ada854 je 0x145adab03
145ada85a mov eax, 0x63616f72
145ada85f xor eax, dword ptr [rcx]
145ada861 movzx edx, byte ptr [rcx + 4]
145ada865 xor edx, 0x68
145ada868 or edx, eax
145ada86a je 0x145adab2b
145ada870 mov eax, 0x646e6170
145ada875 xor eax, dword ptr [rcx]
145ada877 movzx edx, byte ptr [rcx + 4]
145ada87b xor edx, 0x61
145ada87e or edx, eax
145ada880 je 0x145adab4b
145ada886 mov eax, 0x6f726568
145ada88b xor eax, dword ptr [rcx]
145ada88d movzx ecx, byte ptr [rcx + 4]
145ada891 xor ecx, 0x64
145ada894 or ecx, eax
145ada896 jne 0x145adaad0
145ada89c lea rax, [rip + 0x17f61f5]
145ada8a3 ret
145ada8a4 movabs rax, 0x6c65727269757173
145ada8ae cmp qword ptr [rcx], rax
145ada8b1 je 0x145adaadb
145ada8b7 movabs rax, 0x676e696c6772657a
145ada8c1 cmp qword ptr [rcx], rax
145ada8c4 je 0x145adab0b
145ada8ca movabs rax, 0x64696e6f6b617264
145ada8d4 cmp qword ptr [rcx], rax
145ada8d7 je 0x145adab33
145ada8dd movabs rax, 0x7365686374697473
145ada8e7 cmp qword ptr [rcx], rax
145ada8ea je 0x145adab53
145ada8f0 movabs rax, 0x6e6169726166656e
145ada8fa cmp qword ptr [rcx], rax
145ada8fd jne 0x145adaad0
145ada903 lea rax, [rip + 0x17f61ee]
145ada90a ret
145ada90b cmp dword ptr [rcx], 0x676f7266
145ada911 je 0x145adaae3
145ada917 cmp dword ptr [rcx], 0x6572676f
145ada91d jne 0x145adaad0
145ada923 lea rax, [rip + 0x17f5fee]
145ada92a ret
145ada92b movabs rax, 0x6b616e73676e696b
145ada935 xor rax, qword ptr [rcx]
145ada938 movzx edx, byte ptr [rcx + 8]
145ada93c xor rdx, 0x65
145ada940 or rdx, rax
145ada943 je 0x145adaaeb
145ada949 movabs rax, 0x6f72696870706173
145ada953 xor rax, qword ptr [rcx]
145ada956 movzx edx, byte ptr [rcx + 8]
145ada95a xor rdx, 0x6e
145ada95e or rdx, rax
145ada961 je 0x145adab13
145ada967 movabs rax, 0x726175676d6f6f64
145ada971 xor rax, qword ptr [rcx]
145ada974 movzx edx, byte ptr [rcx + 8]
145ada978 xor rdx, 0x64
145ada97c or rdx, rax
145ada97f je 0x145adab3b
145ada985 movabs rax, 0x7561736c69766564
145ada98f xor rax, qword ptr [rcx]
145ada992 movzx ecx, byte ptr [rcx + 8]
145ada996 xor rcx, 0x72
145ada99a or rcx, rax
145ada99d jne 0x145adaad0
145ada9a3 lea rax, [rip + 0x17f5f0e]
145ada9aa ret
145ada9ab movabs rax, 0x68775f6572757a61
145ada9b5 xor rax, qword ptr [rcx]
145ada9b8 movabs rdx, 0x706c6568775f6572
145ada9c2 xor rdx, qword ptr [rcx + 3]
145ada9c6 or rdx, rax
145ada9c9 jne 0x145adaad0
145ada9cf lea rax, [rip + 0x17f6002]
145ada9d6 ret
145ada9d7 mov eax, 0x62626172
145ada9dc xor eax, dword ptr [rcx]
145ada9de movzx edx, word ptr [rcx + 4]
145ada9e2 xor edx, 0x7469
145ada9e8 or edx, eax
145ada9ea je 0x145adaaf3
145ada9f0 mov eax, 0x74726164
145ada9f5 xor eax, dword ptr [rcx]
145ada9f7 movzx edx, word ptr [rcx + 4]
145ada9fb xor edx, 0x7265
145adaa01 or edx, eax
145adaa03 je 0x145adab1b
145adaa09 mov eax, 0x64726f67
145adaa0e xor eax, dword ptr [rcx]
145adaa10 movzx ecx, word ptr [rcx + 4]
145adaa14 xor ecx, 0x6b6f
145adaa1a or ecx, eax
145adaa1c jne 0x145adaad0
145adaa22 lea rax, [rip + 0x17f5f4f]
145adaa29 ret
145adaa2a mov eax, 0x63696863
145adaa2f xor eax, dword ptr [rcx]
145adaa31 mov edx, 0x6e656b63
145adaa36 xor edx, dword ptr [rcx + 3]
145adaa39 or edx, eax
145adaa3b jne 0x145adaad0
145adaa41 lea rax, [rip + 0x17f5b10]
145adaa48 ret
145adaa49 movdqu xmm0, xmmword ptr [rcx]
145adaa4d movzx eax, byte ptr [rcx + 0x10]
145adaa51 movd xmm1, eax
145adaa55 pcmpeqb xmm0, xmmword ptr [rip + 0x17f4643]
145adaa5d pcmpeqb xmm1, xmmword ptr [rip + 0xb1e0bb]
145adaa65 pand xmm1, xmm0
145adaa69 pmovmskb eax, xmm1
145adaa6d cmp eax, 0xffff
145adaa72 jne 0x145adaad0
145adaa74 lea rax, [rip + 0x17f5fbd]
145adaa7b ret
145adaa7c movabs rax, 0x745f6e61696c757a
145adaa86 xor rax, qword ptr [rcx]
145adaa89 mov edx, dword ptr [rcx + 8]
145adaa8c xor rdx, 0x72656769
145adaa93 or rdx, rax
145adaa96 je 0x145adaafb
145adaa98 movabs rax, 0x635f666f5f657965
145adaaa2 xor rax, qword ptr [rcx]
145adaaa5 mov edx, dword ptr [rcx + 8]
145adaaa8 xor rdx, 0x6e756874
145adaaaf or rdx, rax
145adaab2 je 0x145adab23
145adaab4 movabs rax, 0x7773656c67676962
145adaabe xor rax, qword ptr [rcx]
145adaac1 mov ecx, dword ptr [rcx + 8]
145adaac4 xor rcx, 0x6874726f
145adaacb or rcx, rax
145adaace je 0x145adab43
145adaad0 xor eax, eax
145adaad2 ret
145adaad3 lea rax, [rip + 0x17f57de]
145adaada ret
145adaadb lea rax, [rip + 0x17f5716]
145adaae2 ret
145adaae3 lea rax, [rip + 0x17f588e]
145adaaea ret
145adaaeb lea rax, [rip + 0x17f58e6]
145adaaf2 ret
145adaaf3 lea rax, [rip + 0x17f575e]
145adaafa ret
145adaafb lea rax, [rip + 0x17f5bd6]
145adab02 ret
145adab03 lea rax, [rip + 0x17f598e]
145adab0a ret
145adab0b lea rax, [rip + 0x17f59e6]
145adab12 ret
145adab13 lea rax, [rip + 0x17f5b5e]
145adab1a ret
145adab1b lea rax, [rip + 0x17f5916]
145adab22 ret
145adab23 lea rax, [rip + 0x17f5c6e]
145adab2a ret
145adab2b lea rax, [rip + 0x17f5a86]
145adab32 ret
145adab33 lea rax, [rip + 0x17f5bfe]
145adab3a ret
145adab3b lea rax, [rip + 0x17f5d16]
145adab42 ret
145adab43 lea rax, [rip + 0x17f600e]
145adab4a ret
145adab4b lea rax, [rip + 0x17f5ac6]
145adab52 ret
145adab53 lea rax, [rip + 0x17f5c9e]
145adab5a ret
