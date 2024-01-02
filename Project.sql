use assignments;
select * from f1;
select * from f2;

# Year Wise Loan Status
SELECT Year,concat("Rs.",sum(loan_amnt) )as Loan_Amount,loan_status from f1 
group by Year,loan_status order by year;

# Grade Wise and Sub_grade Wise Revol_Bal
select f1.grade,f1.sub_grade,concat("Rs.",sum(f2.revol_bal)) as Revol_Bal from f1 left join f2 using (id)
group by f1.grade,f1.sub_grade order by f1.grade;

#Total Payment for verified status vs Total Payment for non verified status
select f1.verification_status,concat("Rs.",round(sum(f2.total_pymnt))) as Total_Payment from f1 join f2 using (id) 
where f1.verification_status in ('Verified' ,'Not Verified')
group by f1.verification_status;

# State Wise, Month Wise Loan Status
select addr_state as State,Month,concat("Rs.",sum(loan_amnt)) As Loan_Amount,loan_status from f1 
group by State,Month,loan_status order by State,Month ;

# House Ownership vs Last Payment Date Stats
select f1.home_ownership,count(f2.last_pymnt_d) as Last_Payment_Stats 
from f1 join f2 using (id) group by f1.home_ownership;

