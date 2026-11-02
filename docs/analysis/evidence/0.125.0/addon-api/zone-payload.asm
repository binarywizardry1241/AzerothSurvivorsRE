0000000145c06860  55                              push rbp
0000000145c06861  4157                            push r15
0000000145c06863  4156                            push r14
0000000145c06865  4155                            push r13
0000000145c06867  4154                            push r12
0000000145c06869  56                              push rsi
0000000145c0686a  57                              push rdi
0000000145c0686b  53                              push rbx
0000000145c0686c  4881ec48020000                  sub rsp, 0x248
0000000145c06873  488dac2480000000                lea rbp, [rsp + 0x80]
0000000145c0687b  48c785c0010000feffffff          mov qword ptr [rbp + 0x1c0], 0xfffffffffffffffe
0000000145c06886  4889d7                          mov rdi, rdx
0000000145c06889  4889cb                          mov rbx, rcx
0000000145c0688c  4c8bbad0020000                  mov r15, qword ptr [rdx + 0x2d0]
0000000145c06893  4c8ba2d8020000                  mov r12, qword ptr [rdx + 0x2d8]
0000000145c0689a  4c89f9                          mov rcx, r15
0000000145c0689d  4c89e2                          mov rdx, r12
0000000145c068a0  e86ba8eaff                      call 0x145ab1110
0000000145c068a5  4869f0f0000000                  imul rsi, rax, 0xf0
0000000145c068ac  488d15dd003e01                  lea rdx, [rip + 0x13e00dd]
0000000145c068b3  0fb68754030000                  movzx eax, byte ptr [rdi + 0x354]
0000000145c068ba  04fe                            add al, 0xfe
0000000145c068bc  3c09                            cmp al, 9
0000000145c068be  7710                            ja 0x145c068d0
0000000145c068c0  0fb6c0                          movzx eax, al
0000000145c068c3  488d0da62bac01                  lea rcx, [rip + 0x1ac2ba6]
0000000145c068ca  4c8b34c1                        mov r14, qword ptr [rcx + rax*8]
0000000145c068ce  eb07                            jmp 0x145c068d7
0000000145c068d0  4c8d3511243e01                  lea r14, [rip + 0x13e2411]
0000000145c068d7  4801d6                          add rsi, rdx
0000000145c068da  0fb68755030000                  movzx eax, byte ptr [rdi + 0x355]
0000000145c068e1  04fe                            add al, 0xfe
0000000145c068e3  3c06                            cmp al, 6
0000000145c068e5  48895db0                        mov qword ptr [rbp - 0x50], rbx
0000000145c068e9  4c89bdb0010000                  mov qword ptr [rbp + 0x1b0], r15
0000000145c068f0  4c89a5a0010000                  mov qword ptr [rbp + 0x1a0], r12
0000000145c068f7  7710                            ja 0x145c06909
0000000145c068f9  0fb6c0                          movzx eax, al
0000000145c068fc  488d0df52aac01                  lea rcx, [rip + 0x1ac2af5]
0000000145c06903  488b04c1                        mov rax, qword ptr [rcx + rax*8]
0000000145c06907  eb07                            jmp 0x145c06910
0000000145c06909  488d0540123e01                  lea rax, [rip + 0x13e1240]
0000000145c06910  48898580000000                  mov qword ptr [rbp + 0x80], rax
0000000145c06917  488d4608                        lea rax, [rsi + 8]
0000000145c0691b  488945b8                        mov qword ptr [rbp - 0x48], rax
0000000145c0691f  48898580010000                  mov qword ptr [rbp + 0x180], rax
0000000145c06926  488d0593b73ffa                  lea rax, [rip - 0x5c0486d]
0000000145c0692d  48898588010000                  mov qword ptr [rbp + 0x188], rax
0000000145c06934  488d1543423d01                  lea rdx, [rip + 0x13d4243]
0000000145c0693b  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c06942  4c8d8580010000                  lea r8, [rbp + 0x180]
0000000145c06949  e822e23d00                      call 0x145fe4b70
0000000145c0694e  488b8d90000000                  mov rcx, qword ptr [rbp + 0x90]
0000000145c06955  488b9598000000                  mov rdx, qword ptr [rbp + 0x98]
0000000145c0695c  4c8b6618                        mov r12, qword ptr [rsi + 0x18]
0000000145c06960  488b5e20                        mov rbx, qword ptr [rsi + 0x20]
0000000145c06964  48898da8010000                  mov qword ptr [rbp + 0x1a8], rcx
0000000145c0696b  e86033efff                      call 0x145af9cd0
0000000145c06970  90                              nop 
0000000145c06971  4989c5                          mov r13, rax
0000000145c06974  488b8588000000                  mov rax, qword ptr [rbp + 0x88]
0000000145c0697b  4885c0                          test rax, rax
0000000145c0697e  741b                            je 0x145c0699b
0000000145c06980  41b801000000                    mov r8d, 1
0000000145c06986  488b8da8010000                  mov rcx, qword ptr [rbp + 0x1a8]
0000000145c0698d  4989d7                          mov r15, rdx
0000000145c06990  4889c2                          mov rdx, rax
0000000145c06993  e838b83ffa                      call 0x1400021d0
0000000145c06998  4c89fa                          mov rdx, r15
0000000145c0699b  4d85ed                          test r13, r13
0000000145c0699e  4d0f45e5                        cmovne r12, r13
0000000145c069a2  480f44d3                        cmove rdx, rbx
0000000145c069a6  48c7858800000000000000          mov qword ptr [rbp + 0x88], 0
0000000145c069b1  48c7859000000001000000          mov qword ptr [rbp + 0x90], 1
0000000145c069bc  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145c069c7  4885d2                          test rdx, rdx
0000000145c069ca  0f8576070000                    jne 0x145c07146
0000000145c069d0  4c01e2                          add rdx, r12
0000000145c069d3  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c069da  4c89e1                          mov rcx, r12
0000000145c069dd  e86efe0c00                      call 0x145cd6850
0000000145c069e2  90                              nop 
0000000145c069e3  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c069ea  48894570                        mov qword ptr [rbp + 0x70], rax
0000000145c069ee  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c069f5  0f294560                        movaps xmmword ptr [rbp + 0x60], xmm0
0000000145c069f9  488d4608                        lea rax, [rsi + 8]
0000000145c069fd  48898580010000                  mov qword ptr [rbp + 0x180], rax
0000000145c06a04  488d05b5b63ffa                  lea rax, [rip - 0x5c0494b]
0000000145c06a0b  48898588010000                  mov qword ptr [rbp + 0x188], rax
0000000145c06a12  488d1553413d01                  lea rdx, [rip + 0x13d4153]
0000000145c06a19  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c06a20  4c8d8580010000                  lea r8, [rbp + 0x180]
0000000145c06a27  e844e13d00                      call 0x145fe4b70
0000000145c06a2c  90                              nop 
0000000145c06a2d  488b8d90000000                  mov rcx, qword ptr [rbp + 0x90]
0000000145c06a34  488b9598000000                  mov rdx, qword ptr [rbp + 0x98]
0000000145c06a3b  4c8b6628                        mov r12, qword ptr [rsi + 0x28]
0000000145c06a3f  488b5e30                        mov rbx, qword ptr [rsi + 0x30]
0000000145c06a43  48898da8010000                  mov qword ptr [rbp + 0x1a8], rcx
0000000145c06a4a  e88132efff                      call 0x145af9cd0
0000000145c06a4f  90                              nop 
0000000145c06a50  4989c5                          mov r13, rax
0000000145c06a53  488b8588000000                  mov rax, qword ptr [rbp + 0x88]
0000000145c06a5a  4885c0                          test rax, rax
0000000145c06a5d  741b                            je 0x145c06a7a
0000000145c06a5f  41b801000000                    mov r8d, 1
0000000145c06a65  488b8da8010000                  mov rcx, qword ptr [rbp + 0x1a8]
0000000145c06a6c  4989d7                          mov r15, rdx
0000000145c06a6f  4889c2                          mov rdx, rax
0000000145c06a72  e859b73ffa                      call 0x1400021d0
0000000145c06a77  4c89fa                          mov rdx, r15
0000000145c06a7a  4d85ed                          test r13, r13
0000000145c06a7d  4d0f45e5                        cmovne r12, r13
0000000145c06a81  480f44d3                        cmove rdx, rbx
0000000145c06a85  48c7858800000000000000          mov qword ptr [rbp + 0x88], 0
0000000145c06a90  48c7859000000001000000          mov qword ptr [rbp + 0x90], 1
0000000145c06a9b  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145c06aa6  4885d2                          test rdx, rdx
0000000145c06aa9  0f85d3060000                    jne 0x145c07182
0000000145c06aaf  4c01e2                          add rdx, r12
0000000145c06ab2  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c06ab9  4c89e1                          mov rcx, r12
0000000145c06abc  e88ffd0c00                      call 0x145cd6850
0000000145c06ac1  90                              nop 
0000000145c06ac2  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c06ac9  48894550                        mov qword ptr [rbp + 0x50], rax
0000000145c06acd  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c06ad4  0f294540                        movaps xmmword ptr [rbp + 0x40], xmm0
0000000145c06ad8  488b8db0010000                  mov rcx, qword ptr [rbp + 0x1b0]
0000000145c06adf  488b95a0010000                  mov rdx, qword ptr [rbp + 0x1a0]
0000000145c06ae6  e825a6eaff                      call 0x145ab1110
0000000145c06aeb  4869c0f0000000                  imul rax, rax, 0xf0
0000000145c06af2  488d0d97fe3d01                  lea rcx, [rip + 0x13dfe97]
0000000145c06af9  488b840888000000                mov rax, qword ptr [rax + rcx + 0x88]
0000000145c06b01  80786400                        cmp byte ptr [rax + 0x64], 0
0000000145c06b05  7544                            jne 0x145c06b4b
0000000145c06b07  80b8cc00000000                  cmp byte ptr [rax + 0xcc], 0
0000000145c06b0e  7406                            je 0x145c06b16
0000000145c06b10  4883c068                        add rax, 0x68
0000000145c06b14  eb35                            jmp 0x145c06b4b
0000000145c06b16  80b83401000000                  cmp byte ptr [rax + 0x134], 0
0000000145c06b1d  7408                            je 0x145c06b27
0000000145c06b1f  4805d0000000                    add rax, 0xd0
0000000145c06b25  eb24                            jmp 0x145c06b4b
0000000145c06b27  80b89c01000000                  cmp byte ptr [rax + 0x19c], 0
0000000145c06b2e  7408                            je 0x145c06b38
0000000145c06b30  480538010000                    add rax, 0x138
0000000145c06b36  eb13                            jmp 0x145c06b4b
0000000145c06b38  80b80402000001                  cmp byte ptr [rax + 0x204], 1
0000000145c06b3f  0f85f4050000                    jne 0x145c07139
0000000145c06b45  4805a0010000                    add rax, 0x1a0
0000000145c06b4b  f30f104050                      movss xmm0, dword ptr [rax + 0x50]
0000000145c06b50  f30f590554185e00                mulss xmm0, dword ptr [rip + 0x5e1854]
0000000145c06b58  f30f11857c010000                movss dword ptr [rbp + 0x17c], xmm0
0000000145c06b60  48c745a805000000                mov qword ptr [rbp - 0x58], 5
0000000145c06b68  4d8d6e10                        lea r13, [r14 + 0x10]
0000000145c06b6c  4c89ad80010000                  mov qword ptr [rbp + 0x180], r13
0000000145c06b73  488d0546b53ffa                  lea rax, [rip - 0x5c04aba]
0000000145c06b7a  48898588010000                  mov qword ptr [rbp + 0x188], rax
0000000145c06b81  488d15003f3d01                  lea rdx, [rip + 0x13d3f00]
0000000145c06b88  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c06b8f  4c8d8580010000                  lea r8, [rbp + 0x180]
0000000145c06b96  e8d5df3d00                      call 0x145fe4b70
0000000145c06b9b  90                              nop 
0000000145c06b9c  488b8d90000000                  mov rcx, qword ptr [rbp + 0x90]
0000000145c06ba3  488b9598000000                  mov rdx, qword ptr [rbp + 0x98]
0000000145c06baa  4d8b7e20                        mov r15, qword ptr [r14 + 0x20]
0000000145c06bae  498b5e28                        mov rbx, qword ptr [r14 + 0x28]
0000000145c06bb2  48898db0010000                  mov qword ptr [rbp + 0x1b0], rcx
0000000145c06bb9  e81231efff                      call 0x145af9cd0
0000000145c06bbe  90                              nop 
0000000145c06bbf  4989c4                          mov r12, rax
0000000145c06bc2  488b8588000000                  mov rax, qword ptr [rbp + 0x88]
0000000145c06bc9  4885c0                          test rax, rax
0000000145c06bcc  741b                            je 0x145c06be9
0000000145c06bce  41b801000000                    mov r8d, 1
0000000145c06bd4  488b8db0010000                  mov rcx, qword ptr [rbp + 0x1b0]
0000000145c06bdb  4989d6                          mov r14, rdx
0000000145c06bde  4889c2                          mov rdx, rax
0000000145c06be1  e8eab53ffa                      call 0x1400021d0
0000000145c06be6  4c89f2                          mov rdx, r14
0000000145c06be9  4d85e4                          test r12, r12
0000000145c06bec  4d0f45fc                        cmovne r15, r12
0000000145c06bf0  480f44d3                        cmove rdx, rbx
0000000145c06bf4  48c7858800000000000000          mov qword ptr [rbp + 0x88], 0
0000000145c06bff  48c7859000000001000000          mov qword ptr [rbp + 0x90], 1
0000000145c06c0a  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145c06c15  4885d2                          test rdx, rdx
0000000145c06c18  0f85a0050000                    jne 0x145c071be
0000000145c06c1e  4c01fa                          add rdx, r15
0000000145c06c21  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c06c28  4c89f9                          mov rcx, r15
0000000145c06c2b  e820fc0c00                      call 0x145cd6850
0000000145c06c30  90                              nop 
0000000145c06c31  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c06c38  48894530                        mov qword ptr [rbp + 0x30], rax
0000000145c06c3c  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c06c43  0f294520                        movaps xmmword ptr [rbp + 0x20], xmm0
0000000145c06c47  4c8bbd80000000                  mov r15, qword ptr [rbp + 0x80]
0000000145c06c4e  498b0f                          mov rcx, qword ptr [r15]
0000000145c06c51  498b5708                        mov rdx, qword ptr [r15 + 8]
0000000145c06c55  48c7858800000000000000          mov qword ptr [rbp + 0x88], 0
0000000145c06c60  48c7859000000001000000          mov qword ptr [rbp + 0x90], 1
0000000145c06c6b  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145c06c76  4885d2                          test rdx, rdx
0000000145c06c79  0f857b050000                    jne 0x145c071fa
0000000145c06c7f  4801ca                          add rdx, rcx
0000000145c06c82  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c06c89  e8c2fb0c00                      call 0x145cd6850
0000000145c06c8e  90                              nop 
0000000145c06c8f  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c06c96  48894510                        mov qword ptr [rbp + 0x10], rax
0000000145c06c9a  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c06ca1  0f294500                        movaps xmmword ptr [rbp], xmm0
0000000145c06ca5  4c89f9                          mov rcx, r15
0000000145c06ca8  e8438feaff                      call 0x145aafbf0
0000000145c06cad  90                              nop 
0000000145c06cae  48c7858800000000000000          mov qword ptr [rbp + 0x88], 0
0000000145c06cb9  48c7859000000001000000          mov qword ptr [rbp + 0x90], 1
0000000145c06cc4  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145c06ccf  4885d2                          test rdx, rdx
0000000145c06cd2  0f8567050000                    jne 0x145c0723f
0000000145c06cd8  4801c2                          add rdx, rax
0000000145c06cdb  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c06ce2  4889c1                          mov rcx, rax
0000000145c06ce5  e866fb0c00                      call 0x145cd6850
0000000145c06cea  90                              nop 
0000000145c06ceb  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c06cf2  488945f0                        mov qword ptr [rbp - 0x10], rax
0000000145c06cf6  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c06cfd  0f2945e0                        movaps xmmword ptr [rbp - 0x20], xmm0
0000000145c06d01  488b8fb8010000                  mov rcx, qword ptr [rdi + 0x1b8]
0000000145c06d08  488b97c0010000                  mov rdx, qword ptr [rdi + 0x1c0]
0000000145c06d0f  48c7858800000000000000          mov qword ptr [rbp + 0x88], 0
0000000145c06d1a  48c7859000000001000000          mov qword ptr [rbp + 0x90], 1
0000000145c06d25  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145c06d30  4885d2                          test rdx, rdx
0000000145c06d33  0f8548050000                    jne 0x145c07281
0000000145c06d39  4801ca                          add rdx, rcx
0000000145c06d3c  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c06d43  e808fb0c00                      call 0x145cd6850
0000000145c06d48  90                              nop 
0000000145c06d49  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c06d50  488945d0                        mov qword ptr [rbp - 0x30], rax
0000000145c06d54  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c06d5b  0f2945c0                        movaps xmmword ptr [rbp - 0x40], xmm0
0000000145c06d5f  0fb6876f030000                  movzx eax, byte ptr [rdi + 0x36f]
0000000145c06d66  8885bf010000                    mov byte ptr [rbp + 0x1bf], al
0000000145c06d6c  4c8bb768080000                  mov r14, qword ptr [rdi + 0x868]
0000000145c06d73  4d89f7                          mov r15, r14
0000000145c06d76  49c1e704                        shl r15, 4
0000000145c06d7a  4c89f0                          mov rax, r14
0000000145c06d7d  48c1e83c                        shr rax, 0x3c
0000000145c06d81  0f95c0                          setne al
0000000145c06d84  48b9f8ffffffffffff7f            movabs rcx, 0x7ffffffffffffff8
0000000145c06d8e  4939cf                          cmp r15, rcx
0000000145c06d91  0f97c1                          seta cl
0000000145c06d94  08c1                            or cl, al
0000000145c06d96  7411                            je 0x145c06da9
0000000145c06d98  4531e4                          xor r12d, r12d
0000000145c06d9b  4c89e1                          mov rcx, r12
0000000145c06d9e  4c89fa                          mov rdx, r15
0000000145c06da1  e8e5425b00                      call 0x1461bb08b
0000000145c06da6  90                              nop 
0000000145c06da7  0f0b                            ud2 
0000000145c06da9  488b9f60080000                  mov rbx, qword ptr [rdi + 0x860]
0000000145c06db0  4d85ff                          test r15, r15
0000000145c06db3  7438                            je 0x145c06ded
0000000145c06db5  e846b43ffa                      call 0x140002200
0000000145c06dba  41bc08000000                    mov r12d, 8
0000000145c06dc0  ba08000000                      mov edx, 8
0000000145c06dc5  4c89f9                          mov rcx, r15
0000000145c06dc8  e8f3b33ffa                      call 0x1400021c0
0000000145c06dcd  4885c0                          test rax, rax
0000000145c06dd0  74c9                            je 0x145c06d9b
0000000145c06dd2  4889c2                          mov rdx, rax
0000000145c06dd5  4c89b5b0010000                  mov qword ptr [rbp + 0x1b0], r14
0000000145c06ddc  4d85f6                          test r14, r14
0000000145c06ddf  488995a0010000                  mov qword ptr [rbp + 0x1a0], rdx
0000000145c06de6  7525                            jne 0x145c06e0d
0000000145c06de8  e9c9000000                      jmp 0x145c06eb6
0000000145c06ded  ba08000000                      mov edx, 8
0000000145c06df2  48c785b001000000000000          mov qword ptr [rbp + 0x1b0], 0
0000000145c06dfd  4d85f6                          test r14, r14
0000000145c06e00  488995a0010000                  mov qword ptr [rbp + 0x1a0], rdx
0000000145c06e07  0f84a9000000                    je 0x145c06eb6
0000000145c06e0d  4983fe01                        cmp r14, 1
0000000145c06e11  7504                            jne 0x145c06e17
0000000145c06e13  31c0                            xor eax, eax
0000000145c06e15  eb75                            jmp 0x145c06e8c
0000000145c06e17  48b9feffffffffffff0f            movabs rcx, 0xffffffffffffffe
0000000145c06e21  4c21f1                          and rcx, r14
0000000145c06e24  4883c218                        add rdx, 0x18
0000000145c06e28  31c0                            xor eax, eax
0000000145c06e2a  4c8d056725ac01                  lea r8, [rip + 0x1ac2567]
0000000145c06e31  4c8d0d9024ac01                  lea r9, [rip + 0x1ac2490]
0000000145c06e38  0f1f840000000000                nop dword ptr [rax + rax]
0000000145c06e40  440fb61403                      movzx r10d, byte ptr [rbx + rax]
0000000145c06e45  41c1e203                        shl r10d, 3
0000000145c06e49  4f8b1c02                        mov r11, qword ptr [r10 + r8]
0000000145c06e4d  4f8b140a                        mov r10, qword ptr [r10 + r9]
0000000145c06e51  4c8952e8                        mov qword ptr [rdx - 0x18], r10
0000000145c06e55  4c895af0                        mov qword ptr [rdx - 0x10], r11
0000000145c06e59  440fb6540301                    movzx r10d, byte ptr [rbx + rax + 1]
0000000145c06e5f  41c1e203                        shl r10d, 3
0000000145c06e63  4f8b1c02                        mov r11, qword ptr [r10 + r8]
0000000145c06e67  4f8b140a                        mov r10, qword ptr [r10 + r9]
0000000145c06e6b  4c8952f8                        mov qword ptr [rdx - 8], r10
0000000145c06e6f  4c891a                          mov qword ptr [rdx], r11
0000000145c06e72  4883c002                        add rax, 2
0000000145c06e76  4883c220                        add rdx, 0x20
0000000145c06e7a  4839c1                          cmp rcx, rax
0000000145c06e7d  75c1                            jne 0x145c06e40
0000000145c06e7f  41f6c601                        test r14b, 1
0000000145c06e83  488b95a0010000                  mov rdx, qword ptr [rbp + 0x1a0]
0000000145c06e8a  742a                            je 0x145c06eb6
0000000145c06e8c  0fb60c03                        movzx ecx, byte ptr [rbx + rax]
0000000145c06e90  c1e103                          shl ecx, 3
0000000145c06e93  4c8d05fe24ac01                  lea r8, [rip + 0x1ac24fe]
0000000145c06e9a  4e8b0c01                        mov r9, qword ptr [rcx + r8]
0000000145c06e9e  4c8d052324ac01                  lea r8, [rip + 0x1ac2423]
0000000145c06ea5  4a8b0c01                        mov rcx, qword ptr [rcx + r8]
0000000145c06ea9  48c1e004                        shl rax, 4
0000000145c06ead  48890c02                        mov qword ptr [rdx + rax], rcx
0000000145c06eb1  4c894c0208                      mov qword ptr [rdx + rax + 8], r9
0000000145c06eb6  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c06ebf  4c8d0d74f7ab01                  lea r9, [rip + 0x1abf774]
0000000145c06ec6  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c06ecd  4d89f0                          mov r8, r14
0000000145c06ed0  e88b76eaff                      call 0x145aae560
0000000145c06ed5  90                              nop 
0000000145c06ed6  488d8ee0000000                  lea rcx, [rsi + 0xe0]
0000000145c06edd  4881c756030000                  add rdi, 0x356
0000000145c06ee4  4881c6c0000000                  add rsi, 0xc0
0000000145c06eeb  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145c06ef2  48898590010000                  mov qword ptr [rbp + 0x190], rax
0000000145c06ef9  0f108588000000                  movups xmm0, xmmword ptr [rbp + 0x88]
0000000145c06f00  0f298580010000                  movaps xmmword ptr [rbp + 0x180], xmm0
0000000145c06f07  488b45b8                        mov rax, qword ptr [rbp - 0x48]
0000000145c06f0b  48898588000000                  mov qword ptr [rbp + 0x88], rax
0000000145c06f12  4c8d05a7b13ffa                  lea r8, [rip - 0x5c04e59]
0000000145c06f19  4c898590000000                  mov qword ptr [rbp + 0x90], r8
0000000145c06f20  488d4560                        lea rax, [rbp + 0x60]
0000000145c06f24  48898598000000                  mov qword ptr [rbp + 0x98], rax
0000000145c06f2b  488d05aeb13ffa                  lea rax, [rip - 0x5c04e52]
0000000145c06f32  488985a0000000                  mov qword ptr [rbp + 0xa0], rax
0000000145c06f39  488d5540                        lea rdx, [rbp + 0x40]
0000000145c06f3d  488995a8000000                  mov qword ptr [rbp + 0xa8], rdx
0000000145c06f44  488985b0000000                  mov qword ptr [rbp + 0xb0], rax
0000000145c06f4b  48898db8000000                  mov qword ptr [rbp + 0xb8], rcx
0000000145c06f52  488d0dc7e93e00                  lea rcx, [rip + 0x3ee9c7]
0000000145c06f59  48898dc0000000                  mov qword ptr [rbp + 0xc0], rcx
0000000145c06f60  488d957c010000                  lea rdx, [rbp + 0x17c]
0000000145c06f67  488995c8000000                  mov qword ptr [rbp + 0xc8], rdx
0000000145c06f6e  48898dd0000000                  mov qword ptr [rbp + 0xd0], rcx
0000000145c06f75  488d4da8                        lea rcx, [rbp - 0x58]
0000000145c06f79  48898dd8000000                  mov qword ptr [rbp + 0xd8], rcx
0000000145c06f80  488d0d89053f00                  lea rcx, [rip + 0x3f0589]
0000000145c06f87  48898de0000000                  mov qword ptr [rbp + 0xe0], rcx
0000000145c06f8e  4c89ade8000000                  mov qword ptr [rbp + 0xe8], r13
0000000145c06f95  4c8985f0000000                  mov qword ptr [rbp + 0xf0], r8
0000000145c06f9c  488d4d20                        lea rcx, [rbp + 0x20]
0000000145c06fa0  48898df8000000                  mov qword ptr [rbp + 0xf8], rcx
0000000145c06fa7  48898500010000                  mov qword ptr [rbp + 0x100], rax
0000000145c06fae  4889e9                          mov rcx, rbp
0000000145c06fb1  48898d08010000                  mov qword ptr [rbp + 0x108], rcx
0000000145c06fb8  48898510010000                  mov qword ptr [rbp + 0x110], rax
0000000145c06fbf  488d4de0                        lea rcx, [rbp - 0x20]
0000000145c06fc3  48898d18010000                  mov qword ptr [rbp + 0x118], rcx
0000000145c06fca  48898520010000                  mov qword ptr [rbp + 0x120], rax
0000000145c06fd1  488d4dc0                        lea rcx, [rbp - 0x40]
0000000145c06fd5  48898d28010000                  mov qword ptr [rbp + 0x128], rcx
0000000145c06fdc  48898530010000                  mov qword ptr [rbp + 0x130], rax
0000000145c06fe3  4889bd38010000                  mov qword ptr [rbp + 0x138], rdi
0000000145c06fea  488d0d5fbf3e00                  lea rcx, [rip + 0x3ebf5f]
0000000145c06ff1  48898d40010000                  mov qword ptr [rbp + 0x140], rcx
0000000145c06ff8  4889b548010000                  mov qword ptr [rbp + 0x148], rsi
0000000145c06fff  488d151af63e00                  lea rdx, [rip + 0x3ef61a]
0000000145c07006  48899550010000                  mov qword ptr [rbp + 0x150], rdx
0000000145c0700d  488d95bf010000                  lea rdx, [rbp + 0x1bf]
0000000145c07014  48899558010000                  mov qword ptr [rbp + 0x158], rdx
0000000145c0701b  48898d60010000                  mov qword ptr [rbp + 0x160], rcx
0000000145c07022  488d8d80010000                  lea rcx, [rbp + 0x180]
0000000145c07029  48898d68010000                  mov qword ptr [rbp + 0x168], rcx
0000000145c07030  48898570010000                  mov qword ptr [rbp + 0x170], rax
0000000145c07037  488d15fdf5ab01                  lea rdx, [rip + 0x1abf5fd]
0000000145c0703e  4c8d8588000000                  lea r8, [rbp + 0x88]
0000000145c07045  488b75b0                        mov rsi, qword ptr [rbp - 0x50]
0000000145c07049  4889f1                          mov rcx, rsi
0000000145c0704c  e81fdb3d00                      call 0x145fe4b70
0000000145c07051  90                              nop 
0000000145c07052  488b9580010000                  mov rdx, qword ptr [rbp + 0x180]
0000000145c07059  4885d2                          test rdx, rdx
0000000145c0705c  7412                            je 0x145c07070
0000000145c0705e  488b8d88010000                  mov rcx, qword ptr [rbp + 0x188]
0000000145c07065  41b801000000                    mov r8d, 1
0000000145c0706b  e860b13ffa                      call 0x1400021d0
0000000145c07070  488b95b0010000                  mov rdx, qword ptr [rbp + 0x1b0]
0000000145c07077  4885d2                          test rdx, rdx
0000000145c0707a  7416                            je 0x145c07092
0000000145c0707c  48c1e204                        shl rdx, 4
0000000145c07080  41b808000000                    mov r8d, 8
0000000145c07086  488b8da0010000                  mov rcx, qword ptr [rbp + 0x1a0]
0000000145c0708d  e83eb13ffa                      call 0x1400021d0
0000000145c07092  488b55c0                        mov rdx, qword ptr [rbp - 0x40]
0000000145c07096  4885d2                          test rdx, rdx
0000000145c07099  740f                            je 0x145c070aa
0000000145c0709b  488b4dc8                        mov rcx, qword ptr [rbp - 0x38]
0000000145c0709f  41b801000000                    mov r8d, 1
0000000145c070a5  e826b13ffa                      call 0x1400021d0
0000000145c070aa  488b55e0                        mov rdx, qword ptr [rbp - 0x20]
0000000145c070ae  4885d2                          test rdx, rdx
0000000145c070b1  740f                            je 0x145c070c2
0000000145c070b3  488b4de8                        mov rcx, qword ptr [rbp - 0x18]
0000000145c070b7  41b801000000                    mov r8d, 1
0000000145c070bd  e80eb13ffa                      call 0x1400021d0
0000000145c070c2  488b5500                        mov rdx, qword ptr [rbp]
0000000145c070c6  4885d2                          test rdx, rdx
0000000145c070c9  740f                            je 0x145c070da
0000000145c070cb  488b4d08                        mov rcx, qword ptr [rbp + 8]
0000000145c070cf  41b801000000                    mov r8d, 1
0000000145c070d5  e8f6b03ffa                      call 0x1400021d0
0000000145c070da  488b5520                        mov rdx, qword ptr [rbp + 0x20]
0000000145c070de  4885d2                          test rdx, rdx
0000000145c070e1  740f                            je 0x145c070f2
0000000145c070e3  488b4d28                        mov rcx, qword ptr [rbp + 0x28]
0000000145c070e7  41b801000000                    mov r8d, 1
0000000145c070ed  e8deb03ffa                      call 0x1400021d0
0000000145c070f2  488b5540                        mov rdx, qword ptr [rbp + 0x40]
0000000145c070f6  4885d2                          test rdx, rdx
0000000145c070f9  740f                            je 0x145c0710a
0000000145c070fb  488b4d48                        mov rcx, qword ptr [rbp + 0x48]
0000000145c070ff  41b801000000                    mov r8d, 1
0000000145c07105  e8c6b03ffa                      call 0x1400021d0
0000000145c0710a  488b5560                        mov rdx, qword ptr [rbp + 0x60]
0000000145c0710e  4885d2                          test rdx, rdx
0000000145c07111  740f                            je 0x145c07122
0000000145c07113  488b4d68                        mov rcx, qword ptr [rbp + 0x68]
0000000145c07117  41b801000000                    mov r8d, 1
0000000145c0711d  e8aeb03ffa                      call 0x1400021d0
0000000145c07122  4889f0                          mov rax, rsi
0000000145c07125  4881c448020000                  add rsp, 0x248
0000000145c0712c  5b                              pop rbx
0000000145c0712d  5f                              pop rdi
0000000145c0712e  5e                              pop rsi
0000000145c0712f  415c                            pop r12
0000000145c07131  415d                            pop r13
0000000145c07133  415e                            pop r14
0000000145c07135  415f                            pop r15
0000000145c07137  5d                              pop rbp
0000000145c07138  c3                              ret 
0000000145c07139  f30f1005cf805b00                movss xmm0, dword ptr [rip + 0x5b80cf]
0000000145c07141  e912faffff                      jmp 0x145c06b58
0000000145c07146  4989d0                          mov r8, rdx
0000000145c07149  49c1e802                        shr r8, 2
0000000145c0714d  89d0                            mov eax, edx
0000000145c0714f  83e003                          and eax, 3
0000000145c07152  4883f801                        cmp rax, 1
0000000145c07156  4983d8ff                        sbb r8, -1
0000000145c0715a  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c07163  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c0716a  41b901000000                    mov r9d, 1
0000000145c07170  4889d3                          mov rbx, rdx
0000000145c07173  31d2                            xor edx, edx
0000000145c07175  e846e64000                      call 0x1460157c0
0000000145c0717a  4889da                          mov rdx, rbx
0000000145c0717d  e94ef8ffff                      jmp 0x145c069d0
0000000145c07182  4989d0                          mov r8, rdx
0000000145c07185  49c1e802                        shr r8, 2
0000000145c07189  89d0                            mov eax, edx
0000000145c0718b  83e003                          and eax, 3
0000000145c0718e  4883f801                        cmp rax, 1
0000000145c07192  4983d8ff                        sbb r8, -1
0000000145c07196  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c0719f  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c071a6  41b901000000                    mov r9d, 1
0000000145c071ac  4889d3                          mov rbx, rdx
0000000145c071af  31d2                            xor edx, edx
0000000145c071b1  e80ae64000                      call 0x1460157c0
0000000145c071b6  4889da                          mov rdx, rbx
0000000145c071b9  e9f1f8ffff                      jmp 0x145c06aaf
0000000145c071be  4989d0                          mov r8, rdx
0000000145c071c1  49c1e802                        shr r8, 2
0000000145c071c5  89d0                            mov eax, edx
0000000145c071c7  83e003                          and eax, 3
0000000145c071ca  4883f801                        cmp rax, 1
0000000145c071ce  4983d8ff                        sbb r8, -1
0000000145c071d2  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c071db  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c071e2  41b901000000                    mov r9d, 1
0000000145c071e8  4889d3                          mov rbx, rdx
0000000145c071eb  31d2                            xor edx, edx
0000000145c071ed  e8cee54000                      call 0x1460157c0
0000000145c071f2  4889da                          mov rdx, rbx
0000000145c071f5  e924faffff                      jmp 0x145c06c1e
0000000145c071fa  4989d0                          mov r8, rdx
0000000145c071fd  49c1e802                        shr r8, 2
0000000145c07201  89d0                            mov eax, edx
0000000145c07203  83e003                          and eax, 3
0000000145c07206  4883f801                        cmp rax, 1
0000000145c0720a  4983d8ff                        sbb r8, -1
0000000145c0720e  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c07217  488d8588000000                  lea rax, [rbp + 0x88]
0000000145c0721e  41b901000000                    mov r9d, 1
0000000145c07224  4889cb                          mov rbx, rcx
0000000145c07227  4889c1                          mov rcx, rax
0000000145c0722a  4989d6                          mov r14, rdx
0000000145c0722d  31d2                            xor edx, edx
0000000145c0722f  e88ce54000                      call 0x1460157c0
0000000145c07234  4c89f2                          mov rdx, r14
0000000145c07237  4889d9                          mov rcx, rbx
0000000145c0723a  e940faffff                      jmp 0x145c06c7f
0000000145c0723f  4989d0                          mov r8, rdx
0000000145c07242  49c1e802                        shr r8, 2
0000000145c07246  89d1                            mov ecx, edx
0000000145c07248  83e103                          and ecx, 3
0000000145c0724b  4883f901                        cmp rcx, 1
0000000145c0724f  4983d8ff                        sbb r8, -1
0000000145c07253  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c0725c  488d8d88000000                  lea rcx, [rbp + 0x88]
0000000145c07263  41b901000000                    mov r9d, 1
0000000145c07269  4889d3                          mov rbx, rdx
0000000145c0726c  31d2                            xor edx, edx
0000000145c0726e  4989c6                          mov r14, rax
0000000145c07271  e84ae54000                      call 0x1460157c0
0000000145c07276  4c89f0                          mov rax, r14
0000000145c07279  4889da                          mov rdx, rbx
0000000145c0727c  e957faffff                      jmp 0x145c06cd8
0000000145c07281  4989d0                          mov r8, rdx
0000000145c07284  49c1e802                        shr r8, 2
0000000145c07288  89d0                            mov eax, edx
0000000145c0728a  83e003                          and eax, 3
0000000145c0728d  4883f801                        cmp rax, 1
0000000145c07291  4983d8ff                        sbb r8, -1
0000000145c07295  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c0729e  488d8588000000                  lea rax, [rbp + 0x88]
0000000145c072a5  41b901000000                    mov r9d, 1
0000000145c072ab  4889cb                          mov rbx, rcx
0000000145c072ae  4889c1                          mov rcx, rax
0000000145c072b1  4989d6                          mov r14, rdx
0000000145c072b4  31d2                            xor edx, edx
0000000145c072b6  e805e54000                      call 0x1460157c0
0000000145c072bb  4c89f2                          mov rdx, r14
0000000145c072be  4889d9                          mov rcx, rbx
0000000145c072c1  e973faffff                      jmp 0x145c06d39
