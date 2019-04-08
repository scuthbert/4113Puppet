$TTL 15m
dundermifflin.com.  1D  IN  SOA chase.dundermifflin.com. www.dundermifflin.com. (
		2014102801 ; serial
		3H ; time-to-refresh	
		15 ; time-to-retry
		1w ; time-to-expire
 	    	1h ; minimum-TTL
)
dundermifflin.com.	1h	IN    NS       www.dundermifflin.com.
chase.dundermifflin.com.	1h	IN    A        100.64.18.4
www.dundermifflin.com.	1h	IN	A	100.64.18.2
