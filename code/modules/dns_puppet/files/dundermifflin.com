$TTL 15m
dundermifflin.com.  1D  IN  SOA chase.dundermifflin.com. www.dundermifflin.com. (
		2014102801 ; serial
		3H ; time-to-refresh	
		15 ; time-to-retry
		1w ; time-to-expire
 	    	1h ; minimum-TTL
)

router.dundermifflin.com.	1h	IN    A        100.64.18.1
carriage.dundermifflin.com.	1h	IN    A        100.64.18.2
platen.dundermifflin.com.	1h	IN    A        100.64.18.3
chase.dundermifflin.com.	1h	IN    A        100.64.18.4
roller.dundermifflin.com.	1h	IN    A        10.21.32.2
saddle.dundermifflin.com.	1h	IN    A        100.64.18.5

machinea.dundermifflin.com.	7d	IN	NS	router.dundermifflin.com
machineb.dundermifflin.com.	7d	IN	NS	carriage.dundermifflin.com
machinec.dundermifflin.com.	7d	IN	NS	platen.dundermifflin.com
machined.dundermifflin.com.	7d	IN	NS	chase.dundermifflin.com
machinee.dundermifflin.com.	7d	IN	NS	roller.dundermifflin.com
machinef.dundermifflin.com.	7d	IN	NS	saddle.dundermifflin.com

www.dundermifflin.com.	5m	IN	NS	carriage.dundermifflin.com
dundermifflin.com.	5m	IN	NS	carriage.dundermifflin.com
www2.dundermifflin.com.	5m	IN	NS	saddle.dundermifflin.com
ftp.dundermifflin.com.	5m	IN	NS	platen.dundermifflin.com
files.dundermifflin.com.	7d	IN	NS	roller.dundermifflin.com

