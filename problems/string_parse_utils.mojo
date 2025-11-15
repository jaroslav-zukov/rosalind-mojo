def parse_to_int_list(str: String, separator: String=" ") -> List[Int]:
    result = List[Int]()

    for num in str.strip().split(separator):
        result.append(Int(num))

    return result^