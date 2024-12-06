cwlVersion: v1.2
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: "staphb/seqtk"

baseCommand: ["seqtk", "seq"]

inputs:
  read1:
    type: File
    inputBinding:
      position: 1
      prefix: "-a"
  output_filename:
    type: string
    default: "$(inputs.read1.nameroot).fasta"

outputs:
  fasta_file:
    type: File
    outputBinding:
      glob: "*.fasta" 

arguments:
  - valueFrom: "> $(inputs.output_filename)"
    shellQuote: true
