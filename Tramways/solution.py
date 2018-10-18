import functools

n = int(input())
t = [[int(s) for s in input().split()] for i in range(n)]

@functools.lru_cache(maxsize=None)
def f(i,j):
    if (i+1 >= j):
        return 0
    else:
        x = max(t[i][k] + f(i+1,k) + f(k+1,j) for k in range(i+1,j))
        return max(x, f(i+1,j))

print(f(0,n))
