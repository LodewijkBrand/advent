boarding_passes = readlines("day5/input.txt")

function get_row(current_rows, pass)
    if length(current_rows) == 2
        @assert length(pass) == 1
        if pass[1] == 'F'
            return current_rows[1]
        else # pass[1] == 'B'
            return current_rows[2]
        end
    else
        middle = convert(Int, length(current_rows)/2)
        if pass[1] == 'F'
            return get_row(current_rows[1:middle], pass[2:end])
        else # pass[1] == 'B'
            return get_row(current_rows[middle+1:end], pass[2:end])
        end
    end
end

function get_col(current_cols, pass)
    if length(current_cols) == 2
        @assert length(pass) == 1
        if pass[1] == 'L'
            return current_cols[1]
        else # pass[1] == 'R'
            return current_cols[2]
        end
    else
        middle = convert(Int, length(current_cols)/2)
        if pass[1] == 'L'
            return get_col(current_cols[1:middle], pass[2:end])
        else # pass[1] == 'R'
            return get_col(current_cols[middle+1:end], pass[2:end])
        end
    end
end

function seat_id(row, col)
    return row * 8 + col
end

function get_all_id(boarding_passes)
    ids = Int[]
    rows = collect(0:127)
    columns = collect(0:7)

    for pass in boarding_passes
        row = get_row(rows, pass[1:7])
        col = get_col(columns, pass[8:end])
        sid = seat_id(row, col)
        push!(ids, sid)
    end

    return ids
end

function find_my_seat(sorted_ids)
    checker = collect(sorted_ids[1]:sorted_ids[end])
    for i in 1:length(sorted_ids)
        if checker[i] != sorted_ids[i]
            return checker[i]
        end
    end
end

all_ids = get_all_id(boarding_passes)
sort!(all_ids)
println("Max ID: " * string(all_ids[end]))
println("My seat: " * string(find_my_seat(all_ids)))
