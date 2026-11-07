; 0.115.0 SHA-256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Owner 0x14011b850..0x14011c081; curated slices only.

; Slice 0x14011bb0c..0x14011bb73
0x14011bb0c: mov rax, qword ptr [rsi + 0x170]
0x14011bb13: cmp rax, qword ptr [rbx + 0x218]
0x14011bb1a: jae 0x14011bff9
0x14011bb20: mov rcx, qword ptr [rbx + 0x210]
0x14011bb27: mov rax, qword ptr [rcx + rax*8]
0x14011bb2b: test rax, rax
0x14011bb2e: je 0x14011bff9
0x14011bb34: mov r10, qword ptr [rbx + 0x1e0]
0x14011bb3b: not rax
0x14011bb3e: imul rax, rax, 0x38
0x14011bb42: cmp byte ptr [r10 + rax + 0x30], 0
0x14011bb48: je 0x14011bff9
0x14011bb4e: mov qword ptr [rsp + 0x210], r12
0x14011bb56: mov qword ptr [rsp + 0x218], rdx
0x14011bb5e: add r10, rax
0x14011bb61: mov rax, qword ptr [r10 + 0x10]
0x14011bb65: mov qword ptr [rsp + 0x208], rax
0x14011bb6d: mov eax, dword ptr [rbx + 0x5b0]

; Slice 0x14011be2d..0x14011be45
0x14011be2d: mov rax, qword ptr [rsp + 0x208]
0x14011be35: mov qword ptr [rsp + 0x168], rax
0x14011be3d: lea rax, [r10 + 0x2c]
0x14011be41: add r10, 0x28

; Slice 0x14011bf13..0x14011bf1b
0x14011bf13: lea rbx, [rsp + 0x168]

; Slice 0x14011bf61..0x14011bf66
0x14011bf61: mov qword ptr [rsp + 0x48], rbx

; Slice 0x14011bf84..0x14011bf89
0x14011bf84: call 0x14010bc00
