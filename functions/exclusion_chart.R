exclusion_chart <- function() {
  
  exclusion_chart <- DiagrammeR::grViz("digraph flowchart {
  
    label='Fig. 1. Exclusion chart';
    labelloc=bottom;
    labeljust=left;
    labelfontsize=18;
    # node definitions with substituted label text
    node [shape = rectangle, width = 8, fontsize = 16] 
    tab1 [label = '@@1']
    tab2 [label = '@@2']
    tab3 [label = '@@3']
    tab4 [label = '@@4']
    tab5 [label = '@@5']
   
    
    # edge definitions with the node IDs
    tab1 -> tab2 -> tab3 -> tab4 -> tab5
  }
  
    [1]: 'All patients in the selected registries n=xxxx'
    [2]: 'Patients under the age og 15 excluded'
    [3]: 'Patients with missing information in crucial columns excluded'
    [4]: 'Patients with no information in the OFI column excluded'
    [5]: 'Total cohort - n=xxx'
  ") 
  
  ## %>% DiagrammeRsvg::export_svg() %>% charToRaw() %>% rsvg::rsvg_pdf("swetrau_flowchart.pdf")
  ## Cannot to install DiagrammeRsvg b/c can't install v8 b/c "fatal error: v8.h: no such file or directory"
  return(exclusion_chart)
  
}