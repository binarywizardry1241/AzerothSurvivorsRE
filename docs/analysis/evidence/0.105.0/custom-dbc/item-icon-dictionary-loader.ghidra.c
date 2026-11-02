/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 entry(void)

{
  char *pcVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int *piVar5;
  ulong uVar6;
  long *plVar7;
  ulong uVar8;
  uint in_ECX;
  ulong uVar9;
  ulong unaff_RBX;
  long lVar10;
  ushort uVar11;
  int *unaff_R12;
  undefined1 (*pauVar12) [16];
  uint uVar13;
  long lVar14;
  undefined1 (*pauVar15) [16];
  bool bVar16;
  byte bVar17;
  undefined1 auVar18 [16];
  undefined1 auVar19 [16];
  undefined1 auVar20 [16];
  long local_e8;
  int *piStack_e0;
  ulong uStack_d8;
  long local_98;

  uVar8 = (ulong)in_ECX;
  if (_DAT_148004600 == 0) {
LAB_1458bf33f:
    if ((_DAT_148004600 == 0) && (_DAT_1480045e8 != 0)) {
      uVar8 = func_0x000140d8aa00();
      bVar17 = (byte)(uVar8 >> 0x39);
      auVar18 = ZEXT216(CONCAT11(bVar17,bVar17));
      auVar18 = pshuflw(auVar18,auVar18,0);
      lVar10 = 0;
      while( true ) {
        uVar8 = uVar8 & _DAT_1480045d8;
        pcVar1 = (char *)(_DAT_1480045d0 + uVar8);
        auVar20[0] = -(*pcVar1 == auVar18[0]);
        auVar20[1] = -(pcVar1[1] == auVar18[1]);
        auVar20[2] = -(pcVar1[2] == auVar18[2]);
        auVar20[3] = -(pcVar1[3] == auVar18[3]);
        auVar20[4] = -(pcVar1[4] == auVar18[4]);
        auVar20[5] = -(pcVar1[5] == auVar18[5]);
        auVar20[6] = -(pcVar1[6] == auVar18[6]);
        auVar20[7] = -(pcVar1[7] == auVar18[7]);
        auVar20[8] = -(pcVar1[8] == auVar18[0]);
        auVar20[9] = -(pcVar1[9] == auVar18[1]);
        auVar20[10] = -(pcVar1[10] == auVar18[2]);
        auVar20[0xb] = -(pcVar1[0xb] == auVar18[3]);
        auVar20[0xc] = -(pcVar1[0xc] == auVar18[4]);
        auVar20[0xd] = -(pcVar1[0xd] == auVar18[5]);
        auVar20[0xe] = -(pcVar1[0xe] == auVar18[6]);
        auVar20[0xf] = -(pcVar1[0xf] == auVar18[7]);
        uVar11 = (ushort)(SUB161(auVar20 >> 7,0) & 1) | (ushort)(SUB161(auVar20 >> 0xf,0) & 1) << 1
                 | (ushort)(SUB161(auVar20 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar20 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar20 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar20 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar20 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar20 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar20 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar20 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar20 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar20 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar20 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar20 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar20 >> 0x77,0) & 1) << 0xe | (ushort)(auVar20[0xf] >> 7) << 0xf
        ;
        uVar13 = (uint)uVar11;
        while (uVar11 != 0) {
          uVar3 = 0;
          for (uVar4 = uVar13; (uVar4 & 1) == 0; uVar4 = uVar4 >> 1 | 0x80000000) {
            uVar3 = uVar3 + 1;
          }
          lVar14 = _DAT_1480045d0 + (uVar3 + uVar8 & _DAT_1480045d8) * -0x20;
          if (in_ECX == *(uint *)(lVar14 + -0x20)) {
            return *(undefined8 *)(lVar14 + -0x10);
          }
          uVar11 = (ushort)(uVar13 - 1) & (ushort)uVar13;
          uVar13 = CONCAT22((short)(uVar13 - 1 >> 0x10),uVar11);
        }
        auVar19[0] = -(*pcVar1 == -1);
        auVar19[1] = -(pcVar1[1] == -1);
        auVar19[2] = -(pcVar1[2] == -1);
        auVar19[3] = -(pcVar1[3] == -1);
        auVar19[4] = -(pcVar1[4] == -1);
        auVar19[5] = -(pcVar1[5] == -1);
        auVar19[6] = -(pcVar1[6] == -1);
        auVar19[7] = -(pcVar1[7] == -1);
        auVar19[8] = -(pcVar1[8] == -1);
        auVar19[9] = -(pcVar1[9] == -1);
        auVar19[10] = -(pcVar1[10] == -1);
        auVar19[0xb] = -(pcVar1[0xb] == -1);
        auVar19[0xc] = -(pcVar1[0xc] == -1);
        auVar19[0xd] = -(pcVar1[0xd] == -1);
        auVar19[0xe] = -(pcVar1[0xe] == -1);
        auVar19[0xf] = -(pcVar1[0xf] == -1);
        if ((((((((((((((((SUB161(auVar19 >> 7,0) & 1) != 0 || (SUB161(auVar19 >> 0xf,0) & 1) != 0)
                        || (SUB161(auVar19 >> 0x17,0) & 1) != 0) ||
                       (SUB161(auVar19 >> 0x1f,0) & 1) != 0) || (SUB161(auVar19 >> 0x27,0) & 1) != 0
                      ) || (SUB161(auVar19 >> 0x2f,0) & 1) != 0) ||
                    (SUB161(auVar19 >> 0x37,0) & 1) != 0) || (SUB161(auVar19 >> 0x3f,0) & 1) != 0)
                  || (SUB161(auVar19 >> 0x47,0) & 1) != 0) || (SUB161(auVar19 >> 0x4f,0) & 1) != 0)
                || (SUB161(auVar19 >> 0x57,0) & 1) != 0) || (SUB161(auVar19 >> 0x5f,0) & 1) != 0) ||
              (SUB161(auVar19 >> 0x67,0) & 1) != 0) || (SUB161(auVar19 >> 0x6f,0) & 1) != 0) ||
            (SUB161(auVar19 >> 0x77,0) & 1) != 0) || auVar19[0xf] < '\0') break;
        uVar8 = uVar8 + lVar10 + 0x10;
        lVar10 = lVar10 + 0x10;
      }
    }
  }
  else {
    func_0x000145a36150();
    if (local_98 == -1) {
      local_98 = 0;
    }
    func_0x000145aa6bf0();
    if (local_e8 == -1) {
      func_0x000145b6c710();
    }
    else {
      lVar10 = local_e8;
      func_0x000145aa7f80();
      piVar5 = piStack_e0;
      uVar6 = uStack_d8;
      if (local_e8 == -1) {
        func_0x000145b6c710();
        piVar5 = unaff_R12;
        uVar6 = unaff_RBX;
      }
      if (uStack_d8 != 0) {
        uVar9 = 1;
        do {
          plVar7 = *(long **)piStack_e0;
          LOCK();
          *plVar7 = *plVar7 + -1;
          UNLOCK();
          if (*plVar7 == 0) {
            func_0x000145a41300();
          }
          piStack_e0 = piStack_e0 + 2;
          bVar16 = uVar9 != uStack_d8;
          uVar9 = uVar9 + 1;
        } while (bVar16);
      }
      if (lVar10 != 0) {
        func_0x0001400021d0();
      }
      if (local_e8 != -1) {
        if ((uVar6 < 0x14) || (*piVar5 != 0x43424457)) {
          func_0x000145d4cf00();
        }
        else {
          if ((ulong)(uint)piVar5[4] + (ulong)(uint)(piVar5[3] * piVar5[1]) + 0x14 <= uVar6) {
            if (local_98 != 0) {
              func_0x0001400021d0();
            }
            func_0x0001458bc2e0();
            plVar7 = (long *)func_0x000143d98020();
            *plVar7 = *plVar7 + 1;
            lVar14 = lRam0000000146bb3388;
            lVar10 = lRam0000000146bb3378;
            pauVar12 = _DAT_146bb3370;
            func_0x0001459ad750();
            if (_DAT_148004600 != 0) {
              func_0x000145d4d1d7();
            }
            in_ECX = (uint)uVar8;
            if ((pauVar12 != (undefined1 (*) [16])0x0) && (lVar10 != 0)) {
              if (lVar14 != 0) {
                auVar18 = *pauVar12;
                pauVar15 = pauVar12 + 1;
                uVar13 = ~(uint)(ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                                         (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                                         (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                                         (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                                         (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                                         (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                                         (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                                         (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                                         (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                                         (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                                         (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                                         (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                                         (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                                         (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                                         (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                                        (ushort)(byte)(auVar18[0xf] >> 7) << 0xf);
                do {
                  if ((short)uVar13 == 0) {
                    do {
                      auVar18 = *pauVar15;
                      pauVar12 = pauVar12 + -0x20;
                      pauVar15 = pauVar15 + 1;
                      uVar13 = (ushort)((ushort)(SUB161(auVar18 >> 7,0) & 1) |
                                        (ushort)(SUB161(auVar18 >> 0xf,0) & 1) << 1 |
                                        (ushort)(SUB161(auVar18 >> 0x17,0) & 1) << 2 |
                                        (ushort)(SUB161(auVar18 >> 0x1f,0) & 1) << 3 |
                                        (ushort)(SUB161(auVar18 >> 0x27,0) & 1) << 4 |
                                        (ushort)(SUB161(auVar18 >> 0x2f,0) & 1) << 5 |
                                        (ushort)(SUB161(auVar18 >> 0x37,0) & 1) << 6 |
                                        (ushort)(SUB161(auVar18 >> 0x3f,0) & 1) << 7 |
                                        (ushort)(SUB161(auVar18 >> 0x47,0) & 1) << 8 |
                                        (ushort)(SUB161(auVar18 >> 0x4f,0) & 1) << 9 |
                                        (ushort)(SUB161(auVar18 >> 0x57,0) & 1) << 10 |
                                        (ushort)(SUB161(auVar18 >> 0x5f,0) & 1) << 0xb |
                                        (ushort)(SUB161(auVar18 >> 0x67,0) & 1) << 0xc |
                                        (ushort)(SUB161(auVar18 >> 0x6f,0) & 1) << 0xd |
                                        (ushort)(SUB161(auVar18 >> 0x77,0) & 1) << 0xe |
                                       (ushort)(byte)(auVar18[0xf] >> 7) << 0xf) ^ 0xffff;
                    } while (uVar13 == 0);
                  }
                  iVar2 = 0;
                  for (uVar3 = uVar13; (uVar3 & 1) == 0; uVar3 = uVar3 >> 1 | 0x80000000) {
                    iVar2 = iVar2 + 1;
                  }
                  if (*(long *)((long)pauVar12 + (-0x18 - (ulong)(uint)(iVar2 << 5))) != 0) {
                    func_0x0001400021d0();
                  }
                  in_ECX = (uint)uVar8;
                  lVar14 = lVar14 + -1;
                  uVar13 = uVar13 - 1 & uVar13;
                } while (lVar14 != 0);
              }
              if (lVar10 * 0x21 != -0x31) {
                func_0x0001400021d0();
              }
            }
            if (local_e8 != 0) {
              func_0x0001400021d0();
            }
            goto LAB_1458bf33f;
          }
          func_0x000145d4cf00();
        }
        if (local_e8 != 0) {
          func_0x0001400021d0();
        }
        func_0x000145b6c710();
      }
    }
    if (local_98 != 0) {
      func_0x0001400021d0();
    }
  }
  return 0;
}
