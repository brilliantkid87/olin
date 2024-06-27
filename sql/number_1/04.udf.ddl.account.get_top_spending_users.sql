CREATE OR REPLACE FUNCTION account.get_top_spending_users(params jsonb)
	RETURNS TABLE(
		user_name text, 
		total_spent numeric
	)
 	LANGUAGE plpgsql
AS $function$
DECLARE
    start_date DATE;
    total_spent_check NUMERIC;
BEGIN
    start_date := (params ->> 'start_date')::DATE;
 
    RETURN QUERY
    select  
        u.name::TEXT as user_name, SUM(oi.price * oi.quantity) as total_spent
    from
        account.users u
    left join
        account.orders o ON u.id = o.user_id
    left join  
        account.order_items oi ON o.id = oi.order_id
    where  
        o.created_at >= start_date
    group by 
        u.name
    having 
        SUM(oi.price * oi.quantity) >= 1000
    order by
        total_spent DESC;
    
    get diagnostics total_spent_check = ROW_COUNT;
    
    if total_spent_check = 0 then
        raise exception 'tidak ada user yang menghabiskan uang minimal 1000 pada transaksi atau setelah %', start_date;
    end if;
    
END;
$function$;


-- sql query
-- SELECT * FROM account.get_top_spending_users('{"start_date": "2022-01-01"}'::jsonb);