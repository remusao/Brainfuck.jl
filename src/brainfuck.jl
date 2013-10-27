
function brainfuck(file_name, memsize = 30000)

    # Read program and filter symbols
    symbols = ['>' '<' '+' '-' '.' ',' '[' ']']
    code = filter(x -> in(x, symbols), open(readall, file_name))

    # Memory of the program
    memory = zeros(Char, memsize)
    # Stack for loops
    stack = Array(Int, 0)
    ptr = 1                 # Memory pointer
    instr = 1               # Instruction pointer

    # Run the program
    while instr <= length(code)
        @match code[instr] begin
            '>' => ptr += 1
            '<' => ptr -= 1
            '+' => memory[ptr] += 1
            '-' => memory[ptr] -= 1
            '.' => print(memory[ptr])
            ',' => memory[ptr] = read(STDIN, Char)
            '[' => if memory[ptr] == zero(Char)
                       instr = findnext(code, ']', instr)
                   else
                       push!(stack, instr)
                   end
            ']' => instr = pop!(stack) - 1
        end
        instr += 1
    end
end
