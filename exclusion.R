
exclusion <- function() {
  
  exclusion <- DiagrammeR::grViz("digraph flowchart {
  
    label='Fig. 2. Exclusion chart';
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
    tab6 [label = '@@6']
    tab7 [label = '@@7']
    tab8 [label = '@@8']
   
    
    # edge definitions with the node IDs
    tab1 -> tab2 -> tab3 -> tab4 -> tab5 -> tab6 -> tab7 -> tab8
  }
  
    [1]: paste0('All patients in the selected registries (n: ', unfiltred.patients, ')')
    [2]: paste0('Patients under the age of 15 excluded (n: ', total.underage.excluded, ')')
    [3]: paste0('Patients with missing information in inj_dominant (n: ', total.missing.inj.dominant, ')')
    [4]: paste0('Patients with missing information in trauma mechanism (n: ', total.missing.inj.mechanism, ')')
    [5]: paste0('Patients with missing information in NISS colum (n: ', total.missing.niss, ')')
    [6]: paste0('Patients with missing information in the first AIS column (n: ', total.missing.AIS01, ')')
    [7]: paste0('Patients with missing information in the OFI column (n: ', total.missing.ofi, ')')
    [8]: paste0('Total number of excluded patients (n: ', tot.excluded.patients, ')')
    
  ") 
  
  ## %>% DiagrammeRsvg::export_svg() %>% charToRaw() %>% rsvg::rsvg_pdf("swetrau_flowchart.pdf")
  ## Cannot to install DiagrammeRsvg b/c can't install v8 b/c "fatal error: v8.h: no such file or directory"
  return(exclusion)
  
}