
undefined8 native_spell_radius(void)

{
  int in_ECX;
  
  if (in_ECX < 0x848) {
    if (in_ECX < 0x488) {
      if (0x79 < in_ECX) {
        if (in_ECX == 0x7a) {
          return 1;
        }
        if (in_ECX != 0x30b) {
          return 0;
        }
        return 1;
      }
      if (in_ECX != 10) {
        if (in_ECX != 0x78) {
          return 0;
        }
        return 1;
      }
    }
    else {
      if (in_ECX < 0x5e6) {
        if ((in_ECX != 0x488) && (in_ECX != 0x5a9)) {
          return 0;
        }
        return 1;
      }
      if ((in_ECX != 0x5e6) && (in_ECX != 0x690)) {
        if (in_ECX != 0x79d) {
          return 0;
        }
        return 1;
      }
    }
  }
  else if (in_ECX < 0x35f2) {
    if (in_ECX < 0x18c7) {
      if (in_ECX == 0x848) {
        return 1;
      }
      if (in_ECX != 0x166c) {
        return 0;
      }
    }
    else if ((in_ECX != 0x18c7) && (in_ECX != 0x1fba)) {
      if (in_ECX != 0x2b69) {
        return 0;
      }
      return 1;
    }
  }
  else {
    if (in_ECX < 0x4212) {
      if (in_ECX == 0x35f2) {
        return 1;
      }
      if (in_ECX != 0x3b85) {
        return 0;
      }
      return 1;
    }
    if (((in_ECX != 0x4212) && (in_ECX != 0x5045)) && (in_ECX != 0x67cd)) {
      return 0;
    }
  }
  return 1;
}

