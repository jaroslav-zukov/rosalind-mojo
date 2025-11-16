def parse_to_int_list(str: String, separator: String=" ") -> List[Int]:
    result = List[Int]()

    for num in str.strip().split(separator):
        result.append(Int(num))

    return result^

## Takes in the fasta string
## Outputs the dictionary with pairs (read_id, dna)
def parse_FASTA_to_dict(fasta: String) -> Dict[String, String]:
    reads = fasta.split(">")

    parsed_dict = Dict[String, String]()
    for read in reads:
        lines = read.split("\n")
        read_id = String(lines.pop(0).strip())

        if read_id.byte_length() == 0: continue

        sequence = String()
        for line in lines:
            sequence += line.strip()
        
        parsed_dict[read_id] = sequence

    return parsed_dict^