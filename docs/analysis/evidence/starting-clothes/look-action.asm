; Current0.117.0 [0x1402492d8,0x140249328) SHA-256 fd5a728b4a47c514cbfaa702fa222e24a36e3424e6807e2915655fbb1b02dd75
1402492d8  803900                   cmp byte ptr [rcx], 0
1402492db  0f85e8fcffff             jne 0x140248fc9
1402492e1  48898548020000           mov qword ptr [rbp + 0x248], rax
1402492e8  4c899560020000           mov qword ptr [rbp + 0x260], r10
1402492ef  450fb64138               movzx r8d, byte ptr [r9 + 0x38]
1402492f4  450fb64939               movzx r9d, byte ptr [r9 + 0x39]
1402492f9  488d4da8                 lea rcx, [rbp - 0x58]
1402492fd  488b95a8010000           mov rdx, qword ptr [rbp + 0x1a8]
140249304  e897248805               call 0x145acb7a0
140249309  8b06                     mov eax, dword ptr [rsi]
14024930b  89c1                     mov ecx, eax
14024930d  83e902                   sub ecx, 2
140249310  ba08000000               mov edx, 8
140249315  0f42ca                   cmovb ecx, edx
140249318  488d15912df505           lea rdx, [rip + 0x5f52d91]
14024931f  48630c8a                 movsxd rcx, dword ptr [rdx + rcx*4]
140249323  4801d1                   add rcx, rdx
140249326  ffe1                     jmp rcx
; Current0.117.0 [0x1402498ba,0x140249934) SHA-256 43e9d8f02d2eb01b76d05df9283a771f70c218235d2350651b03a77264067fdd
1402498ba  4c89bd70020000           mov qword ptr [rbp + 0x270], r15
1402498c1  0fb64e08                 movzx ecx, byte ptr [rsi + 8]
1402498c5  4883f913                 cmp rcx, 0x13
1402498c9  0f83a8000000             jae 0x140249977
1402498cf  8b5604                   mov edx, dword ptr [rsi + 4]
1402498d2  8944cda8                 mov dword ptr [rbp + rcx*8 - 0x58], eax
1402498d6  8954cdac                 mov dword ptr [rbp + rcx*8 - 0x54], edx
1402498da  488b8578010000           mov rax, qword ptr [rbp + 0x178]
1402498e1  8b8d8c010000             mov ecx, dword ptr [rbp + 0x18c]
1402498e7  8908                     mov dword ptr [rax], ecx
1402498e9  41b8e8000000             mov r8d, 0xe8
1402498ef  4c8dbd90000000           lea r15, [rbp + 0x90]
1402498f6  4c89f9                   mov rcx, r15
1402498f9  488d75a8                 lea rsi, [rbp - 0x58]
1402498fd  4889f2                   mov rdx, rsi
140249900  e8d6a3d405               call 0x145f93cdb
140249905  488b8da8010000           mov rcx, qword ptr [rbp + 0x1a8]
14024990c  4c89fa                   mov rdx, r15
14024990f  e80c988705               call 0x145ac3120
140249914  41b8e8000000             mov r8d, 0xe8
14024991a  4c89f9                   mov rcx, r15
14024991d  4889f2                   mov rdx, rsi
140249920  e8b6a3d405               call 0x145f93cdb
140249925  488b8df8010000           mov rcx, qword ptr [rbp + 0x1f8]
14024992c  4c89fa                   mov rdx, r15
14024992f  e8acece3ff               call 0x1400885e0
