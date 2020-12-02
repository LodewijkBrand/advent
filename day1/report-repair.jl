expenses = readlines("day1/expense-report.txt")

for i in 1:length(expenses)
    e1 = parse(Int, expenses[i])
    for j in 2:length(expenses)
        e2 = parse(Int, expenses[j])
        if e1 + e2 == 2020
            res = e1 * e2
            println(e1)
            println(e2)
            println(res)
        end
    end
end
