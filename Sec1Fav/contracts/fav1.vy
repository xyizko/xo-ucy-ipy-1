# Actual contract being written here 

#####################################
# Contract Setup
#####################################

# pragma version 0.4.0
# @licesne BOOTY

#####################################
# Contract Code
#####################################

# State variable 

# Structs - Struct Definition
struct Person:
    fav_num: uint256
    name: String[100]

# Setting a variable called my_name as Struct person 
my_name: public(String[20])

# hash map - similar to a dictionary - Hashmap and arrays listing
name_to_fav_num: public(HashMap[String[100], uint256])


# Default value is 0 - Note the getter method is atuomatically created
my_favorite_number: public(uint256)

# Setting an array of list_of_numbers 
list_of_numbers: public(uint256[5]) # Fixed List
list_of_people: public(Person[5]) # Lisof arrays
index: public(uint256)


# Constructor
@deploy 
def __init__():
    self.my_favorite_number = 7 
    self.index = 0
    self.my_name = "PussyLiqr!"

# Function Definitions
@external # external decrator to declare the visibility
def store(new_number: uint256):
    self.my_favorite_number = new_number


# @external # external decorator
# def store_func():
#     self.store(66)

# the @view decorator defines this as a view function which just reads state so there is only an execution cost and no tx cost
@external 
@view
def retrieve() -> uint256:
    return self.my_favorite_number

# Adding numbers to array lis_of_numbers - This function keeps updating index0
@external 
def add_person(name: String[100], fav_num: uint256):

    # Add favotire Number to number list 
    self.list_of_numbers[self.index] = fav_num
    
    # Add Person to the persons list 
    new_person: Person = Person(fav_num= fav_num, name = name)
    self.list_of_people[self.index] = new_person

    # Add person to hashmap
    self.name_to_fav_num[name]  = fav_num
    
    self.index = self.index + 1




