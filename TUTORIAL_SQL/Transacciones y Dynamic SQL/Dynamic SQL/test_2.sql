SELECT * 
FROM ALL_TAB_COLUMNS 
WHERE TABLE_NAME = 'TBL_CANDIDATO' ;


select column_name, data_type||
case
when data_precision is not null and nvl(data_scale,0)>0 then '('||data_precision||','||data_scale||')'
when data_precision is not null and nvl(data_scale,0)=0 then '('||data_precision||')'
when data_precision is null and data_scale is not null then '(*,'||data_scale||')'
when char_length>0 then '('||char_length|| case char_used 
                                                         when 'B' then ' Byte'
                                                         when 'C' then ' Char'
                                                         else null 
                                           end||')'
end||decode(nullable, 'N', ' NOT NULL')
from user_tab_columns
where table_name = 'TBL_CANDIDATO'
and column_name = 'IDCANDIDATO';


select data_type || '(' || data_length || ')' 
from user_tab_columns where TABLE_NAME = 'TBL_CANDIDATO'