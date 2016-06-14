package jp.co.seproject;

import java.beans.PropertyEditorSupport;

public class CCPropertyEditor extends PropertyEditorSupport {

	public String getAsText() {
		CustomerData value = (CustomerData) getValue();

		if (value == null) {
			return "";
		} else {
			return "" + value.getId();
		}
	}

	public void setAsText(String value) {
		SystemDaoImpl dao = new SystemDaoImpl();
		CustomerData customerdata = (CustomerData) dao.findById(Long.parseLong(value));

		setValue(customerdata);
	}
}
