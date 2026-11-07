/* Ghidra raw owner 0x140287210: original decompiler lines 217..246. */
joined_r0x0001402877f0:
  } while (cVar4 != '\0');
LAB_14028781e:
  if (lVar18 == 0) {
LAB_140287862:
    func_0x0001401838a0();
    *puVar10 = uVar6;
    func_0x000140042750();
    *(undefined1 *)(lVar9 + 0xa0) = 0xff;
    *puVar10 = uVar6;
    piVar21 = (int *)(lVar9 + 0xe4);
    *piVar21 = *piVar21 + 1;
    goto LAB_140287321;
  }
  *piVar21 = iVar5;
  fVar2 = *(float *)(lVar11 + 0x8c);
  if (*(int *)(lVar18 + 0x18) == 1) {
    fVar24 = fVar2 - *(float *)(lVar18 + 0x1c);
    if (fVar24 < fVar25) goto LAB_140287321;
    if (fVar24 < fVar26) goto LAB_140287862;
  }
  *(undefined4 *)(lVar18 + 0x18) = 1;
  *(float *)(lVar18 + 0x1c) = fVar2;
  goto LAB_140287321;
}
