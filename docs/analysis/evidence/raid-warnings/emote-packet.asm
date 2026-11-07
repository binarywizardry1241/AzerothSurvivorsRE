1458c1260: 55 push rbp
1458c1261: 4157 push r15
1458c1263: 4156 push r14
1458c1265: 4154 push r12
1458c1267: 56 push rsi
1458c1268: 57 push rdi
1458c1269: 53 push rbx
1458c126a: 4881ec80000000 sub rsp, 0x80
1458c1271: 488dac2480000000 lea rbp, [rsp + 0x80]
1458c1279: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458c1281: 4c89cf mov rdi, r9
1458c1284: 4c89c3 mov rbx, r8
1458c1287: 4989d6 mov r14, rdx
1458c128a: 4889ce mov rsi, rcx
1458c128d: e86e0f74fa call 0x140002200
1458c1292: 41bf20000000 mov r15d, 0x20
1458c1298: b920000000 mov ecx, 0x20
1458c129d: ba01000000 mov edx, 1
1458c12a2: e8190f74fa call 0x1400021c0
1458c12a7: 4885c0 test rax, rax
1458c12aa: 0f8478020000 je 0x1458c1528
1458c12b0: c6005a mov byte ptr [rax], 0x5a
1458c12b3: c7400100000000 mov dword ptr [rax + 1], 0
1458c12ba: 8d4b01 lea ecx, [rbx + 1]
1458c12bd: 894805 mov dword ptr [rax + 5], ecx
1458c12c0: 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
1458c12c8: 488945d8 mov qword ptr [rbp - 0x28], rax
1458c12cc: 48c745e009000000 mov qword ptr [rbp - 0x20], 9
1458c12d4: 66c745e89600 mov word ptr [rbp - 0x18], 0x96
1458c12da: 4883fb18 cmp rbx, 0x18
1458c12de: 0f839a010000 jae 0x1458c147e
1458c12e4: 41bc09000000 mov r12d, 9
1458c12ea: 4885db test rbx, rbx
1458c12ed: 7412 je 0x1458c1301
1458c12ef: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458c12f3: 4c01e1 add rcx, r12
1458c12f6: 4c89f2 mov rdx, r14
1458c12f9: 4989d8 mov r8, rbx
1458c12fc: e8e68d3300 call 0x145bfa0e7
1458c1301: 4901dc add r12, rbx
1458c1304: 4c8965e0 mov qword ptr [rbp - 0x20], r12
1458c1308: 4d39fc cmp r12, r15
1458c130b: 750a jne 0x1458c1317
1458c130d: 488d4dd0 lea rcx, [rbp - 0x30]
1458c1311: e89a7e4d00 call 0x145d991b0
1458c1316: 90 nop
1458c1317: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c131b: 42c6042000 mov byte ptr [rax + r12], 0
1458c1320: 49ffc4 inc r12
1458c1323: 4c8965e0 mov qword ptr [rbp - 0x20], r12
1458c1327: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458c132b: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c132f: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c1333: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c1337: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c133b: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c133f: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c1343: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c1347: 4829d0 sub rax, rdx
1458c134a: 4883f807 cmp rax, 7
1458c134e: 0f8658010000 jbe 0x1458c14ac
1458c1354: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c1358: 48c7041000000000 mov qword ptr [rax + rdx], 0
1458c1360: 4883c208 add rdx, 8
1458c1364: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c1368: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c136c: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c1370: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c1374: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c1378: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c137c: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c1380: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c1384: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c1388: 4829d0 sub rax, rdx
1458c138b: 4883f803 cmp rax, 3
1458c138f: 0f863f010000 jbe 0x1458c14d4
1458c1395: 488b5d60 mov rbx, qword ptr [rbp + 0x60]
1458c1399: 8d4301 lea eax, [rbx + 1]
1458c139c: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458c13a0: 890411 mov dword ptr [rcx + rdx], eax
1458c13a3: 4883c204 add rdx, 4
1458c13a7: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c13ab: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c13af: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c13b3: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c13b7: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c13bb: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c13bf: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c13c3: 4c8b75c0 mov r14, qword ptr [rbp - 0x40]
1458c13c7: 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
1458c13cb: 4c89f8 mov rax, r15
1458c13ce: 4c29f0 sub rax, r14
1458c13d1: 4839c3 cmp rbx, rax
1458c13d4: 0f8722010000 ja 0x1458c14fc
1458c13da: 4885db test rbx, rbx
1458c13dd: 7412 je 0x1458c13f1
1458c13df: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1458c13e3: 4c01f1 add rcx, r14
1458c13e6: 4889fa mov rdx, rdi
1458c13e9: 4989d8 mov r8, rbx
1458c13ec: e8f68c3300 call 0x145bfa0e7
1458c13f1: 4901de add r14, rbx
1458c13f4: 4c8975c0 mov qword ptr [rbp - 0x40], r14
1458c13f8: 4d39fe cmp r14, r15
1458c13fb: 750a jne 0x1458c1407
1458c13fd: 488d4db0 lea rcx, [rbp - 0x50]
1458c1401: e8aa7d4d00 call 0x145d991b0
1458c1406: 90 nop
1458c1407: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c140b: 42c6043000 mov byte ptr [rax + r14], 0
1458c1410: 49ffc6 inc r14
1458c1413: 4c8975c0 mov qword ptr [rbp - 0x40], r14
1458c1417: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c141b: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c141f: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c1423: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c1427: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c142b: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c142f: 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1458c1433: 483b7dd0 cmp rdi, qword ptr [rbp - 0x30]
1458c1437: 750a jne 0x1458c1443
1458c1439: 488d4dd0 lea rcx, [rbp - 0x30]
1458c143d: e86e7d4d00 call 0x145d991b0
1458c1442: 90 nop
1458c1443: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c1447: c6043800 mov byte ptr [rax + rdi], 0
1458c144b: 48ffc7 inc rdi
1458c144e: 48897de0 mov qword ptr [rbp - 0x20], rdi
1458c1452: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c1456: 0f1106 movups xmmword ptr [rsi], xmm0
1458c1459: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c145d: 48894610 mov qword ptr [rsi + 0x10], rax
1458c1461: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c1465: 48894618 mov qword ptr [rsi + 0x18], rax
1458c1469: 4889f0 mov rax, rsi
1458c146c: 4881c480000000 add rsp, 0x80
1458c1473: 5b pop rbx
1458c1474: 5f pop rdi
1458c1475: 5e pop rsi
1458c1476: 415c pop r12
1458c1478: 415e pop r14
1458c147a: 415f pop r15
1458c147c: 5d pop rbp
1458c147d: c3 ret
1458c147e: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1487: 488d4dd0 lea rcx, [rbp - 0x30]
1458c148b: ba09000000 mov edx, 9
1458c1490: 41b901000000 mov r9d, 1
1458c1496: 4989d8 mov r8, rbx
1458c1499: e8d2943300 call 0x145bfa970
1458c149e: 90 nop
1458c149f: 4c8b7dd0 mov r15, qword ptr [rbp - 0x30]
1458c14a3: 4c8b65e0 mov r12, qword ptr [rbp - 0x20]
1458c14a7: e943feffff jmp 0x1458c12ef
1458c14ac: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c14b5: 488d4db0 lea rcx, [rbp - 0x50]
1458c14b9: 41b808000000 mov r8d, 8
1458c14bf: 41b901000000 mov r9d, 1
1458c14c5: e8a6943300 call 0x145bfa970
1458c14ca: 90 nop
1458c14cb: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c14cf: e980feffff jmp 0x1458c1354
1458c14d4: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c14dd: 488d4dd0 lea rcx, [rbp - 0x30]
1458c14e1: 41b804000000 mov r8d, 4
1458c14e7: 41b901000000 mov r9d, 1
1458c14ed: e87e943300 call 0x145bfa970
1458c14f2: 90 nop
1458c14f3: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c14f7: e999feffff jmp 0x1458c1395
1458c14fc: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1505: 488d4db0 lea rcx, [rbp - 0x50]
1458c1509: 41b901000000 mov r9d, 1
1458c150f: 4c89f2 mov rdx, r14
1458c1512: 4989d8 mov r8, rbx
1458c1515: e856943300 call 0x145bfa970
1458c151a: 90 nop
1458c151b: 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
1458c151f: 4c8b75c0 mov r14, qword ptr [rbp - 0x40]
1458c1523: e9b7feffff jmp 0x1458c13df
1458c1528: b901000000 mov ecx, 1
1458c152d: ba20000000 mov edx, 0x20
1458c1532: e8847d4d00 call 0x145d992bb
1458c1537: 0f0b ud2
