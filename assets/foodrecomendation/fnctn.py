import pandas as pd
import numpy as np
def getfood(time,bodytype,dislist):
      j=0
      ds=pd.read_csv("finalfoodis.csv")
      foods=np.zeros((len(ds)),dtype='object')
      new_food=[]
      if(time=='breakfast'):
        time=0
      elif(time=='lunch'):
        time=1
      elif(time=='dinner'):
        time=2
      elif(time=='snack'):
            time=3
      if (dislist.count==0):
               for i in range(1,(len(ds))):
                  if ds.loc[i,'label']==bodytype and ds.loc[i,'time']==time:
                        foods[i]=str(ds.loc[i,'food'])
                        #print(ds.loc[i,'food'])
      elif(dislist.count('Diabetes')!=0):
            for i in range(len(ds)):
                  if (ds.loc[i,'label']==bodytype and ds.loc[i,'time']==time and ds.loc[i,'Diabetes']!=-1):
                          foods[i]=str(ds.loc[i,'food']) 
            
      elif(dislist.count('hypertension')!=0):
            for i in range(len(ds)):
                  if ds.loc[i,'label']==bodytype and ds.loc[i,'time']==time and ds.loc[i,'hypertension']!=-1:
                        foods[i]=str(ds.loc[i,'food'])
      elif(dislist.count('alcoholic')!=0):
            np.append(foods,(['coffee']))
            for i in range(len(ds)):
                  if ds.loc[i,'label']==bodytype and ds.loc[i,'time']==time and ds.loc[i,'fat']>25:
                        foods[i]=str(ds.loc[i,'food'])
            
            
      elif(dislist.count('smoker')):
            if(time==3):
                  np.append(foods,(['drumstick leaves spinach','radish leaves spinach','spinach','amaranthus leaves','fenugreek leaves','aghathi leaves','ponangani leaves']))  
            for i in range(len(ds)):
                  if ds.loc[i,'label']==bodytype and ds.loc[i,'time']==time:
                        foods[i]=str(ds.loc[i,'food'])        
                  
      print(len(foods))
      for i in range (0,(len(foods))):
                  if foods[i]!=0:
                       new_food.append(str(foods[i]))
                        
      return new_food



print(getfood('lunch','pitta',(['alcoholic'])))