USE DBSlide
--Exercice 2.6.1 – Donner pour chaque cours le nom du professeur responsable ainsi que la section dont le professeur fait partie 
		SELECT course_name, professor_name, section_name
		FROM professor p
		JOIN course c
		ON p.professor_id= c.professor_id
		JOIN section s
		ON p.section_id = s.section_id
		SELECT course_name, professor_name, section_name
		FROM (professor p INNER JOIN section ON p.section_id=section.section_id)
		JOIN course c
		ON p.professor_id= c.professor_id
		SELECT course_name, professor_name, section_name
		FROM professor p, course c, section s
		Where p.professor_id= c.professor_id AND p.section_id=s.section_id

--Exercice 2.6.2 – Donner pour chaque section, l’id, le nom et le nom de son délégué. Classer les sections dans l’ordre inverse des id de section. Un délégué est un étudiant de la table « STUDENT »

		SELECT se.section_id, s.last_name, se.section_name
		FROM student s, section se
		WHERE s.student_id=se.delegate_id
		ORDER BY s.section_id DESC
		SELECT se.section_id, s.last_name, se.section_name
		FROM student s JOIN section se
		ON s.student_id=se.delegate_id
		ORDER BY s.section_id DESC

--Exercice 2.6.3 – Donner pour chaque section, le nom des professeurs qui en sont membre 
  
  SELECT s.section_id, s.section_name,
  p.professor_name
  FROM section s LEFT JOIN professor p
  ON s.section_id= p.section_id
   
--Exercice 2.6.4 – Même objectif que la question 3 mais seuls les sections comportant au moins un professeur doivent être reprises 
SELECT s.section_id, s.section_name,
  p.professor_name
  FROM section s LEFT JOIN professor p
  ON s.section_id= p.section_id
  WHERE p.professor_name IS NOT NULL
SELECT s.section_id, s.section_name,
  p.professor_name
  FROM section s  JOIN professor p
  ON s.section_id= p.section_id

--Exercice 2.6.5 – Donner à chaque étudiant ayant obtenu un résultat annuel supérieur ou égal à 12 son grade en fonction de son résultat annuel et sur base de la table grade. La liste doit être classée dans l’ordre alphabétique des grades attribués 

  SELECT s.first_name, g.grade
  FROM student s , grade g
  Where
  (s.year_result between g.lower_bound
  AND g.upper_bound) -- pour la jointure
  AND s.year_result >=12
  ORDER BY g.grade

    SELECT s.first_name, g.grade
  FROM student s , grade g
  Where s.year_result >=12 AND
  (s.year_result between g.lower_bound
  AND g.upper_bound) -- pour la jointure
   
  ORDER BY g.grade


--Exercice 2.6.6 – Donner la liste des professeurs et la section à laquelle ils se rapportent ainsi que le(s) cour(s) (nom du cours et crédits) dont le professeur est responsable. La liste est triée par ordre décroissant des crédits attribués à un cours 
   SELECT professor_name, section_name,
   course_name, course_ects
   FROM section s
   RIGHT JOIN
   professor p
   ON s.section_id = p.section_id
    LEFT JOIN
   course c
   ON c.professor_id = p.professor_id
   ORDER BY course_ects DESC




 
--Exercice 2.6.7 – Donner pour chaque professeur son id et le total des crédits ECTS (« ECTS_TOT ») qui lui sont attribués. La liste proposée est triée par ordre décroissant de la somme des crédits alloués 
SELECT p.professor_id, SUM(course_ects) as 'Total'
FROM professor p
LEFT JOIN 
course c
ON p.professor_id=c.professor_id
GROUP BY p.professor_id
ORDER BY 'Total' DESC
--ORDER BY  SUM(course_ects) DESC

--Version : le formateur se lâche
SELECT p.professor_id, COALESCE(CONVERT(NVARCHAR,SUM(course_ects) ), 'Pas d''information')as 'Total'
FROM professor p
LEFT JOIN 
course c
ON p.professor_id=c.professor_id
GROUP BY p.professor_id
ORDER BY 'Total' DESC



--Exercice 2.6.8 – Donner la liste (nom et prénom) de l’ensemble des professeurs et des étudiants dont le nom est composé de plus de 8 lettres. Ajouter une colonne pour préciser la catégorie (S pour « STUDENT », P pour « PROFESSOR ») à laquelle appartient l’individu 

 
Select first_name, last_name, 'S' as [Catégorie]
FROM student
WHERE LEN(last_name) > 8
UNION
Select professor_name , professor_surname, 'P' as [Categorie]
FROM professor
WHERE LEN(professor_name) > 8

 
--Exercice 2.6.9 – Donner l’id de chacune des sections qui n’ont pas de professeur attitré 
SELECT section.section_id
FROM section
LEFT JOIN professor
ON section.section_id= professor.section_id
WHERE professor.section_id IS NULL

SELECT Section_ID
FROM section
EXCEPT
SELECT Section_id
FROM professor

