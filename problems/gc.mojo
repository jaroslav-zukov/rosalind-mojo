from file_utils import read_from_downloads


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

fn compute_gc(dna: String) -> Float64:
    total = len(dna)
    gc_count = dna.count("G") + dna.count("C")
    return gc_count*100/total


def main():
    input = read_from_downloads("rosalind_gc")
    
    fasta_dict = parse_FASTA_to_dict(input)

    winner = String()
    gc_max = Float64()

    for entry in fasta_dict.items():
        gc_value = compute_gc(entry.value)
        if gc_value > gc_max:
            winner = entry.key
            gc_max = gc_value

    print(winner)
    print(gc_max)




