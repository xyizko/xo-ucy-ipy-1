# BuyMeACoffe.vy - Work - writing in snake_case

# --- Project Planning ---

# Get Funds from users
# Get Withdraw Funds 
# Set minimum value 

# --- Contract Header ---

# pragma version 0.4.0
# @ license: MIT 
# @ author: Dudo

# --- Actual Functions 

# --- Variables --- 

# my_num: public(uint256)

# --- Function Logic ---

# Function Funding function 

@external
@payable # Function that hold funds
def fund():
    """
    Allow users to send money to contract 
    - Minimum dollar sent 
    """
    # self.my_num = self.my_num + 2  
    assert msg.value >= as_wei_value(10, "wei"), "Need More Shizzzz" 

@external
def withdraw():
    """

    """
    pass 



