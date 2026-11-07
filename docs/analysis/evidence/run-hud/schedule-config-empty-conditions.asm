144e1fd19 488b45f0 mov rax, qword ptr [rbp - 0x10]
144e1fd1d 48894660 mov qword ptr [rsi + 0x60], rax
144e1fd21 488b45e8 mov rax, qword ptr [rbp - 0x18]
144e1fd25 48894668 mov qword ptr [rsi + 0x68], rax
144e1fd29 4c893e mov qword ptr [rsi], r15
144e1fd2c 48895e08 mov qword ptr [rsi + 8], rbx
144e1fd30 4c897e10 mov qword ptr [rsi + 0x10], r15
144e1fd34 48c7461800000000 mov qword ptr [rsi + 0x18], 0
144e1fd3c 48c7462008000000 mov qword ptr [rsi + 0x20], 8
144e1fd44 48c7462800000000 mov qword ptr [rsi + 0x28], 0
144e1fd4c 48b80000000000000080 movabs rax, 0x8000000000000000
144e1fd56 48894630 mov qword ptr [rsi + 0x30], rax
144e1fd5a 48c7464800000000 mov qword ptr [rsi + 0x48], 0
144e1fd62 48c7465008000000 mov qword ptr [rsi + 0x50], 8
144e1fd6a 48c7465800000000 mov qword ptr [rsi + 0x58], 0
