LAB_145ba2a17:
  do {
    uVar56 = local_1b8;
    if (uStack_1b0 == 0) {
      if ((ulong)puVar42 >> 0x3e == 0) {
        local_148 = (long)puVar42 * 4;
        func_0x000140002200();
        puVar55 = (uint *)func_0x0001400021c0(4);
        if (puVar55 != (uint *)0x0) {
          puVar27 = local_100;
          local_108 = puVar55;
          func_0x00014606171b();
          if (local_f8 != (uint *)0x0) {
            local_118 = (uint *)((long)local_f8 + -1);
            puVar55 = (uint *)0x0;
            puVar26 = (uint *)0x0;
            do {
              local_178 = puVar55;
              local_150 = (uint *)((long)puVar26 + 1);
              puVar55 = local_150;
              if (local_118 < local_150) {
                puVar55 = local_118;
              }
              puVar54 = (uint *)((long)puVar26 + ((ulong)(puVar26 == (uint *)0x0) - 1));
              puVar33 = local_f8;
              puVar37 = local_178;
              if (puVar55 < puVar54) {
                do {
                  if (puVar42 <= puVar37) {
LAB_145ba300e:
                    func_0x000146208d03();
                    goto LAB_145ba3142;
                  }
                  puVar33 = (uint *)((long)puVar33 + -1);
                  puVar37 = (uint *)((long)puVar37 + 1);
                } while (puVar33 != (uint *)0x0);
              }
              else {
                puVar33 = (uint *)0x0;
                do {
                  puVar37 = (uint *)((long)puVar33 + (long)puVar26 * (long)local_f8);
                  if (puVar42 <= puVar37) goto LAB_145ba300e;
                  puVar40 = (uint *)((long)puVar33 + 1);
                  fVar108 = (float)puVar27[(long)puVar37];
                  if (!NAN(fVar108)) {
                    puVar58 = puVar40;
                    if (local_118 < puVar40) {
                      puVar58 = local_118;
                    }
                    puVar33 = (uint *)((long)puVar33 + ((ulong)(puVar33 == (uint *)0x0) - 1));
                    puVar34 = puVar54;
                    if (puVar58 < puVar33) {
                      do {
                        puVar33 = (uint *)((long)puVar34 + (ulong)(puVar34 < puVar55));
                        if (puVar55 <= puVar34) break;
                        puVar34 = puVar33;
                      } while (puVar33 <= puVar55);
                    }
                    else {
                      do {
                        puVar45 = (uint *)((long)puVar34 + (ulong)(puVar34 < puVar55));
                        puVar51 = puVar33;
                        do {
                          puVar52 = (uint *)((long)puVar51 + (ulong)(puVar51 < puVar58));
                          puVar1 = (uint *)((long)puVar51 + (long)puVar34 * (long)local_f8);
                          if (puVar42 <= puVar1) {
                            func_0x000146208d03();
                            goto LAB_145ba3142;
                          }
                          fVar110 = (float)local_100[(long)puVar1];
                          if ((fVar110 - fVar108 <= fVar107) &&
                             ((float)local_108[(long)puVar37] <= fVar110 &&
                              fVar110 != (float)local_108[(long)puVar37])) {
                            local_108[(long)puVar37] = (uint)fVar110;
                          }
                          puVar42 = local_138;
                        } while ((puVar51 < puVar58) && (puVar51 = puVar52, puVar52 <= puVar58));
                      } while ((puVar34 < puVar55) && (puVar34 = puVar45, puVar45 <= puVar55));
                    }
                  }
                  puVar33 = puVar40;
                  puVar27 = local_100;
                } while (puVar40 != local_f8);
              }
              puVar55 = (uint *)((long)local_178 + (long)local_f8);
              puVar26 = local_150;
            } while (local_150 != local_f8);
          }
          if (puVar42 != (uint *)0x0) {
            func_0x0001400021d0();
          }
          *local_1d0 = puVar42;
          local_1d0[1] = puVar27;
          local_1d0[2] = puVar42;
          local_1d0[3] = puVar42;
          local_1d0[4] = local_108;
          local_1d0[5] = puVar42;
          local_1d0[6] = local_f8;
          local_1d0[7] = CONCAT44(fVar105,fVar64);
          if (local_1c8 != (undefined1 *)0x0) {
            func_0x0001400021d0();
          }
joined_r0x000145ba2ed3:
          if (local_188 != (undefined1 *)0x0) {
            func_0x0001400021d0();
          }
          if ((local_278._8_8_ != 0) &&
             (local_278._8_8_ + (local_278._8_8_ * 4 + 0x13U & 0xfffffffffffffff0) != -0x11)) {
            func_0x0001400021d0();
          }
          if (local_168 != (undefined8 *)0x0) {
            func_0x0001400021d0();
          }
          return local_1d0;
        }
      }
      func_0x00014620896b();
      goto LAB_145ba3142;
    }
