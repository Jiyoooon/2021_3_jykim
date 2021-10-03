-- 유저별 월간 업종별 소비 합계 저장(중간 집계 테이블)
create or replace procedure insert_trans_statistics
as
    v_year number;
    v_month char;
begin
    v_year := extract(year from (sysdate - 1));
    v_month := lpad(extract(month from (sysdate - 1)), 2, '0');

    for mem in (select member_id from p_member)
    loop
        insert into trans_statistics(member_id, work_sector2_code, year, month, pay_total)

        select mem.member_id, work_sector2_code, v_year, v_month, sum(trans_balance) as pay_total 
        from p_trans
        where member_card_id in (select member_card_id from p_member_card where member_id = mem.member_id)
            and to_char(trans_at, 'yyyy-mm') = v_year||'-'||v_month -- 지난 달 소비 집계
        group by work_sector2_code;

    end loop;
end;
/

-- 월간 인기 카드 순위 갱신
create or replace PROCEDURE insert_statistics
as
    card_top_list varchar2(100);
begin

    for job in (select common_code from p_common where common_type_id = 'JB') 
    loop
        -- 직업 코드별 카드 추천 리스트
        select listagg(card_id, ',') within group (order by rownum) into card_top_list
        from (select 1 as base, rownum, card_id
            from
                (select card_id, count(member_id) as cnt from p_member_card 
                where member_id in (select member_id from p_member where job_type_code = job.common_code)
                group by card_id
                order by cnt desc)
            where rownum <= 10);

        insert into p_card_statistics(created_at, kind, classification, card_list)
            values(sysdate, 'j', job.common_code, card_top_list);
    end loop;

    for age in 2..5 
    loop
        select listagg(card_id, ',') within group (order by rownum) into card_top_list
        from
        (select rownum, card_id
        from
            (select card_id, count(member_id) as cnt from p_member_card 
            where member_id in (select  member_id 
                                from    p_member 
                                where   trunc((extract(year from sysdate) - extract(year from birth) + 1) / 10) = age
                                        and gender = 'F')
            group by card_id
            order by cnt desc)
        where rownum <= 10);

        insert into p_card_statistics(created_at, kind, classification, card_list)
            values(sysdate, 'b', age||'F', card_top_list);


        select listagg(card_id, ',') within group (order by rownum) into card_top_list
        from
        (select rownum, card_id
        from
            (select card_id, count(member_id) as cnt from p_member_card 
            where member_id in (select  member_id 
                                from    p_member 
                                where   trunc((extract(year from sysdate) - extract(year from birth) + 1) / 10) = age
                                        and gender = 'M')
            group by card_id
            order by cnt desc)
        where rownum <= 10);

        insert into p_card_statistics(created_at, kind, classification, card_list)
            values(sysdate, 'b', age||'M', card_top_list);
    end loop;

    commit;
exception
    when others then
        dbms_output.put_line(sqlerrm);
        WRITE_LOG('INSERT_STASTISTICS', SUBSTR(SQLERRM,1,100));
        rollback;
end;
/