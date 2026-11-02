
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  byte bVar1;
  long *plVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  long *plVar5;
  long lVar6;
  char cVar7;
  ulong unaff_RBX;
  byte *pbVar8;
  byte *pbVar9;
  byte *pbVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  
  pbVar8 = (byte *)param_4[1];
  if ((byte *)*param_4 != pbVar8) {
    plVar2 = *(long **)(param_3 + 8);
    puVar3 = *(undefined8 **)(param_3 + 0x10);
    puVar4 = *(undefined8 **)(param_3 + 0x18);
    pbVar9 = (byte *)*param_4;
    fVar12 = _DAT_1458f8d40;
    fVar13 = _DAT_1458ed010;
    fVar14 = _DAT_145bcaed0;
    do {
      pbVar10 = pbVar9 + 1;
      *param_4 = pbVar10;
      bVar1 = *pbVar9;
      unaff_RBX = (ulong)bVar1;
      cVar7 = func_0x00014540da00();
      if (cVar7 != '\0') {
        plVar5 = (long *)*plVar2;
        if ((bVar1 == 4) || (bVar1 == 1)) {
          lVar6 = *plVar5;
          if ((*(uint *)(lVar6 + 0x68) < 0xd) &&
             (((0x1300U >> (*(uint *)(lVar6 + 0x68) & 0x1f) & 1) != 0 &&
              (*(char *)(lVar6 + 0x75) == '\t')))) {
            fVar11 = *(float *)(lVar6 + 0x48) * fVar12 * *(float *)((long)plVar5 + 0x14) *
                     *(float *)((long)plVar5 + 0x3c) * *(float *)(plVar2[1] + 8);
            if (fVar11 <= fVar13) {
              fVar11 = fVar13;
            }
            if (fVar11 <= *(float *)(lVar6 + 0x58) * fVar12 * *(float *)(plVar5 + 4) *
                          *(float *)(plVar5 + 9)) goto LAB_145472220;
          }
        }
        if (bVar1 == 2) {
          if (*(long *)*puVar4 != 0) goto LAB_145472204;
        }
        else if (((bVar1 != 1) || (*(char *)(*(long *)*puVar3 + 0x75) != '\v')) ||
                (cVar7 = func_0x00014541b790(), cVar7 != '\0')) {
LAB_145472204:
          fVar11 = (float)func_0x0001454f94c0();
          if (fVar14 <= fVar11) goto LAB_1454722fb;
        }
      }
LAB_145472220:
      pbVar9 = pbVar10;
    } while (pbVar10 != pbVar8);
  }
  unaff_RBX = CONCAT71((int7)(unaff_RBX >> 8),0xff);
LAB_1454722fb:
  return unaff_RBX & 0xffffffff;
}

