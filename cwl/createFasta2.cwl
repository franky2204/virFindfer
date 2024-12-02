cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["awk"]

requirements:
  - class: DockerRequirement
    dockerPull: "debian:stable-slim"  
  - class: InlineJavascriptRequirement  

inputs:
  read1:
    type: File
    inputBinding:
      position: 2 

outputs:
  updated_fasta:
    type: File
    outputBinding:
      glob: "$(inputs.read1.nameroot).fasta"  

arguments:
  - valueFrom: '/^>/{if($0 ~ / 1:/) print $1"_1"; else if($0 ~ / 2:/) print $1"_2"; else print $0} !/^>/' 
    position: 1  
  - valueFrom: ">"
    position: 3 
  - valueFrom: "$(inputs.read1.nameroot).fasta"
    position: 4  
