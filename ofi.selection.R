
library(DiagrammeR)


ofi_selection <- function() {
  ofi_selection <- DiagrammeR::grViz("digraph flowchart {
  
 label='Fig. 1. A schematic chart of the selection for morbidity and mortality conferences at the Karolinska University hospital in Solna. Abbreviations: OFI - Opportunity for improvement';
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
h [label = '@@8']
a -> b -> c -> d
d -> e [style=full label ='Second opinion needed.']
d -> f [style =full label='Suspected OFI. ']
f -> g
e -> h [style = full label='No potential OFI.']
e -> f [style =full label='Suspected OFI. ']
d -> h [style = full label='No potential OFI.']
b -> h [style =full label='No audit filter triggered. ']
 
}
[1]:  paste0('Trauma team activation')
[2]: paste0('Inclusion in the trauma registry')
[3]: paste0('Audit filter triggered.')
[4]: paste0('First review done by a nurse.') 
[5]: paste0('Secondary review done by a nurse')
[6]: paste0('Mortality and morbidity conference')
[7]: paste0('Motivation whether OFI is found or not')
[8]: paste0('Not suitable for Mortality and morbidity conference')
")   

ofi_selection %>% export_svg() %>% charToRaw() %>% rsvg::rsvg_png(paste0("images/ofi.png"))
  
  
}