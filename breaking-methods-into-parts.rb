# exp(b, n) = b * exp(b, n - 1)

# exponent(base, power) = base * exponent(base, power - 1)

# smaller_exponent = power - 1
# exponent(base, power) = base * exponent(base, smaller_exponent)

# base_to_the_smaller_exponent = exponent(base, smaller_exponent)
# exponent(base, power) = base * base_to_the_smaller_exponent

# def return_number(a)
#     ((a / 2)**2) * (65 - (a / 2))
# end

# The method below estimates how much money your child will have when they retire, based on your age.
def amount_once_retired(parents_age)
    childs_age = parents_age / 2
    childs_current_bank_amount = childs_age ** 2
    yrs_till_child_retires = 65 - childs_age
    childs_current_bank_amount * yrs_till_child_retires
end


p amount_once_retired(30)
p amount_once_retired(50)
# An input of 30 should output 11250
# An input of 50 should output 25000