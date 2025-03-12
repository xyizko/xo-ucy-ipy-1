# Tas: Conditionals V 30 

# pragma version ^0.4.0

mesag: public(String[20])

@external 
@pure
def if_else(x: uint256) -> uint256:
    if x <= 10:
        return 1
    elif x <=20:
        return 2
    else:
        return 3


@external
def if_else_msg(x: uint256) -> (uint256, String[20]):
    if x <= 10:
        return 1, "Small number"
    elif x <= 20:
        return 2, "Medium number"
    else:
        return 3, "Large number"
