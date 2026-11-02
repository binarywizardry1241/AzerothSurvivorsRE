145af9030 55 push rbp
145af9031 56 push rsi
145af9032 57 push rdi
145af9033 53 push rbx
145af9034 4881ec88010000 sub rsp, 0x188
145af903b 488dac2480000000 lea rbp, [rsp + 0x80]
145af9043 48c78500010000feffffff mov qword ptr [rbp + 0x100], 0xfffffffffffffffe
145af904e 4889ce mov rsi, rcx
145af9051 488d4da0 lea rcx, [rbp - 0x60]
145af9055 4889f2 mov rdx, rsi
145af9058 e813d80100 call 0x145b16870
145af905d 48837da0ff cmp qword ptr [rbp - 0x60], -1
145af9062 0f848f000000 je 0x145af90f7
145af9068 488d5d40 lea rbx, [rbp + 0x40]
145af906c 488d55a0 lea rdx, [rbp - 0x60]
145af9070 41b8a0000000 mov r8d, 0xa0
145af9076 4889d9 mov rcx, rbx
145af9079 e85dac4900 call 0x145f93cdb
145af907e 488dbe20100000 lea rdi, [rsi + 0x1020]
145af9085 488d8de0000000 lea rcx, [rbp + 0xe0]
145af908c 4889fa mov rdx, rdi
145af908f 4989d8 mov r8, rbx
145af9092 e879fd0400 call 0x145b48e10
145af9097 90 nop
145af9098 4883bdf000000000 cmp qword ptr [rbp + 0xf0], 0
145af90a0 7429 je 0x145af90cb
145af90a2 c685ff00000001 mov byte ptr [rbp + 0xff], 1
145af90a9 4889f9 mov rcx, rdi
145af90ac e82f13fdff call 0x145aca3e0
145af90b1 90 nop
145af90b2 c685ff00000000 mov byte ptr [rbp + 0xff], 0
145af90b9 488d95e0000000 lea rdx, [rbp + 0xe0]
145af90c0 4889f1 mov rcx, rsi
145af90c3 e8c8ab0100 call 0x145b13c90
145af90c8 90 nop
145af90c9 eb22 jmp 0x145af90ed
145af90cb 488b95e0000000 mov rdx, qword ptr [rbp + 0xe0]
145af90d2 4885d2 test rdx, rdx
145af90d5 7416 je 0x145af90ed
145af90d7 488b8de8000000 mov rcx, qword ptr [rbp + 0xe8]
145af90de 48c1e203 shl rdx, 3
145af90e2 41b808000000 mov r8d, 8
145af90e8 e8e39050fa call 0x1400021d0
145af90ed 488d4d40 lea rcx, [rbp + 0x40]
145af90f1 e83ac2ffff call 0x145af5330
145af90f6 90 nop
145af90f7 4881c488010000 add rsp, 0x188
145af90fe 5b pop rbx
145af90ff 5f pop rdi
145af9100 5e pop rsi
145af9101 5d pop rbp
145af9102 c3 ret
