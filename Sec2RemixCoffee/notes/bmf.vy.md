# Notes for bmf.vy vyper contract 

1. Amount are always dealth in wei in vyper 

2. Internal function can be marked with the directive @internal bu usually the are prefixed with an underscore

```vy
@internal
def _internal_func():
    pass
```
- In the above internal function the underscore `_` is marker for an `internal function`
- the `@internal` directive is not required , since the `_` is prefixed in the function

3. https://sepolia.etherscan.io/address/0x694AA1769357215DE4FAC081bf1f309aDC325306#readContract 
    - The contract on sepolia eth for getting the current price 
    - Note its a verified contract so you can just read query and get the current price 

4. Calling externally in vyper 
    - Done with two kw - saticcall and excall 
    - Since reaching out to another contract is always a security issue



