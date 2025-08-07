# GLOBALTECH Population Analysis – Kenya Trade Brief


## 1 Project context

>**Purpose** – Provide reproducible SQL and concise insights to help the Government of Kenya identify diplomatic targets based on population trends.

The dataset consists of two tables:

| table | description | key fields |
|-------|-------------|------------|
| `countries` | one row per sovereign state / territory | `id`, `name`, `continent` |
| `population_years` | annual population **in millions of people** per country (2000 – 2010) | `id`, `country_id`, `year`, `population` |

> **Schema fix** – the original script declared `population` as `INTEGER`, truncating decimals.  
> I re-defined it as `FLOAT` (`ALTER TABLE … ALTER COLUMN population FLOAT;`) so values like `31.09956` retain precision (≈ 31 099 560 people).

---

## 2 Core answers requested by Kenya

| Question | SQL result | Interpretation |
|----------|------------|----------------|
| **Q-1 – Number of entries in the database from Africa**<br>`SELECT COUNT(*) …` on the _joined_ tables | **616** | 56 African countries × 11 years = 616 distinct population records. |
| **Q-2 – Total African population in 2010** | **1 015.478 46 million** | Africa crossed the **billion-person** mark by 2010. |
| **Q-3 – Average population of South-American countries in 2000** | **24.863 million** | A typical South-American nation began the decade just under 25 million people. |
| **Q-4 – Smallest population in 2007** | **Niue – 0.002 16 million** (≈ 2 160 people) | Niue is the micro-state with the lowest recorded population that year. |
| **Q-5 – Europe’s population growth % 2000 → 2010** | **-0.811 %** | Europe experienced a slight overall decline during the decade. |
---

## 3 Extra insights Kenya can act on

### 3.1 Top-10 absolute population growers, 2000 → 2010

| # | Country            | Growth (million) |
|---|--------------------|------------------|
| 1 | Nigeria            | **29.04** |
| 2 | Ethiopia           | 23.85 |
| 3 | Congo (Kinshasa)   | 19.07 |
| 4 | Egypt              | 15.31 |
| 5 | Sudan              | 9.83 |
| 6 | **Kenya**          | **9.54** |
| 7 | Uganda             | 9.44 |
| 8 | Tanzania           | 8.18 |
| 9 | Madagascar         | 5.54 |
|10 | Niger              | 4.93 |

> Markets with the largest head-count gains often see the fastest expansion in demand for staples, infrastructure and consumer goods.

---

### 3.2 Kenya’s 2010 ranking within Africa

| Rank | Country            | Population&nbsp;(million) |
|------|--------------------|---------------------------|
| 1 | Nigeria            | 152.22 |
| 2 | Ethiopia           | 88.01 |
| 3 | Egypt              | 80.47 |
| 4 | Congo (Kinshasa)   | 70.92 |
| 5 | South Africa       | 49.11 |
| 6 | Sudan              | 43.94 |
| 7 | Tanzania           | 41.89 |
| **8** | **Kenya**          | **40.05** |
| 9 | Algeria            | 34.59 |
|10 | Uganda             | 33.40 |

> Kenya is the **8-th most populous nation** on the continent—large enough to matter, but still eclipsed by big West- and North-African players.

---

### 3.3 Africa’s share of world population (2010)

| Continent      | 2010 Pop.&nbsp;(million) | % of World |
|----------------|--------------------------|------------|
| Asia           | 4 174.1 | 60.0 % |
| **Africa**     | **1 015.5** | **14.6 %** |
| Europe         | 740.1 | 10.6 % |
| North America  | 350.4 | 5.0 % |
| South America  | 387.3 | 5.6 % |
| Oceania        | 34.4  | 0.5 % |

> Africa already holds **one-seventh of humanity** and is the only megaregion still adding population at a rapid clip.

---

### 3.4 Continent CAGR\* 2000 – 2010  

| Continent | CAGR |
|-----------|------|
| Africa    | **+1.52 %** |
| Oceania   | +1.31 % |
| Asia      | +0.98 % |
| South America | +0.97 % |
| North America | +0.71 % |
| Europe    | −0.08 % |

\*Compound annual growth rate; positive numbers indicate annualised expansion, negative indicates shrinkage.

---

**Take-away:** Africa not only added the most people in absolute terms, it also posted the fastest proportional growth—reinforcing the continent’s importance for Kenya’s outward-looking trade strategy.

---

> _SQL for each insight (plus indexes) is available in this [**main.sql**](https://github.com/zaraanry/mini_project/blob/main/Global%20Population%20Analysis%20Project%20(SQL)/main.sql) file._
