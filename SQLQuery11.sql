USE SEDC_ACADEMY_HOMEWORK

--dolnovo bese lesno samo slectnuvas i filtriras
	SELECT * FROM Student
WHERE FirstName = 'Antonio';
--tuka imav idea kako ama pisav na google za tocnata sintaksa
SELECT * FROM Student
WHERE DateOfBirth > '1999-01-01';
--tuka prvo filteras out sto pocnuvaat na J posle filternuvas enrollment
SELECT * FROM Student
WHERE LastName LIKE 'J%'
--tuka prvata sintaksa e deka od 1998-01-01 ili pogolemo ili isti datum i posle dodavam uste eden uslov deka samo lugjto pred prvi februari ama nejke dali ova e do mene?
  AND EnrolledDate >= '1998-01-01'
  AND EnrolledDate <  '1998-02-01';
  --ova bese lesno ako sakas da gi filternes desc kje bide vaka [ SELECT * FROM students    ORDER BY FirstName DESC; ]

  SELECT * FROM Student
ORDER BY FirstName;
--union brise duplikati pisav na google sto brise duplikati
SELECT LastName FROM Teacher
UNION
SELECT LastName FROM Student;
---tuka ova ne go svativ so foreign key ako mozete nekako da mi go objasnite 
ALTER TABLE Course
ADD TeacherID INT NULL;
--nad ovoj comment go menjavame course i dodaveme teacher id
--i tuka pak go menjavame ama sega dodavame foreign key koj sto go dobivame od teacher id koj sto kje bide teacher id vo course iako e teachers tabela
ALTER TABLE Course
ADD CONSTRAINT FK_Course_Teacher FOREIGN KEY (TeacherID)
REFERENCES Teacher(ID);

--listame site combinacii za imainja na kursovite i za nivnite diplomi ili kako kje mu se padne 
SELECT Course.[Name] AS CourseName, AchievementType.[Name] AS AchievementTypeName
FROM Course, AchievementType;

--tuka with * selectiras sve 
SELECT Teacher.*
FROM Teacher
--left joinama dvete tabeli 
--za da dobieme grade id, i tamu kaj sto nemaat id gi listame
LEFT JOIN Grade ON Teacher.ID = Grade.TeacherID
WHERE Grade.ID IS NULL;

