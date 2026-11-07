
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  long lVar1;
  long *plVar2;
  long *plVar3;
  long in_RCX;
  uint uVar4;
  long lVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float fVar9;
  
  if (*(long *)(in_RCX + 0x2a0) != 0) {
    lVar1 = *(long *)(in_RCX + 0x298);
    lVar5 = 0;
    do {
      plVar2 = *(long **)(lVar1 + lVar5);
      if ((plVar2[1] == 9) &&
         (plVar3 = (long *)*plVar2, (char)plVar3[1] == 'e' && *plVar3 == 0x7269665f6c756f73)) {
        uVar4 = *(uint *)(in_RCX + 0x7d8);
        if (4 < uVar4) {
          return;
        }
        fVar8 = *(float *)(in_RCX + 0x8e4);
        if (fVar8 < *(float *)(in_RCX + 0x7dc)) {
          return;
        }
        fVar7 = *(float *)(lVar1 + 0x50 + lVar5);
        fVar9 = *(float *)(plVar2 + 9) * _DAT_1458f8d40 * *(float *)(lVar1 + 0x14 + lVar5) *
                *(float *)(lVar1 + 0x3c + lVar5) * *(float *)(in_RCX + 0x460);
        if (fVar9 <= _DAT_1458ed010) {
          fVar9 = _DAT_1458ed010;
        }
        fVar6 = (float)func_0x00014541b8b0(uVar4,in_RCX,9,plVar3);
        if (fVar6 <= fVar9) {
          fVar6 = fVar9;
        }
        if (fVar7 <= _DAT_1458f6620) {
          fVar7 = _DAT_1458f6620;
        }
        fVar7 = (fVar6 / fVar7) / _DAT_1458f8de4;
        *(uint *)(in_RCX + 0x7d8) = uVar4 + 1;
        *(float *)(in_RCX + 0x7dc) = fVar8 + fVar7;
                    /* WARNING: Bad instruction - Truncating control flow here */
        halt_baddata();
      }
      lVar5 = lVar5 + 0x58;
    } while (*(long *)(in_RCX + 0x2a0) * 0x58 - lVar5 != 0);
  }
  return;
}

