0000000145bb6ee6 80bebc11000001                 cmp byte ptr [rsi + 0x11bc], 1
0000000145bb6eed 0f8528010000                   jne 0x145bb701b
0000000145bb6ef3 4883be9011000000               cmp qword ptr [rsi + 0x1190], 0
0000000145bb6efb 0f851a010000                   jne 0x145bb701b
0000000145bb6f01 80bebd11000000                 cmp byte ptr [rsi + 0x11bd], 0
0000000145bb6f08 0f850d010000                   jne 0x145bb701b
0000000145bb6f0e 488b85400c0000                 mov rax, qword ptr [rbp + 0xc40]
0000000145bb6f15 488d8d70060000                 lea rcx, [rbp + 0x670]
0000000145bb6f1c 48894110                       mov qword ptr [rcx + 0x10], rax
0000000145bb6f20 0f1085300c0000                 movups xmm0, xmmword ptr [rbp + 0xc30]
0000000145bb6f27 0f1101                         movups xmmword ptr [rcx], xmm0
0000000145bb6f2a 48c7858806000000000000         mov qword ptr [rbp + 0x688], 0
0000000145bb6f35 48c7855806000000000000         mov qword ptr [rbp + 0x658], 0
0000000145bb6f40 48c7856006000001000000         mov qword ptr [rbp + 0x660], 1
0000000145bb6f4b 48c7856806000000000000         mov qword ptr [rbp + 0x668], 0
0000000145bb6f56 c6859006000000                 mov byte ptr [rbp + 0x690], 0
0000000145bb6f5d 48b81500000000000080           movabs rax, 0x8000000000000015
0000000145bb6f67 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb6f6e 488b8e80110000                 mov rcx, qword ptr [rsi + 0x1180]
0000000145bb6f75 488b9688110000                 mov rdx, qword ptr [rsi + 0x1188]
0000000145bb6f7c 4c8b85700b0000                 mov r8, qword ptr [rbp + 0xb70]
0000000145bb6f83 e8a8acfdff                     call 0x145b91c30
0000000145bb6f88 90                             nop 
0000000145bb6f89 4889f0                         mov rax, rsi
0000000145bb6f8c 488bb680110000                 mov rsi, qword ptr [rsi + 0x1180]
0000000145bb6f93 488bb888110000                 mov rdi, qword ptr [rax + 0x1188]
0000000145bb6f9a 488d8d500c0000                 lea rcx, [rbp + 0xc50]
0000000145bb6fa1 488d9550060000                 lea rdx, [rbp + 0x650]
0000000145bb6fa8 e8e3da1500                     call 0x145d14a90
0000000145bb6fad 90                             nop 
0000000145bb6fae 488b95580c0000                 mov rdx, qword ptr [rbp + 0xc58]
0000000145bb6fb5 4c8b85600c0000                 mov r8, qword ptr [rbp + 0xc60]
0000000145bb6fbc f04c010584a2aa02               lock add qword ptr [rip + 0x2aaa284], r8
0000000145bb6fc4 f048ff058ca2aa02               lock inc qword ptr [rip + 0x2aaa28c]
0000000145bb6fcc 4889f1                         mov rcx, rsi
0000000145bb6fcf 488995e00c0000                 mov qword ptr [rbp + 0xce0], rdx
0000000145bb6fd6 ff5718                         call qword ptr [rdi + 0x18]
0000000145bb6fd9 90                             nop 
0000000145bb6fda 488b95500c0000                 mov rdx, qword ptr [rbp + 0xc50]
0000000145bb6fe1 4885d2                         test rdx, rdx
0000000145bb6fe4 488db550060000                 lea rsi, [rbp + 0x650]
0000000145bb6feb 7412                           je 0x145bb6fff
0000000145bb6fed 41b801000000                   mov r8d, 1
0000000145bb6ff3 488b8de00c0000                 mov rcx, qword ptr [rbp + 0xce0]
0000000145bb6ffa e8d1b144fa                     call 0x1400021d0
0000000145bb6fff c6854a0d000000                 mov byte ptr [rbp + 0xd4a], 0
0000000145bb7006 4889f1                         mov rcx, rsi
0000000145bb7009 e8c235ffff                     call 0x145baa5d0
0000000145bb700e 90                             nop 
0000000145bb700f 4d89e6                         mov r14, r12
0000000145bb7012 4c8ba5100d0000                 mov r12, qword ptr [rbp + 0xd10]
0000000145bb7019 eb25                           jmp 0x145bb7040
