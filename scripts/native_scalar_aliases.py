"""Exact register-copy relations for unsigned fallthrough selector guards.

Unknown inputs and separate memory reads are distinct symbols. Narrow writes
never preserve invented upper bits; high-byte comparisons are not admitted.
"""
def lower(expression,bits):
    if expression[0]=='constant':return ('constant',expression[1]&((1<<bits)-1))
    if expression[0]=='low':return expression if expression[1]<=bits else lower(expression[2],bits)
    return expression if bits==64 else ('low',bits,expression)

def bounded_identity(compared,selector,maximum):
    if compared==selector:return True
    # A proved unsigned upper bound can make a later zero-extended truncation
    # lossless. It cannot constrain unknown upper bits of the reverse relation.
    return selector[0]=='low' and maximum<(1<<selector[1]) and selector==lower(compared,selector[1])

def guard_bounds(instructions,selector,dispatch_end,capstone,classifier):
    x=capstone.x86_const;state={};partial={};last_compare=None;guards=[]
    canon=lambda instruction,register:classifier.canonical_register(instruction.reg_name(register))
    def read(instruction,operand):
        name=canon(instruction,operand.reg);expression=state.get(name,('incoming',name));bits=operand.size*8
        if instruction.reg_name(operand.reg) in ('ah','bh','ch','dh'):return ('high-byte',expression)
        widths=sorted(width for register,width in partial if register==name and width>=bits)
        return lower(partial[(name,widths[0])],bits) if widths else lower(expression,bits)
    for index,instruction in enumerate(instructions):
        operands=instruction.operands
        transfer=any(instruction.group(group) for group in (capstone.CS_GRP_CALL,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)) or instruction.mnemonic in ('jmp','ud2')
        backward=instruction.group(capstone.CS_GRP_JUMP) and any(o.type==x.X86_OP_IMM and o.imm<=instruction.address for o in operands)
        if transfer or backward:state.clear();partial.clear();last_compare=None;guards=[];continue
        if instruction.mnemonic in ('ja','jae') and last_compare is not None and len(operands)==1 and operands[0].type==x.X86_OP_IMM:
            compare=last_compare
            if not compare['instruction'].address<=operands[0].imm<=dispatch_end:
                maximum=compare['bound']-(instruction.mnemonic=='jae')
                if maximum>=0:guards.append({**compare,'branch':instruction,'branch_index':index,'maximum':maximum})
        is_compare=instruction.mnemonic=='cmp' and len(operands)==2 and operands[0].type==x.X86_OP_REG and operands[1].type==x.X86_OP_IMM
        if is_compare and instruction.reg_name(operands[0].reg) not in ('ah','bh','ch','dh') and 0<=operands[1].imm<=1048576:
            last_compare={'instruction':instruction,'index':index,'bound':operands[1].imm,'expression':read(instruction,operands[0])}
        elif x.X86_REG_EFLAGS in instruction.regs_access()[1]:last_compare=None
        destination=None;result=None
        if operands and operands[0].type==x.X86_OP_REG:
            left=operands[0];destination=canon(instruction,left.reg)
            if len(operands)==2 and instruction.mnemonic in ('mov','movabs','movzx'):
                right=operands[1]
                if right.type==x.X86_OP_REG:result=read(instruction,right)
                elif right.type==x.X86_OP_IMM and instruction.mnemonic!='movzx':result=('constant',right.imm&((1<<(left.size*8))-1))
                elif right.type==x.X86_OP_MEM and instruction.mnemonic=='movzx':result=('low',right.size*8,('memory-read',instruction.address))
            elif len(operands)==2 and instruction.mnemonic in ('xor','sub') and operands[1].type==x.X86_OP_REG and operands[0].reg==operands[1].reg and left.size in (4,8):result=('constant',0)
        for register in instruction.regs_access()[1]:
            name=canon(instruction,register)
            if name in ('rflags','eflags'):continue
            state[name]=('write',instruction.address,name)
            for key in list(partial):
                if key[0]==name:del partial[key]
        if destination is not None and result is not None:
            if operands[0].size in (4,8):state[destination]=lower(result,operands[0].size*8)
            elif instruction.reg_name(operands[0].reg) not in ('ah','bh','ch','dh'):partial[(destination,operands[0].size*8)]=result
    selected=state.get(selector,('incoming',selector));results=[]
    for guard in guards:
        # Further conditional exits may prune the fallthrough path without
        # undoing its already proved bound. Transfers into the span cannot.
        invalid_transfer=False
        for later in instructions[guard['branch_index']+1:]:
            if any(later.group(g) for g in (capstone.CS_GRP_CALL,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)):invalid_transfer=True;break
            if later.group(capstone.CS_GRP_JUMP):
                if later.mnemonic=='jmp' or later.regs_access()[1] or len(later.operands)!=1 or later.operands[0].type!=x.X86_OP_IMM or guard['instruction'].address<=later.operands[0].imm<=dispatch_end:
                    invalid_transfer=True;break
        if invalid_transfer:continue
        if bounded_identity(guard['expression'],selected,guard['maximum']):results.append(guard)
    return results
