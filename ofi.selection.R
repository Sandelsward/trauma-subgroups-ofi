
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
a -> b -> c 
c -> d [style=full label ='Second opinion needed.']
d -> e -> f 
c -> e [style =full label='Suspected OFI or audit filter trigger. ']
c -> g [style = full label='No potential OFI.']
d -> g [style = full label='No potential OFI.']
 
}
[1]:  paste0('Trauma team activation')
[2]: paste0('Inclusion in the trauma registry')
[3]: paste0('First review done by a nurse.') 
[4]: paste0('Secondary review done by a nurse')
[5]: paste0('Mortality and morbidity conference')
[6]: paste0('Motivation wether OFI is found or not')
[7]: paste0('Excluded, not suitable for Mortality and morbidity conference')
")   

ofi_selection %>% export_svg() %>% charToRaw() %>% rsvg::rsvg_png(paste0("images/ofi.png"))
  
  
}