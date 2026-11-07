145d7837e: sub	rsp, 0x48
145d78382: mov	eax, dword ptr [rip + 0x22d7238]
145d78388: test	eax, eax
145d7838a: jne	0x145d78391
145d7838c: add	rsp, 0x48
145d78390: ret
145d78391: lea	rax, [rip + 0x22d7210]
145d78398: lea	rcx, [rsp + 0x38]
145d7839d: mov	qword ptr [rcx], rax
145d783a0: lea	rax, [rsp + 0x2f]
145d783a5: mov	qword ptr [rcx + 8], rax
145d783a9: lea	r8, [rsp + 0x30]
145d783ae: mov	qword ptr [r8], rcx
145d783b1: lea	rax, [rip + 0xe72648]
145d783b8: mov	qword ptr [rsp + 0x20], rax
145d783bd: lea	rcx, [rip + 0x22d71fc]
145d783c4: lea	r9, [rip + 0xe725bd]
145d783cb: mov	dl, 1
145d783cd: call	0x145d92020
145d783d2: jmp	0x145d7838c
