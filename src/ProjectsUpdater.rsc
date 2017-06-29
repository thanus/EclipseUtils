module ProjectsUpdater

import IO;
import String;
import util::Resources;
import utils::IDE;

void updateProjects(set[loc] locations = projects()) {
  for (loc location <- locations) {
    updateFiles(location);
  };
}

void removeBinFromProjects(set[loc] locations = projects()) {
  for (loc location <- locations) {
    loc binProject = location + "bin";
    
    if(isDirectory(binProject)) {
      remove(binProject);
    }
    
  }
}

private void updateFiles(loc location) {
  for (l <- location.ls) {
    if (isDirectory(l)) {
      updateFiles(l);
    } else {
      touchFile(l);
    }
  }
  
  saveAll();
}

private void touchFile(loc file) {
  if (isRascalOrJavaFile(file)) {
    str content = readFile(file);
  
    writeFile(file, content);
  }
  
}

private bool isRascalOrJavaFile(loc file) = endsWith(file.file, ".java") || endsWith(file.file, ".rsc");