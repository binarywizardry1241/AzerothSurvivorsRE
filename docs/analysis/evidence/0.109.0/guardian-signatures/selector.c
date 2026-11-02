
undefined8 entry(void)

{
  undefined8 uVar1;
  int in_ECX;

  if (in_ECX < 0x3f2) {
    if (in_ECX < 0x2c5) {
      if (in_ECX < 0x133) {
        if (in_ECX < 0x6f) {
          if (in_ECX == 0x6a) {
            return 0x146be7328;
          }
          if (in_ECX == 0x6b) {
            return 0x146be7360;
          }
        }
        else {
          if (in_ECX == 0x6f) {
            return 0x146be7398;
          }
          if (in_ECX == 0x132) {
            return 0x146be7718;
          }
        }
      }
      else if (in_ECX < 0x261) {
        if (in_ECX == 0x133) {
          return 0x146be7750;
        }
        if (in_ECX == 0x137) {
          return 0x146be7788;
        }
      }
      else {
        if (in_ECX == 0x261) {
          return 0x146be71d8;
        }
        if (in_ECX == 0x262) {
          return 0x146be7210;
        }
        if (in_ECX == 0x263) {
          return 0x146be7248;
        }
      }
    }
    else if (in_ECX < 0x32b) {
      if (in_ECX < 0x2c7) {
        if (in_ECX == 0x2c5) {
          return 0x146be7280;
        }
        if (in_ECX == 0x2c6) {
          return 0x146be72b8;
        }
      }
      else {
        if (in_ECX == 0x2c7) {
          return 0x146be72f0;
        }
        if (in_ECX == 0x329) {
          return 0x146be7520;
        }
        if (in_ECX == 0x32a) {
          return 0x146be7558;
        }
      }
    }
    else if (in_ECX < 0x38e) {
      if (in_ECX == 0x32b) {
        return 0x146be7590;
      }
      if (in_ECX == 0x38d) {
        return 0x146be75c8;
      }
    }
    else {
      if (in_ECX == 0x38e) {
        return 0x146be7600;
      }
      if (in_ECX == 0x38f) {
        return 0x146be7638;
      }
      if (in_ECX == 0x3f1) {
        return 0x146be77c0;
      }
    }
  }
  else if (in_ECX < 0x51e) {
    if (in_ECX < 0x457) {
      if (in_ECX < 0x455) {
        if (in_ECX == 0x3f2) {
          return 0x146be77f8;
        }
        if (in_ECX == 0x3f3) {
          return 0x146be7830;
        }
      }
      else {
        if (in_ECX == 0x455) {
          return 0x146be7868;
        }
        if (in_ECX == 0x456) {
          return 0x146be78a0;
        }
      }
    }
    else if (in_ECX < 0x4ba) {
      if (in_ECX == 0x457) {
        return 0x146be78d8;
      }
      if (in_ECX == 0x4b9) {
        return 0x146be73d0;
      }
    }
    else {
      if (in_ECX == 0x4ba) {
        return 0x146be7408;
      }
      if (in_ECX == 0x4bb) {
        return 0x146be7440;
      }
      if (in_ECX == 0x51d) {
        return 0x146be7670;
      }
    }
  }
  else if (in_ECX < 0x5e5) {
    if (in_ECX - 0x584U < 4) {
                    /* WARNING: Could not emulate address calculation at 0x00014588d32e */
                    /* WARNING: Treating indirect jump as call */
      uVar1 = (*(code *)((long)*(int *)((ulong)(in_ECX - 0x584U) * 4 + 0x146be7d6c) + 0x146be7d6c))
                        ();
      return uVar1;
    }
    if (in_ECX == 0x51e) {
      return 0x146be76a8;
    }
    if (in_ECX == 0x51f) {
      return 0x146be76e0;
    }
  }
  else {
    if (in_ECX == 0x5e5) {
      return 0x146be7478;
    }
    if (in_ECX == 0x5e6) {
      return 0x146be74b0;
    }
    if (in_ECX == 0x5e7) {
      return 0x146be74e8;
    }
  }
  return 0;
}
