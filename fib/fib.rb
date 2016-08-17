def fib(n)

    a = []
    return a if n == 0
    a = [0] 
    return a if n == 1
    a = [0, 1]
    return a if n == 2

    (n-2).times do
        a << a.last(2).inject(&:+)
    end
    return a

end

puts fib(ARGV[0].to_i).to_s
