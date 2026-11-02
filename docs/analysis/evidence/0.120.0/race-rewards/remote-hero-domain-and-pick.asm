0000000145aa97a0  55                     push rbp
0000000145aa97a1  4157                   push r15
0000000145aa97a3  4156                   push r14
0000000145aa97a5  4155                   push r13
0000000145aa97a7  4154                   push r12
0000000145aa97a9  56                     push rsi
0000000145aa97aa  57                     push rdi
0000000145aa97ab  53                     push rbx
0000000145aa97ac  4881ec78030000         sub rsp, 0x378
0000000145aa97b3  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145aa97bb  66440f7f85e0020000     movdqa xmmword ptr [rbp + 0x2e0], xmm8
0000000145aa97c4  0f29bdd0020000         movaps xmmword ptr [rbp + 0x2d0], xmm7
0000000145aa97cb  0f29b5c0020000         movaps xmmword ptr [rbp + 0x2c0], xmm6
0000000145aa97d2  48c785b8020000feffffff mov qword ptr [rbp + 0x2b8], 0xfffffffffffffffe
0000000145aa97dd  4989d7                 mov r15, rdx
0000000145aa97e0  4889ce                 mov rsi, rcx
0000000145aa97e3  48c7c0000080ff         mov rax, 0xffffffffff800000
0000000145aa97ea  48038288010000         add rax, qword ptr [rdx + 0x188]
0000000145aa97f1  483d00ff7f00           cmp rax, 0x7fff00
0000000145aa97f7  0f839b030000           jae 0x145aa9b98
0000000145aa97fd  410fb6bfe3010000       movzx edi, byte ptr [r15 + 0x1e3]
0000000145aa9805  83ff0b                 cmp edi, 0xb
0000000145aa9808  0f878a030000           ja 0x145aa9b98
0000000145aa980e  b8be0b0000             mov eax, 0xbbe
0000000145aa9813  0fa3f8                 bt eax, edi
0000000145aa9816  0f837c030000           jae 0x145aa9b98
0000000145aa981c  410fb69fe4010000       movzx ebx, byte ptr [r15 + 0x1e4]
0000000145aa9824  8d43ff                 lea eax, [rbx - 1]
0000000145aa9827  3c07                   cmp al, 7
0000000145aa9829  0f8769030000           ja 0x145aa9b98
0000000145aa982f  49837f1000             cmp qword ptr [r15 + 0x10], 0
0000000145aa9834  0f845e030000           je 0x145aa9b98
0000000145aa983a  458ab7e5010000         mov r14b, byte ptr [r15 + 0x1e5]
0000000145aa9841  410fb687ea010000       movzx eax, byte ptr [r15 + 0x1ea]
0000000145aa9849  888574020000           mov byte ptr [rbp + 0x274], al
0000000145aa984f  418b87e6010000         mov eax, dword ptr [r15 + 0x1e6]
0000000145aa9856  898570020000           mov dword ptr [rbp + 0x270], eax
0000000145aa985c  488d8d20020000         lea rcx, [rbp + 0x220]
0000000145aa9863  4c89bda8020000         mov qword ptr [rbp + 0x2a8], r15
0000000145aa986a  4c89fa                 mov rdx, r15
0000000145aa986d  e84ed44c00             call 0x145f76cc0
0000000145aa9872  90                     nop
0000000145aa9873  488d8d98000000         lea rcx, [rbp + 0x98]
0000000145aa987a  e86105ffff             call 0x145a99de0
0000000145aa987f  90                     nop
0000000145aa9880  4088bdf8010000         mov byte ptr [rbp + 0x1f8], dil
0000000145aa9887  889df9010000           mov byte ptr [rbp + 0x1f9], bl
0000000145aa988d  4488b5fa010000         mov byte ptr [rbp + 0x1fa], r14b
0000000145aa9894  0f108520020000         movups xmm0, xmmword ptr [rbp + 0x220]
0000000145aa989b  0f2985c0010000         movaps xmmword ptr [rbp + 0x1c0], xmm0
0000000145aa98a2  488b8530020000         mov rax, qword ptr [rbp + 0x230]
0000000145aa98a9  488985d0010000         mov qword ptr [rbp + 0x1d0], rax
0000000145aa98b0  f30f6f85b0000000       movdqu xmm0, xmmword ptr [rbp + 0xb0]
0000000145aa98b8  f30f6f8dc0000000       movdqu xmm1, xmmword ptr [rbp + 0xc0]
0000000145aa98c0  f30f7f85d8010000       movdqu xmmword ptr [rbp + 0x1d8], xmm0
0000000145aa98c8  f30f7f8de8010000       movdqu xmmword ptr [rbp + 0x1e8], xmm1
0000000145aa98d0  8b8570020000           mov eax, dword ptr [rbp + 0x270]
0000000145aa98d6  8985fb010000           mov dword ptr [rbp + 0x1fb], eax
0000000145aa98dc  0fb68574020000         movzx eax, byte ptr [rbp + 0x274]
0000000145aa98e3  8885ff010000           mov byte ptr [rbp + 0x1ff], al
0000000145aa98e9  488d8d20020000         lea rcx, [rbp + 0x220]
0000000145aa98f0  488d95c0010000         lea rdx, [rbp + 0x1c0]
0000000145aa98f7  e864e8feff             call 0x145a98160
0000000145aa98fc  90                     nop
