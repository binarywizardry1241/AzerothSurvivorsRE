
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  ulong uVar1;
  float *pfVar2;
  undefined8 *puVar3;
  undefined1 uVar4;
  undefined8 uVar5;
  ulong uVar6;
  ulong uVar7;
  undefined8 uVar8;
  byte bVar9;
  long in_RCX;
  long lVar10;
  ulong uVar11;
  long *plVar12;
  ulong uVar13;
  long lVar14;
  float fVar15;
  float fVar16;
  float fVar17;
  float fVar18;
  float fVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  undefined4 uVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  undefined4 uVar26;
  undefined4 uVar27;
  float local_100;
  undefined4 uStack_c4;
  undefined8 local_c0;
  undefined8 uStack_b8;
  long local_b0;
  long local_a0;
  
  if (_DAT_1458eb52c < *(float *)(in_RCX + 0x7c4) || _DAT_1458eb52c == *(float *)(in_RCX + 0x7c4)) {
    fVar17 = _DAT_1459eb2d0;
    if (*(long *)(in_RCX + 0x730) != 0) {
      lVar14 = *(long *)(in_RCX + 0x728);
      lVar10 = 0;
      do {
        if ((*(long *)(lVar14 + 8 + lVar10) == 9) &&
           ((char)(*(long **)(lVar14 + lVar10))[1] == 'e' &&
            **(long **)(lVar14 + lVar10) == 0x676172646f6f6c62)) {
          fVar17 = *(float *)(lVar14 + 0x10 + lVar10);
          break;
        }
        lVar10 = lVar10 + 0x18;
      } while (*(long *)(in_RCX + 0x730) * 0x18 != lVar10);
    }
    if ((fVar17 <= *(float *)(in_RCX + 0x8e4)) && (*(long *)(in_RCX + 0x2a0) != 0)) {
      lVar14 = *(long *)(in_RCX + 0x298);
      lVar10 = 0;
      do {
        plVar12 = *(long **)(lVar14 + lVar10);
        if ((plVar12[1] == 9) &&
           ((char)((long *)*plVar12)[1] == 'e' && *(long *)*plVar12 == 0x676172646f6f6c62)) {
          uVar8 = *(undefined8 *)(lVar14 + 0x38 + lVar10);
          pfVar2 = (float *)(lVar14 + 0x44 + lVar10);
          fVar16 = pfVar2[2];
          fVar17 = *(float *)(lVar14 + 0x10 + lVar10);
          fVar18 = *(float *)(in_RCX + 0x458);
          fVar19 = *(float *)(in_RCX + 0x45c);
          uVar20 = *(undefined4 *)(in_RCX + 0x3f0);
          uVar5 = *(undefined8 *)(in_RCX + 1000);
          fVar15 = (float)*(undefined8 *)(lVar14 + 0x1c + lVar10) * *pfVar2 *
                   *(float *)(plVar12 + 10) * *(float *)(in_RCX + 0x480);
          if (_DAT_145bfc414 < fVar15) {
            func_0x000145756f57((fVar15 + _DAT_14698ebd0) / _DAT_1458f8de0);
          }
          func_0x0001454ee0d0();
          if (local_a0 == 0) {
            if (local_b0 == 0) {
              return;
            }
          }
          else {
            *(undefined4 *)(in_RCX + 0x7c4) = 0;
            func_0x0001454d49e0();
            func_0x00014544b1a0();
            lVar14 = *(long *)(in_RCX + 0x548);
            if (lVar14 == *(long *)(in_RCX + 0x538)) {
              func_0x0001457580b0();
            }
            lVar10 = *(long *)(in_RCX + 0x540);
            puVar3 = (undefined8 *)(lVar10 + 0x10 + lVar14 * 0x20);
            *puVar3 = local_c0;
            puVar3[1] = uStack_b8;
            puVar3 = (undefined8 *)(lVar10 + lVar14 * 0x20);
            *puVar3 = uVar5;
            puVar3[1] = CONCAT44(uStack_c4,uVar20);
            *(long *)(in_RCX + 0x548) = lVar14 + 1;
            local_100 = (float)uVar8;
            bVar9 = *(char *)((long)plVar12 + 0x75) - 2;
            fVar15 = _DAT_1458eb480;
            if (bVar9 < 7) {
              fVar15 = *(float *)((ulong)bVar9 * 4 + 0x1469aca9c);
            }
            fVar19 = fVar19 * (local_100 *
                               fVar17 * *(float *)((long)plVar12 + 0x44) * _DAT_1458f8d40 * fVar15 +
                              (float)(-(uint)(0.0 < *(float *)((long)plVar12 + 0x44)) &
                                     (uint)(fVar18 * fVar16)));
            uVar4 = *(undefined1 *)(in_RCX + 0x111);
            uVar20 = *(undefined4 *)(in_RCX + 0x20);
            uVar21 = *(undefined4 *)(in_RCX + 0x24);
            uVar22 = *(undefined4 *)(in_RCX + 0x28);
            uVar23 = *(undefined4 *)(in_RCX + 0x2c);
            uVar24 = *(undefined4 *)(in_RCX + 0x40);
            uVar25 = *(undefined4 *)(in_RCX + 0x44);
            uVar26 = *(undefined4 *)(in_RCX + 0x48);
            uVar27 = *(undefined4 *)(in_RCX + 0x4c);
            lVar14 = 0;
            fVar17 = _DAT_1459eb3c0;
            do {
              uVar6 = *(ulong *)(in_RCX + 0x880);
              uVar1 = *(ulong *)(in_RCX + 0x898) + uVar6;
              uVar7 = *(ulong *)(in_RCX + 0x888);
              uVar13 = *(ulong *)(in_RCX + 0x890) ^ uVar6;
              uVar11 = *(ulong *)(in_RCX + 0x898) ^ uVar7;
              *(ulong *)(in_RCX + 0x888) = uVar7 ^ uVar13;
              *(ulong *)(in_RCX + 0x880) = uVar6 ^ uVar11;
              *(ulong *)(in_RCX + 0x890) = uVar13 ^ uVar7 << 0x11;
              *(ulong *)(in_RCX + 0x898) = uVar11 << 0x2d | uVar11 >> 0x13;
              fVar16 = (float)(uint)((uVar1 * 0x800000 | uVar1 >> 0x29) + uVar6 >> 0x28) * fVar17;
              *(undefined1 *)(in_RCX + 0x111) = 3;
              *(undefined8 *)(in_RCX + 0x20) = 0;
              *(undefined8 *)(in_RCX + 0x40) = 0;
              fVar18 = *(float *)(in_RCX + 0x468) * fVar19;
              if (*(float *)(in_RCX + 0x464) <= fVar16) {
                fVar18 = fVar19;
              }
              func_0x0001454c2eb0(fVar16,*(float *)(in_RCX + 0x464),fVar18);
              *(undefined1 *)(in_RCX + 0x111) = uVar4;
              *(undefined4 *)(in_RCX + 0x20) = uVar20;
              *(undefined4 *)(in_RCX + 0x24) = uVar21;
              *(undefined4 *)(in_RCX + 0x28) = uVar22;
              *(undefined4 *)(in_RCX + 0x2c) = uVar23;
              *(undefined4 *)(in_RCX + 0x40) = uVar24;
              *(undefined4 *)(in_RCX + 0x44) = uVar25;
              *(undefined4 *)(in_RCX + 0x48) = uVar26;
              *(undefined4 *)(in_RCX + 0x4c) = uVar27;
              lVar14 = lVar14 + 8;
            } while (local_a0 << 3 != lVar14);
            if (local_b0 == 0) {
              return;
            }
          }
          func_0x0001400021d0();
          return;
        }
        lVar10 = lVar10 + 0x58;
      } while (*(long *)(in_RCX + 0x2a0) * 0x58 - lVar10 != 0);
    }
  }
  return;
}

