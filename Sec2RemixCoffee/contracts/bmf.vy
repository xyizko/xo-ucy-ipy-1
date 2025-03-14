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

minUSD: public(uint256)

# --- Chainlink Aggregator Interface 
# We'll learn a new way to do interfaces later...
interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view


# Function Funding function 

# Constructor fnction
@deploy
def __init__():
    self.minUSD = 1

@external
@payable # Function that hold funds
def fund():
    """
    Allow users to send money to contract 
    - Minimum dollar sent 
    - Using oracles 
    """
    # self.my_num = self.my_num + 2  
    assert msg.value > as_wei_value(1, "wei"), "Need More Shizzzz" 

@external
def withdraw():
    """

    """
    pass 

# --- Conversion Function ---

# Getting the current rate 

@internal
def _get_ethusd_rate():

    # 0x694AA1769357215DE4FAC081bf1f309aDC325306 - Taken from https://github.com/Cyfrin/moccasin-full-course-cu
    pass 

@external 
@view
def get_price() -> int256:

    # Src = https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1
    priceFeedAddress: address = 0x694AA1769357215DE4FAC081bf1f309aDC325306
    
    price_feed: AggregatorV3Interface = AggregatorV3Interface(priceFeedAddress)
    return staticcall price_feed.latestAnswer()
