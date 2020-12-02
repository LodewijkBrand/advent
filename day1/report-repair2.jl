expenses = readlines("day1/expense-report.txt")

for i in 1:length(expenses)
    e1 = parse(Int, expenses[i])
    for j in 2:length(expenses)
        e2 = parse(Int, expenses[j])
        for k in 3:length(expenses)
            e3 = parse(Int, expenses[k])
            if e1 + e2 + e3 == 2020
                res = e1 * e2 * e3
                println(e1)
                println(e2)
                println(e3)
                println(res)
            end
        end
    end
end
