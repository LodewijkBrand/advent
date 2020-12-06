group_answers = readlines("day6/input.txt")
push!(group_answers, "") # Add a newline to EOF

function count_num_answers(group_answers)
    c = 0
    group_ans = ""

    for line in group_answers
        if line == ""
            c += length(unique.(group_ans))
            group_ans = ""
        else
            group_ans = group_ans * line
        end
    end

    return c
end

function count_num_yes_answers(group_answers)
    c = 0
    group_ans = ""
    num_in_group = 0

    for line in group_answers
        if line == ""
            unique_ans = unique.(group_ans)
            for uniq in unique_ans
                if count(uniq*"", group_ans) == num_in_group
                    c += 1
                end
            end
            group_ans= ""
            num_in_group = 0
        else
            group_ans = group_ans * line
            num_in_group += 1
        end
    end

    return c
end

println("count: " * string(count_num_answers(group_answers)))
println("count yes: " * string(count_num_yes_answers(group_answers)))
