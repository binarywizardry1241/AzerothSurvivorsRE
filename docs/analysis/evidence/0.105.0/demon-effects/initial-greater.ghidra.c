
/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(void)

{
  long *plVar1;
  char cVar2;
  code *pcVar3;
  long lVar4;
  long lVar5;
  char *pcVar6;
  long unaff_RBP;
  ulong uVar7;
  ulong uVar8;
  char *pcVar9;
  long unaff_R13;
  float fVar10;

  uVar7 = *(ulong *)(unaff_R13 + 0x780);
  if (uVar7 == 0) {
    halt_baddata();
  }
  lVar4 = *(long *)(unaff_R13 + 0x778);
  fVar10 = _DAT_145d70c70;
  if (uVar7 == 1) {
    uVar8 = 0;
LAB_14591861a:
    if (*(char *)(lVar4 + uVar8 * 8) == ' ') {
      fVar10 = fVar10 + *(float *)(lVar4 + 4 + uVar8 * 8);
    }
  }
  else {
    uVar8 = 0;
    do {
      if (*(char *)(lVar4 + uVar8 * 8) == ' ') {
        fVar10 = fVar10 + *(float *)(lVar4 + 4 + uVar8 * 8);
        cVar2 = *(char *)(lVar4 + 8 + uVar8 * 8);
      }
      else {
        cVar2 = *(char *)(lVar4 + 8 + uVar8 * 8);
      }
      if (cVar2 == ' ') {
        fVar10 = fVar10 + *(float *)(lVar4 + 0xc + uVar8 * 8);
      }
      uVar8 = uVar8 + 2;
    } while ((uVar7 & 0xfffffffffffffffe) != uVar8);
    if ((uVar7 & 1) != 0) goto LAB_14591861a;
  }
  if (0.0 < fVar10) {
    uVar7 = *(ulong *)(unaff_R13 + 0x7b0);
    uVar8 = uVar7 << 6;
    if (0x7ffffffffffffff8 < uVar8 || uVar7 >> 0x3a != 0) {
LAB_145918661:
      func_0x000145d6944b();
                    /* WARNING: Does not return */
      pcVar3 = (code *)invalidInstructionException();
      (*pcVar3)();
    }
    if (uVar8 == 0) {
      *(undefined8 *)(unaff_RBP + 400) = 8;
      *(undefined8 *)(unaff_RBP + 0x180) = 0;
    }
    else {
      func_0x000140002200();
      lVar4 = func_0x0001400021c0();
      *(long *)(unaff_RBP + 400) = lVar4;
      if (lVar4 == 0) goto LAB_145918661;
      *(ulong *)(unaff_RBP + 0x180) = uVar7;
    }
    if (uVar7 != 0) {
      pcVar6 = *(char **)(unaff_RBP + 400);
      func_0x000145bc977b();
      pcVar9 = pcVar6 + uVar8;
      do {
        if (*pcVar6 == -1) break;
        if (*pcVar6 == '!') {
          lVar4 = *(long *)(unaff_R13 + 0xd0);
          lVar5 = *(long *)(unaff_R13 + 0xd8) * 0x78;
          do {
            if (lVar5 == 0) {
              func_0x00014594e4f0();
              break;
            }
            lVar5 = lVar5 + -0x78;
            plVar1 = (long *)(lVar4 + 0x18);
            lVar4 = lVar4 + 0x78;
          } while (*plVar1 != *(long *)(pcVar6 + 0x10));
        }
        pcVar6 = pcVar6 + 0x40;
      } while (pcVar6 != pcVar9);
    }
    if (*(long *)(unaff_RBP + 0x180) != 0) {
      func_0x0001400021d0();
    }
  }
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}
