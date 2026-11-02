0x14583ed80: add rdx, -3
0x14583ed84: cmp rdx, 9
0x14583ed88: ja 0x14583efe0
0x14583ed8e: lea rax, [rip + 0x17cd11f]
0x14583ed95: movsxd rdx, dword ptr [rax + rdx*4]
0x14583ed99: add rdx, rax
0x14583ed9c: jmp rdx
0x14583ed9e: movzx eax, word ptr [rcx]
0x14583eda1: xor eax, 0x776f
0x14583eda6: movzx ecx, byte ptr [rcx + 2]
0x14583edaa: xor ecx, 0x6c
0x14583edad: or cx, ax
0x14583edb0: jne 0x14583efe0
0x14583edb6: lea rax, [rip + 0x148e743]
0x14583edbd: ret
0x14583edbe: mov eax, 0x6163616d
0x14583edc3: xor eax, dword ptr [rcx]
0x14583edc5: movzx edx, byte ptr [rcx + 4]
0x14583edc9: xor edx, 0x77
0x14583edcc: or edx, eax
0x14583edce: je 0x14583efe3
0x14583edd4: mov eax, 0x6c656877
0x14583edd9: xor eax, dword ptr [rcx]
0x14583eddb: movzx edx, byte ptr [rcx + 4]
0x14583eddf: xor edx, 0x70
0x14583ede2: or edx, eax
0x14583ede4: je 0x14583f013
0x14583edea: mov eax, 0x63616f72
0x14583edef: xor eax, dword ptr [rcx]
0x14583edf1: movzx edx, byte ptr [rcx + 4]
0x14583edf5: xor edx, 0x68
0x14583edf8: or edx, eax
0x14583edfa: je 0x14583f03b
0x14583ee00: mov eax, 0x646e6170
0x14583ee05: xor eax, dword ptr [rcx]
0x14583ee07: movzx ecx, byte ptr [rcx + 4]
0x14583ee0b: xor ecx, 0x61
0x14583ee0e: or ecx, eax
0x14583ee10: jne 0x14583efe0
0x14583ee16: lea rax, [rip + 0x148e9e3]
0x14583ee1d: ret
0x14583ee1e: movabs rax, 0x6c65727269757173
0x14583ee28: cmp qword ptr [rcx], rax
0x14583ee2b: je 0x14583efeb
0x14583ee31: movabs rax, 0x676e696c6772657a
0x14583ee3b: cmp qword ptr [rcx], rax
0x14583ee3e: je 0x14583f01b
0x14583ee44: movabs rax, 0x64696e6f6b617264
0x14583ee4e: cmp qword ptr [rcx], rax
0x14583ee51: je 0x14583f043
0x14583ee57: movabs rax, 0x7365686374697473
0x14583ee61: cmp qword ptr [rcx], rax
0x14583ee64: jne 0x14583efe0
0x14583ee6a: lea rax, [rip + 0x148eb6f]
0x14583ee71: ret
0x14583ee72: cmp dword ptr [rcx], 0x676f7266
0x14583ee78: je 0x14583eff3
0x14583ee7e: cmp dword ptr [rcx], 0x6572676f
0x14583ee84: jne 0x14583efe0
0x14583ee8a: lea rax, [rip + 0x148ec6f]
0x14583ee91: ret
0x14583ee92: movabs rax, 0x6b616e73676e696b
0x14583ee9c: xor rax, qword ptr [rcx]
0x14583ee9f: movzx edx, byte ptr [rcx + 8]
0x14583eea3: xor rdx, 0x65
0x14583eea7: or rdx, rax
0x14583eeaa: je 0x14583effb
0x14583eeb0: movabs rax, 0x6f72696870706173
0x14583eeba: xor rax, qword ptr [rcx]
0x14583eebd: movzx edx, byte ptr [rcx + 8]
0x14583eec1: xor rdx, 0x6e
0x14583eec5: or rdx, rax
0x14583eec8: je 0x14583f023
0x14583eece: movabs rax, 0x726175676d6f6f64
0x14583eed8: xor rax, qword ptr [rcx]
0x14583eedb: movzx edx, byte ptr [rcx + 8]
0x14583eedf: xor rdx, 0x64
0x14583eee3: or rdx, rax
0x14583eee6: je 0x14583f04b
0x14583eeec: movabs rax, 0x7561736c69766564
0x14583eef6: xor rax, qword ptr [rcx]
0x14583eef9: movzx ecx, byte ptr [rcx + 8]
0x14583eefd: xor rcx, 0x72
0x14583ef01: or rcx, rax
0x14583ef04: jne 0x14583efe0
0x14583ef0a: lea rax, [rip + 0x148eb8f]
0x14583ef11: ret
0x14583ef12: movabs rax, 0x68775f6572757a61
0x14583ef1c: xor rax, qword ptr [rcx]
0x14583ef1f: movabs rdx, 0x706c6568775f6572
0x14583ef29: xor rdx, qword ptr [rcx + 3]
0x14583ef2d: or rdx, rax
0x14583ef30: jne 0x14583efe0
0x14583ef36: lea rax, [rip + 0x148ec83]
0x14583ef3d: ret
0x14583ef3e: mov eax, 0x62626172
0x14583ef43: xor eax, dword ptr [rcx]
0x14583ef45: movzx edx, word ptr [rcx + 4]
0x14583ef49: xor edx, 0x7469
0x14583ef4f: or edx, eax
0x14583ef51: je 0x14583f003
0x14583ef57: mov eax, 0x74726164
0x14583ef5c: xor eax, dword ptr [rcx]
0x14583ef5e: movzx edx, word ptr [rcx + 4]
0x14583ef62: xor edx, 0x7265
0x14583ef68: or edx, eax
0x14583ef6a: je 0x14583f02b
0x14583ef70: mov eax, 0x64726f67
0x14583ef75: xor eax, dword ptr [rcx]
0x14583ef77: movzx ecx, word ptr [rcx + 4]
0x14583ef7b: xor ecx, 0x6b6f
0x14583ef81: or ecx, eax
0x14583ef83: jne 0x14583efe0
0x14583ef85: lea rax, [rip + 0x148ebd4]
0x14583ef8c: ret
0x14583ef8d: mov eax, 0x63696863
0x14583ef92: xor eax, dword ptr [rcx]
0x14583ef94: mov edx, 0x6e656b63
0x14583ef99: xor edx, dword ptr [rcx + 3]
0x14583ef9c: or edx, eax
0x14583ef9e: jne 0x14583efe0
0x14583efa0: lea rax, [rip + 0x148e799]
0x14583efa7: ret
0x14583efa8: movabs rax, 0x745f6e61696c757a
0x14583efb2: xor rax, qword ptr [rcx]
0x14583efb5: mov edx, dword ptr [rcx + 8]
0x14583efb8: xor rdx, 0x72656769
0x14583efbf: or rdx, rax
0x14583efc2: je 0x14583f00b
0x14583efc4: movabs rax, 0x635f666f5f657965
0x14583efce: xor rax, qword ptr [rcx]
0x14583efd1: mov ecx, dword ptr [rcx + 8]
0x14583efd4: xor rcx, 0x6e756874
0x14583efdb: or rcx, rax
0x14583efde: je 0x14583f033
0x14583efe0: xor eax, eax
0x14583efe2: ret
0x14583efe3: lea rax, [rip + 0x148e4b6]
0x14583efea: ret
0x14583efeb: lea rax, [rip + 0x148e3ee]
0x14583eff2: ret
0x14583eff3: lea rax, [rip + 0x148e566]
0x14583effa: ret
0x14583effb: lea rax, [rip + 0x148e5be]
0x14583f002: ret
0x14583f003: lea rax, [rip + 0x148e436]
0x14583f00a: ret
0x14583f00b: lea rax, [rip + 0x148e8ae]
0x14583f012: ret
0x14583f013: lea rax, [rip + 0x148e666]
0x14583f01a: ret
0x14583f01b: lea rax, [rip + 0x148e6be]
0x14583f022: ret
0x14583f023: lea rax, [rip + 0x148e836]
0x14583f02a: ret
0x14583f02b: lea rax, [rip + 0x148e5ee]
0x14583f032: ret
0x14583f033: lea rax, [rip + 0x148e946]
0x14583f03a: ret
0x14583f03b: lea rax, [rip + 0x148e75e]
0x14583f042: ret
0x14583f043: lea rax, [rip + 0x148e8d6]
0x14583f04a: ret
0x14583f04b: lea rax, [rip + 0x148e9ee]
0x14583f052: ret
