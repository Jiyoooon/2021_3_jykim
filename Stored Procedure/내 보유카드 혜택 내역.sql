-- �� ����ī�� ���� ��ȸ
create or replace procedure mycard_benefit
    (p_member_id in number, p_start in varchar, p_end in varchar, p_result_cursor IN OUT SYS_REFCURSOR)
is
    v_benefit_total number;
    v_pay_total_by_sector2 number;
    v_pay_total_by_benefit_name number;
    v_cur_month varchar(10);
    v_card_id number;
begin
     
    select max(card_id) into v_card_id from p_member_card where member_id = p_member_id;
    
    --p_start ~ p_end ���� ���� 2���� �Һ� �հ� ����
    insert into trans_temp(work_sector2_code, work_sector1_code, trans_at, pay_total)
     select t.work_sector2_code, t.work_sector1_code, to_char(trans_at, 'yyyy-mm') as trans_at, sum(trans_balance) as trans_balance
    from p_trans t
    where t.member_card_id = (select min(member_Card_id) from p_member_card where member_id = p_member_id)
        and to_char(trans_at, 'yyyy-mm') >= p_start and to_char(trans_at, 'yyyy-mm') <= p_end
    group by to_char(trans_at, 'yyyy-mm'), work_sector1_code, work_sector2_code
    order by work_sector2_code, trans_at;
    

--    insert into benefit_temp(card_id, card_name, card_info, card_image_url, benefit_name, work_sector1_code, 
--            work_sector2_code, benefit_code, work_sector1_name, work_sector2_name, pay_total, benefit_total)
    
    OPEN p_result_cursor FOR    
    select  c.card_id, c.card_name, c.card_info, c.card_image_url, t.benefit_name, t.work_sector1_code, t.work_sector2_code, t.benefit_code
            , (select work_sector1_name from p_work_sector1 ws1 where ws1.work_sector1_code = t.work_sector1_code) as work_sector1_name
            , (select work_sector2_name from p_work_sector2 ws2 where ws2.work_sector2_code = t.work_sector2_code) as work_sector2_name    
            , pay_total, benefit_total
    from
        (select  min(benefit_name) as benefit_name, min(work_sector1_code) as work_sector1_code, min(work_sector2_code) as work_sector2_code, min(benefit_code) as benefit_code
                , sum(pay_total) as pay_total, sum(benefit_total) as benefit_total
        from
            -- ���� & work_sector2_code��, pay_total & benefit_total(benefit_name ����)
            (select benefit_name, work_sector1_code, work_sector2_code, pay_total, trans_at, benefit_code, benefit_info,
                    -- benefit_code == '001' || '002' => % ���
                    case    when benefit_code in ('001', '002') then
                                case    when pay_total2 * (to_number(benefit_info) / 100) > limit then limit
                                        else pay_total2 * (to_number(benefit_info) / 100) end
                            when benefit_code in ('004', '008') then
                                case    when trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) > limit then limit
                                        else trunc(pay_total2 / benefit_criteria) * to_number(benefit_info) end
                    end as benefit_total, pay_total2
            from    (select  cb.benefit_name, cb.benefit_info, cb.benefit_code, cb.benefit_criteria, cb.limit, t.work_sector1_code, t.work_Sector2_code, t.pay_total, t.trans_at
                        , (select sum(pay_total) from trans_temp where trans_at = t.trans_at 
                            and work_sector2_code in (select work_sector2_code from p_card_benefit where card_id = v_card_id and benefit_name = cb.benefit_name)) as pay_total2 
                    from trans_temp t, 
                        (select * from p_card_benefit where card_id = v_card_id) cb
                    where t.work_sector2_code = cb.work_sector2_code
                    order by trans_at, benefit_name)
            )
        group by work_sector2_code
        ) t, p_card c
    where card_id = v_card_id
    order by benefit_total desc, benefit_name; -- ���� work_sector2_code �� �׷����� �־��� �Ⱓ ���� �� �հ� ����
        
    

    --OPEN p_result_cursor FOR SELECT * FROM benefit_temp order by card_id, work_sector1_code, work_sector2_code; --cursor ����
exception
    when others then
        dbms_output.put_line(sqlerrm);
        WRITE_LOG('MYCARD_BENEFIT', SUBSTR(SQLERRM,1,100));
        rollback;
end;
/

-- ���� Ʃ�� ��
-- �ŷ� ���̺� ��ȸ�� �� where���� group by �������� ���� member_card_id / to_char(trans_at, 'yyyy-mm') ������ �ε��� �ο�
-- create index trans_2 on p_trans (member_card_id, to_char(trans_at, 'yyyy-mm'));
-- global temp table �ӽ� ���̺� �����Ͽ� ���ν��� ���ο��� Ȱ�� => �˻��� �Ⱓ������ �����ڵ� �� �ŷ� ��� ������ �ӽ� ���̺� ���� �� ���ν��� ���ο��� Ȱ���� => ���� �� �ŷ� ���̺� ��ȸ�� ���� �ð� ������
-- sp��� ���� => p_log ���̺� ���� � ���ν������� � ������ �߻��ߴ��� �α� ����� ����뿡 ������ �Ǿ���