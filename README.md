# Mapping-of-nutrients-food-additives-and-contaminants-in-plant-based-and-gluten-free-food-products-

## Description of data
This data set is linked to the following project/report of the Norwegian Scientific Committee (VKM): <https://vkm.no/english/riskassessments/allpublications/mappingthenutrientsfoodadditivesandcontaminantsfoundinplantbasedandglutenfreefoodproducts.4.2b25ffa41862c540f3370f7b.html>
The present dataset and code demonstrates how the data on additives present in meat products and plant-based meat analogue products were presented in the report.

## Contents

### Folder: "data"

-File: "meat_and_analogues.xlsx"

--This file contains only one sheet ("Shhet 1"") with a dataset of 480 rows and 4 columns.
  Columns:
      "Identifier". This is the unique ID for a product included in this                       report. Meat products has identifiers starting with "M"                     and followed by digits. Plant-based meat analogue                          products have identifiers starting with "MA" and                           followed by digits.
----"Product type". Specified as in Table 3.3.3.1-1 of the report.
---- "E number": E numbers identify each food additive.
----"Category": Type of food additive
--Rows:
----Each row in the data file represents one additive. Thus, the data for each product containing multiple additives spreads across the same number of rows as the number of additives it contains.
--Remarks: 
--- "E number" and "Category" has been prepared according to Codex Alimentarius (2021); see Section 6 (Appendix 1) of the report for further details.
--- Products that lacked information on additives are not included in this dataset but listed in Table 3.3.3.1-1.
--- Products with blansks (NA) under "E number" contain no additives.


### Folder: "scripts"

- File: "additives.Rmd"
--This file contains the R code for reproducing the upset plot in Figure 3.3.3.1-2.

### Folder: "output"

-File: "meat_and_analogues.png"
--Thisis the upset plot prepared using the code in the "scripts" folder and shown as Figure 3.3.3.1-2 in the report.

- File: "additives_in_meat.xlsx"
--Examples of data files exported from R. The columns are named by the product types.For each product type, 1 indicates the presence of a food additive and 0 indicates absence.

- File: "additives_in_meatanalogs.xlsx"
--Examples of data files exported from R. The columns are named by the product types.For each product type, 1 indicates the presence of a food additive and 0 indicates absence.

- File: "processed_additives_in_meat.xlsx"
--This file demonstrates how the output from R ("additives_in_meat.xlsx") was handled in excel to prepare Table 3.3.3.1-2.
--Sheet: "exported_from_R": Contains the R output
--Sheet 2: Pivot table function was used to calculate the number of products (of each product type) that contains a specific food additive. The resulting "raw" table is seen uppermost in this sheet.Further below the table was reformatted to retain the required values. Samples sizes for each product type were copied in from the report (Table 3.3.3.1-1). Thereafter, in the table marked with the text (red fonts) "Contents of Table 3.3.3.1-3 calculated below" we calculate the percantage of products (within a product type) that contains each of the food additives. 

- File: "processed_additives_in_meatanalogs.xlsx"
--This file demonstrates how the outpur from R ("additives_in_meatanalogs.xlsx") was handled in excel to prepare Table 3.3.3.1-3.
--Sheet: "exported_from_R": Contains the R output.
--Sheet 2: Pivot table function was used to calculate the number of products (of each product type) that contains a specific food additive. The resulting "raw" table is seen uppermost in this sheet.Further below the table was reformatted to retain the required values. Samples sizes for each product type were copied in from the report (Table 3.3.3.1-1). Thereafter, in the table marked with the text (red fonts) "Contents of Table 3.3.3.1-2 calculated below" we calculate the percantage of products (within a product type) that contains each of the food additives.

## Other files

- File: "README.md" (this file)
-- This is the metadatafile describing the contents of the project.

- File: "Mapping_additives_in_food_products.Rproj" (R project file)
-Auxilliary files for setting up a GitHub project.