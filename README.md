# Motorcycle Crash Injury Severity Analysis  

## Project Overview  
This project analyzes motorcycle crash injury severity using ordered response models (Ordered Logit and Ordered Probit).  
The objective is to identify key roadway, environmental, driver, and vehicle factors influencing injury severity and to compare model performance across different specifications.  

This work was completed as part of **CE687: Transportation Analytics and Modeling** coursework at **IIT Kanpur**.  

---

## Dataset  
The dataset used is the **Michigan Motorcycle Non-Intersection Crash Subset** with features including:  
- Crash context: Road type, lanes, speed limit, lighting conditions, wet road, etc.  
- Driver characteristics: Age, alcohol use, young driver indicator.  
- Vehicle involvement: Single vs. multiple vehicles, parked vehicle, pedestrian involvement.  
- Outcome variable: Injury severity (No Injury, Minor Injury, Severe/Fatal).  

---

## Methodology  
1. **Data Preparation**  
   - Cleaned and standardized raw crash records for consistency.  
   - Encoded categorical attributes (e.g., road type, lighting condition) into model-ready factors.  
   - Generated indicator variables (Wet Road, Young Driver, Single Vehicle) for better model interpretation.  
   - Checked distributions, missing values, and ensured balanced representation of severity levels.  

2. **Modeling**  
   - Developed Ordered Probit and Ordered Logit models in R.  
   - Estimated baseline models (limited predictors) and extended models (with engineered variables).  

3. **Evaluation**  
   - Conducted likelihood ratio tests and correlation analysis.  
   - Compared models using:  
     - Log-Likelihood  
     - AIC, BIC  
     - McFadden’s pseudo-R²  
   - Interpreted marginal effects of explanatory variables on injury severity.  

---

## Results  
- Extended models outperformed baseline models with improved fit statistics (higher pseudo-R², lower AIC/BIC).  
- Key significant factors affecting injury severity:  
  - Wet Road conditions increased likelihood of severe injuries.  
  - Young Drivers had higher probability of severe/fatal outcomes.  
  - Single-Vehicle crashes were more severe compared to multi-vehicle crashes.  

---

## Technologies Used  
- **R Programming**  
  - Packages: `mlogit`, `MASS`, `truncnorm`, `tidyverse`, `dplyr`, `ggplot2`  

---

## Learning Outcomes  
- Hands-on experience with Ordered Response Models (Logit & Probit).  
- Application of feature engineering, diagnostics, and model evaluation in crash data.  
- Gained insights into transportation safety analysis and policy implications for motorcyclist safety.  

---

## Repository Structure  
├── data/
│ └── Michigan_Motorcycle_Non_Intersection_Data_Subset.csv
├── scripts/
│ └── analysis.R
├── report/
│ └── CE687_Assignment_2_Report.pdf
└── README.md


---

## Acknowledgement  
This project was carried out under the guidance of **Dr. Aditya Medury**, Department of Civil Engineering, IIT Kanpur.  
