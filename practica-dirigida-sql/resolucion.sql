```
/* Ejercicio 1: Muestre el nombre, fecha de contratación, salario, nombre de departamento y 
   nombre del rol de todos los empleados cuyo salario se encuentre en el intervalo [4500, 15000>. */
```

select e.first_name, e.hire_date, e.salary, d.department_name, j.job_title
from employees e 
inner join departments d
on e.department_id = d.department_id
inner join jobs j
on e.job_id = j.job_id
where (e.salary >= 4500 and e.salary < 15000)


/* Ejercicio 2: Muestre el código de empleado, el nombre del empleado y el país 
   donde laboran aquellos empleados que desempeñen el rol de Contador (Accountant). */

select e.employee_id, e.first_name, c.country_name
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id
inner join countries c
on l.country_id = c.country_id
inner join jobs j
on e.job_id = j.job_id
where j.job_title = 'Accountant'


/*  Ejercicio 3: Muestre las tuplas correspondientes a todos los empleados que se encuentran en la 
    oficina (location) de Ciudad de México (Mexico City) o trabajan en Estados Unidos (United States). */

select e.employee_id, e.first_name, e.last_name, l.city, c.country_name
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id
inner join countries c
on l.country_id = c.country_id
where l.city = 'Mexico City'
or c.country_name = 'United States of America'


/* Ejercicio 4: Muestre las tuplas correspondientes a todos los empleados 
   del área de ventas que se encuentren laborando en Reino Unido (United Kingdom). */

select e.employee_id, e.first_name, e.last_name, d.department_name, c.country_name
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id
inner join countries c
on l.country_id = c.country_id
where d.department_name = 'Sales'
and c.country_name = 'United Kingdom'


/* Ejercicio 5: Muestre los datos de nombre y apellido de todos los empleados que se 
   encuentren en la región “Americas” y tengan un salario menor que el promedio de su rol. */

select e.first_name, e.last_name
from employees e, departments d, locations l, countries c, regions r,
(select e.job_id,
avg(e.salary) avg_sal
from employees e
group by e.job_id) sal
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
and sal.job_id = e.job_id
and r.region_name = 'Americas'
and e.salary < sal.avg_sal


/* Ejercicio 6: Muestre los datos de región, país y la cantidad de empleados por cada país. 
   Dicho reporte debe considerar solamente aquellos países que tengan más de 3 empleados registrados. */


