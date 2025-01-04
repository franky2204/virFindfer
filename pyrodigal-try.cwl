cwlVersion: v1.2
class: Workflow

inputs:
  fasta_file: File
  threads: int
outputs:
  annotate_file:
    type: File
    outputSource: pyrodigal/annotated_file
  proteins:
    type: File
    outputSource: pyrodigal/proteins
  

steps:
  pyrodigal:
    run: cwl/pyrodigal.cwl
    in:
      input_fasta: fasta_file
      threads: threads
    out: [annotated_file, proteins]
