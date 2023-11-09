import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Date;
import java.util.Random;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


public class Generator
{
    public static void main(String[] args)
    {
        int seed = 100;
    
        Random rand = new Random(seed);
        
        //Set calendar to start September 1, 2018
        Calendar start = new GregorianCalendar(2018,8,1);
                
        int sites = 5;
        int sensors = 3;
        int pointsPerDay = 96;
        int days = 3;
        
		// Double quotes for JSON - harder to import for CSV
		// DateFormat dateFormat = new SimpleDateFormat("'{\"Day\":'dd',\"Month\":\"'MMM'\",\"Year\":'yyyy',\"Time\":\"'HH:mm:ss'\"}'");
		
		// Single quotes for JSON - easier import for CSV if put whole element in double-quotes
		DateFormat dateFormat = new SimpleDateFormat("'{''Day'':'dd',''Month'':'''MMM''',''Year'':'yyyy',''Time'':'''HH:mm:ss'''}'");
		
        // System.out.println("timestamp, siteid, sensorid, value");

		System.out.println("siteid, sensorid, timestamp, value");
		
        for (int d=1; d <= days; d++)
        {
            for (int k=1; k <= pointsPerDay; k++)
            {
                for (int i = 1; i <= sites; i++) 
                {                
                    for (int j = 1; j <= sensors; j++) 
                    {
                        String value = "";
                        int v = rand.nextInt(100);
                        if (v <= 2)
                            value = "#ERROR#";
                        else if (v <= 4)
                            value = "#NA#";
						  else if (v <= 6)
                            value = "#INFO#";
                        else if (v <= 8)
                            value = ""+-1*rand.nextInt(100);
                        else if (v <= 10)
                            value = ""+(101+rand.nextInt(100));
                        else
                        {
                            if (j == 1)
                            {
                                if (rand.nextBoolean())
                                    value = "" + (50+j*10+rand.nextInt(10));
                                else
                                    value = "" + (50+j*10-rand.nextInt(10));                                
                            }
                            if (j == 2)
                            {   // Linear sensor value
                                int numReadings = (d-1)*pointsPerDay+k;
                                // Formula is 0.2x+5 s
                                int expectedValue = (int) (0.2*numReadings+5);
                                /*                                
                                if (rand.nextBoolean())
                                    value = "" + (expectedValue*1.05);
                                else
                                    value = "" + (expectedValue*-1.05);
                                */
                                value = ""+expectedValue;
                            }
                            else
                            {
                                value = ""+rand.nextInt(101);
                            }
                        }
                            
                        // System.out.println(start.getTime() + "," + Integer.toString(i) + "," + Integer.toString(j) + "," + value);     
						Date dt = start.getTime();
						String formattedDate = dateFormat.format(dt);
						System.out.println(Integer.toString(i) + "," + Integer.toString(j) + ",\"" + formattedDate+ "\","+ value);                    
                    }
                
                 }
                // Increment the date by 15 minutes
                start.add(Calendar.MINUTE, 15);
            }
        }
    }

}
