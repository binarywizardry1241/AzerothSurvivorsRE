          uVar28 = func_0x0001458a0b40(uVar28,fVar99);
          auVar79._8_8_ = extraout_XMM0_Qb_04;
          auVar79._0_8_ = extraout_XMM0_Qa_01;
          if ((uVar28 & 1) == 0) goto LAB_1459102fe;
        } while (_DAT_145dad474 <=
                 (float)((uint)((float)extraout_XMM0_Qa_01 - local_1b0._0_4_) & _DAT_145db8870));
        local_1a0 = CONCAT44(local_1a0._4_4_,(float)extraout_XMM0_Qa_01);
        local_1c8 = (undefined8 *******)CONCAT44(fVar45,fVar99);
        uStack_1c0 = CONCAT44(fVar101,fVar100);
LAB_145910a58:
        auVar103 = ZEXT416((uint)local_1a0);
LAB_145910a61:
        uVar64 = auVar103._0_4_;
        if (local_160 == (undefined8 *******)0x0) {
          func_0x000145da9b80();
          goto LAB_145910cf8;
        }
        if (((ulong)local_1a8 | (ulong)local_160) >> 0x20 == 0) {
          uVar28 = ((ulong)local_1a8 & 0xffffffff) % ((ulong)local_160 & 0xffffffff);
        }
        else {
          uVar28 = (ulong)local_1a8 % (ulong)local_160;
        }
        ppppppuVar13 = pppppppuVar16[uVar28];
        ppppppuVar25 = pppppppuVar23[0xcf];
        if (ppppppuVar25 == pppppppuVar23[0xcd]) {
          func_0x000145c0dc40();
          uVar64 = auVar103._0_4_;
        }
        ppppppuVar19 = pppppppuVar23[0xce];
        ppppppuVar19[(long)ppppppuVar25 * 5] = (undefined8 *****)0x0;
        ppppppuVar19[(long)ppppppuVar25 * 5 + 2] = ppppppuVar13;
        ppppppuVar19[(long)ppppppuVar25 * 5 + 3] = (undefined8 *****)CONCAT44(fVar45,fVar99);
        *(undefined4 *)(ppppppuVar19 + (long)ppppppuVar25 * 5 + 4) = uVar64;
        *(undefined4 *)((long)ppppppuVar19 + (long)ppppppuVar25 * 0x28 + 0x24) = 0x41a00000;
        pppppppuVar23[0xcf] = (undefined8 ******)((long)ppppppuVar25 + 1);
        pppppppuVar21 = local_1d0;
      }
    }
    else {
      local_148 = *(undefined8 ********)(lVar10 + 0x146bf26a8);
      uStack_140 = local_148 + *(long *)(lVar10 + 0x146bf26b0) * 10;
      local_138 = (undefined8 *******)0x0;
      uVar46 = func_0x0001459d2440();
      if (local_160 != (undefined8 *******)0x0) goto LAB_14591006d;
    }
    if (local_170 != (undefined8 *******)0x0) {
      func_0x0001400021d0();
    }
