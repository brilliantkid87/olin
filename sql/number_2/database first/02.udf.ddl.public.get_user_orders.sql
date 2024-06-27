CREATE OR REPLACE FUNCTION public.get_user_orders()
 	RETURNS TABLE(name character varying, amount numeric, created_at timestamp without time zone)
 	LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN QUERY
    SELECT u.name, o.amount, o.created_at
    FROM users u
    JOIN orders o ON u.id = o.user_id;
END;
$function$
;

-- sql query
-- SELECT * FROM public.get_user_orders();
