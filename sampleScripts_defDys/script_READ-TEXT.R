
```{r ReadText: 2 Abstract CSV , include=FALSE}
# Corpus consisting of 2958 documents and 86 docvars.
# [1] 2958   88

rTx_2953 <- readtext("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. FL21_rProjects/602_soloGroupProject/em_defDys_textAnalysis/data_defDys/CLEANED-DefDys_Ebsco_Nov11_3086.csv", text_field = "Abstract.Note")


# Corpus consisting of 2958 documents and 86 docvars.
# [1] 3772   88

rTX1_3772 <- readtext("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. FL21_rProjects/602_soloGroupProject/em_defDys_textAnalysis/data_defDys/defining dystopia- abstract and titles.csv")

```

library(readr)
defDys_roundUp <- read_csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. FL21_rProjects/602_soloGroupProject/em_defDys_textAnalysis/data_defDys/defDys_roundUp.csv")
View(defDys_roundUp)