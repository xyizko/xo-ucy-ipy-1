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

# State Variable 
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306



# Function Funding function 

# Constructor fnction
@deploy
def __init__(price_feed_address: address):
    self.minUSD = 1
    self.price_feed = AggregatorV3Interface(price_feed_address)

@external
@payable # Function that hold funds
def fund():
    """
    Allow users to send money to contract 
    - Minimum dollar sent 
    - Using oracles 
    """
    # self.my_num = self.my_num + 2  
    usd_value_of_eth: uint256 = self._get_ethusd_rate(msg.value)
    assert msg.value >= as_wei_value(1, "wei"), "Need More Shizzzz" 

@external
def withdraw():
    """

    """
    pass 

# --- Conversion Function ---

# Getting the current rate 

@internal
@view
def _get_ethusd_rate(eth_amount: uint256) -> uint256:
    # 0x694AA1769357215DE4FAC081bf1f309aDC325306 - Taken from https://github.com/Cyfrin/moccasin-full-course-cu
    price: int256 = staticcall self.price_feed.latestAnswer() 
    eth_price: uint256 = convert(price, uint256) * (10 ** 10)

    # Caluclating the eth amount = which woould be price of eth in wei (19 Digits) and the eth_mount (in wei 19 digits), to get the actual cost we hav eto divide by 10e18
    eth_amt_in_usd: uint256 = (eth_price * eth_amount) // 1 * (10 ** 18)
    return eth_amt_in_usd

    

@external 
@view
def get_price() -> int256:
    priceFeedAddress: address = 0x694AA1769357215DE4FAC081bf1f309aDC325306

    # Src = https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1
    
    price_feed: AggregatorV3Interface = AggregatorV3Interface(priceFeedAddress)
    return staticcall price_feed.latestAnswer()
