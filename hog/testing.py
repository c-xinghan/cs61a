from hog import *
from dice import *

print("DEBUG: 1", make_averaged(roll_dice, 10000)(1))
print("DEBUG: 2", make_averaged(roll_dice, 10000)(2))
print("DEBUG: 3", make_averaged(roll_dice, 10000)(3))
print("DEBUG: 4", make_averaged(roll_dice, 10000)(4))
print("DEBUG: 5", make_averaged(roll_dice, 10000)(5))
print("DEBUG: 6", make_averaged(roll_dice, 10000)(6))
print("DEBUG: 7", make_averaged(roll_dice, 10000)(7))
print("DEBUG: 8", make_averaged(roll_dice, 10000)(8))
print("DEBUG: 9", make_averaged(roll_dice, 10000)(9))
print("DEBUG: 10", make_averaged(roll_dice, 10000)(10))

# def pig_out_chance(num_rolls):
#     result = roll_dice(num_rolls)
#     if result == 1:
#         return 1
#     return 0

# for i in range(1, 11):
#     print("DEBUG: ", i, make_averaged(pig_out_chance, 10000)(i))