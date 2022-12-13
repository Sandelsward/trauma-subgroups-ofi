
exclusion <- function() {
  
  exclusion <- DiagrammeR::grViz("digraph flowchart {
  
    label='Fig. 2. Flowchart of all excluded patients and the reason for exclusion. The unfiltred patient cohort comes from the trauma registry and trauma quality database of the Karolinska University Hospital in Solna from the years 2012-2021. Abbreviations: AIS - The Abbreviated Injury Scale. NISS - NISS - The New Injury Severity Score. OFI - Opportunity for improvement.';
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
    9 [label = '@@9']
    m1 [label ='@@10']
    m2 [label ='@@11']
    m3 [label ='@@12']
    m4 [label ='@@13']
    m5 [label ='@@14']
    m6 [label ='@@15']
    m7 [label ='@@16']
   
    node [shape=none, width=0, height=0, label='']
    p1 -> 2; p2 -> 3; p3 -> 4; p4 -> 5; p5 -> 6; p6 -> 7; p7 -> 8; p8 ->9;
      {rank=same; p1 -> m1}
      {rank=same; p2 -> m2}
      {rank=same; p3 -> m3} 
      {rank=same; p4 -> m4}
      {rank=same; p5 -> m5}
      {rank=same; p6 -> m6}
      {rank=same; p7 -> m7}
      
    
    edge [dir=none]
    1 -> p1; 2 -> p2; 3 -> p3; 4 -> p4; 5 -> p5; 6 -> p6; 7 -> p7; 8 -> p8;
    
    # edge definitions with the node IDs
    
  }
  
    [1]: paste0('All patients in the selected registries (n: ', unfiltred.patients, ')')
    [2]: paste0('Patients who meet the age critera (n: ', total.included.minus.underage, ')')
    [3]: paste0('Patients with no missing information in dominating type of injury (n: ', all.right.age.and.inj.dominant, ')')
    [4]: paste0('Patients with no missing information in NISS colum (n: ', age.dominant.niss, ')')
    [5]: paste0('Patients with no missing information in the first AIS column (n: ', age.dominant.niss.ais01, ')')
    [6]: paste0('Patients with no missing information in the OFI column (n: ', age.dominant.niss.ais01.ofi, ')')
    [7]: paste0('Patients with no missing information in The most severely injured body region (n: ', age.dominant.niss.ais01.ofi.mos, ')')
    [8]: paste0('Patients with no missing information in 30-day survival (n: ', final.number, ')')
    [9]: paste0('Total number of included patients (n: ', final.number, ')')
    [10]: paste0('Patients under the age of 15 excluded (n: ', total.underage.excluded, ')')
    [11]: paste0('Patients with missing information in dominating type of injury (n: ', total.missing.inj.dominant, ')')
    [12]: paste0('Patients with missing information in NISS colum (n: ', total.missing.niss, ')')
    [13]: paste0('Patients with missing information in the first AIS column (n: ', total.missing.AIS01, ')')
    [14]: paste0('Patients with missing information in the OFI column (n: ', total.missing.ofi, ')')
    [15]: paste0('Patients with missing information in The most severely injured body region (n: ', total.missing.mos, ')')
    [16]: paste0('Patients with missing information in 30-day survival (n: ', total.missing.survival30d, ')')

  ") 
  
    exclusion %>% export_svg() %>% charToRaw() %>% rsvg::rsvg_png(paste0("images/exclusion.png"))
  
  
}




