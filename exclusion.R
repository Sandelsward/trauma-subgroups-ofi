
exclusion <- function() {
  
  exclusion <- DiagrammeR::grViz("digraph flowchart {
  
    label='Fig. 2. Exclusion chart';
    labelloc=bottom;
    labeljust=left;
    labelfontsize=18;
    # node definitions with substituted label text
    node [shape = rectangle, width = 8, fontsize = 16] 
    1 [label = '@@1']
    2 [label = '@@2']
    3 [label = '@@3']
    4 [label = '@@4']
    5 [label = '@@5']
    6 [label = '@@6']
    7 [label = '@@7']
    8 [label = '@@8']
    m1 [label ='@@9']
   
    node [shape=none, width=0, height=0, label='']
    p1 -> 2; p2 -> 3; p3 -> 4; p4 -> 5; p5 -> 6; p6 -> 7; p7 -> 8;
      {rank=same; p1 -> m1}
      {rank=same; p2 -> m2}
      {rank=same; p3 -> m3} 
      {rank=same; p4 -> m4}
      {rank=same; p5 -> m5}
      {rank=same; p6 -> m6}
      {rank=same; p7 -> m7}
    
    edge [dir=none]
    1 -> p1; 2 -> p2; 3 -> p3; 4 -> p4; 5 -> p5; 6 -> p6; 7 -> p7;
    
    # edge definitions with the node IDs
    
  }
  
    [1]: paste0('All patients in the selected registries (n: ', unfiltred.patients, ')')
    [2]: paste0('Patients who meet the age critera (n: ', total.included.minus.underage, ')')
    [3]: paste0('Patients with missing information in inj_dominant (n: ', total.missing.inj.dominant, ')')
    [4]: paste0('Patients with missing information in trauma mechanism (n: ', total.missing.inj.mechanism, ')')
    [5]: paste0('Patients with missing information in NISS colum (n: ', total.missing.niss, ')')
    [6]: paste0('Patients with missing information in the first AIS column (n: ', total.missing.AIS01, ')')
    [7]: paste0('Patients with missing information in the OFI column (n: ', total.missing.ofi, ')')
    [8]: paste0('Total number of excluded patients (n: ', tot.excluded.patients, ')')
    [9]: paste0('Patients under the age of 15 excluded (n: ', total.underage.excluded, ')')
  ") 
  
  ## %>% DiagrammeRsvg::export_svg() %>% charToRaw() %>% rsvg::rsvg_pdf("swetrau_flowchart.pdf")
  ## Cannot to install DiagrammeRsvg b/c can't install v8 b/c "fatal error: v8.h: no such file or directory"
  return(exclusion)
  
}