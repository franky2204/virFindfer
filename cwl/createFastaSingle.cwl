cwlVersion: v1.2
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: "staphb/seqtk"
  - class: InlineJavascriptRequirement

baseCommand: ["bash", "-c", "seqtk seq"]

inputs:
  read1:
    type: File
    inputBinding:
      position: 1
      prefix: "-a"

outputs:
  fasta_file:
    type: File
    outputBinding:
      glob: "$(inputs.read1.nameroot).fasta"  # Corrected output file pattern

arguments:
  - valueFrom: "$(inputs.read1.path)"
    shellQuote: false
    position: 2


stdout: merged.log  # Log standard output to merged.log
stderr: merged.log  # Log errors to the same log file
