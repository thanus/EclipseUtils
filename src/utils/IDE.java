package utils;

import org.eclipse.swt.widgets.Display;
import org.eclipse.ui.PlatformUI;

import io.usethesource.vallang.IValueFactory;

public class IDE {

	private final IValueFactory values;

	public IDE(final IValueFactory values) {
        this.values = values;
    }

	public void saveAll() {
		Display.getDefault().syncExec(new Runnable() {
	        @Override
	        public void run() {
	        	PlatformUI.getWorkbench().saveAllEditors(false);
	        }
	    });
	}
	
}
