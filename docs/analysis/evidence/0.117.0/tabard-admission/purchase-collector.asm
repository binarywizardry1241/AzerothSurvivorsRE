; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145c34400, 0x145c34546); bytes SHA-256 623b705b6bad591e975f0a7c7608b86e324a41f45dfb38cf2085d7aa61618ff1
; Current EXE bytes decoded with Capstone 5.0.7; no process execution.
0000000145c34400: 55                       push rbp
0000000145c34401: 4157                     push r15
0000000145c34403: 4156                     push r14
0000000145c34405: 4154                     push r12
0000000145c34407: 56                       push rsi
0000000145c34408: 57                       push rdi
0000000145c34409: 53                       push rbx
0000000145c3440a: 4881ec20010000           sub rsp, 0x120
0000000145c34411: 488dac2480000000         lea rbp, [rsp + 0x80]
0000000145c34419: 48c78598000000feffffff   mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
0000000145c34424: 4989d6                   mov r14, rdx
0000000145c34427: 4889ce                   mov rsi, rcx
0000000145c3442a: 4889d1                   mov rcx, rdx
0000000145c3442d: e86e3e0000               call 0x145c382a0
0000000145c34432: 83f801                   cmp eax, 1
0000000145c34435: 0f85b7000000             jne 0x145c344f2
0000000145c3443b: 89d7                     mov edi, edx
0000000145c3443d: e8bedd3cfa               call 0x140002200
0000000145c34442: b910000000               mov ecx, 0x10
0000000145c34447: ba04000000               mov edx, 4
0000000145c3444c: e86fdd3cfa               call 0x1400021c0
0000000145c34451: 4885c0                   test rax, rax
0000000145c34454: 0f84db000000             je 0x145c34535
0000000145c3445a: 4889c3                   mov rbx, rax
0000000145c3445d: 8938                     mov dword ptr [rax], edi
0000000145c3445f: 48c7858000000004000000   mov qword ptr [rbp + 0x80], 4
0000000145c3446a: 48898588000000           mov qword ptr [rbp + 0x88], rax
0000000145c34471: 48c7859000000001000000   mov qword ptr [rbp + 0x90], 1
0000000145c3447c: 488d7da8                 lea rdi, [rbp - 0x58]
0000000145c34480: 41b8d8000000             mov r8d, 0xd8
0000000145c34486: 4889f9                   mov rcx, rdi
0000000145c34489: 4c89f2                   mov rdx, r14
0000000145c3448c: e84af83500               call 0x145f93cdb
0000000145c34491: 41be01000000             mov r14d, 1
0000000145c34497: 4c8dbd80000000           lea r15, [rbp + 0x80]
0000000145c3449e: eb0e                     jmp 0x145c344ae
0000000145c344a0: 468924b3                 mov dword ptr [rbx + r14*4], r12d
0000000145c344a4: 49ffc6                   inc r14
0000000145c344a7: 4c89b590000000           mov qword ptr [rbp + 0x90], r14
0000000145c344ae: 4889f9                   mov rcx, rdi
0000000145c344b1: e8ea3d0000               call 0x145c382a0
0000000145c344b6: 90                       nop
0000000145c344b7: 83f801                   cmp eax, 1
0000000145c344ba: 754f                     jne 0x145c3450b
0000000145c344bc: 4189d4                   mov r12d, edx
0000000145c344bf: 4c3bb580000000           cmp r14, qword ptr [rbp + 0x80]
0000000145c344c6: 75d8                     jne 0x145c344a0
0000000145c344c8: 48c744242004000000       mov qword ptr [rsp + 0x20], 4
0000000145c344d1: 41b801000000             mov r8d, 1
0000000145c344d7: 41b904000000             mov r9d, 4
0000000145c344dd: 4c89f9                   mov rcx, r15
0000000145c344e0: 4c89f2                   mov rdx, r14
0000000145c344e3: e808fc3500               call 0x145f940f0
0000000145c344e8: 90                       nop
0000000145c344e9: 488b9d88000000           mov rbx, qword ptr [rbp + 0x88]
0000000145c344f0: ebae                     jmp 0x145c344a0
0000000145c344f2: 48c70600000000           mov qword ptr [rsi], 0
0000000145c344f9: 48c7460804000000         mov qword ptr [rsi + 8], 4
0000000145c34501: 48c7461000000000         mov qword ptr [rsi + 0x10], 0
0000000145c34509: eb15                     jmp 0x145c34520
0000000145c3450b: 488b8590000000           mov rax, qword ptr [rbp + 0x90]
0000000145c34512: 48894610                 mov qword ptr [rsi + 0x10], rax
0000000145c34516: 0f108580000000           movups xmm0, xmmword ptr [rbp + 0x80]
0000000145c3451d: 0f1106                   movups xmmword ptr [rsi], xmm0
0000000145c34520: 4889f0                   mov rax, rsi
0000000145c34523: 4881c420010000           add rsp, 0x120
0000000145c3452a: 5b                       pop rbx
0000000145c3452b: 5f                       pop rdi
0000000145c3452c: 5e                       pop rsi
0000000145c3452d: 415c                     pop r12
0000000145c3452f: 415e                     pop r14
0000000145c34531: 415f                     pop r15
0000000145c34533: 5d                       pop rbp
0000000145c34534: c3                       ret
0000000145c34535: b904000000               mov ecx, 4
0000000145c3453a: ba10000000               mov edx, 0x10
0000000145c3453f: e877675000               call 0x14613acbb
0000000145c34544: 0f0b                     ud2
