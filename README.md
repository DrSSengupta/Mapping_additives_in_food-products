# Mapping-of-nutrients-food-additives-and-contaminants-in-plant-based-and-gluten-free-food-products-

## Authors
**Sagnik Sengupta**
Affiliation: Norwegian Scientific Committee for Food and Environment (VKM)

**Trine Husøy**
Affiliation: Norwegian Scientific Committee for Food and Environment (VKM), The Norwegian Institute of Public Health (FHI)

**Josef Daniel Rasinger**
Affiliation: The Norwegian Scientific Committee for Food and Environment (VKM), Institute of Marine Research (HI). 


## Description of data
This data set is linked to the following project/report of the Norwegian Scientific Committee (VKM): <https://vkm.no/english/riskassessments/allpublications/mappingthenutrientsfoodadditivesandcontaminantsfoundinplantbasedandglutenfreefoodproducts.4.2b25ffa41862c540f3370f7b.html>.  
The present dataset and code demonstrates how the data on additives present in meat products and plant-based meat analogue products were presented in the report.

## Contents

### Folder: "data"

**File: meat_and_analogues.xlsx**

This file contains only one sheet ("Sheet 1").  

Columns:
- Identifier: This column contains the unique ID for each product included in this report. Meat products have identifiers starting with "M" and are followed by digits. Plant-based meat analogue products have identifiers starting with "MA" and are followed by digits.
- Product type: Specified as in Table 3.3.3.1-1 of the report.
- E number: E numbers identify each food additive.
- Category: Type of food additive  

Rows:  
  
Each row in the data file represents one additive. Thus, the data for each product containing multiple additives spreads across the same number of rows as the number of additives it contains. Products containing no additives are represented by a single row with no entries under the columns "E number" and "Category". 

Remarks:  

"E number" and "Category" has been prepared according to Codex Alimentarius (2021); see Section 6 (Appendix 1) of the report for further details.  

Products that lacked information on additives are not included in the present dataset but are inlcuded in the summary presented in Table 3.3.3.1-1.  


### Folder: "scripts"

**File: additives.Rmd**  
This file contains the R code for preparing the upset plot in Figure 3.3.3.1-2. The codes for preparing data on the occurrence of each additive in the different protuct types are also included.
  
  
### Folder: "output"

**File: meat_and_analogues.png**  

This is the upset plot prepared using the code in the "scripts" folder and shown as Figure 3.3.3.1-2 in the report.

**File: additives_in_meat.xlsx**  

An example of a data file exported from R. The columns "E number and "Category" are defined as in the data file "meat_and_analogues.xlsx*" The other columns are named by the product types. For each product type, 1 indicates the presence and 0 indicates the absence of the corresponding food additive under the column "E number".

**File: additives_in_meatanalogs.xlsx**  

An example of data files exported from R. The columns "E number and "Category" are defined as mentioned for the data file "meat_and_analogues.xlsx*" The other columns are named by the product types. For each product type, 1 indicates the presence and 0 indicates the absence of the corresponding food additive under the column "E number".

**File: processed_additives_in_meat.xlsx**  

This file demonstrates how the output from R ("additives_in_meat.xlsx") was handled in Excel to prepare Table 3.3.3.1-3.  

- Sheet: "exported_from_R": Contains the R output.
- Sheet 2: Pivot table function was used to calculate the number of products (of each product type) that contains a specific food additive. The resulting "raw" table is seen uppermost in this sheet.Further below the table was reformatted to retain the required values. Samples sizes for each product type were obtained  from the report (Table 3.3.3.1-1). Thereafter, in the table marked with the text (red fonts), "Contents of Table 3.3.3.1-3 calculated below", we calculate the percantage of products (within a product type) that contains each of the food additives. 

**File: processed_additives_in_meatanalogs.xlsx**  

This file demonstrates how the output from R ("additives_in_meatanalogs.xlsx") was handled in Excel to prepare Table 3.3.3.1-2.  

- Sheet: "exported_from_R": Contains the R output.  
- Sheet 2: Pivot table function was used to calculate the number of products (of each product type) that contains a specific food additive. The resulting "raw" table is seen uppermost in this sheet. Further below the table was reformatted to retain the required values. Samples sizes for each product type were obtained  from the report (Table 3.3.3.1-1). Thereafter, in the table marked with the text,  "Contents of Table 3.3.3.1-2 calculated below" (red fonts), we calculate the percentage of products (within a product type) that contains each of the food additives.

## Other files

**File: README.md** (this file)  

This is the metadata file describing the contents of the project.

**File: Mapping_additives_in_food_products.Rproj**  

R project file

The remaining are auxilliary files for setting up a GitHub project.
