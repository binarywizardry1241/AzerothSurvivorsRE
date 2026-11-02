0x1400c13fa: MOVSS XMM0, dword ptr [R13 + 0x5c]
0x1400c1400: MOV R9, qword ptr [RBP + 0x360]
0x1400c1407: CMP byte ptr [R9 + 0x34], 0x0
0x1400c140c: JZ 0x1400c144c
0x1400c140e: CMP dword ptr [R9 + 0x38], ESI
0x1400c1412: JNZ 0x1400c144c
0x1400c1414: CMP dword ptr [R9 + 0x3c], EDX
0x1400c1418: JNZ 0x1400c144c
0x1400c141a: UCOMISS XMM0, dword ptr [R9 + 0x20]
0x1400c141f: JC 0x1400c16f0
0x1400c1425: MOV RAX, qword ptr [RBP + 0x358]
0x1400c142c: MOV R8D, dword ptr [RBP + 0x370]
0x1400c1433: MOV dword ptr [RAX], R8D
0x1400c1436: ADDSS XMM0, dword ptr [0x145d9aec8]
0x1400c143e: MOV RAX, qword ptr [RBP + 0x360]
0x1400c1445: MOVSS dword ptr [RAX + 0x20], XMM0
0x1400c144a: JMP 0x1400c147b
0x1400c144c: MOV dword ptr [R9 + 0x34], 0x1
0x1400c1454: MOV dword ptr [R9 + 0x38], ESI
0x1400c1458: MOV dword ptr [R9 + 0x3c], EDX
0x1400c145c: MOV RAX, qword ptr [RBP + 0x358]
0x1400c1463: MOV R8D, dword ptr [RBP + 0x370]
0x1400c146a: MOV dword ptr [RAX], R8D
0x1400c146d: ADDSS XMM0, dword ptr [0x145d9aec4]
0x1400c1475: MOVSS dword ptr [R9 + 0x20], XMM0
