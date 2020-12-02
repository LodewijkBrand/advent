pwds = readlines("day2/input.txt")

valid_pwds=0

for pwd in pwds
    interval, letter, p = split(pwd, " ")
    lower, upper = split(interval, "-")
    c = count(i->i==letter[1], p)
    if c >= parse(Int, lower) && c <= parse(Int, upper)
        global valid_pwds += 1
    end
end

println("part 1: " * string(valid_pwds))

valid_pwds=0

for pwd in pwds
    interval, letter, p = split(pwd, " ")
    lower, upper = split(interval, "-")
    i1 = parse(Int, lower)
    i2 = parse(Int, upper)
    if (p[i1]==letter[1]) ⊻ (p[i2]==letter[1])
        global valid_pwds += 1
    end
end

println("part 2: " * string(valid_pwds))
