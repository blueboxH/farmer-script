select u1.id,fd.id as task_id,u1.file_name,u1.file_path,u1.file_size,u1.file_format,fd.price,fd.miner_id,fd.deal_cid,fd.data_cid,fd.deal_date,fd.deal_state,fd.deal_size_in_bytes,fd.transfer_status,fd.progressing from (select t.id,t.file_name,t.file_path,t.file_size,f.file_format from temp_file_index as t left join file_index as f on t.file_id = f.id where f.slice > 0 UNION select id,file_name,file_path,file_size,file_format from file_index where slice = 0) as u1 LEFT JOIN file_deal as fd ON fd.file_id = u1.id