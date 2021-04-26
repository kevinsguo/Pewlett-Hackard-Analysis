# Pewlett-Hackard-Analysis

# Overview of the Analysis
The Analysis was performed to assist Bobby in find the the number of employees retiring at Pewlett Hackard, and help the company to gain an insight on how to prepare these roles once the employees retire. 

The main purpose of the analysis is to
  1. Determine the number of retiring employees per title in the company.
  2. Identify the employees whom are eligible to participate in the company's mentorship program.

# Results

## Points
1. 41,000+ opening spots in the company

![unique_title](unique_title.PNG)

2. The opening spots count for over 40% of the company's workforce

3. Management positions are not heavily impacted 

4. It is necessary for the HR team to fill in the missing positions as early as possible

- As we can see from the previous chart, there are going to be over 41,000 sports open once the employees retire in the company. This would potentially be a problem for the company, as the company would need its    HR team's best effort to fill in those spots and keep the management structure.  

# Summary
A new query was written with the following code to calculate the number of titles from the mentorship eligibility, and it appears the most heavilty affected positions are "Senior Staff" and "Engineers". Thus, is it crucial that the company and began looking into future replacement as early as possible, as engineering positions will need the necessary time to train and develop. 

SELECT 
  COUNT(title),title
FROM mentorship_eligibility
Group By title;



