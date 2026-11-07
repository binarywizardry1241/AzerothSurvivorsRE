0000000145b445f0  4157                   push r15
0000000145b445f2  4156                   push r14
0000000145b445f4  4155                   push r13
0000000145b445f6  4154                   push r12
0000000145b445f8  56                     push rsi
0000000145b445f9  57                     push rdi
0000000145b445fa  53                     push rbx
0000000145b445fb  4881ec20010000         sub rsp, 0x120
0000000145b44602  4c89c7                 mov rdi, r8
0000000145b44605  4889d3                 mov rbx, rdx
0000000145b44608  4889ce                 mov rsi, rcx
0000000145b4460b  4889542420             mov qword ptr [rsp + 0x20], rdx
0000000145b44610  4c89442428             mov qword ptr [rsp + 0x28], r8
0000000145b44615  4c8d25c482a901         lea r12, [rip + 0x1a982c4]
0000000145b4461c  41bd0c000000           mov r13d, 0xc
0000000145b44622  ba0c000000             mov edx, 0xc
0000000145b44627  4c89e1                 mov rcx, r12
0000000145b4462a  e88154feff             call 0x145b29ab0
0000000145b4462f  4989c6                 mov r14, rax
0000000145b44632  4989d7                 mov r15, rdx
0000000145b44635  4885c0                 test rax, rax
0000000145b44638  4d0f44f4               cmove r14, r12
0000000145b4463c  4d0f44fd               cmove r15, r13
0000000145b44640  4c8d25c1f77701         lea r12, [rip + 0x177f7c1]
0000000145b44647  41bd0f000000           mov r13d, 0xf
0000000145b4464d  ba0f000000             mov edx, 0xf
0000000145b44652  4c89e1                 mov rcx, r12
0000000145b44655  e85654feff             call 0x145b29ab0
0000000145b4465a  4885c0                 test rax, rax
0000000145b4465d  490f44c4               cmove rax, r12
0000000145b44661  490f44d5               cmove rdx, r13
0000000145b44665  488d0dc44ca901         lea rcx, [rip + 0x1a94cc4]
0000000145b4466c  48894c2438             mov qword ptr [rsp + 0x38], rcx
0000000145b44671  488d0dd052a901         lea rcx, [rip + 0x1a952d0]
0000000145b44678  48894c2440             mov qword ptr [rsp + 0x40], rcx
0000000145b4467d  488d4c2420             lea rcx, [rsp + 0x20]
0000000145b44682  48894c2448             mov qword ptr [rsp + 0x48], rcx
0000000145b44687  48894c2450             mov qword ptr [rsp + 0x50], rcx
0000000145b4468c  48c744245800000000     mov qword ptr [rsp + 0x58], 0
0000000145b44695  48c744246002000000     mov qword ptr [rsp + 0x60], 2
0000000145b4469e  4c8d05cb3aa901         lea r8, [rip + 0x1a93acb]
0000000145b446a5  4c89442468             mov qword ptr [rsp + 0x68], r8
0000000145b446aa  48c744247009000000     mov qword ptr [rsp + 0x70], 9
0000000145b446b3  4c89742478             mov qword ptr [rsp + 0x78], r14
0000000145b446b8  4c89bc2480000000       mov qword ptr [rsp + 0x80], r15
0000000145b446c0  4c8d052582a901         lea r8, [rip + 0x1a98225]
0000000145b446c7  4c89842488000000       mov qword ptr [rsp + 0x88], r8
0000000145b446cf  48c78424900000001a000000 mov qword ptr [rsp + 0x90], 0x1a
0000000145b446db  4c8d05ea3aa901         lea r8, [rip + 0x1a93aea]
0000000145b446e2  4c89842498000000       mov qword ptr [rsp + 0x98], r8
0000000145b446ea  48c78424a00000000d000000 mov qword ptr [rsp + 0xa0], 0xd
0000000145b446f6  48898424a8000000       mov qword ptr [rsp + 0xa8], rax
0000000145b446fe  48899424b0000000       mov qword ptr [rsp + 0xb0], rdx
0000000145b44706  488d05cc3aa901         lea rax, [rip + 0x1a93acc]
0000000145b4470d  48898424b8000000       mov qword ptr [rsp + 0xb8], rax
0000000145b44715  48c78424c000000019000000 mov qword ptr [rsp + 0xc0], 0x19
0000000145b44721  488d05a868a901         lea rax, [rip + 0x1a968a8]
0000000145b44728  48898424c8000000       mov qword ptr [rsp + 0xc8], rax
0000000145b44730  488d05d96da901         lea rax, [rip + 0x1a96dd9]
0000000145b44737  48898424d0000000       mov qword ptr [rsp + 0xd0], rax
0000000145b4473f  48899c24d8000000       mov qword ptr [rsp + 0xd8], rbx
0000000145b44747  4889bc24e0000000       mov qword ptr [rsp + 0xe0], rdi
0000000145b4474f  488d050a7ea901         lea rax, [rip + 0x1a97e0a]
0000000145b44756  48898424e8000000       mov qword ptr [rsp + 0xe8], rax
0000000145b4475e  488d057b81a901         lea rax, [rip + 0x1a9817b]
0000000145b44765  48898424f0000000       mov qword ptr [rsp + 0xf0], rax
0000000145b4476d  48898c24f8000000       mov qword ptr [rsp + 0xf8], rcx
0000000145b44775  48c744243001000000     mov qword ptr [rsp + 0x30], 1
0000000145b4477e  488d055372a901         lea rax, [rip + 0x1a97253]
0000000145b44785  4889842400010000       mov qword ptr [rsp + 0x100], rax
0000000145b4478d  488d05047ca901         lea rax, [rip + 0x1a97c04]
0000000145b44794  4889842408010000       mov qword ptr [rsp + 0x108], rax
0000000145b4479c  48899c2410010000       mov qword ptr [rsp + 0x110], rbx
0000000145b447a4  4889bc2418010000       mov qword ptr [rsp + 0x118], rdi
0000000145b447ac  488d542430             lea rdx, [rsp + 0x30]
0000000145b447b1  4889f1                 mov rcx, rsi
0000000145b447b4  e857670e00             call 0x145c2af10
0000000145b447b9  4889f0                 mov rax, rsi
0000000145b447bc  4881c420010000         add rsp, 0x120
0000000145b447c3  5b                     pop rbx
0000000145b447c4  5f                     pop rdi
0000000145b447c5  5e                     pop rsi
0000000145b447c6  415c                   pop r12
0000000145b447c8  415d                   pop r13
0000000145b447ca  415e                   pop r14
0000000145b447cc  415f                   pop r15
0000000145b447ce  c3                     ret
