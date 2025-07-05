-- Generate salary slips for June 2025
EXEC generate_salary_slip(DATE '2025-06-01');

-- View all generated salary slips
SELECT * FROM salary_slips;