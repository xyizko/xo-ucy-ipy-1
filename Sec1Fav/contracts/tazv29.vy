# Taz Pure and View Functions 

# pragma version ^ 0.4.0 

# @pure - do not read any sate and global variales 
# @view - read state and global variables 

# --- Variable declaration ---
count: public(uint256)


# --- Functions ---

@external 
@pure 
def add(x: uint256, y: uint256) -> uint256:
    return x + y 

@external
@view
def add_to_count(x: uint256) -> uint256:
    return x + self.count + block.timestamp

# Writing simple function to see timestamp
@external
@view
def view_timestamp() -> uint256:
    return block.timestamp
