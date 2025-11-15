from file_utils import read_from_downloads

fn fibd(n: Int, m: Int = 3) -> List[Int]:
    if n == 1:
        zeros = List[Int](length=m-1, fill=0)
        zeros.insert(0, 1)
        return zeros^

    adults = 0
    prev = fibd(n-1, m)
    for i in range(1, m):
        adults += prev[i]
    
    _ = prev.pop()
    
    prev.insert(0, adults)
    
    return prev^
        
def parse_to_int_list(str: String, separator: String=" ") -> List[Int]:
    result = List[Int]()

    for num in str.strip().split(separator):
        result.append(Int(num))

    return result^

fn sum_list(list: List[Int]) -> Int:
    sum = 0
    for num in list:
        sum += num
    return sum

def main():
    input = read_from_downloads("rosalind_fibd")
    # input = "6 3"

    parsed_params = parse_to_int_list(input)

    print(sum_list(fibd(parsed_params[0], parsed_params[1])))
    # print(fib(parsed_params[0], parsed_params[1]))

    