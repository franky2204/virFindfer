cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["Rscript", "/usr/local/bin/run_virfinder.Rscript"]

requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: "franky2204/virfinder"
  
inputs:
  input_fasta:
    type: File
    inputBinding:
      position: 1

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.input_fasta.nameroot + "_output.tsv")

arguments:
  - position: 2
    valueFrom: $(inputs.input_fasta.nameroot + "_output.tsv")

stdout: output.log
