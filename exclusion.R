
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
    m2 [label ='@@10']
    m3 [label ='@@11']
    m4 [label ='@@12']
    m5 [label ='@@13']
    m6 [label ='@@14']
   
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
    [3]: paste0('Patients with no missing information in inj_dominant (n: ', all.right.age.and.inj.dominant, ')')
    [4]: paste0('Patients with no missing information in trauma mechanism (n: ', age.dominant.mechanism, ')')
    [5]: paste0('Patients with no missing information in NISS colum (n: ', age.dominant.mechanism.niss, ')')
    [6]: paste0('Patients with no missing information in the first AIS column (n: ', age.dominant.mechanism.niss.ais01, ')')
    [7]: paste0('Patients with no missing information in the OFI column (n: ', age.dominant.mechanism.niss.ais01.ofi, ')')
    [8]: paste0('Total number patients (n: ', age.dominant.mechanism.niss.ais01.ofi, ')')
    [9]: paste0('Patients under the age of 15 excluded (n: ', total.underage.excluded, ')')
    [10]: paste0('Patients with missing information in inj_dominant (n: ', total.missing.inj.dominant, ')')
    [11]: paste0('Patients with missing information in trauma mechanism (n: ', total.missing.inj.mechanism, ')')
    [12]: paste0('Patients with missing information in NISS colum (n: ', total.missing.niss, ')')
    [13]: paste0('Patients with missing information in the first AIS column (n: ', total.missing.AIS01, ')')
    [14]: paste0('Patients with missing information in the OFI column (n: ', total.missing.ofi, ')')
  ") 
  
  ## %>% DiagrammeRsvg::export_svg() %>% charToRaw() %>% rsvg::rsvg_pdf("swetrau_flowchart.pdf")
  ## Cannot to install DiagrammeRsvg b/c can't install v8 b/c "fatal error: v8.h: no such file or directory"
  return(exclusion)
  
}