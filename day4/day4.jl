dat = readlines("day4/input.txt")

function build_passport_list(dat)
    passports = String[]
    current_passport = ""
    for line in dat
        if length(line) == 0 
            push!(passports, current_passport)
            current_passport = ""
        end
        current_passport = current_passport * line * " "
    end

    return passports
end

passport_list = build_passport_list(dat)

function count_valid(passport_list)
    valid = 0
    check_vals = ["byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:"]
    for passport in passport_list
        check = [contains(passport, c) for c in check_vals]
        if all(check)
            valid += 1
        end
    end
    return valid
end

println("Valid: " * string(count_valid(passport_list)))

function count_valid_strict(passport_list)
    valid = 0
    check_vals = ["byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:"]
    for passport in passport_list
        check = [contains(passport, c) for c in check_vals]
        if all(check)
            fields = split(passport, " ")
            check = Bool[]
            for field in fields
                if contains(field, "byr:")
                    println(field)
                    byr = parse(Int, split(field, ":")[2])
                    println(byr ∈ 1920:2002)
                end
                if contains(field, "iyr:")
                    iyr = parse(Int, split(field, ":")[2])
                    push!(check, iyr ∈ 2010:2020)
                end
                if contains(field, "eyr:")
                    eyr = parse(Int, split(field, ":")[2])
                    push!(check, eyr ∈ 2020:2030)
                end
                if contains(field, "hgt:")
                    hgt = split(field, ":")[2]
                    if occursin(r"[0-9]*cm|[0-9]*in", hgt)
                        if hgt[end-1:end] == "cm"
                            push!(check, 150 <= parse(Int, hgt[1:end-2]) <= 193)
                        elseif hgt[end-1:end] == "in"
                            push!(check, 59 <= parse(Int, hgt[1:end-2]) <= 76)
                        else
                            push!(check, false)
                        end
                    else
                        push!(check, false)
                    end
                end
                if contains(field, "hcl:")
                    hcl = occursin(r"#[0-9a-f]{6}", split(field, ":")[2])
                    push!(check, hcl)
                end
                if contains(field, "ecl:")
                    ecl = split(field, ":")[2]
                    check_ecl = (ecl == "amb") | (ecl == "blu") | (ecl == "brn") | (ecl == "gry") | (ecl == "grn") | (ecl == "hzl") | (ecl == "oth")
                    push!(check, check_ecl)
                end
                if contains(field, "pid:")
                    pid = occursin(r"[0-9]{9}", split(field, ":")[2])
                    push!(check, pid)
                end
            end
            if all(check)
                valid += 1
            end
        end
    end
    return valid
end

println("Strict: " * string(count_valid_strict(passport_list)))
