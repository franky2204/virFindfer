cwlVersion: v1.2
class: Workflow

inputs:
  read1: File
  database: Directory
  threads: int?
outputs:
  output_file:
    type: Directory
    outputSource: run_genomad/output_file
  

steps:
  create_fasta:
    run: cwl/createFastaSingle.cwl
    in:
      read1: read1
    out: [fasta_file]
  run_genomad:
    run: cwl/genomad.cwl
    in:
        input_fasta: create_fasta/fasta_file
        database: database
        threads: threads
    out: [output_file]
  