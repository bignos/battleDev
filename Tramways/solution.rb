n = $stdin.gets.strip.to_i
mat = []
n.times do
   mat << $stdin.gets.strip.split.map(&:to_i) 
end

class Memoizer
    def initialize(n, mat)
        @n = n
        @mat = mat
        @mem = Array.new(n) { Array.new(n) { -1 } }
    end
    
    def max(from, to)
        return 0 if from >= to
        return @mem[from][to] if @mem[from][to] > -1
        r =(0...(to - from)).to_a.map { |i|
            @mat[from][from + 1 + i] + max(from+1, from +i) + max(from +i +2, to)
        }.max
        @mem[from][to] = [r, max(from+1, to)].max
    end
end

m = Memoizer.new(n, mat)
puts m.max(0, n-1)
