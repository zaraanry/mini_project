# AdventureWorks 2019

  

This repository contains an interim analytics project using the **AdventureWorks2019** dataset to uncover actionable business insights with **SQL** and **Python**. It explores sales concentration, employee leave patterns, and store performance drivers across several focused questions.

  

>  **Project dates:** Analysis completed 17 July 2025; presented 21 July 2025.
---  

  
**Quick links:** [Presentation (PDF)](https://github.com/zaraanry/mini_project/blob/main/Adventure%20Works%202019/Presentation.pdf) • [Full Report (PDF)](https://github.com/zaraanry/mini_project/blob/main/Adventure%20Works%202019/Interim%20Project.pdf)

---
  
## Key Insights

  

-  **Regional sales (USA):** Southwest is the top region ($27.15M); Northeast is lowest ($7.82M). Three states, California, Washington, Texas, contribute 55% of US revenue.

-  **Vacation vs. bonus:** No meaningful relationship (r = 0.041) across 17 sales staff; taking leave does not harm bonus outcomes.

-  **Country vs. revenue:**  USA + Canada = 72.5% of global revenue. Australia ranks third on total revenue but last on average revenue per customer.

-  **Sick leave patterns:** Production has the highest total hours (driven by large headcount). Shipping & Receiving shows the highest average hours per employee; Engineering the lowest. CEOs average 69 hours; CFO/VP Eng 20 hours.

-  **Store trading duration vs. revenue:** Moderate positive link (r = 0.41). Stores trading 32–34 months exceed $0.30M each; some 8–22‑month stores already pass $0.10M.

-  **Store size & staffing vs. revenue:** Size and employee count are tightly linked (r = 0.97), but both have weak relationships with revenue. Large stores average $192k, small $172k, while medium stores lag at $53k on average.



---  

## Objectives

  

1. Identify where sales are concentrated within the best‑performing country.

2. Test whether employee vacation affects bonus outcomes.

3. Compare total vs. per‑customer revenue across countries.

4. Analyse sick‑leave patterns by department, job title, person type, and shift.

5. Examine the impact of trading duration on store revenue.

6. Understand how store size and team size relate to revenue.

  

---

  

## Tech Stack

  

-  **Database:** [AdventureWorks2019](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak)

-  **Languages:** SQL, Python (3.9+)

-  **Python libs:** pandas, numpy, matplotlib, seaborn, plotly

-  **Tools (suggested):** Jupyter Notebooks or VS Code

  

---

  

##  Recommendations

  

- Focus marketing in California, Washington, Texas to lift revenue fastest; diagnose under‑performing territories.

- Maintain a flexible leave policy; no penalty to bonuses observed.

- Pilot wellness/ergonomic programs; address night‑shift risks; monitor high‑leave departments.

-  Profile rising‑star stores (20–22 months) and build a playbook to speed new‑store ramp‑up.

-  Audit older underperformers (>30 months) for assortment, location, and management issues.

-  Review medium‑sized stores; require stronger business cases (≥30% above current average).

  
