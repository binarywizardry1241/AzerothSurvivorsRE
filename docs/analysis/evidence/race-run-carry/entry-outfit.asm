0000000145af7160  4156                   push r14
0000000145af7162  56                     push rsi
0000000145af7163  57                     push rdi
0000000145af7164  55                     push rbp
0000000145af7165  53                     push rbx
0000000145af7166  4881ec90000000         sub rsp, 0x90
0000000145af716d  4c89cf                 mov rdi, r9
0000000145af7170  89d3                   mov ebx, edx
0000000145af7172  4889ce                 mov rsi, rcx
0000000145af7175  4c8bb424e0000000       mov r14, qword ptr [rsp + 0xe0]
0000000145af717d  e84ef7ffff             call 0x145af68d0
0000000145af7182  80c3fe                 add bl, 0xfe
0000000145af7185  80fb07                 cmp bl, 7
0000000145af7188  0f92c0                 setb al
0000000145af718b  b259                   mov dl, 0x59
0000000145af718d  89d9                   mov ecx, ebx
0000000145af718f  d2ea                   shr dl, cl
0000000145af7191  20c2                   and dl, al
0000000145af7193  80fa01                 cmp dl, 1
0000000145af7196  0f850d010000           jne 0x145af72a9
0000000145af719c  31c0                   xor eax, eax
0000000145af719e  b9cdcccccc             mov ecx, 0xcccccccd
0000000145af71a3  eb1b                   jmp 0x145af71c0
0000000145af71a5  66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145af71b0  891486                 mov dword ptr [rsi + rax*4], edx
0000000145af71b3  48ffc0                 inc rax
0000000145af71b6  4883f813               cmp rax, 0x13
0000000145af71ba  0f84bf020000           je 0x145af747f
0000000145af71c0  8b1487                 mov edx, dword ptr [rdi + rax*4]
0000000145af71c3  85d2                   test edx, edx
0000000145af71c5  7464                   je 0x145af722b
0000000145af71c7  81faa0860100           cmp edx, 0x186a0
0000000145af71cd  7259                   jb 0x145af7228
0000000145af71cf  448d826079feff         lea r8d, [rdx - 0x186a0]
0000000145af71d6  4181f8df2e0000         cmp r8d, 0x2edf
0000000145af71dd  7749                   ja 0x145af7228
0000000145af71df  4d89c1                 mov r9, r8
0000000145af71e2  4c0fafc9               imul r9, rcx
0000000145af71e6  49c1e923               shr r9, 0x23
0000000145af71ea  4501c9                 add r9d, r9d
0000000145af71ed  478d0c89               lea r9d, [r9 + r9*4]
0000000145af71f1  4589c2                 mov r10d, r8d
0000000145af71f4  4529ca                 sub r10d, r9d
0000000145af71f7  752f                   jne 0x145af7228
0000000145af71f9  4569c0cdcc0000         imul r8d, r8d, 0xcccd
0000000145af7200  41c1e813               shr r8d, 0x13
0000000145af7204  4569c0cdccffff         imul r8d, r8d, 0xffffcccd
0000000145af720b  41ffc8                 dec r8d
0000000145af720e  6641d1c8               ror r8w, 1
0000000145af7212  450fb7c0               movzx r8d, r8w
0000000145af7216  448d4a0a               lea r9d, [rdx + 0xa]
0000000145af721a  4181f89a190000         cmp r8d, 0x199a
0000000145af7221  440f43ca               cmovae r9d, edx
0000000145af7225  4489ca                 mov edx, r9d
0000000145af7228  891486                 mov dword ptr [rsi + rax*4], edx
0000000145af722b  41833cc601             cmp dword ptr [r14 + rax*8], 1
0000000145af7230  7581                   jne 0x145af71b3
0000000145af7232  418b54c604             mov edx, dword ptr [r14 + rax*8 + 4]
0000000145af7237  81faa0860100           cmp edx, 0x186a0
0000000145af723d  0f826dffffff           jb 0x145af71b0
0000000145af7243  448d826079feff         lea r8d, [rdx - 0x186a0]
0000000145af724a  4181f8df2e0000         cmp r8d, 0x2edf
0000000145af7251  0f8759ffffff           ja 0x145af71b0
0000000145af7257  4d89c1                 mov r9, r8
0000000145af725a  4c0fafc9               imul r9, rcx
0000000145af725e  49c1e923               shr r9, 0x23
0000000145af7262  4501c9                 add r9d, r9d
0000000145af7265  478d0c89               lea r9d, [r9 + r9*4]
0000000145af7269  4589c2                 mov r10d, r8d
0000000145af726c  4529ca                 sub r10d, r9d
0000000145af726f  0f853bffffff           jne 0x145af71b0
0000000145af7275  4569c0cdcc0000         imul r8d, r8d, 0xcccd
0000000145af727c  41c1e813               shr r8d, 0x13
0000000145af7280  4569c0cdccffff         imul r8d, r8d, 0xffffcccd
0000000145af7287  41ffc8                 dec r8d
0000000145af728a  6641d1c8               ror r8w, 1
0000000145af728e  450fb7c0               movzx r8d, r8w
0000000145af7292  448d4a0a               lea r9d, [rdx + 0xa]
0000000145af7296  4181f89a190000         cmp r8d, 0x199a
0000000145af729d  440f43ca               cmovae r9d, edx
0000000145af72a1  4489ca                 mov edx, r9d
0000000145af72a4  e907ffffff             jmp 0x145af71b0
0000000145af72a9  8b07                   mov eax, dword ptr [rdi]
0000000145af72ab  85c0                   test eax, eax
0000000145af72ad  7402                   je 0x145af72b1
0000000145af72af  8906                   mov dword ptr [rsi], eax
0000000145af72b1  41833e01               cmp dword ptr [r14], 1
0000000145af72b5  7506                   jne 0x145af72bd
0000000145af72b7  418b4604               mov eax, dword ptr [r14 + 4]
0000000145af72bb  8906                   mov dword ptr [rsi], eax
0000000145af72bd  8b4704                 mov eax, dword ptr [rdi + 4]
0000000145af72c0  85c0                   test eax, eax
0000000145af72c2  7403                   je 0x145af72c7
0000000145af72c4  894604                 mov dword ptr [rsi + 4], eax
0000000145af72c7  41837e0801             cmp dword ptr [r14 + 8], 1
0000000145af72cc  7507                   jne 0x145af72d5
0000000145af72ce  418b460c               mov eax, dword ptr [r14 + 0xc]
0000000145af72d2  894604                 mov dword ptr [rsi + 4], eax
0000000145af72d5  8b4708                 mov eax, dword ptr [rdi + 8]
0000000145af72d8  85c0                   test eax, eax
0000000145af72da  7403                   je 0x145af72df
0000000145af72dc  894608                 mov dword ptr [rsi + 8], eax
0000000145af72df  41837e1001             cmp dword ptr [r14 + 0x10], 1
0000000145af72e4  7507                   jne 0x145af72ed
0000000145af72e6  418b4614               mov eax, dword ptr [r14 + 0x14]
0000000145af72ea  894608                 mov dword ptr [rsi + 8], eax
0000000145af72ed  8b470c                 mov eax, dword ptr [rdi + 0xc]
0000000145af72f0  85c0                   test eax, eax
0000000145af72f2  7403                   je 0x145af72f7
0000000145af72f4  89460c                 mov dword ptr [rsi + 0xc], eax
0000000145af72f7  41837e1801             cmp dword ptr [r14 + 0x18], 1
0000000145af72fc  7507                   jne 0x145af7305
0000000145af72fe  418b461c               mov eax, dword ptr [r14 + 0x1c]
0000000145af7302  89460c                 mov dword ptr [rsi + 0xc], eax
0000000145af7305  8b4710                 mov eax, dword ptr [rdi + 0x10]
0000000145af7308  85c0                   test eax, eax
0000000145af730a  7403                   je 0x145af730f
0000000145af730c  894610                 mov dword ptr [rsi + 0x10], eax
0000000145af730f  41837e2001             cmp dword ptr [r14 + 0x20], 1
0000000145af7314  7507                   jne 0x145af731d
0000000145af7316  418b4624               mov eax, dword ptr [r14 + 0x24]
0000000145af731a  894610                 mov dword ptr [rsi + 0x10], eax
0000000145af731d  8b4714                 mov eax, dword ptr [rdi + 0x14]
0000000145af7320  85c0                   test eax, eax
0000000145af7322  7403                   je 0x145af7327
0000000145af7324  894614                 mov dword ptr [rsi + 0x14], eax
0000000145af7327  41837e2801             cmp dword ptr [r14 + 0x28], 1
0000000145af732c  7507                   jne 0x145af7335
0000000145af732e  418b462c               mov eax, dword ptr [r14 + 0x2c]
0000000145af7332  894614                 mov dword ptr [rsi + 0x14], eax
0000000145af7335  8b4718                 mov eax, dword ptr [rdi + 0x18]
0000000145af7338  85c0                   test eax, eax
0000000145af733a  7403                   je 0x145af733f
0000000145af733c  894618                 mov dword ptr [rsi + 0x18], eax
0000000145af733f  41837e3001             cmp dword ptr [r14 + 0x30], 1
0000000145af7344  7507                   jne 0x145af734d
0000000145af7346  418b4634               mov eax, dword ptr [r14 + 0x34]
0000000145af734a  894618                 mov dword ptr [rsi + 0x18], eax
0000000145af734d  8b471c                 mov eax, dword ptr [rdi + 0x1c]
0000000145af7350  85c0                   test eax, eax
0000000145af7352  7403                   je 0x145af7357
0000000145af7354  89461c                 mov dword ptr [rsi + 0x1c], eax
0000000145af7357  41837e3801             cmp dword ptr [r14 + 0x38], 1
0000000145af735c  7507                   jne 0x145af7365
0000000145af735e  418b463c               mov eax, dword ptr [r14 + 0x3c]
0000000145af7362  89461c                 mov dword ptr [rsi + 0x1c], eax
0000000145af7365  8b4720                 mov eax, dword ptr [rdi + 0x20]
0000000145af7368  85c0                   test eax, eax
0000000145af736a  7403                   je 0x145af736f
0000000145af736c  894620                 mov dword ptr [rsi + 0x20], eax
0000000145af736f  41837e4001             cmp dword ptr [r14 + 0x40], 1
0000000145af7374  7507                   jne 0x145af737d
0000000145af7376  418b4644               mov eax, dword ptr [r14 + 0x44]
0000000145af737a  894620                 mov dword ptr [rsi + 0x20], eax
0000000145af737d  8b4724                 mov eax, dword ptr [rdi + 0x24]
0000000145af7380  85c0                   test eax, eax
0000000145af7382  7403                   je 0x145af7387
0000000145af7384  894624                 mov dword ptr [rsi + 0x24], eax
0000000145af7387  41837e4801             cmp dword ptr [r14 + 0x48], 1
0000000145af738c  7507                   jne 0x145af7395
0000000145af738e  418b464c               mov eax, dword ptr [r14 + 0x4c]
0000000145af7392  894624                 mov dword ptr [rsi + 0x24], eax
0000000145af7395  8b4728                 mov eax, dword ptr [rdi + 0x28]
0000000145af7398  85c0                   test eax, eax
0000000145af739a  7403                   je 0x145af739f
0000000145af739c  894628                 mov dword ptr [rsi + 0x28], eax
0000000145af739f  41837e5001             cmp dword ptr [r14 + 0x50], 1
0000000145af73a4  7507                   jne 0x145af73ad
0000000145af73a6  418b4654               mov eax, dword ptr [r14 + 0x54]
0000000145af73aa  894628                 mov dword ptr [rsi + 0x28], eax
0000000145af73ad  8b472c                 mov eax, dword ptr [rdi + 0x2c]
0000000145af73b0  85c0                   test eax, eax
0000000145af73b2  7403                   je 0x145af73b7
0000000145af73b4  89462c                 mov dword ptr [rsi + 0x2c], eax
0000000145af73b7  41837e5801             cmp dword ptr [r14 + 0x58], 1
0000000145af73bc  7507                   jne 0x145af73c5
0000000145af73be  418b465c               mov eax, dword ptr [r14 + 0x5c]
0000000145af73c2  89462c                 mov dword ptr [rsi + 0x2c], eax
0000000145af73c5  8b4730                 mov eax, dword ptr [rdi + 0x30]
0000000145af73c8  85c0                   test eax, eax
0000000145af73ca  7403                   je 0x145af73cf
0000000145af73cc  894630                 mov dword ptr [rsi + 0x30], eax
0000000145af73cf  41837e6001             cmp dword ptr [r14 + 0x60], 1
0000000145af73d4  7507                   jne 0x145af73dd
0000000145af73d6  418b4664               mov eax, dword ptr [r14 + 0x64]
0000000145af73da  894630                 mov dword ptr [rsi + 0x30], eax
0000000145af73dd  8b4734                 mov eax, dword ptr [rdi + 0x34]
0000000145af73e0  85c0                   test eax, eax
0000000145af73e2  7403                   je 0x145af73e7
0000000145af73e4  894634                 mov dword ptr [rsi + 0x34], eax
0000000145af73e7  41837e6801             cmp dword ptr [r14 + 0x68], 1
0000000145af73ec  7507                   jne 0x145af73f5
0000000145af73ee  418b466c               mov eax, dword ptr [r14 + 0x6c]
0000000145af73f2  894634                 mov dword ptr [rsi + 0x34], eax
0000000145af73f5  8b4738                 mov eax, dword ptr [rdi + 0x38]
0000000145af73f8  85c0                   test eax, eax
0000000145af73fa  7403                   je 0x145af73ff
0000000145af73fc  894638                 mov dword ptr [rsi + 0x38], eax
0000000145af73ff  41837e7001             cmp dword ptr [r14 + 0x70], 1
0000000145af7404  7507                   jne 0x145af740d
0000000145af7406  418b4674               mov eax, dword ptr [r14 + 0x74]
0000000145af740a  894638                 mov dword ptr [rsi + 0x38], eax
0000000145af740d  8b473c                 mov eax, dword ptr [rdi + 0x3c]
0000000145af7410  85c0                   test eax, eax
0000000145af7412  7403                   je 0x145af7417
0000000145af7414  89463c                 mov dword ptr [rsi + 0x3c], eax
0000000145af7417  41837e7801             cmp dword ptr [r14 + 0x78], 1
0000000145af741c  7507                   jne 0x145af7425
0000000145af741e  418b467c               mov eax, dword ptr [r14 + 0x7c]
0000000145af7422  89463c                 mov dword ptr [rsi + 0x3c], eax
0000000145af7425  8b4740                 mov eax, dword ptr [rdi + 0x40]
0000000145af7428  85c0                   test eax, eax
0000000145af742a  7403                   je 0x145af742f
0000000145af742c  894640                 mov dword ptr [rsi + 0x40], eax
0000000145af742f  4183be8000000001       cmp dword ptr [r14 + 0x80], 1
0000000145af7437  750a                   jne 0x145af7443
0000000145af7439  418b8684000000         mov eax, dword ptr [r14 + 0x84]
0000000145af7440  894640                 mov dword ptr [rsi + 0x40], eax
0000000145af7443  8b4744                 mov eax, dword ptr [rdi + 0x44]
0000000145af7446  85c0                   test eax, eax
0000000145af7448  7403                   je 0x145af744d
0000000145af744a  894644                 mov dword ptr [rsi + 0x44], eax
0000000145af744d  4183be8800000001       cmp dword ptr [r14 + 0x88], 1
0000000145af7455  750a                   jne 0x145af7461
0000000145af7457  418b868c000000         mov eax, dword ptr [r14 + 0x8c]
0000000145af745e  894644                 mov dword ptr [rsi + 0x44], eax
0000000145af7461  8b4748                 mov eax, dword ptr [rdi + 0x48]
0000000145af7464  85c0                   test eax, eax
0000000145af7466  7403                   je 0x145af746b
0000000145af7468  894648                 mov dword ptr [rsi + 0x48], eax
0000000145af746b  4183be9000000001       cmp dword ptr [r14 + 0x90], 1
0000000145af7473  750a                   jne 0x145af747f
0000000145af7475  418b8694000000         mov eax, dword ptr [r14 + 0x94]
0000000145af747c  894648                 mov dword ptr [rsi + 0x48], eax
0000000145af747f  8b563c                 mov edx, dword ptr [rsi + 0x3c]
0000000145af7482  488d4c2420             lea rcx, [rsp + 0x20]
0000000145af7487  e864010000             call 0x145af75f0
0000000145af748c  488b542420             mov rdx, qword ptr [rsp + 0x20]
0000000145af7491  4883faff               cmp rdx, -1
0000000145af7495  744c                   je 0x145af74e3
0000000145af7497  488b7c2438             mov rdi, qword ptr [rsp + 0x38]
0000000145af749c  488b5c2440             mov rbx, qword ptr [rsp + 0x40]
0000000145af74a1  8bac2480000000         mov ebp, dword ptr [rsp + 0x80]
0000000145af74a8  4885d2                 test rdx, rdx
0000000145af74ab  7410                   je 0x145af74bd
0000000145af74ad  488b4c2428             mov rcx, qword ptr [rsp + 0x28]
0000000145af74b2  41b801000000           mov r8d, 1
0000000145af74b8  e813ad50fa             call 0x1400021d0
0000000145af74bd  4885ff                 test rdi, rdi
0000000145af74c0  7415                   je 0x145af74d7
0000000145af74c2  48c1e703               shl rdi, 3
0000000145af74c6  41b804000000           mov r8d, 4
0000000145af74cc  4889d9                 mov rcx, rbx
0000000145af74cf  4889fa                 mov rdx, rdi
0000000145af74d2  e8f9ac50fa             call 0x1400021d0
0000000145af74d7  83fd11                 cmp ebp, 0x11
0000000145af74da  7507                   jne 0x145af74e3
0000000145af74dc  c7464000000000         mov dword ptr [rsi + 0x40], 0
0000000145af74e3  4889f0                 mov rax, rsi
0000000145af74e6  4881c490000000         add rsp, 0x90
0000000145af74ed  5b                     pop rbx
0000000145af74ee  5d                     pop rbp
0000000145af74ef  5f                     pop rdi
0000000145af74f0  5e                     pop rsi
0000000145af74f1  415e                   pop r14
0000000145af74f3  c3                     ret
