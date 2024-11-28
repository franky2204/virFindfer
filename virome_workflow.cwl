cwlVersion: v1.2
class: Workflow

inputs:
  read1: File
  read2: File

outputs:
  output_file:
    type: File
    outputSource: run_virfinder/output_file
  

steps:
  create_fasta:
    run: cwl/createFasta.cwl
    in:
      read1: read1
      read2: read2
    out: [fasta_file]
  run_virfinder:
    run: cwl/virfinder.cwl
    in:
      input_fasta: create_fasta/fasta_file
    out: [output_file]
  
