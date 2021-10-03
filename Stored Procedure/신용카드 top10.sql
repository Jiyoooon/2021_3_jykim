-- 신용카드 top10
create or replace procedure calculate_credit_top10_benefit
    (p_member_id in number, p_start in varchar, p_end in varchar, p_pay_total in out number, p_benefit_type in number, p_result_cursor in out sys_refcursor)
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
    
    --모든 신용카드 조회
    for card in (select card_id from p_card where card_type_code = '001')
    loop
         -- 해당 카드의 업종별 혜택 정보
        if p_benefit_type = 0 then
            insert into benefit_temp(card_id, card_name, card_info, card_image_url, benefit_name, work_sector1_code, 
                    work_sector2_code, benefit_code, work_sector1_name, work_sector2_name, pay_total, benefit_total)
                    
            select  c.card_id, c.card_name, c.card_info, c.card_image_url, t.benefit_name, t.work_sector1_code, t.work_sector2_code, t.benefit_code
                    , (select work_sector1_name from p_work_sector1 ws1 where ws1.work_sector1_code = t.work_sector1_code) as work_sector1_name
                    , (select work_sector2_name from p_work_sector2 ws2 where ws2.work_sector2_code = t.work_sector2_code) as work_sector2_name    
                    , pay_total, benefit_total
            from
                (select  min(benefit_name) as benefit_name, min(work_sector1_code) as work_sector1_code, min(work_sector2_code) as work_sector2_code, min(benefit_code) as benefit_code
                        , sum(pay_total) as pay_total, sum(benefit_total) as benefit_total
                from
                    -- 월별 & work_sector2_code별, pay_total & benefit_total(benefit_name 통합)
                    (select benefit_name, work_sector1_code, work_sector2_code, pay_total, trans_at, benefit_code, benefit_info,
                            -- benefit_code == '001' || '002' => % 계산
                            case    when benefit_code in ('001', '002') then
                                        case    when pay_total2 * (to_number(benefit_info) / 100) > limit then limit
                                                else pay_total2 * (to_number(benefit_info) / 100) end
                                    when benefit_code in ('004', '008') then
                                        case    when trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) > limit then limit
                                                else trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) end
                                    else 0
                            end as benefit_total, pay_total2
                    from    (select  cb.benefit_name, cb.benefit_info, cb.benefit_code, cb.benefit_criteria, cb.limit, t.work_sector1_code, t.work_Sector2_code, t.pay_total, t.trans_at
                                , (select sum(pay_total) from trans_temp where trans_at = t.trans_at 
                                    and work_sector2_code in (select work_sector2_code from p_card_benefit where card_id = card.card_id and benefit_name = cb.benefit_name)) as pay_total2 -- * (to_number(cb.benefit_info) / 100), cb.benefit_name  
                            from trans_temp t, 
                                (select * from p_card_benefit where card_id = card.card_id) cb
                            where t.work_sector2_code = cb.work_sector2_code
                            order by trans_at, benefit_name)
                    )
                group by work_sector2_code
                ) t, p_card c 
            where card_id = card.card_id
            order by benefit_total desc, benefit_name; -- 최종 work_sector2_code 로 그룹지어 주어진 기간 동안 총 합계 구함
        
        elsif p_benefit_type = 1 then -- 할인만
            insert into benefit_temp(card_id, card_name, card_info, card_image_url, benefit_name, work_sector1_code, 
                    work_sector2_code, benefit_code, work_sector1_name, work_sector2_name, pay_total, benefit_total)
                    
            select  c.card_id, c.card_name, c.card_info, c.card_image_url, t.benefit_name, t.work_sector1_code, t.work_sector2_code, t.benefit_code
                    , (select work_sector1_name from p_work_sector1 ws1 where ws1.work_sector1_code = t.work_sector1_code) as work_sector1_name
                    , (select work_sector2_name from p_work_sector2 ws2 where ws2.work_sector2_code = t.work_sector2_code) as work_sector2_name    
                    , pay_total, benefit_total
            from
                (select  min(benefit_name) as benefit_name, min(work_sector1_code) as work_sector1_code, min(work_sector2_code) as work_sector2_code, min(benefit_code) as benefit_code
                        , sum(pay_total) as pay_total, sum(benefit_total) as benefit_total
                from
                    -- 월별 & work_sector2_code별, pay_total & benefit_total(benefit_name 통합)
                    (select benefit_name, work_sector1_code, work_sector2_code, pay_total, trans_at, benefit_code, benefit_info,
                            -- benefit_code == '001' || '002' => % 계산
                            case    when benefit_code = '001' then
                                        case    when pay_total2 * (to_number(benefit_info) / 100) > limit then limit
                                                else pay_total2 * (to_number(benefit_info) / 100) end
                                    when benefit_code = '004' then
                                        case    when trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) > limit then limit
                                                else trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) end
                                    else 0
                            end as benefit_total, pay_total2
                    from    (select  cb.benefit_name, cb.benefit_info, cb.benefit_code, cb.benefit_criteria, cb.limit, t.work_sector1_code, t.work_Sector2_code, t.pay_total, t.trans_at
                                , (select sum(pay_total) from trans_temp where trans_at = t.trans_at 
                                    and work_sector2_code in (select work_sector2_code from p_card_benefit where card_id = card.card_id and benefit_name = cb.benefit_name)) as pay_total2 -- * (to_number(cb.benefit_info) / 100), cb.benefit_name  
                            from trans_temp t, 
                                (select * from p_card_benefit where card_id = card.card_id) cb
                            where t.work_sector2_code = cb.work_sector2_code
                            order by trans_at, benefit_name)
                    )
                group by work_sector2_code
                ) t, p_card c
            where card_id = card.card_id
            order by benefit_total desc, benefit_name; -- 최종 work_sector2_code 로 그룹지어 주어진 기간 동안 총 합계 구함
        
        else -- 적립만
            insert into benefit_temp(card_id, card_name, card_info, card_image_url, benefit_name, work_sector1_code, 
                    work_sector2_code, benefit_code, work_sector1_name, work_sector2_name, pay_total, benefit_total)
                    
            select  c.card_id, c.card_name, c.card_info, c.card_image_url, t.benefit_name, t.work_sector1_code, t.work_sector2_code, t.benefit_code
                    , (select work_sector1_name from p_work_sector1 ws1 where ws1.work_sector1_code = t.work_sector1_code) as work_sector1_name
                    , (select work_sector2_name from p_work_sector2 ws2 where ws2.work_sector2_code = t.work_sector2_code) as work_sector2_name    
                    , pay_total, benefit_total
            from
                (select  min(benefit_name) as benefit_name, min(work_sector1_code) as work_sector1_code, min(work_sector2_code) as work_sector2_code, min(benefit_code) as benefit_code
                        , sum(pay_total) as pay_total, sum(benefit_total) as benefit_total
                from
                    -- 월별 & work_sector2_code별, pay_total & benefit_total(benefit_name 통합)
                    (select benefit_name, work_sector1_code, work_sector2_code, pay_total, trans_at, benefit_code, benefit_info,
                            -- benefit_code == '001' || '002' => % 계산
                            case    when benefit_code = '002' then
                                        case    when pay_total2 * (to_number(benefit_info) / 100) > limit then limit
                                                else pay_total2 * (to_number(benefit_info) / 100) end
                                    when benefit_code = '008' then
                                        case    when trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) > limit then limit
                                                else trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) end
                                    else 0
                            end as benefit_total, pay_total2
                    from    (select  cb.benefit_name, cb.benefit_info, cb.benefit_code, cb.benefit_criteria, cb.limit, t.work_sector1_code, t.work_Sector2_code, t.pay_total, t.trans_at
                                , (select sum(pay_total) from trans_temp where trans_at = t.trans_at 
                                    and work_sector2_code in (select work_sector2_code from p_card_benefit where card_id = card.card_id and benefit_name = cb.benefit_name)) as pay_total2 -- * (to_number(cb.benefit_info) / 100), cb.benefit_name  
                            from trans_temp t, 
                                (select * from p_card_benefit where card_id = card.card_id) cb
                            where t.work_sector2_code = cb.work_sector2_code
                            order by trans_at, benefit_name)
                    ) 
                group by work_sector2_code
                ) t, p_card c
            where card_id = card.card_id
            order by benefit_total desc, benefit_name; -- 최종 work_sector2_code 로 그룹지어 주어진 기간 동안 총 합계 구함
        end if;
        
        
    end loop;



    -- 해당 기간 동안 소비 합계 return
    select sum(pay_total) into p_pay_total
    from trans_temp;


    -- benefit_total top 10 추리기
    OPEN p_result_cursor FOR
    select bt.*
    from benefit_temp bt
        , (select     rownum as row_no, card_id
        from    (select      card_id, sum(benefit_total) as benefit_total
                from    (select     card_id, min(nvl(benefit_total, 0)) as benefit_total
                        from        benefit_temp
                        group by    card_id, benefit_name
                        order by    card_id)
                group by card_id
                order by benefit_total desc)
        where rownum <= 10) top
    where bt.card_id = top.card_id
    order by top.row_no, bt.benefit_total, bt.benefit_name desc; -- 혜택 top10 card_id 목록


exception
    when others then
        dbms_output.put_line(sqlerrm);
        WRITE_LOG('CALCULATE_CREDIT_TOP10_BENEFIT', SUBSTR(SQLERRM,1,100));
        rollback;
end;
/
