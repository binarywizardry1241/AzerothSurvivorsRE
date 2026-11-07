0x1458a92f0: 55 push rbp
0x1458a92f1: 56 push rsi
0x1458a92f2: 57 push rdi
0x1458a92f3: 4883ec30 sub rsp, 0x30
0x1458a92f7: 488d6c2430 lea rbp, [rsp + 0x30]
0x1458a92fc: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1458a9304: 4889ce mov rsi, rcx
0x1458a9307: e8f48e75fa call 0x140002200
0x1458a930c: b904000000 mov ecx, 4
0x1458a9311: ba01000000 mov edx, 1
0x1458a9316: e8a58e75fa call 0x1400021c0
0x1458a931b: 4885c0 test rax, rax
0x1458a931e: 0f848a000000 je 0x1458a93ae
0x1458a9324: 4889c7 mov rdi, rax
0x1458a9327: c7004865726f mov dword ptr [rax], 0x6f726548
0x1458a932d: e8ce8e75fa call 0x140002200
0x1458a9332: b906000000 mov ecx, 6
0x1458a9337: ba01000000 mov edx, 1
0x1458a933c: e87f8e75fa call 0x1400021c0
0x1458a9341: 4885c0 test rax, rax
0x1458a9344: 7479 je 0x1458a93bf
0x1458a9346: 0fb70d6f933201 movzx ecx, word ptr [rip + 0x132936f]
0x1458a934d: 66894804 mov word ptr [rax + 4], cx
0x1458a9351: 8b0d61933201 mov ecx, dword ptr [rip + 0x1329361]
0x1458a9357: 8908 mov dword ptr [rax], ecx
0x1458a9359: c7463b00000000 mov dword ptr [rsi + 0x3b], 0
0x1458a9360: c6463f00 mov byte ptr [rsi + 0x3f], 0
0x1458a9364: 66c746380101 mov word ptr [rsi + 0x38], 0x101
0x1458a936a: c6463a00 mov byte ptr [rsi + 0x3a], 0
0x1458a936e: 48c70604000000 mov qword ptr [rsi], 4
0x1458a9375: 48897e08 mov qword ptr [rsi + 8], rdi
0x1458a9379: 48c7461004000000 mov qword ptr [rsi + 0x10], 4
0x1458a9381: 48c7461806000000 mov qword ptr [rsi + 0x18], 6
0x1458a9389: 48894620 mov qword ptr [rsi + 0x20], rax
0x1458a938d: 48c7462806000000 mov qword ptr [rsi + 0x28], 6
0x1458a9395: 48b86400640064006400 movabs rax, 0x64006400640064
0x1458a939f: 48894630 mov qword ptr [rsi + 0x30], rax
0x1458a93a3: 4889f0 mov rax, rsi
0x1458a93a6: 4883c430 add rsp, 0x30
0x1458a93aa: 5f pop rdi
0x1458a93ab: 5e pop rsi
0x1458a93ac: 5d pop rbp
0x1458a93ad: c3 ret
0x1458a93ae: b901000000 mov ecx, 1
0x1458a93b3: ba04000000 mov edx, 4
0x1458a93b8: e8fefe4e00 call 0x145d992bb
0x1458a93bd: 0f0b ud2
0x1458a93bf: 48897df0 mov qword ptr [rbp - 0x10], rdi
0x1458a93c3: b901000000 mov ecx, 1
0x1458a93c8: ba06000000 mov edx, 6
0x1458a93cd: e8e9fe4e00 call 0x145d992bb
0x1458a93d2: 90 nop
0x1458a93d3: 0f0b ud2
