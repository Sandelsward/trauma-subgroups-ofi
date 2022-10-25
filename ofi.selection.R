
library(DiagrammeR)


ofi_selection <- function() {
  ofi_selection <- DiagrammeR::grViz("digraph flowchart {
  

 label='Fig. 1. A scematic chart of selection for morbidity and mortality conferences';
    labelloc=bottom;
    labeljust=left;
    labelfontsize=18;
a [label = '@@1']
b [label = '@@2']
c [label = '@@3']
d [label = '@@4']
e [label = '@@5']
f [label = '@@6']
g [label = '@@7']
a -> b -> c 
c -> d [style=full label ='Second opinion needed.']
d -> e -> f 
c -> e [style = dotted label='Suspected OFI or audit filter trigger. ']
c -> g [style = dotted label='No potential OFI.']
d -> g 
 
}
[1]:  paste0('Trauma team activation')
[2]: paste0('Inclusion in trauma registry')
[3]: paste0('First review done by nurse.') 
[4]: paste0('Secondary review done by nurse')
[5]: paste0('Mortality and morbidity conference')
[6]: paste0('Atleast one OFI detected')
[7]: paste0('Motivation wether OFI is found or not')
")   
  return(ofi_selection)
  
}