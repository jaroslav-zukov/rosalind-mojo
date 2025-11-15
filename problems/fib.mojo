from file_utils import read_from_downloads

fn fib(n: Int, k: Int) -> Int:
    if n == 2:
        return 1
    elif n == 1:
        return 1
    return fib(n-1, k) + k*fib(n-2, k)
        
def parse_to_int_list(str: String, separator: String=" ") -> List[Int]:
    result = List[Int]()

    for num in str.strip().split(separator):
        result.append(Int(num))

    return result^

def main():
    input = read_from_downloads("rosalind_fib")

    parsed_params = parse_to_int_list(input)

    print(fib(parsed_params[0], parsed_params[1]))

    