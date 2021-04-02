-- Use Dictinct with Orderby to remove duplicate rows
SELECT
em.emp_no,
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date

INTO retirement_titles
FROM employees as em 
LEFT JOIN titles as ti
ON ti.emp_no = em.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

select * from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

select * from unique_titles

-- Retrieve # of employees, by title, who are about to retire
SELECT count(first_name),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(first_name) DESC;

SELECT DISTINCT ON (em.emp_no)
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as em 
LEFT JOIN dept_emp as de
ON em.emp_no = de.emp_no
LEFT JOIN titles as ti
ON ti.emp_no = em.emp_no

WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no ASC;


select * from mentorship_eligibility