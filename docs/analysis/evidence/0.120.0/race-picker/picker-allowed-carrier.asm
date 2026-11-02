00000001402fdd55  4088bd0c080000         mov byte ptr [rbp + 0x80c], dil
00000001402fdd5c  4488bd0d080000         mov byte ptr [rbp + 0x80d], r15b
00000001402fdd63  c6850e08000002         mov byte ptr [rbp + 0x80e], 2
00000001402fdd6a  488b8510040000         mov rax, qword ptr [rbp + 0x410]
00000001402fdd71  48898580050000         mov qword ptr [rbp + 0x580], rax
00000001402fdd78  c685270b000001         mov byte ptr [rbp + 0xb27], 1
00000001402fdd7f  488b8d18040000         mov rcx, qword ptr [rbp + 0x418]
00000001402fdd86  e8f5c7cd04             call 0x144fda580
00000001402fdd8b  90                     nop
