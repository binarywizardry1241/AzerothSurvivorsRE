; 0.120.2 sha256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
; Exact original bytes, Capstone 5.0.7; static observations, no target execution.
0000000145c05590 55                             push rbp
0000000145c05591 56                             push rsi
0000000145c05592 57                             push rdi
0000000145c05593 53                             push rbx
0000000145c05594 4883ec38                       sub rsp, 0x38
0000000145c05598 488d6c2430                     lea rbp, [rsp + 0x30]
0000000145c0559d 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c055a5 488b19                         mov rbx, qword ptr [rcx]
0000000145c055a8 b201                           mov dl, 1
0000000145c055aa 31c0                           xor eax, eax
0000000145c055ac f00fb05310                     lock cmpxchg byte ptr [rbx + 0x10], dl
0000000145c055b1 0f85ad000000                   jne 0x145c05664
0000000145c055b7 488b35baf59202                 mov rsi, qword ptr [rip + 0x292f5ba]
0000000145c055be 488b06                         mov rax, qword ptr [rsi]
0000000145c055c1 48d1e0                         shl rax, 1
0000000145c055c4 4885c0                         test rax, rax
0000000145c055c7 0f85ae000000                   jne 0x145c0567b
0000000145c055cd 31d2                           xor edx, edx
0000000145c055cf 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145c055d3 80790801                       cmp byte ptr [rcx + 8], 1
0000000145c055d7 7509                           jne 0x145c055e2
0000000145c055d9 80bbf901000000                 cmp byte ptr [rbx + 0x1f9], 0
0000000145c055e0 742c                           je 0x145c0560e
0000000145c055e2 31c0                           xor eax, eax
0000000145c055e4 84d2                           test dl, dl
0000000145c055e6 750f                           jne 0x145c055f7
0000000145c055e8 488b0e                         mov rcx, qword ptr [rsi]
0000000145c055eb 48d1e1                         shl rcx, 1
0000000145c055ee 4885c9                         test rcx, rcx
0000000145c055f1 0f85bc000000                   jne 0x145c056b3
0000000145c055f7 31c9                           xor ecx, ecx
0000000145c055f9 864b10                         xchg byte ptr [rbx + 0x10], cl
0000000145c055fc 80f902                         cmp cl, 2
0000000145c055ff 0f8499000000                   je 0x145c0569e
0000000145c05605 4883c438                       add rsp, 0x38
0000000145c05609 5b                             pop rbx
0000000145c0560a 5f                             pop rdi
0000000145c0560b 5e                             pop rsi
0000000145c0560c 5d                             pop rbp
0000000145c0560d c3                             ret
0000000145c0560e 48837b78ff                     cmp qword ptr [rbx + 0x78], -1
0000000145c05613 740f                           je 0x145c05624
0000000145c05615 0fb68341010000                 movzx eax, byte ptr [rbx + 0x141]
0000000145c0561c fec0                           inc al
0000000145c0561e 3c02                           cmp al, 2
0000000145c05620 7426                           je 0x145c05648
0000000145c05622 eb2b                           jmp 0x145c0564f
0000000145c05624 8955fc                         mov dword ptr [rbp - 4], edx
0000000145c05627 488b8b80010000                 mov rcx, qword ptr [rbx + 0x180]
0000000145c0562e 48895df0                       mov qword ptr [rbp - 0x10], rbx
0000000145c05632 488b8388010000                 mov rax, qword ptr [rbx + 0x188]
0000000145c05639 ff5028                         call qword ptr [rax + 0x28]
0000000145c0563c 90                             nop
0000000145c0563d 488b5df0                       mov rbx, qword ptr [rbp - 0x10]
0000000145c05641 8b55fc                         mov edx, dword ptr [rbp - 4]
0000000145c05644 3c02                           cmp al, 2
0000000145c05646 7507                           jne 0x145c0564f
0000000145c05648 48837b7000                     cmp qword ptr [rbx + 0x70], 0
0000000145c0564d 7493                           je 0x145c055e2
0000000145c0564f b001                           mov al, 1
0000000145c05651 80bbf801000000                 cmp byte ptr [rbx + 0x1f8], 0
0000000145c05658 758a                           jne 0x145c055e4
0000000145c0565a 48837b7000                     cmp qword ptr [rbx + 0x70], 0
0000000145c0565f 0f95c0                         setne al
0000000145c05662 eb80                           jmp 0x145c055e4
0000000145c05664 488d4310                       lea rax, [rbx + 0x10]
0000000145c05668 4889ce                         mov rsi, rcx
0000000145c0566b 4889c1                         mov rcx, rax
0000000145c0566e e8ddb05400                     call 0x146150750
0000000145c05673 4889f1                         mov rcx, rsi
0000000145c05676 e93cffffff                     jmp 0x145c055b7
0000000145c0567b 4889cf                         mov rdi, rcx
0000000145c0567e e85dbe5400                     call 0x1461514e0
0000000145c05683 4889f9                         mov rcx, rdi
0000000145c05686 89c2                           mov edx, eax
0000000145c05688 80f201                         xor dl, 1
0000000145c0568b 0fb64311                       movzx eax, byte ptr [rbx + 0x11]
0000000145c0568f 80790801                       cmp byte ptr [rcx + 8], 1
0000000145c05693 0f8440ffffff                   je 0x145c055d9
0000000145c05699 e944ffffff                     jmp 0x145c055e2
0000000145c0569e 4883c310                       add rbx, 0x10
0000000145c056a2 4889d9                         mov rcx, rbx
0000000145c056a5 89c6                           mov esi, eax
0000000145c056a7 e864b15400                     call 0x146150810
0000000145c056ac 89f0                           mov eax, esi
0000000145c056ae e952ffffff                     jmp 0x145c05605
0000000145c056b3 89c6                           mov esi, eax
0000000145c056b5 e826be5400                     call 0x1461514e0
0000000145c056ba 89c1                           mov ecx, eax
0000000145c056bc 89f0                           mov eax, esi
0000000145c056be 84c9                           test cl, cl
0000000145c056c0 0f8531ffffff                   jne 0x145c055f7
0000000145c056c6 c6431101                       mov byte ptr [rbx + 0x11], 1
0000000145c056ca e928ffffff                     jmp 0x145c055f7
