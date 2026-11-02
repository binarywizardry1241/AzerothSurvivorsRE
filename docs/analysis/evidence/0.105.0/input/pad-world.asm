0x1400bf8f0: PUSH R15
0x1400bf8f2: PUSH R14
0x1400bf8f4: PUSH R13
0x1400bf8f6: PUSH R12
0x1400bf8f8: PUSH RSI
0x1400bf8f9: PUSH RDI
0x1400bf8fa: PUSH RBP
0x1400bf8fb: PUSH RBX
0x1400bf8fc: SUB RSP, 0x328
0x1400bf903: MOVAPS xmmword ptr [RSP + 0x310], XMM8
0x1400bf90c: MOVAPS xmmword ptr [RSP + 0x300], XMM7
0x1400bf914: MOVAPS xmmword ptr [RSP + 0x2f0], XMM6
0x1400bf91c: MOV RAX, RDX
0x1400bf91f: MOV RDX, qword ptr [RSP + 0x3b8]
0x1400bf927: MOV RCX, qword ptr [RSP + 0x3b0]
0x1400bf92f: MOV R10, qword ptr [RSP + 0x3a8]
0x1400bf937: MOV R11, qword ptr [RSP + 0x3a0]
0x1400bf93f: MOV RSI, qword ptr [RSP + 0x398]
0x1400bf947: MOV RDI, qword ptr [RSP + 0x390]
0x1400bf94f: MOV RBX, qword ptr [RAX + 0x10]
0x1400bf953: MOV qword ptr [RSP + 0x170], RBX
0x1400bf95b: MOVUPS XMM0, xmmword ptr [RAX]
0x1400bf95e: MOVAPS xmmword ptr [RSP + 0x160], XMM0
0x1400bf966: MOVUPS XMM0, xmmword ptr [R8]
0x1400bf96a: MOVUPS XMM1, xmmword ptr [R8 + 0x10]
0x1400bf96f: MOVUPS xmmword ptr [RSP + 0x188], XMM1
0x1400bf977: MOVUPS xmmword ptr [RSP + 0x178], XMM0
0x1400bf97f: MOVUPS XMM0, xmmword ptr [R9]
0x1400bf983: MOVUPS XMM1, xmmword ptr [R9 + 0x10]
0x1400bf988: MOVUPS xmmword ptr [RSP + 0x1a8], XMM1
0x1400bf990: MOVUPS xmmword ptr [RSP + 0x198], XMM0
0x1400bf998: MOVUPS XMM0, xmmword ptr [RDI]
0x1400bf99b: MOVUPS XMM1, xmmword ptr [RDI + 0x10]
0x1400bf99f: MOVUPS xmmword ptr [RSP + 0x1c8], XMM1
0x1400bf9a7: MOVUPS xmmword ptr [RSP + 0x1b8], XMM0
0x1400bf9af: MOVUPS XMM0, xmmword ptr [RSI]
0x1400bf9b2: MOVUPS XMM1, xmmword ptr [RSI + 0x10]
0x1400bf9b6: MOVUPS xmmword ptr [RSP + 0x1e8], XMM1
0x1400bf9be: MOVUPS xmmword ptr [RSP + 0x1d8], XMM0
0x1400bf9c6: MOVUPS XMM0, xmmword ptr [R11]
0x1400bf9ca: MOVUPS XMM1, xmmword ptr [R11 + 0x10]
0x1400bf9cf: MOVUPS xmmword ptr [RSP + 0x1f8], XMM0
0x1400bf9d7: MOVUPS xmmword ptr [RSP + 0x208], XMM1
0x1400bf9df: MOVUPS XMM0, xmmword ptr [R10]
0x1400bf9e3: MOVUPS xmmword ptr [RSP + 0x218], XMM0
0x1400bf9eb: MOV RAX, qword ptr [R10 + 0x10]
0x1400bf9ef: MOV qword ptr [RSP + 0x228], RAX
0x1400bf9f7: MOVUPS XMM0, xmmword ptr [RCX]
0x1400bf9fa: MOVUPS XMM1, xmmword ptr [RCX + 0x10]
0x1400bf9fe: MOVAPS xmmword ptr [RSP + 0x230], XMM0
0x1400bfa06: MOVAPS xmmword ptr [RSP + 0x240], XMM1
0x1400bfa0e: LEA RCX, [RSP + 0x250]
0x1400bfa16: MOV R8D, 0xa0
0x1400bfa1c: CALL 0x145bc977b
0x1400bfa21: MOV RAX, qword ptr [RSP + 0x178]
0x1400bfa29: MOV qword ptr [RSP + 0x40], RAX
0x1400bfa2e: MOV RAX, qword ptr [RSP + 0x230]
0x1400bfa36: MOV qword ptr [RSP + 0x38], RAX
0x1400bfa3b: MOV RAX, qword ptr [RSP + 0x250]
0x1400bfa43: MOV qword ptr [RSP + 0x68], RAX
0x1400bfa48: MOV RAX, qword ptr [RSP + 0x270]
0x1400bfa50: MOV qword ptr [RSP + 0x60], RAX
0x1400bfa55: MOV RAX, qword ptr [RSP + 0x290]
0x1400bfa5d: MOV qword ptr [RSP + 0x58], RAX
0x1400bfa62: MOV RAX, qword ptr [RSP + 0x2b0]
0x1400bfa6a: MOV qword ptr [RSP + 0x50], RAX
0x1400bfa6f: MOV RAX, qword ptr [RSP + 0x2d0]
0x1400bfa77: MOV qword ptr [RSP + 0x48], RAX
0x1400bfa7c: MOV RBX, qword ptr [RSP + 0x160]
0x1400bfa84: MOV RSI, qword ptr [RSP + 0x168]
0x1400bfa8c: MOV RDI, qword ptr [RBX + 0xf8]
0x1400bfa93: MOV RAX, qword ptr [RBX + 0x100]
0x1400bfa9a: LEA R15, [RDI + RAX*0x4]
0x1400bfa9e: CMP byte ptr [RBX + 0x108], 0x0
0x1400bfaa5: JZ 0x1400bfab1
0x1400bfaa7: XOR R14D, R14D
0x1400bfaaa: XOR R12D, R12D
0x1400bfaad: XOR EBP, EBP
0x1400bfaaf: JMP 0x1400bfaea
0x1400bfab1: MOV EBP, 0x8
0x1400bfab6: XOR R13D, R13D
0x1400bfab9: XOR R12D, R12D
0x1400bfabc: XOR R14D, R14D
0x1400bfabf: JMP 0x1400bfb82
0x1400bfac4: XOR R14D, R14D
0x1400bfac7: XOR EBP, EBP
0x1400bfac9: MOV EAX, EBP
0x1400bfacb: INC EBP
0x1400bfacd: MOV RCX, RAX
0x1400bfad0: SHL RCX, 0x7
0x1400bfad4: LEA RCX, [RCX + RAX*0x8]
0x1400bfad8: ADD RCX, R14
0x1400bfadb: XOR EDX, EDX
0x1400bfadd: CALL 0x1445705b0
0x1400bfae2: TEST AL, AL
0x1400bfae4: JNZ 0x1400bfce6
0x1400bfaea: CMP EBP, R12D
0x1400bfaed: JNZ 0x1400bfac9
0x1400bfaef: NOP
0x1400bfaf0: CMP RDI, R15
0x1400bfaf3: JZ 0x1400bfc08
0x1400bfaf9: MOV ECX, dword ptr [RDI]
0x1400bfafb: ADD RDI, 0x4
0x1400bfaff: MOV RAX, qword ptr [RSI + 0x1a8]
0x1400bfb06: LEA RCX, [RCX + RCX*0x8]
0x1400bfb0a: MOV R12, qword ptr [RAX + RCX*0x8 + 0x10]
0x1400bfb0f: TEST R12, R12
0x1400bfb12: JZ 0x1400bfaf0
0x1400bfb14: LEA RAX, [RAX + RCX*0x8]
0x1400bfb18: MOV RCX, qword ptr [RBX + 0x110]
0x1400bfb1f: CMP RCX, qword ptr [RAX + 0x40]
0x1400bfb23: JNC 0x1400bfac4
0x1400bfb25: MOV RDX, qword ptr [RAX + 0x38]
0x1400bfb29: MOV RCX, qword ptr [RDX + RCX*0x8]
0x1400bfb2d: TEST RCX, RCX
0x1400bfb30: JZ 0x1400bfac4
0x1400bfb32: MOV RAX, qword ptr [RAX + 0x18]
0x1400bfb36: NOT RCX
0x1400bfb39: LEA RCX, [RCX + RCX*0x2]
0x1400bfb3d: SHL RCX, 0x4
0x1400bfb41: MOV R14, qword ptr [RAX + RCX*0x1 + 0x10]
0x1400bfb46: JMP 0x1400bfac7
0x1400bfb4b: XOR R13D, R13D
0x1400bfb4e: MOV RBP, qword ptr [RAX + 0x50]
0x1400bfb52: XOR R14D, R14D
0x1400bfb55: MOV EAX, R14D
0x1400bfb58: SHL RAX, 0x4
0x1400bfb5c: INC R14D
0x1400bfb5f: MOV EAX, dword ptr [RBP + RAX*0x1 + 0x8]
0x1400bfb63: NOT EAX
0x1400bfb65: MOV RCX, RAX
0x1400bfb68: SHL RCX, 0x7
0x1400bfb6c: LEA RCX, [RCX + RAX*0x8]
0x1400bfb70: ADD RCX, R13
0x1400bfb73: XOR EDX, EDX
0x1400bfb75: CALL 0x1445705b0
0x1400bfb7a: TEST AL, AL
0x1400bfb7c: JNZ 0x1400bfce6
0x1400bfb82: CMP R14D, R12D
0x1400bfb85: JNZ 0x1400bfb55
0x1400bfb87: NOP word ptr [RAX + RAX*0x1]
0x1400bfb90: CMP RDI, R15
0x1400bfb93: JZ 0x1400bfc08
0x1400bfb95: MOV ECX, dword ptr [RDI]
0x1400bfb97: ADD RDI, 0x4
0x1400bfb9b: MOV RAX, qword ptr [RSI + 0x108]
0x1400bfba2: LEA RCX, [RCX + RCX*0x4]
0x1400bfba6: SHL RCX, 0x5
0x1400bfbaa: MOV R12, qword ptr [RAX + RCX*0x1 + 0x58]
0x1400bfbaf: TEST R12, R12
0x1400bfbb2: JZ 0x1400bfb90
0x1400bfbb4: ADD RAX, RCX
0x1400bfbb7: MOV ECX, dword ptr [RAX + 0x94]
0x1400bfbbd: MOV RDX, qword ptr [RSI + 0x1a8]
0x1400bfbc4: LEA R8, [RCX + RCX*0x8]
0x1400bfbc8: MOV RCX, qword ptr [RBX + 0x110]
0x1400bfbcf: CMP RCX, qword ptr [RDX + R8*0x8 + 0x40]
0x1400bfbd4: JNC 0x1400bfb4b
0x1400bfbda: LEA RDX, [RDX + R8*0x8]
0x1400bfbde: MOV R8, qword ptr [RDX + 0x38]
0x1400bfbe2: MOV RCX, qword ptr [R8 + RCX*0x8]
0x1400bfbe6: TEST RCX, RCX
0x1400bfbe9: JZ 0x1400bfb4b
0x1400bfbef: MOV RDX, qword ptr [RDX + 0x18]
0x1400bfbf3: NOT RCX
0x1400bfbf6: LEA RCX, [RCX + RCX*0x2]
0x1400bfbfa: SHL RCX, 0x4
0x1400bfbfe: MOV R13, qword ptr [RDX + RCX*0x1 + 0x10]
0x1400bfc03: JMP 0x1400bfb4e
0x1400bfc08: XOR R12D, R12D
0x1400bfc0b: MOV RBX, qword ptr [RSP + 0x198]
0x1400bfc13: CMP byte ptr [RBX + 0x4d], 0x0
0x1400bfc17: JZ 0x1400bfcfb
0x1400bfc1d: LEA RCX, [RSP + 0x160]
0x1400bfc25: MOV DL, 0xb
0x1400bfc27: CALL 0x1400b64d0
0x1400bfc2c: TEST AL, AL
0x1400bfc2e: JZ 0x1400bfc4c
0x1400bfc30: MOV EAX, dword ptr [RSP + 0x1f4]
0x1400bfc37: MOV RCX, qword ptr [RSP + 0x1e8]
0x1400bfc3f: MOV dword ptr [RCX], EAX
0x1400bfc41: MOV RAX, qword ptr [RSP + 0x1d8]
0x1400bfc49: MOV byte ptr [RAX], 0x1
0x1400bfc4c: MOV R15D, dword ptr [RSP + 0x1d4]
0x1400bfc54: MOV RDI, qword ptr [RSP + 0x1c8]
0x1400bfc5c: MOV dword ptr [RDI], R15D
0x1400bfc5f: MOV RSI, qword ptr [RSP + 0x1b8]
0x1400bfc67: MOV byte ptr [RSI + 0x14], 0x1
0x1400bfc6b: MOV RAX, qword ptr [RSP + 0x68]
0x1400bfc70: CMP byte ptr [RAX + 0xe8], 0x1
0x1400bfc77: JNZ 0x1400bfcc2
0x1400bfc79: MOV RCX, qword ptr [RSP + 0x60]
0x1400bfc7e: CMP byte ptr [RCX], 0x0
0x1400bfc81: JNZ 0x1400bfcc2
0x1400bfc83: MOV RCX, qword ptr [RSP + 0x58]
0x1400bfc88: CMP byte ptr [RCX + 0xd], 0x0
0x1400bfc8c: JNZ 0x1400bfcc2
0x1400bfc8e: MOV RCX, qword ptr [RSP + 0x50]
0x1400bfc93: CMP byte ptr [RCX], 0x0
0x1400bfc96: JNZ 0x1400bfcc2
0x1400bfc98: MOV RCX, qword ptr [RSP + 0x48]
0x1400bfc9d: CMP byte ptr [RCX + 0x72], 0x0
0x1400bfca1: JNZ 0x1400bfcc2
0x1400bfca3: CMP byte ptr [RAX + 0xea], 0x0
0x1400bfcaa: JNZ 0x1400bfcc2
0x1400bfcac: CMP byte ptr [RAX + 0x80], 0xff
0x1400bfcb3: JNZ 0x1400bfcc2
0x1400bfcb5: CMP byte ptr [RAX + 0xa0], 0xff
0x1400bfcbc: JZ 0x1400bfd5a
0x1400bfcc2: MOV dword ptr [RSI], 0x0
0x1400bfcc8: MOV dword ptr [RDI], R15D
0x1400bfccb: MOV byte ptr [RSI + 0x15], 0x0
0x1400bfccf: MOV EAX, dword ptr [RSP + 0x1b4]
0x1400bfcd6: MOV RCX, qword ptr [RSP + 0x1a8]
0x1400bfcde: MOV dword ptr [RCX], EAX
0x1400bfce0: OR byte ptr [RBX + 0x4f], R12B
0x1400bfce4: JMP 0x1400bfd2d
0x1400bfce6: MOV R12B, 0x1
0x1400bfce9: MOV RBX, qword ptr [RSP + 0x198]
0x1400bfcf1: CMP byte ptr [RBX + 0x4d], 0x0
0x1400bfcf5: JNZ 0x1400bfc1d
0x1400bfcfb: MOV EAX, dword ptr [RSP + 0x1d4]
0x1400bfd02: MOV RCX, qword ptr [RSP + 0x1c8]
0x1400bfd0a: MOV dword ptr [RCX], EAX
0x1400bfd0c: MOV RAX, qword ptr [RSP + 0x1b8]
0x1400bfd14: MOV byte ptr [RAX + 0x15], 0x0
0x1400bfd18: MOV EAX, dword ptr [RSP + 0x1b4]
0x1400bfd1f: MOV RCX, qword ptr [RSP + 0x1a8]
0x1400bfd27: MOV dword ptr [RCX], EAX
0x1400bfd29: MOV byte ptr [RBX + 0x4f], R12B
0x1400bfd2d: MOVAPS XMM6, xmmword ptr [RSP + 0x2f0]
0x1400bfd35: MOVAPS XMM7, xmmword ptr [RSP + 0x300]
0x1400bfd3d: MOVAPS XMM8, xmmword ptr [RSP + 0x310]
0x1400bfd46: ADD RSP, 0x328
0x1400bfd4d: POP RBX
0x1400bfd4e: POP RBP
0x1400bfd4f: POP RDI
0x1400bfd50: POP RSI
0x1400bfd51: POP R12
0x1400bfd53: POP R13
0x1400bfd55: POP R14
0x1400bfd57: POP R15
0x1400bfd59: RET
0x1400bfd5a: MOV EBP, dword ptr [RSP + 0x1b4]
0x1400bfd61: MOV R14, qword ptr [RSP + 0x1a8]
0x1400bfd69: MOV dword ptr [R14], EBP
0x1400bfd6c: MOVZX EAX, byte ptr [RBX + 0x4f]
0x1400bfd70: AND AL, R12B
0x1400bfd73: MOV ECX, EAX
0x1400bfd75: AND CL, 0x1
0x1400bfd78: MOV byte ptr [RBX + 0x4f], CL
0x1400bfd7b: XOR AL, 0x1
0x1400bfd7d: AND AL, R12B
0x1400bfd80: MOV dword ptr [RDI], R15D
0x1400bfd83: MOV byte ptr [RSI + 0x15], AL
0x1400bfd86: MOVSS XMM2, dword ptr [RBX + 0x8]
0x1400bfd8b: LEA RCX, [RSP + 0x28]
0x1400bfd90: LEA RDX, [RSP + 0x160]
0x1400bfd98: CALL 0x1400b7900
0x1400bfd9d: MOV RAX, qword ptr [RSP + 0x40]
0x1400bfda2: MOVSS XMM7, dword ptr [RAX + 0x58]
0x1400bfda7: MOVSS XMM0, dword ptr [RSP + 0x28]
0x1400bfdad: MOVSS XMM1, dword ptr [RSP + 0x2c]
0x1400bfdb3: XORPS XMM2, XMM2
0x1400bfdb6: UCOMISS XMM0, XMM2
0x1400bfdb9: JNZ 0x1400bfdc8
0x1400bfdbb: JP 0x1400bfdc8
0x1400bfdbd: UCOMISS XMM1, XMM2
0x1400bfdc0: JNZ 0x1400bfdc8
0x1400bfdc2: JP 0x1400bfdc8
0x1400bfdc4: XOR EAX, EAX
0x1400bfdc6: JMP 0x1400bfdd2
0x1400bfdc8: CALL 0x145bc97ab
0x1400bfdcd: MOV EAX, 0x1
0x1400bfdd2: MOV dword ptr [RDI], R15D
0x1400bfdd5: MOV dword ptr [RSI], EAX
0x1400bfdd7: MOVSS dword ptr [RSI + 0x4], XMM0
0x1400bfddc: MOVSS XMM1, dword ptr [RSP + 0x30]
0x1400bfde2: MOVAPS XMM0, xmmword ptr [0x145d6d7e0]
0x1400bfde9: CMP byte ptr [RBX + 0xc], 0x0
0x1400bfded: JZ 0x1400bfdf2
0x1400bfdef: XORPS XMM1, XMM0
0x1400bfdf2: MULSS XMM1, dword ptr [0x145d9ae98]
0x1400bfdfa: MULSS XMM1, dword ptr [RBX]
0x1400bfdfe: MULSS XMM1, XMM7
0x1400bfe02: MOV dword ptr [RDI], R15D
0x1400bfe05: ADDSS XMM1, dword ptr [RSI + 0x8]
0x1400bfe0a: MOVSS dword ptr [RSI + 0x8], XMM1
0x1400bfe0f: MOVSS XMM1, dword ptr [RSP + 0x34]
0x1400bfe15: CMP byte ptr [RBX + 0xd], 0x0
0x1400bfe19: JZ 0x1400bfe1e
0x1400bfe1b: XORPS XMM1, XMM0
0x1400bfe1e: MULSS XMM1, dword ptr [0x145d9ae9c]
0x1400bfe26: MULSS XMM1, dword ptr [RBX]
0x1400bfe2a: MULSS XMM1, XMM7
0x1400bfe2e: MOV dword ptr [RDI], R15D
0x1400bfe31: ADDSS XMM1, dword ptr [RSI + 0xc]
0x1400bfe36: MOVSS dword ptr [RSI + 0xc], XMM1
0x1400bfe3b: LEA R12, [RSP + 0x160]
0x1400bfe43: MOV RCX, R12
0x1400bfe46: MOV DL, 0x8
0x1400bfe48: CALL 0x1400b7520
0x1400bfe4d: MOVAPS XMM6, XMM0
0x1400bfe50: MOV RCX, R12
0x1400bfe53: MOV DL, 0x9
0x1400bfe55: CALL 0x1400b7520
0x1400bfe5a: MOVAPS XMM1, XMM6
0x1400bfe5d: MAXSS XMM1, XMM0
0x1400bfe61: MOVAPS XMM8, XMM1
0x1400bfe65: CMPUNORDSS XMM8, XMM1,
0x1400bfe6b: MOVAPS XMM0, XMM8
0x1400bfe6f: ANDNPS XMM0, XMM1
0x1400bfe72: ANDPS XMM8, XMM6
0x1400bfe76: ORPS XMM8, XMM0
0x1400bfe7a: MOV RCX, R12
0x1400bfe7d: MOV DL, 0x6
0x1400bfe7f: CALL 0x1400b7520
0x1400bfe84: MOVAPS XMM6, XMM0
0x1400bfe87: MOV RCX, R12
0x1400bfe8a: MOV DL, 0x7
0x1400bfe8c: CALL 0x1400b7520
0x1400bfe91: MOVAPS XMM1, XMM6
0x1400bfe94: MAXSS XMM1, XMM0
0x1400bfe98: MOVAPS XMM0, XMM1
0x1400bfe9b: CMPUNORDSS XMM0, XMM1,
0x1400bfea0: MOVAPS XMM2, XMM0
0x1400bfea3: ANDNPS XMM2, XMM1
0x1400bfea6: ANDPS XMM0, XMM6
0x1400bfea9: ORPS XMM0, XMM2
0x1400bfeac: SUBSS XMM8, XMM0
0x1400bfeb1: MULSS XMM8, dword ptr [0x145d9aea0]
0x1400bfeba: MULSS XMM8, dword ptr [RBX + 0x4]
0x1400bfec0: MULSS XMM8, XMM7
0x1400bfec5: MOV dword ptr [RDI], R15D
0x1400bfec8: ADDSS XMM8, dword ptr [RSI + 0x10]
0x1400bfece: MOVSS dword ptr [RSI + 0x10], XMM8
0x1400bfed4: MOV RCX, R12
0x1400bfed7: MOV DL, 0x2
0x1400bfed9: CALL 0x1400b64d0
0x1400bfede: TEST AL, AL
0x1400bfee0: JZ 0x1400bfef9
0x1400bfee2: MOV dword ptr [RSP + 0x70], 0x16
0x1400bfeea: LEA RDX, [RSP + 0x70]
0x1400bfeef: MOV RCX, qword ptr [RSP + 0x38]
0x1400bfef4: CALL 0x14003eb80
0x1400bfef9: LEA RCX, [RSP + 0x160]
0x1400bff01: MOV DL, 0xa
0x1400bff03: CALL 0x1400b64d0
0x1400bff08: TEST AL, AL
0x1400bff0a: JZ 0x1400bfd2d
0x1400bff10: MOVUPS XMM0, xmmword ptr [RSP + 0x218]
0x1400bff18: MOVAPS xmmword ptr [RSP + 0x70], XMM0
0x1400bff1d: MOV RAX, qword ptr [RSP + 0x228]
0x1400bff25: MOV qword ptr [RSP + 0x80], RAX
0x1400bff2d: LEA RCX, [RSP + 0x70]
0x1400bff32: CALL 0x1400b46e0
0x1400bff37: TEST EAX, EAX
0x1400bff39: JZ 0x1400bfd2d
0x1400bff3f: MOV word ptr [RSP + 0x86], 0x0
0x1400bff49: MOV dword ptr [RSP + 0x82], 0x0
0x1400bff54: MOV dword ptr [RSP + 0x9a], 0x0
0x1400bff5f: MOV word ptr [RSP + 0x9e], 0x0
0x1400bff69: MOV dword ptr [RSP + 0xb8], 0x16
0x1400bff74: MOV dword ptr [RSP + 0x78], 0x0
0x1400bff7c: MOV word ptr [RSP + 0x80], 0x6301
0x1400bff86: MOV word ptr [RSP + 0xc4], 0x0
0x1400bff90: XORPS XMM6, XMM6
0x1400bff93: MOVUPS xmmword ptr [RSP + 0x88], XMM6
0x1400bff9b: MOV word ptr [RSP + 0x98], 0x6301
0x1400bffa5: MOVUPS xmmword ptr [RSP + 0xa0], XMM6
0x1400bffad: MOV qword ptr [RSP + 0xb0], RAX
0x1400bffb5: MOV EDI, dword ptr [RSP + 0x214]
0x1400bffbc: MOV R15, qword ptr [RSP + 0x208]
0x1400bffc4: MOV dword ptr [R15], EDI
0x1400bffc7: MOV R12, qword ptr [RSP + 0x1f8]
0x1400bffcf: MOV RCX, qword ptr [R12 + 0x40]
0x1400bffd4: MOV qword ptr [RSP + 0x70], RCX
0x1400bffd9: LEA RSI, [R12 + 0x20]
0x1400bffde: LEA RDX, [RSP + 0x70]
0x1400bffe3: MOV RCX, RSI
0x1400bffe6: MOV R13, RAX
0x1400bffe9: CALL 0x14003e840
0x1400bffee: INC qword ptr [R12 + 0x40]
0x1400bfff3: MOV word ptr [RSP + 0x86], 0x0
0x1400bfffd: MOV dword ptr [RSP + 0x82], 0x0
0x1400c0008: MOV dword ptr [R15], EDI
0x1400c000b: MOV RAX, qword ptr [R12 + 0x40]
0x1400c0010: MOV qword ptr [RSP + 0x70], RAX
0x1400c0015: MOV dword ptr [RSP + 0x78], 0x0
0x1400c001d: MOV word ptr [RSP + 0x80], 0x6301
0x1400c0027: MOVUPS xmmword ptr [RSP + 0x88], XMM6
0x1400c002f: MOV byte ptr [RSP + 0x98], 0xff
0x1400c0037: MOV qword ptr [RSP + 0xb0], R13
0x1400c003f: MOV dword ptr [RSP + 0xb8], 0x16
0x1400c004a: MOV word ptr [RSP + 0xc4], 0x1
0x1400c0054: LEA RDX, [RSP + 0x70]
0x1400c0059: MOV RCX, RSI
0x1400c005c: CALL 0x14003e840
0x1400c0061: INC qword ptr [R12 + 0x40]
0x1400c0066: MOV dword ptr [R14], EBP
0x1400c0069: MOV byte ptr [RBX + 0x4e], 0x1
0x1400c006d: JMP 0x1400bfd2d
