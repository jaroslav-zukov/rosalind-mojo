from file_utils import read_from_downloads
from string_parse_utils import parse_to_int_list


def main():
    input = read_from_downloads("rosalind_iprb")
    # input = "2 2 2"

    int_list = parse_to_int_list(input)
    k = int_list[0]
    m = int_list[1]
    n = int_list[2]

    T = m + k + n

    total = T * (T - 1)

    mm = 0.25 * m * (m - 1) / total

    mn = 0.5 * 2 * m * n / total

    nn = n * (n-1) / total

    a_c = (mm + mn + nn)

    print(1 - a_c)
