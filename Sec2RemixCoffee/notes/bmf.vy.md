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


