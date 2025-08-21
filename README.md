Suicide Bombings in Pakistan – Data Analysis
📌 Overview

This project analyzes suicide bombing incidents in Pakistan using a dataset of recorded attacks. The goal is to identify patterns, trends, and insights from the data, such as the most affected provinces, cities, casualties, and time-based distributions.

The dataset includes details such as:

📅 Date & Year of incident

🏙 City & Province

📍 Location & Location category

🔥 Type of blast (Holiday vs Working Day)

🎯 Target type & Targeted sect (if any)

⚰️ Number killed (min & max)

🏥 Number injured (min & max)

💣 Suicide blast indicator

🏥 Hospital names (where available)

⚙️ Tech Stack

Database: PostgreSQL (pgAdmin for queries)

Language: SQL

Tools: Pandas & Python (for preprocessing/EDA, optional)

📊 Key Analysis Questions

Some of the SQL queries explored:

Basic Queries

Total number of blasts recorded.

Blasts per year.

Unique provinces and cities affected.

Casualty Analysis

Average number of people killed per city.

Total killed and injured per province.

Incidents with more than 50 injuries.

Blast Characteristics

Blasts on Holidays vs Working Days.

Open vs Closed space blasts.

Most common target types (e.g., Foreigner, Media, Religious).

Advanced Analysis

Top 3 provinces with most suicide blasts.

Year with highest casualties (Killed + Injured).

Ranking cities by number of blasts and total deaths.

Hospitals most frequently associated with incidents.
