cwlVersion: v1.2
class: Workflow

inputs:
  fasta_file: File
  database: Directory
  threads: int?
outputs:
  output_file:
    type: Directory
    outputSource: run_genomad/output_file
  

steps:
#  create_fasta:
#    run: cwl/createFasta.cwl
#    in:
#      read1: read1
#      read2: read2
#    out: [fasta_file]
  run_genomad:
    run: cwl/genomad.cwl
    in:
        input_fasta: fasta_file
        database: database
        threads: threads
    out: [output_file]
  