import pandas as pd

class ProcessData:
    def __init__(self, data) -> None:
        self.data = data
    
    def process_data(self):
        df = pd.DataFrame(self.data)
        print(df)
        
