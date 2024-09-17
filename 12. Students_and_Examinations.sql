--Students and Examinations
with student_subject as (
    select s.student_id, s.student_name, su.subject_name
    from students s inner join subjects su on (1=1) 
    )
select ss.student_id, ss.student_name, ss.subject_name, count(e.subject_name) attended_exams 
from student_subject ss left join examinations e on (ss.student_id = e.student_id and ss.subject_name = e.subject_name)
group by ss.student_id, ss.student_name, ss.subject_name
order by ss.student_id, ss.subject_name
