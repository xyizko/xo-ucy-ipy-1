# Immutables and constants 

# pragma version ^0.4.0 

OWNER: public(immutable(address))
VAL: public(immutable(uint256))

@deploy
def __init__(val: uint256):
    OWNER = msg.sender
    VAL = 555 # Setting the val here which is delcared to be a immutable with caps VAL 