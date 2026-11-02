/* Selected current scheduler arithmetic; omitted unrelated tick and packet work. */
LAB_145c10429:
        if (*(ulong *)(in_RCX + 0x380) <= uVar22) {
          func_0x000146208d03();
          goto LAB_145c10c5f;
        }
        lVar14 = *(long *)(in_RCX + 0x378) + lVar18;
        plVar1 = *(long **)(*(long *)(in_RCX + 0x378) + lVar18);
        lVar18 = plVar1[1];
        fVar46 = fVar40;
        if (lVar18 == 0xd) {
          if (*(long *)(*plVar1 + 5) == CONCAT53(uRam000000014707f0e8,_DAT_14707f0e5) &&
              *(long *)*plVar1 == CONCAT35(_DAT_14707f0e5,_DAT_14707f0e0)) {
            fVar46 = *(float *)(plVar1 + 0xb) * fVar38 * *(float *)(lVar14 + 0x20) *
                     *(float *)(lVar14 + 0x48);
            if (_DAT_1462330f0 <= fVar46) {
              fVar46 = _DAT_1462330f0;
            }
            fVar46 = _DAT_146233150 - fVar46;
          }
        }
        else if ((lVar18 == 8) && (fVar46 = fVar51, *(long *)*plVar1 != _DAT_14707f0d8)) {
          fVar46 = fVar40;
        }
        fVar39 = *(float *)(plVar1 + 9) * fVar38 * *(float *)(lVar14 + 0x14) *
                 *(float *)(lVar14 + 0x3c) * *(float *)(in_RCX + 0x4d0);
        fVar35 = fVar39;
        if (fVar39 <= fVar46) {
          fVar35 = fVar46;
        }
        fVar46 = (float)(~-(uint)NAN(fVar35) & (uint)fVar35 | (uint)fVar39 & -(uint)NAN(fVar35));
        if ((int)plVar1[0xd] == 0xc) {
          fVar35 = *(float *)(plVar1 + 0xb) * fVar38 * *(float *)(lVar14 + 0x20) *
                   *(float *)(lVar14 + 0x48);
          if (((lVar18 == 0xd) &&
              (*(long *)(*plVar1 + 5) == 0x646c656968735f65 &&
               *(long *)*plVar1 == 0x735f656e69766964)) && (_DAT_1462330f0 <= fVar35)) {
            fVar35 = _DAT_1462330f0;
          }
          if (fVar35 <= fVar47) {
            fVar35 = fVar47;
          }
          fVar46 = fVar46 + fVar35;
        }
        if (cVar8 == '\0') {
          *(undefined4 *)(lVar14 + 0xc) = 0x3e4ccccd;
        }
        else {
          fVar35 = *(float *)(lVar14 + 0xc);
