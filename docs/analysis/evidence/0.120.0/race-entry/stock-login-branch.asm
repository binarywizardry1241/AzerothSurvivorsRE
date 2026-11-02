0000000145b1396e  83f801                 cmp eax, 1
0000000145b13971  4c89ad882d0000         mov qword ptr [rbp + 0x2d88], r13
0000000145b13978  0f870c010000           ja 0x145b13a8a
0000000145b1397e  488b9ea80f0000         mov rbx, qword ptr [rsi + 0xfa8]
0000000145b13985  4885db                 test rbx, rbx
0000000145b13988  0f84fc000000           je 0x145b13a8a
0000000145b1398e  488bbeb00f0000         mov rdi, qword ptr [rsi + 0xfb0]
0000000145b13995  c686d10f000001         mov byte ptr [rsi + 0xfd1], 1
