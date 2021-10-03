-- 멀티카드 top3 & 찜한 멀티카드 혜택 대조
create or replace procedure calculate_multi_benefit
    (p_member_id in number, p_start in varchar, p_end in varchar, p_pay_total in out number, p_multi_id_list in varchar, p_result_cursor in out sys_refcursor)
is
begin

    --p_start ~ p_end 까지 업종 2차별 소비 합계 저장
    insert into trans_temp(work_sector2_code, work_sector1_code, trans_at, pay_total)
     select t.work_sector2_code, t.work_sector1_code, to_char(trans_at, 'yyyy-mm') as trans_at, sum(trans_balance) as trans_balance
    from p_trans t
    where t.member_card_id = (select min(member_Card_id) from p_member_card where member_id = p_member_id)
        and to_char(trans_at, 'yyyy-mm') >= p_start and to_char(trans_at, 'yyyy-mm') <= p_end
    group by to_char(trans_at, 'yyyy-mm'), work_sector1_code, work_sector2_code
    order by work_sector2_code, trans_at;

    

    -- p_multi_id_list = 0 : 모든 멀티카드 혜택 조회
    if trim(p_multi_id_list) = '0' then
        --p_multi_id_list에 해당하는 멀티카드 조회
        for multi in    (select card_id from p_card where card_type_code = '005' and card_id > 0)
        loop
            insert into benefit_temp(card_id, card_name, card_info, card_image_url, benefit_name, work_sector1_code, 
                    work_sector2_code, benefit_code, work_sector1_name, work_sector2_name, benefit_total, pay_total)
            
            select c.card_id, c.card_name, c.card_info, c.card_image_url, cb.benefit_name, cb.work_sector1_code, cb.work_sector2_code
                    , cb.benefit_code, (select work_sector1_name from p_work_sector1 where work_sector1_code = cb.work_sector1_code) as work_sector1_name
                    , (select work_sector2_name from p_work_sector2 where work_sector2_code = cb.work_sector2_code) as work_sector2_name, benefit_total, pay_total
            from
                (select  min(cb.card_id) as card_id, min(cb.benefit_name) as benefit_name, min(cb.benefit_info) as benefit_info
                        , min(cb.benefit_code) as benefit_code, min(t.work_sector1_code) as work_sector1_code, t.work_sector2_code, sum(t.pay_total) as trans_balance, 
                        sum(case when (t.pay_total * (to_number(cb.benefit_info) / 100)) > cb.limit then cb.limit
                             else (t.pay_total * (to_number(cb.benefit_info) / 100))
                        end) as benefit_total, sum(t.pay_total) as pay_total
                from    trans_temp t,
                        (select * from p_card_benefit where card_id = multi.card_id) cb
                where t.work_sector2_code = cb.work_sector2_code
                group by t.work_sector2_code) cb
                , p_card c
            where cb.card_id = c.card_id;
        end loop;     
        
    -- 찜한 멀티카드 혜택 조회
    else 
        for multi in    (select regexp_substr(p_multi_id_list, '[^,]+', 1, LEVEL) as card_id
                        from    dual
                        connect by level <= length(regexp_replace(p_multi_id_list, '[^,]+', '')) + 1)
        loop
            --calculate_benefit_detail(p_member_id, multi.card_id, p_start, p_end);
            insert into benefit_temp(card_id, card_name, card_info, card_image_url, benefit_name, work_sector1_code, 
                    work_sector2_code, benefit_code, work_sector1_name, work_sector2_name, benefit_total, pay_total)
            
            select c.card_id, c.card_name, c.card_info, c.card_image_url, cb.benefit_name, cb.work_sector1_code, cb.work_sector2_code
                    , cb.benefit_code, (select work_sector1_name from p_work_sector1 where work_sector1_code = cb.work_sector1_code) as work_sector1_name
                    , (select work_sector2_name from p_work_sector2 where work_sector2_code = cb.work_sector2_code) as work_sector2_name, benefit_total, pay_total
            from
                (select  min(cb.card_id) as card_id, min(cb.benefit_name) as benefit_name, min(cb.benefit_info) as benefit_info
                        , min(cb.benefit_code) as benefit_code, min(t.work_sector1_code) as work_sector1_code, t.work_sector2_code, sum(t.pay_total) as trans_balance, 
                        sum(case when (t.pay_total * (to_number(cb.benefit_info) / 100)) > cb.limit then cb.limit
                             else (t.pay_total * (to_number(cb.benefit_info) / 100))
                        end) as benefit_total, sum(t.pay_total) as pay_total
                from    trans_temp t,
                        (select * from p_card_benefit where card_id = multi.card_id) cb
                where t.work_sector2_code = cb.work_sector2_code
                group by t.work_sector2_code) cb
                , p_card c
            where cb.card_id = c.card_id;
        end loop;       
    end if; 



    -- 해당 기간 동안 소비 합계 return
    select sum(pay_total) into p_pay_total
    from trans_temp;
--    where member_card_id in (select member_card_id from p_member_card where member_id = p_member_id)
--        and to_char(trans_at, 'yyyy-mm') >= p_start and to_char(trans_at, 'yyyy-mm') <= p_end;

    OPEN p_result_cursor FOR
    select *
    from benefit_temp 
    order by card_id, benefit_name, benefit_total desc;

exception
    when others then
        dbms_output.put_line(sqlerrm);
        WRITE_LOG('CALCULATE_MULTI_BENEFIT', SUBSTR(SQLERRM,1,100));
        rollback;
end;
/
