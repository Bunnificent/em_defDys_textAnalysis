
require(quanteda)
library(dplyr)
library(tidyverse)
# 

# read csv into a data.frame
text2data <- read.csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. FL21_rProjects/602_soloGroupProject/em_defDys_textAnalysis/data_defDys/defining dystopia- abstract and titles.csv")

library(dplyr)

text2data <- 
  select(text2data,c(1,2,4,5,6,11,18,19,21,29,34,40))
view(colnames(text2data))

# # Remove duplicate rows in a data frame
# # The function distinct() [dplyr package] can be used to keep only unique/distinct rows from a data frame. If there are duplicate rows, only the first row is preserved.
# # 
# 
 textdata %>% distinct("Title", .keep_all = TRUE)
# 
# summary(unique(textdata))
library(quanteda)
 td2_corpus<- corpus(text2data,
                     text_field = "Abstract.Note",
                     docnames = quanteda::docnames("Title")
                     )
 view(summary(td2_corpus))
 
# have a look on the new corpus object
view(summary(td_corpus))
cat(texts(td_corpus[1]))


# 1 Text preprocessing

textdata <- read.csv("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/Dacss_RProjects/3. FL21_rProjects/602_soloGroupProject/em_defDys_textAnalysis/data_defDys/defining dystopia- abstract and titles.csv")
td_corpus<- corpus(textdata$Abstract.Note, docnames = textdata$Title)

# Build a dictionary of lemmas
lemma_data <- read.csv("resources/baseform_en.tsv", encoding = "UTF-8")

# apply lemmatization to the corpus. 
# Lemmatization reduces (potentially) inflected word forms to its lexical baseform to unify similar semantic forms to the same text representation.
# For instance, ‘presidents’ becomes ‘president’ and ‘singing’ becomes ‘sing’.


# Create a DTM
corpus_tokens <- td_corpus %>% 
  tokens(remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE) %>% 
  tokens_tolower() %>% 
  tokens_replace(lemma_data$inflected_form, lemma_data$lemma, valuetype = "fixed") %>% 
  tokens_remove(pattern = stopwords())

```{r eval=FALSE, include=FALSE}
rTx_2953 <- readtext("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/DACSS_FL21/DACSS_602_DefiningDystopia/602_DefDys_RProj/CLEANED-DefDys_Ebsco_Nov11_2953.csv")

summary(corpus(rTx_2953),1)
# Corpus consisting of 2958 documents and 86 docvars.

dim(rTx_2953)
# [1] 2958   88

rTX1_3772 <- readtext("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/DACSS_FL21/DACSS_602_DefiningDystopia/602_DefDys_RProj/DefDys_Ebsco_Nov11_3772.csv")

summary(corpus(rTX1_3772),1)
# Corpus consisting of 2958 documents and 86 docvars.

dim(rTX1_3772)
# [1] 3772   88


# Adding corpus objects together

corp1 <- corpus(rTX1_3772[1:20])
corp2 <- corpus(rTx_2953[1:20])
absCorp <- corp1 + corp2
summary(absCorp)

# Corpa of 6725 journal articles with wide search terms for "Dystopia+ and Utopia+"

# Import second corpa of curated reference documents 

rtx_DysRef <- readtext("C:/Users/white/iCloudDrive/Documents/1_DACSS_UMassAmherst/DACSS_FL21/DACSS_602_DefiningDystopia/602_Dystopia_Data/DefDys_Zotero/DefDys_Ref_Dec2csv.csv")

summary(corpus(rtx_DysRef),1)
dim(rtx_DysRef)
# [1]  50 257

refCorp <- corpus(rtx_DysRef[1:15])
summary(refCorp)

```