; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145bf87e6 ba01000000                     mov edx, 1
0000000145bf87eb 488b4d18                       mov rcx, qword ptr [rbp + 0x18]
0000000145bf87ef 4c8b85f0010000                 mov r8, qword ptr [rbp + 0x1f0]
0000000145bf87f6 41b101                         mov r9b, 1
0000000145bf87f9 e882a15300                     call 0x146132980
0000000145bf87fe 90                             nop
0000000145bf87ff e9d2ebffff                     jmp 0x145bf73d6
0000000145bf8804 ba01000000                     mov edx, 1
0000000145bf8809 488b4d68                       mov rcx, qword ptr [rbp + 0x68]
0000000145bf880d 4c8b4570                       mov r8, qword ptr [rbp + 0x70]
0000000145bf8811 41b101                         mov r9b, 1
0000000145bf8814 e8b79a5300                     call 0x1461322d0
0000000145bf8819 90                             nop
0000000145bf881a e969f8ffff                     jmp 0x145bf8088
0000000145bf881f 660f6f00                       movdqa xmm0, xmmword ptr [rax]
0000000145bf8823 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bf8828 f3450fbcc0                     tzcnt r8d, r8d
0000000145bf882d 460fb60c00                     movzx r9d, byte ptr [rax + r8]
0000000145bf8832 e945f7ffff                     jmp 0x145bf7f7c
0000000145bf8837 660f6f00                       movdqa xmm0, xmmword ptr [rax]
0000000145bf883b 66440fd7c0                     pmovmskb r8d, xmm0
0000000145bf8840 f3450fbcc0                     tzcnt r8d, r8d
0000000145bf8845 460fb60c00                     movzx r9d, byte ptr [rax + r8]
0000000145bf884a e982faffff                     jmp 0x145bf82d1
