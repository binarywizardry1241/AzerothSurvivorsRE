
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

ulong entry(undefined8 param_1,undefined8 param_2,long param_3,undefined8 *param_4)

{
  byte bVar1;
  long *plVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  long *plVar5;
  undefined8 *puVar6;
  char cVar7;
  ulong unaff_RBX;
  byte *pbVar8;
  byte *pbVar9;
  byte *pbVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  float fVar15;
  float fVar16;
  float fVar17;

  pbVar8 = (byte *)param_4[1];
  if ((byte *)*param_4 != pbVar8) {
    plVar2 = *(long **)(param_3 + 8);
    puVar3 = *(undefined8 **)(param_3 + 0x10);
    puVar4 = *(undefined8 **)(param_3 + 0x18);
    pbVar9 = (byte *)*param_4;
    fVar14 = _DAT_145db1394;
    fVar15 = _DAT_145db1390;
    fVar16 = _DAT_145dad264;
    fVar17 = _DAT_145f4bd58;
    do {
      pbVar10 = pbVar9 + 1;
      *param_4 = pbVar10;
      bVar1 = *pbVar9;
      unaff_RBX = (ulong)bVar1;
      cVar7 = FUN_1458967f0();
      if (cVar7 != '\0') {
        if ((bVar1 == 4) || (bVar1 == 1)) {
          plVar5 = (long *)*plVar2;
          puVar6 = (undefined8 *)*plVar5;
          if ((*(uint *)(puVar6 + 0xd) < 0xe) &&
             (((0x2700U >> (*(uint *)(puVar6 + 0xd) & 0x1f) & 1) != 0 &&
              (*(char *)((long)puVar6 + 0x75) == '\t')))) {
            fVar11 = fVar15;
            if ((puVar6[1] == 8) && (*(long *)*puVar6 == _DAT_14721b1d8)) {
              fVar11 = fVar16;
            }
            fVar12 = *(float *)(puVar6 + 9) * fVar14 * *(float *)((long)plVar5 + 0x14) *
                     *(float *)((long)plVar5 + 0x3c) * *(float *)(plVar2[1] + 8);
            fVar13 = fVar12;
            if (fVar12 <= fVar11) {
              fVar13 = fVar11;
            }
            if ((float)(~-(uint)NAN(fVar13) & (uint)fVar13 | (uint)fVar12 & -(uint)NAN(fVar13)) <=
                *(float *)(puVar6 + 0xb) * fVar14 * *(float *)(plVar5 + 4) * *(float *)(plVar5 + 9))
            goto LAB_1458965cf;
          }
        }
        if (bVar1 == 2) {
          if (*(long *)*puVar4 != 0) goto LAB_1458965b3;
        }
        else if (((bVar1 != 1) || (*(char *)(*(long *)*puVar3 + 0x75) != '\v')) ||
                (cVar7 = func_0x00014599aa90(), cVar7 != '\0')) {
LAB_1458965b3:
          fVar11 = (float)func_0x000145993420();
          if (fVar17 <= fVar11) goto LAB_1458966db;
        }
      }
LAB_1458965cf:
      pbVar9 = pbVar10;
    } while (pbVar10 != pbVar8);
  }
  unaff_RBX = CONCAT71((int7)(unaff_RBX >> 8),0xff);
LAB_1458966db:
  return unaff_RBX & 0xffffffff;
}
