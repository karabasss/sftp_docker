import sys, time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

print "Listener started! Press ctrl+c to interrupt."

class Listener(FileSystemEventHandler):
  def on_created(self, event):
        self.process(event)

  def process(self, event):
        print event.src_path

path = "/opt/upload"
event_handler = FileSystemEventHandler()
observer = Observer()
observer.schedule(Listener(), path, recursive=True)
observer.start()

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()

observer.join()


