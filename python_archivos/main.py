from services_data import ProcessData
import constrainst as const

class Main:
    def __init__(self, data) -> None:
        self.data = data
        
    def process(self):
        try:
            data = ProcessData(self.data)
            data.process_data()
        except Exception as e:
          print(f'An exception occurred {e}')

if __name__ == "__main__":
    app = Main(const.data)
    app.process()    
    