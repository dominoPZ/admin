package controller;

import java.io.File;

public class Files {
	
	
	 public static void fileIsLive(String isLivefile) {
		  File f1 = new File(isLivefile);
		  
		  if(f1.exists())
		  {
		   f1.delete();
		  }else
		  {
		   
		  }
		 }

}
