
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145412bb0:     	movzbl	0x44(%rcx), %r9d
145412bb5:     	cmpl	$0xf, %r9d
145412bb9:     	jne	0x145412bd1 <.text+0x5411bd1>
145412bbb:     	xorl	%eax, %eax
145412bbd:     	cmpq	$0x3, %rdx
145412bc1:     	setae	%al
145412bc4:     	leaq	0x617995(%rip), %rcx    # 0x145a2a560
145412bcb:     	movss	(%rcx,%rax,4), %xmm0
145412bd0:     	retq
145412bd1:     	movzbl	(%r8), %eax
145412bd5:     	testb	%al, %al
145412bd7:     	jne	0x145412be8 <.text+0x5411be8>
145412bd9:     	xorps	%xmm2, %xmm2
145412bdc:     	je	0x145412bf0 <.text+0x5411bf0>
145412bde:     	movss	0x4d889a(%rip), %xmm0   # 0x1458eb480
145412be6:     	jmp	0x145412bf8 <.text+0x5411bf8>
145412be8:     	movss	0x4(%r8), %xmm2
145412bee:     	jne	0x145412bde <.text+0x5411bde>
145412bf0:     	movss	0x4ea040(%rip), %xmm0   # 0x1458fcc38
145412bf8:     	cmpq	$0x4, %rdx
145412bfc:     	movl	$0x4, %r10d
145412c02:     	cmovbq	%rdx, %r10
145412c06:     	movl	0x8(%r8), %edx
145412c0a:     	movss	0x40(%rcx), %xmm3
145412c0f:     	movl	%r10d, %ecx
145412c12:     	leaq	0x130a8df(%rip), %r8    # 0x14671d4f8
145412c19:     	movss	(%r8,%rcx,4), %xmm1
145412c1f:     	mulss	%xmm3, %xmm1
145412c23:     	mulss	%xmm0, %xmm1
145412c27:     	movss	0x4e61b5(%rip), %xmm0   # 0x1458f8de4
145412c2f:     	cmpl	$0x12, %r9d
145412c33:     	ja	0x145412c79 <.text+0x5411c79>
145412c35:     	movl	%r9d, %ecx
145412c38:     	leaq	0x130d961(%rip), %r8    # 0x1467205a0
145412c3f:     	movslq	(%r8,%rcx,4), %rcx
145412c43:     	addq	%r8, %rcx
145412c46:     	jmpq	*%rcx
145412c48:     	movss	0x52b944(%rip), %xmm0   # 0x14593e594
145412c50:     	jmp	0x145412c7d <.text+0x5411c7d>
145412c52:     	movss	0x4e39d2(%rip), %xmm0   # 0x1458f662c
145412c5a:     	jmp	0x145412c79 <.text+0x5411c79>
145412c5c:     	movss	0x4d88c0(%rip), %xmm0   # 0x1458eb524
145412c64:     	subss	%xmm2, %xmm0
145412c68:     	xorps	%xmm2, %xmm2
145412c6b:     	maxss	%xmm2, %xmm0
145412c6f:     	jmp	0x145412ca1 <.text+0x5411ca1>
145412c71:     	movss	0x4d887f(%rip), %xmm0   # 0x1458eb4f8
145412c79:     	mulss	%xmm3, %xmm0
145412c7d:     	subss	%xmm2, %xmm0
145412c81:     	xorps	%xmm4, %xmm4
145412c84:     	maxss	%xmm4, %xmm0
145412c88:     	movzbl	%r9b, %ecx
145412c8c:     	cmpb	$0x8, %cl
145412c8f:     	ja	0x1454131cf <.text+0x54121cf>
145412c95:     	movl	$0x19b, %r8d            # imm = 0x19B
145412c9b:     	btl	%ecx, %r8d
145412c9f:     	jae	0x145412ce0 <.text+0x5411ce0>
145412ca1:     	movss	0x4d87d7(%rip), %xmm2   # 0x1458eb480
145412ca9:     	testb	%al, %al
145412cab:     	je	0x145412cc3 <.text+0x5411cc3>
145412cad:     	movl	%edx, %eax
145412caf:     	xorps	%xmm3, %xmm3
145412cb2:     	cvtsi2ss	%rax, %xmm3
145412cb7:     	mulss	0x4e3971(%rip), %xmm3   # 0x1458f6630
145412cbf:     	addss	%xmm3, %xmm2
145412cc3:     	divss	%xmm2, %xmm1
145412cc7:     	movaps	%xmm1, %xmm2
145412cca:     	minss	%xmm0, %xmm2
145412cce:     	movaps	%xmm2, %xmm0
145412cd1:     	cmpunordss	%xmm2, %xmm0
145412cd6:     	andps	%xmm0, %xmm1
145412cd9:     	andnps	%xmm2, %xmm0
145412cdc:     	orps	%xmm1, %xmm0
145412cdf:     	retq
145412ce0:     	movl	$0x24, %eax
145412ce5:     	btl	%ecx, %eax
145412ce8:     	jae	0x1454131cf <.text+0x54121cf>
145412cee:     	mulss	0x4e3936(%rip), %xmm3   # 0x1458f662c
145412cf6:     	mulss	0x7e9686(%rip), %xmm1   # 0x145bfc384
145412cfe:     	ucomiss	%xmm2, %xmm3
145412d01:     	jae	0x145412f8e <.text+0x5411f8e>
145412d07:     	movaps	%xmm3, %xmm0
145412d0a:     	divss	%xmm2, %xmm0
145412d0e:     	mulss	%xmm0, %xmm0
145412d12:     	mulss	0x4da2f6(%rip), %xmm0   # 0x1458ed010
145412d1a:     	mulss	%xmm1, %xmm0
145412d1e:     	addss	%xmm2, %xmm0
145412d22:     	ucomiss	%xmm0, %xmm3
145412d25:     	jb	0x145412fb7 <.text+0x5411fb7>
145412d2b:     	movss	0x5b525d(%rip), %xmm4   # 0x1459c7f90
145412d33:     	mulss	%xmm0, %xmm4
145412d37:     	divss	%xmm3, %xmm4
145412d3b:     	addss	0x4d873d(%rip), %xmm4   # 0x1458eb480
145412d43:     	mulss	%xmm1, %xmm4
145412d47:     	addss	%xmm4, %xmm0
145412d4b:     	ucomiss	%xmm0, %xmm3
145412d4e:     	jb	0x145412fdb <.text+0x5411fdb>
145412d54:     	movss	0x5b5234(%rip), %xmm4   # 0x1459c7f90
145412d5c:     	mulss	%xmm0, %xmm4
145412d60:     	divss	%xmm3, %xmm4
145412d64:     	addss	0x4d8714(%rip), %xmm4   # 0x1458eb480
145412d6c:     	mulss	%xmm1, %xmm4
145412d70:     	addss	%xmm4, %xmm0
145412d74:     	ucomiss	%xmm0, %xmm3
145412d77:     	jb	0x145412fff <.text+0x5411fff>
145412d7d:     	movss	0x5b520b(%rip), %xmm4   # 0x1459c7f90
145412d85:     	mulss	%xmm0, %xmm4
145412d89:     	divss	%xmm3, %xmm4
145412d8d:     	addss	0x4d86eb(%rip), %xmm4   # 0x1458eb480
145412d95:     	mulss	%xmm1, %xmm4
145412d99:     	addss	%xmm4, %xmm0
145412d9d:     	ucomiss	%xmm0, %xmm3
145412da0:     	jb	0x145413023 <.text+0x5412023>
145412da6:     	movss	0x5b51e2(%rip), %xmm4   # 0x1459c7f90
145412dae:     	mulss	%xmm0, %xmm4
145412db2:     	divss	%xmm3, %xmm4
145412db6:     	addss	0x4d86c2(%rip), %xmm4   # 0x1458eb480
145412dbe:     	mulss	%xmm1, %xmm4
145412dc2:     	addss	%xmm4, %xmm0
145412dc6:     	ucomiss	%xmm0, %xmm3
145412dc9:     	jb	0x145413047 <.text+0x5412047>
145412dcf:     	movss	0x5b51b9(%rip), %xmm4   # 0x1459c7f90
145412dd7:     	mulss	%xmm0, %xmm4
145412ddb:     	divss	%xmm3, %xmm4
145412ddf:     	addss	0x4d8699(%rip), %xmm4   # 0x1458eb480
145412de7:     	mulss	%xmm1, %xmm4
145412deb:     	addss	%xmm4, %xmm0
145412def:     	ucomiss	%xmm0, %xmm3
145412df2:     	jb	0x14541306b <.text+0x541206b>
145412df8:     	movss	0x5b5190(%rip), %xmm4   # 0x1459c7f90
145412e00:     	mulss	%xmm0, %xmm4
145412e04:     	divss	%xmm3, %xmm4
145412e08:     	addss	0x4d8670(%rip), %xmm4   # 0x1458eb480
145412e10:     	mulss	%xmm1, %xmm4
145412e14:     	addss	%xmm4, %xmm0
145412e18:     	ucomiss	%xmm0, %xmm3
145412e1b:     	jb	0x14541308f <.text+0x541208f>
145412e21:     	movss	0x5b5167(%rip), %xmm4   # 0x1459c7f90
145412e29:     	mulss	%xmm0, %xmm4
145412e2d:     	divss	%xmm3, %xmm4
145412e31:     	addss	0x4d8647(%rip), %xmm4   # 0x1458eb480
145412e39:     	mulss	%xmm1, %xmm4
145412e3d:     	addss	%xmm4, %xmm0
145412e41:     	ucomiss	%xmm0, %xmm3
145412e44:     	jb	0x1454130b3 <.text+0x54120b3>
145412e4a:     	movss	0x5b513e(%rip), %xmm4   # 0x1459c7f90
145412e52:     	mulss	%xmm0, %xmm4
145412e56:     	divss	%xmm3, %xmm4
145412e5a:     	addss	0x4d861e(%rip), %xmm4   # 0x1458eb480
145412e62:     	mulss	%xmm1, %xmm4
145412e66:     	addss	%xmm4, %xmm0
145412e6a:     	ucomiss	%xmm0, %xmm3
145412e6d:     	jb	0x1454130d7 <.text+0x54120d7>
145412e73:     	movss	0x5b5115(%rip), %xmm4   # 0x1459c7f90
145412e7b:     	mulss	%xmm0, %xmm4
145412e7f:     	divss	%xmm3, %xmm4
145412e83:     	addss	0x4d85f5(%rip), %xmm4   # 0x1458eb480
145412e8b:     	mulss	%xmm1, %xmm4
145412e8f:     	addss	%xmm4, %xmm0
145412e93:     	ucomiss	%xmm0, %xmm3
145412e96:     	jb	0x1454130fb <.text+0x54120fb>
145412e9c:     	movss	0x5b50ec(%rip), %xmm4   # 0x1459c7f90
145412ea4:     	mulss	%xmm0, %xmm4
145412ea8:     	divss	%xmm3, %xmm4
145412eac:     	addss	0x4d85cc(%rip), %xmm4   # 0x1458eb480
145412eb4:     	mulss	%xmm1, %xmm4
145412eb8:     	addss	%xmm4, %xmm0
145412ebc:     	ucomiss	%xmm0, %xmm3
145412ebf:     	jb	0x14541311f <.text+0x541211f>
145412ec5:     	movss	0x5b50c3(%rip), %xmm4   # 0x1459c7f90
145412ecd:     	mulss	%xmm0, %xmm4
145412ed1:     	divss	%xmm3, %xmm4
145412ed5:     	addss	0x4d85a3(%rip), %xmm4   # 0x1458eb480
145412edd:     	mulss	%xmm1, %xmm4
145412ee1:     	addss	%xmm4, %xmm0
145412ee5:     	ucomiss	%xmm0, %xmm3
145412ee8:     	jb	0x145413143 <.text+0x5412143>
145412eee:     	movss	0x5b509a(%rip), %xmm4   # 0x1459c7f90
145412ef6:     	mulss	%xmm0, %xmm4
145412efa:     	divss	%xmm3, %xmm4
145412efe:     	addss	0x4d857a(%rip), %xmm4   # 0x1458eb480
145412f06:     	mulss	%xmm1, %xmm4
145412f0a:     	addss	%xmm4, %xmm0
145412f0e:     	ucomiss	%xmm0, %xmm3
145412f11:     	jb	0x145413167 <.text+0x5412167>
145412f17:     	movss	0x5b5071(%rip), %xmm4   # 0x1459c7f90
145412f1f:     	mulss	%xmm0, %xmm4
145412f23:     	divss	%xmm3, %xmm4
145412f27:     	addss	0x4d8551(%rip), %xmm4   # 0x1458eb480
145412f2f:     	mulss	%xmm1, %xmm4
145412f33:     	addss	%xmm4, %xmm0
145412f37:     	ucomiss	%xmm0, %xmm3
145412f3a:     	jb	0x14541318b <.text+0x541218b>
145412f40:     	movss	0x5b5048(%rip), %xmm4   # 0x1459c7f90
145412f48:     	mulss	%xmm0, %xmm4
145412f4c:     	divss	%xmm3, %xmm4
145412f50:     	addss	0x4d8528(%rip), %xmm4   # 0x1458eb480
145412f58:     	mulss	%xmm1, %xmm4
145412f5c:     	addss	%xmm4, %xmm0
145412f60:     	ucomiss	%xmm0, %xmm3
145412f63:     	jb	0x1454131af <.text+0x54121af>
145412f69:     	movss	0x5b501f(%rip), %xmm4   # 0x1459c7f90
145412f71:     	mulss	%xmm0, %xmm4
145412f75:     	divss	%xmm3, %xmm4
145412f79:     	addss	0x4d84ff(%rip), %xmm4   # 0x1458eb480
145412f81:     	mulss	%xmm4, %xmm1
145412f85:     	addss	%xmm1, %xmm0
145412f89:     	subss	%xmm2, %xmm0
145412f8d:     	retq
145412f8e:     	movss	0x5b4ffa(%rip), %xmm0   # 0x1459c7f90
145412f96:     	mulss	%xmm2, %xmm0
145412f9a:     	divss	%xmm3, %xmm0
145412f9e:     	addss	0x4d84da(%rip), %xmm0   # 0x1458eb480
145412fa6:     	mulss	%xmm1, %xmm0
145412faa:     	addss	%xmm2, %xmm0
145412fae:     	ucomiss	%xmm0, %xmm3
145412fb1:     	jae	0x145412d2b <.text+0x5411d2b>
145412fb7:     	movaps	%xmm3, %xmm4
145412fba:     	divss	%xmm0, %xmm4
145412fbe:     	mulss	%xmm4, %xmm4
145412fc2:     	mulss	0x4da046(%rip), %xmm4   # 0x1458ed010
145412fca:     	mulss	%xmm1, %xmm4
145412fce:     	addss	%xmm4, %xmm0
145412fd2:     	ucomiss	%xmm0, %xmm3
145412fd5:     	jae	0x145412d54 <.text+0x5411d54>
145412fdb:     	movaps	%xmm3, %xmm4
145412fde:     	divss	%xmm0, %xmm4
145412fe2:     	mulss	%xmm4, %xmm4
145412fe6:     	mulss	0x4da022(%rip), %xmm4   # 0x1458ed010
145412fee:     	mulss	%xmm1, %xmm4
145412ff2:     	addss	%xmm4, %xmm0
145412ff6:     	ucomiss	%xmm0, %xmm3
145412ff9:     	jae	0x145412d7d <.text+0x5411d7d>
145412fff:     	movaps	%xmm3, %xmm4
145413002:     	divss	%xmm0, %xmm4
145413006:     	mulss	%xmm4, %xmm4
14541300a:     	mulss	0x4d9ffe(%rip), %xmm4   # 0x1458ed010
145413012:     	mulss	%xmm1, %xmm4
145413016:     	addss	%xmm4, %xmm0
14541301a:     	ucomiss	%xmm0, %xmm3
14541301d:     	jae	0x145412da6 <.text+0x5411da6>
145413023:     	movaps	%xmm3, %xmm4
145413026:     	divss	%xmm0, %xmm4
14541302a:     	mulss	%xmm4, %xmm4
14541302e:     	mulss	0x4d9fda(%rip), %xmm4   # 0x1458ed010
145413036:     	mulss	%xmm1, %xmm4
14541303a:     	addss	%xmm4, %xmm0
14541303e:     	ucomiss	%xmm0, %xmm3
145413041:     	jae	0x145412dcf <.text+0x5411dcf>
145413047:     	movaps	%xmm3, %xmm4
14541304a:     	divss	%xmm0, %xmm4
14541304e:     	mulss	%xmm4, %xmm4
145413052:     	mulss	0x4d9fb6(%rip), %xmm4   # 0x1458ed010
14541305a:     	mulss	%xmm1, %xmm4
14541305e:     	addss	%xmm4, %xmm0
145413062:     	ucomiss	%xmm0, %xmm3
145413065:     	jae	0x145412df8 <.text+0x5411df8>
14541306b:     	movaps	%xmm3, %xmm4
14541306e:     	divss	%xmm0, %xmm4
145413072:     	mulss	%xmm4, %xmm4
145413076:     	mulss	0x4d9f92(%rip), %xmm4   # 0x1458ed010
14541307e:     	mulss	%xmm1, %xmm4
145413082:     	addss	%xmm4, %xmm0
145413086:     	ucomiss	%xmm0, %xmm3
145413089:     	jae	0x145412e21 <.text+0x5411e21>
14541308f:     	movaps	%xmm3, %xmm4
145413092:     	divss	%xmm0, %xmm4
145413096:     	mulss	%xmm4, %xmm4
14541309a:     	mulss	0x4d9f6e(%rip), %xmm4   # 0x1458ed010
1454130a2:     	mulss	%xmm1, %xmm4
1454130a6:     	addss	%xmm4, %xmm0
1454130aa:     	ucomiss	%xmm0, %xmm3
1454130ad:     	jae	0x145412e4a <.text+0x5411e4a>
1454130b3:     	movaps	%xmm3, %xmm4
1454130b6:     	divss	%xmm0, %xmm4
1454130ba:     	mulss	%xmm4, %xmm4
1454130be:     	mulss	0x4d9f4a(%rip), %xmm4   # 0x1458ed010
1454130c6:     	mulss	%xmm1, %xmm4
1454130ca:     	addss	%xmm4, %xmm0
1454130ce:     	ucomiss	%xmm0, %xmm3
1454130d1:     	jae	0x145412e73 <.text+0x5411e73>
1454130d7:     	movaps	%xmm3, %xmm4
1454130da:     	divss	%xmm0, %xmm4
1454130de:     	mulss	%xmm4, %xmm4
1454130e2:     	mulss	0x4d9f26(%rip), %xmm4   # 0x1458ed010
1454130ea:     	mulss	%xmm1, %xmm4
1454130ee:     	addss	%xmm4, %xmm0
1454130f2:     	ucomiss	%xmm0, %xmm3
1454130f5:     	jae	0x145412e9c <.text+0x5411e9c>
1454130fb:     	movaps	%xmm3, %xmm4
1454130fe:     	divss	%xmm0, %xmm4
145413102:     	mulss	%xmm4, %xmm4
145413106:     	mulss	0x4d9f02(%rip), %xmm4   # 0x1458ed010
14541310e:     	mulss	%xmm1, %xmm4
145413112:     	addss	%xmm4, %xmm0
145413116:     	ucomiss	%xmm0, %xmm3
145413119:     	jae	0x145412ec5 <.text+0x5411ec5>
14541311f:     	movaps	%xmm3, %xmm4
145413122:     	divss	%xmm0, %xmm4
145413126:     	mulss	%xmm4, %xmm4
14541312a:     	mulss	0x4d9ede(%rip), %xmm4   # 0x1458ed010
145413132:     	mulss	%xmm1, %xmm4
145413136:     	addss	%xmm4, %xmm0
14541313a:     	ucomiss	%xmm0, %xmm3
14541313d:     	jae	0x145412eee <.text+0x5411eee>
145413143:     	movaps	%xmm3, %xmm4
145413146:     	divss	%xmm0, %xmm4
14541314a:     	mulss	%xmm4, %xmm4
14541314e:     	mulss	0x4d9eba(%rip), %xmm4   # 0x1458ed010
145413156:     	mulss	%xmm1, %xmm4
14541315a:     	addss	%xmm4, %xmm0
14541315e:     	ucomiss	%xmm0, %xmm3
145413161:     	jae	0x145412f17 <.text+0x5411f17>
145413167:     	movaps	%xmm3, %xmm4
14541316a:     	divss	%xmm0, %xmm4
14541316e:     	mulss	%xmm4, %xmm4
145413172:     	mulss	0x4d9e96(%rip), %xmm4   # 0x1458ed010
14541317a:     	mulss	%xmm1, %xmm4
14541317e:     	addss	%xmm4, %xmm0
145413182:     	ucomiss	%xmm0, %xmm3
145413185:     	jae	0x145412f40 <.text+0x5411f40>
14541318b:     	movaps	%xmm3, %xmm4
14541318e:     	divss	%xmm0, %xmm4
145413192:     	mulss	%xmm4, %xmm4
145413196:     	mulss	0x4d9e72(%rip), %xmm4   # 0x1458ed010
14541319e:     	mulss	%xmm1, %xmm4
1454131a2:     	addss	%xmm4, %xmm0
1454131a6:     	ucomiss	%xmm0, %xmm3
1454131a9:     	jae	0x145412f69 <.text+0x5411f69>
1454131af:     	divss	%xmm0, %xmm3
1454131b3:     	mulss	%xmm3, %xmm3
1454131b7:     	mulss	0x4d9e51(%rip), %xmm3   # 0x1458ed010
1454131bf:     	movaps	%xmm3, %xmm4
1454131c2:     	mulss	%xmm4, %xmm1
1454131c6:     	addss	%xmm1, %xmm0
1454131ca:     	subss	%xmm2, %xmm0
1454131ce:     	retq
1454131cf:     	mulss	%xmm0, %xmm1
1454131d3:     	movss	0x4e5c09(%rip), %xmm2   # 0x1458f8de4
1454131db:     	addl	$-0x6, %ecx
1454131de:     	cmpl	$0xc, %ecx
1454131e1:     	ja	0x145413205 <.text+0x5412205>
1454131e3:     	leaq	0x130d402(%rip), %rax   # 0x1467205ec
1454131ea:     	movslq	(%rax,%rcx,4), %rcx
1454131ee:     	addq	%rax, %rcx
1454131f1:     	jmpq	*%rcx
1454131f3:     	movss	0x4e3431(%rip), %xmm2   # 0x1458f662c
1454131fb:     	jmp	0x145413205 <.text+0x5412205>
1454131fd:     	movss	0x4d82f3(%rip), %xmm2   # 0x1458eb4f8
145413205:     	mulss	%xmm2, %xmm3
145413209:     	divss	%xmm3, %xmm1
14541320d:     	jmp	0x145412cc7 <.text+0x5411cc7>
