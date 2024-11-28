cwlVersion: v1.2
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: antoniopcamargo/genomad:1.8.0
requirements:
  InlineJavascriptRequirement: {}

baseCommand: ["end-to-end"]

inputs:
  input_fasta:
    type: File
    inputBinding:
      position: 1
    doc: Input FASTA file for Genomad.

  database:
    type: Directory
    inputBinding:
      position: 3


  threads:
    type: int?
    default: 1
    inputBinding:
      position: 4
      prefix: "--splits"


# Arguments
arguments:
  - valueFrom: "$(inputs.input_fasta.nameroot + '_output')"
    position: 2


# Outputs
outputs:
  output_file:
    type: Directory
    outputBinding:
      glob: $(inputs.input_fasta.nameroot + "_output")
    doc: Directory with the results of the end-to-end execution.

