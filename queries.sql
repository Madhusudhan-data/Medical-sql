select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;

-- 1. Show first name, last name, and gender of patients whose gender is 'M'
select first_name,last_name,gender from patients
where gender='M';
-- 2. Show first name and last name of patients who do not have allergies
select first_name,last_name from patients
where allergies is Null;
-- 3. Show first name of patients that start with the letter 'C'
select first_name from patients
where first_name like 'C%';

-- 4. Show first name and last name of patients whose weight is between 100 and 120
select first_name,last_name from patients
where weight between 100 and 120;

-- 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
-- update patients
-- set allergies = 'NKA'
-- where allergies IS NULL;

-- 6. Show first name and last name concatenated into one column to show their full name
select concat(first_name,'',last_name) as full_name from patients;

-- 7. Show first name, last name, and the full province name of each patient.
select p.first_name, p.last_name,pn.province_name from patients p
join province_names pn on p.province_id=pn.province_id;

-- 8. Show how many patients have a birth_date with 2010 as the birth year
Select count(*) from  patients
where birth_date like '2010%';

-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name,last_name,height from patients
where height=(select max(height) from patients);

-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients
where patient_id in (1,45,534,879,1000);

-- 11. Show the total number of admissions
select count(*) from admissions;

-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions
where admission_date=discharge_date;

-- 13. Show the total number of admissions for patient_id 579.
select count(*) from admissions
where patient_id=579;

-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select distinct city from patients
where province_id='NS';

-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70.
select first_name,last_name,birth_date from patients
where height>160 and weight>70;

-- 16. Show unique birth years from patients and order them by ascending.
select DISTINCT year(birth_date) as birth_year from patients
order by birth_year ASC;

-- 17. Show unique first names from the patients table which only occurs once in the list.
select first_name from patients
group by first_name
having count(first_name)=1;

-- 18. Show patient_id and first_name from patients where their first_name starts and ends with 's' and is at least 6 characters long.
select patient_id,first_name from patients
where first_name like 's%s' and length(first_name)>=6;

-- 19. Show patient_id, first_name, last_name from patients whose diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table
select p.patient_id,p.first_name,p.last_name from patients p
join admissions a on a.patient_id=p.patient_id
where a.diagnosis='Dementia';

-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
select first_name from patients
order by length(first_name) ASC,first_name ASC;

-- 21 & 22. Show the total number of male patients and the total number of female patients in the patients table. Display the two results in the same row.
SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS total_male,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS total_female
FROM patients;

-- 23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
SELECT patient_id, diagnosis 
FROM admissions 
GROUP BY patient_id, diagnosis 
HAVING COUNT(*) > 1;

-- 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
SELECT city, COUNT(*) AS total_patients 
FROM patients 
GROUP BY city 
ORDER BY total_patients DESC, city ASC;

-- 25. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"
SELECT first_name, last_name, 'Patient' AS role FROM patients
UNION
SELECT first_name, last_name, 'Doctor' AS role FROM doctors;

-- 26. Show all allergies ordered by popularity. Remove NULL values from the query.
SELECT allergies, COUNT(*) AS popularity 
FROM patients 
WHERE allergies IS NOT NULL AND allergies != '' 
GROUP BY allergies 
ORDER BY popularity DESC;

-- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
SELECT first_name, last_name, birth_date 
FROM patients 
WHERE YEAR(birth_date) BETWEEN 1970 AND 1979 
ORDER BY birth_date ASC;

-- 28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in descending order EX: SMITH,jane
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS formatted_name 
FROM patients 
ORDER BY first_name DESC;

-- 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
SELECT province_id, SUM(height) AS total_height 
FROM patients 
GROUP BY province_id 
HAVING SUM(height) >= 7000;

-- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT (MAX(weight) - MIN(weight)) AS weight_difference 
FROM patients 
WHERE last_name = 'Maroni';

-- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
SELECT DAY(admission_date) AS day_of_month, COUNT(*) AS total_admissions 
FROM admissions 
GROUP BY day_of_month 
ORDER BY total_admissions DESC;

-- 32. Show all of the patients grouped into weight groups. Show the total number of patients in each weight group. Order the list by the weight group descending. e.g. if they weigh 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
SELECT FLOOR(weight / 10) * 10 AS weight_group, COUNT(*) AS total_patients 
FROM patients 
GROUP BY weight_group 
ORDER BY weight_group DESC;

-- 33. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m)^2). Weight is in units kg. Height is in units cm.
SELECT patient_id, weight, height, 
       CASE WHEN (weight / POWER(height / 100.0, 2)) >= 30 THEN 1 ELSE 0 END AS isObese 
FROM patients;

-- 34. Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. Check patients, admissions, and doctors tables for required information.
SELECT p.patient_id, p.first_name, p.last_name, d.specialty 
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';

-- 35. All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password. The password must be the following, in order: patient_id, numerical length of patient's last_name, year of patient's birth_date
SELECT DISTINCT p.patient_id, 
       CONCAT(p.patient_id, LENGTH(p.last_name), YEAR(p.birth_date)) AS temp_password
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id;