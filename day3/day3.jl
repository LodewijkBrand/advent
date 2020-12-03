patch = readlines("day3/input.txt")
hreps = length(patch)
patch_width = length(patch[1])

global trees = 0

function make_patch_array(patch)
    patch_array = Array{Char, 2}(undef, length(patch), length(patch[1]))

    for i in 1:size(patch_array, 1)
        for j in 1:size(patch_array, 2)
            patch_array[i,j] = patch[i][j]
        end
    end

    return patch_array
end

patch_array = make_patch_array(patch)
forest = repeat(patch_array, outer=(1, hreps))

function count_trees(forest, x, y)
    trees = 0
    h, w = size(forest)
    println(size(forest))
    startx = 1
    starty = 1

    while starty <= h
        if forest[starty, startx] == '#'
            trees += 1
        end
        startx += x
        starty += y
    end
    
    println(startx)

    return trees
end

println("Trees: " * string(count_trees(forest, 3, 1)))

x1y1 = count_trees(forest, 1, 1)
x3y1 = count_trees(forest, 3, 1)
x5y1 = count_trees(forest, 5, 1)
x7y1 = count_trees(forest, 7, 1)
x1y2 = count_trees(forest, 1, 2)

println("Multiplied: " * string(x1y1*x3y1*x5y1*x7y1*x1y2))
