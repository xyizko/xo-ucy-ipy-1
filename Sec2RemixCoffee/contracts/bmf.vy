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

# Setting the owner of the contract 
owner: public(address)

# Dynamic Array to keep track of funders
funders: public(DynArray[address, 100])

# Hashmap to keep track of the funders
# funder -> how much they funded
funder_to_amount_funded: public(HashMap[address, uint256])


# Keep track of who sent us 

# How much was sent 


# Constructor fnction
@deploy
def __init__(price_feed_address: address):
    self.minUSD = as_wei_value(1, "ether")
    self.price_feed = AggregatorV3Interface(price_feed_address)
    self.owner = msg.sender

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
    assert usd_value_of_eth >= self.minUSD
    self.funders.append(msg.sender)
    self.funder_to_amount_funded[msg.sender] += msg.value

@external
def withdraw():
    """
    Withdrawal of the amount once the contract is funded
    """
    assert msg.sender == self.owner, "Bastard" 

    # Resetting

    for funder: address in self.funders:
        self.funder_to_amount_funded[funder] = 0
    self.funders = []



# --- Conversion Function ---

# Getting the current rate 

@internal
@view
def _get_ethusd_rate(eth_amount: uint256) -> uint256:
    # 0x694AA1769357215DE4FAC081bf1f309aDC325306 - Taken from https://github.com/Cyfrin/moccasin-full-course-cu
    price: int256 = staticcall self.price_feed.latestAnswer() 
    eth_price: uint256 = convert(price, uint256) * (10 ** 10)

    # Caluclating the eth amount = which woould be price of eth in wei (19 Digits) and the eth_mount (in wei 19 digits), to get the actual cost we hav eto divide by 10e18
    eth_amt_in_usd: uint256 = (eth_price * eth_amount) // (1 * (10 ** 18))
    return eth_amt_in_usd

# Viewing the actual amount
@external 
@view 
def get_eth_usd_rate(eth_amount: uint256) -> uint256:
    return self._get_ethusd_rate(eth_amount)
    

@external 
@view
def get_price() -> int256:
    priceFeedAddress: address = 0x694AA1769357215DE4FAC081bf1f309aDC325306

    # Src = https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1
    
    price_feed: AggregatorV3Interface = AggregatorV3Interface(priceFeedAddress)
    return staticcall price_feed.latestAnswer()
