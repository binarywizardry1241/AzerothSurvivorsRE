0000000145b7b9d6  440fb6a73d030000       movzx r12d, byte ptr [rdi + 0x33d]
0000000145b7b9de  448abf3e030000         mov r15b, byte ptr [rdi + 0x33e]
0000000145b7b9e5  410fb6f4               movzx esi, r12b
0000000145b7b9e9  410fb6858c000000       movzx eax, byte ptr [r13 + 0x8c]
0000000145b7b9f1  c1e008                 shl eax, 8
0000000145b7b9f4  09f0                   or eax, esi
0000000145b7b9f6  450fb6f7               movzx r14d, r15b
0000000145b7b9fa  4489f1                 mov ecx, r14d
0000000145b7b9fd  c1e110                 shl ecx, 0x10
0000000145b7ba00  09c1                   or ecx, eax
0000000145b7ba02  450fb6858d000000       movzx r8d, byte ptr [r13 + 0x8d]
0000000145b7ba0a  41c1e018               shl r8d, 0x18
0000000145b7ba0e  4109c8                 or r8d, ecx
0000000145b7ba11  4889e9                 mov rcx, rbp
0000000145b7ba14  66ba2400               mov dx, 0x24
0000000145b7ba18  e8333ef0ff             call 0x145a7f850
0000000145b7ba1d  90                     nop
0000000145b7ba1e  4889e9                 mov rcx, rbp
0000000145b7ba21  66ba2e00               mov dx, 0x2e
0000000145b7ba25  41b808000000           mov r8d, 8
0000000145b7ba2b  e8203ef0ff             call 0x145a7f850
0000000145b7ba30  90                     nop
0000000145b7ba31  4889e9                 mov rcx, rbp
0000000145b7ba34  66ba7e00               mov dx, 0x7e
0000000145b7ba38  41b8d0070000           mov r8d, 0x7d0
0000000145b7ba3e  e80d3ef0ff             call 0x145a7f850
0000000145b7ba43  90                     nop
0000000145b7ba44  4889e9                 mov rcx, rbp
0000000145b7ba47  66ba7f00               mov dx, 0x7f
0000000145b7ba4b  41b8d0070000           mov r8d, 0x7d0
0000000145b7ba51  e8fa3df0ff             call 0x145a7f850
0000000145b7ba56  90                     nop
0000000145b7ba57  4889e9                 mov rcx, rbp
0000000145b7ba5a  66ba8100               mov dx, 0x81
0000000145b7ba5e  41b8022bc73e           mov r8d, 0x3ec72b02
0000000145b7ba64  e8e73df0ff             call 0x145a7f850
0000000145b7ba69  90                     nop
0000000145b7ba6a  4889e9                 mov rcx, rbp
0000000145b7ba6d  66ba8200               mov dx, 0x82
0000000145b7ba71  41b80000c03f           mov r8d, 0x3fc00000
0000000145b7ba77  e8d43df0ff             call 0x145a7f850
0000000145b7ba7c  90                     nop
0000000145b7ba7d  488b8750080000         mov rax, qword ptr [rdi + 0x850]
0000000145b7ba84  4885c0                 test rax, rax
0000000145b7ba87  0f84bf000000           je 0x145b7bb4c
0000000145b7ba8d  488b8f48080000         mov rcx, qword ptr [rdi + 0x848]
0000000145b7ba94  48c1e006               shl rax, 6
0000000145b7ba98  83fe08                 cmp esi, 8
0000000145b7ba9b  7767                   ja 0x145b7bb04
0000000145b7ba9d  ba64010000             mov edx, 0x164
0000000145b7baa2  0fa3f2                 bt edx, esi
0000000145b7baa5  735d                   jae 0x145b7bb04
0000000145b7baa7  31d2                   xor edx, edx
0000000145b7baa9  eb12                   jmp 0x145b7babd
0000000145b7baab  0f1f440000             nop dword ptr [rax + rax]
0000000145b7bab0  4883c240               add rdx, 0x40
0000000145b7bab4  4839d0                 cmp rax, rdx
0000000145b7bab7  0f848f000000           je 0x145b7bb4c
0000000145b7babd  803c1119               cmp byte ptr [rcx + rdx], 0x19
0000000145b7bac1  75ed                   jne 0x145b7bab0
0000000145b7bac3  448b441104             mov r8d, dword ptr [rcx + rdx + 4]
0000000145b7bac8  4181f800030000         cmp r8d, 0x300
0000000145b7bacf  741e                   je 0x145b7baef
0000000145b7bad1  4181f8a2250000         cmp r8d, 0x25a2
0000000145b7bad8  75d6                   jne 0x145b7bab0
0000000145b7bada  41b8f1080000           mov r8d, 0x8f1
0000000145b7bae0  b801000000             mov eax, 1
0000000145b7bae5  83f801                 cmp eax, 1
0000000145b7bae8  7569                   jne 0x145b7bb53
0000000145b7baea  e99c000000             jmp 0x145b7bb8b
0000000145b7baef  41b87b210000           mov r8d, 0x217b
0000000145b7baf5  b801000000             mov eax, 1
0000000145b7bafa  83f801                 cmp eax, 1
0000000145b7bafd  7554                   jne 0x145b7bb53
0000000145b7baff  e987000000             jmp 0x145b7bb8b
0000000145b7bb04  31d2                   xor edx, edx
0000000145b7bb06  eb11                   jmp 0x145b7bb19
0000000145b7bb08  0f1f840000000000       nop dword ptr [rax + rax]
0000000145b7bb10  4883c240               add rdx, 0x40
0000000145b7bb14  4839d0                 cmp rax, rdx
0000000145b7bb17  7433                   je 0x145b7bb4c
0000000145b7bb19  803c1119               cmp byte ptr [rcx + rdx], 0x19
0000000145b7bb1d  75f1                   jne 0x145b7bb10
0000000145b7bb1f  448b441104             mov r8d, dword ptr [rcx + rdx + 4]
0000000145b7bb24  4181f800030000         cmp r8d, 0x300
0000000145b7bb2b  0f84ca030000           je 0x145b7befb
0000000145b7bb31  4181f8a2250000         cmp r8d, 0x25a2
0000000145b7bb38  75d6                   jne 0x145b7bb10
0000000145b7bb3a  41b8e9080000           mov r8d, 0x8e9
0000000145b7bb40  b801000000             mov eax, 1
0000000145b7bb45  83f801                 cmp eax, 1
0000000145b7bb48  7509                   jne 0x145b7bb53
0000000145b7bb4a  eb3f                   jmp 0x145b7bb8b
0000000145b7bb4c  31c0                   xor eax, eax
0000000145b7bb4e  83f801                 cmp eax, 1
0000000145b7bb51  7438                   je 0x145b7bb8b
0000000145b7bb53  418d4424fe             lea eax, [r12 - 2]
0000000145b7bb58  3c06                   cmp al, 6
0000000145b7bb5a  771d                   ja 0x145b7bb79
0000000145b7bb5c  0fb6c0                 movzx eax, al
0000000145b7bb5f  c1e002                 shl eax, 2
0000000145b7bb62  488d0d9bbea701         lea rcx, [rip + 0x1a7be9b]
0000000145b7bb69  448b0408               mov r8d, dword ptr [rax + rcx]
0000000145b7bb6d  488d0dacbea701         lea rcx, [rip + 0x1a7beac]
0000000145b7bb74  8b0408                 mov eax, dword ptr [rax + rcx]
0000000145b7bb77  eb0b                   jmp 0x145b7bb84
0000000145b7bb79  b831000000             mov eax, 0x31
0000000145b7bb7e  41b832000000           mov r8d, 0x32
0000000145b7bb84  4584ff                 test r15b, r15b
0000000145b7bb87  440f44c0               cmove r8d, eax
0000000145b7bb8b  4889e9                 mov rcx, rbp
0000000145b7bb8e  66ba8300               mov dx, 0x83
0000000145b7bb92  e8b93cf0ff             call 0x145a7f850
0000000145b7bb97  90                     nop
0000000145b7bb98  4180c4fe               add r12b, 0xfe
0000000145b7bb9c  4180fc06               cmp r12b, 6
0000000145b7bba0  771e                   ja 0x145b7bbc0
0000000145b7bba2  410fb6c4               movzx eax, r12b
0000000145b7bba6  c1e002                 shl eax, 2
0000000145b7bba9  488d0d54bea701         lea rcx, [rip + 0x1a7be54]
0000000145b7bbb0  448b0408               mov r8d, dword ptr [rax + rcx]
0000000145b7bbb4  488d0d65bea701         lea rcx, [rip + 0x1a7be65]
0000000145b7bbbb  8b0408                 mov eax, dword ptr [rax + rcx]
0000000145b7bbbe  eb0b                   jmp 0x145b7bbcb
0000000145b7bbc0  b831000000             mov eax, 0x31
0000000145b7bbc5  41b832000000           mov r8d, 0x32
0000000145b7bbcb  4584ff                 test r15b, r15b
0000000145b7bbce  440f44c0               cmove r8d, eax
0000000145b7bbd2  4889e9                 mov rcx, rbp
0000000145b7bbd5  66ba8400               mov dx, 0x84
0000000145b7bbd9  e8723cf0ff             call 0x145a7f850
